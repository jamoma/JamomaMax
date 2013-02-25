/* 
 *	wavetable≈
 *	Oscillator object for Jamoma AudioGraph
 *	Copyright © 2008 by Timothy Place
 * 
 * License: This code is licensed under the terms of the "New BSD License"
 * http://creativecommons.org/licenses/BSD/
 */

#include "maxAudioGraph.h"


// Data Structure for this object
typedef struct Oscil {
    t_object				obj;
	TTAudioGraphObjectPtr	audioGraphObject;
	TTPtr					audioGraphOutlet;
	SymbolPtr				attrWaveform;
	SymbolPtr				attrInterpolation;
	float					attrFrequency;
	float					attrGain;
	long					attrNumChannels;
};
typedef Oscil* OscilPtr;


// Prototypes for methods
OscilPtr	OscilNew(SymbolPtr msg, AtomCount argc, AtomPtr argv);
void		OscilFree(OscilPtr self);
void		OscilAssist(OscilPtr self, void* b, long msg, long arg, char* dst);
TTErr		OscilReset(OscilPtr self);
TTErr		OscilSetup(OscilPtr self);
TTErr		OscilConnectAudio(OscilPtr self, TTAudioGraphObjectPtr audioSourceObject, long sourceOutletNumber);
TTErr		OscilDropAudio(OscilPtr self, long inletNumber, ObjectPtr sourceMaxObject, long sourceOutletNumber);
MaxErr		OscilSetMode(OscilPtr self, void* attr, AtomCount argc, AtomPtr argv);
MaxErr		OscilSetInterpolation(OscilPtr self, void* attr, AtomCount argc, AtomPtr argv);
MaxErr		OscilSetFrequency(OscilPtr self, void* attr, AtomCount argc, AtomPtr argv);
MaxErr		OscilSetGain(OscilPtr self, void* attr, AtomCount argc, AtomPtr argv);
MaxErr		OscilSetNumChannels(OscilPtr self, void* attr, AtomCount argc, AtomPtr argv);


// Globals
static ClassPtr sOscilClass;


/************************************************************************************/
// Main() Function

int TTCLASSWRAPPERMAX_EXPORT main(void)
{
	ClassPtr c;

	TTAudioGraphInit();	
	common_symbols_init();

	c = class_new("jcom.wavetable≈", (method)OscilNew, (method)OscilFree, sizeof(Oscil), (method)0L, A_GIMME, 0);
	
	class_addmethod(c, (method)OscilReset,			"audio.reset",		A_CANT, 0);
	class_addmethod(c, (method)OscilSetup,			"audio.setup",		A_CANT,	0);
	class_addmethod(c, (method)OscilConnectAudio,	"audio.connect",	A_OBJ, A_LONG, 0);
	class_addmethod(c, (method)OscilDropAudio,		"audio.drop",		A_CANT, 0);
	class_addmethod(c, (method)MaxAudioGraphObject,	"audio.object",		A_CANT, 0);
	class_addmethod(c, (method)OscilAssist,			"assist",			A_CANT, 0); 
    class_addmethod(c, (method)object_obex_dumpout,	"dumpout",			A_CANT, 0);  
	
	CLASS_ATTR_SYM(c,		"waveform",			0,		Oscil,	attrWaveform);
	CLASS_ATTR_ACCESSORS(c,	"waveform",			NULL,	OscilSetMode);
	CLASS_ATTR_ENUM(c,		"waveform",			0,		"cosine ramp sawtooth sine square triangle");
	CLASS_ATTR_DEFAULTNAME(c,"waveform",		0,		"sine");
	
	CLASS_ATTR_SYM(c,		"interpolation",	0,		Oscil,	attrInterpolation);
	CLASS_ATTR_ACCESSORS(c,	"interpolation",	NULL,	OscilSetInterpolation);
	CLASS_ATTR_ENUM(c,		"interpolation",	0,		"none linear lfo");
	CLASS_ATTR_DEFAULTNAME(c,"interpolation",	0,		"linear");
	
	CLASS_ATTR_FLOAT(c,		"frequency",		0,		Oscil,	attrFrequency);
	CLASS_ATTR_ACCESSORS(c,	"frequency",		NULL,	OscilSetFrequency);
	CLASS_ATTR_DEFAULT(c,	"frequency",		0,		"1000");
	
	CLASS_ATTR_FLOAT(c,		"gain",				0,		Oscil,	attrGain);
	CLASS_ATTR_DEFAULT(c,	"gain",				0,		"1.0");
	CLASS_ATTR_ACCESSORS(c,	"gain",				NULL,	OscilSetGain);
		
	CLASS_ATTR_LONG(c,		"numChannels",		0,		Oscil,	attrNumChannels);
	CLASS_ATTR_ACCESSORS(c,	"numChannels",		NULL,	OscilSetNumChannels);
	CLASS_ATTR_DEFAULT(c,	"numChannels",		0,		"1");
	
	class_register(_sym_box, c);
	sOscilClass = c;
	return 0;
}


