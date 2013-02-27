/* 
 * jcom.out (~) (TODO %)
 * External for Jamoma: manage any signal outputs
 * By Tim Place and Théo de la Hogue, Copyright © 2010
 * 
 * License: This code is licensed under the terms of the "New BSD License"
 * http://creativecommons.org/licenses/BSD/
 */

#include "TTModularClassWrapperMax.h"

#define signal_out 0
#define	dump_out 1

// This is used to store extra data
typedef struct extra {
	
	TTSymbol instance;		///< Output instance symbol
	
#ifdef JCOM_OUT_TILDE
	// Store extra data relating to envelope tracking. Only available to jcom.out~
	void		*clock;			///< Clock to update amplitude returns.
	TTUInt32	pollInterval;	///< The sample rate of the amplitude follower.
	TTFloat32	meter;			///< meter value
	TTFloat32	peak;			///< peak value
#endif
	
} t_extra;
#define EXTRA ((t_extra*)x->extra)


// Definitions

/** Wrap the jcom.out class as a Max object.
 @param c			The class to be wrapped
 @see				WrappedOutputClass_new, WrappedOutputClass_free
 */
void		WrapTTOutputClass(WrappedClassPtr c);

/** Wrapper for the jcom.out constructor class, called when an instance is created. 
 @param self		Pointer to this object.
 @param argc		The number of arguments passed to the object.
 @param argv		Pointer to an array of atoms passed to the object.
 @see				WrappedOutputClass_free, out_subscribe
 */
void		WrappedOutputClass_new(TTPtr self, AtomCount argc, AtomPtr argv);

/** Wrapper for the jcom.out deconstructor class, called when an instance is destroyed. 
 @param self		Pointer to this object.
 @see				WrappedOutputClass_new
 */
void		WrappedOutputClass_free(TTPtr self);

/** Assistance Method. 
 @param self		Pointer to this object.
 @param b			Pointer to (exactly what?)
 @param msg			The message passed to the object.
 @param arg			
 @param dst			Pointer to the destination that assistance strings are passed to for display.
 */
void		out_assist(TTPtr self, TTPtr b, long msg, AtomCount arg, char *dst);

/** Associate jcom.out(~) with NodeLib. This is a prerequisit for communication with other Jamoma object in the module and beyond.  */
void		out_subscribe(TTPtr self);

//TODO :	void out_register_preview(t_out *x, void *preview_object){ x->preview_object = preview_object; }

#ifdef JCOM_OUT_TILDE

/** jcom.out~ 32-bit MSP perform method (for Max 5). Only defined for jcom.out~. */
t_int*		out_perform(t_int *w);

/** jcom.out~ 32-bit DSP method (for Max 5).Only defined for jcom.out~. */
void		out_dsp(TTPtr self, t_signal **sp, short *count);

/** jcom.out~ 64-bit MSP perform method (for Max 6). Only defined for jcom.out~. */
void		out_perform64(TTPtr self, t_object *dsp64, double **ins, long numins, double **outs, long numouts, long sampleframes, long flags, void *userparam);

/** jcom.out~ 64-bit DSP method (for Max 6). Only defined for jcom.out~. */
void		out_dsp64(TTPtr self, t_object *dsp64, short *count, double samplerate, long maxvectorsize, long flags);

/** Activate envelope tracking in jcom.out~. 
 @param self		Pointer to this object.
 @param msg			The message sent to this object.
 @param argc		The number of arguments passed to the object.
 @param argv		Pointer to an array of atoms passed to the object.
 @see				out_update_amplitude
 */
void		out_return_amplitude_active(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);

/** Perform envelope tracking in jcom.out~.
 @param self		Pointer to this object.
 @see				out_return_amplitude_active
 */
void		out_update_amplitude(TTPtr self);

/** Method used to notify that a jcom.in is linked/unlinked to the jcom.out
 @param self		Pointer to this object.
 @param msg			The message sent to this object.
 @param argc		The number of arguments passed to the object.
 @param argv		Pointer to an array of atoms passed to the object.
 @see				out_subscribe
 */
void		out_return_link(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);

#else

/** Method used to pass messages from the module outlet. */
void		out_return_signal(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);

/** bang handler for jcom.out 
 @param self		Pointer to this object.
 @see				out_int, out_float, out_list, WrappedOutputClass_anything
 */
void		out_bang(TTPtr self);

