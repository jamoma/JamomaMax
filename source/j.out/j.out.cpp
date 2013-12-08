/** @file
 *
 * @ingroup implementationMaxExternals
 *
 * @brief j.out / j.out~ - Manage control and audio outputs for a Jamoma model
 *
 * @details
 *
 * @authors Tim Place, Théo de la Hogue, Trond Lossius
 *
 * @copyright Copyright © 2010 Tim Place and Théo de la Hogue @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */


#include "TTModularClassWrapperMax.h"

#define signal_out 0
#define	dump_out 1

// This is used to store extra data
typedef struct extra {
	
	TTSymbol instance;		///< Output instance symbol
	
} t_extra;
#define EXTRA ((t_extra*)x->extra)


// Definitions

/** Wrap the j.out class as a Max object.
 @param c			The class to be wrapped
 @see				WrappedOutputClass_new, WrappedOutputClass_free
 */
void		WrapTTOutputClass(WrappedClassPtr c);

/** Wrapper for the j.out constructor class, called when an instance is created. 
 @param self		Pointer to this object.
 @param argc		The number of arguments passed to the object.
 @param argv		Pointer to an array of atoms passed to the object.
 @see				WrappedOutputClass_free, out_subscribe
 */
void		WrappedOutputClass_new(TTPtr self, AtomCount argc, AtomPtr argv);

/** Wrapper for the j.out deconstructor class, called when an instance is destroyed. 
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

/** Associate j.out(~) with NodeLib. This is a prerequisit for communication with other Jamoma object in the module and beyond.  */
void		out_subscribe(TTPtr self);

//TODO :	void out_register_preview(t_out *x, void *preview_object){ x->preview_object = preview_object; }

#ifdef JCOM_OUT_TILDE

/** j.out~ 64-bit MSP perform method (for Max 6). Only defined for j.out~. */
void		out_perform64(TTPtr self, t_object *dsp64, double **ins, long numins, double **outs, long numouts, long sampleframes, long flags, void *userparam);

/** j.out~ 64-bit DSP method (for Max 6). Only defined for j.out~. */
void		out_dsp64(TTPtr self, t_object *dsp64, short *count, double samplerate, long maxvectorsize, long flags);

#else

/** Method used to pass messages from the module outlet. */
void		out_return_signal(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);

/** bang handler for j.out 
 @param self		Pointer to this object.
 @see				out_int, out_float, out_list, WrappedOutputClass_anything
 */
void		out_bang(TTPtr self);

/** int handler for j.out 
 @param self		Pointer to this object.
 @param value		The value sent to this object.
 @see				out_bang, out_float, out_list, WrappedOutputClass_anything
 */
void		out_int(TTPtr self, long value);

/** float handler for j.out 
 @param self		Pointer to this object.
 @param value		The value sent to this object.
 @see				out_bang, out_int, out_list, WrappedOutputClass_anything
 */
void		out_float(TTPtr self, double value);

/** list handler for j.out 
 @param self		Pointer to this object.
 @param msg			The message sent to this object.
 @param argc		The number of arguments passed to the object.
 @param argv		Pointer to an array of atoms passed to the object.
 @see				out_bang, out_int, out_float, WrappedOutputClass_anything
 */
void		out_list(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);

/** anything else handler for j.out 
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
	return wrapTTModularClassAsMaxClass(kTTSym_OutputAudio, "j.out~", NULL, spec);
#else
	return wrapTTModularClassAsMaxClass(kTTSym_Output, "j.out", NULL, spec);
#endif
	
}

void WrapTTOutputClass(WrappedClassPtr c)
{
	class_addmethod(c->maxClass, (method)out_assist,						"assist",				A_CANT, 0L);
	
#ifdef JCOM_OUT_TILDE
	class_addmethod(c->maxClass, (method)out_dsp64,							"dsp64",				A_CANT, 0);
	
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
	
#endif
}

#pragma mark -
#pragma mark NodeLib association

void out_subscribe(TTPtr self)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
    TTAddress   signalAddress;
	TTAddress	outputAddress;
	TTAddress	inputAddress;
	TTValue		v, args;
	TTNodePtr	returnedNode = NULL;
    TTNodePtr   returnedContextNode = NULL;
	TTAddress	returnedAddress, parentAddress;
	TTString	formatDescription, sInstance;
	
#ifdef JCOM_OUT_TILDE
	signalAddress = TTAddress("audio");
#else
    signalAddress = TTAddress("data");
#endif
    
    // edit "signal/out.instance" address
    outputAddress = signalAddress.appendAddress(TTAddress("out")).appendInstance(EXTRA->instance);
	
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
	}
}

#pragma mark -
#pragma mark Methods bound to input/inlets

// Method for Assistance Messages
void out_assist(TTPtr self, TTPtr b, long msg, AtomCount arg, char *dst)
{
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


// Perform Method 64 bit - just pass the whole vector straight through
// (the work is all done in the dsp 64 bit method)
void out_perform64(TTPtr self, t_object *dsp64, double **ins, long numins, double **outs, long numouts, long sampleframes, long flags, void *userparam)
{
    WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
    TTOutputAudioPtr			anOutput = (TTOutputAudioPtr)x->wrappedObject;

    if (anOutput)
        anOutput->process(ins[0], outs[0], sampleframes);
}


// DSP64 method
void out_dsp64(TTPtr self, t_object *dsp64, short *count, double samplerate, long maxvectorsize, long flags)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTOutputAudioPtr			anOutput = (TTOutputAudioPtr)x->wrappedObject;

	if (anOutput) {
		anOutput->setupAudioSignals(maxvectorsize, samplerate);
		object_method(dsp64, gensym("dsp_add64"), x, out_perform64, 0, NULL); 
	}
}

#endif // JCOM_OUT_TILDE
