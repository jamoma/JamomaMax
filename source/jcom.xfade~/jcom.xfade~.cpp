/* 
 *	tt.xfade~
 *	External object for Max/MSP
 *	
 *	Example project for TTBlue
 *	Copyright © 2005 by Timothy Place
 * 
 * License: This code is licensed under the terms of the "New BSD License"
 * http://creativecommons.org/licenses/BSD/
 */

#include "TTClassWrapperMax.h"
#include "ext.h"					// Max Header
#include "z_dsp.h"					// MSP Header
#include "ext_strings.h"			// String Functions
#include "commonsyms.h"				// Common symbols used by the Max 4.5 API
#include "ext_obex.h"				// Max Object Extensions (attributes) Header

#include "TTDSP.h"					// TTBlue Interfaces...

#define MAX_NUM_CHANNELS 32

// Data Structure for this object
typedef struct _fade{
	t_pxobject 			x_obj;
	long				attr_shape;
	long				attr_mode;
	float				attr_position;
	TTUInt16			numChannels;
	TTAudioObjectBase*		xfade;			// crossfade object from the TTBlue library
	TTAudioSignal*		audioIn1;
	TTAudioSignal*		audioIn2;
	TTAudioSignal*		audioInControl;
	TTAudioSignal*		audioOut;
} t_fade;

// Prototypes for methods
void *fade_new(t_symbol *s, long argc, t_atom *argv);				// New Object Creation Method
t_int *fade_perform1(t_int *w);										// An MSP Perform (signal) Method
t_int *fade_perform2(t_int *w);										// An MSP Perform (signal) Method
void fade_dsp(t_fade *x, t_signal **sp, short *count);				// DSP Method
void fade_dsp64(t_fade *x, t_object *dsp64, short *count, double samplerate, long maxvectorsize, long flags); // DSP64 Method
void fade_assist(t_fade *x, void *b, long m, long a, char *s);		// Assistance Method
void fade_float(t_fade *x, double value );							// Float Method
void fade_free(t_fade *x);
t_max_err attr_set_position(t_fade *x, void *attr, long argc, t_atom *argv);
t_max_err attr_set_shape(t_fade *x, void *attr, long argc, t_atom *argv);
t_max_err attr_set_mode(t_fade *x, void *attr, long argc, t_atom *argv);
t_int *fade_perform_stereo_1(t_int *w);
t_int *fade_perform_stereo_2(t_int *w);
void fade_perform64_1(t_fade *x, t_object *dsp64, double **ins, long numins, double **outs, long numouts, long sampleframes, long flags, void *userparam);
void fade_perform64_2(t_fade *x, t_object *dsp64, double **ins, long numins, double **outs, long numouts, long sampleframes, long flags, void *userparam);

// Globals
static t_class	*s_fade_class;


/************************************************************************************/
// Main() Function

int TTCLASSWRAPPERMAX_EXPORT main(void)				// main recieves a copy of the Max function macros table
{
	t_class *c;
	
	TTDSPInit();
	common_symbols_init();
	
	// Define our class
	c = class_new("jcom.xfade~", (method)fade_new, (method)fade_free, sizeof(t_fade), (method)0L, A_GIMME, 0);
	
	// Make methods accessible for our class: 
	class_addmethod(c, (method)fade_float,				"float",	A_FLOAT,0L);
	class_addmethod(c, (method)fade_dsp, 				"dsp",		A_CANT, 0L);
	class_addmethod(c, (method)fade_dsp64,				"dsp64",	A_CANT, 0);
    class_addmethod(c, (method)object_obex_dumpout, 	"dumpout",	A_CANT,	0);
    class_addmethod(c, (method)fade_assist, 			"assist",	A_CANT, 0L);
	
	// Add attributes to our class:
	CLASS_ATTR_LONG(c,		"shape",		0,	t_fade, attr_shape);
	CLASS_ATTR_ACCESSORS(c,	"shape",		NULL, attr_set_shape);
	CLASS_ATTR_ENUMINDEX(c,	"shape",		0, "EqualPower Linear SquareRoot");

	CLASS_ATTR_LONG(c,		"mode",			0,	t_fade, attr_mode);
	CLASS_ATTR_ACCESSORS(c,	"mode",			NULL, attr_set_mode);
	CLASS_ATTR_ENUMINDEX(c,	"mode",			0, "LookupTable Calculate");

	CLASS_ATTR_FLOAT(c,		"position",		0,	t_fade, attr_position);
	CLASS_ATTR_ACCESSORS(c,	"position",		NULL, attr_set_position);	
	
	// Setup our class to work with MSP
	class_dspinit(c);
	
	// Finalize our class
	class_register(CLASS_BOX, c);
	s_fade_class = c;
	return 0;
}