/** int handler for jcom.out 
 @param self		Pointer to this object.
 @param value		The value sent to this object.
 @see				out_bang, out_float, out_list, WrappedOutputClass_anything
 */
void		out_int(TTPtr self, long value);

/** float handler for jcom.out 
 @param self		Pointer to this object.
 @param value		The value sent to this object.
 @see				out_bang, out_int, out_list, WrappedOutputClass_anything
 */
void		out_float(TTPtr self, double value);

/** list handler for jcom.out 
 @param self		Pointer to this object.
 @param msg			The message sent to this object.
 @param argc		The number of arguments passed to the object.
 @param argv		Pointer to an array of atoms passed to the object.
 @see				out_bang, out_int, out_float, WrappedOutputClass_anything
 */
void		out_list(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);

/** anything else handler for jcom.out 
 @param self		Pointer to this object.
 @param msg			The message sent to this object.
 @param argc		The number of arguments passed to the object.
 @param argv		Pointer to an array of atoms passed to the object.
 @see				out_bang, out_int, out_float, out_list
 */
void		WrappedOutputClass_anything(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);

#endif

#pragma mark -
#pragma mark main

int TTCLASSWRAPPERMAX_EXPORT main(void)
{
	ModularSpec *spec = new ModularSpec;
	spec->_wrap = &WrapTTOutputClass;
	spec->_new = &WrappedOutputClass_new;
	spec->_free = &WrappedOutputClass_free;
#ifndef JCOM_OUT_TILDE
	spec->_any = &WrappedOutputClass_anything;
#endif
	
#ifdef JCOM_OUT_TILDE
	return wrapTTModularClassAsMaxClass(kTTSym_Output, "jcom.out~", NULL, spec);
#else
	return wrapTTModularClassAsMaxClass(kTTSym_Output, "jcom.out", NULL, spec);
#endif
	
}

void WrapTTOutputClass(WrappedClassPtr c)
{
	class_addmethod(c->maxClass, (method)out_assist,						"assist",				A_CANT, 0L);
	
#ifdef JCOM_OUT_TILDE
	class_addmethod(c->maxClass, (method)out_dsp,							"dsp", 					A_GIMME, 0L);
	class_addmethod(c->maxClass, (method)out_dsp64,							"dsp64",				A_CANT, 0);
	
    class_addmethod(c->maxClass, (method)out_return_amplitude_active,		"return_amplitude_active",	A_CANT, 0);
	//class_addmethod(c, (method)out_getAudioForChannel,					"getAudioForChannel",	A_CANT, 0);
	class_addmethod(c->maxClass, (method)out_return_link,					"return_link",			A_CANT, 0);
	
#else
	class_addmethod(c->maxClass, (method)out_return_signal,					"return_signal",		A_CANT, 0);
	
	class_addmethod(c->maxClass, (method)out_bang,							"bang", 				0L);
	class_addmethod(c->maxClass, (method)out_int,							"int", 					A_LONG, 0L);
	class_addmethod(c->maxClass, (method)out_float,							"float", 				A_FLOAT, 0L);
	class_addmethod(c->maxClass, (method)out_list,							"list", 				A_GIMME, 0L);
#endif
		
    // no class_dspinit : it is done in wrapTTModularClassAsMaxClass for AUDIO_EXTERNAL
	
}

#pragma mark -
#pragma mark Object life

void WrappedOutputClass_new(TTPtr self, AtomCount argc, AtomPtr argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
 	long						attrstart = attr_args_offset(argc, argv);			// support normal arguments
	TTString					sInstance;
	TTValue						v;
	
	// Prepare extra data
	x->extra = (t_extra*)malloc(sizeof(t_extra));
	
	// Get input instance symbol
	if (attrstart && argv) {
		
		jamoma_ttvalue_from_Atom(v, _sym_nothing, attrstart, argv);
		
		v.toString();
		sInstance = TTString(v[0]);
		EXTRA->instance = TTSymbol(sInstance.data());
	}
	else
		EXTRA->instance = kTTSymEmpty;
	
	// Create Input Object and one outlet
	x->outlets = (TTHandle)sysmem_newptr(sizeof(TTPtr));
	
#ifdef JCOM_OUT_TILDE
	
	jamoma_output_create_audio((ObjectPtr)x, &x->wrappedObject);
	
	dsp_setup((t_pxobject *)x, 1);	
	x->obj.z_misc = Z_NO_INPLACE | Z_PUT_FIRST;
	
	outlet_new((t_pxobject *)x, "signal");
	
	// Prepare memory to store internal datas
	x->internals = new TTHash();
	
	// Prepare extra data for envelope tracking
	EXTRA->clock = NULL;
	EXTRA->pollInterval = 150;
	EXTRA->meter = 0.;
	EXTRA->peak = 0.;
	
#else
	
	jamoma_output_create((ObjectPtr)x, &x->wrappedObject);
	
	x->outlets[0] = outlet_new(x, 0L);
	
#endif
	
	// handle attribute args
	attr_args_process(x, argc, argv);
	
	// The following must be deferred because we have to interrogate our box,
	// and our box is not yet valid until we have finished instantiating the object.
	// Trying to use a loadbang method instead is also not fully successful (as of Max 5.0.6)
	defer_low((ObjectPtr)x, (method)out_subscribe, NULL, 0, NULL);
}

