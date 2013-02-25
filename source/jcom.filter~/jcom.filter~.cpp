/* 
 *	tt.filter~
 *	External object for Max/MSP
 *	Wannabe Max wrapper (external) for all filter units in ttblue
 *	Example project for TTBlue
 *	Copyright © 2008 by Timothy Place & Trond Lossius
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

#include "TTDSP.h"						// TTBlue Interfaces...

#define DEFAULT_F 1000
#define DEFAULT_Q 18


/** Data structure for the tt.filter~ object. */
typedef struct _filter	{
    t_pxobject 				obj;						///< REQUIRED: The MSP 'base class'
	TTAudioObjectBasePtr		filter;						///< The TTBlue filter unit used
	TTAudioSignalPtr		audioIn;					///< The TTBlue audio signal object that is used for filter input
	TTAudioSignalPtr		audioOut;					///< The TTBlue audio signal object that us used for filter output
	TTUInt16				maxNumChannels;				///< The maximum number of audio channels permitted
	TTUInt16				numChannels;				///< The actual number of audio channels used
	TTUInt16				vs;							///< The vector size (number of samples per processing block)
	long					sr;							///< The sample rate
	long					attrBypass;					///< ATTRIBUTE: Bypass filtering
	TTFloat64				attrFrequency;				///< ATTRIBUTE: Filter cutoff or center frequency, depending on the kind of filter
	TTFloat64				attrQ;						///< ATTRIBUTE: Filter resonance
	t_symbol				*attrType;					///< ATTRIBUTE: what kind of filter to use
	t_symbol				*attrMode;					// Most filters don't have this attribute...
} t_filter;


// Prototypes for methods: need a method for each incoming message type

/** New object create method. */
void*		filter_new(t_symbol *msg, short argc, t_atom *argv);

/** Free memory etc. when an object is destroyed. */
void		filter_free(t_filter *x);

/** Assist strings for object inlets and outlets. */
void		filter_assist(t_filter *x, void *b, long msg, long arg, char *dst);

/** This method is called on each audio vector: Frequency and resonance set at control rate. */
t_int*		filter_perform(t_int *w);

/** This method is called on each audio vector: Frequency set at signal rate. */
t_int*		filter_perform_freq(t_int *w);

/** This method is called on each audio vector: Resonance set at signal rate. */
t_int*		filter_perform_q(t_int *w);

/** This method is called on each audio vector: Frequency and resonance set at signal rate. */
t_int*		filter_perform_freq_q(t_int *w);

/** This method is called when audio is started in order to compile the audio chain. */
void		filter_dsp(t_filter *x, t_signal **sp, short *count);
void		filter_dsp64(t_filter *x, t_object *dsp64, short *count, double samplerate, long maxvectorsize, long flags); // DSP64 Method

/** Clear the filter in case it has blown up (NaN). */
void		filter_clear(t_filter *x);

/** Method setting the value of the bypass attribute. */
t_max_err	filter_setBypass(t_filter *x, void *attr, long argc, t_atom *argv);

/** Method setting the value of the frequency attribute. */
t_max_err 	filter_setFrequency(t_filter *x, void *attr, long argc, t_atom *argv);

/** Method setting the value of the resonance (Q) attribute. */
t_max_err 	filter_setQ(t_filter *x, void *attr, long argc, t_atom *argv);

/** Method setting the type of the filter to use. */
t_max_err 	filter_setType(t_filter *x, void *attr, long argc, t_atom *argv);

/**	Spew the available filter names to the dumpout for a umenu. */
void filter_gettypes(t_filter *x);


t_max_err filter_setMode(t_filter *x, void *attr, long argc, t_atom *argv);


// Globals
t_class *filter_class;				// Required. Global pointing to this class


/************************************************************************************/
// Main() Function

