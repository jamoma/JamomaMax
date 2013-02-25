/* 
 *	tt.ramp~
 *	External object for Max/MSP
 *	
 *	Example project for TTBlue
 *	Copyright © 2008 by Timothy Place
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


// Data Structure for this object
typedef struct _ramp {
    t_pxobject			obj;
	TTAudioObjectBasePtr	ramp;
	TTAudioSignalPtr	audioOut;
	t_symbol*			attrMode;
	TTUInt16			maxNumChannels;
	TTUInt16			vs;
} t_ramp;


// Prototypes for methods: need a method for each incoming message type
void*		ramp_new(t_symbol *msg, short argc, t_atom *argv);					// New Object Creation Method
void		ramp_free(t_ramp *x);
void		ramp_assist(t_ramp *x, void *b, long msg, long arg, char *dst);	// Assistance Method
t_int*		ramp_perform(t_int *w);												// An MSP Perform (signal) Method
void		ramp_dsp(t_ramp *x, t_signal **sp, short *count);					// DSP Method
void		ramp_dsp64(t_ramp *x, t_object *dsp64, short *count, double samplerate, long maxvectorsize, long flags); // DSP64 Method
void		ramp_stop(t_ramp *x);
void		ramp_int(t_ramp *x, long newCurrentValue);
void		ramp_float(t_ramp *x, double newCurrentValue);
void		ramp_list(t_ramp *x, double endValue, double time);
t_max_err	ramp_setMode(t_ramp *x, void *attr, long argc, t_atom *argv);


// Globals
t_class *ramp_class;				// Required. Global pointing to this class


/************************************************************************************/
// Main() Function

int TTCLASSWRAPPERMAX_EXPORT main(void)
{
	long attrflags = 0;
	t_class *c;
	t_object *attr;
	
	TTDSPInit();	
	common_symbols_init();

	c = class_new("jcom.ramp~",(method)ramp_new, (method)ramp_free, (short)sizeof(t_ramp), 
		(method)0L, A_GIMME, 0);

    class_addmethod(c, (method)ramp_int,				"int",		A_FLOAT, 0L);
    class_addmethod(c, (method)ramp_float,				"float",	A_FLOAT, 0L);
    class_addmethod(c, (method)ramp_list,				"list",		A_FLOAT, A_FLOAT);
 	class_addmethod(c, (method)ramp_stop,				"stop",		0L);		
 	class_addmethod(c, (method)ramp_dsp,				"dsp",		A_CANT, 0L);
	class_addmethod(c, (method)ramp_dsp64,				"dsp64",	A_CANT, 0);
	class_addmethod(c, (method)ramp_assist,				"assist",	A_CANT, 0L); 
    class_addmethod(c, (method)object_obex_dumpout,		"dumpout", 	A_CANT, 0);

	attr = attr_offset_new("mode", _sym_symbol, attrflags,
		(method)0L, (method)ramp_setMode, calcoffset(t_ramp, attrMode));
	class_addattr(c, attr);
	
	class_dspinit(c);						// Setup object's class to work with MSP
	class_register(CLASS_BOX, c);
	ramp_class = c;
	return 0;
}


/************************************************************************************/
// Object Creation Method

void* ramp_new(t_symbol *msg, short argc, t_atom *argv)
{
    t_ramp	*x;
	TTValue		sr(sys_getsr());
 	long		attrstart = attr_args_offset(argc, argv);		// support normal arguments
	short		i;
   
    x = (t_ramp *)object_alloc(ramp_class);
    if(x){
		x->maxNumChannels = 2;		// An initial argument to this object will set the maximum number of channels
		if(attrstart && argv)
			x->maxNumChannels = atom_getlong(argv);

		ttEnvironment->setAttributeValue(kTTSym_sampleRate, sr);
		//x->ramp = new TTRamp(x->maxNumChannels);
		TTObjectBaseInstantiate(TT("ramp"), &x->ramp, x->maxNumChannels);
		TTObjectBaseInstantiate(TT("audiosignal"), &x->audioOut, x->maxNumChannels);

		attr_args_process(x,argc,argv);				// handle attribute args	
				
    	object_obex_store((void *)x, _sym_dumpout, (object *)outlet_new(x,NULL));	// dumpout	
	    dsp_setup((t_pxobject *)x, x->maxNumChannels);								// inlets
		for(i=0; i < x->maxNumChannels; i++)
			outlet_new((t_pxobject *)x, "signal");									// outlets
		
		x->obj.z_misc = Z_NO_INPLACE;
	}
	return (x);										// Return the pointer
}