void WrappedOutputClass_free(TTPtr self)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	
#ifdef JCOM_OUT_TILDE
	dsp_free((t_pxobject *)x);				// Always call dsp_free first in this routine
	
	if (EXTRA->clock)
		freeobject((t_object *)EXTRA->clock);	// delete our clock
#endif
}

#pragma mark -
#pragma mark NodeLib association

void out_subscribe(TTPtr self)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTAddress	outputAddress;
	TTAddress	inputAddress;
	TTValue		v, args;
	TTNodePtr	returnedNode = NULL;
    TTNodePtr   returnedContextNode = NULL;
	TTAddress	returnedAddress, parentAddress;
	TTDataPtr	aData;
	TTString	formatDescription, sInstance;
	SymbolPtr	outDescription;
	
	outputAddress = TTAddress("out").appendInstance(EXTRA->instance);
	
	// if the subscription is successful
	if (!jamoma_subscriber_create((ObjectPtr)x, x->wrappedObject, outputAddress, &x->subscriberObject, returnedAddress, &returnedNode, &returnedContextNode)) {
		
		// get patcher
		x->patcherPtr = jamoma_patcher_get((ObjectPtr)x);
		
		// update instance symbol in case of duplicate instance
		EXTRA->instance = returnedAddress.getInstance();
		
		// observe /parent/in address in order to link/unlink with an Input object below
		returnedNode->getParent()->getAddress(parentAddress);
		inputAddress = parentAddress.appendAddress(TTAddress("in")).appendInstance(EXTRA->instance);
		x->wrappedObject->setAttributeValue(TTSymbol("inputAddress"), inputAddress);

#ifdef JCOM_OUT_TILDE
		
		// make internal data to return out/amplitude
		v = TTValue(0., 1.);
		formatDescription = "instant amplitude of %s output";
		
		sInstance = EXTRA->instance.c_str();
		jamoma_edit_string_instance(formatDescription, &outDescription, sInstance);
		
		makeInternals_data(x, returnedAddress, TTSymbol("amplitude"), NULL, x->patcherPtr, kTTSym_return, (TTObjectBasePtr*)&aData);
		aData->setAttributeValue(kTTSym_type, kTTSym_decimal);
		aData->setAttributeValue(kTTSym_tag, kTTSym_generic);
		aData->setAttributeValue(kTTSym_rangeBounds, v);
		aData->setAttributeValue(kTTSym_description, TTSymbol(outDescription->s_name));
		aData->setAttributeValue(kTTSym_dataspace, TTSymbol("gain"));
		aData->setAttributeValue(kTTSym_dataspaceUnit, TTSymbol("linear"));
		
		// make internal data to parameter out/amplitude/active
		makeInternals_data(x, returnedAddress, TTSymbol("amplitude/active"), gensym("return_amplitude_active"), x->patcherPtr, kTTSym_parameter, (TTObjectBasePtr*)&aData);
		aData->setAttributeValue(kTTSym_type, kTTSym_integer);
		aData->setAttributeValue(kTTSym_tag, kTTSym_generic);
		v = TTValue((int)EXTRA->pollInterval);
		aData->setAttributeValue(kTTSym_valueDefault, v);
		v = TTValue(0, 1000);
		aData->setAttributeValue(kTTSym_rangeBounds, v);
		aData->setAttributeValue(kTTSym_rangeClipmode, kTTSym_low);
		aData->setAttributeValue(kTTSym_description, TTSymbol("set the sample rate of the amplitude follower"));
		
		// launch the clock to update amplitude regulary
		EXTRA->clock = clock_new(x, (method)out_update_amplitude);
		if (EXTRA->pollInterval)
			clock_delay(EXTRA->clock, EXTRA->pollInterval);
		
#endif
		
		// expose attributes of TTOutput as TTData in the tree structure
		x->subscriberObject->exposeAttribute(x->wrappedObject, kTTSym_mute, kTTSym_parameter, &aData);
		aData->setAttributeValue(kTTSym_type, kTTSym_boolean);
		aData->setAttributeValue(kTTSym_tag, kTTSym_generic);
		aData->setAttributeValue(kTTSym_description, TTSymbol("When active, this attribute turns off model's outputs."));
		v = TTValue(NO);
		aData->setAttributeValue(kTTSym_valueDefault, v);

#ifdef JCOM_OUT_TILDE
		
		// note : the mix attribute is exposed only there is a jcom.in : see out_return_in method
		
		x->subscriberObject->exposeAttribute(x->wrappedObject, kTTSym_gain, kTTSym_parameter, &aData);
		aData->setAttributeValue(kTTSym_type, kTTSym_decimal);
		aData->setAttributeValue(kTTSym_tag, kTTSym_generic);
		v = TTValue(0., 127.);
		aData->setAttributeValue(kTTSym_rangeBounds, v);
		aData->setAttributeValue(kTTSym_rangeClipmode, kTTSym_both);
		v = TTValue(100.);
		aData->setAttributeValue(kTTSym_valueDefault, v);
		aData->setAttributeValue(kTTSym_rampDrive, TTSymbol("Max"));
		aData->setAttributeValue(kTTSym_rampFunction, TTSymbol("linear"));
		aData->setAttributeValue(kTTSym_description, TTSymbol("Set gain of model's outputs (as MIDI value by default)."));
#endif
		
#ifndef JCOM_OUT_TILDE		
		x->subscriberObject->exposeAttribute(x->wrappedObject, kTTSym_freeze, kTTSym_parameter, &aData);
		aData->setAttributeValue(kTTSym_type, kTTSym_boolean);
		aData->setAttributeValue(kTTSym_tag, kTTSym_generic);
		aData->setAttributeValue(kTTSym_description, TTSymbol("Freezes the last state of model's outputs from the  processing algorithm."));
		v = TTValue(NO);
		aData->setAttributeValue(kTTSym_valueDefault, v);
		
		x->subscriberObject->exposeAttribute(x->wrappedObject, kTTSym_preview, kTTSym_parameter, &aData);
		aData->setAttributeValue(kTTSym_type, kTTSym_boolean);
		aData->setAttributeValue(kTTSym_tag, kTTSym_generic);
		aData->setAttributeValue(kTTSym_description, TTSymbol("Turns on/off preview display of model's outputs from the  processing algorithm."));
		v = TTValue(NO);
		aData->setAttributeValue(kTTSym_valueDefault, v);
#endif
	}
}

