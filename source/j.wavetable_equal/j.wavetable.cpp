/** @file
 *
 * @ingroup implementationMaxExternalsAudioGraph
 *
 * @brief j.wavetable= : wraps the #TTWavetable class as oscillation generator for AudioGraph
 *
 * @details
 *
 * @authors Tim Place, Trond Lossius
 *
 * @copyright © 2008, Tim Place @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */


#include "MaxAudioGraph.h"


// Data Structure for this object
typedef struct _oscil {
    t_object				obj;
	TTAudioGraphObjectBasePtr	audioGraphObject;
	TTPtr					audioGraphOutlet;
	t_symbol				*attrWaveform;
	t_symbol				*attrInterpolation;
	float					attrFrequency;
	float					attrGain;
	long					attrNumChannels;
} t_oscil;


// Prototypes for methods
t_oscil*	OscilNew(t_symbol *msg, long argc, t_atom* argv);
void		OscilFree(t_oscil* self);
void		OscilAssist(t_oscil* self, void* b, long msg, long arg, char* dst);
TTErr		OscilReset(t_oscil* self);
TTErr		OscilSetup(t_oscil* self);
TTErr		OscilConnectAudio(t_oscil* self, TTAudioGraphObjectBasePtr audioSourceObject, long sourceOutletNumber);
TTErr		OscilDropAudio(t_oscil* self, long inletNumber, t_object* sourceMaxObject, long sourceOutletNumber);
t_max_err		OscilSetMode(t_oscil* self, void* attr, long argc, t_atom* argv);
t_max_err		OscilSetInterpolation(t_oscil* self, void* attr, long argc, t_atom* argv);
t_max_err		OscilSetFrequency(t_oscil* self, void* attr, long argc, t_atom* argv);
t_max_err		OscilSetGain(t_oscil* self, void* attr, long argc, t_atom* argv);
t_max_err		OscilSetNumChannels(t_oscil* self, void* attr, long argc, t_atom* argv);


// Globals
static t_class* s_oscil_class;


/************************************************************************************/
// Main() Function

int C74_EXPORT main(void)
{
	t_class *c;

	TTAudioGraphInit();
	common_symbols_init();

	c = class_new("j.wavetable=", (method)OscilNew, (method)OscilFree, sizeof(t_oscil), (method)0L, A_GIMME, 0);

	class_addmethod(c, (method)OscilReset,			"audio.reset",		A_CANT, 0);
	class_addmethod(c, (method)OscilSetup,			"audio.setup",		A_CANT,	0);
	class_addmethod(c, (method)OscilConnectAudio,	"audio.connect",	A_OBJ, A_LONG, 0);
	class_addmethod(c, (method)OscilDropAudio,		"audio.drop",		A_CANT, 0);
	class_addmethod(c, (method)MaxAudioGraphObject,	"audio.object",		A_CANT, 0);
	class_addmethod(c, (method)OscilAssist,			"assist",			A_CANT, 0);
    class_addmethod(c, (method)object_obex_dumpout,	"dumpout",			A_CANT, 0);

	CLASS_ATTR_SYM(c,		"waveform",			0,		t_oscil,	attrWaveform);
	CLASS_ATTR_ACCESSORS(c,	"waveform",			NULL,	OscilSetMode);
	CLASS_ATTR_ENUM(c,		"waveform",			0,		"cosine ramp sawtooth sine square triangle");
	CLASS_ATTR_DEFAULTNAME(c,"waveform",		0,		"sine");

	CLASS_ATTR_SYM(c,		"interpolation",	0,		t_oscil,	attrInterpolation);
	CLASS_ATTR_ACCESSORS(c,	"interpolation",	NULL,	OscilSetInterpolation);
	CLASS_ATTR_ENUM(c,		"interpolation",	0,		"none linear lfo");
	CLASS_ATTR_DEFAULTNAME(c,"interpolation",	0,		"linear");

	CLASS_ATTR_FLOAT(c,		"frequency",		0,		t_oscil,	attrFrequency);
	CLASS_ATTR_ACCESSORS(c,	"frequency",		NULL,	OscilSetFrequency);
	CLASS_ATTR_DEFAULT(c,	"frequency",		0,		"1000");

	CLASS_ATTR_FLOAT(c,		"gain",				0,		t_oscil,	attrGain);
	CLASS_ATTR_DEFAULT(c,	"gain",				0,		"1.0");
	CLASS_ATTR_ACCESSORS(c,	"gain",				NULL,	OscilSetGain);

	CLASS_ATTR_LONG(c,		"numChannels",		0,		t_oscil,	attrNumChannels);
	CLASS_ATTR_ACCESSORS(c,	"numChannels",		NULL,	OscilSetNumChannels);
	CLASS_ATTR_DEFAULT(c,	"numChannels",		0,		"1");

	class_register(_sym_box, c);
	s_oscil_class = c;
	return 0;
}


