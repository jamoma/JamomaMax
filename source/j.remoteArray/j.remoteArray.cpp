/** @file
 *
 * @ingroup implementationMaxExternals
 *
 * @brief j.remoteArray : An array of j.remote objects
 *
 * @details Useful when designing views and more.
 *
 * @authors Théo de la Hogue, Trond Lossius
 *
 * @copyright © 2011 by Théo de la Hogue @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */


#include "TTModularClassWrapperMax.h"

#define set_out 0
#define data_out 1
#define index_out 2
#define	dump_out 3


// This is used to store extra data
typedef struct extra {
    
    TTObject        modelAddressReceiver;	// the internal model:address receiver (not registered inside internals)
	TTBoolean		changingAddress;        // a flag to protect from succession of address changes
	TTPtr			ui_qelem;               // to output "qlim'd" data for ui object
    TTListPtr       ui_qelem_list;          // a list of defered value to output
	TTUInt32		countSubscription;      // to count how many time we try to subscribe
    TTListPtr       values;                 // store all values in a list for array format
    TTBoolean       setting;                // a flag to know if the remote array is updated by a set message
} t_extra;
#define EXTRA ((t_extra*)x->extra)

// Definitions
void		WrapTTViewerClass(WrappedClassPtr c);
void		WrappedViewerClass_new(TTPtr self, long argc, t_atom *argv);
void		WrappedViewerClass_free(TTPtr self);

void		remote_assist(TTPtr self, TTPtr b, long msg, long arg, char *dst);

void		remote_new_address(TTPtr self, t_symbol *address);
void		remote_array_create(TTPtr self, TTObject& returnedViewer, TTUInt32 index);
void		remote_array_subscribe(TTPtr self, t_symbol *address);
void		remote_array_select(TTPtr self, t_symbol *msg, long argc, t_atom *argv);
void		remote_address(TTPtr self, t_symbol *name);

void		remote_array_return_value(const TTValue& baton, const TTValue& v);

void        remote_create_model_address_receiver(TTPtr self);
void        remote_free_model_address_receiver(TTPtr self);
void		remote_return_model_address(TTPtr self, t_symbol *msg, long argc, t_atom *argv);

void		WrappedViewerClass_anything(TTPtr self, t_symbol *msg, long argc, t_atom *argv);
void		remote_bang(TTPtr self);
void		remote_int(TTPtr self, long value);
void		remote_float(TTPtr self, double value);
TTErr       remote_list(TTPtr self, t_symbol *msg, long argc, t_atom *argv);

TTErr		remote_array(TTPtr self, t_symbol *msg, long argc, t_atom *argv);

void		remote_set(TTPtr self, t_symbol *msg, long argc, t_atom *argv);
void		remote_set_array(TTPtr self, t_symbol *msg, long argc, t_atom *argv);

void		remote_ui_queuefn(TTPtr self);

int TTCLASSWRAPPERMAX_EXPORT main(void)
{
	ModularSpec *spec = new ModularSpec;
	spec->_wrap = &WrapTTViewerClass;
	spec->_new = &WrappedViewerClass_new;
	spec->_free = &WrappedViewerClass_free;
	spec->_any = &WrappedViewerClass_anything;

	return wrapTTModularClassAsMaxClass(kTTSym_Viewer, "j.remoteArray", NULL, spec);
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
    
    class_addmethod(c->maxClass, (method)remote_set,						"set",                  A_GIMME, 0);
    class_addmethod(c->maxClass, (method)remote_set_array,					"setArray",				A_GIMME, 0);
	
	class_addmethod(c->maxClass, (method)remote_address,					"address",				A_SYM,0);
}

void WrappedViewerClass_new(TTPtr self, long argc, t_atom *argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	long						attrstart = attr_args_offset(argc, argv);			// support normal arguments
	t_symbol					*address;
	TTValue						none;
	
	// check address argument
	address = _sym_nothing;
	if (attrstart && argv)
		if (atom_gettype(argv) == A_SYM)
			address = atom_getsym(argv);

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
	
    x->useInternals = YES;
    x->internals.setThreadProtection(YES);
    
	x->arraySize = 0;
	x->arrayIndex = 0;
	x->arrayAddress = kTTAdrsEmpty;
	x->arrayArgs = none;
	x->arrayAttrFormat = gensym("single");
	
	// Prepare extra data for parameters and messages
	x->extra = (t_extra*)malloc(sizeof(t_extra));

	EXTRA->changingAddress = NO;
	EXTRA->ui_qelem = qelem_new(x, (method)remote_ui_queuefn);
    EXTRA->ui_qelem_list = new TTList();
	EXTRA->countSubscription = 0;
    EXTRA->values = new TTList();
    
    // create model:address receiver
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
	defer_low((t_object*)x, (method)remote_new_address, address, 0, NULL);
}

