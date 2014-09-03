/** @file
 *
 * @ingroup implementationMaxExternalsAudioGraph
 *
 * @brief j.dcblock= : wraps the #TTDCBlock class as DC offset removing filter external for AudioGraph
 *
 * @details
 *
 * @authors Tim Place, Trond Lossius
 *
 * @copyright © 2008 by Timothy Place @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */


#include "maxAudioGraph.h"


// Data Structure for this object
typedef struct DCBlock {
    t_object				obj;
	TTAudioGraphObjectBasePtr	audioGraphObject;
	TTPtr					audioGraphOutlet;
	long					attrBypass;
};
typedef DCBlock* DCBlockPtr;


// Prototypes for methods
DCBlockPtr	DCBlockNew(t_symbol* msg, long argc, t_atom* argv);
void		DCBlockFree(DCBlockPtr self);
void		DCBlockAssist(DCBlockPtr self, void* b, long msg, long arg, char* dst);
void		DCBlockClear(DCBlockPtr self);
TTErr		DCBlockReset(DCBlockPtr self);
TTErr		DCBlockSetup(DCBlockPtr self);
TTErr		DCBlockConnect(DCBlockPtr self, TTAudioGraphObjectBasePtr audioSourceObject, long sourceOutletNumber);
t_max_err		DCBlockSetBypass(DCBlockPtr self, void* attr, long argc, t_atom* argv);


// Globals
static t_class* sDCBlockClass;


/************************************************************************************/
// Main() Function

int C74_EXPORT main(void)
{
	t_class* c;
	
	TTAudioGraphInit();	
	common_symbols_init();
	
	c = class_new("j.dcblock=", (method)DCBlockNew, (method)DCBlockFree, sizeof(DCBlock), (method)0L, A_GIMME, 0);
	
	class_addmethod(c, (method)DCBlockClear,		"clear",				0);
	class_addmethod(c, (method)DCBlockReset,		"audio.reset",		A_CANT, 0);
	class_addmethod(c, (method)DCBlockSetup,		"audio.setup",		A_CANT, 0);
	class_addmethod(c, (method)DCBlockConnect,	"audio.connect",	A_OBJ, A_LONG, 0);
 	class_addmethod(c, (method)MaxAudioGraphDrop,	"audio.drop",		A_CANT, 0);
	class_addmethod(c, (method)MaxAudioGraphObject,	"audio.object",		A_CANT, 0);
	class_addmethod(c, (method)DCBlockAssist,		"assist",				A_CANT, 0); 
    class_addmethod(c, (method)object_obex_dumpout,	"dumpout",				A_CANT, 0);  
	
	CLASS_ATTR_LONG(c,		"bypass",	0,		DCBlock,	attrBypass);
	CLASS_ATTR_STYLE(c,		"bypass",	0,		"onoff");
	CLASS_ATTR_ACCESSORS(c,	"bypass",	NULL,	DCBlockSetBypass);
	
	class_register(_sym_box, c);
	sDCBlockClass = c;
	return 0;
}


/************************************************************************************/
// Object Creation Method

DCBlockPtr DCBlockNew(t_symbol* msg, long argc, t_atom* argv)
{
    DCBlockPtr	self;
	TTValue			v;
	TTErr			err;
	
    self = (DCBlockPtr)object_alloc(sDCBlockClass);
    if (self) {
    	object_obex_store((void*)self, _sym_dumpout, (t_object*)outlet_new(self, NULL));
		self->audioGraphOutlet = outlet_new(self, "audio.connect");
		
		// TODO: we need to update objects to work with the correct number of channels when the network is configured
		// Either that, or when we pull we just up the number of channels if when we need to ???
		v.resize(2);
		v[0] = "dcblock";
		v[1] = 1;
		err = TTObjectBaseInstantiate(TT("audio.object"), (TTObjectBasePtr*)&self->audioGraphObject, v);

		if (!self->audioGraphObject->getUnitGenerator().valid()) {
			object_error(SELF, "cannot load JamomaDSP object");
			return NULL;
		}
		
		attr_args_process(self, argc, argv);
	}
	return self;
}

// Memory Deallocation
void DCBlockFree(DCBlockPtr self)
{
	if (self->audioGraphObject)
		TTObjectBaseRelease((TTObjectBasePtr*)&self->audioGraphObject);
}


/************************************************************************************/
// Methods bound to input/inlets

// Method for Assistance Messages
void DCBlockAssist(DCBlockPtr self, void* b, long msg, long arg, char* dst)
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


void DCBlockClear(DCBlockPtr self)
{
	self->audioGraphObject->getUnitGenerator().send("clear");
}


// METHODS SPECIFIC TO AUDIO GRAPH EXTERNALS

TTErr DCBlockReset(DCBlockPtr self)
{
	return self->audioGraphObject->resetAudio();
}


TTErr DCBlockSetup(DCBlockPtr self)
{
	t_atom a[2];
	
	atom_setobj(a+0, (t_object*)(self->audioGraphObject));
	atom_setlong(a+1, 0);
	outlet_anything(self->audioGraphOutlet, gensym("audio.connect"), 2, a);
	return kTTErrNone;
}


TTErr DCBlockConnect(DCBlockPtr self, TTAudioGraphObjectBasePtr audioSourceObject, long sourceOutletNumber)
{
	return self->audioGraphObject->connectAudio(audioSourceObject, sourceOutletNumber);
}


// ATTRIBUTE SETTERS

t_max_err DCBlockSetBypass(DCBlockPtr self, void* attr, long argc, t_atom* argv)
{
	if (argc) {
		self->attrBypass = atom_getlong(argv);
		self->audioGraphObject->getUnitGenerator().set("bypass", (TTBoolean)self->attrBypass);
	}
	return MAX_ERR_NONE;
}

