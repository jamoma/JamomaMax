/* 
 *	jcom.remoteArray
 *	External object
 *	Copyright © 2011 by Théo de la Hogue
 * 
 * License: This code is licensed under the terms of the "New BSD License"
 * http://creativecommons.org/licenses/BSD/
 */

#include "TTModularClassWrapperMax.h"

#define set_out 0
#define data_out 1
#define index_out 2
#define	dump_out 3


// This is used to store extra data
typedef struct extra {
    
    TTObjectBasePtr	modelAddressReceiver;	// the internal model/address receiver (not registered inside internals)
	TTValuePtr		*arrayValue;            // store each value in an array to output them together
	TTBoolean		changingAddress;        // a flag to protect from succession of address changes
	TTPtr			ui_qelem;               // to output "qlim'd" data for ui object
    TTListPtr       ui_qelem_list;          // a list of defered value to output
	TTUInt8			countSubscription;      // to count how many time we try to subscribe

} t_extra;
#define EXTRA ((t_extra*)x->extra)

// Definitions
void		WrapTTViewerClass(WrappedClassPtr c);
void		WrappedViewerClass_new(TTPtr self, AtomCount argc, AtomPtr argv);
void		WrappedViewerClass_free(TTPtr self);

void		remote_assist(TTPtr self, TTPtr b, long msg, AtomCount arg, char *dst);

void		remote_new_address(TTPtr self, SymbolPtr address);
void		remote_array_create(TTPtr self, TTObjectBasePtr *returnedViewer, TTUInt8 index);
void		remote_array_subscribe(TTPtr self, SymbolPtr address);
void		remote_array_select(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);
void		remote_address(TTPtr self, SymbolPtr name);

void		remote_array_return_value(TTPtr baton, TTValue& v);

void        remote_create_model_address_receiver(TTPtr self);
void        remote_free_model_address_receiver(TTPtr self);
void		remote_return_model_address(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);

void		WrappedViewerClass_anything(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);
void		remote_bang(TTPtr self);
void		remote_int(TTPtr self, long value);
void		remote_float(TTPtr self, double value);
void		remote_list(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);

void		remote_array(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);

void		remote_ui_queuefn(TTPtr self);

int TTCLASSWRAPPERMAX_EXPORT main(void)
{
	ModularSpec *spec = new ModularSpec;
	spec->_wrap = &WrapTTViewerClass;
	spec->_new = &WrappedViewerClass_new;
	spec->_free = &WrappedViewerClass_free;
	spec->_any = &WrappedViewerClass_anything;

	return wrapTTModularClassAsMaxClass(kTTSym_Viewer, "jcom.remoteArray", NULL, spec);
}

void WrapTTViewerClass(WrappedClassPtr c)
{
	class_addmethod(c->maxClass, (method)remote_assist,						"assist",				A_CANT, 0L);
	class_addmethod(c->maxClass, (method)remote_return_model_address,		"return_model_address",	A_CANT, 0);
		
	class_addmethod(c->maxClass, (method)remote_bang,						"bang",					0L);
	class_addmethod(c->maxClass, (method)remote_int,						"int",					A_LONG, 0);
	class_addmethod(c->maxClass, (method)remote_float,						"float",				A_FLOAT, 0);
	class_addmethod(c->maxClass, (method)remote_list,						"list",					A_GIMME, 0);
    
    class_addmethod(c->maxClass, (method)remote_array,						"array",				A_GIMME, 0);
	
	class_addmethod(c->maxClass, (method)remote_address,					"address",				A_SYM,0);
}

