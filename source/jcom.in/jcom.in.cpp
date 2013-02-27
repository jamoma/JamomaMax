/** @file
 *
 * @ingroup modularMax
 *
 * @brief Externals for Jamoma: jcom.in & jcom.in~ - Manage control and audio inputs for a module
 *
 * @details
 *
 * @authors Tim Place, Nils Peters, Trond Lossius
 *
 * @copyright Copyright © 2006 by Tim Place @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */

#include "TTModularClassWrapperMax.h"

#define signal_out 0
#define	dump_out 1

// This is used to store extra data
typedef struct extra {
	
	TTSymbol instance;		///< Input instance symbol

#ifdef JCOM_IN_TILDE
	// Store extra data relating to envelope tracking. Only available to jcom.in~
	void		*clock;			///< Clock to update amplitude returns
	TTUInt32	pollInterval;	///< The sample rate of the amplitude follower
	TTFloat32	meter;			///< meter value
	TTFloat32	peak;			///< peak value
#endif
	
} t_extra;
#define EXTRA ((t_extra*)x->extra)


// Definitions

/** Wrap the jcom.in class as a Max object.
 @param c			The class to be wrapped
 @see				WrappedInputClass_new, WrappedInputClass_free
 */
void		WrapTTInputClass(WrappedClassPtr c);

/** Wrapper for the jcom.in constructor class, called when an instance is created. 
 @param self		Pointer to this object.
 @param argc		The number of arguments passed to the object.
 @param argv		Pointer to an array of atoms passed to the object.
 @see				WrappedInputClass_free, in_subscribe
 */
void		WrappedInputClass_new(TTPtr self, AtomCount argc, AtomPtr argv);

/** Wrapper for the jcom.in deconstructor class, called when an instance is destroyed. 
 @param self		Pointer to this object.
 @see				WrappedInputClass_new
 */
void		WrappedInputClass_free(TTPtr self);

/** Assistance Method. 
 @param self		Pointer to this object.
 @param b			Pointer to (exactly what?)
 @param msg			The message passed to the object.
 @param arg			
 @param dst			Pointer to the destination that assistance strings are passed to for display.
 */
void		in_assist(TTPtr self, TTPtr b, long msg, AtomCount arg, char *dst);

/** Associate jcom.in(~) with NodeLib. This is a prerequisit for communication with other Jamoma object in the module and beyond.  */
void		in_subscribe(TTPtr self);

#ifdef JCOM_IN_TILDE

/** jcom.in~ 32-bit MSP perform method (for Max 5). Only defineed for jcom.in~. */
t_int*		in_perform(t_int *w);

/** jcom.in~ 32-bit DSP method (for Max 5).Only defineed for jcom.in~. */
void		in_dsp(TTPtr self, t_signal **sp, short *count);

/** jcom.in~ 64-bit MSP perform method (for Max 6). Only defineed for jcom.in~. */
void		in_perform64(TTPtr self, t_object *dsp64, double **ins, long numins, double **outs, long numouts, long sampleframes, long flags, void *userparam);

/** jcom.in~ 64-bit DSP method (for Max 6). Only defineed for jcom.in~. */
void		in_dsp64(TTPtr self, t_object *dsp64, short *count, double samplerate, long maxvectorsize, long flags);

/** Activate envelope tracking in jcom.in~. 
 @param self		Pointer to this object.
 @param msg			The message sent to this object.
 @param argc		The number of arguments passed to the object.
 @param argv		Pointer to an array of atoms passed to the object.
 @see				in_update_amplitude
 */
void		in_return_amplitude_active(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);

/** Perform envelope tracking in jcom.in~.
 @param self		Pointer to this object.
 @see				in_return_amplitude_active
 */
void		in_update_amplitude(TTPtr self);

#else

/** Method used to pass messages from the module outlet. */
void		in_return_signal(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);

/** bang handler for jcom.in 
 @param self		Pointer to this object.
 @see				in_int, in_float, in_list, WrappedInputClass_anything
 */
void		in_bang(TTPtr self);

/** int handler for jcom.in 
 @param self		Pointer to this object.
 @param value		The value sent to this object.
 @see				in_bang, in_float, in_list, WrappedInputClass_anything
 */
