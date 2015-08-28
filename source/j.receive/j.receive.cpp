/** @file
 *
 * @ingroup implementationMaxExternals
 *
 * @brief j.receive / j.receive~ : Receive messages and audio through remote communication
 *
 * @details
 *
 * @authors Théo de la Hogue, Trond Lossius
 *
 * @copyright © 2011 by Théo de la Hogue @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */


#include "TTModularClassWrapperMax.h"

#define data_out 0
#define address_out 1
#define dump_out 2

// Definitions

/** Wrap the j.receive class as a Max object.
 @param c			The class to be wrapped
 @see				WrappedReceiverClass_new, WrappedReceiverClass_free
 */
void		WrapTTReceiverClass(WrappedClassPtr c);

/** Wrapper for the j.receive constructor class, called when an instance is created. 
 @param self		Pointer to this object.
 @param argc		The number of arguments passed to the object.
 @param argv		Pointer to an array of atoms passed to the object.
 @see				WrappedReceiverClass_free, receive_subscribe
 */
void		WrappedReceiverClass_new(TTPtr self, long argc, t_atom *argv);

/** Wrapper for the j.receive deconstructor class, called when an instance is destroyed. 
 @param self		Pointer to this object.
 @see				WrappedReceiverClass_new
 */
void		WrappedReceiverClass_free(TTPtr self);

/** Assistance Method. 
 @param self		Pointer to this object.
 @param b			Pointer to (exactly what?)
 @param msg			The message passed to the object.
 @param arg			
 @param dst			Pointer to the destination that assistance strings are passed to for display.
 */
void		receive_assist(TTPtr self, void *b, long msg, long arg, char *dst);

/** Associate j.receive(~) with NodeLib. This is a prerequisit for communication with other Jamoma object in the module and beyond.  */
void		receive_subscribe(TTPtr self);

void		receive_return_model_address(TTPtr self, t_symbol *msg, long argc, t_atom *argv);

#ifdef JCOM_RECEIVE_TILDE

/** j.receive~ 32-bit MSP perform method (for Max 5). Only defined for j.receive~. */
t_int*		receive_perform(t_int *w);

/** j.receive~ 32-bit DSP method (for Max 5).Only defined for j.receive~. */
void		receive_dsp(TTPtr self, t_signal **sp, short *count);

/** j.receive~ 64-bit MSP perform method (for Max 6). Only defined for j.receive~. */
void		receive_perform64(TTPtr self, t_object *dsp64, double **ins, long numins, double **outs, long numouts, long sampleframes, long flags, void *userparam);

/** j.receive~ 64-bit DSP method (for Max 6). Only defined for j.receive~. */
void		receive_dsp64(TTPtr self, t_object *dsp64, short *count, double samplerate, long maxvectorsize, long flags);

#else

void		receive_return_address(TTPtr self, t_symbol *msg, long argc, t_atom *argv);
void		receive_return_value(TTPtr self, t_symbol *msg, long argc, t_atom *argv);

/** bang handler for j.receive
 @param self		Pointer to this object
 @see				receive_int, receive_float, receive_list, WrappedOutputClass_anything
 */
void		receive_bang(TTPtr self);
#endif

/** address message handler for j.receive. To change the address to bind.
 @param self		Pointer to this object
 @param address		The address to bind
 @see				receive_subscribe
 */
void		receive_address(TTPtr self, t_symbol *address);

#pragma mark -
#pragma mark main

int C74_EXPORT main(void)
{
	ModularSpec *spec = new ModularSpec;
	spec->_wrap = &WrapTTReceiverClass;
	spec->_new = &WrappedReceiverClass_new;
	spec->_free = &WrappedReceiverClass_free;
	spec->_any = NULL;
	
#ifdef JCOM_RECEIVE_TILDE
	return wrapTTModularClassAsMaxClass(kTTSym_Receiver, "j.receive~", NULL, spec);
#else
	return wrapTTModularClassAsMaxClass(kTTSym_Receiver, "j.receive", NULL, spec);
#endif
	
}