void WrappedViewerClass_new(TTPtr self, AtomCount argc, AtomPtr argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	long						attrstart = attr_args_offset(argc, argv);			// support normal arguments
	SymbolPtr					address;
	
	// check address argument
	address = _sym_nothing;
	if (attrstart && argv)
		if (atom_gettype(argv) == A_SYM)
			address = atom_getsym(argv);
	
	if (address == _sym_nothing) {
		object_error((ObjectPtr)x, "needs an address as first argument");
		x->extra = NULL;
		return;
	}

	// add an inlet for the index
	x->inlets = (TTHandle)sysmem_newptr(sizeof(TTPtr) * 1);
	x->inlets[0] = proxy_new(x, 1, &x->index);
	
	// Make outlets (before attr_args_process)
	/////////////////////////////////////////////////////////////////////////////////
	
	// Don't create outlets during dynamic changes
	x->outlets = (TTHandle)sysmem_newptr(sizeof(TTPtr) * 3);
	x->outlets[index_out] = outlet_new(x, NULL);					// long outlet to output view index
	x->outlets[data_out] = outlet_new(x, NULL);						// anything outlet to output data
	x->outlets[set_out] = outlet_new(x, NULL);						// anything outlet to output defered data prepend with a 'set'
	
	x->arraySize = 0;
	x->arrayIndex = 0;
	x->arrayAddress = kTTAdrsEmpty;
	x->arrayArgs = kTTValNONE;
	x->arrayAttrFormat = gensym("single");
	
	// Prepare extra data for parameters and messages
	x->extra = (t_extra*)malloc(sizeof(t_extra));

    EXTRA->modelAddressReceiver = NULL;
	EXTRA->arrayValue = NULL;
	EXTRA->changingAddress = NO;
	EXTRA->ui_qelem = qelem_new(x, (method)remote_ui_queuefn);
    EXTRA->ui_qelem_list = new TTList();
	EXTRA->countSubscription = 0;
    
    // create model/address receiver
    remote_create_model_address_receiver(self);
	
	// handle args
	if (argc && argv) {
		
		// set the external attribute
		attr_args_process(x, argc, argv);
		
		// keep args to set the wrapped object attributes
		if (argc > 1)
			jamoma_ttvalue_from_Atom(x->arrayArgs, _sym_list, argc--, argv++);
	}

	// The following must be deferred because we have to interrogate our box,
	// and our box is not yet valid until we have finished instantiating the object.
	// Trying to use a loadbang method instead is also not fully successful (as of Max 5.0.6)
	defer_low((ObjectPtr)x, (method)remote_new_address, address, 0, NULL);
}

void WrappedViewerClass_free(TTPtr self)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	
    if (EXTRA) {
        
        // delete model/address receiver
        remote_free_model_address_receiver(self);
        
        // delete array
        if (EXTRA->arrayValue) {
            for (TTUInt8 i = 0; i < x->arraySize; i++)
                if (EXTRA->arrayValue[i])
                    delete EXTRA->arrayValue[i];
            
            free(EXTRA->arrayValue);
        }
        
        qelem_free(EXTRA->ui_qelem);
        
        delete EXTRA->ui_qelem_list;
        
        free(EXTRA);
    }
}

void remote_new_address(TTPtr self, SymbolPtr address)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	AtomCount					argc = 0; 
	AtomPtr						argv = NULL;
	TTUInt32					number;
	TTUInt8						i, j;
	TTAddress                   newAddress = TTAddress(address->s_name);
	SymbolPtr					instanceAddress;
	TTObjectBasePtr				anObject;
	TTValue						v;
		
    x->useInternals = YES;
    x->internals = new TTHash();
    x->internals->setThreadProtection(YES);
    x->cursor = kTTSymEmpty;
    
    x->arrayAddress = newAddress;
    
    number = jamoma_parse_bracket(address, x->arrayFormatInteger, x->arrayFormatString);
    
    // don't resize to 0
    if (number && number <= 255) {
        
        // Starts iteration on internals
        x->iterateInternals = YES;
        
        // prepare arrayValue
        x->arraySize = number;
        EXTRA->arrayValue = (TTValuePtr*)malloc(sizeof(TTValuePtr)*number);
        for (j = 0; j < x->arraySize; j++)
            EXTRA->arrayValue[j] = NULL;
        
        for (i = 1; i <= x->arraySize; i++) {
            
            jamoma_edit_numeric_instance(x->arrayFormatInteger, &instanceAddress, i);
            
            remote_array_create(x, &anObject, i);
            
            // append the viewer to the internals table
            v = TTValue(anObject);
            v.append(TTSymbol(instanceAddress->s_name));
            v.append((TTPtr)NULL);
            
            x->internals->append(TTSymbol(instanceAddress->s_name), v);
        }
        
        // Ends iteration on internals
        x->iterateInternals = NO;
        
        // clear the list used by qelem
        qelem_unset(EXTRA->ui_qelem);
        EXTRA->ui_qelem_list->clear();
        
        // handle args
        jamoma_ttvalue_to_Atom(x->arrayArgs, &argc, &argv);
        if (argc && argv)
            attr_args_process(x, argc, argv);
        
        // try to subscribe the entire array
        remote_array_subscribe(self, address);
        
        // attach the jcom.remote to connected ui object
        //remote_attach(self);
    }
}

