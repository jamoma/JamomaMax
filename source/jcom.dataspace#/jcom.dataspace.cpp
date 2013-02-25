/* 
 *	dataspace#
 *	convert values from one kind of unit to another kind of unit
 *	Copyright © 2011 by Timothy Place
 * 
 * License: This code is licensed under the terms of the "New BSD License"
 * http://creativecommons.org/licenses/BSD/
 */

#include "maxGraph.h"


// Data Structure for this object
struct Dataspace {
   	Object				obj;
	TTGraphObjectPtr	graphObject;
	TTPtr				graphOutlets[16];	// this _must_ be third (for the setup call)
	SymbolPtr			attrDataspace;
	SymbolPtr			attrInput;
	SymbolPtr			attrOutput;
};
typedef Dataspace* DataspacePtr;


// Prototypes for methods
DataspacePtr	DataspaceNew			(SymbolPtr msg, AtomCount argc, AtomPtr argv);
void			DataspaceFree			(DataspacePtr self);
void			DataspaceAssist			(DataspacePtr self, void* b, long msg, long arg, char* dst);
MaxErr			DataspaceSetDataspace	(DataspacePtr self, void* attr, AtomCount argc, AtomPtr argv);
MaxErr			DataspaceSetInput		(DataspacePtr self, void* attr, AtomCount argc, AtomPtr argv);
MaxErr			DataspaceGetInput		(DataspacePtr self, void* attr, AtomCount* argc, AtomPtr* argv);
MaxErr			DataspaceSetOutput		(DataspacePtr self, void* attr, AtomCount argc, AtomPtr argv);
MaxErr			DataspaceGetOutput		(DataspacePtr self, void* attr, AtomCount* argc, AtomPtr* argv);


// Globals
static ClassPtr sDataspaceClass;


/************************************************************************************/
// Main() Function

int TTGRAPH_EXTERNAL_EXPORT main(void)
{
	ClassPtr c;
	
	TTGraphInit();	
	common_symbols_init();
	
	c = class_new("jcom.dataspace#", (method)DataspaceNew, (method)DataspaceFree, sizeof(Dataspace), (method)0L, A_GIMME, 0);
	
	class_addmethod(c, (method)MaxGraphReset,		"graph.reset",		A_CANT, 0);
	class_addmethod(c, (method)MaxGraphSetup,		"graph.setup",		A_CANT, 0);
	class_addmethod(c, (method)MaxGraphConnect,		"graph.connect",	A_OBJ, A_LONG, 0);
	class_addmethod(c, (method)MaxGraphDrop,		"graph.drop",		A_CANT, 0);
 	class_addmethod(c, (method)MaxGraphObject,		"graph.object",		A_CANT, 0);

	class_addmethod(c, (method)DataspaceAssist,		"assist",			A_CANT, 0); 
    class_addmethod(c, (method)object_obex_dumpout,	"dumpout",			A_CANT, 0);  
	
	CLASS_ATTR_SYM(c,		"dataspace",	0,		Dataspace,	attrDataspace);
	CLASS_ATTR_ACCESSORS(c,	"dataspace",	NULL,	DataspaceSetDataspace);
	
	CLASS_ATTR_SYM(c,		"input",		0,		Dataspace,	attrInput);
	CLASS_ATTR_ACCESSORS(c,	"input",		DataspaceGetInput,	DataspaceSetInput);
	
	CLASS_ATTR_SYM(c,		"output",		0,		Dataspace,	attrOutput);
	CLASS_ATTR_ACCESSORS(c,	"output",		DataspaceGetInput,	DataspaceSetOutput);
	
	class_register(_sym_box, c);
	sDataspaceClass = c;
	return 0;
}


/************************************************************************************/
// Object Creation Method

DataspacePtr DataspaceNew(SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
    DataspacePtr	self;
	TTValue			v;
	TTErr			err;
	
    self = DataspacePtr(object_alloc(sDataspaceClass));
    if (self) {
    	object_obex_store((void*)self, _sym_dumpout, (ObjectPtr)outlet_new(self, NULL));	// dumpout	
		self->graphOutlets[0] = outlet_new(self, "graph.connect");
		self->attrDataspace = _sym_none;
		
		v.setSize(2);
		v.set(0, TT("dataspace"));
		v.set(1, TTUInt32(1));
		err = TTObjectBaseInstantiate(TT("graph.object"), (TTObjectBasePtr*)&self->graphObject, v);		

		if (!self->graphObject->mKernel) {
			object_error(SELF, "cannot load Jamoma object");
			return NULL;
		}
		
		attr_args_process(self, argc, argv);
	}
	return self;
}


// Memory Deallocation
void DataspaceFree(DataspacePtr self)
{
	TTObjectBaseRelease((TTObjectBasePtr*)&self->graphObject);
}


/************************************************************************************/
// Methods bound to input/inlets

// Method for Assistance Messages
void DataspaceAssist(DataspacePtr self, void* b, long msg, long arg, char* dst)
{
	if (msg==1)			// Inlets
		strcpy (dst, "dictionary input and control messages");		
	else if (msg==2){	// Outlets
		if (arg == 0)
			strcpy(dst, "dictionary output");
		else
			strcpy(dst, "dumpout");
	}
}


// ATTRIBUTE SETTERS

MaxErr DataspaceSetDataspace(DataspacePtr self, void* attr, AtomCount argc, AtomPtr argv)
{
	if (argc) {
		self->attrDataspace = atom_getsym(argv);
		self->graphObject->mKernel->setAttributeValue(TT("dataspace"), TT(self->attrDataspace->s_name));
	}
	return MAX_ERR_NONE;
}


MaxErr DataspaceSetInput(DataspacePtr self, void* attr, AtomCount argc, AtomPtr argv)
{
	if (argc) {
		self->attrInput = atom_getsym(argv);
		self->graphObject->mKernel->setAttributeValue(TT("inputUnit"), TT(self->attrInput->s_name));
	}
	return MAX_ERR_NONE;
}


MaxErr DataspaceGetInput(DataspacePtr self, void* attr, AtomCount* argc, AtomPtr* argv)
{
	TTValue		v;
	TTSymbol	s;
	
	if (*argc && *argv) {
		self->graphObject->mKernel->getAttributeValue(TT("inputUnit"), v);
		v.get(0, s);
		atom_setsym(*argv, gensym(s.c_str()));
	}
	return MAX_ERR_NONE;
}


MaxErr DataspaceSetOutput(DataspacePtr self, void* attr, AtomCount argc, AtomPtr argv)
{
	if (argc) {
		self->attrOutput = atom_getsym(argv);
		self->graphObject->mKernel->setAttributeValue(TT("outputUnit"), TT(self->attrOutput->s_name));
	}
	return MAX_ERR_NONE;
}


MaxErr DataspaceGetOutput(DataspacePtr self, void* attr, AtomCount* argc, AtomPtr* argv)
{
	TTValue		v;
	TTSymbol	s;
	
	if (*argc && *argv) {
		self->graphObject->mKernel->getAttributeValue(TT("outputUnit"), v);
		v.get(0, s);
		atom_setsym(*argv, gensym(s.c_str()));
	}
	return MAX_ERR_NONE;
}