#pragma mark -
#pragma mark Methods bound to input/inlets

// Method for Assistance Messages
void out_assist(TTPtr self, TTPtr b, long msg, AtomCount arg, char *dst)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	
	if (msg==1)				// Inlets
		strcpy(dst, "(signal) connect to the algorithm");
	else if (msg==2) {		// Outlets
		if (arg == 0) 
			strcpy(dst, "(signal) output of the model");
		else 
			strcpy(dst, "dumpout");
	}
}

#ifndef JCOM_OUT_TILDE
void out_bang(TTPtr self)
{
	out_list(self, _sym_bang, 0, NULL);
}

void out_int(TTPtr self, long value)
{
	t_atom a;
	
	atom_setlong(&a, value);
	out_list(self, _sym_int, 1, &a);
}

void out_float(TTPtr self, double value)
{
	t_atom a;
	
	atom_setfloat(&a, value);
	out_list(self, _sym_float, 1, &a);
}

void out_list(TTPtr self, t_symbol *msg, long argc, t_atom *argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	
	jamoma_output_send((TTOutputPtr)x->wrappedObject, msg, argc, argv);
}

void WrappedOutputClass_anything(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	
	jamoma_output_send((TTOutputPtr)x->wrappedObject, msg, argc, argv);
}

void out_return_signal(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	
	// avoid blank before data
	if (msg == _sym_nothing)
		outlet_atoms(x->outlets[signal_out], argc, argv);
	else
		outlet_anything(x->outlets[signal_out], msg, argc, argv);
}
#endif

