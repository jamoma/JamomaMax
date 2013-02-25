/* 
 * tt.gain~
 * Multichannel gain control
 * By Tim Place, Copyright © 2005
 * 
 * License: This code is licensed under the terms of the "New BSD License"
 * http://creativecommons.org/licenses/BSD/
 */

#include "TTClassWrapperMax.h"
#include "ext.h"						// Max Header
#include "z_dsp.h"						// MSP Header
#include "ext_strings.h"				// String Functions
#include "commonsyms.h"					// Common symbols used by the Max 4.5 API
#include "ext_obex.h"					// Max Object Extensions (attributes) Header

#include "TTDSP.h"
#define MAX_NUM_CHANNELS 32

// Data Structure for this object
typedef struct _gain{
	t_pxobject 		obj;
	TTAudioObject*	xfade;				// crossfade object from the ttblue library
	TTAudioObject*	gain;				// gain control object the ttblue library
	TTAudioSignal*	signalIn;
	TTAudioSignal*	signalOut;
	TTAudioSignal*	signalTemp;
	TTUInt16		numChannels;
	char			attrBypass;			// toggle 1 = bypass
	float			attrMix;			// mix in %
	float			attrGain;			// gain in midi units
} t_gain;


// Prototypes for methods
void*		gain_new(t_symbol *s, long argc, t_atom *argv);					// New Object Creation Method
void		gain_free(t_gain *x);											// Object Deletion Method
void		gain_dsp(t_gain *x, t_signal **sp, short *count);				// DSP Method
void		gain_dsp64(t_gain *x, t_object *dsp64, short *count, double samplerate, long maxvectorsize, long flags); // DSP64 Method
void		gain_assist(t_gain *x, void *b, long m, long a, char *s);		// Assistance Method
t_int*		gain_perform(t_int *w);											// MSP Perform Method
t_max_err	attr_set_gain(t_gain *x, void *attr, long argc, t_atom *argv);
t_max_err	attr_set_mix(t_gain *x, void *attr, long argc, t_atom *argv);
t_max_err	attr_set_bypass(t_gain *x, void *attr, long argc, t_atom *argv);


// Globals
static t_class*	s_gain_class;


/************************************************************************************/
// Define our class

int TTCLASSWRAPPERMAX_EXPORT main(void)
{
	t_class *c;
	
	TTDSPInit();
	common_symbols_init();

	c = class_new("jcom.gain~", (method)gain_new, (method)gain_free, sizeof(t_gain), (method)0L, A_GIMME, 0);

	// Make methods accessible for our class: 
	class_addmethod(c, (method)gain_dsp, 				"dsp", A_CANT, 0L);
	class_addmethod(c, (method)gain_dsp64,				"dsp64", A_CANT, 0);
    class_addmethod(c, (method)object_obex_dumpout, 	"dumpout", A_CANT,0);
    class_addmethod(c, (method)gain_assist, 			"assist", A_CANT, 0L);

	CLASS_ATTR_CHAR(c,		"bypass",	0,		t_gain,	attrBypass);
	CLASS_ATTR_ACCESSORS(c,	"bypass",	NULL,	attr_set_bypass);
	
	CLASS_ATTR_FLOAT(c,		"mix",		0,		t_gain,	attrBypass);
	CLASS_ATTR_ACCESSORS(c,	"mix",		NULL,	attr_set_mix);
	
	CLASS_ATTR_FLOAT(c,		"gain",		0,		t_gain,	attrBypass);
	CLASS_ATTR_ACCESSORS(c,	"gain",		NULL,	attr_set_gain);
		
	// Setup our class to work with MSP
	class_dspinit(c);

	// Finalize our class
	class_register(CLASS_BOX, c);
	s_gain_class = c;
	return 0;
}


/************************************************************************************/
// Object Life

