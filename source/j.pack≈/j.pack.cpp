/** @file
 *
 * @ingroup implementationMax
 *
 * @brief Max external packing several MSP audio signals onto one AudioGraph multichannel audio signal.
 *
 * @details This object functions as a source (generator) for #TTAudioSignal usable by a Jamoma AudioGraph dsp chain.
 *
 * @authors Tim Place, Trond Lossius, Nils Peters
 *
 * @copyright Copyright © 2008 by Timothy Place @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */


#include "j.pack.h"



/************************************************************************************/
// Main() Function

int TTCLASSWRAPPERMAX_EXPORT main(void)
{
	ClassPtr c;
	
	TTAudioGraphInit();	
	common_symbols_init();
	
	c = class_new("j.pack≈", (method)PackNew, (method)PackFree, sizeof(Pack), (method)0L, A_GIMME, 0);
	
	class_addmethod(c, (method)PackReset,				"audio.reset",		A_CANT, 0);
	class_addmethod(c, (method)PackSetup,				"audio.setup",		A_CANT, 0);
	class_addmethod(c, (method)MaxAudioGraphDrop,		"audio.drop",		A_CANT, 0);
	class_addmethod(c, (method)MaxAudioGraphObject,		"audio.object",		A_CANT, 0);
 	class_addmethod(c, (method)PackDsp64,				"dsp64",			A_CANT, 0);		
	class_addmethod(c, (method)PackAssist,				"assist",			A_CANT, 0); 
    class_addmethod(c, (method)object_obex_dumpout,		"dumpout",			A_CANT, 0);  
		
	class_dspinit(c);
	class_register(_sym_box, c);
	sInClass = c;
	return 0;
}


/************************************************************************************/
// Object Creation Method

PackPtr PackNew(SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
   PackPtr	self;
	TTValue	sr(sys_getsr());
 	long	attrstart = attr_args_offset(argc, argv);
	TTValue	v;
	TTErr	err;
	
    self =PackPtr(object_alloc(sInClass));
    if (self) {
		self->maxNumChannels = 2;
		if (attrstart && argv)
			self->maxNumChannels = atom_getlong(argv);
		
		// Set the sample rate of the Jamoma AudioGraph environment
		ttEnvironment->setAttributeValue(kTTSym_sampleRate, sr);
		
		// Create an embedded Jamoma AudioGraph object functioning as a signal generator.
		v.resize(3);
		v.set(0, TT("audio.generator"));
		v.set(1, 0); // no audio graph inlets (only msp inlets)
		v.set(2, 1); // one audio graph outlet
		err = TTObjectBaseInstantiate(TT("audio.object"), (TTObjectBasePtr*)&self->audioGraphObject, v);
		self->audioGraphObject->addAudioFlag(kTTAudioGraphGenerator);
		// Self check and return error if this did not work out.
		if (!self->audioGraphObject->getUnitGenerator()) {
			object_error(SELF, "cannot load audio.generator");
			return NULL;
		}

		attr_args_process(self, argc, argv);
		
		// Create rightmost outlet for dumping attributes etc.
    	object_obex_store((void*)self, _sym_dumpout, (object*)outlet_new(self,NULL));
		
		// Create AudioGraph outlet
		self->audioGraphObjectOutlet = outlet_new((t_pxobject*)self, "audio.connect");
		
		// Register this object as a DSP object with MSP
	    dsp_setup((t_pxobject*)self, self->maxNumChannels);
		
		// Set flags necsessary to ensure correct interaction with the MSP processing chain.
		self->obj.z_misc = Z_NO_INPLACE | Z_PUT_FIRST;
	}
	return self;
}

// Memory Deallocation
void PackFree(PackPtr self)
{
	dsp_free((t_pxobject*)self);
	// Release the AudioGraph object.
	TTObjectBaseRelease((TTObjectBasePtr*)&self->audioGraphObject);
}


/************************************************************************************/
// Methods bound to input/inlets

// Method for Assistance Messages
void PackAssist(PackPtr self, void* b, long msg, long arg, char* dst)
{
	if (msg==1)			//Packlets
		if (arg > 0) { snprintf(dst, 256, "(signal) single-channel input Nr. %ld", arg + 1); }
		else { strcpy(dst, "control messages and (signal) single-channel input Nr. 1");}
	else if (msg==2) {	// Outlets
		if (arg == 0)
			strcpy(dst, "multichannel output");
		else
			strcpy(dst, "dumpout");
	}
}


TTErr PackReset(PackPtr self, long vectorSize)
{
	return self->audioGraphObject->resetAudio();
}


TTErr PackSetup(PackPtr self)
{
	t_atom a[2];
	
	atom_setobj(a+0, ObjectPtr(self->audioGraphObject));
	atom_setlong(a+1, 0);
	outlet_anything(self->audioGraphObjectOutlet, gensym("audio.connect"), 2, a);
	return kTTErrNone;
}


void PackPerform64(PackPtr self, ObjectPtr dsp64, double **ins, long numins, double **outs, long numouts, long sampleframes, long flags, void *userparam)
{	
	for (TTUInt32 i=0; i < self->numChannels; i++)
		TTAudioGraphGeneratorPtr(self->audioGraphObject->getUnitGenerator())->mBuffer->setVector64Copy(i, self->vectorSize, ins[i]);
}


void PackDsp64(PackPtr self, ObjectPtr dsp64, short *count, double samplerate, long maxvectorsize, long flags)
{
	self->vectorSize = maxvectorsize;
	
	// COMMENT: In the following commented out code we attempted to reduce the number of channels of the generated AudioGraph signal in the case that the rightmost inlets of j.pack≈ did not have any audio signals connected. This would save us some CPU. However it also introduced a bug logged as issue #16 at github.com/jamoma/JamomaCore. It might be that instead of considering this a bug in j.pack≈, we rather should consider it a bug when combining several AudioGraph signals, to be resolved elsewhere. But this fixes the issue for now. [TL-2013-08-04]
	/*
	// Find the rightmost inlet that an audio signal is connected to.
	TTUInt16	highestIndexForConnectedSignal = 0;
	
	self->numChannels = 0;
	for (TTUInt16 i=0; i < self->maxNumChannels; i++) {
		self->numChannels++;
		if (count[i])
			highestIndexForConnectedSignal = i;
	}
	
	self->audioGraphObject->setOutputNumChannels(0, highestIndexForConnectedSignal+1);
	*/
	
	// We always set j.pack≈ to process all channels:
	self->numChannels = self->maxNumChannels;
	self->audioGraphObject->setOutputNumChannels(0, self->numChannels);
	
	self->audioGraphObject->getUnitGenerator()->setAttributeValue(kTTSym_vectorSize, self->vectorSize);
	self->audioGraphObject->getUnitGenerator()->setAttributeValue(kTTSym_maxNumChannels, self->maxNumChannels);
	self->audioGraphObject->getUnitGenerator()->setAttributeValue(kTTSym_sampleRate, samplerate);
	
	object_method(dsp64, gensym("dsp_add64"), self,PackPerform64, 0, NULL); 
	//dsp_add64(dsp64, (ObjectPtr)self, (t_perfroutine64)PackPerform64, 0, NULL);
}