#pragma mark -
#pragma mark Methods relating to audio processing

#ifdef JCOM_OUT_TILDE
// Perform Method - just pass the whole vector straight through
// (the work is all done in the dsp method)
t_int *out_perform(t_int *w)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)(w[1]);
	TTOutputPtr					anOutput = (TTOutputPtr)x->wrappedObject;
	TTInputPtr					anInput = anOutput->mInputObject;
	TTUInt16					vectorSize = 0;
	
	if (anOutput) {
		
		// get signal vectorSize
		anOutput->mSignalIn->getAttributeValue(kTTSym_vectorSize, vectorSize);
		
		// Store the input from the inlet
		TTAudioSignalPtr(anOutput->mSignalIn)->setVector(0, vectorSize, (TTFloat32*)w[2]);
		
		// if the output signal is muted
		if (anOutput->mMute)
			TTAudioSignal::copy(*TTAudioSignalPtr(anOutput->mSignalZero), *TTAudioSignalPtr(anOutput->mSignalOut));
		
		// if input signal exists
		else if (anInput) {
			
			// if input signal is bypassed : copy input (in Temp)
			if (anInput->mBypass)
				TTAudioSignal::copy(*TTAudioSignalPtr(anInput->mSignalIn), *TTAudioSignalPtr(anOutput->mSignalTemp));
			
			// otherwise mix input and output signals (in Temp)
			else 
				TTAudioObjectBasePtr(anOutput->mMixUnit)->process(TTAudioSignalPtr(anInput->mSignalOut), TTAudioSignalPtr(anOutput->mSignalIn), TTAudioSignalPtr(anOutput->mSignalTemp));	

			// then perform gain control (from Temp)
			TTAudioObjectBasePtr(anOutput->mGainUnit)->process(TTAudioSignalPtr(anOutput->mSignalTemp), TTAudioSignalPtr(anOutput->mSignalOut));
			
		}
		// otherwise just perform gain control
		else
			TTAudioObjectBasePtr(anOutput->mGainUnit)->process(TTAudioSignalPtr(anOutput->mSignalIn), TTAudioSignalPtr(anOutput->mSignalOut));
		
		// Send signal on to the outlets 
		TTAudioSignalPtr(anOutput->mSignalOut)->getVector(0, vectorSize, (TTFloat32*)w[3]);
		
		// metering
		if (!anOutput->mMute) {
            
            TTUInt16				n = vectorSize;
            TTFloat32				currentvalue = 0;
            TTFloat32				peakvalue = 0.0;
            t_float*                envelope = (t_float *)(w[3]);
			
			while (n--) {
				if ((*envelope) < 0 )						// get the current sample's absolute value
					currentvalue = -(*envelope);
				else
					currentvalue = *envelope;
				
				if (currentvalue > peakvalue) 				// if it's a new peak amplitude...
					peakvalue = currentvalue;
				envelope++; 								// increment pointer in the vector
			}
			
			// set meter
			EXTRA->meter = peakvalue;
			
			// set peak
			if (peakvalue > EXTRA->peak)
				EXTRA->peak = peakvalue;
		}
	}
	
	return w + 4;
}