// Memory Deallocation
void ramp_free(t_ramp *x)
{
	dsp_free((t_pxobject *)x);
	TTObjectBaseRelease(&x->ramp);
	TTObjectBaseRelease(&x->audioOut);
}


/************************************************************************************/
// Methods bound to input/inlets

// Method for Assistance Messages
void ramp_assist(t_ramp *x, void *b, long msg, long arg, char *dst)
{
	if(msg==1){ 	// Inlets
		if(arg == 0)
			strcpy(dst, "(signal) input 1, control messages");					
		else 
			snprintf(dst, 256, "(signal) input %ld", arg+1); 
	}
	else if(msg==2){ // Outlets
		if(arg == x->maxNumChannels)
			strcpy(dst, "dumpout");					
		else 
			snprintf(dst, 256, "(signal) Filtered output %ld", arg+1); 
	}
}


void ramp_stop(t_ramp *x)
{
	x->ramp->sendMessage(TT("stop"));
}


void ramp_int(t_ramp *x, long newCurrentValue)
{
	ramp_float(x, newCurrentValue);
}

void ramp_float(t_ramp *x, double newCurrentValue)
{
	x->ramp->setAttributeValue(TT("startValue"), newCurrentValue);
}

void ramp_list(t_ramp *x, double endValue, double time)
{
	x->ramp->setAttributeValue(TT("destinationValue"), endValue);
	x->ramp->setAttributeValue(TT("rampTime"), time);
}


// Perform (signal) Method
t_int *ramp_perform(t_int *w)
{	
	t_ramp *x = (t_ramp *)(w[1]);
			
	if(!(x->obj.z_disabled))
		x->ramp->process(*x->audioOut);

	//TTAUDIOSIGNAL_GETVECTOR32(x->audioOut, 0, x->vs, w[2]);
	x->audioOut->getVector(0, x->vs, (t_float *)(w[2]));

    return w+3;
}


// DSP Method
void ramp_dsp(t_ramp *x, t_signal **sp, short *count)
{
	x->ramp->setAttributeValue(TT("sampleRate"), sp[0]->s_sr);
	x->vs = sp[0]->s_n;
	
	x->audioOut->setAttributeValue(TT("numChannels"), x->maxNumChannels);
	x->audioOut->setAttributeValue(TT("vectorSize"), TTUInt16(sp[0]->s_n));
	x->audioOut->sendMessage(TT("alloc"));

	dsp_add(ramp_perform, 2, x, sp[0]->s_vec);
}


t_max_err ramp_setMode(t_ramp *x, void *attr, long argc, t_atom *argv)
{
	if(argc){
		x->attrMode = atom_getsym(argv);
		if(x->attrMode == gensym("sample_accurate"))
			x->ramp->setAttributeValue(TT("mode"), TT("sample"));
		else if(x->attrMode == gensym("vector_accurate"))
			x->ramp->setAttributeValue(TT("mode"), TT("vector"));
	}
	return MAX_ERR_NONE;
}

void ramp_perform64(t_ramp *x, t_object *dsp64, double **ins, long numins, double **outs, long numouts, long sampleframes, long flags, void *userparam)
{
	x->ramp->process(*x->audioOut);
	x->audioOut->getVector(0, x->vs, outs[0]);
}

void ramp_dsp64(t_ramp *x, t_object *dsp64, short *count, double samplerate, long maxvectorsize, long flags)
{
	x->ramp->setAttributeValue(TT("sampleRate"), samplerate);
	x->vs = maxvectorsize;
	
	x->audioOut->setAttributeValue(TT("numChannels"), x->maxNumChannels);
	x->audioOut->setAttributeValue(TT("vectorSize"), (TTUInt16) maxvectorsize);
	x->audioOut->sendMessage(TT("alloc"));
	object_method(dsp64, gensym("dsp_add64"), x, ramp_perform64, 0, NULL);
}