void		in_int(TTPtr self, long value);

/** float handler for jcom.in 
 @param self		Pointer to this object.
 @param value		The value sent to this object.
 @see				in_bang, in_int, in_list, WrappedInputClass_anything
 */
void		in_float(TTPtr self, double value);

/** list handler for jcom.in 
 @param self		Pointer to this object.
 @param msg			The message sent to this object.
 @param argc		The number of arguments passed to the object.
 @param argv		Pointer to an array of atoms passed to the object.
 @see				in_bang, in_int, in_float, WrappedInputClass_anything
 */
void		in_list(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);

/** anything else handler for jcom.in 
 @param self		Pointer to this object.
 @param msg			The message sent to this object.
 @param argc		The number of arguments passed to the object.
 @param argv		Pointer to an array of atoms passed to the object.
 @see				in_bang, in_int, in_float, in_list
 */
void		WrappedInputClass_anything(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);
#endif

#pragma mark -
#pragma mark main

int TTCLASSWRAPPERMAX_EXPORT main(void)
{
	ModularSpec *spec = new ModularSpec;
	spec->_wrap = &WrapTTInputClass;
	spec->_new = &WrappedInputClass_new;
	spec->_free = &WrappedInputClass_free;
#ifndef JCOM_IN_TILDE
	spec->_any = &WrappedInputClass_anything;
#endif

#ifdef JCOM_IN_TILDE
	return wrapTTModularClassAsMaxClass(kTTSym_Input, "jcom.in~", NULL, spec);
#else
	return wrapTTModularClassAsMaxClass(kTTSym_Input, "jcom.in", NULL, spec);
#endif
	
}

void WrapTTInputClass(WrappedClassPtr c)
{
	class_addmethod(c->maxClass, (method)in_assist,						"assist",				A_CANT, 0L);
	
#ifdef JCOM_IN_TILDE
	class_addmethod(c->maxClass, (method)in_dsp,						"dsp", 					A_CANT, 0L);
	class_addmethod(c->maxClass, (method)in_dsp64,						"dsp64",				A_CANT, 0);
	
	class_addmethod(c->maxClass, (method)in_return_amplitude_active,	"return_amplitude_active",	A_CANT, 0);
#else
	class_addmethod(c->maxClass, (method)in_return_signal,				"return_signal",		A_CANT, 0);
	
	class_addmethod(c->maxClass, (method)in_bang,						"bang", 				0L);
	class_addmethod(c->maxClass, (method)in_int,						"int", 					A_LONG, 0L);
	class_addmethod(c->maxClass, (method)in_float,						"float", 				A_FLOAT, 0L);
	class_addmethod(c->maxClass, (method)in_list,						"list", 				A_GIMME, 0L);
#endif
	
	// no class_dspinit : it is done in wrapTTModularClassAsMaxClass for AUDIO_EXTERNAL
}

#pragma mark -
#pragma mark Object life

void WrappedInputClass_new(TTPtr self, AtomCount argc, AtomPtr argv)
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
		
#ifdef JCOM_IN_TILDE

	jamoma_input_create_audio((ObjectPtr)x, &x->wrappedObject);
	 
	dsp_setup((t_pxobject *)x, 1);	
	x->obj.z_misc = Z_NO_INPLACE | Z_PUT_FIRST;
	
	outlet_new((t_pxobject *)x, "signal");
	
	// Prepare memory to store internal datas
	x->internals = new TTHash();
	
	// Prepare extra data for envelope tracking
	EXTRA->clock = NULL;
	EXTRA->pollInterval = 0;	// not active by default
	EXTRA->meter = 0.;
	EXTRA->peak = 0.;

#else
	
	jamoma_input_create((ObjectPtr)x, &x->wrappedObject);
	
	x->outlets[0] = outlet_new(x, 0L);
	
#endif
	
	// handle attribute args
	attr_args_process(x, argc, argv);

	// The following must be deferred because we have to interrogate our box,
	// and our box is not yet valid until we have finished instantiating the object.
	// Trying to use a loadbang method instead is also not fully successful (as of Max 5.0.6)
	defer_low((ObjectPtr)x, (method)in_subscribe, NULL, 0, NULL);
}

