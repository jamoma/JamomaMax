/** @file
 *
 * @ingroup implementationMaxExternals
 *
 * @brief j.in & j.in~ - Manage control and audio inputs for a Jamoma model
 *
 * @details
 *
 * @authors Tim Place, Théo de la Hogue, Nils Peters, Trond Lossius
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
	
	TTSymbol    instance;		///< Input instance symbol
    ObjectPtr   modelOrView;    ///< the j.model or j.view object of our patcher
	
} t_extra;
#define EXTRA ((t_extra*)x->extra)


// Definitions

/** Wrap the j.in class as a Max object.
 @param c			The class to be wrapped
 @see				WrappedInputClass_new, WrappedInputClass_free
 */
void		WrapTTInputClass(WrappedClassPtr c);

/** Wrapper for the j.in constructor class, called when an instance is created. 
 @param self		Pointer to this object.
 @param argc		The number of arguments passed to the object.
 @param argv		Pointer to an array of atoms passed to the object.
 @see				WrappedInputClass_free, in_subscribe
 */
void		WrappedInputClass_new(TTPtr self, AtomCount argc, AtomPtr argv);

/** Wrapper for the j.in deconstructor class, called when an instance is destroyed. 
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

/** Associate j.in(~) with NodeLib. This is a prerequisit for communication with other Jamoma object in the module and beyond.  */
void		in_subscribe(TTPtr self);

#ifdef JCOM_IN_TILDE

/** j.in~ 64-bit MSP perform method (for Max 6). Only defineed for j.in~. */
void		in_perform64(TTPtr self, t_object *dsp64, double **ins, long numins, double **outs, long numouts, long sampleframes, long flags, void *userparam);

/** j.in~ 64-bit DSP method (for Max 6). Only defineed for j.in~. */
void		in_dsp64(TTPtr self, t_object *dsp64, short *count, double samplerate, long maxvectorsize, long flags);

#else

/** bang handler for j.in 
 @param self		Pointer to this object.
 @see				in_int, in_float, in_list, WrappedInputClass_anything
 */
void		in_bang(TTPtr self);

/** int handler for j.in 
 @param self		Pointer to this object.
 @param value		The value sent to this object.
 @see				in_bang, in_float, in_list, WrappedInputClass_anything
 */
void		in_int(TTPtr self, long value);

/** float handler for j.in 
 @param self		Pointer to this object.
 @param value		The value sent to this object.
 @see				in_bang, in_int, in_list, WrappedInputClass_anything
 */
void		in_float(TTPtr self, double value);

/** list handler for j.in 
 @param self		Pointer to this object.
 @param msg			The message sent to this object.
 @param argc		The number of arguments passed to the object.
 @param argv		Pointer to an array of atoms passed to the object.
 @see				in_bang, in_int, in_float, WrappedInputClass_anything
 */
void		in_list(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);

/** Method used to pass messages from the module outlet. */
void		in_return_signal(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);

#endif

/** anything else handler for j.in
 @param self		Pointer to this object.
 @param msg			The message sent to this object.
 @param argc		The number of arguments passed to the object.
 @param argv		Pointer to an array of atoms passed to the object.
 @see				in_bang, in_int, in_float, in_list
 */
void		WrappedInputClass_anything(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);


#pragma mark -
#pragma mark main

int TTCLASSWRAPPERMAX_EXPORT main(void)
{
	ModularSpec *spec = new ModularSpec;
	spec->_wrap = &WrapTTInputClass;
	spec->_new = &WrappedInputClass_new;
	spec->_free = &WrappedInputClass_free;
	spec->_any = &WrappedInputClass_anything;

#ifdef JCOM_IN_TILDE
	return wrapTTModularClassAsMaxClass(kTTSym_InputAudio, "j.in~", NULL, spec);
#else
	return wrapTTModularClassAsMaxClass(kTTSym_Input, "j.in", NULL, spec);
#endif
	
}

void WrapTTInputClass(WrappedClassPtr c)
{
	class_addmethod(c->maxClass, (method)in_assist,						"assist",				A_CANT, 0L);
	
#ifdef JCOM_IN_TILDE
	class_addmethod(c->maxClass, (method)in_dsp64,						"dsp64",				A_CANT, 0);
	
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
    
    // set no model or view by default
    EXTRA->modelOrView = NULL;
		
	// Create Input Object and one outlet
	x->outlets = (TTHandle)sysmem_newptr(sizeof(TTPtr));
		
#ifdef JCOM_IN_TILDE

	jamoma_input_create_audio((ObjectPtr)x, &x->wrappedObject);
	 
	dsp_setup((t_pxobject *)x, 1);	
	x->obj.z_misc = Z_NO_INPLACE | Z_PUT_FIRST;
	
	outlet_new((t_pxobject *)x, "signal");
	
	// Prepare memory to store internal datas
	x->internals = new TTHash();
	
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
	
#endif
}

#pragma mark -
#pragma mark NodeLib association

void in_subscribe(TTPtr self)
{
	WrappedModularInstancePtr x = (WrappedModularInstancePtr)self;
    TTAddress   signalAddress;
	TTAddress   inputAddress;
	TTAddress   outputAddress;
	TTValue		v, args;
	TTNodePtr	returnedNode = NULL;
    TTNodePtr   returnedContextNode = NULL;
	TTAddress   returnedAddress, parentAddress;
	TTString	formatDescription, sInstance;
	
#ifdef JCOM_IN_TILDE
    signalAddress = TTAddress("audio");
#else
    signalAddress = TTAddress("data");
#endif

    // edit "signal/in.instance" address
    inputAddress = signalAddress.appendAddress(TTAddress("in")).appendInstance(EXTRA->instance);

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
	}
}


#pragma mark -
#pragma mark Methods bound to input/inlets

// Method for Assistance Messages
void in_assist(TTPtr self, TTPtr b, long msg, AtomCount arg, char *dst)
{
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

void WrappedInputClass_anything(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTInputPtr	anInput = (TTInputPtr)x->wrappedObject;
    
    // route any message to the model
    if (msg != _sym_nothing && msg != gensym("jit_matrix")) {
        
        if (!EXTRA->modelOrView) {
            
            // get model or view object
            jamoma_patcher_get_model_or_view(x->patcherPtr, &EXTRA->modelOrView);
        }
        
        object_method_typed(EXTRA->modelOrView, msg, argc, argv, NULL);
        return;
    }
	
	if (!anInput->mMute)
		jamoma_input_send(anInput, msg, argc, argv);
}

#pragma mark -
#pragma mark Methods relating to audio processing

#ifdef JCOM_IN_TILDE

// Perform Method 64 bit - just pass the whole vector straight through
// (the work is all done in the dsp 64 bit method)
void in_perform64(TTPtr self, t_object *dsp64, double **ins, long numins, double **outs, long numouts, long sampleframes, long flags, void *userparam)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTInputAudioPtr				anInput = (TTInputAudioPtr)x->wrappedObject;
    
	if (anInput)
		anInput->process(ins[0], outs[0], sampleframes);
}


// DSP64 method
void in_dsp64(TTPtr self, t_object *dsp64, short *count, double samplerate, long maxvectorsize, long flags)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTInputAudioPtr				anInput = (TTInputAudioPtr)x->wrappedObject;
	
	if (anInput) {
		anInput->setupAudioSignals(maxvectorsize);
		object_method(dsp64, gensym("dsp_add64"), x, in_perform64, 0, NULL);
	}
}

#endif // JCOM_IN_TILDE
