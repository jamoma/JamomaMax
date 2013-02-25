/* 
 *	dcblocker≈
 *	DC-Blocking Filter object for Jamoma AudioGraph
 *	Copyright © 2008 by Timothy Place
 * 
 * License: This code is licensed under the terms of the "New BSD License"
 * http://creativecommons.org/licenses/BSD/
 */

#include "maxAudioGraph.h"


// Data Structure for this object
typedef struct DCBlocker {
    t_object				obj;
	TTAudioGraphObjectPtr	audioGraphObject;
	TTPtr					audioGraphOutlet;
	long					attrBypass;
};
typedef DCBlocker* DCBlockerPtr;


// Prototypes for methods
DCBlockerPtr	DCBlockerNew(SymbolPtr msg, AtomCount argc, AtomPtr argv);
void			DCBlockerFree(DCBlockerPtr self);
void			DCBlockerAssist(DCBlockerPtr self, void* b, long msg, long arg, char* dst);
void			DCBlockerClear(DCBlockerPtr self);
TTErr			DCBlockerReset(DCBlockerPtr self);
TTErr			DCBlockerSetup(DCBlockerPtr self);
TTErr			DCBlockerConnect(DCBlockerPtr self, TTAudioGraphObjectPtr audioSourceObject, long sourceOutletNumber);
MaxErr			DCBlockerSetBypass(DCBlockerPtr self, void* attr, AtomCount argc, AtomPtr argv);


// Globals
static ClassPtr sDCBlockerClass;


/************************************************************************************/
// Main() Function

int TTCLASSWRAPPERMAX_EXPORT main(void)
{
	ClassPtr c;
	
	TTAudioGraphInit();	
	common_symbols_init();
	
	c = class_new("jcom.dcblocker≈", (method)DCBlockerNew, (method)DCBlockerFree, sizeof(DCBlocker), (method)0L, A_GIMME, 0);
	
	class_addmethod(c, (method)DCBlockerClear,		"clear",				0);
	class_addmethod(c, (method)DCBlockerReset,		"audio.reset",		A_CANT, 0);
	class_addmethod(c, (method)DCBlockerSetup,		"audio.setup",		A_CANT, 0);
	class_addmethod(c, (method)DCBlockerConnect,	"audio.connect",	A_OBJ, A_LONG, 0);
 	class_addmethod(c, (method)MaxAudioGraphDrop,	"audio.drop",		A_CANT, 0);
	class_addmethod(c, (method)MaxAudioGraphObject,	"audio.object",		A_CANT, 0);
	class_addmethod(c, (method)DCBlockerAssist,		"assist",				A_CANT, 0); 
    class_addmethod(c, (method)object_obex_dumpout,	"dumpout",				A_CANT, 0);  
	
	CLASS_ATTR_LONG(c,		"bypass",	0,		DCBlocker,	attrBypass);
	CLASS_ATTR_STYLE(c,		"bypass",	0,		"onoff");
	CLASS_ATTR_ACCESSORS(c,	"bypass",	NULL,	DCBlockerSetBypass);
	
	class_register(_sym_box, c);
	sDCBlockerClass = c;
	return 0;
}


/************************************************************************************/
// Object Creation Method

DCBlockerPtr DCBlockerNew(SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
    DCBlockerPtr	self;
	TTValue			v;
	TTErr			err;
	
    self = (DCBlockerPtr)object_alloc(sDCBlockerClass);
    if (self) {
    	object_obex_store((void*)self, _sym_dumpout, (ObjectPtr)outlet_new(self, NULL));
		self->audioGraphOutlet = outlet_new(self, "audio.connect");
		
		// TODO: we need to update objects to work with the correct number of channels when the network is configured
		// Either that, or when we pull we just up the number of channels if when we need to ???
		v.setSize(2);
		v.set(0, TT("dcblock"));
		v.set(1, 1.);
		err = TTObjectBaseInstantiate(TT("audio.object"), (TTObjectBasePtr*)&self->audioGraphObject, v);

		if (!self->audioGraphObject->getUnitGenerator()) {
			object_error(SELF, "cannot load JamomaDSP object");
			return NULL;
		}
		
		attr_args_process(self, argc, argv);
	}
	return self;
}

// Memory Deallocation
void DCBlockerFree(DCBlockerPtr self)
{
	if (self->audioGraphObject)
		TTObjectBaseRelease((TTObjectBasePtr*)&self->audioGraphObject);
}


/************************************************************************************/
// Methods bound to input/inlets

// Method for Assistance Messages
void DCBlockerAssist(DCBlockerPtr self, void* b, long msg, long arg, char* dst)
{
	if (msg==1)			// Inlets
		strcpy(dst, "multichannel input and control messages");		
	else if (msg==2) {	// Outlets
		if (arg == 0)
			strcpy(dst, "multichannel output");
		else
			strcpy(dst, "dumpout");
	}
}


void DCBlockerClear(DCBlockerPtr self)
{
	self->audioGraphObject->getUnitGenerator()->sendMessage(TT("clear"));
}


// METHODS SPECIFIC TO AUDIO GRAPH EXTERNALS

TTErr DCBlockerReset(DCBlockerPtr self)
{
	return self->audioGraphObject->resetAudio();
}


TTErr DCBlockerSetup(DCBlockerPtr self)
{
	Atom a[2];
	
	atom_setobj(a+0, ObjectPtr(self->audioGraphObject));
	atom_setlong(a+1, 0);
	outlet_anything(self->audioGraphOutlet, gensym("audio.connect"), 2, a);
	return kTTErrNone;
}


TTErr DCBlockerConnect(DCBlockerPtr self, TTAudioGraphObjectPtr audioSourceObject, long sourceOutletNumber)
{
	return self->audioGraphObject->connectAudio(audioSourceObject, sourceOutletNumber);
}


// ATTRIBUTE SETTERS

MaxErr DCBlockerSetBypass(DCBlockerPtr self, void* attr, AtomCount argc, AtomPtr argv)
{
	if (argc) {
		self->attrBypass = atom_getlong(argv);
		self->audioGraphObject->getUnitGenerator()->setAttributeValue(TT("bypass"), (TTBoolean)self->attrBypass);
	}
	return MAX_ERR_NONE;
}

