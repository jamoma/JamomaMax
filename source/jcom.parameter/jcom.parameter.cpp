/* 
 * jcom.parameter
 * External for Jamoma: parameter definition
 * By Tim Place and Théo de la Hogue, Copyright © 2011
 * 
 * License: This code is licensed under the terms of the "New BSD License"
 * http://creativecommons.org/licenses/BSD/
 */

#include "TTModularClassWrapperMax.h"

#define data_out 0
#define	dump_out 1

// This is used to store extra data
typedef struct extra {
	
	TTValue*         arrayArgs;		// store arguments

} t_extra;
#define EXTRA ((t_extra*)x->extra)


// Definitions
void		WrapTTDataClass(WrappedClassPtr c);
void		WrappedDataClass_new(TTPtr self, AtomCount argc, AtomPtr argv);
void        WrappedDataClass_free(TTPtr self);

void		data_assist(TTPtr self, TTPtr b, long msg, AtomCount arg, char *dst);

void		data_new_address(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);
void		data_subscribe(TTPtr self, SymbolPtr address, AtomCount argc, AtomPtr argv);
void		data_address(TTPtr self, SymbolPtr name);

#ifndef JMOD_RETURN
void		data_return_value(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);
#endif

#ifndef JMOD_MESSAGE
void		WrappedDataClass_anything(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);
void		data_bang(TTPtr self);
void		data_int(TTPtr self, long value);
void		data_float(TTPtr self, double value);
void		data_list(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);

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
	return wrapTTModularClassAsMaxClass(kTTSym_Data, "jcom.message", NULL, spec);
#endif
	
#ifdef JMOD_RETURN
	return wrapTTModularClassAsMaxClass(kTTSym_Data, "jcom.return", NULL, spec);
#endif
	
#ifndef JMOD_MESSAGE
#ifndef JMOD_RETURN
	return wrapTTModularClassAsMaxClass(kTTSym_Data, "jcom.parameter", NULL, spec);
#endif
#endif
}

void WrapTTDataClass(WrappedClassPtr c)
{
	class_addmethod(c->maxClass, (method)data_assist,						"assist",				A_CANT, 0L);
	
#ifndef JMOD_RETURN
	class_addmethod(c->maxClass, (method)data_return_value,					"return_value",			A_CANT, 0);
#endif
	
#ifndef JMOD_MESSAGE	
	class_addmethod(c->maxClass, (method)data_bang,							"bang",					0L);
	class_addmethod(c->maxClass, (method)data_int,							"int",					A_LONG, 0);
	class_addmethod(c->maxClass, (method)data_float,						"float",				A_FLOAT, 0);
	class_addmethod(c->maxClass, (method)data_list,							"list",					A_GIMME, 0);
	
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
		return;
	}
	
	// Make outlets (before attr_args_process)
	/////////////////////////////////////////////////////////////////////////////////
#ifndef JMOD_RETURN
	
	// Don't create outlets during dynamic changes
		x->outlets = (TTHandle)sysmem_newptr(sizeof(TTPtr) * 2);
		x->outlets[data_out] = outlet_new(x, NULL);						// anything outlet to output data

#endif
    
    // Prepare extra data
	x->extra = (t_extra*)malloc(sizeof(t_extra));
    
    EXTRA->arrayArgs = new TTValue();

    // Store arguments
	if (argc > 1 && argv)
        jamoma_ttvalue_from_Atom(*(EXTRA->arrayArgs), _sym_list, argc--, argv++);

	data_new_address(self, relativeAddress, argc--, argv++);
}

void WrappedDataClass_free(TTPtr self)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	free(EXTRA);
}
	
void data_new_address(TTPtr self, SymbolPtr relativeAddress, AtomCount argc, AtomPtr argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	
	x->useInternals = false;
	
	// create the data
#ifdef JMOD_MESSAGE
	jamoma_data_create((ObjectPtr)x, &x->wrappedObject, kTTSym_message);
#endif
	
#if JMOD_RETURN
	jamoma_data_create((ObjectPtr)x, &x->wrappedObject, kTTSym_return);
#endif
	
#ifndef JMOD_MESSAGE
#ifndef JMOD_RETURN
	jamoma_data_create((ObjectPtr)x, &x->wrappedObject, kTTSym_parameter);
#endif
#endif
    
    if (argc && argv)
        attr_args_process(x, argc, argv);
	
	// The following must be deferred because we have to interrogate our box,
	// and our box is not yet valid until we have finished instantiating the object.
	// Trying to use a loadbang method instead is also not fully successful (as of Max 5.0.6)
	defer_low((ObjectPtr)x, (method)data_subscribe, relativeAddress, argc, argv);
}

void data_subscribe(TTPtr self, SymbolPtr relativeAddress, AtomCount argc, AtomPtr argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
    TTAddress   returnedAddress;
    TTNodePtr   returnedNode = NULL;
    TTNodePtr   returnedContextNode = NULL;

	// for relative address
	if (TTAddress(relativeAddress->s_name).getType() == kAddressRelative) {
        
		jamoma_subscriber_create((ObjectPtr)x, x->wrappedObject, TTAddress(jamoma_parse_dieze((ObjectPtr)x, relativeAddress)->s_name), &x->subscriberObject, returnedAddress, &returnedNode, &returnedContextNode);
		
	}
	else
		object_error((ObjectPtr)x, "can't register because %s is not a relative address", relativeAddress->s_name);
}

void data_address(TTPtr self, SymbolPtr address)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
    AtomCount					argc = 0;
	AtomPtr						argv = NULL;
	
	// unregister wrapped object (or internals)
	wrappedModularClass_unregister(x);
    
    // use stored arguments
    jamoma_ttvalue_to_Atom(*(EXTRA->arrayArgs), &argc, &argv);
	
	// rebuild wrapped object (or internals)
	defer_low(self,(method)data_new_address, address, argc, argv);
}

// Method for Assistance Messages
void data_assist(TTPtr self, TTPtr b, long msg, AtomCount arg, char *dst)
{
	if (msg==1) 						// Inlet
		strcpy(dst, "input");
	else {							// Outlets
		switch(arg) {
			case data_out:
				strcpy(dst, "direct: values");
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
	data_list(self, _sym_bang, 0, NULL);
}

void data_int(TTPtr self, long value)
{
	t_atom a;
	
	atom_setlong(&a, value);
	data_list(self, _sym_int, 1, &a);
}

void data_float(TTPtr self, double value)
{
	t_atom a;
	
	atom_setfloat(&a, value);
	data_list(self, _sym_float, 1, &a);
}

void data_list(TTPtr self, t_symbol *msg, long argc, t_atom *argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;

	jamoma_data_command((TTDataPtr)selectedObject, msg, argc, argv);
}

void WrappedDataClass_anything(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	
	jamoma_data_command((TTDataPtr)selectedObject, msg, argc, argv);
}
#endif

#ifndef JMOD_RETURN
void data_return_value(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	
	// avoid blank before data
	if (msg == _sym_nothing)
		outlet_atoms(x->outlets[data_out], argc, argv);
	else
		outlet_anything(x->outlets[data_out], msg, argc, argv);
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