void WrappedViewerClass_free(TTPtr self)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	
    if (EXTRA) {
        
        // delete model:address receiver
        remote_free_model_address_receiver(self);
        
        qelem_free(EXTRA->ui_qelem);
        
        delete EXTRA->ui_qelem_list;
        
        delete EXTRA->values;
        
        free(EXTRA);
    }
}

void remote_new_address(TTPtr self, t_symbol *address)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	long					argc = 0; 
	t_atom*						argv = NULL;
	TTUInt32					number;
	TTUInt32					i;
	TTAddress                   newAddress = TTAddress(address->s_name);
	t_symbol					*instanceAddress;
	TTObject                    anObject;
	TTValue						v;
		
    x->cursor = kTTSymEmpty;
    x->arrayAddress = newAddress;
    
    number = jamoma_parse_bracket(address, x->arrayFormatInteger, x->arrayFormatString);
    
    // don't resize to 0
    if (number && number <= MAX_ARRAY_SIZE) {
        
        // Starts iteration on internals
        x->iterateInternals = YES;
        
        x->arraySize = number;
        
        EXTRA->values->clear();

        for (i = 1; i <= x->arraySize; i++) {
            
            jamoma_edit_numeric_instance(x->arrayFormatInteger, &instanceAddress, i);
            
            remote_array_create(x, anObject, i);
            
            // append the viewer to the internals table
            v = TTValue(anObject);
            v.append(TTSymbol(instanceAddress->s_name));
            v.append((TTPtr)NULL);
            
            x->internals.append(TTSymbol(instanceAddress->s_name), v);
            
            // inverse values order for iteration purpose (see in remote_array_return_value : array mode)
            v.clear();
            EXTRA->values->insert(0, v);
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
        
        // attach the j.remote to connected ui object
        //remote_attach(self);
    }
    else if (number > MAX_ARRAY_SIZE)
        object_error((t_object*)x, "the size is greater than the maximum array size (%d)", MAX_ARRAY_SIZE);
}

void remote_array_create(TTPtr self, TTObject& returnedViewer, TTUInt32 index)
{
	TTValue	baton;
	
	returnedViewer = TTObject(kTTSym_Viewer);
    
    baton = TTValue(self, index);
	returnedViewer.set(kTTSym_baton, baton);
	returnedViewer.set(kTTSym_function, TTPtr(&remote_array_return_value));
}

void remote_array_subscribe(TTPtr self, t_symbol *address)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	t_symbol					*instanceAddress;
	TTAddress                   contextAddress = kTTAdrsEmpty;
	TTAddress                   absoluteAddress, returnedAddress;
    TTNodePtr                   returnedNode = NULL;
    TTNodePtr                   returnedContextNode = NULL;
	TTObject                    toSubscribe;
	TTBoolean					subscribe;
	TTObject                    aSubscriber;
	TTUInt32					i;
	TTValue						v;
	t_atom						a[1];
	
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
	jamoma_patcher_get_info((t_object*)x, &x->patcherPtr, x->patcherContext, x->patcherClass, x->patcherName);

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
			toSubscribe = TTObject();
		
		if (!jamoma_subscriber_create((t_object*)x, toSubscribe, TTAddress(instanceAddress->s_name), aSubscriber, returnedAddress, &returnedNode, &returnedContextNode)) {
			
			// get the context address to make
			// a viewer on the contextAddress/model:address attribute
			aSubscriber.get("contextAddress", v);
			contextAddress = v[0];
			
			// append the subscriber to the internal
			if (aSubscriber.valid()) {
				
				v = TTValue(selectedObject);
				v.append(x->cursor);
				v.append(aSubscriber);
				
				// replace the internal
				x->internals.remove(x->cursor);
				x->internals.append(x->cursor, v);
			}
		}
		
		// else, if no context, set address directly
		else if (x->patcherContext == kTTSymEmpty) {
			contextAddress = kTTAdrsRoot;
			absoluteAddress = contextAddress.appendAddress(TTAddress(instanceAddress->s_name));
			selectedObject->setAttributeValue(kTTSym_address, absoluteAddress);
			
			atom_setsym(a, gensym((char*)absoluteAddress.c_str()));
			object_obex_dumpout((t_object*)x, gensym("address"), 1, a);
			continue;
		}
		
		// if an object can't subscribe, the other objects will fail too
		break;
	}
	
	// Ends iteration on internals
	x->iterateInternals = NO;
	
	// if the subscription success
	if (contextAddress != kTTAdrsEmpty) {
		
        // make the model:address receiver binds on the model:address attribute
        EXTRA->modelAddressReceiver.set(kTTSym_address, contextAddress.appendAddress(TTAddress("model:address")));
        
		// get the model:address value
        EXTRA->modelAddressReceiver.send(kTTSym_Get);
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
		
		if (!x->internals.lookup(x->cursor, v)) {
			
			aSubscriber = v[2];
			
			// release the subscriber
			if (aSubscriber.valid())
				aSubscriber = TTObject();
			
			// keep only the viewer object and his address
			v.set(2, (TTPtr)NULL);
			
			// replace the internal
			x->internals.remove(x->cursor);
			x->internals.append(x->cursor, v);
		}
	}
	
	// Ends iteration on internals
	x->iterateInternals = NO;
	
	EXTRA->countSubscription++; // the index member is usefull to count how many time the external tries to bind
	if (EXTRA->countSubscription > 100) {
		object_error((t_object*)x, "tries to bind too many times on %s", address->s_name);
		object_obex_dumpout((t_object*)x, gensym("error"), 0, NULL);
		return;
	}
	
	// The following must be deferred because we have to interrogate our box,
	// and our box is not yet valid until we have finished instantiating the object.
	// Trying to use a loadbang method instead is also not fully successful (as of Max 5.0.6)
	defer_low((t_object*)x, (method)remote_array_subscribe, address, 0, NULL);
}

