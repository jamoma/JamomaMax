/* 
 *	jcom.send
 *	External object
 *	Copyright © 2010 by Théo de la Hogue
 * 
 * License: This code is licensed under the terms of the GNU LGPL
 * http://www.gnu.org/licenses/lgpl.html 
 */

#include "TTModularClassWrapperMax.h"

#ifdef JCOM_SEND_TILDE

#define info_numChannels 0
#define info_vectorSize 1

#endif

// Definitions

/** Wrap the jcom.send class as a Max object.
 @param c			The class to be wrapped
 @see				WrappedSenderClass_new, WrappedSenderClass_free
 */
void		WrapTTSenderClass(WrappedClassPtr c);

/** Wrapper for the jcom.send constructor class, called when an instance is created. 
 @param self		Pointer to this object.
 @param argc		The number of arguments passed to the object.
 @param argv		Pointer to an array of atoms passed to the object.
 @see				WrappedSenderClass_free, send_subscribe
 */
void		WrappedSenderClass_new(TTPtr self, AtomCount argc, AtomPtr argv);

/** Wrapper for the jcom.send deconstructor class, called when an instance is destroyed. 
 @param self		Pointer to this object.
 @see				WrappedSenderClass_new
 */
void		WrappedSenderClass_free(TTPtr self);

/** Assistance Method. 
 @param self		Pointer to this object.
 @param b			Pointer to (exactly what?)
 @param msg			The message passed to the object.
 @param arg			
 @param dst			Pointer to the destination that assistance strings are passed to for display.
 */
void		send_assist(TTPtr self, void *b, long msg, long arg, char *dst);

/** Associate jcom.send(~) with NodeLib. This is a prerequisit for communication with other Jamoma object in the module and beyond.  */
void		send_subscribe(TTPtr self);

/** Internal method called when the model/address parameter changed. It allows relative address binding.
 @param self		Pointer to this object.
 @param msg			The message sent to this object.
 @param argc		The number of arguments passed to the object.
 @param argv		Pointer to an array of atoms passed to the object.
 @see				send_subscribe
  */
void		send_return_model_address(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);

#ifdef JCOM_SEND_TILDE

/** jcom.send~ 32-bit MSP perform method (for Max 5). Only defineed for jcom.send~. */
t_int*		send_perform(t_int *w);

/** jcom.send~ 32-bit DSP method (for Max 5).Only defineed for jcom.send~. */
void		send_dsp(TTPtr self, t_signal **sp, short *count);

/** jcom.send~ 64-bit MSP perform method (for Max 6). Only defineed for jcom.send~. */
void		send_perform64(TTPtr self, t_object *dsp64, double **ins, long numins, double **outs, long numouts, long sampleframes, long flags, void *userparam);

/** jcom.send~ 64-bit DSP method (for Max 6). Only defineed for jcom.send~. */
void		send_dsp64(TTPtr self, t_object *dsp64, short *count, double samplerate, long maxvectorsize, long flags);

#else

/** bang handler for jcom.send 
 @param self		Pointer to this object.
 @see				send_int, send_float, send_list, WrappedSenderClass_anything
 */
void		send_bang(TTPtr self);

/** int handler for jcom.send 
 @param self		Pointer to this object.
 @param value		The value sent to this object.
 @see				send_bang, send_float, send_list, WrappedSenderClass_anything
 */
void		send_int(TTPtr self, long value);

/** float handler for jcom.send 
 @param self		Pointer to this object.
 @param value		The value sent to this object.
 @see				send_bang, send_int, send_list, WrappedSenderClass_anything
 */
void		send_float(TTPtr self, double value);

/** list handler for jcom.send 
 @param self		Pointer to this object.
 @param msg			The message sent to this object.
 @param argc		The number of arguments passed to the object.
 @param argv		Pointer to an array of atoms passed to the object.
 @see				send_bang, send_int, send_float, WrappedSenderClass_anything
 */
void		send_list(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);

/** anything else handler for jcom.send 
 @param self		Pointer to this object.
 @param msg			The message sent to this object.
 @param argc		The number of arguments passed to the object.
 @param argv		Pointer to an array of atoms passed to the object.
 @see				send_bang, send_int, send_float, send_list
 */