void WrappedInputClass_free(TTPtr self)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	
#ifdef JCOM_IN_TILDE
	dsp_free((t_pxobject *)x);					// Always call dsp_free first in this routine
	
	if (EXTRA->clock)
		freeobject((t_object *)EXTRA->clock);	// delete our clock
#endif
}

#pragma mark -
#pragma mark NodeLib association

void in_subscribe(TTPtr self)
{
	WrappedModularInstancePtr x = (WrappedModularInstancePtr)self;
	TTAddress   inputAddress;
	TTAddress   outputAddress;
	TTValue		v, args;
	TTNodePtr	returnedNode = NULL;
    TTNodePtr   returnedContextNode = NULL;
	TTAddress   returnedAddress, parentAddress;
	TTDataPtr	aData;
	TTString	formatDescription, sInstance;
	SymbolPtr	inDescription;
	
	inputAddress = TTAddress("in").appendInstance(EXTRA->instance);
	
	// if the subscription is successful
	if (!jamoma_subscriber_create((ObjectPtr)x, x->wrappedObject, inputAddress, &x->subscriberObject, returnedAddress, &returnedNode, &returnedContextNode)) {
		
		// get patcher
		x->patcherPtr = jamoma_patcher_get((ObjectPtr)x);
		
		// update instance symbol in case of duplicate instance
		EXTRA->instance = returnedAddress.getInstance();
		
		// observe /parent/out address in order to link/unlink with an Input object below
		returnedNode->getParent()->getAddress(parentAddress);
		outputAddress = parentAddress.appendAddress(TTAddress("out")).appendInstance(EXTRA->instance);
		x->wrappedObject->setAttributeValue(TTSymbol("outputAddress"), outputAddress);
		
#ifdef JCOM_IN_TILDE
		
		// make internal data to return amplitude
		v = TTValue(0., 1.);
		formatDescription = "instant amplitude of %s input";
		
		sInstance = EXTRA->instance.c_str();
		jamoma_edit_string_instance(formatDescription, &inDescription, sInstance);
			
		makeInternals_data(x, returnedAddress, TTSymbol("amplitude"), NULL, x->patcherPtr, kTTSym_return, (TTObjectBasePtr*)&aData);
		aData->setAttributeValue(kTTSym_type, kTTSym_decimal);
		aData->setAttributeValue(kTTSym_tag, kTTSym_generic);
		aData->setAttributeValue(kTTSym_rangeBounds, v);
		aData->setAttributeValue(kTTSym_description, TTSymbol(inDescription->s_name));
		aData->setAttributeValue(kTTSym_dataspace, TTSymbol("gain"));
		aData->setAttributeValue(kTTSym_dataspaceUnit, TTSymbol("linear"));
		
		// make internal data to parameter in/amplitude/active
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
		EXTRA->clock = clock_new(x, (method)in_update_amplitude);
		if (EXTRA->pollInterval)
			clock_delay(EXTRA->clock, EXTRA->pollInterval);
		
#endif
		
		// expose bypass and mute attributes of TTInput as TTData in the tree structure
		x->subscriberObject->exposeAttribute(x->wrappedObject, kTTSym_bypass, kTTSym_parameter, &aData);
		aData->setAttributeValue(kTTSym_type, kTTSym_boolean);
		aData->setAttributeValue(kTTSym_tag, kTTSym_generic);
		aData->setAttributeValue(kTTSym_description, TTSymbol("When active, this attribute bypasses the model's processing algtorithm, letting incoming signal pass through unaffected"));
		v = TTValue(0);
		aData->setAttributeValue(kTTSym_valueDefault, v);			
		
		x->subscriberObject->exposeAttribute(x->wrappedObject, kTTSym_mute, kTTSym_parameter, &aData);
		aData->setAttributeValue(kTTSym_type, kTTSym_boolean);
		aData->setAttributeValue(kTTSym_tag, kTTSym_generic);
		aData->setAttributeValue(kTTSym_description, TTSymbol("When active, this attribute turns off model's inputs."));
		v = TTValue(0);
		aData->setAttributeValue(kTTSym_valueDefault, v);
	}
}


