/**
 * \file jcom.map.cpp
 * External for Jamoma: map input to output: y=f(x)
 * Copyright © 2010 by Théo de la Hogue
 *
 * License: This code is licensed under the terms of the "New BSD License"
 * http://creativecommons.org/licenses/BSD/
 */

#include "TTModularClassWrapperMax.h"

#define data_out 0
#define dump_out 1

// This is used to store extra data
typedef struct extra {
	TTValuePtr     arguments;      // keep creation arguments to reset the mapper to the initial state
} t_extra;
#define EXTRA ((t_extra*)x->extra)

// Definitions
void WrapTTMapperClass(WrappedClassPtr c);
void WrappedMapperClass_new(TTPtr self, AtomCount argc, AtomPtr argv);
void WrappedMapperClass_free(TTPtr self);

void map_assist(TTPtr self, void *b, long msg, long arg, char *dst);

void map_return_value(TTPtr self, t_symbol *msg, long argc, t_atom *argv);

void map_int(TTPtr self, long value);
void map_float(TTPtr self, double value);
void map_list(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);

void map_reset(TTPtr self);

void map_subscribe(TTPtr self);

int TTCLASSWRAPPERMAX_EXPORT main(void)
{
	ModularSpec *spec = new ModularSpec;
	spec->_wrap = &WrapTTMapperClass;
	spec->_new = &WrappedMapperClass_new;
	spec->_free = &WrappedMapperClass_free;
	spec->_any = NULL;
	
	return wrapTTModularClassAsMaxClass(kTTSym_Mapper, "jcom.map", NULL, spec);
}

void WrapTTMapperClass(WrappedClassPtr c)
{
	class_addmethod(c->maxClass, (method)map_assist, "assist", A_CANT, 0L);
	
	class_addmethod(c->maxClass, (method)map_return_value, "return_value", A_CANT, 0);
	
	class_addmethod(c->maxClass, (method)map_int, "int", A_LONG, 0L);
	class_addmethod(c->maxClass, (method)map_float, "float", A_FLOAT, 0L);
	class_addmethod(c->maxClass, (method)map_list, "list", A_GIMME, 0L);
    
    class_addmethod(c->maxClass, (method)map_reset, "reset", 0L);
}

void WrappedMapperClass_new(TTPtr self, AtomCount argc, AtomPtr argv)
{
	WrappedModularInstancePtr x = (WrappedModularInstancePtr)self;
	SymbolPtr relativeAddress;
	long attrstart = attr_args_offset(argc, argv); // support normal arguments
	
	// possible relativeAddress
	if (attrstart && argv)
		relativeAddress = atom_getsym(argv);
	else
		relativeAddress = _sym_nothing;
	
	x->address = TTAddress(jamoma_parse_dieze((ObjectPtr)x, relativeAddress)->s_name);
	
	jamoma_mapper_create((ObjectPtr)x, &x->wrappedObject);
	
	// Make two outlets
	x->outlets = (TTHandle)sysmem_newptr(sizeof(TTPtr) * 1);
	x->outlets[data_out] = outlet_new(x, NULL); // anything outlet to output data
	
	// handle attribute args
	attr_args_process(x, argc, argv);
    
    // Prepare extra data
	x->extra = (t_extra*)malloc(sizeof(t_extra));
    EXTRA->arguments = new TTValue();
    jamoma_ttvalue_from_Atom(*EXTRA->arguments, _sym_nothing, argc, argv);
	
	// The following must be deferred because we have to interrogate our box,
	// and our box is not yet valid until we have finished instantiating the object.
	// Trying to use a loadbang method instead is also not fully successful (as of Max 5.0.6)
	defer_low((ObjectPtr)x, (method)map_subscribe, NULL, 0, 0);
}

void WrappedMapperClass_free(TTPtr self)
{
    WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
    delete EXTRA->arguments;
	free(EXTRA);
}

// Method for Assistance Messages
void map_assist(TTPtr self, void *b, long msg, long arg, char *dst)
{
	if (msg==1) // Inlets
		strcpy(dst, "");
	else { // Outlets
		switch(arg) {
			case data_out:
				strcpy(dst, "mapping output");
				break;
			case dump_out:
				strcpy(dst, "dumpout");
				break;
		}
	}
}