// Create
void* gain_new(t_symbol* s, long argc, t_atom* argv)
{
	long	attrstart = attr_args_offset(argc, argv);		// support normal arguments
	short	i;
	t_gain*	x = (t_gain*)object_alloc(s_gain_class);

	if(x){
		object_obex_store((void*)x, _sym_dumpout, (object*)outlet_new(x, NULL));	// dumpout

		x->numChannels = 1;
		if(attrstart && argv){
			int argument = atom_getlong(argv);
			x->numChannels = TTClip(argument, 1, MAX_NUM_CHANNELS);
		}

		dsp_setup((t_pxobject*)x, x->numChannels * 2);			// Create Object and Inlets
		x->obj.z_misc = Z_NO_INPLACE;							// ESSENTIAL!   		
		for(i=0; i < x->numChannels; i++)
			outlet_new((t_pxobject*)x, "signal");				// Create a signal Outlet   		

		//x->xfade = new TTCrossfade(x->numChannels);				// Constructors
		//x->gain = new TTGain(x->numChannels);
		TTObjectInstantiate(TT("crossfade"), &x->xfade, x->numChannels);
		TTObjectInstantiate(TT("gain"), &x->gain, x->numChannels);
		TTObjectInstantiate(kTTSym_audiosignal, &x->signalTemp, x->numChannels);
		TTObjectInstantiate(kTTSym_audiosignal, &x->signalOut, x->numChannels);
		TTObjectInstantiate(kTTSym_audiosignal, &x->signalIn, x->numChannels*2);
		//x->signalTemp = new TTAudioSignal(x->numChannels);
		//x->signalOut = new TTAudioSignal(x->numChannels);
		//x->signalIn = new TTAudioSignal(x->numChannels*2);
		
		x->xfade->setAttributeValue(TT("position"), 1.0);		// defaults
		x->gain->setAttributeValue(TT("linearGain"), 0.0);
		
		x->attrBypass = 0;
		x->attrGain = 0;

		attr_args_process(x, argc, argv);						// handle attribute args				
	}
	return (x);													// Return the pointer
}

// Destroy
void gain_free(t_gain *x)
{
	dsp_free((t_pxobject *)x);		// Always call dsp_free first in this routine
	TTObjectRelease(&x->xfade);
	TTObjectRelease(&x->gain);
	TTObjectRelease(&x->signalTemp);
	TTObjectRelease(&x->signalOut);
	TTObjectRelease(&x->signalIn);
}

/************************************************************************************/
// Methods bound to input/inlets

// Method for Assistance Messages
void gain_assist(t_gain *x, void *b, long msg, long arg, char *dst)
{   	
	if(msg==1){ 	// Inlets
		if(arg == 0)
			snprintf(dst, 256, "(signal) raw audio (ch. %ld), control messages", arg+1);
		else if(arg < x->numChannels)
			snprintf(dst, 256, "(signal) raw audio (ch. %ld)", arg+1);
		else if(arg >= x->numChannels)
			snprintf(dst, 256, "(signal) wet audio (ch. %ld)", arg-x->numChannels+1);
	}
	else if(msg==2) {// Outlets		
		if(arg == x->numChannels)
			strcpy(dst, "dumpout");					
		else 
			snprintf(dst, 256, "(signal) processed audio (ch. %ld)", arg+1);  
	}
}



// ATTRIBUTE: gain
t_max_err attr_set_gain(t_gain *x, void *attr, long argc, t_atom *argv)
{
	x->attrGain = atom_getfloat(argv);
	x->gain->setAttributeValue(TT("midiGain"), x->attrGain);
	return MAX_ERR_NONE;
}


// ATTRIBUTE: mix
t_max_err attr_set_mix(t_gain *x, void *attr, long argc, t_atom *argv)
{
	x->attrMix = atom_getfloat(argv);
	if(x->attrBypass == 0)
		x->xfade->setAttributeValue(TT("position"), x->attrMix * 0.01);
	return MAX_ERR_NONE;
}


// ATTRIBUTE: bypass
t_max_err attr_set_bypass(t_gain *x, void *attr, long argc, t_atom *argv)
{
	x->attrBypass = atom_getlong(argv);
	if(x->attrBypass == 0)
		x->xfade->setAttributeValue(TT("position"), x->attrMix * 0.01);
	else
		x->xfade->setAttributeValue(TT("position"), 0.0);
	return MAX_ERR_NONE;
}


// Perform Method
t_int* gain_perform(t_int *w)
{
	t_gain*		x = (t_gain *)(w[1]);
	short		i, j;
	TTUInt16	numChannels = x->signalOut->getNumChannelsAsInt();
	TTUInt16	vs = x->signalIn->getVectorSizeAsInt();
	
	// We sort audioIn so that all channels of signalA comes first, then all channels of signalB
	for(i=0; i < numChannels; i++){
		j = (i*3) + 1;
		x->signalIn->setVector(i, vs, (t_float*)(w[j+1]));
		x->signalIn->setVector(i+numChannels, vs, (t_float*)(w[j+2]));
	}
	
	if(!x->obj.z_disabled){								// if we are not muted...
		x->xfade->process(x->signalIn, x->signalTemp);	// perform bypass and/or mix operation on processed input
		x->gain->process(x->signalTemp, x->signalOut);	// perform gain boost/cut on processed/bypassed input
	}
	
	for(i=0; i < numChannels; i++){
		j = (i*3) + 1;
		x->signalOut->getVector(i, vs, (t_float*)(w[j+3]));
	}
	
	return w + ((numChannels*3)+2);				// +2 = +1 for the x pointer and +1 to point to the next object
}