void WrapTTReceiverClass(WrappedClassPtr c)
{
	class_addmethod(c->maxClass, (method)receive_assist,				"assist",				A_CANT, 0L);
	
	class_addmethod(c->maxClass, (method)receive_return_model_address,	"return_model_address",	A_CANT, 0);

#ifdef JCOM_RECEIVE_TILDE
	class_addmethod(c->maxClass, (method)receive_dsp,					"dsp", 					A_GIMME, 0);
	class_addmethod(c->maxClass, (method)receive_dsp64,					"dsp64",				A_CANT, 0);
#else
	class_addmethod(c->maxClass, (method)receive_return_address,		"return_address",		A_CANT, 0);
	class_addmethod(c->maxClass, (method)receive_return_value,			"return_value",			A_CANT, 0);

	class_addmethod(c->maxClass, (method)receive_bang,                  "bang",                 0);
#endif
	
	class_addmethod(c->maxClass, (method)receive_address,				"address",				A_SYM, 0);
}

#pragma mark -
#pragma mark Object life

void WrappedReceiverClass_new(TTPtr self, long argc, t_atom *argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	t_symbol                    *address;
 	long						attrstart = attr_args_offset(argc, argv);			// support normal arguments
    t_atom						a[1];
	
	// read first argument
	if (attrstart && argv) 
		address = atom_getsym(argv);
	else
		address = _sym_nothing;
	
	x->address = TTAddress(jamoma_parse_dieze((t_object*)x, address)->s_name);
    
    // if the j.receive tries to bind an Output object : bind the signal attribute if no attribute is precised
    if (x->address.getName() == TTSymbol("out") || x->address.getName() == TTSymbol("in"))
        if (x->address.getAttribute() == kTTSymEmpty)
            x->address = x->address.appendAttribute(kTTSym_signal);
    
	x->index = 0; // the index member is usefull to count how many time the external tries to bind
	
	x->outlets = (TTHandle)sysmem_newptr(sizeof(TTPtr) * 2);
		
#ifdef JCOM_RECEIVE_TILDE
		jamoma_receiver_create_audio((t_object*)x, x->wrappedObject);
		
		dsp_setup((t_pxobject *)x, 1);	
		x->obj.z_misc = Z_NO_INPLACE | Z_PUT_FIRST;
		
		x->outlets[address_out] = outlet_new(x, NULL);					// anything outlet to output address
		x->outlets[data_out] = outlet_new((t_pxobject *)x, "signal");	// signal outlet to output audio
#else
		jamoma_receiver_create((t_object*)x, x->wrappedObject);
    
		x->outlets[address_out] = outlet_new(x, NULL);					// anything outlet to output address
		x->outlets[data_out] = outlet_new(x, NULL);						// anything outlet to output data
#endif

	// handle attribute args
	attr_args_process(x, argc, argv);
    
    // for absolute address
	if (x->address.getType() == kAddressAbsolute) {
		
		x->wrappedObject.set(kTTSym_address, x->address);
		atom_setsym(a, gensym((char*)x->address.c_str()));
		object_obex_dumpout((t_object*)x, gensym("address"), 1, a);
        
        JamomaDebug object_post((t_object*)x, "binds on %s", x->address.c_str());
        
		return;
	}
	
	// The following must be deferred because we have to interrogate our box,
	// and our box is not yet valid until we have finished instantiating the object.
	// Trying to use a loadbang method instead is also not fully successful (as of Max 5.0.6)
	defer_low((t_object*)x, (method)receive_subscribe, NULL, 0, 0);
}

void WrappedReceiverClass_free(TTPtr self)
{
    WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
    
    x->wrappedObject.set(kTTSym_address, kTTAdrsEmpty);
    
#ifdef JCOM_RECEIVE_TILDE
	
    // Always call dsp_free first in this routine
    dsp_free((t_pxobject *)x);
#endif
}

#pragma mark -
#pragma mark NodeLib association