void remote_array_create(TTPtr self, TTObjectBasePtr *returnedViewer, TTUInt8 index)
{
	TTValue			args;
	TTObjectBasePtr	returnValueCallback;
	TTValuePtr		returnValueBaton;
	
	// prepare arguments
	returnValueCallback = NULL;			// without this, TTObjectInstantiate try to release an oldObject that doesn't exist ... Is it good ?
	TTObjectBaseInstantiate(TTSymbol("callback"), &returnValueCallback, kTTValNONE);

	returnValueBaton = new TTValue(self);
	returnValueBaton->append(index);
	returnValueCallback->setAttributeValue(kTTSym_baton, TTPtr(returnValueBaton));
	returnValueCallback->setAttributeValue(kTTSym_function, TTPtr(&remote_array_return_value));
	
	args.append(returnValueCallback);
	
	*returnedViewer = NULL;
	TTObjectBaseInstantiate(kTTSym_Viewer, TTObjectBaseHandle(returnedViewer), args);
}

void remote_array_subscribe(TTPtr self, SymbolPtr address)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	SymbolPtr					instanceAddress;
	TTAddress                   contextAddress = kTTAdrsEmpty;
	TTAddress                   absoluteAddress, returnedAddress;
    TTNodePtr                   returnedNode = NULL;
    TTNodePtr                   returnedContextNode = NULL;
	TTObjectBasePtr				toSubscribe;
	TTBoolean					subscribe;
	TTSubscriberPtr				aSubscriber;
	TTUInt8						i;
	TTValue						v;
	Atom						a[1];
	
	// for absolute address
	if (TTAddress(address->s_name).getType() == kAddressAbsolute) {
		
		// Starts iteration on internals
		x->iterateInternals = YES;
		
		for (i = 1; i <= x->arraySize; i++) {
			jamoma_edit_numeric_instance(x->arrayFormatInteger, &instanceAddress, i);
			x->cursor = TTSymbol(instanceAddress->s_name);
			
			selectedObject->setAttributeValue(kTTSym_address, x->cursor);
		}
		
		// Ends iteration on internals
		x->iterateInternals = NO;
		return;
	}
	
	// for relative address
	jamoma_patcher_get_info((ObjectPtr)x, &x->patcherPtr, x->patcherContext, x->patcherClass, x->patcherName);

	// Do we subscribe all Viewers ?
	// View patcher case :
	if (x->patcherContext == kTTSym_view)
		subscribe = YES;
	
	// Model patcher case : 
	// try to binds on the parameter|message|return of the model without subscribing the Viewer
	else if (x->patcherContext == kTTSym_model)
		subscribe = NO;
	
	// Any other case : no subscription
	else
		subscribe = NO;
	
	// Starts iteration on internals
	x->iterateInternals = YES;
	
	for (i = 1; i <= x->arraySize; i++) {
		
		jamoma_edit_numeric_instance(x->arrayFormatInteger, &instanceAddress, i);
		x->cursor = TTSymbol(instanceAddress->s_name);
		
		if (subscribe) 
			toSubscribe = selectedObject;
		else 
			toSubscribe = NULL;
		
		aSubscriber = NULL;
		if (!jamoma_subscriber_create((ObjectPtr)x, toSubscribe, TTAddress(instanceAddress->s_name), &aSubscriber, returnedAddress, &returnedNode, &returnedContextNode)) {
			
			// get the context address to make
			// a viewer on the contextAddress/model/address parameter
			aSubscriber->getAttributeValue(TTSymbol("contextAddress"), v);
			contextAddress = v[0];
			
			// append the subscriber to the internal
			if (aSubscriber) {
				
				v = TTValue(selectedObject);
				v.append(x->cursor);
				v.append(aSubscriber);
				
				// replace the internal
				x->internals->remove(x->cursor);
				x->internals->append(x->cursor, v);
			}
		}
		
		// else, if no context, set address directly
		else if (x->patcherContext == kTTSymEmpty) {
			contextAddress = kTTAdrsRoot;
			absoluteAddress = contextAddress.appendAddress(TTAddress(instanceAddress->s_name));
			selectedObject->setAttributeValue(kTTSym_address, absoluteAddress);
			
			atom_setsym(a, gensym((char*)absoluteAddress.c_str()));
			object_obex_dumpout((ObjectPtr)x, gensym("address"), 1, a);
			continue;
		}
		
		// if an object can't subscribe, the other objects will fail too
		break;
	}
	
	// Ends iteration on internals
	x->iterateInternals = NO;
	
	// if the subscription success
	if (contextAddress != kTTAdrsEmpty) {
		
        // make the model/address receiver binds on the model/address data
        EXTRA->modelAddressReceiver->setAttributeValue(kTTSym_address, contextAddress.appendAddress(TTAddress("model/address")));
        
		// get the model/address value
        EXTRA->modelAddressReceiver->sendMessage(kTTSym_Get);
        return;
	}
	
	// otherwise while the context node is not registered : try to binds again :(
	// (to -- this is not a good way todo. For binding we should make a subscription 
	// to a notification mechanism and each time an TTObjet subscribes to the namespace
	// using jamoma_subscriber_create we notify all the externals which have used 
	// jamoma_subscriber_create with NULL object to bind)
		
	// Starts iteration on internals
	x->iterateInternals = YES;
	
	for (i = 1; i <= x->arraySize; i++) {
		
		jamoma_edit_numeric_instance(x->arrayFormatInteger, &instanceAddress, i);
		x->cursor = TTSymbol(instanceAddress->s_name);
		
		if (!x->internals->lookup(x->cursor, v)) {
			
			aSubscriber = NULL;
			aSubscriber = TTSubscriberPtr((TTObjectBasePtr)v[2]);
			
			// release the subscriber
			if (aSubscriber) {
				TTObjectBaseRelease(TTObjectBaseHandle(&aSubscriber));
				aSubscriber = NULL;
			}
			
			// keep only the viewer object and his address
			v.set(2, (TTPtr)NULL);
			
			// replace the internal
			x->internals->remove(x->cursor);
			x->internals->append(x->cursor, v);
		}
	}
	
	// Ends iteration on internals
	x->iterateInternals = NO;
	
	EXTRA->countSubscription++; // the index member is usefull to count how many time the external tries to bind
	if (EXTRA->countSubscription > 100) {
		object_error((ObjectPtr)x, "tries to bind too many times on %s", address->s_name);
		object_obex_dumpout((ObjectPtr)x, gensym("error"), 0, NULL);
		return;
	}
	
	// The following must be deferred because we have to interrogate our box,
	// and our box is not yet valid until we have finished instantiating the object.
	// Trying to use a loadbang method instead is also not fully successful (as of Max 5.0.6)
	defer_low((ObjectPtr)x, (method)remote_array_subscribe, address, 0, NULL);
}