void		WrappedSenderClass_anything(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);

/** Internal method used to send data to a jcom.in. 
 @param self		Pointer to this object.
 @param msg			The message sent to this object.
 @param argc		The number of arguments passed to the object.
 @param argv		Pointer to an array of atoms passed to the object.
 @see				send_list
 */
void		send_input(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);

#endif

/** address message handler for jcom.send. To change the address to bind.
 @param self		Pointer to this object.
 @param address		The address to bind
 @see				send_subscribe
 */
void		send_address(TTPtr self, SymbolPtr address);

#pragma mark -
#pragma mark main

int TTCLASSWRAPPERMAX_EXPORT main(void)
{
	ModularSpec *spec = new ModularSpec;
	spec->_wrap = &WrapTTSenderClass;
	spec->_new = &WrappedSenderClass_new;
	spec->_free = &WrappedSenderClass_free;
#ifdef JCOM_SEND_TILDE
	spec->_any = NULL;
#else
	spec->_any = &WrappedSenderClass_anything;
#endif
	
#ifdef JCOM_SEND_TILDE
	return wrapTTModularClassAsMaxClass(kTTSym_Sender, "jcom.send~", NULL, spec);
#else
	return wrapTTModularClassAsMaxClass(kTTSym_Sender, "jcom.send", NULL, spec);
#endif
}

void WrapTTSenderClass(WrappedClassPtr c)
{
	class_addmethod(c->maxClass, (method)send_assist,					"assist",					A_CANT, 0L);
	
	class_addmethod(c->maxClass, (method)send_return_model_address,		"return_model_address",		A_CANT, 0);
	
#ifdef JCOM_SEND_TILDE	
	class_addmethod(c->maxClass, (method)send_dsp,						"dsp",						A_CANT, 0L);
	class_addmethod(c->maxClass, (method)send_dsp64,					"dsp64",					A_CANT, 0);
#else
	class_addmethod(c->maxClass, (method)send_bang,						"bang",						0L);
	class_addmethod(c->maxClass, (method)send_int,						"int",						A_LONG, 0L);
	class_addmethod(c->maxClass, (method)send_float,					"float",					A_FLOAT, 0L);
	class_addmethod(c->maxClass, (method)send_list,						"list",						A_GIMME, 0L);
	class_addmethod(c->maxClass, (method)WrappedSenderClass_anything,	"symbol",					A_SYM, 0L);
#endif
	
	class_addmethod(c->maxClass, (method)send_address,						"address",					A_SYM, 0L);
	
    // no class_dspinit : it is done in wrapTTModularClassAsMaxClass for AUDIO_EXTERNAL
}

#pragma mark -
#pragma mark Object life

void WrappedSenderClass_new(TTPtr self, AtomCount argc, AtomPtr argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	SymbolPtr					address;
 	long						attrstart = attr_args_offset(argc, argv);			// support normal arguments
	
	// read first argument
	if (attrstart && argv) 
		address = atom_getsym(argv);
	else
		address = _sym_nothing;
	
	x->address = TTAddress(jamoma_parse_dieze((ObjectPtr)x, address)->s_name);
	x->argc = 0; // the argc member is usefull to count how many time the external tries to bind

#ifdef JCOM_SEND_TILDE
	// create a sender to handle an audio signal
	jamoma_sender_create_audio((ObjectPtr)x, &x->wrappedObject);
	
	// create an inlet to handle audio signal
	dsp_setup((t_pxobject *)x, 1);
	x->obj.z_misc = Z_NO_INPLACE | Z_PUT_FIRST;
#else
	// create a sender to handle any data signal
	jamoma_sender_create((ObjectPtr)x, &x->wrappedObject);
#endif

	// Prepare memory to store internal objects
	x->internals = new TTHash();
	
	// handle attribute args
	attr_args_process(x, argc, argv);
	
	// The following must be deferred because we have to interrogate our box,
	// and our box is not yet valid until we have finished instantiating the object.
	// Trying to use a loadbang method instead is also not fully successful (as of Max 5.0.6)
	defer_low((ObjectPtr)x, (method)send_subscribe, NULL, 0, 0);
}