// DSP Method
void gain_dsp(t_gain *x, t_signal **sp, short *count)
{
	short		i, j, k, l=0;
	void**		audioVectors = NULL;
	TTUInt16	numChannels = 0;
	TTUInt16	vs = 0;
	
	audioVectors = (void**)sysmem_newptr(sizeof(void*) * ((x->numChannels * 3) + 1));
	audioVectors[l] = x;
	l++;
	
	// audioVectors[] passed to gain_perform() as:
	//	{x, audioInL[0], audioInR[0], audioOut[0], audioInL[1], audioInR[1], audioOut[1],...}
	for(i=0; i < x->numChannels; i++){
		j = x->numChannels + i;
		k = x->numChannels*2 + i;
		if(count[i] && count[j] && count[k]){
			numChannels++;
			if(sp[i]->s_n > vs)
				vs = sp[i]->s_n;
			
			audioVectors[l] = sp[i]->s_vec;
			l++;
			audioVectors[l] = sp[j]->s_vec;
			l++;
			audioVectors[l] = sp[k]->s_vec;
			l++;
		}
	}
	
	x->signalIn->setNumChannels(TTUInt16(numChannels*2));
	x->signalOut->setNumChannels(numChannels);
	x->signalTemp->setNumChannels(numChannels);
	
	x->signalIn->setVectorSizeWithInt(vs);
	x->signalOut->setVectorSizeWithInt(vs);
	x->signalTemp->setVectorSizeWithInt(vs);

	//signalIn will be set in the perform method
	x->signalOut->alloc();
	x->signalTemp->alloc();
	
	x->xfade->setAttributeValue(kTTSym_sampleRate, sp[0]->s_sr);
	x->gain->setAttributeValue(kTTSym_sampleRate, sp[0]->s_sr);
	x->gain->setAttributeValue(TT("interpolated"), true);
	
	dsp_addv(gain_perform, l, audioVectors);
	sysmem_freeptr(audioVectors);
}

void gain_perform64(t_gain *x, t_object *dsp64, double **ins, long numins, double **outs, long numouts, long sampleframes, long flags, void *userparam)
{
	short		i;
	TTUInt16	vs = x->signalIn->getVectorSizeAsInt();

	// We sort audioIn so that all channels of signalA comes first, then all channels of signalB
	for(i=0; i < numouts; i++){
		x->signalIn->setVector(i, vs, ins[i]);
		x->signalIn->setVector(i+numouts, vs, ins[i+numouts]); 
	}
	
	//if(!x->obj.z_disabled){								// Max6 takes care of the muting now 
		x->xfade->process(x->signalIn, x->signalTemp);	// perform bypass and/or mix operation on processed input
		x->gain->process(x->signalTemp, x->signalOut);	// perform gain boost/cut on processed/bypassed input
		
	//}
	
	for(i=0; i < numouts; i++)
		x->signalOut->getVectorCopy(i, vs, outs[i]); //getVector doesn't seem to work
}



void gain_dsp64(t_gain *x, t_object *dsp64, short *count, double samplerate, long maxvectorsize, long flags)
{
	short		i, k, j; 
	TTUInt16	numChannels = 0;
	
	for (i=0; i < x->numChannels; i++) {
		j = x->numChannels + i;
		k = x->numChannels*2 + i;
		if (count[i] && count[j] && count[k]) {
			numChannels++;			
		}
	}
	
	x->signalIn->setNumChannels(numChannels*2);
	x->signalOut->setNumChannels(numChannels);
	x->signalTemp->setNumChannels(numChannels);
	
	x->signalIn->setVectorSizeWithInt((TTUInt16)maxvectorsize);
	x->signalOut->setVectorSizeWithInt((TTUInt16)maxvectorsize);
	x->signalTemp->setVectorSizeWithInt((TTUInt16)maxvectorsize);
	
	//signalIn will be set in the perform method
	x->signalOut->alloc();
	x->signalTemp->alloc();
	
	x->xfade->setAttributeValue(kTTSym_sampleRate, samplerate);
	x->gain->setAttributeValue(kTTSym_sampleRate, samplerate);
	x->gain->setAttributeValue(TT("interpolated"), true);
	object_method(dsp64, gensym("dsp_add64"), x, gain_perform64, 0, NULL);
	
	
	
	
		
}