int TTCLASSWRAPPERMAX_EXPORT main(void)
{
	t_class *c;
	
	common_symbols_init();
	TTDSPInit();

	c = class_new("jcom.filter~",(method)filter_new, (method)filter_free, sizeof(t_filter), (method)0L, A_GIMME, 0);

	class_addmethod(c, (method)filter_gettypes,			"getTypes",		0L);
 	class_addmethod(c, (method)filter_clear, 			"clear",		0L);		
 	class_addmethod(c, (method)filter_dsp, 				"dsp",			A_CANT, 0L);	
	class_addmethod(c, (method)filter_dsp64,				"dsp64",		A_CANT, 0);
	class_addmethod(c, (method)filter_assist, 			"assist",		A_CANT, 0L); 
	class_addmethod(c, (method)object_obex_dumpout,		"dumpout",		A_CANT, 0);  
	class_addmethod(c, (method)stdinletinfo,			"inletinfo",	A_CANT, 0);

	CLASS_ATTR_LONG(c,		"bypass",		0,	t_filter, attrBypass);
	CLASS_ATTR_ACCESSORS(c,	"bypass",		NULL, filter_setBypass);
	CLASS_ATTR_STYLE(c,		"bypass",		0, "onoff");

	CLASS_ATTR_FLOAT(c,		"frequency",	0,	t_filter, attrFrequency);
	CLASS_ATTR_ACCESSORS(c,	"frequency",	NULL, filter_setFrequency);

	CLASS_ATTR_FLOAT(c,		"q",	0,	t_filter, attrQ);
	CLASS_ATTR_ACCESSORS(c,	"q",	NULL, filter_setQ);

	CLASS_ATTR_SYM(c,		"type",	0,	t_filter, attrType);
	CLASS_ATTR_ACCESSORS(c,	"type",	NULL, filter_setType);

	CLASS_ATTR_SYM(c,		"mode",	0,	t_filter, attrMode);
	CLASS_ATTR_ACCESSORS(c,	"mode",	NULL, filter_setMode);

	class_dspinit(c);
	class_register(CLASS_BOX, c);
	filter_class = c;

	return 0;
}


/************************************************************************************/
// Object Creation Method

void* filter_new(t_symbol *msg, short argc, t_atom *argv)
{
    t_filter	*x;
	TTValue		sr(sys_getsr());
 	long		attrstart = attr_args_offset(argc, argv);		// support normal arguments
	short		i;
   
    x = (t_filter *)object_alloc(filter_class);
    if(x){
		// Setting default attribute values
		x->attrBypass = 0;
		x->attrFrequency = DEFAULT_F;
		x->attrQ = DEFAULT_Q;
		x->attrMode = _sym_nothing;
		
		x->maxNumChannels = 2;		// An initial argument to this object will set the maximum number of channels
		if(attrstart && argv)
			x->maxNumChannels = atom_getlong(argv);

		x->sr = sr;
		ttEnvironment->setAttributeValue(kTTSym_sampleRate, sr);
		object_attr_setsym(x, _sym_type, gensym("lowpass.butterworth.2"));

		TTObjectBaseInstantiate(kTTSym_audiosignal, &x->audioIn, x->maxNumChannels);
		TTObjectBaseInstantiate(kTTSym_audiosignal, &x->audioOut, x->maxNumChannels);

		attr_args_process(x,argc,argv);				// handle attribute args	

    	object_obex_store((void *)x, _sym_dumpout, (object *)outlet_new(x,NULL));	// dumpout	
	    dsp_setup((t_pxobject *)x, x->maxNumChannels + 2);		// inlets: signals + freq + q
		for(i=0; i < x->maxNumChannels; i++)
			outlet_new((t_pxobject *)x, "signal");				// outlets
		
		x->obj.z_misc = Z_NO_INPLACE;
	}
	return (x);										// Return the pointer
}

// Memory Deallocation
void filter_free(t_filter *x)
{
	dsp_free((t_pxobject *)x);
	TTObjectBaseRelease(&x->filter);
	TTObjectBaseRelease(&x->audioIn);
	TTObjectBaseRelease(&x->audioOut);
}


