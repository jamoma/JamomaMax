/* 
 *	jcom.parameter/message/return
 *	External object
 *	Copyright © 2010 by Théo de la Hogue
 * 
 * License: This code is licensed under the terms of the "New BSD License"
 * http://creativecommons.org/licenses/BSD/
 */

#include "TTModularClassWrapperMax.h"

#define data_out 0
#define index_out 1
#define	dump_out 2


// This is used to store extra data
typedef struct extra {
	
#ifndef JMOD_RETURN
	TTValuePtr			*arrayValue;		// store each value in an array to output them together
#endif
	
	TTBoolean			changingAddress;	// a flag to protect from succession of address changes
	TTBoolean			firstArray;			// a flag to know if it is the first instanciation (do not init data)

} t_extra;
#define EXTRA ((t_extra*)x->extra)


// Definitions
void		WrapTTDataClass(WrappedClassPtr c);
void		WrappedDataClass_new(TTPtr self, AtomCount argc, AtomPtr argv);
void		WrappedDataClass_free(TTPtr self);

void		data_assist(TTPtr self, TTPtr b, long msg, AtomCount arg, char *dst);

void		data_new_address(TTPtr self, SymbolPtr msg);
void		data_array_create(TTPtr self, TTObjectBasePtr *returnedData, TTSymbol service, TTUInt8 index);
void		data_address(TTPtr self, SymbolPtr name);

#ifndef JMOD_RETURN
void		data_array_return_value(TTPtr baton, TTValue& v);
#endif

#ifndef JMOD_MESSAGE
void		WrappedDataClass_anything(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);
void		data_bang(TTPtr self);
void		data_int(TTPtr self, long value);
void		data_float(TTPtr self, double value);
void		data_list(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);

void		data_array(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);

void		data_inc(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);
void		data_dec(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);
#endif

int TTCLASSWRAPPERMAX_EXPORT main(void)
{
	ModularSpec *spec = new ModularSpec;
	spec->_wrap = &WrapTTDataClass;
	spec->_new = &WrappedDataClass_new;
	spec->_free = &WrappedDataClass_free;
#ifndef JMOD_MESSAGE
	spec->_any = &WrappedDataClass_anything;
#else
	spec->_any = NULL;
#endif
	
#ifdef JMOD_MESSAGE
	return wrapTTModularClassAsMaxClass(kTTSym_Data, "jcom.messageArray", NULL, spec);
#endif
	
#ifdef JMOD_RETURN
	return wrapTTModularClassAsMaxClass(kTTSym_Data, "jcom.returnArray", NULL, spec);
#endif
	
#ifndef JMOD_MESSAGE
#ifndef JMOD_RETURN
	return wrapTTModularClassAsMaxClass(kTTSym_Data, "jcom.parameterArray", NULL, spec);
#endif
#endif
}

void WrapTTDataClass(WrappedClassPtr c)
{
	class_addmethod(c->maxClass, (method)data_assist,						"assist",				A_CANT, 0L);
	
#ifndef JMOD_MESSAGE	
	class_addmethod(c->maxClass, (method)data_bang,							"bang",					0L);
	class_addmethod(c->maxClass, (method)data_int,							"int",					A_LONG, 0);
	class_addmethod(c->maxClass, (method)data_float,						"float",				A_FLOAT, 0);
	class_addmethod(c->maxClass, (method)data_list,							"list",					A_GIMME, 0);
    
    class_addmethod(c->maxClass, (method)data_array,						"array",				A_GIMME, 0);
	
	class_addmethod(c->maxClass, (method)data_inc,							"+",					A_GIMME, 0);
	class_addmethod(c->maxClass, (method)data_dec,							"-",					A_GIMME, 0);
#endif
	
	class_addmethod(c->maxClass, (method)data_address,						"address",				A_SYM,0);
}