void remote_address(TTPtr self, t_symbol *address)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTObject        anObject, aSubscriber;
	t_symbol		*instanceAddress;
	TTValue			v;
	TTUInt32		i;
	
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
                    
                    if (!x->internals.lookup(x->cursor, v))
                        x->internals.remove(x->cursor);
                }
                
                // Ends iteration on internals
                x->iterateInternals = NO;
                
                x->arraySize = 0;

                // rebuild internals
                EXTRA->countSubscription = 0;
                x->internals.clear();
                defer(self,(method)remote_new_address, address, 0, NULL);
            }
        }
        
        EXTRA->changingAddress = NO;
        return;
	}
    
    object_error((t_object*)x, "can't change to %s address. Please defer low", address->s_name);
}

// Method for Assistance Messages
void remote_assist(TTPtr self, TTPtr b, long msg, long arg, char *dst)
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
	
	if (x->arraySize > 0)
		remote_list(self, _sym_bang, 0, NULL);
	else
		object_error((t_object*)x, "bang : the array is empty");
}

void remote_int(TTPtr self, long value)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	t_atom a;

	if (proxy_getinlet((t_object*)x)) {
		atom_setlong(&a, value);
		wrappedModularClass_ArraySelect(self, _sym_nothing, 1, &a);
	}
	else {
		if (x->arraySize > 0) {
			atom_setlong(&a, value);
			remote_list(self, _sym_int, 1, &a);
		}
		else
			object_error((t_object*)x, "int : the array is empty");
	}
}

void remote_float(TTPtr self, double value)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	t_atom a;
	
	if (x->arraySize > 0) {
        
		atom_setfloat(&a, value);
		remote_list(self, _sym_float, 1, &a);
	}
	else
		object_error((t_object*)x, "float : the array is empty");
}

TTErr remote_list(TTPtr self, t_symbol *msg, long argc, t_atom *argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
    TTErr err = kTTErrNone;

	if (x->arraySize > 0) {
		
		// send to each view
		if (x->arrayIndex == 0) {
			TTValue     keys;
            
			if (!x->internals.isEmpty()) {
				x->internals.getKeys(keys);
				for (int i = 0; i < keys.size(); i++) {
                    
					x->cursor = keys[i];
                    
					if (jamoma_viewer_send(selectedObject, msg, argc, argv))
                        
                        err = kTTErrGeneric;
				}
			}
            
			x->cursor = kTTSymEmpty;
            
            return err;
		}
		else
			return jamoma_viewer_send((TTViewerPtr)selectedObject, msg, argc, argv);
	}
	else
		object_error((t_object*)x, "list : the array is empty");
    
    return kTTErrGeneric;
}

void WrappedViewerClass_anything(TTPtr self, t_symbol *msg, long argc, t_atom *argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	
	if (proxy_getinlet((t_object*)x)) {
		wrappedModularClass_ArraySelect(self, msg, argc, argv);
	}
	else {
		
		// send to each view
		if (x->arrayIndex == 0) {
			TTValue keys;
			if (!x->internals.isEmpty()) {
				x->internals.getKeys(keys);
				for (int i = 0; i < keys.size(); i++) {
					x->cursor = keys[i];
					jamoma_viewer_send(selectedObject, msg, argc, argv);
				}
				x->cursor = kTTSymEmpty;
			}
		}
		else
			jamoma_viewer_send(selectedObject, msg, argc, argv);
	}
}