void remote_address(TTPtr self, SymbolPtr address)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTObjectBasePtr	anObject, aSubscriber;
	SymbolPtr		instanceAddress;
	TTValue			v;
	TTUInt8			i;
	
	// Avoid succession of address changes
    if (!EXTRA->changingAddress) {
        
        EXTRA->changingAddress = YES;
        
        // filter repetitions
        if (!(x->arrayAddress == TTAddress(address->s_name))) {
            
            // unregister all internals viewers
            if (!x->iterateInternals) {
                
                // Starts iteration on internals
                x->iterateInternals = YES;
                
                for (i = 1; i <= x->arraySize; i++) {
                    
                    jamoma_edit_numeric_instance(x->arrayFormatInteger, &instanceAddress, i);
                    x->cursor = TTSymbol(instanceAddress->s_name);
                    
                    if (!x->internals->lookup(x->cursor, v)) {
                        
                        anObject = NULL;
                        aSubscriber = NULL;
                        
                        anObject = v[0];
                        aSubscriber = TTSubscriberPtr((TTObjectBasePtr)v[2]);
                        
                        if (aSubscriber)
                            TTObjectBaseRelease(&aSubscriber);
                        
                        if (anObject)
                            TTObjectBaseRelease(&anObject);
                        
                        x->internals->remove(x->cursor);
                    }
                }
                
                // Ends iteration on internals
                x->iterateInternals = NO;
                
                // delete array
                if (EXTRA->arrayValue) {
                    for (TTUInt8 i = 0; i < x->arraySize; i++)
                        if (EXTRA->arrayValue[i])
                            delete EXTRA->arrayValue[i];
                    
                    x->arraySize = 0;
                    free(EXTRA->arrayValue);
                }
                
                // rebuild internals
                EXTRA->countSubscription = 0;
                defer(self,(method)remote_new_address, address, 0, NULL);
            }
        }
        
        EXTRA->changingAddress = NO;
        return;
	}
    
    object_error((ObjectPtr)x, "can't change to %s address. Please defer low", address->s_name);
}