/************************************************************************************/
// Object Creation Method

OscilPtr OscilNew(SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
    OscilPtr	self = OscilPtr(object_alloc(sOscilClass));
	TTValue		v;
	TTErr		err;

    if (self) {
		v.setSize(2);
		v.set(0, TT("wavetable"));
		v.set(1, TTUInt32(0));
		err = TTObjectBaseInstantiate(TT("audio.object"), (TTObjectBasePtr*)&self->audioGraphObject, v);

		self->audioGraphObject->addAudioFlag(kTTAudioGraphGenerator);

		attr_args_process(self, argc, argv);
    	object_obex_store((TTPtr)self, _sym_dumpout, (ObjectPtr)outlet_new(self, NULL));
		self->audioGraphOutlet = outlet_new((t_pxobject*)self, "audio.connect");
	}
	return self;
}

// Memory Deallocation
void OscilFree(OscilPtr self)
{
	TTObjectBaseRelease((TTObjectBasePtr*)&self->audioGraphObject);
}


/************************************************************************************/
// Methods bound to input/inlets

// Method for Assistance Messages
void OscilAssist(OscilPtr self, void* b, long msg, long arg, char* dst)
{
	if (msg==1)			// Inlets
		strcpy(dst, "multichannel audio connection and control messages");		
	else if (msg==2) {	// Outlets
		if (arg == 0)
			strcpy(dst, "multichannel audio connection");
		else
			strcpy(dst, "dumpout");
	}
}


TTErr OscilReset(OscilPtr self)
{
	return self->audioGraphObject->resetAudio();
}


TTErr OscilSetup(OscilPtr self)
{
	Atom a[2];
	
	atom_setobj(a+0, ObjectPtr(self->audioGraphObject));
	atom_setlong(a+1, 0);
	outlet_anything(self->audioGraphOutlet, gensym("audio.connect"), 2, a);
	return kTTErrNone;
}


TTErr OscilConnectAudio(OscilPtr self, TTAudioGraphObjectPtr audioSourceObject, long sourceOutletNumber)
{
	self->audioGraphObject->removeAudioFlag(kTTAudioGraphGenerator);
	self->audioGraphObject->setAttributeValue(TT("numAudioInlets"), 1);
	return self->audioGraphObject->connectAudio(audioSourceObject, sourceOutletNumber);
}


TTErr OscilDropAudio(OscilPtr self, long inletNumber, ObjectPtr sourceMaxObject, long sourceOutletNumber)
{
	TTAudioGraphObjectPtr	sourceObject = NULL;
	TTErr 					err;
	
	self->audioGraphObject->setAttributeValue(TT("numAudioInlets"), 0);
	self->audioGraphObject->addAudioFlag(kTTAudioGraphGenerator);
	err = (TTErr)(TTPtrSizedInt)(object_method(sourceMaxObject, GENSYM("audio.object"), &sourceObject));
	if (self->audioGraphObject && sourceObject && !err)
		err = self->audioGraphObject->dropAudio(sourceObject, sourceOutletNumber, inletNumber);	
	return err;
}



MaxErr OscilSetMode(OscilPtr self, void* attr, AtomCount argc, AtomPtr argv)
{
	if (argc) {
		self->attrWaveform = atom_getsym(argv);
		self->audioGraphObject->getUnitGenerator()->setAttributeValue(TT("mode"), TT(self->attrWaveform->s_name));
	}
	return MAX_ERR_NONE;
}


MaxErr OscilSetInterpolation(OscilPtr self, void* attr, AtomCount argc, AtomPtr argv)
{
	if (argc) {
		self->attrInterpolation = atom_getsym(argv);
		self->audioGraphObject->getUnitGenerator()->setAttributeValue(TT("interpolation"), TT(self->attrInterpolation->s_name));
	}
	return MAX_ERR_NONE;
}


MaxErr OscilSetFrequency(OscilPtr self, void* attr, AtomCount argc, AtomPtr argv)
{
	if (argc) {
		self->attrFrequency = atom_getfloat(argv);
		self->audioGraphObject->getUnitGenerator()->setAttributeValue(TT("frequency"), self->attrFrequency);
	}
	return MAX_ERR_NONE;
}


MaxErr OscilSetGain(OscilPtr self, void* attr, AtomCount argc, AtomPtr argv)
{
	if (argc) {
		self->attrGain	= atom_getfloat(argv);
		self->audioGraphObject->getUnitGenerator()->setAttributeValue(TT("gain"), self->attrGain);
	}
	return MAX_ERR_NONE;
}


MaxErr OscilSetNumChannels(OscilPtr self, void* attr, AtomCount argc, AtomPtr argv)
{
	if (argc) {
		self->attrNumChannels = atom_getlong(argv);
		self->audioGraphObject->setOutputNumChannels(0, self->attrNumChannels);
	}
	return MAX_ERR_NONE;
}