/************************************************************************************/
// Object Creation Method

t_oscil* OscilNew(t_symbol *msg, long argc, t_atom* argv)
{
    t_oscil*	self = (t_oscil*)object_alloc(s_oscil_class);
	TTValue		v;
	TTErr		err;

    if (self) {
		v.resize(2);
		v[0] = "wavetable";
		v[1] = 0;
		err = TTObjectBaseInstantiate(TT("audio.object"), (TTObjectBasePtr*)&self->audioGraphObject, v);

		self->audioGraphObject->addAudioFlag(kTTAudioGraphGenerator);

		attr_args_process(self, argc, argv);
    	object_obex_store((TTPtr)self, _sym_dumpout, (t_object*)outlet_new(self, NULL));
		self->audioGraphOutlet = outlet_new((t_pxobject*)self, "audio.connect");
	}
	return self;
}

// Memory Deallocation
void OscilFree(t_oscil* self)
{
	TTObjectBaseRelease((TTObjectBasePtr*)&self->audioGraphObject);
}


/************************************************************************************/
// Methods bound to input/inlets

// Method for Assistance Messages
void OscilAssist(t_oscil* self, void* b, long msg, long arg, char* dst)
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


TTErr OscilReset(t_oscil* self)
{
	return self->audioGraphObject->resetAudio();
}


TTErr OscilSetup(t_oscil* self)
{
	t_atom a[2];

	atom_setobj(a+0, (t_object*)(self->audioGraphObject));
	atom_setlong(a+1, 0);
	outlet_anything(self->audioGraphOutlet, gensym("audio.connect"), 2, a);
	return kTTErrNone;
}


TTErr OscilConnectAudio(t_oscil* self, TTAudioGraphObjectBasePtr audioSourceObject, long sourceOutletNumber)
{
	self->audioGraphObject->removeAudioFlag(kTTAudioGraphGenerator);
	self->audioGraphObject->setAttributeValue(TT("numAudioInlets"), 1);
	return self->audioGraphObject->connectAudio(audioSourceObject, sourceOutletNumber);
}


TTErr OscilDropAudio(t_oscil* self, long inletNumber, t_object* sourceMaxObject, long sourceOutletNumber)
{
	TTAudioGraphObjectBasePtr	sourceObject = NULL;
	TTErr 					err;

	self->audioGraphObject->setAttributeValue(TT("numAudioInlets"), 0);
	self->audioGraphObject->addAudioFlag(kTTAudioGraphGenerator);
	err = (TTErr)(TTPtrSizedInt)(object_method(sourceMaxObject, gensym("audio.object"), &sourceObject));
	if (self->audioGraphObject && sourceObject && !err)
		err = self->audioGraphObject->dropAudio(sourceObject, sourceOutletNumber, inletNumber);
	return err;
}



t_max_err OscilSetMode(t_oscil* self, void* attr, long argc, t_atom* argv)
{

	if (argc) {
		TTValue v;

		v.resize(argc);
		for (int i=0; i<argc; i++)
				v[i] = TT(atom_getsym(argv+i)->s_name);

		self->attrWaveform = atom_getsym(argv);
		self->audioGraphObject->getUnitGenerator().set(TT("mode"), v);
	}
	return MAX_ERR_NONE;
}


t_max_err OscilSetInterpolation(t_oscil* self, void* attr, long argc, t_atom* argv)
{
	if (argc) {
		self->attrInterpolation = atom_getsym(argv);
		self->audioGraphObject->getUnitGenerator().set(TT("interpolation"), TT(self->attrInterpolation->s_name));
	}
	return MAX_ERR_NONE;
}


t_max_err OscilSetFrequency(t_oscil* self, void* attr, long argc, t_atom* argv)
{
	if (argc) {
		self->attrFrequency = atom_getfloat(argv);
		self->audioGraphObject->getUnitGenerator().set(TT("frequency"), self->attrFrequency);
	}
	return MAX_ERR_NONE;
}


t_max_err OscilSetGain(t_oscil* self, void* attr, long argc, t_atom* argv)
{
	if (argc) {
		self->attrGain	= atom_getfloat(argv);
		self->audioGraphObject->getUnitGenerator().set(TT("gain"), self->attrGain);
	}
	return MAX_ERR_NONE;
}


t_max_err OscilSetNumChannels(t_oscil* self, void* attr, long argc, t_atom* argv)
{
	if (argc) {
		self->attrNumChannels = atom_getlong(argv);
		self->audioGraphObject->setOutputNumChannels(0, self->attrNumChannels);
	}
	return MAX_ERR_NONE;
}