void receive_subscribe(TTPtr self)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTValue						v;
	t_atom						a[1];
	TTAddress                   contextAddress = kTTAdrsEmpty;
	TTAddress                   absoluteAddress, returnedAddress;
    TTNodePtr                   returnedNode = NULL;
    TTNodePtr                   returnedContextNode = NULL;
	TTObject                    anObject, empty;
	
	if (x->address == kTTAdrsEmpty)
		return;
	
	// for relative address
	jamoma_patcher_get_info((t_object*)x, &x->patcherPtr, x->patcherContext, x->patcherClass, x->patcherName);
	
	if (!jamoma_subscriber_create((t_object*)x, empty, TTAddress("model"), x->subscriberObject, returnedAddress, &returnedNode, &returnedContextNode)) {
		
		// get the context address to make
		// a receiver on the contextAddress/model:address attribute
		x->subscriberObject.get("contextAddress", v);
		contextAddress = v[0];
        
        // release the subscriber
        x->subscriberObject = TTObject();
		
		if (x->patcherContext) {
            
            if (x->address == TTAddress("model:address")) {
                
                x->wrappedObject.set(kTTSym_address, contextAddress.appendAddress(x->address));
                atom_setsym(a, gensym((char*)x->address.c_str()));
                object_obex_dumpout((t_object*)x, gensym("address"), 1, a);
                
                JamomaDebug object_post((t_object*)x, "binds on %s", contextAddress.appendAddress(x->address).c_str());

                return;
            }
            else {
                
                // observe model:address attribute (in view patcher : deferlow return_model_address)
                makeInternals_receiver(x, contextAddress, TTSymbol("/model:address"), gensym("return_model_address"), anObject, x->patcherContext == kTTSym_view);
                
                return;
            }
		}
	}
	
	// else, if no context, set address directly
	else if (x->patcherContext == kTTSymEmpty) {
        
        // release the subscriber
        x->subscriberObject = TTObject();
        
		contextAddress = kTTAdrsRoot;
		absoluteAddress = contextAddress.appendAddress(x->address);
		x->wrappedObject.set(kTTSym_address, absoluteAddress);
		
		atom_setsym(a, gensym((char*)absoluteAddress.c_str()));
		object_obex_dumpout((t_object*)x, gensym("address"), 1, a);
        
		return;
	}
	
	// otherwise while the context node is not registered : try to binds again :(
	// (to -- this is not a good way todo. For binding we should make a subscription 
	// to a notification mechanism and each time an TTObjet subscribes to the namespace
	// using jamoma_subscriber_create we notify all the externals which have used 
	// jamoma_subscriber_create with NULL object to bind)
	
	// release the subscriber
	x->subscriberObject = TTObject();
	
	x->index++; // the index member is usefull to count how many time the external tries to bind
	if (x->index > 100) {
		object_error((t_object*)x, "tries to bind too many times on %s", x->address.c_str());
		object_obex_dumpout((t_object*)x, gensym("error"), 0, NULL);
		return;
	}
	
	// The following must be deferred because we have to interrogate our box,
	// and our box is not yet valid until we have finished instantiating the object.
	// Trying to use a loadbang method instead is also not fully successful (as of Max 5.0.6)
	defer_low((t_object*)x, (method)receive_subscribe, NULL, 0, 0);
}

void receive_return_model_address(TTPtr self, t_symbol *msg, long argc, t_atom *argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTAddress                   absoluteAddress;
	t_atom						a[1];
	
	if (argc && argv && x->wrappedObject.valid() && x->address.getType() == kAddressRelative) {
		
		// set address attribute of the wrapped Receiver object
		absoluteAddress = TTAddress(atom_getsym(argv)->s_name).appendAddress(x->address);
		x->wrappedObject.set(kTTSym_address, absoluteAddress);
		x->index = 0; // the index member is usefull to count how many time the external tries to bind
		
		atom_setsym(a, gensym((char*)absoluteAddress.c_str()));
		object_obex_dumpout((t_object*)x, gensym("address"), 1, a);
		
		JamomaDebug object_post((t_object*)x, "binds on %s", absoluteAddress.c_str());
	}
}

