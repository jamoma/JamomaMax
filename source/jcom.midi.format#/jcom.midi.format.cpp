/* 
 *	midi.format#
 *	External object for Max wrapping a class for the Jamoma Graph
 *	Copyright © 2011 by Timothy Place
 * 
 * License: This code is licensed under the terms of the "New BSD License"
 * http://creativecommons.org/licenses/BSD/
 */

#include "maxGraph.h"


// Data Structure for this object
struct MidiFormat {
   	Object				obj;
	TTGraphObjectPtr	graphObject;
	TTPtr				graphOutlets[16];	// this _must_ be third (for the setup call)
};
typedef MidiFormat* MidiFormatPtr;


// Prototypes for methods
MidiFormatPtr	MidiFormatNew		(SymbolPtr msg, AtomCount argc, AtomPtr argv);
void			MidiFormatFree		(MidiFormatPtr self);
void			MidiFormatAssist	(MidiFormatPtr self, void* b, long msg, long arg, char* dst);


// Globals
static ClassPtr sMidiFormatClass;


/************************************************************************************/
// Main() Function

int TTGRAPH_EXTERNAL_EXPORT main(void)
{
	ClassPtr c;
	
	TTGraphInit();	
	common_symbols_init();
	
	c = class_new("jcom.midi.format#", (method)MidiFormatNew, (method)MidiFormatFree, sizeof(MidiFormat), (method)0L, A_GIMME, 0);
	
	class_addmethod(c, (method)MaxGraphReset,		"graph.reset",		A_CANT, 0);
	class_addmethod(c, (method)MaxGraphSetup,		"graph.setup",		A_CANT, 0);
	class_addmethod(c, (method)MaxGraphConnect,		"graph.connect",	A_OBJ, A_LONG, 0);
	class_addmethod(c, (method)MaxGraphDrop,		"graph.drop",		A_CANT, 0);
 	class_addmethod(c, (method)MaxGraphObject,		"graph.object",		A_CANT, 0);

	class_addmethod(c, (method)MidiFormatAssist,	"assist",			A_CANT, 0); 
    class_addmethod(c, (method)object_obex_dumpout,	"dumpout",			A_CANT, 0);  
	
	class_register(_sym_box, c);
	sMidiFormatClass = c;
	return 0;
}


/************************************************************************************/
// Object Creation Method

MidiFormatPtr MidiFormatNew(SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
    MidiFormatPtr	self;
	TTValue		v;
	TTErr		err;
	
    self = MidiFormatPtr(object_alloc(sMidiFormatClass));
    if (self) {
    	object_obex_store((void*)self, _sym_dumpout, (ObjectPtr)outlet_new(self, NULL));	// dumpout	
		self->graphOutlets[0] = outlet_new(self, "graph.connect");
		
		v.setSize(2);
		v.set(0, TT("midi.format"));
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
void MidiFormatFree(MidiFormatPtr self)
{
	TTObjectBaseRelease((TTObjectBasePtr*)&self->graphObject);
}


/************************************************************************************/
// Methods bound to input/inlets

// Method for Assistance Messages
void MidiFormatAssist(MidiFormatPtr self, void* b, long msg, long arg, char* dst)
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