#pragma mark -
#pragma mark Methods bound to input/inlets

// Method for Assistance Messages
void in_assist(TTPtr self, TTPtr b, long msg, AtomCount arg, char *dst)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	
	if (msg==1)				// Inlets
		strcpy(dst, "(signal) input of the model");
	else if (msg==2) {		// Outlets
		if (arg == 0) 
			strcpy(dst, "(signal) connect to the algorithm");
		else 
			strcpy(dst, "dumpout");
	}
}

#ifndef JCOM_IN_TILDE
void in_bang(TTPtr self)
{
	in_list(self, _sym_bang, 0, NULL);
}

void in_int(TTPtr self, long value)
{
	t_atom a;
	
	atom_setlong(&a, value);
	in_list(self, _sym_int, 1, &a);
}

void in_float(TTPtr self, double value)
{
	t_atom a;
	
	atom_setfloat(&a, value);
	in_list(self, _sym_float, 1, &a);
}

void in_list(TTPtr self, t_symbol *msg, long argc, t_atom *argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTInputPtr	anInput = (TTInputPtr)x->wrappedObject;
	
	if (!anInput->mMute)
		jamoma_input_send(anInput, msg, argc, argv);
}

void WrappedInputClass_anything(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTInputPtr	anInput = (TTInputPtr)x->wrappedObject;
	
	if (!anInput->mMute)
		jamoma_input_send(anInput, msg, argc, argv);
}

