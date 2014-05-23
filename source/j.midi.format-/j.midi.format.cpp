/** @file
 * 
 * @ingroup implementationMaxExternalsGraph
 *
 * @brief j.midi.format# - Format MIDI message as dictionary being passed in a Jamoma Graph
 *
 * @details
 *
 * @authors Tim Place, Trond Lossius
 *
 * @copyright Copyright © 2010 by Timothy Place @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */


#include "maxGraph.h"


// Data Structure for this object
struct MidiFormat {
   	Object				    obj;
	TTGraphObjectBasePtr	graphObject;
	TTPtr				    graphOutlets[16];	// this _must_ be third (for the setup call)
};
typedef MidiFormat* MidiFormatPtr;


// Prototypes for methods
MidiFormatPtr	MidiFormatNew		(t_symbol* msg, long argc, t_atom* argv);
void			MidiFormatFree		(MidiFormatPtr self);
void			MidiFormatAssist	(MidiFormatPtr self, void* b, long msg, long arg, char* dst);


// Globals
static t_class* sMidiFormatClass;


/************************************************************************************/
// Main() Function

int C74_EXPORT main(void)
{
	t_class* c;
	
	TTGraphInit();	
	common_symbols_init();
	
	c = class_new("j.midi.format-", (method)MidiFormatNew, (method)MidiFormatFree, sizeof(MidiFormat), (method)0L, A_GIMME, 0);
	
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

MidiFormatPtr MidiFormatNew(t_symbol* msg, long argc, t_atom* argv)
{
    MidiFormatPtr	self;
	TTValue		v;
	TTErr		err;
	
    self = MidiFormatPtr(object_alloc(sMidiFormatClass));
    if (self) {
    	object_obex_store((void*)self, _sym_dumpout, (t_object*)outlet_new(self, NULL));	// dumpout	
		self->graphOutlets[0] = outlet_new(self, "graph.connect");
		
		v.resize(2);
		v[0] = "midi.format";
		v[1] = 1;
		err = TTObjectBaseInstantiate(TT("graph.object"), (TTObjectBasePtr*)&self->graphObject, v);

		if (!self->graphObject->mKernel.valid()) {
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
	else if (msg==2) {	// Outlets
		if (arg == 0)
			strcpy(dst, "dictionary output");
		else
			strcpy(dst, "dumpout");
	}
}