#ifndef JCOM_RECEIVE_TILDE
void receive_return_address(TTPtr self, t_symbol *msg, long argc, t_atom *argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	
	outlet_anything(x->outlets[address_out], msg, argc, argv);
}

void receive_return_value(TTPtr self, t_symbol *msg, long argc, t_atom *argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTValue		v;

	// avoid blank before data
	if (msg == _sym_nothing)
		outlet_atoms(x->outlets[data_out], argc, argv);
	else
		outlet_anything(x->outlets[data_out], msg, argc, argv);
}
#endif

#pragma mark -
#pragma mark Methods bound to input/inlets

// Method for Assistance Messages
void receive_assist(TTPtr self, void *b, long msg, long arg, char *dst)
{
	if (msg==1)			// Inlets
		strcpy(dst, "address of node");
	else {							// Outlets
		switch(arg) {
			case data_out:
#ifdef JCOM_RECEIVE_TILDE
				strcpy(dst, "(signal) node value");
#else
				strcpy(dst, "node value");
#endif
				break;
			case address_out:
				strcpy(dst, "address output");
				break;
			case dump_out:
				strcpy(dst, "dumpout");
				break;
		}
 	}
}

#ifndef JCOM_RECEIVE_TILDE

void receive_bang(TTPtr self)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	
	// catch error : dump an error
	if (x->wrappedObject.send(kTTSym_Get))
		object_obex_dumpout(self, _sym_error, 0, NULL);
}

#endif

void receive_address(TTPtr self, t_symbol *address)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
    t_atom						a[1];
    TTAddress                   newAddress = TTAddress(jamoma_parse_dieze((t_object*)x, address)->s_name);
    
    // if the former address was relative and the new one is absolute :
    // we don't need model:address receiver anymore
    if (x->address.getType() == kAddressRelative &&
        newAddress.getType() == kAddressAbsolute) {
        
        TTValue v;
        TTErr   err = x->internals->lookup(TTSymbol("/model:address"), v);
        
        if (!err) {
            
            TTObject aReceiver = v[0];
            aReceiver.set(kTTSym_address, kTTAdrsEmpty);
            
            x->internals->remove(TTSymbol("/model:address"));
        }
    }
    
    // assign the new address
	x->address = newAddress;
    
    // if the j.receive tries to bind an Output object : bind the signal attribute if no attribute is precised
    if (x->address.getName() == TTSymbol("out") || x->address.getName() == TTSymbol("in"))
        if (x->address.getAttribute() == kTTSymEmpty)
            x->address = x->address.appendAttribute(kTTSym_signal);
    
    // for absolute address
	if (x->address.getType() == kAddressAbsolute) {
		
		x->wrappedObject.set(kTTSym_address, x->address);
        
		atom_setsym(a, gensym((char*)x->address.c_str()));
		object_obex_dumpout((t_object*)x, gensym("address"), 1, a);
        
        JamomaDebug object_post((t_object*)x, "binds on %s", x->address.c_str());
        
		return;
	}
	
	receive_subscribe(self);
}

#pragma mark -
#pragma mark Methods relating to audio processing