void WrappedSenderClass_free(TTPtr self)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	
#ifdef JCOM_SEND_TILDE
	// Always call dsp_free first in this routine
    dsp_free((t_pxobject *)x);
#endif
}

#pragma mark -
#pragma mark NodeLib association

void send_subscribe(TTPtr self)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTValue						v;
	Atom						a[1];
	TTAddress                   contextAddress = kTTAdrsEmpty;
	TTAddress                   absoluteAddress, returnedAddress;
    TTNodePtr                   returnedNode = NULL;
    TTNodePtr                   returnedContextNode = NULL;
	TTObjectBasePtr				anObject;
	
	if (x->address == kTTAdrsEmpty)
		return;
	
	// if the jcom.send tries to bind an Input object : bind the signal attribute
	if (x->address.getName() == TTSymbol("in"))
		x->address = x->address.appendAttribute(kTTSym_signal);
	
	// for absolute address
	if (x->address.getType() == kAddressAbsolute) {
		
		x->wrappedObject->setAttributeValue(kTTSym_address, x->address);
		
		atom_setsym(a, gensym((char*)x->address.c_str()));
		object_obex_dumpout((ObjectPtr)x, gensym("address"), 1, a);
		return;
	}
	
	// for relative address
	jamoma_patcher_get_info((ObjectPtr)x, &x->patcherPtr, x->patcherContext, x->patcherClass, x->patcherName);
	
	if (!jamoma_subscriber_create((ObjectPtr)x, NULL, TTAddress("model/address"), &x->subscriberObject, returnedAddress, &returnedNode, &returnedContextNode)) {
		
		// get the context address to make
		// a viewer on the contextAddress/model/address parameter
		x->subscriberObject->getAttributeValue(TTSymbol("contextAddress"), v);
		contextAddress = v[0];
		
		if (x->patcherContext != kTTSymEmpty) {
			makeInternals_receiver(x, contextAddress, TTSymbol("/model/address"), gensym("return_model_address"), &anObject, YES);  // YES : we want to deferlow this method
			anObject->sendMessage(kTTSym_Get);
			return;
		}
	}
	
	// else, if no context, set address directly
	else if (x->patcherContext == kTTSymEmpty) {
		contextAddress = kTTAdrsRoot;
		absoluteAddress = contextAddress.appendAddress(x->address);
		x->wrappedObject->setAttributeValue(kTTSym_address, absoluteAddress);
		
		atom_setsym(a, gensym((char*)absoluteAddress.c_str()));
		object_obex_dumpout((ObjectPtr)x, gensym("address"), 1, a);
		return;
	}
	
	// otherwise while the context node is not registered : try to binds again :(
	// (to -- this is not a good way todo. For binding we should make a subscription 
	// to a notification mechanism and each time an TTObjet subscribes to the namespace
	// using jamoma_subscriber_create we notify all the externals which have used 
	// jamoma_subscriber_create with NULL object to bind)
		
	// release the subscriber
	TTObjectBaseRelease(TTObjectBaseHandle(&x->subscriberObject));
	x->subscriberObject = NULL;
	
	x->argc++; // the index member is usefull to count how many time the external tries to bind
	if (x->argc > 100) {
		object_error((ObjectPtr)x, "tries to bind too many times on %s", x->address.c_str());
		object_obex_dumpout((ObjectPtr)x, gensym("error"), 0, NULL);
		return;
	}
	
	// The following must be deferred because we have to interrogate our box,
	// and our box is not yet valid until we have finished instantiating the object.
	// Trying to use a loadbang method instead is also not fully successful (as of Max 5.0.6)
	defer_low((ObjectPtr)x, (method)send_subscribe, NULL, 0, 0);
}

void send_return_model_address(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTAddress			absoluteAddress;
	Atom						a[1];
	
	if (argc && argv && x->wrappedObject) {
		
		// set address attribute of the wrapped Receiver object
		absoluteAddress = TTAddress(atom_getsym(argv)->s_name).appendAddress(x->address);
		x->wrappedObject->setAttributeValue(kTTSym_address, absoluteAddress);
		x->argc = 0; // the index member is usefull to count how many time the external tries to bind
		
		atom_setsym(a, gensym((char*)absoluteAddress.c_str()));
		object_obex_dumpout((ObjectPtr)x, gensym("address"), 1, a);
		
		JamomaDebug object_post((ObjectPtr)x, "binds on %s", absoluteAddress.c_str());
	}
}