void WrappedDataClass_new(TTPtr self, AtomCount argc, AtomPtr argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	SymbolPtr					relativeAddress;
	long						attrstart = attr_args_offset(argc, argv);			// support normal arguments
	
	// check address argument
	relativeAddress = _sym_nothing;
	if (attrstart && argv)
		if (atom_gettype(argv) == A_SYM)
			relativeAddress = atom_getsym(argv);
	
	if (relativeAddress == _sym_nothing) {
		object_error((ObjectPtr)x, "needs a name as first argument");
		x->extra = NULL;
		return;
	}
	
#ifndef JMOD_MESSAGE
	// add an inlet for the index
	x->inlets = (TTHandle)sysmem_newptr(sizeof(TTPtr) * 1);
	x->inlets[0] = proxy_new(x, 1, &x->index);	// use this member to store index (because index is used for data array)
	
#endif
	
	// Make outlets (before attr_args_process)
	/////////////////////////////////////////////////////////////////////////////////
	
#ifndef JMOD_RETURN
	// Don't create outlets during dynamic changes
	x->outlets = (TTHandle)sysmem_newptr(sizeof(TTPtr) * 2);
	x->outlets[index_out] = outlet_new(x, NULL);					// long outlet to output data index
	x->outlets[data_out] = outlet_new(x, NULL);						// anything outlet to output data
#endif
	
	x->arraySize = 0;
	x->arrayIndex = 0;
	x->arrayAddress = kTTAdrsEmpty;
	x->arrayArgs = kTTValNONE;
	x->arrayAttrFormat = gensym("single");
	
	// Prepare extra data for parameters and messages
	x->extra = (t_extra*)malloc(sizeof(t_extra));
	
#ifndef JMOD_RETURN
	EXTRA->arrayValue = NULL;
#endif
	EXTRA->changingAddress = NO;
	EXTRA->firstArray = YES;
	
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
	defer_low((ObjectPtr)x, (method)data_new_address, relativeAddress, 0, NULL);
}

void WrappedDataClass_free(TTPtr self)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	
#ifndef JMOD_RETURN
	// delete array
	if (x->extra && EXTRA->arrayValue) {
		for (TTUInt8 i = 0; i < x->arraySize; i++)
			if (EXTRA->arrayValue[i])
				delete EXTRA->arrayValue[i];
		
		free(EXTRA->arrayValue);
	}
#endif
	
	free(EXTRA);
}

void data_new_address(TTPtr self, SymbolPtr relativeAddress)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	AtomCount					argc = 0; 
	AtomPtr						argv = NULL;
	TTUInt32					number;
	TTUInt8						i, j;
	TTAddress					newAddress = relativeAddress->s_name;
    TTAddress                   returnedAddress;
    TTNodePtr                   returnedNode = NULL;
    TTNodePtr                   returnedContextNode = NULL;
	SymbolPtr					instanceAddress;
	TTObjectBasePtr				anObject;
	TTSubscriberPtr				aSubscriber;
	TTValue						v;
    
    x->useInternals = YES;
    x->internals = new TTHash();
    x->internals->setThreadProtection(YES);
    x->cursor = kTTSymEmpty;
    x->arrayAddress = newAddress;
    
    if (x->arrayAddress.getType() == kAddressRelative) {
        
        number = jamoma_parse_bracket(relativeAddress, x->arrayFormatInteger, x->arrayFormatString);
        
        // don't resize to 0
        if (number && number <= 255) {
            
            // Starts iteration on internals
            x->iterateInternals = YES;
            
            x->arraySize = number;
            
#ifndef JMOD_RETURN
            // prepare arrayValue
            EXTRA->arrayValue = (TTValuePtr*)malloc(sizeof(TTValuePtr)*number);
            for (j = 0 ; j < x->arraySize; j++)
                EXTRA->arrayValue[j] = NULL;
#endif
            
            for (i = 1; i <= x->arraySize; i++) {
                
                jamoma_edit_numeric_instance(x->arrayFormatInteger, &instanceAddress, i);
                
                // create a data
#ifdef JMOD_MESSAGE
                data_array_create(self, &anObject, kTTSym_message, i);
#endif
                
#if JMOD_RETURN
                data_array_create(self, &anObject, kTTSym_return, i);
#endif
                
#ifndef JMOD_MESSAGE
#ifndef JMOD_RETURN
                data_array_create(self, &anObject, kTTSym_parameter, i);
#endif
#endif
                aSubscriber = NULL;
                if (!jamoma_subscriber_create((ObjectPtr)x, anObject, TTAddress(instanceAddress->s_name),  &aSubscriber, returnedAddress, &returnedNode, &returnedContextNode)) {
                    
                    if (aSubscriber) {
                        // append the data to the internals table
                        v = TTValue(anObject);
                        v.append(TTSymbol(instanceAddress->s_name));
                        v.append(TTObjectBasePtr(aSubscriber));
                        x->internals->append(TTSymbol(instanceAddress->s_name), v);
                    }
                }
            }
            
            // Ends iteration on internals
            x->iterateInternals = NO;
            
            // handle args
            jamoma_ttvalue_to_Atom(x->arrayArgs, &argc, &argv);
            if (argc && argv)
                attr_args_process(x, argc, argv);
            
            // select all datas
            wrappedModularClass_ArraySelect(self, gensym("*"), 0, NULL);
            
#ifndef JMOD_MESSAGE
            // reset all datas created dynamically
            if (!EXTRA->firstArray)
                defer((ObjectPtr)x, (method)wrappedModularClass_anything, _sym_reset, 0, NULL);
#endif
        }
        
        EXTRA->firstArray = NO;
    }
    else
        object_error((ObjectPtr)x, "can't register because %s is not a relative address", relativeAddress->s_name);
}

