/* 
 * jcom.dataspace
 * External for Jamoma: map input to output: y=f(x)
 * Copyright © 2007
 * 
 * License: This code is licensed under the terms of the "New BSD License"
 * http://creativecommons.org/licenses/BSD/
 */

#include "TTClassWrapperMax.h"


// Data Structure for this object
typedef struct _dataspace{
	Object			ob;
	TTPtr			outlet_native;
	TTObjectBasePtr	dataspace;
	SymbolPtr		attr_dataspace;			// name of the dataspace -- e.g. "temperature"
	SymbolPtr		attr_dataspace_active;	// name of the current unit within the dataspace -- e.g. "celsius"
	SymbolPtr		attr_dataspace_native;	// name of the desired native unit within the dataspace -- e.g. "celsius"
} t_dataspace;


// Prototypes for methods
void*		dataspace_new(t_symbol *name, long argc, t_atom *argv);
void		dataspace_free(t_dataspace *self);
void		dataspace_assist(t_dataspace *self, void *b, long m, long a, char *s);
void		dataspace_int(t_dataspace *self, long x);
void		dataspace_float(t_dataspace *self, double x);
void		dataspace_list(t_dataspace *self, t_symbol *msg, long argc, t_atom *argv);
void		dataspace_getDataspaces(t_dataspace *self);
void		dataspace_getUnits(t_dataspace *self);
t_max_err	dataspace_setDataspace(t_dataspace *self, void *attr, long argc, t_atom *argv);
t_max_err	dataspace_setDataspaceActive(t_dataspace *self, void *attr, long argc, t_atom *argv);
t_max_err	dataspace_setDataspaceNative(t_dataspace *self, void *attr, long argc, t_atom *argv);


// Globals
static ClassPtr dataspace_class;


#pragma mark -
#pragma mark main
/************************************************************************************/
// Main() Function

int TTCLASSWRAPPERMAX_EXPORT main(void)
{
	ClassPtr c;
	
	TTFoundationInit();
	common_symbols_init();
	
	// Define our class
	c = class_new("jcom.dataspace",(method)dataspace_new, (method)dataspace_free, sizeof(t_dataspace), (method)0L, A_GIMME, 0);
	
	// Make methods accessible for our class:
	class_addmethod(c, (method)dataspace_int,			"int",				A_GIMME, 0);
	class_addmethod(c, (method)dataspace_float,			"float",			A_GIMME, 0);
	class_addmethod(c, (method)dataspace_list,			"list",				A_GIMME, 0);
	class_addmethod(c, (method)dataspace_getDataspaces,	"dataspaces.get",	0);
 	class_addmethod(c, (method)dataspace_getUnits,		"units.get",		A_GIMME, 0);
	class_addmethod(c, (method)dataspace_assist,		"assist",			A_CANT, 0); 
    class_addmethod(c, (method)object_obex_dumpout, 	"dumpout",			A_CANT, 0);
	
	class_addattr(c, 
				  attr_offset_new("dataspace", _sym_symbol, 0,
								  (method)0, (method)dataspace_setDataspace, calcoffset(t_dataspace, attr_dataspace)));

	CLASS_ATTR_SYM(c,		"input",	0,		t_dataspace,	attr_dataspace_active);
	CLASS_ATTR_ACCESSORS(c,	"input",	NULL,	dataspace_setDataspaceActive);
	
	CLASS_ATTR_SYM(c,		"output",	0,		t_dataspace,	attr_dataspace_native);
	CLASS_ATTR_ACCESSORS(c,	"output",	NULL,	dataspace_setDataspaceNative);
	
	// Finalize our class
	class_register(CLASS_BOX, c);
	dataspace_class = c;
	return 0;
}


#pragma mark -
#pragma mark life cycle
/************************************************************************************/
// Object Life

void *dataspace_new(t_symbol *name, long argc, t_atom *argv)
{
	t_dataspace *self;
	
	self = (t_dataspace *)object_alloc(dataspace_class);
	if (self) {
		object_obex_store((void*)self, _sym_dumpout, (object*)outlet_new(self, NULL));

        // Make sure that environment sample rate is set correctly at instantiated,
        // as it is used by time dataspace for conversions to and from sample
        TTValue		sr(sys_getsr());
        ttEnvironment->setAttributeValue(kTTSym_sampleRate, sr);
        
        self->outlet_native = outlet_new(self, 0);
		TTObjectBaseInstantiate(TT("dataspace"), &self->dataspace, kTTValNONE);
		
		attr_args_process(self, argc, argv);
		if (!self->dataspace)
			object_attr_setsym(self, gensym("dataspace"), gensym("temperature"));
	}
	return self;
}