// Perform Method 64 bit - just pass the whole vector straight through
// (the work is all done in the dsp 64 bit method)
void out_perform64(TTPtr self, t_object *dsp64, double **ins, long numins, double **outs, long numouts, long sampleframes, long flags, void *userparam)
{
    WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
    TTOutputPtr					anOutput = (TTOutputPtr)x->wrappedObject;
    TTInputPtr					anInput = anOutput->mInputObject;
    TTUInt16					vectorSize = 0;

    // get numChannels and vectorSize
    if (anOutput) {
        
        // get signal vectorSize
        anOutput->mSignalIn->getAttributeValue(kTTSym_vectorSize, vectorSize);
        
        // Store the input from the inlets
        TTAudioSignalPtr(anOutput->mSignalIn)->setVector64Copy(0, vectorSize, ins[0]);
        
        // if the output signal is muted
		if (anOutput->mMute)
			TTAudioSignal::copy(*TTAudioSignalPtr(anOutput->mSignalZero), *TTAudioSignalPtr(anOutput->mSignalOut));
		
		// if input signal exists
		else if (anInput) {
			
			// if input signal is bypassed : copy input (in Temp)
			if (anInput->mBypass)
				TTAudioSignal::copy(*TTAudioSignalPtr(anInput->mSignalIn), *TTAudioSignalPtr(anOutput->mSignalTemp));
			
			// otherwise mix input and output signals (in Temp)
			else
				TTAudioObjectBasePtr(anOutput->mMixUnit)->process(TTAudioSignalPtr(anInput->mSignalOut), TTAudioSignalPtr(anOutput->mSignalIn), TTAudioSignalPtr(anOutput->mSignalTemp));
            
			// then perform gain control (from Temp)
			TTAudioObjectBasePtr(anOutput->mGainUnit)->process(TTAudioSignalPtr(anOutput->mSignalTemp), TTAudioSignalPtr(anOutput->mSignalOut));
		}
		// otherwise just perform gain control
		else 
			TTAudioObjectBasePtr(anOutput->mGainUnit)->process(TTAudioSignalPtr(anOutput->mSignalIn), TTAudioSignalPtr(anOutput->mSignalOut));
        
        // Send the input on to the outlets for the algorithm
        TTAudioSignalPtr(anOutput->mSignalOut)->getVectorCopy(0, vectorSize, outs[0]);

        // metering
        if (!anOutput->mMute) {
            
            TTUInt16				n = vectorSize;
            TTFloat32				currentvalue = 0;
            TTFloat32				peakvalue = 0.0;
            TTSampleValue*          envelope = outs[0];
            
			while (n--) {
				if ((*envelope) < 0 )						// get the current sample's absolute value
					currentvalue = -(*envelope);
				else
					currentvalue = *envelope;
				
				if (currentvalue > peakvalue) 				// if it's a new peak amplitude...
					peakvalue = currentvalue;
				envelope++; 								// increment pointer in the vector
			}
			
			// set meter
			EXTRA->meter = peakvalue;
			
			// set peak
			if (peakvalue > EXTRA->peak)
				EXTRA->peak = peakvalue;
        }
    }
}

// DSP Method
void out_dsp(TTPtr self, t_signal **sp, short *count)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTOutputPtr					anOutput = (TTOutputPtr)x->wrappedObject;
	void**						audioVectors = NULL;
	TTUInt16					vectorSize = sp[0]->s_n;
	int							sr = sp[0]->s_sr;
	
	if (anOutput) {
		
		anOutput->mRampGainUnit->setAttributeValue(kTTSym_sampleRate, sr);	// convert midi to db for tap_gain
		anOutput->mGainUnit->setAttributeValue(TTSymbol("interpolated"), 1);
		anOutput->mRampMixUnit->setAttributeValue(kTTSym_sampleRate, sr);	// convert midi to db for tap_gain
		
		audioVectors = (void**)sysmem_newptr(sizeof(void*) * 3);
		audioVectors[0] = x;
		
		if (count[0] || count[1]) {
			if (sp[0]->s_n > vectorSize)
				vectorSize = sp[0]->s_n;
			
			audioVectors[1] = sp[0]->s_vec;
			audioVectors[2] = sp[1]->s_vec;
		}
		
		// set signal numChannels and vectorSize
		anOutput->mSignalIn->setAttributeValue(kTTSym_numChannels, 1);
		anOutput->mSignalOut->setAttributeValue(kTTSym_numChannels, 1);
		anOutput->mSignalTemp->setAttributeValue(kTTSym_numChannels, 1);
		anOutput->mSignalZero->setAttributeValue(kTTSym_numChannels, 1);
		
		anOutput->mSignalIn->setAttributeValue(kTTSym_vectorSize, vectorSize);
		anOutput->mSignalOut->setAttributeValue(kTTSym_vectorSize, vectorSize);
		anOutput->mSignalTemp->setAttributeValue(kTTSym_vectorSize, vectorSize);
		anOutput->mSignalZero->setAttributeValue(kTTSym_vectorSize, vectorSize);
		
		// anOutput->mSignalIn will be set in the perform method
		anOutput->mSignalOut->sendMessage(kTTSym_alloc);
		anOutput->mSignalTemp->sendMessage(kTTSym_alloc);
		anOutput->mSignalZero->sendMessage(kTTSym_alloc);
		anOutput->mSignalZero->sendMessage(kTTSym_clear);
		
		dsp_addv(out_perform, 3, audioVectors);
		sysmem_freeptr(audioVectors);
	}
}