TTErr remote_array(TTPtr self, t_symbol *msg, long argc, t_atom *argv)
{
    WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
    TTInt32     d, i;
    t_symbol	*instanceAddress;
    TTSymbol	memoCursor;
    TTErr       err = kTTErrNone;
    
	if (x->arraySize > 0) {
		
		// is the incoming data size is a multiple of the array size ?
        d = argc / x->arraySize;
        if ((d * x->arraySize) == argc) {
            
            memoCursor = x->cursor;
            
            if (!x->internals.isEmpty()) {
                
                for (i = 1; i <= x->arraySize; i++) {
                    
                    jamoma_edit_numeric_instance(x->arrayFormatInteger, &instanceAddress, i);
					x->cursor = TTSymbol(instanceAddress->s_name);
                    
                    if (jamoma_viewer_send(selectedObject, _sym_nothing, d, argv+((i-1)*d)))
                        
                        err = kTTErrGeneric;
                }
            }
            
            x->cursor = memoCursor;
            
            return err;
        }
        else
            object_error((t_object*)x, "array : the array message size have to be a multiple of the array size");
		
	}
	else
		object_error((t_object*)x, "array : the array is empty");
    
    return kTTErrGeneric;
}

void remote_set(TTPtr self, t_symbol *msg, long argc, t_atom *argv)
{
    WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	
    EXTRA->setting = YES;

    if (remote_list(self, _sym_nothing, argc, argv))
        
        EXTRA->setting = NO;
}

void remote_set_array(TTPtr self, t_symbol *msg, long argc, t_atom *argv)
{
    WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	
    EXTRA->setting = YES;
    
	if (remote_array(self, _sym_nothing, argc, argv))
        
        EXTRA->setting = NO;
}

void remote_array_return_value(const TTValue& baton, const TTValue& v)
{
    WrappedModularInstancePtr	x;
	TTValue						array;
	t_symbol					*msg, *iAdrs;
	long						argc = 0;
	TTUInt32					i, j;
	t_atom*						argv = NULL;
	TTBoolean					shifted = NO;
    
	// unpack baton (a t_object* and the index of the value)
	x = WrappedModularInstancePtr((TTPtr)baton[0]);
	i = baton[1];
    
    // a gate to not output the value if it have been set by this j.remoteArray
    if (EXTRA->setting) {
        EXTRA->setting = NO;
        return;
    }
	
	// output index
	if (x->arrayIndex == 0) {
		jamoma_edit_numeric_instance(x->arrayFormatInteger, &iAdrs, i);
		x->cursor = TTSymbol(iAdrs->s_name);
	}
    
	outlet_int(x->outlets[index_out], i);
		
	// in array output mode
	// edit a value containing all values
	if (x->arrayAttrFormat == gensym("array")) {
        
        // don't output array when changing address
        if (EXTRA->changingAddress)
            return;

        // get each values in reverse order
        j = EXTRA->values->getSize();
        
        for (EXTRA->values->begin();
             EXTRA->values->end();
             EXTRA->values->next()) {
            
            // store the incoming value at the right index
            if (j == i)
                EXTRA->values->current() = v;
            
            // add the stored value
            if (EXTRA->values->current().size())
                array.prepend(EXTRA->values->current());
            
            // use 0. as default value
            else
                array.prepend(0.);
            
            j--;
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
	t_atom*						argv;
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
	TTValue     args, baton, none;
	TTObject    returnValueCallback;
	
    // don't need to get the receiver address back
	args.append(NULL);
	
	returnValueCallback = TTObject("callback");
    
	baton = TTValue(TTPtr(x), TTPtr(gensym("return_model_address")), YES);  // YES : we want to deferlow this method
	returnValueCallback.set(kTTSym_baton, baton);
	returnValueCallback.set(kTTSym_function, TTPtr(&jamoma_callback_return_value_typed));
	args.append(returnValueCallback);
	
	EXTRA->modelAddressReceiver = TTObject(kTTSym_Receiver, args);
}

void remote_free_model_address_receiver(TTPtr self)
{
    WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
    
    EXTRA->modelAddressReceiver = TTObject();
}

void remote_return_model_address(TTPtr self, t_symbol *msg, long argc, t_atom *argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	t_symbol			*instanceAddress;
	TTAddress           address;
	TTSymbol			service;
	TTList				returnedNodes;
	TTUInt32			i;
	TTValue				v;
	
	if (msg) {
		
        // Starts iteration on internals
        x->iterateInternals = YES;
        
        for (i = 1; i <= x->arraySize; i++) {
            
            jamoma_edit_numeric_instance(x->arrayFormatInteger, &instanceAddress, i);
            x->cursor = TTSymbol(instanceAddress->s_name);
            
            // set address attribute of the internal Viewer object
            address = TTAddress(msg->s_name).appendAddress(TTAddress(instanceAddress->s_name));
            selectedObject->setAttributeValue(kTTSym_address, address);
            
            JamomaDebug object_post((t_object*)x, "binds on %s", address.c_str());
        }
        
        // Ends iteration on internals
        x->iterateInternals = NO;
        
        EXTRA->countSubscription = 0;
	}
}