/************************************************************************************/
// Methods bound to input/inlets

// Method for Assistance Messages
void filter_assist(t_filter *x, void *b, long msg, long arg, char *dst)
{ 
	if(msg==1){ 	// Inlets		
		if(arg == x->maxNumChannels)
			strcpy(dst, "(signal) Frequency");
		else if(arg == x->maxNumChannels+1)
			strcpy(dst, "(signal) Q-value");
		else if(arg == 0)
			strcpy(dst, "(signal) input 1, control messages");
		else if(arg < x->maxNumChannels)
			snprintf(dst, 256, "(signal) input %ld", arg+1);
		}
				
	else if(msg==2) {// Outlets		
		if(arg == x->maxNumChannels)
			strcpy(dst, "dumpout");					
		else 
			snprintf(dst, 256, "(signal) Filtered output %ld", arg+1);  
		}		
}


void filter_clear(t_filter *x)
{
	x->filter->sendMessage(TT("clear"));
}


void filter_gettypes(t_filter *x)
{
	TTValue		v;
	t_atom		a[2];
	
	atom_setsym(a, _sym_clear);
	object_obex_dumpout(x, gensym("types"), 1, a);
	atom_setsym(a, _sym_append);
	
	TTGetRegisteredClassNamesForTags(v, TT("filter"));
	for(TTUInt16 i=0; i<v.getSize(); i++){
		TTSymbol classname;
		v.get(i, classname);
		atom_setsym(a+1, gensym((char*)classname.c_str()));
		object_obex_dumpout(x, gensym("types"), 2, a);
	}
}


t_max_err filter_setBypass(t_filter *x, void *attr, long argc, t_atom *argv)
{
	if(argc){
		x->attrBypass = atom_getlong(argv);
		x->filter->setAttributeValue(kTTSym_bypass, (TTBoolean)x->attrBypass);
	}
	return MAX_ERR_NONE;
}

t_max_err filter_setFrequency(t_filter *x, void *attr, long argc, t_atom *argv)
{
	if(argc){
		x->attrFrequency = atom_getfloat(argv);
		x->filter->setAttributeValue(TT("frequency"), x->attrFrequency);
	}
	return MAX_ERR_NONE;
}

t_max_err filter_setQ(t_filter *x, void *attr, long argc, t_atom *argv)
{
	TTErr err = kTTErrNone;
	
	if(argc){
		x->attrQ = atom_getfloat(argv);
		err = x->filter->setAttributeValue(TT("q"), x->attrQ);
		if(err == kTTErrInvalidAttribute)
			err = x->filter->setAttributeValue(TT("resonance"), x->attrQ);
	}
	return MAX_ERR_NONE;
}


t_max_err filter_setType(t_filter *x, void *attr, long argc, t_atom *argv)
{	
	if(argc){
		if(x->attrType != atom_getsym(argv)){	// if it hasn't changed, then jump to the end...
			TTErr	err = kTTErrNone;

			x->attrType = atom_getsym(argv);
			TTObjectBaseInstantiate(TT(x->attrType->s_name), &x->filter, x->maxNumChannels);			
			if(x->filter){
				// Now that we have our new filter, update it with the current state of the external:
				x->filter->setAttributeValue(TT("frequency"), x->attrFrequency);
				err = x->filter->setAttributeValue(TT("q"), x->attrQ);
				if(err == kTTErrInvalidAttribute)
					err = x->filter->setAttributeValue(TT("resonance"), x->attrQ);
				x->filter->setAttributeValue(TT("mode"), x->attrMode->s_name);				
				x->filter->setAttributeValue(kTTSym_bypass, (TTBoolean)x->attrBypass);
				x->filter->setAttributeValue(kTTSym_sampleRate, (uint)x->sr);
			}
		}
	}
	return MAX_ERR_NONE;
}