/************************************************************************************/
// Object Life

// Create
void *fade_new(t_symbol *s, long argc, t_atom *argv)
{
	long attrstart = attr_args_offset(argc, argv);		// support normal arguments
	short i;
	
	t_fade *x = (t_fade *)object_alloc(s_fade_class);
	if(x){
		object_obex_store((void *)x, _sym_dumpout, (object *)outlet_new(x, NULL));	// dumpout
		
		x->numChannels = 1;
		if(attrstart && argv){
			int argument = atom_getlong(argv);
			x->numChannels = TTClip(argument, 1, MAX_NUM_CHANNELS);
		}
		
		dsp_setup((t_pxobject *)x, (x->numChannels * 2) + 1);	// Create Object and N Inlets (last argument)
		x->x_obj.z_misc = Z_NO_INPLACE;  					// ESSENTIAL!   		
		for(i=0; i< (x->numChannels); i++)
			outlet_new((t_pxobject *)x, "signal");			// Create a signal Outlet   		
		
		//x->xfade = new TTCrossfade(x->numChannels);			// Constructors
		TTObjectBaseInstantiate(TT("crossfade"),	&x->xfade,			x->numChannels);
		TTObjectBaseInstantiate(kTTSym_audiosignal,	&x->audioIn1,		x->numChannels);
		TTObjectBaseInstantiate(kTTSym_audiosignal,	&x->audioIn2,		x->numChannels);
		TTObjectBaseInstantiate(kTTSym_audiosignal,	&x->audioInControl,	x->numChannels);
		TTObjectBaseInstantiate(kTTSym_audiosignal,	&x->audioOut,		x->numChannels);
		
		x->xfade->setAttributeValue(TT("mode"), TT("lookup"));
		x->xfade->setAttributeValue(TT("shape"), TT("equalPower"));
		x->xfade->setAttributeValue(TT("position"), 0.5);
		
		attr_args_process(x, argc, argv);					// handle attribute args				
	}
	return (x);												// Return the pointer
}

// Destroy
void fade_free(t_fade *x)
{
	dsp_free((t_pxobject *)x);		// Always call dsp_free first in this routine
	
	TTObjectBaseRelease(&x->xfade);
	TTObjectBaseRelease(&x->audioIn1);
	TTObjectBaseRelease(&x->audioIn2);
	TTObjectBaseRelease(&x->audioInControl);
	TTObjectBaseRelease(&x->audioOut);
}


/************************************************************************************/
// Methods bound to input/inlets

// Method for Assistance Messages
void fade_assist(t_fade *x, void *b, long msg, long arg, char *dst)
{
	if(msg==1){ 	// Inlets
		if(arg < x->numChannels) 
			snprintf(dst, 256, "(signal) Input A - channel %ld", arg + 1); 		
		else if(arg < x->numChannels*2) 
			snprintf(dst, 256, "(signal) Input B - channel %ld", arg - x->numChannels + 1); 
		else 
			strcpy(dst, "(float/signal) Crossfade Position");
	}
	else if(msg==2){ // Outlets
		if(arg < x->numChannels) 
			snprintf(dst, 256, "(signal) Mix between A and B - channel %ld", arg + 1);
		else 
			strcpy(dst, "dumpout");
	}
}


// Float Method
void fade_float(t_fade *x, double value)
{
	x->attr_position = value;
	x->xfade->setAttributeValue(TT("position"), value);
}


// ATTRIBUTE: position
t_max_err attr_set_position(t_fade *x, void *attr, long argc, t_atom *argv)
{
	fade_float(x, atom_getfloat(argv));
	return MAX_ERR_NONE;
}