void in_return_signal(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
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

#ifdef JCOM_IN_TILDE
// Perform Method - just pass the whole vector straight through
// (the work is all done in the dsp method)
t_int *in_perform(t_int *w)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)(w[1]);
	TTInputPtr					anInput = (TTInputPtr)x->wrappedObject;
	TTAudioSignalPtr			sentSignal;
	TTUInt16					vectorSize = 0;
	
	if (anInput) {
		
		// get signal vectorSize
		anInput->mSignalIn->getAttributeValue(kTTSym_vectorSize, vectorSize);
		
		// Store the input from the inlets
		TTAudioSignalPtr(anInput->mSignalIn)->setVector(0, vectorSize, (TTFloat32*)w[2]);
		
		// if signal is bypassed or muted : send a zero signal to the algorithm
		if (anInput->mBypass || anInput->mMute)
            TTAudioSignal::copy(*TTAudioSignalPtr(anInput->mSignalZero), *TTAudioSignalPtr(anInput->mSignalOut));
        
		// else copy in to out
		else
            TTAudioSignal::copy(*TTAudioSignalPtr(anInput->mSignalIn), *TTAudioSignalPtr(anInput->mSignalOut));
		
		// sum signal from jcom.send~ objects
		if (anInput->mSignalCache) {
			
			for (anInput->mSignalCache->begin(); anInput->mSignalCache->end(); anInput->mSignalCache->next()) {
				
				sentSignal = TTAudioSignalPtr((TTObjectBasePtr)anInput->mSignalCache->current()[0]);
				
				if (sentSignal)
					*TTAudioSignalPtr(anInput->mSignalOut) += *sentSignal;
			}
		}
		
		// clear the signal cache
		anInput->mSignalCache->clear();
		
		// Send the input on to the outlets for the algorithm
		TTAudioSignalPtr(anInput->mSignalOut)->getVector(0, vectorSize, (TTFloat32*)w[3]);
		
		// metering
		if (!anInput->mMute) {
			
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
void in_perform64(TTPtr self, t_object *dsp64, double **ins, long numins, double **outs, long numouts, long sampleframes, long flags, void *userparam)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTInputPtr					anInput = (TTInputPtr)x->wrappedObject;
    TTAudioSignalPtr			sentSignal;
	TTUInt16					vectorSize = 0;
    
	if (anInput) {
		
		// get signal vectorSize
		anInput->mSignalIn->getAttributeValue(kTTSym_vectorSize, vectorSize);

		// Store the input from the inlets
		TTAudioSignalPtr(anInput->mSignalIn)->setVector64Copy(0, vectorSize, ins[0]);
		
		// if signal is bypassed or muted : send a zero signal to the algorithm
		if (anInput->mBypass || anInput->mMute)
            TTAudioSignal::copy(*TTAudioSignalPtr(anInput->mSignalZero), *TTAudioSignalPtr(anInput->mSignalOut));
        
		// else copy in to out and add remote signal
		else {
            
            TTAudioSignal::copy(*TTAudioSignalPtr(anInput->mSignalIn), *TTAudioSignalPtr(anInput->mSignalOut));
            
            // sum signal from jcom.send~ objects
            if (anInput->mSignalCache) {
                
                for (anInput->mSignalCache->begin(); anInput->mSignalCache->end(); anInput->mSignalCache->next()) {
                    
                    sentSignal = TTAudioSignalPtr((TTObjectBasePtr)anInput->mSignalCache->current()[0]);
                    
                    if (sentSignal)
                        *TTAudioSignalPtr(anInput->mSignalOut) += *sentSignal;
                }
            }
        }
		
		// clear the signal cache
		anInput->mSignalCache->clear();
		
		// Send the input on to the outlets for the algorithm
		TTAudioSignalPtr(anInput->mSignalOut)->getVectorCopy(0, vectorSize, outs[0]);
        
        // metering
		if (!anInput->mMute) {
			
            TTUInt16				n = vectorSize;;
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
void in_dsp(TTPtr self, t_signal **sp, short *count)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTInputPtr					anInput = (TTInputPtr)x->wrappedObject;
	void**						audioVectors = NULL;
	TTUInt16					vectorSize = 0;
	
	if (anInput) {
		
		audioVectors = (void**)sysmem_newptr(sizeof(void*) * 3);
		audioVectors[0] = x;

		if (count[0] || count[1]) {
			if (sp[0]->s_n > vectorSize)
				vectorSize = sp[0]->s_n;
			
			audioVectors[1] = sp[0]->s_vec;
			audioVectors[2] = sp[1]->s_vec;
		}
		
		// set signal numChannels and vectorSize
		anInput->mSignalIn->setAttributeValue(kTTSym_numChannels, 1);
		anInput->mSignalOut->setAttributeValue(kTTSym_numChannels, 1);
		anInput->mSignalIn->setAttributeValue(kTTSym_vectorSize, vectorSize);
		anInput->mSignalOut->setAttributeValue(kTTSym_vectorSize, vectorSize);
		
		// anInput->mSignalIn will be set in the perform method
		anInput->mSignalOut->sendMessage(kTTSym_alloc);
		
		dsp_addv(in_perform, 3, audioVectors);
		sysmem_freeptr(audioVectors);
	}
}

// DSP64 method
void in_dsp64(TTPtr self, t_object *dsp64, short *count, double samplerate, long maxvectorsize, long flags)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTInputPtr					anInput = (TTInputPtr)x->wrappedObject;
	
	if (anInput) {
		
		// set signal numChannels and vectorSize
		anInput->mSignalIn->setAttributeValue(kTTSym_numChannels, 1);
		anInput->mSignalOut->setAttributeValue(kTTSym_numChannels, 1);
        anInput->mSignalZero->setAttributeValue(kTTSym_numChannels, 1);
        
		anInput->mSignalIn->setAttributeValue(kTTSym_vectorSize, (TTUInt16)maxvectorsize);
		anInput->mSignalOut->setAttributeValue(kTTSym_vectorSize,(TTUInt16)maxvectorsize);
        anInput->mSignalZero->setAttributeValue(kTTSym_vectorSize, (TTUInt16)maxvectorsize);
		
		// mSignalIn will be set in the perform method
		anInput->mSignalOut->sendMessage(kTTSym_alloc);
        anInput->mSignalZero->sendMessage(kTTSym_alloc);
        anInput->mSignalZero->sendMessage(kTTSym_clear);
		
		object_method(dsp64, gensym("dsp_add64"), x, in_perform64, 0, NULL);
	}
}

void in_return_amplitude_active(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
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

void in_update_amplitude(TTPtr self)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTInputPtr		anInput = (TTInputPtr)x->wrappedObject;
	TTValue			storedObject;
	TTObjectBasePtr		anObject;
	TTErr			err;
	
	if (anInput) {
		
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

#endif // JCOM_IN_TILDE
