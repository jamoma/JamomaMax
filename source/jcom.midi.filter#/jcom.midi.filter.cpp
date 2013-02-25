/* 
 *	midi.filter#
 *	External object for Max to append keys to a dictionary being passed in a Jamoma Graph
 *	Copyright © 2010 by Timothy Place
 * 
 * License: This code is licensed under the terms of the "New BSD License"
 * http://creativecommons.org/licenses/BSD/
 */

#include "maxGraph.h"


// Data Structure for this object
struct MidiFilter {
   	Object				obj;
	TTGraphObjectPtr	graphObject;
	TTPtr				graphOutlets[16];	// this _must_ be third (for the setup call)
	SymbolPtr			attrType;
};
typedef MidiFilter* MidiFilterPtr;


// Prototypes for methods
MidiFilterPtr	MidiFilterNew		(SymbolPtr msg, AtomCount argc, AtomPtr argv);
void			MidiFilterFree		(MidiFilterPtr self);
void			MidiFilterAssist	(MidiFilterPtr self, void* b, long msg, long arg, char* dst);
MaxErr			MidiFilterSetType	(MidiFilterPtr self, void* attr, AtomCount argc, AtomPtr argv);


// Globals
static ClassPtr sMidiFilterClass;


/************************************************************************************/
// Main() Function

int TTGRAPH_EXTERNAL_EXPORT main(void)
{
	ClassPtr c;
	
	TTGraphInit();	
	common_symbols_init();
	
	c = class_new("jcom.midi.filter#", (method)MidiFilterNew, (method)MidiFilterFree, sizeof(MidiFilter), (method)0L, A_GIMME, 0);
	
	class_addmethod(c, (method)MaxGraphReset,		"graph.reset",		A_CANT, 0);
	class_addmethod(c, (method)MaxGraphSetup,		"graph.setup",		A_CANT, 0);
	class_addmethod(c, (method)MaxGraphConnect,		"graph.connect",	A_OBJ, A_LONG, 0);
	class_addmethod(c, (method)MaxGraphDrop,		"graph.drop",		A_CANT, 0);
 	class_addmethod(c, (method)MaxGraphObject,		"graph.object",		A_CANT, 0);

	class_addmethod(c, (method)MidiFilterAssist,	"assist",			A_CANT, 0); 
    class_addmethod(c, (method)object_obex_dumpout,	"dumpout",			A_CANT, 0);  
	
	CLASS_ATTR_SYM(c,		"type",		0,		MidiFilter,	attrType);
	CLASS_ATTR_ACCESSORS(c,	"type",		NULL,	MidiFilterSetType);
		
	class_register(_sym_box, c);
	sMidiFilterClass = c;
	return 0;
}


/************************************************************************************/
// Object Creation Method

MidiFilterPtr MidiFilterNew(SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
    MidiFilterPtr	self;
	TTValue		v;
	TTErr		err;
	
    self = MidiFilterPtr(object_alloc(sMidiFilterClass));
    if (self) {
    	object_obex_store((void*)self, _sym_dumpout, (ObjectPtr)outlet_new(self, NULL));	// dumpout	
		self->graphOutlets[0] = outlet_new(self, "graph.connect");
		
		v.setSize(2);
		v.set(0, TT("midi.filter"));
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
void MidiFilterFree(MidiFilterPtr self)
{
	TTObjectBaseRelease((TTObjectBasePtr*)&self->graphObject);
}


/************************************************************************************/
// Methods bound to input/inlets

// Method for Assistance Messages
void MidiFilterAssist(MidiFilterPtr self, void* b, long msg, long arg, char* dst)
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

MaxErr MidiFilterSetType(MidiFilterPtr self, void* attr, AtomCount argc, AtomPtr argv)
{
	if (argc) {
		self->attrType = atom_getsym(argv);
		self->graphObject->mKernel->setAttributeValue(TT("type"), TT(self->attrType->s_name));
	}
	return MAX_ERR_NONE;
}