// DSP64 method
void out_dsp64(TTPtr self, t_object *dsp64, short *count, double samplerate, long maxvectorsize, long flags)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTOutputPtr					anOutput = (TTOutputPtr)x->wrappedObject;

	if (anOutput) {
		
		anOutput->mRampGainUnit->setAttributeValue(kTTSym_sampleRate, samplerate);	// convert midi to db for tap_gain
		anOutput->mGainUnit->setAttributeValue(TTSymbol("interpolated"), 1);
		anOutput->mRampMixUnit->setAttributeValue(kTTSym_sampleRate, samplerate);	// convert midi to db for tap_gain
		
		anOutput->mSignalIn->setAttributeValue(kTTSym_numChannels, 1);
		anOutput->mSignalOut->setAttributeValue(kTTSym_numChannels, 1);
		anOutput->mSignalTemp->setAttributeValue(kTTSym_numChannels, 1);
		anOutput->mSignalZero->setAttributeValue(kTTSym_numChannels, 1);
		
		anOutput->mSignalIn->setAttributeValue(kTTSym_vectorSize, (TTUInt16)maxvectorsize);
		anOutput->mSignalOut->setAttributeValue(kTTSym_vectorSize, (TTUInt16)maxvectorsize);
		anOutput->mSignalTemp->setAttributeValue(kTTSym_vectorSize, (TTUInt16)maxvectorsize);
		anOutput->mSignalZero->setAttributeValue(kTTSym_vectorSize, (TTUInt16)maxvectorsize);
		
		// anOutput->mSignalIn will be set in the perform method
		anOutput->mSignalOut->sendMessage(kTTSym_alloc);
		anOutput->mSignalTemp->sendMessage(kTTSym_alloc);
		anOutput->mSignalZero->sendMessage(kTTSym_alloc);
		anOutput->mSignalZero->sendMessage(kTTSym_clear);
		
		object_method(dsp64, gensym("dsp_add64"), x, out_perform64, 0, NULL); 
	}
}

void out_return_amplitude_active(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	WrappedModularInstancePtr x = (WrappedModularInstancePtr)self;
	TTBoolean clockStopped;
	
	if (argc && argv) {
		
		clockStopped = EXTRA->pollInterval == 0;
		
		EXTRA->pollInterval = atom_getlong(argv);
		
		// start our clock
		if (clockStopped && EXTRA->pollInterval)
			clock_delay(EXTRA->clock, EXTRA->pollInterval);
	}
}

void out_update_amplitude(TTPtr self)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTOutputPtr		anOutput = (TTOutputPtr)x->wrappedObject;
	TTValue			v, storedObject;
	TTObjectBasePtr		anObject;
	TTErr			err;
	
	if (anOutput) {
		
		if (x->internals) {
			if (!x->internals->isEmpty()) {
				
				// get internal data object used to return amplitude
				err = x->internals->lookup(TTSymbol("amplitude"), storedObject);
				
				if (!err) {
					
					anObject = storedObject[0];
					
					// set current meter value
					anObject->setAttributeValue(kTTSym_value, EXTRA->meter);
				}
			}
		}
		
		// restart the clock
		if (EXTRA->pollInterval)
			clock_delay(EXTRA->clock, EXTRA->pollInterval);
	}
}

void out_return_link(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTDataPtr		aData;
	TTValue			v;
	
	if (atom_getlong(argv) == 1) {
		
		x->subscriberObject->exposeAttribute(x->wrappedObject, kTTSym_mix, kTTSym_parameter, &aData);
		aData->setAttributeValue(kTTSym_type, kTTSym_decimal);
		aData->setAttributeValue(kTTSym_tag, kTTSym_generic);
		v = TTValue(0., 100.);
		aData->setAttributeValue(kTTSym_rangeBounds, v);
		aData->setAttributeValue(kTTSym_rangeClipmode, kTTSym_both);
		v = TTValue(100.);
		aData->setAttributeValue(kTTSym_valueDefault, v);							// Assume 100%, so that processed signal is passed through
		aData->setAttributeValue(kTTSym_rampDrive, TTSymbol("Max"));
		aData->setAttributeValue(kTTSym_rampFunction, TTSymbol("linear"));
		aData->setAttributeValue(kTTSym_description, TTSymbol("Controls the wet/dry mix in percent."));
	}
	else 
		x->subscriberObject->unexposeAttribute(kTTSym_mix);
}

#endif // JCOM_OUT_TILDE