#ifdef JCOM_RECEIVE_TILDE
// Perform Method - just pass the whole vector straight through
// (the work is all done in the dsp method)
t_int *receive_perform(t_int *w)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)(w[1]);
	TTReceiverPtr				aReceiver = (TTReceiverPtr)x->wrappedObject.instance();
	TTListPtr					objectCache = NULL;
	TTObject                    anObject;
	TTUInt16					vectorSize = 0;
	TTValue						v;
	TTFloat32					d;
    TTBoolean                   active;
    
    aReceiver->getAttributeValue(kTTSym_active, active);
    
    if (x->obj.z_disabled || !active)
    {
        // get signal vectorSize
        aReceiver->mSignal.get(kTTSym_vectorSize, vectorSize);
        
        // fill it with 0.
        TTAudioSignalPtr(aReceiver->mSignal.instance())->fill(0);
        
        // send signal to the outlet
        TTAudioSignalPtr(aReceiver->mSignal.instance())->getVector(0, vectorSize, (TTFloat32*)w[3]);

        return w + 4;
    }
    
    // get signal vectorSize
    aReceiver->mSignal.get(kTTSym_vectorSize, vectorSize);
    
    // store the input
    TTAudioSignalPtr(aReceiver->mSignal.instance())->setVector(0, vectorSize, (TTFloat32*)w[2]);
    
    // get the object cache of the Receiver object
    if (!x->wrappedObject.get(kTTSym_objectCache, v)) {
        
        objectCache = TTListPtr((TTPtr)v[0]);
        
        if (objectCache) {
            
            // sum all object signals
            for (objectCache->begin(); objectCache->end(); objectCache->next()) {
                
                anObject = objectCache->current()[0];
                
                if (anObject.valid()) {
                    
                    // OUTPUT case : sum the signal from the output
                    if (anObject.name() == kTTSym_OutputAudio) {
                        
                        // get output signal vectorSize
                        TTOutputPtr(anObject.instance())->mSignalOut.get(kTTSym_vectorSize, vectorSize);
                        
                        // sum output signal
                        *TTAudioSignalPtr(aReceiver->mSignal.instance()) += *TTAudioSignalPtr(TTOutputPtr(anObject.instance())->mSignalOut.instance());
                    }
                    
                    // INPUT AUDIO case : sum the signal from the input
                    else if (anObject.name() == kTTSym_InputAudio) {
                        
                        // get output signal vectorSize
                        TTInputPtr(anObject.instance())->mSignalOut.get(kTTSym_vectorSize, vectorSize);
                        
                        // sum output signal
                        *TTAudioSignalPtr(aReceiver->mSignal.instance()) += *TTAudioSignalPtr(TTOutputPtr(anObject.instance())->mSignalOut.instance());
                    }
                    
                    // DATA case : fill a signal with the data value and sum it
                    else if (anObject.name() == kTTSym_Data) {
                        
                        // get value
                        anObject.get(kTTSym_value, v);
                        d = v[0];
                        
                        // TEST : fill the signal with the value
                        // TODO : add a += TTFloat64 inline method to TTAudioSignal class  
                        TTAudioSignalPtr(aReceiver->mSignal.instance())->fill(d);
                    }
                }
            }
        }
    }
    
    // send signal to the outlet
    TTAudioSignalPtr(aReceiver->mSignal.instance())->getVector(0, vectorSize, (TTFloat32*)w[3]);
    
	return w + 4;
}