void data_array_create(TTPtr self, TTObjectBasePtr *returnedData, TTSymbol service, TTUInt8 index)
{
	TTValue			args;
	TTObjectBasePtr	returnValueCallback;
	TTValuePtr		returnValueBaton;
	
	// prepare arguments
	
	returnValueCallback = NULL;			// without this, TTObjectBaseInstantiate try to release an oldObject that doesn't exist ... Is it good ?
	TTObjectBaseInstantiate(TTSymbol("callback"), &returnValueCallback, kTTValNONE);
#ifndef JMOD_RETURN
	returnValueBaton = new TTValue(self);
	returnValueBaton->append(index);
	returnValueCallback->setAttributeValue(kTTSym_baton, TTPtr(returnValueBaton));
	returnValueCallback->setAttributeValue(kTTSym_function, TTPtr(&data_array_return_value));
#endif
	
	args.append(returnValueCallback);
	
	args.append(service);
	
	*returnedData = NULL;
	TTObjectBaseInstantiate(kTTSym_Data, TTObjectBaseHandle(returnedData), args);
}

void data_address(TTPtr self, SymbolPtr address)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	
	// Avoid succession of address changes
    if (!EXTRA->changingAddress) {
        
        EXTRA->changingAddress = YES;
        
        // filter repetitions
        if (!(x->arrayAddress == TTAddress(address->s_name))) {
            
            if (!x->iterateInternals) {
                
                // unregister internals
                wrappedModularClass_unregister(x);
                
#ifndef JMOD_RETURN
                // delete array
                if (EXTRA->arrayValue) {
                    for (TTUInt8 i = 0; i < x->arraySize; i++)
                        if (EXTRA->arrayValue[i])
                            delete EXTRA->arrayValue[i];
                    
                    x->arraySize = 0;
                    free(EXTRA->arrayValue);
                }
#endif
                
                // rebuild internals
                defer(self,(method)data_new_address, address, 0, NULL);
            }
        }
        
        EXTRA->changingAddress = NO;
        return;
	}
	
    object_error((ObjectPtr)x, "can't change to %s address. Please defer low", address->s_name);
}

// Method for Assistance Messages
void data_assist(TTPtr self, TTPtr b, long msg, AtomCount arg, char *dst)
{
	if (msg == 1) {					// Inlet
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

#ifndef JMOD_MESSAGE
void data_bang(TTPtr self)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	
	if (x->internals) {
		data_list(self, _sym_bang, 0, NULL);
	}
	else
		object_error((ObjectPtr)x, "bang : the array is empty");
}

void data_int(TTPtr self, long value)
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
			data_list(self, _sym_int, 1, &a);
		}
		else
			object_error((ObjectPtr)x, "int : the array is empty");
	}
}

void data_float(TTPtr self, double value)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	t_atom a;
	
	if (x->internals) {
		atom_setfloat(&a, value);
		data_list(self, _sym_float, 1, &a);
	}
	else
		object_error((ObjectPtr)x, "float : the array is empty");
}

void data_list(TTPtr self, SymbolPtr msg, long argc, t_atom *argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	
	if (x->internals) {
		
		// send to each data
		if (x->arrayIndex == 0) {
			TTValue keys;
			if (!x->internals->isEmpty()) {
				x->internals->getKeys(keys);
				for (TTUInt32 i = 0; i < keys.size(); i++) {
					x->cursor = keys[i];
					jamoma_data_command((TTDataPtr)selectedObject, msg, argc, argv);
				}
			}
			x->cursor = kTTSymEmpty;
		}
		else
			jamoma_data_command((TTDataPtr)selectedObject, msg, argc, argv);
		
	}
	else
		object_error((ObjectPtr)x, "list : the array is empty");
}