void dataspace_free(t_dataspace *self)
{
	TTObjectBaseRelease(&self->dataspace);
}



#pragma mark -
#pragma mark methods
/************************************************************************************/
// Methods bound to input/inlets

// Method for Assistance Messages
void dataspace_assist(t_dataspace *self, void *b, long msg, long arg, char *dst)
{
	if (msg==1) 							// Inlets
		strcpy(dst, "x");
	else if (msg==2) { 					// Outlets
		switch(arg) {
			case 0: strcpy(dst, "y=f(x)"); break;
			default: strcpy(dst, "dumpout"); break;
 		}
 	}
}


void dataspace_int(t_dataspace *self, long x)
{
	dataspace_float(self, (double)x);
}


void dataspace_float(t_dataspace *self, double x)
{
	TTValue	v(x);
	
	self->dataspace->sendMessage(TT("convert"), v, v);	
	outlet_float(self->outlet_native, v.getFloat64(0));	
}


void dataspace_list(t_dataspace *self, t_symbol *msg, long argc, t_atom *argv)
{   
	TTValue v;
	
	v.setSize(argc);
	for (int i=0; i<argc; i++)
		v.set(i, atom_getfloat(argv+i));
	
	//TODO: add dataspace support for lists of single dimensional data conversion #42
	self->dataspace->sendMessage(TT("convert"), v, v);
	
	argc = v.getSize(); // in case the output list is longer than the input list (e.g. quaternions)
	AtomPtr rv = new Atom[argc];
	
	for (int i=0; i<argc; i++)
		atom_setfloat(rv+i, v.getFloat64(i));
	
	outlet_anything(self->outlet_native, _sym_list, argc, rv);
}


void dataspace_getDataspaces(t_dataspace *self)
{
	Atom	a[2];
	TTValue	v;
	
	atom_setsym(a+0, gensym("clear"));
	object_obex_dumpout(self, gensym("DataspacesMenu"), 1, a);
	
	self->dataspace->sendMessage(TT("getAvailableDataspaces"), v, v);	
	for (int i=0; i < v.getSize(); i++) {
		TTSymbol	name;
		
		v.get(i, name);
		atom_setsym(a+0, gensym("append"));
		atom_setsym(a+1, gensym(name.c_str()));
		object_obex_dumpout(self, gensym("DataspacesMenu"), 2, a);
	}
}


void dataspace_getUnits(t_dataspace *self)
{
	Atom	a[2];
	TTValue	v;
	
	atom_setsym(a+0, gensym("clear"));
	object_obex_dumpout(self, gensym("UnitMenu"), 1, a);
	
	self->dataspace->sendMessage(TT("getAvailableUnits"), v, v);	
	for (int i=0; i < v.getSize(); i++) {
		TTSymbol	name;
		
		v.get(i, name);
		atom_setsym(a+0, gensym("append"));
		atom_setsym(a+1, gensym(name.c_str()));
		object_obex_dumpout(self, gensym("UnitMenu"), 2, a);
	}
}



#pragma mark -
#pragma mark attributes

t_max_err dataspace_setDataspace(t_dataspace *self, void *attr, long argc, t_atom *argv)
{
	TTValue		v;
	TTSymbol	s;
	
	self->attr_dataspace = atom_getsym(argv);
	self->dataspace->setAttributeValue(TT("dataspace"), TT(self->attr_dataspace->s_name));

	self->dataspace->getAttributeValue(TT("inputUnit"), v);
	v.get(0, s);
	self->attr_dataspace_active = gensym(s.c_str());
	
	self->dataspace->getAttributeValue(TT("outputUnit"), v);
	v.get(0, s);
	self->attr_dataspace_native = gensym(s.c_str());

	return MAX_ERR_NONE;
}


t_max_err dataspace_setDataspaceActive(t_dataspace *self, void *attr, long argc, t_atom *argv)
{
	self->attr_dataspace_active = atom_getsym(argv);
	self->dataspace->setAttributeValue(TT("inputUnit"), TT(self->attr_dataspace_active->s_name));
	return MAX_ERR_NONE;
}


t_max_err dataspace_setDataspaceNative(t_dataspace *self, void *attr, long argc, t_atom *argv)
{
	self->attr_dataspace_native = atom_getsym(argv);
	self->dataspace->setAttributeValue(TT("outputUnit"), TT(self->attr_dataspace_native->s_name));
	return MAX_ERR_NONE;
}