void map_subscribe(TTPtr self)
{
	WrappedModularInstancePtr x = (WrappedModularInstancePtr)self;
	TTValue v, n, args;
	TTDataPtr aData;
	
	/* TODO : fix exposeAttribute as parameter because for now
	 it crash due to a locked mutex during the notification
	 of observers when the attribute is updated from a Max message.
	 // add 'cue' after the address
	 if (x->address == kTTAdrsEmpty)
	 x->address = TADRS("mapper");
	 // if the subscription is successful
	 if (!jamoma_subscriber_create((ObjectPtr)x, x->wrappedObject, x->address, &x->subscriberObject, returnedAddress, &returnedNode, &returnedContextNode)) {
	 // expose attributes of TTMapper as TTData in the tree structure
	 x->subscriberObject->exposeAttribute(x->wrappedObject, TTSymbol("input"), kTTSym_parameter, &aData);
	 aData->setAttributeValue(kTTSym_type, kTTSym_string);
	 aData->setAttributeValue(kTTSym_tag, kTTSym_generic);
	 aData->setAttributeValue(kTTSym_description, TTSymbol("The input address to map"));
	 x->subscriberObject->exposeAttribute(x->wrappedObject, TTSymbol("output"), kTTSym_parameter, &aData);
	 aData->setAttributeValue(kTTSym_type, kTTSym_string);
	 aData->setAttributeValue(kTTSym_tag, kTTSym_generic);
	 aData->setAttributeValue(kTTSym_description, TTSymbol("The output address to map"));
	 x->subscriberObject->exposeAttribute(x->wrappedObject, TTSymbol("inputMin"), kTTSym_parameter, &aData);
	 aData->setAttributeValue(kTTSym_type, kTTSym_decimal);
	 aData->setAttributeValue(kTTSym_tag, kTTSym_generic);
	 aData->setAttributeValue(kTTSym_description, TTSymbol("The low bound input value"));
	 x->subscriberObject->exposeAttribute(x->wrappedObject, TTSymbol("inputMax"), kTTSym_parameter, &aData);
	 aData->setAttributeValue(kTTSym_type, kTTSym_decimal);
	 aData->setAttributeValue(kTTSym_tag, kTTSym_generic);
	 aData->setAttributeValue(kTTSym_description, TTSymbol("The high bound input value"));
	 x->subscriberObject->exposeAttribute(x->wrappedObject, TTSymbol("outputMin"), kTTSym_parameter, &aData);
	 aData->setAttributeValue(kTTSym_type, kTTSym_decimal);
	 aData->setAttributeValue(kTTSym_tag, kTTSym_generic);
	 aData->setAttributeValue(kTTSym_description, TTSymbol("The low bound output value"));
	 x->subscriberObject->exposeAttribute(x->wrappedObject, TTSymbol("outputMax"), kTTSym_parameter, &aData);
	 aData->setAttributeValue(kTTSym_type, kTTSym_decimal);
	 aData->setAttributeValue(kTTSym_tag, kTTSym_generic);
	 aData->setAttributeValue(kTTSym_description, TTSymbol("The high bound output value"));
	 x->subscriberObject->exposeAttribute(x->wrappedObject, TTSymbol("enable"), kTTSym_parameter, &aData);
	 aData->setAttributeValue(kTTSym_type, kTTSym_boolean);
	 aData->setAttributeValue(kTTSym_tag, kTTSym_generic);
	 aData->setAttributeValue(kTTSym_description, TTSymbol("Turn on and off the mapping"));
	 }
	 */
}

void map_return_value(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	WrappedModularInstancePtr x = (WrappedModularInstancePtr)self;
	outlet_atoms(x->outlets[data_out], argc, argv);
}

void map_bang(TTPtr self)
{
	map_list(self, _sym_bang, 0, NULL);
}

void map_int(TTPtr self, long value)
{
	t_atom a;
	
	atom_setlong(&a, value);
	map_list(self, _sym_int, 1, &a);
}

void map_float(TTPtr self, double value)
{
	t_atom a;
	
	atom_setfloat(&a, value);
	map_list(self, _sym_float, 1, &a);
}

void map_list(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	WrappedModularInstancePtr x = (WrappedModularInstancePtr)self;
	TTValue inputValue, outputValue;
	
	jamoma_ttvalue_from_Atom(inputValue, msg, argc, argv);
	
	x->wrappedObject->sendMessage(kTTSym_Map, inputValue, outputValue);
	
	// we don't send the output value here because there is callback for this
}

void map_reset(TTPtr self)
{
    WrappedModularInstancePtr x = (WrappedModularInstancePtr)self;
    AtomCount   argc = 0;
    AtomPtr     argv = NULL;
    
    jamoma_ttvalue_to_Atom(*EXTRA->arguments, &argc, &argv);
    
    // handle attribute args to reset to creation state
	attr_args_process(x, argc, argv);
}