// ATTRIBUTE: shape
t_max_err attr_set_shape(t_fade *x, void *attr, long argc, t_atom *argv)
{
	x->attr_shape = atom_getlong(argv);
	if(x->attr_shape == 0) 
		x->xfade->setAttributeValue(TT("shape"), TT("equalPower"));
	else if(x->attr_shape == 2)  
	    x->xfade->setAttributeValue(TT("shape"), TT("squareRoot"));
	else
		x->xfade->setAttributeValue(TT("shape"), TT("linear"));
	
	return MAX_ERR_NONE;
}


// ATTRIBUTE: mode
t_max_err attr_set_mode(t_fade *x, void *attr, long argc, t_atom *argv)
{
	x->attr_mode = atom_getlong(argv);
	if(x->attr_mode == 0) 
		x->xfade->setAttributeValue(TT("Mode"), TT("lookup"));
	else 
		x->xfade->setAttributeValue(TT("Mode"), TT("calculate"));
	
	return MAX_ERR_NONE;
}


// control rate fading
t_int *fade_perform1(t_int *w)
{
   	t_fade		*x = (t_fade *)(w[1]);
	short		i, j;
	TTUInt8		numChannels = x->audioIn1->getNumChannelsAsInt();
	TTUInt16	vs = x->audioIn1->getVectorSizeAsInt();
	
	for(i=0; i<numChannels; i++){
		j = (i*3) + 1;
		x->audioIn1->setVector(i, vs, (t_float *)(w[j+1]));
		x->audioIn2->setVector(i, vs, (t_float *)(w[j+2]));
	}
	
	x->xfade->process(*x->audioIn1, *x->audioIn2, *x->audioOut);
	
	for(i=0; i<numChannels; i++){
		j = (i*3) + 1;
		x->audioOut->getVector(i, vs, (t_float *)(w[j+3]));
	}
	
	return w + ((numChannels*3)+2);
}

void fade_perform64_1(t_fade *x, t_object *dsp64, double **ins, long numins, double **outs, long numouts, long sampleframes, long flags, void *userparam)
{
	short		i;
	TTUInt8		numChannels = x->audioIn1->getNumChannelsAsInt();
	TTUInt16	vs = x->audioIn1->getVectorSizeAsInt();
	
	for(i=0; i<numChannels; i++){		
		x->audioIn1->setVector(i, vs, ins[i]);
		x->audioIn2->setVector(i, vs, ins[i+numChannels]);
	}
	
	x->xfade->process(*x->audioIn1, *x->audioIn2, *x->audioOut);
	
	for(i=0; i<numChannels; i++)
		x->audioOut->getVectorCopy(i, vs, outs[i]);
}

// signal rate fading
t_int *fade_perform2(t_int *w)
{
   	t_fade		*x = (t_fade *)(w[1]);
	short		i, j;
	TTUInt16	numChannels = x->audioIn1->getNumChannelsAsInt();
	TTUInt16	vs = x->audioIn1->getVectorSizeAsInt();
	
	for(i=0; i<numChannels; i++){
		j = (i*3) + 1;
		x->audioIn1->setVector(i, vs, (t_float *)(w[j+1]));
		x->audioIn2->setVector(i, vs, (t_float *)(w[j+2]));
	}
	object_attr_setfloat(x, _sym_position, *((t_float *)(w[(numChannels*3)+2])));
	
	x->xfade->process(*x->audioIn1, *x->audioIn2, *x->audioOut);
	
	for(i=0; i<numChannels; i++){
		j = (i*3) + 1;
		x->audioOut->getVector(i, vs, (t_float *)(w[j+3]));
	}
	
	return w + ((numChannels*3)+3);
	
}

void fade_perform64_2(t_fade *x, t_object *dsp64, double **ins, long numins, double **outs, long numouts, long sampleframes, long flags, void *userparam)
{
	short		i;
	TTUInt16	numChannels = x->audioIn1->getNumChannelsAsInt();
	TTUInt16	vs = x->audioIn1->getVectorSizeAsInt();
	
	for(i=0; i<numChannels; i++){
		x->audioIn1->setVector(i, vs, ins[i]);
		x->audioIn2->setVector(i, vs, ins[i+numChannels]);
	}
	//TOOO: we cast the signal to a float, if Max can handle 64bit attributes, we should change that
	object_attr_setfloat(x, _sym_position, (t_float)*ins[numChannels*2]);
	
	x->xfade->process(*x->audioIn1, *x->audioIn2, *x->audioOut);
	
	for(i=0; i<numChannels; i++)
		x->audioOut->getVectorCopy(i, vs, outs[i]);
}

