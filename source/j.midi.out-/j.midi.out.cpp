/** @file
 * 
 * @ingroup implementationMaxExternalsGraph
 *
 * @brief j.midi.out# - Jamoma Graph external object for Max
 *
 * @details
 *
 * @authors Tim Place, Trond Lossius
 *
 * @copyright Copyright © 2011 by Timothy Place @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */


#include "maxGraph.h"


// Data Structure for this object
struct MidiOut {
   	t_object				    obj;
	TTGraphObjectBasePtr	graphObject;
	TTPtr				    graphOutlets[16];	// this _must_ be third (for the setup call)
	t_symbol*			    attrKey;
    t_symbol*			    attrValue;
};
typedef MidiOut* MidiOutPtr;


// Prototypes for methods
MidiOutPtr	MidiOutNew				(t_symbol* msg, long argc, t_atom* argv);
void		MidiOutFree				(MidiOutPtr self);
void		MidiOutAssist			(MidiOutPtr self, void* b, long msg, long arg, char* dst);
void		MidiOutGetDeviceNames	(MidiOutPtr self);
t_max_err		MidiOutSetDevice		(MidiOutPtr self, void* attr, long argc, t_atom* argv);
t_max_err		MidiOutGetDevice		(MidiOutPtr self, void* attr, long* argc, t_atom** argv);


// Globals
static t_class* sMidiOutClass;


/************************************************************************************/
// Main() Function

int TTGRAPH_EXTERNAL_EXPORT main(void)
{
	t_class* c;
	
	TTGraphInit();	
	common_symbols_init();
	
	c = class_new("j.midi.out-", (method)MidiOutNew, (method)MidiOutFree, sizeof(MidiOut), (method)0L, A_GIMME, 0);
	
	class_addmethod(c, (method)MidiOutGetDeviceNames,	"getAvailableDeviceNames",	0);
	class_addmethod(c, (method)MaxGraphReset,			"graph.reset",				A_CANT, 0);
	class_addmethod(c, (method)MaxGraphSetup,			"graph.setup",				A_CANT, 0);
	class_addmethod(c, (method)MaxGraphConnect,			"graph.connect",			A_OBJ, A_LONG, 0);
	class_addmethod(c, (method)MaxGraphDrop,			"graph.drop",				A_CANT, 0);
 	class_addmethod(c, (method)MaxGraphObject,			"graph.object",				A_CANT, 0);
	class_addmethod(c, (method)MidiOutAssist,			"assist",					A_CANT, 0); 
    class_addmethod(c, (method)object_obex_dumpout,		"dumpout",					A_CANT, 0);  
	
	CLASS_ATTR_SYM(c,		"device",		0,		MidiOut,	obj);
	CLASS_ATTR_ACCESSORS(c,	"device",		MidiOutGetDevice,		MidiOutSetDevice);
	
	class_register(_sym_box, c);
	sMidiOutClass = c;
	return 0;
}


/************************************************************************************/
// Object Creation Method

MidiOutPtr MidiOutNew(t_symbol* msg, long argc, t_atom* argv)
{
    MidiOutPtr	self;
	TTValue		v;
	TTErr		err;
	
    self = MidiOutPtr(object_alloc(sMidiOutClass));
    if (self) {
    	object_obex_store((void*)self, _sym_dumpout, (t_object*)outlet_new(self, NULL));	// dumpout	
		self->graphOutlets[0] = outlet_new(self, "graph.connect");
		
		v.resize(2);
		v[0] = "midi.out";
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
void MidiOutFree(MidiOutPtr self)
{
	TTObjectBaseRelease((TTObjectBasePtr*)&self->graphObject);
}


/************************************************************************************/
// Methods bound to input/inlets

// Method for Assistance Messages
void MidiOutAssist(MidiOutPtr self, void* b, long msg, long arg, char* dst)
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


void MidiOutGetDeviceNames(MidiOutPtr self)
{
	TTValue		v, none;
	TTErr		err;
	long	ac;
	t_atom*		ap;
	TTSymbol	name;
	
	err = self->graphObject->mKernel.send(TT("getAvailableDeviceNames"), none, v);
	if (!err) {
		ac = v.size();
		ap = new t_atom[ac];
		
		for (long i=0; i<ac; i++) {
			name = v[i];
			atom_setsym(ap+i, gensym((char*)name.c_str()));
		}
		object_obex_dumpout(self, gensym("getAvailableDeviceNames"), ac, ap);
		delete ap;
	}
}


t_max_err MidiOutSetDevice(MidiOutPtr self, void* attr, long argc, t_atom* argv)
{
	if (argc) {
		t_symbol* s = atom_getsym(argv);
		self->graphObject->mKernel.set(TT("device"), TT(s->s_name));
	}
	return MAX_ERR_NONE;
}


t_max_err MidiOutGetDevice(MidiOutPtr self, void* attr, long* argc, t_atom** argv)
{
	TTValue		v;
	TTSymbol	s;
	
	self->graphObject->mKernel.get(TT("device"), v);
	s = v[0];
	if (!s)
		return MAX_ERR_GENERIC;
	
	*argc = 1;
	if (!(*argv)) // otherwise use memory passed in
		*argv = (t_atom *)sysmem_newptr(sizeof(t_atom));
	atom_setsym(*argv, gensym((char*)s.c_str()));
	return MAX_ERR_NONE;
}