#pragma mark -
#pragma mark Methods bound to input/inlets

// Method for Assistance Messages
void send_assist(TTPtr self, void *b, long msg, long arg, char *dst)
{
	if (msg==1)			// Inlets
		strcpy(dst, "");		
	else {							// Outlets
		switch(arg) {
				strcpy(dst, "dumpout");
				break;
		}
 	}
}

#ifndef JCOM_SEND_TILDE

void send_bang(TTPtr self)
{
	send_list(self, _sym_bang, 0, NULL);
}

void send_int(TTPtr self, long value)
{
	t_atom a;
	
	atom_setlong(&a, value);
	send_list(self, _sym_int, 1, &a);
}

void send_float(TTPtr self, double value)
{
	t_atom a;
	
	atom_setfloat(&a, value);
	send_list(self, _sym_float, 1, &a);
}

void send_list(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	
	// dynamic address setting for jcom.send without address
	if (x->address == kTTAdrsEmpty) {
			
			TTAddress anAddress = TTAddress(msg->s_name);
			SymbolPtr newMsg;
			
			// send only to absolute address
			if (anAddress.getType() == kAddressAbsolute) {
				
				x->wrappedObject->setAttributeValue(kTTSym_address, anAddress);
				
				// edit message type
				if (argc == 0)
					newMsg = _sym_nothing;
				else if (argc > 1)
					newMsg = _sym_list;
				else if (atom_gettype(argv) == A_LONG)
					newMsg = _sym_int;
				else if (atom_gettype(argv) == A_FLOAT)
					newMsg = _sym_float;
				else if (atom_gettype(argv) == A_SYM)
					newMsg = _sym_symbol;
				
				jamoma_sender_send((TTSenderPtr)x->wrappedObject, newMsg, argc, argv);
			}
	}
	else
		jamoma_sender_send((TTSenderPtr)x->wrappedObject, msg, argc, argv);
}

void WrappedSenderClass_anything(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{	
	send_list(self, msg, argc, argv);
}

#endif

void send_address(TTPtr self, SymbolPtr address)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	x->address =  TTAddress(jamoma_parse_dieze((ObjectPtr)x, address)->s_name);
	
	send_subscribe(self);
}

#pragma mark -
#pragma mark Methods relating to audio processing

#ifdef JCOM_SEND_TILDE
// Perform Method - just pass the whole vector straight through
// (the work is all done in the dsp method)
t_int *send_perform(t_int *w)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)(w[1]);
	TTSenderPtr					aSender = (TTSenderPtr)x->wrappedObject;
	TTListPtr					objectCache = NULL;
	TTObjectBasePtr				anObject;
	TTUInt16					vectorSize = 0;
    TTUInt16					n;
	t_float*					envelope;
	TTFloat32					sum, mean;
	TTValue						v;
    
    if (x->obj.z_disabled)
        return w + 4;
	
	if (aSender) {
		
		// get the object cache of the Sender object
		if (!aSender->getAttributeValue(kTTSym_objectCache, v)) {
			
			objectCache = TTListPtr((TTPtr)v[0]);
			
			if (objectCache) {
				
				// get signal vectorSize
				aSender->mSignal->getAttributeValue(kTTSym_vectorSize, vectorSize);
				
				// store the input from the inlet
				TTAudioSignalPtr(aSender->mSignal)->setVector(0, vectorSize, (TTFloat32*)w[2]);
				
				// process the mean value
				envelope = (t_float *)(w[3]);
				n = vectorSize;
				while (n--) {
					sum += *envelope;
					envelope++;
				}
				mean = sum / vectorSize;
				v = TTValue(mean);
				
				// send signal or mean to each object
				for (objectCache->begin(); objectCache->end(); objectCache->next()) {
					
					anObject = objectCache->current()[0];
					
					if (anObject) {
						
						// INPUT case : cache the signal into the input
						if (anObject->getName() == kTTSym_Input)
							TTInputPtr(anObject)->mSignalCache->appendUnique(aSender->mSignal);
						
						// DATA case : send the mean value of the sample
						else if (anObject->getName() == kTTSym_Data)
							anObject->sendMessage(kTTSym_Command, v, kTTValNONE);
						
					}
				}
			}
		}
	}
	
	return w + 4;
}