void WrappedDataClass_anything(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	
	if (proxy_getinlet((ObjectPtr)x)) {
		wrappedModularClass_ArraySelect(self, msg, argc, argv);
	}
	else {
		
		// send to each data
		if (x->arrayIndex == 0) {
			TTValue keys;
			if (!x->internals->isEmpty()) {
				x->internals->getKeys(keys);
				for (TTUInt32 i=0; i<keys.size(); i++) {
					x->cursor = keys[i];
					jamoma_data_command((TTDataPtr)selectedObject, msg, argc, argv);
				}
				x->cursor = kTTSymEmpty;
			}
		}
		else
			jamoma_data_command((TTDataPtr)selectedObject, msg, argc, argv);
	}
}

void data_array(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
    WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
    TTInt32     d, i;
    SymbolPtr	instanceAddress;
    TTSymbol    memoCursor;
    
	if (x->internals) {
		
		// is the incoming data size is a multiple of the array size ?
        d = argc / x->arraySize;
        if ((d * x->arraySize) == argc) {
            
            memoCursor = x->cursor;
            
            if (!x->internals->isEmpty()) {
                
                for (i = 1; i <= x->arraySize; i++) {
                    
                    jamoma_edit_numeric_instance(x->arrayFormatInteger, &instanceAddress, i);
					x->cursor = TTSymbol(instanceAddress->s_name);

                    jamoma_data_command((TTDataPtr)selectedObject, _sym_nothing, d, argv+((i-1)*d));
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
#endif

#ifndef JMOD_MESSAGE
void data_inc(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTValue v;
	
	jamoma_ttvalue_from_Atom(v, _sym_nothing, argc, argv);
	selectedObject->sendMessage(TTSymbol("Inc"), v, kTTValNONE);
}

void data_dec(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTValue v;
	
	jamoma_ttvalue_from_Atom(v, _sym_nothing, argc, argv);
	selectedObject->sendMessage(TTSymbol("Dec"), v, kTTValNONE);
}
#endif

#ifndef JMOD_RETURN
void data_array_return_value(TTPtr baton, TTValue& v)
{
	WrappedModularInstancePtr	x;
	TTValue						array, g, t;
	TTValuePtr					b, m;
	TTSymbol					type;
	SymbolPtr					msg, iAdrs;
	TTUInt8						i; 
	long						argc = 0;
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
				
				// if the data have not been updated yet
				m = EXTRA->arrayValue[i];
				if (m == NULL) {
					
					memoCursor = x->cursor;
					jamoma_edit_numeric_instance(x->arrayFormatInteger, &iAdrs, i+1);
					x->cursor = TTSymbol(iAdrs->s_name);
					selectedObject->getAttributeValue(kTTSym_valueDefault, g);
					selectedObject->getAttributeValue(kTTSym_type, t);
					
					type = t[0];
					
					// if there is no default value
					if (g == kTTValNONE) {
						
						if (type == kTTSym_string)
							m = new TTValue(kTTSym_none);
						else
							m = new TTValue(0);
					}
					else		
						m = new TTValue(g);
					
					EXTRA->arrayValue[i] = m;
					x->cursor = memoCursor;
				}
				
				TTValue v = *m;
				v.prepend(array);
				array = v;
				
				// TODO : a real append method for value !
				// array.append((TTValuePtr)m);
			}
		
		jamoma_ttvalue_to_typed_Atom(array, &msg, &argc, &argv, shifted);
	}
	else
		// output single value
		jamoma_ttvalue_to_typed_Atom(v, &msg, &argc, &argv, shifted);
	
	// avoid blank before data
	if (msg == _sym_nothing)
		outlet_atoms(x->outlets[data_out], argc, argv);
	else
		outlet_anything(x->outlets[data_out], msg, argc, argv);
	
	if (shifted)
		argv--;
	sysmem_freeptr(argv);
}

t_max_err data_get_format(TTPtr self, TTPtr attr, AtomCount *ac, AtomPtr *av)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	
	if ((*ac)&&(*av)) {
		//memory passed in, use it
	} else {
		//otherwise allocate memory
		*ac = 1;
		if (!(*av = (AtomPtr)getbytes(sizeof(Atom)*(*ac)))) {
			*ac = 0;
			return MAX_ERR_OUT_OF_MEM;
		}
	}
	
	atom_setsym(*av, x->arrayAttrFormat);
	
	return MAX_ERR_NONE;
}

t_max_err data_set_format(TTPtr self, TTPtr attr, AtomCount ac, AtomPtr av) 
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	
	if (ac&&av) {
		x->arrayAttrFormat = atom_getsym(av);
	} else {
		// no args, set to single
		x->arrayAttrFormat = gensym("single");
	}
	return MAX_ERR_NONE;
}
#endif