t_max_err filter_setMode(t_filter *x, void *attr, long argc, t_atom *argv)
{	
	if (argc)
		x->attrMode = atom_getsym(argv);
		x->filter->setAttributeValue(TT("mode"), TT(x->attrMode->s_name));
	return MAX_ERR_NONE;
}


/************************************************************************************/
// Audio perform methods

// Perform (signal) Method: Frequency and q at control rate
t_int *filter_perform(t_int *w)
{
   	t_filter	*x = (t_filter *)(w[1]);
	short		i, j;
	TTUInt16	vs = x->audioIn->getVectorSizeAsInt();
	
	for(i=0; i<x->numChannels; i++){
		j = (i*2) + 1;
		x->audioIn->setVector(i, vs, (t_float *)w[j+1]);
	}

	if(!x->obj.z_disabled)									// if we are not muted...
		x->filter->process(x->audioIn, x->audioOut);		// Actual Filter process

	for(i=0; i<x->numChannels; i++){
		j = (i*2) + 1;
		x->audioOut->getVector(i, vs, (t_float *)w[j+2]);
	}

	return w + ((x->numChannels*2)+2);				// +2 = +1 for the x pointer and +1 to point to the next object
}


// Perform (signal) Method: Frequency at signal rate
t_int *filter_perform_freq(t_int *w)
{
   	t_filter*	x = (t_filter *)(w[1]);
	short		i, j;
	t_float*	freq;
	TTUInt16	vs = x->audioIn->getVectorSizeAsInt();
	
	for(i=0; i<x->numChannels; i++){
		j = (i*2) + 1;
		x->audioIn->setVector(i, vs, (t_float *)w[j+1]);
	}
	j = (i*2) + 2;
	freq = (t_float*)w[j];

	if(!x->obj.z_disabled){
		x->attrFrequency = *freq;
		x->filter->setAttributeValue(TT("frequency"), x->attrFrequency);
		x->filter->process(x->audioIn, x->audioOut);
	}

	for(i=0; i<x->numChannels; i++){
		j = (i*2) + 1;
		x->audioOut->getVector(i, vs, (t_float *)w[j+2]);
	}

	return w + ((x->numChannels*2)+3);				// +2 = +1 for the x pointer and +1 to point to the next object
}


// Perform (signal) Method: q at signal rate
t_int *filter_perform_q(t_int *w)
{
   	t_filter*	x = (t_filter *)(w[1]);
	short		i, j;
	t_float*	q;
	TTUInt16	vs = x->audioIn->getVectorSizeAsInt();
	
	for(i=0; i<x->numChannels; i++){
		j = (i*2) + 1;
		x->audioIn->setVector(i, vs, (t_float *)w[j+1]);
	}
	q = (t_float*)w[(i*2) + 2];

	if(!x->obj.z_disabled){
		x->attrQ = *q;
		x->filter->setAttributeValue(TT("q"), x->attrQ);
		x->filter->process(x->audioIn, x->audioOut);
	}

	for(i=0; i<x->numChannels; i++){
		j = (i*2) + 1;
		x->audioOut->getVector(i, vs, (t_float *)w[j+2]);
	}

	return w + ((x->numChannels*2)+3);				// +2 = +1 for the x pointer and +1 to point to the next object
}


// Perform (signal) Method: Frequency and q at signal rate
t_int *filter_perform_freq_q(t_int *w)
{
   	t_filter*	x = (t_filter *)(w[1]);
	short		i, j;
	t_float*	freq;
	t_float*	q;
	TTUInt16	vs = x->audioIn->getVectorSizeAsInt();
	
	for(i=0; i<x->numChannels; i++){
		j = (i*2) + 1;
		x->audioIn->setVector(i, vs, (t_float *)w[j+1]);
	}
	freq = (t_float*)w[(i*2) + 2];
	q = (t_float*)w[(i*2) + 3];

	if(!x->obj.z_disabled){
		x->attrFrequency = *freq;
		x->attrQ = *q;
		x->filter->setAttributeValue(TT("frequency"), x->attrFrequency);
		x->filter->setAttributeValue(TT("q"), x->attrQ);
		x->filter->process(x->audioIn, x->audioOut);
	}

	for(i=0; i<x->numChannels; i++){
		j = (i*2) + 1;
		x->audioOut->getVector(i, vs, (t_float *)w[j+2]);
	}

	return w + ((x->numChannels*2)+4);				// +2 = +1 for the x pointer and +1 to point to the next object
}
/************************************************************************************/
// Audio perform64 methods

