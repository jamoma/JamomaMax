/* 
 *	midi.out#
 *	Jamoma Graph external object for Max
 *	Copyright © 2011 by Timothy Place
 * 
 * License: This code is licensed under the terms of the "New BSD License"
 * http://creativecommons.org/licenses/BSD/
 */

#include "maxGraph.h"


// Data Structure for this object
struct MidiOut {
   	Object				obj;
	TTGraphObjectPtr	graphObject;
	TTPtr				graphOutlets[16];	// this _must_ be third (for the setup call)
	SymbolPtr			attrKey;
	SymbolPtr			attrValue;
};
typedef MidiOut* MidiOutPtr;


// Prototypes for methods
MidiOutPtr	MidiOutNew				(SymbolPtr msg, AtomCount argc, AtomPtr argv);
void		MidiOutFree				(MidiOutPtr self);
void		MidiOutAssist			(MidiOutPtr self, void* b, long msg, long arg, char* dst);
void		MidiOutGetDeviceNames	(MidiOutPtr self);
MaxErr		MidiOutSetDevice		(MidiOutPtr self, void* attr, AtomCount argc, AtomPtr argv);
MaxErr		MidiOutGetDevice		(MidiOutPtr self, void* attr, AtomCount* argc, AtomPtr* argv);


// Globals
static ClassPtr sMidiOutClass;


/************************************************************************************/
// Main() Function

int TTGRAPH_EXTERNAL_EXPORT main(void)
{
	ClassPtr c;
	
	TTGraphInit();	
	common_symbols_init();
	
	c = class_new("jcom.midi.out#", (method)MidiOutNew, (method)MidiOutFree, sizeof(MidiOut), (method)0L, A_GIMME, 0);
	
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

MidiOutPtr MidiOutNew(SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
    MidiOutPtr	self;
	TTValue		v;
	TTErr		err;
	
    self = MidiOutPtr(object_alloc(sMidiOutClass));
    if (self) {
    	object_obex_store((void*)self, _sym_dumpout, (ObjectPtr)outlet_new(self, NULL));	// dumpout	
		self->graphOutlets[0] = outlet_new(self, "graph.connect");
		
		v.setSize(2);
		v.set(0, TT("midi.out"));
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
	else if (msg==2){	// Outlets
		if (arg == 0)
			strcpy(dst, "dictionary output");
		else
			strcpy(dst, "dumpout");
	}
}


void MidiOutGetDeviceNames(MidiOutPtr self)
{
	TTValue		v;
	TTErr		err;
	AtomCount	ac;
	AtomPtr		ap;
	TTSymbol	name;
	
	err = self->graphObject->mKernel->sendMessage(TT("getAvailableDeviceNames"), kTTValNONE, v);
	if (!err) {
		ac = v.getSize();
		ap = new Atom[ac];
		
		for (AtomCount i=0; i<ac; i++) {
			v.get(i, name);
			atom_setsym(ap+i, gensym((char*)name.c_str()));
		}
		object_obex_dumpout(self, gensym("getAvailableDeviceNames"), ac, ap);
		delete ap;
	}
}


MaxErr MidiOutSetDevice(MidiOutPtr self, void* attr, AtomCount argc, AtomPtr argv)
{
	if (argc) {
		SymbolPtr s = atom_getsym(argv);
		self->graphObject->mKernel->setAttributeValue(TT("device"), TT(s->s_name));
	}
	return MAX_ERR_NONE;
}


MaxErr MidiOutGetDevice(MidiOutPtr self, void* attr, AtomCount* argc, AtomPtr* argv)
{
	TTValue		v;
	TTSymbol	s;
	
	self->graphObject->mKernel->getAttributeValue(TT("device"), v);
	v.get(0, s);
	if (!s)
		return MAX_ERR_GENERIC;
	
	*argc = 1;
	if (!(*argv)) // otherwise use memory passed in
		*argv = (t_atom *)sysmem_newptr(sizeof(t_atom));
	atom_setsym(*argv, gensym((char*)s.c_str()));
	return MAX_ERR_NONE;
}