// Method for Assistance Messages
void remote_assist(TTPtr self, TTPtr b, long msg, AtomCount arg, char *dst)
{
	if (msg==1) {					// Inlet
		switch(arg) {
			case 0 :
				strcpy(dst, "set the value of the selected instance(s)");
				break;
			case 1 :
				strcpy(dst, "index (use * to bind all instances)");
				break;
		}
    }
	else {							// Outlets
		switch(arg) {
			case set_out:
				strcpy(dst, "set: connect to ui object");
				break;
			case data_out:
				strcpy(dst, "direct: values");
				break;
			case index_out:
				strcpy(dst, "index");
				break;
			case dump_out:
				strcpy(dst, "dumpout");
				break;
		}
 	}
}

void remote_bang(TTPtr self)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	
	if (x->internals) {
		remote_list(self, _sym_bang, 0, NULL);
	}
	else
		object_error((ObjectPtr)x, "bang : the array is empty");
}

void remote_int(TTPtr self, long value)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	t_atom a;

	if (proxy_getinlet((ObjectPtr)x)) {
		atom_setlong(&a, value);
		wrappedModularClass_ArraySelect(self, _sym_nothing, 1, &a);
	}
	else {
		if (x->internals) {
			atom_setlong(&a, value);
			remote_list(self, _sym_int, 1, &a);
		}
		else
			object_error((ObjectPtr)x, "int : the array is empty");
	}
}

void remote_float(TTPtr self, double value)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	t_atom a;
	
	if (x->internals) {
		atom_setfloat(&a, value);
		remote_list(self, _sym_float, 1, &a);
	}
	else
		object_error((ObjectPtr)x, "float : the array is empty");
}

void remote_list(TTPtr self, t_symbol *msg, long argc, t_atom *argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;

	if (x->internals) {
		
		// send to each view
		if (x->arrayIndex == 0) {
			TTValue     keys;
            
			if (!x->internals->isEmpty()) {
				x->internals->getKeys(keys);
				for (int i = 0; i < keys.size(); i++) {
					x->cursor = keys[i];
					jamoma_viewer_send((TTViewerPtr)selectedObject, msg, argc, argv);
				}
			}
			x->cursor = kTTSymEmpty;
		}
		else
			jamoma_viewer_send((TTViewerPtr)selectedObject, msg, argc, argv);
		
	}
	else
		object_error((ObjectPtr)x, "list : the array is empty");
}

