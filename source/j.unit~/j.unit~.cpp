/** @file
 * 
 * @ingroup implementationMaxExternals
 *
 * @brief j.unit - Max external that converts values from one kind of unit to another kind of unit
 *
 * @details The convertions make use of the DataspaceLib
 *
 * @authors Tim Place, Trond Lossius
 *
 * @copyright Copyright © 2007 Tim Place, Trond Lossius @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */


#include "TTClassWrapperMax.h"


// Data Structure for this object
typedef struct _unit {
	t_pxobject		ob;
	TTPtr			outlet;
	TTObjectBasePtr	dataspace;
	t_symbol*		attr_dataspace;			// name of the dataspace -- e.g. "temperature"
	t_symbol*		attr_unit_active;	// name of the current unit within the dataspace -- e.g. "celsius"
	t_symbol*		attr_unit_native;	// name of the desired native unit within the dataspace -- e.g. "celsius"
} t_unit;


// Prototypes for methods
void*		unit_new(t_symbol *name, long argc, t_atom *argv);
void		unit_free(t_unit *self);
void		unit_assist(t_unit *self, void *b, long m, long a, char *s);
void		unit_getDataspaces(t_unit *self);
void		unit_getUnits(t_unit *self);
void		unit_perform64(t_unit *self, t_object *dsp64, double **ins, long numins, double **outs, long numouts, long sampleframes, long flags, void *userparam);
void		unit_dsp64(t_unit *self, t_object *dsp64, short *count, double samplerate, long maxvectorsize, long flags);
t_max_err	unit_setDataspace(t_unit *self, void *attr, long argc, t_atom *argv);
t_max_err	unit_setDataspaceActive(t_unit *self, void *attr, long argc, t_atom *argv);
t_max_err	unit_setDataspaceNative(t_unit *self, void *attr, long argc, t_atom *argv);


// Globals
static t_class*	unit_class;
static TTSymbol	kTTSym_convert("convert");


#pragma mark -
#pragma mark main
/************************************************************************************/
// Main() Function

int C74_EXPORT main(void)
{
	t_class* c;
	
	TTFoundationInit();
	common_symbols_init();
	
	// Define our class
	c = class_new("j.unit~",(method)unit_new, (method)unit_free, sizeof(t_unit), (method)0L, A_GIMME, 0);
	
	// Make methods accessible for our class:
	class_addmethod(c, (method)unit_getDataspaces,	"dataspaces.get",	0);
 	class_addmethod(c, (method)unit_getUnits,		"units.get",		A_GIMME, 0);
	class_addmethod(c, (method)unit_assist,			"assist",			A_CANT, 0);
    class_addmethod(c, (method)object_obex_dumpout, "dumpout",			A_CANT, 0);
	class_addmethod(c, (method)unit_dsp64,			"dsp64",			A_CANT, 0);
	class_addmethod(c, (method)jamoma_fileusage, "fileusage", A_CANT, 0);
	
	class_addattr(c, attr_offset_new("dataspace", _sym_symbol, 0, (method)0, (method)unit_setDataspace, calcoffset(t_unit, attr_dataspace)));

	CLASS_ATTR_SYM(c,		"input",	0,		t_unit,	attr_unit_active);
	CLASS_ATTR_ACCESSORS(c,	"input",	NULL,	unit_setDataspaceActive);
	
	CLASS_ATTR_SYM(c,		"output",	0,		t_unit,	attr_unit_native);
	CLASS_ATTR_ACCESSORS(c,	"output",	NULL,	unit_setDataspaceNative);
	
	// Finalize our class
	class_dspinit(c);
	class_register(CLASS_BOX, c);
	unit_class = c;
	return 0;
}


#pragma mark -
#pragma mark life cycle
/************************************************************************************/
// Object Life

void *unit_new(t_symbol *name, long argc, t_atom *argv)
{
	t_unit *self;
	TTValue		none;
	
	self = (t_unit *)object_alloc(unit_class);
	if (self) {
		object_obex_store((void*)self, _sym_dumpout, (object*)outlet_new(self, NULL));

        // Make sure that environment sample rate is set correctly at instantiated,
        // as it is used by time dataspace for conversions to and from sample
        TTValue		sr(sys_getsr());
        ttEnvironment->setAttributeValue(kTTSym_sampleRate, sr);
		
		dsp_setup((t_pxobject*)self, 1);
		
        self->outlet = outlet_new(self, "signal");
		TTObjectBaseInstantiate(TT("dataspace"), &self->dataspace, none);
		
		attr_args_process(self, argc, argv);
		if (!self->dataspace)
			object_attr_setsym(self, gensym("dataspace"), gensym("temperature"));
	}
	return self;
}