// DSP Method
void fade_dsp(t_fade *x, t_signal **sp, short *count)
{
	short		i, j, k, l=0;
	void		**audioVectors = NULL;
	TTUInt8		numChannels = 0;
	TTUInt16	vs = 0;
	
	if(count[x->numChannels * 2])			// SIGNAL RATE CROSSFADE CONNECTED
		audioVectors = (void**)sysmem_newptr(sizeof(void*) * ((x->numChannels * 3) + 2));
	else									// CONTROL RATE CROSSFADE
		audioVectors = (void**)sysmem_newptr(sizeof(void*) * ((x->numChannels * 3) + 1));
	audioVectors[l] = x;
	l++;
	
	// audioVectors[] passed to balance_perform() as {x, audioInL[0], audioInR[0], audioOut[0], audioInL[1], audioInR[1], audioOut[1],...}
	for(i=0; i < x->numChannels; i++){
		j = x->numChannels + i;
		k = x->numChannels*2 + i + 1;	// + 1 to account for the position input
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
	
	if(count[x->numChannels * 2]){		// SIGNAL RATE CROSSFADE CONNECTED
		audioVectors[l] = sp[x->numChannels*2]->s_vec;
		l++;
	}
	
	x->audioIn1->setNumChannels(numChannels);
	x->audioIn2->setNumChannels(numChannels);
	x->audioOut->setNumChannels(numChannels);
	x->audioIn1->setVectorSizeWithInt(vs);
	x->audioIn2->setVectorSizeWithInt(vs);
	x->audioOut->setVectorSizeWithInt(vs);
	//audioIn will be set in the perform method
	x->audioOut->alloc();	
	
	x->xfade->setAttributeValue(kTTSym_sampleRate, sp[0]->s_sr);
	
	if(count[x->numChannels * 2])		// SIGNAL RATE CROSSFADE CONNECTED
		dsp_addv(fade_perform2, l, audioVectors);
	else
		dsp_addv(fade_perform1, l, audioVectors);
	
	sysmem_freeptr(audioVectors);
}

void fade_dsp64(t_fade *x, t_object *dsp64, short *count, double samplerate, long maxvectorsize, long flags)
{
	/*short		i, j, k;
	TTUInt8		numChannels = 0;	
	
	// audioVectors[] passed to balance_perform() as {x, audioInL[0], audioInR[0], audioOut[0], audioInL[1], audioInR[1], audioOut[1],...}
	for(i=0; i < x->numChannels; i++){
		j = x->numChannels + i;
		k = x->numChannels*2 + i + 1;	// + 1 to account for the position input
		if(count[i] && count[j] && count[k])
			numChannels++;			
	}
	x->audioIn1->setNumChannels(numChannels);
	x->audioIn2->setNumChannels(numChannels);
	x->audioOut->setNumChannels(numChannels);*/
	
	x->audioIn1->setNumChannels(x->numChannels);
	x->audioIn2->setNumChannels(x->numChannels);
	x->audioOut->setNumChannels(x->numChannels);
	x->audioIn1->setVectorSizeWithInt((TTUInt16)maxvectorsize);
	x->audioIn2->setVectorSizeWithInt((TTUInt16)maxvectorsize);
	x->audioOut->setVectorSizeWithInt((TTUInt16)maxvectorsize);
	//audioIn will be set in the perform method
	x->audioOut->alloc();	
	
	x->xfade->setAttributeValue(kTTSym_sampleRate, samplerate);
	
	if(count[x->numChannels * 2])		// SIGNAL RATE CROSSFADE CONNECTED
		object_method(dsp64, gensym("dsp_add64"), x, fade_perform64_2, 0, NULL);
	else
		object_method(dsp64, gensym("dsp_add64"), x, fade_perform64_1, 0, NULL);
}