void WrappedViewerClass_anything(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	
	if (proxy_getinlet((ObjectPtr)x)) {
		wrappedModularClass_ArraySelect(self, msg, argc, argv);
	}
	else {
		
		// send to each view
		if (x->arrayIndex == 0) {
			TTValue keys;
			if (!x->internals->isEmpty()) {
				x->internals->getKeys(keys);
				for (int i = 0; i < keys.size(); i++) {
					x->cursor = keys[i];
					jamoma_viewer_send((TTViewerPtr)selectedObject, msg, argc, argv);
				}
				x->cursor = kTTSymEmpty;
			}
		}
		else
			jamoma_viewer_send((TTViewerPtr)selectedObject, msg, argc, argv);
	}
}

void remote_array(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
    WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
    TTInt32     d, i;
    SymbolPtr	instanceAddress;
    TTSymbol	memoCursor;
    
	if (x->internals) {
		
		// is the incoming data size is a multiple of the array size ?
        d = argc / x->arraySize;
        if ((d * x->arraySize) == argc) {
            
            memoCursor = x->cursor;
            
            if (!x->internals->isEmpty()) {
                
                for (i = 1; i <= x->arraySize; i++) {
                    
                    jamoma_edit_numeric_instance(x->arrayFormatInteger, &instanceAddress, i);
					x->cursor = TTSymbol(instanceAddress->s_name);
                    
                    jamoma_viewer_send((TTViewerPtr)selectedObject, _sym_nothing, d, argv+((i-1)*d));
                }
            }
            
            x->cursor = memoCursor;
        }
        else
            object_error((ObjectPtr)x, "array : the array message size have to be a multiple of the array size");
		
	}
	else
		object_error((ObjectPtr)x, "array : the array is empty");
}

void remote_array_return_value(TTPtr baton, TTValue& v)
{
	WrappedModularInstancePtr	x;
	TTValue						array, g;
	TTValuePtr					b, m;
	SymbolPtr					msg, iAdrs;
	long						argc = 0;
	TTUInt8						i;
	AtomPtr						argv = NULL;
	TTBoolean					shifted = NO;
	TTSymbol					memoCursor;
	
	// unpack baton (a t_object* and the name of the method to call (default : jps_return_value))
	b = (TTValuePtr)baton;
	x = WrappedModularInstancePtr((TTPtr)(*b)[0]);
	i = (*b)[1];
	
	// output index
	if (x->arrayIndex == 0) {
		jamoma_edit_numeric_instance(x->arrayFormatInteger, &iAdrs, i);
		x->cursor = TTSymbol(iAdrs->s_name);
	}

	outlet_int(x->outlets[index_out], i);
	
	// store value
	if (EXTRA->arrayValue) {
		
		// delete former value
		if (EXTRA->arrayValue[i-1])
			delete EXTRA->arrayValue[i-1];
		
		// store new value
		m = new TTValue(v);
		EXTRA->arrayValue[i-1] = m;
	}
	
	// in array output mode 
	// edit a value containing all values
	if (x->arrayAttrFormat == gensym("array")) {
		
		if (EXTRA->arrayValue)
			for (i = 0; i < x->arraySize; i++) {
				
				// if the view have not been updated yet
				m = EXTRA->arrayValue[i];
				if (m == NULL) {
					
					memoCursor = x->cursor;
					jamoma_edit_numeric_instance(x->arrayFormatInteger, &iAdrs, i+1);
					x->cursor = TTSymbol(iAdrs->s_name);
					selectedObject->getAttributeValue(kTTSym_valueDefault, g);
					
					m = new TTValue(g);
					
					EXTRA->arrayValue[i] = m;
					x->cursor = memoCursor;
				}
				
				TTValue v = *m;
				v.prepend(array);
				array = v;
				
				// TODO : a real append method for value !
				//array.append((TTValuePtr)m);
			}
        
		// output array value
		jamoma_ttvalue_to_typed_Atom(array, &msg, &argc, &argv, shifted);
        
        // append to the list used by qelem
        EXTRA->ui_qelem_list->append(array);
	}
	else {
        
		// output single value
		jamoma_ttvalue_to_typed_Atom(v, &msg, &argc, &argv, shifted);
        
        // append to the list used by qelem
        EXTRA->ui_qelem_list->append(v);
    }
	
	// avoid blank before data
	if (msg == _sym_nothing)
		outlet_atoms(x->outlets[data_out], argc, argv);
	else
		outlet_anything(x->outlets[data_out], msg, argc, argv);
	
    // call the queue function
    qelem_set(EXTRA->ui_qelem);
	
	if (shifted)
		argv--;
	sysmem_freeptr(argv);
}