// Perform Method 64 bit - just pass the whole vector straight through
// (the work is all done in the dsp 64 bit method)
void receive_perform64(TTPtr self, t_object *dsp64, double **ins, long numins, double **outs, long numouts, long sampleframes, long flags, void *userparam)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTReceiverPtr				aReceiver = (TTReceiverPtr)x->wrappedObject.instance();
	TTListPtr					objectCache = NULL;
	TTObject                    anObject;
	TTUInt16					vectorSize = 0;
	TTValue						v;
	TTFloat32					d;
    TTBoolean                   active;
    
    aReceiver->getAttributeValue(kTTSym_active, active);

    if (x->obj.z_disabled || !active)
    {
        // get signal vectorSize
        aReceiver->mSignal.get(kTTSym_vectorSize, vectorSize);
        
        // fill it with 0.
        TTAudioSignalPtr(aReceiver->mSignal.instance())->fill(0);
        
        // send signal to the outlet
        TTAudioSignalPtr(aReceiver->mSignal.instance())->getVectorCopy(0, vectorSize, outs[0]);
        
        return;
    }
    
    // get signal vectorSize
    aReceiver->mSignal.get(kTTSym_vectorSize, vectorSize);
    
    // store the input
    TTAudioSignalPtr(aReceiver->mSignal.instance())->setVector64Copy(0, vectorSize, ins[0]);
    
    // get the object cache of the Receiver object
    if (!aReceiver->getAttributeValue(kTTSym_objectCache, v)) {
        
        objectCache = TTListPtr((TTPtr)v[0]);
        
        if (objectCache) {
            
            // sum all object signals
            for (objectCache->begin(); objectCache->end(); objectCache->next()) {
                
                anObject = objectCache->current()[0];
                
                if (anObject.valid()) {
                    
                    // OUTPUT AUDIO case : sum the signal from the output
                    if (anObject.name() == kTTSym_OutputAudio) {
                        
                        // get output signal vectorSize
                        TTOutputPtr(anObject.instance())->mSignalOut.get(kTTSym_vectorSize, vectorSize);
                        
                        // sum output signal
                        *TTAudioSignalPtr(aReceiver->mSignal.instance()) += *TTAudioSignalPtr(TTOutputPtr(anObject.instance())->mSignalOut.instance());
                    }
                    
                    // INPUT AUDIO case : sum the signal from the input
                    else if (anObject.name() == kTTSym_InputAudio) {
                        
                        // get output signal vectorSize
                        TTInputPtr(anObject.instance())->mSignalOut.get(kTTSym_vectorSize, vectorSize);
                        
                        // sum output signal
                        *TTAudioSignalPtr(aReceiver->mSignal.instance()) += *TTAudioSignalPtr(TTInputPtr(anObject.instance())->mSignalOut.instance());
                    }
                    
                    // DATA case : fill a signal with the data value and sum it
                    else if (anObject.name() == kTTSym_Data) {
                        
                        // get value
                        anObject.get(kTTSym_value, v);
                        d = v[0];
                        
                        // TEST : fill the signal with the value
                        // TODO : add a += TTFloat64 inline method to TTAudioSignal class
                        TTAudioSignalPtr(aReceiver->mSignal.instance())->fill(d);
                    }
                }
            }
        }
    }
    
    // send signal to the outlet
    TTAudioSignalPtr(aReceiver->mSignal.instance())->getVectorCopy(0, vectorSize, outs[0]);
}

// DSP Method
void receive_dsp(TTPtr self, t_signal **sp, short *count)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTReceiverPtr				aReceiver = (TTReceiverPtr)x->wrappedObject.instance();
	void**						audioVectors = NULL;
	TTUInt16					vectorSize = sp[0]->s_n;
	
	if (aReceiver) {
		
		audioVectors = (void**)sysmem_newptr(sizeof(void*) * 3);
		audioVectors[0] = x;
		
		if (count[0] || count[1]) {
			if (sp[0]->s_n > vectorSize)
				vectorSize = sp[0]->s_n;
			
			audioVectors[1] = sp[0]->s_vec;
			audioVectors[2] = sp[1]->s_vec;
		}
		
		// set signal numChannels and vectorSize
		aReceiver->mSignal.set(kTTSym_numChannels, 1);
		aReceiver->mSignal.set(kTTSym_vectorSize, vectorSize);
		
		// anOutput->mSignal will be set in the perform method
		aReceiver->mSignal.send(kTTSym_alloc);
		
		dsp_addv(receive_perform, 3, audioVectors);
		sysmem_freeptr(audioVectors);
	}	
}

// DSP64 method
void receive_dsp64(TTPtr self, t_object *dsp64, short *count, double samplerate, long maxvectorsize, long flags)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTReceiverPtr				aReceiver = (TTReceiverPtr)x->wrappedObject.instance();
	
    if (aReceiver) {
        
        // set signal numChannels and vectorSize
        aReceiver->mSignal.set(kTTSym_numChannels, 1);
        aReceiver->mSignal.set(kTTSym_vectorSize, (TTUInt16)maxvectorsize);
        
        // aReceiver->mSignal will be set in the perform method
        aReceiver->mSignal.send(kTTSym_alloc);
        
        object_method(dsp64, gensym("dsp_add64"), x, receive_perform64, 0, NULL);
    }
}

#endif // JCOM_RECEIVE_TILDE