// Perform Method 64 bit - just pass the whole vector straight through
// (the work is all done in the dsp 64 bit method)
void send_perform64(TTPtr self, t_object *dsp64, double **ins, long numins, double **outs, long numouts, long sampleframes, long flags, void *userparam)
{
    WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTSenderPtr					aSender = (TTSenderPtr)x->wrappedObject;
	TTListPtr					objectCache = NULL;
	TTObjectBasePtr				anObject;
	TTUInt16					vectorSize = 0;
    TTUInt16					n;
	TTSampleValue*              envelope;
	TTFloat32					sum, mean;
	TTValue						v;
    
    if (x->obj.z_disabled)
        return;
	
	if (aSender) {
		
		// get the object cache of the Sender object
		if (!aSender->getAttributeValue(kTTSym_objectCache, v)) {
			
			objectCache = TTListPtr((TTPtr)v[0]);
			
			if (objectCache) {
				
				// get signal vectorSize
				aSender->mSignal->getAttributeValue(kTTSym_vectorSize, vectorSize);
				
				// store the input from the inlet
				TTAudioSignalPtr(aSender->mSignal)->setVector64Copy(0, vectorSize, ins[0]);
				
				// process the mean value
				envelope = ins[0];
				n = vectorSize;
				while (n--) {
					sum += *envelope;
					envelope++;
				}
				mean = sum / vectorSize;
				v = TTValue(mean);
				
				// send signal or mean to each object
				for (objectCache->begin(); objectCache->end(); objectCache->next()) {
					
					anObject = objectCache->current()[0];
					
					if (anObject) {
						
						// INPUT case : cache the signal into the input
						if (anObject->getName() == kTTSym_Input)
							TTInputPtr(anObject)->mSignalCache->appendUnique(aSender->mSignal);
						
						// DATA case : send the mean value of the sample
						else if (anObject->getName() == kTTSym_Data)
							anObject->sendMessage(kTTSym_Command, v, kTTValNONE);
					}
				}
			}
		}
	}
}

// DSP Method
void send_dsp(TTPtr self, t_signal **sp, short *count)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTSenderPtr					aSender = (TTSenderPtr)x->wrappedObject;
	void**						audioVectors = NULL;
	TTUInt16					vectorSize = 0;
	
	if (aSender) {
		
		audioVectors = (void**)sysmem_newptr(sizeof(void*) * 3);
		audioVectors[0] = x;
		
		if (count[0] || count[1]) {
			if (sp[0]->s_n > vectorSize)
				vectorSize = sp[0]->s_n;
			
			audioVectors[1] = sp[0]->s_vec;
			audioVectors[2] = sp[1]->s_vec;
		}
		
		// set signal numChannels and vectorSize
		aSender->mSignal->setAttributeValue(kTTSym_numChannels, 1);
		aSender->mSignal->setAttributeValue(kTTSym_vectorSize, vectorSize);
		
		dsp_addv(send_perform, 3, audioVectors);
		sysmem_freeptr(audioVectors);
	}
}

// DSP64 method
void send_dsp64(TTPtr self, t_object *dsp64, short *count, double samplerate, long maxvectorsize, long flags)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTSenderPtr					aSender = (TTSenderPtr)x->wrappedObject;
	
	if (aSender) {
		
        // set signal numChannels and vectorSize
        aSender->mSignal->setAttributeValue(kTTSym_numChannels, 1);
        aSender->mSignal->setAttributeValue(kTTSym_vectorSize, (TTUInt16)maxvectorsize);
   
        // mSignal will be set in the perform method
        object_method(dsp64, gensym("dsp_add64"), x, send_perform64, 0, NULL);
	}
}
#endif