void remote_ui_queuefn(TTPtr self)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	long						argc;
	AtomPtr						argv;
    TTValue                     v;
    
    for (EXTRA->ui_qelem_list->begin();
         EXTRA->ui_qelem_list->end();
         EXTRA->ui_qelem_list->next()) {
    
        argc = 0;
        argv = NULL;
        jamoma_ttvalue_to_Atom(EXTRA->ui_qelem_list->current(), &argc, &argv);
	
        if (x->arrayAttrFormat == gensym("array"))
            outlet_anything(x->outlets[set_out], gensym("setlist"), argc, argv);
        else
            outlet_anything(x->outlets[set_out], _sym_set, argc, argv);
    
        sysmem_freeptr(argv);
    }
    
    EXTRA->ui_qelem_list->clear();
}

void remote_create_model_address_receiver(TTPtr self)
{
    WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTValue			args;
	TTObjectBasePtr	returnValueCallback;
	TTValuePtr		returnValueBaton;
	
    // don't need to get the receiver address back
	args.append(NULL);
	
	returnValueCallback = NULL;			// without this, TTObjectBaseInstantiate try to release an oldObject that doesn't exist ... Is it good ?
	TTObjectBaseInstantiate(TTSymbol("callback"), &returnValueCallback, kTTValNONE);
    
	returnValueBaton = new TTValue(TTPtr(x));
    returnValueBaton->append(TTPtr(gensym("return_model_address")));
    returnValueBaton->append(YES);    // YES : we want to deferlow this method
    
	returnValueCallback->setAttributeValue(kTTSym_baton, TTPtr(returnValueBaton));
	returnValueCallback->setAttributeValue(kTTSym_function, TTPtr(&jamoma_callback_return_value_typed));
	args.append(returnValueCallback);
	
	EXTRA->modelAddressReceiver = NULL;
	TTObjectBaseInstantiate(kTTSym_Receiver, TTObjectBaseHandle(&EXTRA->modelAddressReceiver), args);
}

void remote_free_model_address_receiver(TTPtr self)
{
    WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
    
    TTObjectBaseRelease(&EXTRA->modelAddressReceiver);
    
    EXTRA->modelAddressReceiver = NULL;
}

void remote_return_model_address(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	SymbolPtr			instanceAddress;
	TTAddress           address;
	TTSymbol			service;
	TTList				returnedNodes;
	TTUInt8				i;
	TTValue				v;
	
	if (msg) {
		
		if (x->internals) {
			
			// Starts iteration on internals
			x->iterateInternals = YES;
			
			for (i = 1; i <= x->arraySize; i++) {
				
				jamoma_edit_numeric_instance(x->arrayFormatInteger, &instanceAddress, i);
				x->cursor = TTSymbol(instanceAddress->s_name);
				
				// set address attribute of the internal Viewer object
				address = TTAddress(msg->s_name).appendAddress(TTAddress(instanceAddress->s_name));
				selectedObject->setAttributeValue(kTTSym_address, address);
                
                JamomaDebug object_post((ObjectPtr)x, "binds on %s", address.c_str());
			}
			
			// Ends iteration on internals
			x->iterateInternals = NO;

			EXTRA->countSubscription = 0;
		}
	}
}