// Perform (signal) Method: Frequency and q at control rate
void filter_perform64(t_filter *x, t_object *dsp64, double **ins, long numins, double **outs, long numouts, long sampleframes, long flags, void *userparam)
{
	short	i;
	TTUInt16	vs = x->audioIn->getVectorSizeAsInt();
	
	for(i=0; i<x->numChannels; i++)
		x->audioIn->setVector(i, vs, ins[i]);
		
	x->filter->process(x->audioIn, x->audioOut);		// Actual Filter process
	
	for(i=0; i<x->numChannels; i++)
		x->audioOut->getVectorCopy(i, vs, outs[i]);	
}


// Perform (signal) Method: Frequency at signal rate
void filter_perform64_freq(t_filter *x, t_object *dsp64, double **ins, long numins, double **outs, long numouts, long sampleframes, long flags, void *userparam)

{
   	short			i;
	TTUInt16		vs = x->audioIn->getVectorSizeAsInt();
	TTSampleValue*	freq;
	
	for(i=0; i<x->numChannels; i++)
		x->audioIn->setVector(i, vs, ins[i]);

	freq = ins[i];		
	x->attrFrequency = *freq;
	x->filter->setAttributeValue(TT("frequency"), x->attrFrequency);
	x->filter->process(x->audioIn, x->audioOut);
		
	for(i=0; i<x->numChannels; i++)
		x->audioOut->getVectorCopy(i, vs, outs[i]);	
	
}


// Perform (signal) Method: q at signal rate
void filter_perform64_q(t_filter *x, t_object *dsp64, double **ins, long numins, double **outs, long numouts, long sampleframes, long flags, void *userparam)
{
	short		i;
	TTSampleValue*	q;
	TTUInt16	vs = x->audioIn->getVectorSizeAsInt();
	
	for(i=0; i<x->numChannels; i++)
		x->audioIn->setVector(i, vs, ins[i]);
	
	q = ins[i+1];	
	x->attrQ = *q;
	x->filter->setAttributeValue(TT("q"), x->attrQ);
	x->filter->process(x->audioIn, x->audioOut);
	
	for(i=0; i<x->numChannels; i++)
		x->audioOut->getVectorCopy(i, vs, outs[i]);	
}

// Perform (signal) Method: Frequency and q at signal rate
void filter_perform64_freq_q(t_filter *x, t_object *dsp64, double **ins, long numins, double **outs, long numouts, long sampleframes, long flags, void *userparam)
{
	short		i;
	TTSampleValue*	freq;
	TTSampleValue*	q;
	TTUInt16	vs = x->audioIn->getVectorSizeAsInt();
	
	for(i=0; i<x->numChannels; i++)
		x->audioIn->setVector(i, vs, ins[i]);
	
	freq = ins[i];
	q	 = ins[i+1];	
	x->attrFrequency = *freq;
	x->attrQ = *q;
	x->filter->setAttributeValue(TT("frequency"), x->attrFrequency);
	x->filter->setAttributeValue(TT("q"), x->attrQ);
	x->filter->process(x->audioIn, x->audioOut);
	
	
	for(i=0; i<x->numChannels; i++)
		x->audioOut->getVectorCopy(i, vs, outs[i]);		
}

/************************************************************************************/
// DSP Setup