void unit_free(t_unit *self)
{
	TTObjectBaseRelease(&self->dataspace);
}



#pragma mark -
#pragma mark methods
/************************************************************************************/
// Methods bound to input/inlets

// Method for Assistance Messages
void unit_assist(t_unit *self, void *b, long msg, long arg, char *dst)
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

/*
void unit_int(t_unit *self, long x)
{
	unit_float(self, (double)x);
}


void unit_float(t_unit *self, double x)
{
	TTValue	v(x);
	
	self->dataspace->sendMessage(TT("convert"), v, v);	
	outlet_float(self->outlet_native, v.getFloat64(0));	
}


void unit_list(t_unit *self, t_symbol *msg, long argc, t_atom *argv)
{   
	TTValue v;
	
	v.resize(argc);
	for (int i=0; i<argc; i++)
		v.set(i, atom_getfloat(argv+i));
	
	//TODO: add dataspace support for lists of single dimensional data conversion #42
	self->dataspace->sendMessage(TT("convert"), v, v);
	
	argc = v.getSize(); // in case the output list is longer than the input list (e.g. quaternions)
	t_atom* rv = new t_atom[argc];
	
	for (int i=0; i<argc; i++)
		atom_setfloat(rv+i, v.getFloat64(i));
	
	outlet_anything(self->outlet_native, _sym_list, argc, rv);
}
*/


void unit_getDataspaces(t_unit *self)
{
	t_atom	a[2];
	TTValue	v;
	
	atom_setsym(a+0, gensym("clear"));
	object_obex_dumpout(self, gensym("DataspacesMenu"), 1, a);
	
	self->dataspace->sendMessage(TT("getAvailableDataspaces"), v, v);	
	for (TTUInt32 i=0; i < v.size(); i++) {
		TTSymbol name = v[i];
		
		atom_setsym(a+0, gensym("append"));
		atom_setsym(a+1, gensym(name.c_str()));
		object_obex_dumpout(self, gensym("DataspacesMenu"), 2, a);
	}
}


void unit_getUnits(t_unit *self)
{
	t_atom	a[2];
	TTValue	v;
	
	atom_setsym(a+0, gensym("clear"));
	object_obex_dumpout(self, gensym("UnitMenu"), 1, a);
	
	self->dataspace->sendMessage(TT("getAvailableUnits"), v, v);	
	for (TTUInt32 i=0; i < v.size(); i++) {
		TTSymbol name = v[i];
		
		atom_setsym(a+0, gensym("append"));
		atom_setsym(a+1, gensym(name.c_str()));
		object_obex_dumpout(self, gensym("UnitMenu"), 2, a);
	}
}


void unit_perform64(t_unit *self, t_object *dsp64, double **ins, long numins, double **outs, long numouts, long sampleframes, long flags, void *userparam)
{
	double *in = ins[0];
	double *out = outs[0];
	TTValue v;

	while (sampleframes--){
		v = *in++;
		self->dataspace->sendMessage(kTTSym_convert, v, v);
		*out++ = v;
	}
}


void unit_dsp64(t_unit *self, t_object *dsp64, short *count, double samplerate, long maxvectorsize, long flags)
{
	object_method(dsp64, gensym("dsp_add64"), (t_object*)self, unit_perform64, 0, NULL);
}


#pragma mark -
#pragma mark attributes

t_max_err unit_setDataspace(t_unit *self, void *attr, long argc, t_atom *argv)
{
	TTValue		v;
	TTSymbol	s;
	
	self->attr_dataspace = atom_getsym(argv);
	self->dataspace->setAttributeValue(TT("dataspace"), TT(self->attr_dataspace->s_name));

	self->dataspace->getAttributeValue(TT("inputUnit"), v);
	s = v[0];
	self->attr_unit_active = gensym(s.c_str());
	
	self->dataspace->getAttributeValue(TT("outputUnit"), v);
	s = v[0];
	self->attr_unit_native = gensym(s.c_str());

	return MAX_ERR_NONE;
}


t_max_err unit_setDataspaceActive(t_unit *self, void *attr, long argc, t_atom *argv)
{
	self->attr_unit_active = atom_getsym(argv);
	self->dataspace->setAttributeValue(TT("inputUnit"), TT(self->attr_unit_active->s_name));
	return MAX_ERR_NONE;
}


t_max_err unit_setDataspaceNative(t_unit *self, void *attr, long argc, t_atom *argv)
{
	self->attr_unit_native = atom_getsym(argv);
	self->dataspace->setAttributeValue(TT("outputUnit"), TT(self->attr_unit_native->s_name));
	return MAX_ERR_NONE;
}