// DSP Method
void filter_dsp(t_filter *x, t_signal **sp, short *count)
{
	short		i, j, k=0;
	void		**audioVectors = NULL;
	bool		hasFreq = false;
	bool		hasQ = false;
	
	audioVectors = (void**)sysmem_newptr(sizeof(void*) * ((x->maxNumChannels * 2) + 1));
	audioVectors[k] = x;
	k++;
	
	x->numChannels = 0;
	x->vs = 0;
	for(i=0; i < x->maxNumChannels; i++){
		j = x->maxNumChannels + i + 2;
		if(count[i] && count[j]){
			x->numChannels++;
			if(sp[i]->s_n > x->vs)
				x->vs = sp[i]->s_n;
				
			audioVectors[k] = sp[i]->s_vec;
			k++;
			audioVectors[k] = sp[j]->s_vec;
			k++;
		}
	}
	if(count[x->maxNumChannels]){					// frequency inlet
		audioVectors[k] = sp[x->maxNumChannels]->s_vec;
		k++;
		hasFreq = true;
	}
	if(count[x->maxNumChannels+1]){					// q inlet
		audioVectors[k] = sp[x->maxNumChannels+1]->s_vec;
		k++;
		hasQ = true;
	}
	
	x->audioIn->setAttributeValue(kTTSym_numChannels, x->numChannels);
	x->audioOut->setAttributeValue(kTTSym_numChannels, x->numChannels);
	x->audioIn->setAttributeValue(kTTSym_vectorSize, x->vs);
	x->audioOut->setAttributeValue(kTTSym_vectorSize, x->vs);
	//audioIn will be set in the perform method
	x->audioOut->sendMessage(kTTSym_alloc);

	x->sr = sp[0]->s_sr;	
	x->filter->setAttributeValue(kTTSym_sampleRate, sp[0]->s_sr);
	
	if(hasFreq && hasQ)
		dsp_addv(filter_perform_freq_q, k, audioVectors);
	else if(hasFreq)
		dsp_addv(filter_perform_freq, k, audioVectors);
	else if(hasQ)
		dsp_addv(filter_perform_q, k, audioVectors);
	else
		dsp_addv(filter_perform, k, audioVectors);

	sysmem_freeptr(audioVectors);
}

void filter_dsp64(t_filter *x, t_object *dsp64, short *count, double samplerate, long maxvectorsize, long flags)
{
	short		i, j;
	bool		hasFreq = false;
	bool		hasQ = false;
	
	x->numChannels = 0;
	x->vs = maxvectorsize;
	
	for(i=0; i < x->maxNumChannels; i++){
		j = x->maxNumChannels + i + 2;
		if(count[i] && count[j])
			x->numChannels++;		
	}
	
	if(count[x->maxNumChannels])					// frequency inlet
		hasFreq = true;
	
	if(count[x->maxNumChannels+1])					// q inlet
		hasQ = true;	
	
	x->audioIn->setAttributeValue(kTTSym_numChannels, x->numChannels);
	x->audioOut->setAttributeValue(kTTSym_numChannels, x->numChannels);
	x->audioIn->setAttributeValue(kTTSym_vectorSize, x->vs);
	x->audioOut->setAttributeValue(kTTSym_vectorSize, x->vs);
	//audioIn will be set in the perform method
	x->audioOut->sendMessage(kTTSym_alloc);
	
	x->sr = samplerate;	
	x->filter->setAttributeValue(kTTSym_sampleRate, samplerate);
	
	if(hasFreq && hasQ)
		object_method(dsp64, gensym("dsp_add64"), x, filter_perform64_freq_q, 0, NULL);
	else if(hasFreq)
		object_method(dsp64, gensym("dsp_add64"), x, filter_perform64_freq, 0, NULL);
	else if(hasQ)
		object_method(dsp64, gensym("dsp_add64"), x, filter_perform64_q, 0, NULL);
	else
		object_method(dsp64, gensym("dsp_add64"), x, filter_perform64, 0, NULL);	
}

