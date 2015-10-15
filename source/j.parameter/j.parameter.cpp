/** @file
 *
 * @ingroup implementationMaxExternals
 *
 * @brief j.parameter / j.message / j.return : Jamoma model parameter definition
 *
 * @details
 *
 * @authors Timothy Place, Théo de la Hogue, Trond Lossius
 *
 * @copyright © 2011 by Timothy Place, Théo de la Hogue @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */

#include "MaxCommon.h"
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
void		WrappedDataClass_new(TTPtr self, long argc, t_atom *argv);
void        WrappedDataClass_free(TTPtr self);


/** Provide assistance on input and output while patching.
 @param self	The parameter instance.
 @param b
 @param	msg		Determines if assistance is requested for an input or output.
 @param arg		Determines what input/output assistance is requested for.
 @param dst		Destination address that assistance string is copied to.
 */
void		data_assist(TTPtr self, TTPtr b, long msg, long arg, char *dst);

void		data_new_address(TTPtr self, t_symbol *msg, long argc, t_atom *argv);
void		data_subscribe(TTPtr self, t_symbol *address, long argc, t_atom *argv);
void		data_address(TTPtr self, t_symbol *name);

void		data_return_value(TTPtr self, t_symbol *msg, long argc, t_atom *argv);


void		WrappedDataClass_anything(TTPtr self, t_symbol *msg, long argc, t_atom *argv);


/** Process an incoming 'bang' message.
 @param self		The parameter instance
 */
void		data_bang(TTPtr self);


/** Process an incoming integer value.
 @param self		The parameter instance.
 @param value		The integer value received.
 */
void		data_int(TTPtr self, long value);


/** Process an incoming float value.
 @param self		The parameter instance.
 @param value		The float value received.
 */
void		data_float(TTPtr self, double value);


/** Process an incoming message containing a list. When the object receives a bang, int, float or anything, it is fornatted as a list and frwarded to this method.
 @param self		The parameter instance.
 @param msg			The dec symbol pointer
 @param argc		t_atom array count (length)
 @param argv		Pointer to the atom array
 */
void		data_list(TTPtr self, t_symbol *msg, long argc, t_atom *argv);


/** Increase parameter value in steps.
 @details Optional arguments passed as pointer to array of atoms specify how many steps to increase value by, if parameter is to ramp to new value and ramp time.
 @param self		The parameter instance
 @param msg			The dec symbol pointer
 @param argc		t_atom array count (length)
 @param argv		Pointer to the atom array
 @see	param_inc
 */
void		data_inc(TTPtr self, t_symbol *msg, long argc, t_atom *argv);


/** Decrease parameter value in steps.
 @details Optional arguments passed as pointer to array of atoms specify how many steps to increase value by, if parameter is to ramp to new value and ramp time.
 @param self	The parameter instance
 @param msg		The dec symbol pointer
 @param argc	t_atom array count (length)
 @param argv	Pointer to the atom array
 @see	param_inc
 */
void		data_dec(TTPtr self, t_symbol *msg, long argc, t_atom *argv);



int C74_EXPORT main(void)
{
	ModularSpec *spec = new ModularSpec;
	spec->_wrap = &WrapTTDataClass;
	spec->_new = &WrappedDataClass_new;
	spec->_free = &WrappedDataClass_free;
	spec->_any = &WrappedDataClass_anything;
	
#ifdef JMOD_MESSAGE
	return wrapTTModularClassAsMaxClass(kTTSym_Data, "j.message", NULL, spec);
#endif
	
#ifdef JMOD_RETURN
	return wrapTTModularClassAsMaxClass(kTTSym_Data, "j.return", NULL, spec);
#endif
	
#ifndef JMOD_MESSAGE
#ifndef JMOD_RETURN
	return wrapTTModularClassAsMaxClass(kTTSym_Data, "j.parameter", NULL, spec);
#endif
#endif
}


void WrapTTDataClass(WrappedClassPtr c)
{
	class_addmethod(c->maxClass, (method)data_assist,						"assist",				A_CANT, 0L);
	
	class_addmethod(c->maxClass, (method)data_return_value,					"return_value",			A_CANT, 0);
		
	class_addmethod(c->maxClass, (method)data_bang,							"bang",					0L);
	class_addmethod(c->maxClass, (method)data_int,							"int",					A_LONG, 0);
	class_addmethod(c->maxClass, (method)data_float,						"float",				A_FLOAT, 0);
	class_addmethod(c->maxClass, (method)data_list,							"list",					A_GIMME, 0);
	
	class_addmethod(c->maxClass, (method)data_inc,							"+",					A_GIMME, 0);
	class_addmethod(c->maxClass, (method)data_dec,							"-",					A_GIMME, 0);
	
	class_addmethod(c->maxClass, (method)data_address,						"address",				A_SYM,0);
	
	// standalone support:
	class_addmethod(c->maxClass, (method)jamoma_fileusage,					"fileusage",			A_CANT, 0);
}


void WrappedDataClass_new(TTPtr self, long argc, t_atom *argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	t_symbol*					relativeAddress;
	long						attrstart = attr_args_offset(argc, argv);			// support normal arguments
	
	// check address argument
	relativeAddress = _sym_nothing;
	if (attrstart && argv)
		if (atom_gettype(argv) == A_SYM)
			relativeAddress = atom_getsym(argv);
	
	if (relativeAddress == _sym_nothing) {
		object_error((t_object*)x, "needs a name as first argument");
		return;
	}
    
    // check for reserved address
    if (relativeAddress == gensym("data/mute")      ||
        relativeAddress == gensym("data/bypass")    ||
        relativeAddress == gensym("data/freeze")    ||
        relativeAddress == gensym("data/preview")   ||
        relativeAddress == gensym("audio/mute")     ||
        relativeAddress == gensym("audio/bypass")   ||
        relativeAddress == gensym("audio/mix")      ||
        relativeAddress == gensym("audio/gain")     ||
        relativeAddress == gensym("model")          ||
        relativeAddress == gensym("preset")         ) {
        
        object_error((t_object*)x, "%s address is reserved by j.model", relativeAddress->s_name);
		return;
    }
    
    x->useInternals = false;
	
	// Make outlets (before attr_args_process)
	/////////////////////////////////////////////////////////////////////////////////

	// Don't create outlets during dynamic changes
    x->outlets = (TTHandle)sysmem_newptr(sizeof(TTPtr) * 2);
    x->outlets[data_out] = outlet_new(x, NULL);						// anything outlet to output data
    
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


void data_new_address(TTPtr self, t_symbol *relativeAddress, long argc, t_atom *argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	
	// create the data
#ifdef JMOD_MESSAGE
	jamoma_data_create((t_object*)x, x->wrappedObject, kTTSym_message);
#endif
	
#if JMOD_RETURN
	jamoma_data_create((t_object*)x, x->wrappedObject, kTTSym_return);
#endif
	
#ifndef JMOD_MESSAGE
#ifndef JMOD_RETURN
	jamoma_data_create((t_object*)x, x->wrappedObject, kTTSym_parameter);
#endif
#endif
    
    if (argc && argv)
        attr_args_process(x, argc, argv);
	
	// The following must be deferred because we have to interrogate our box,
	// and our box is not yet valid until we have finished instantiating the object.
	// Trying to use a loadbang method instead is also not fully successful (as of Max 5.0.6)
	defer_low((t_object*)x, (method)data_subscribe, relativeAddress, argc, argv);
}


void data_subscribe(TTPtr self, t_symbol *relativeAddress, long argc, t_atom *argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
    TTAddress   returnedAddress;
    TTNodePtr   returnedNode = NULL;
    TTNodePtr   returnedContextNode = NULL;

	// for relative address
	if (TTAddress(relativeAddress->s_name).getType() == kAddressRelative) {
        
		jamoma_subscriber_create((t_object*)x, x->wrappedObject, TTAddress(jamoma_parse_dieze((t_object*)x, relativeAddress)->s_name), x->subscriberObject, returnedAddress, &returnedNode, &returnedContextNode);
        
#ifndef JMOD_MESSAGE
#ifndef JMOD_RETURN
        // if a j.parameter is registered under the root : reset to the default value our self
        if (returnedContextNode == accessApplicationLocalDirectory->getRoot())
        {
            TTBoolean initialized;
            x->wrappedObject.get("initialized", initialized);
            if (!initialized)
                x->wrappedObject.send(kTTSym_Init);
        }
#endif
#endif
	}
	else
		object_error((t_object*)x, "can't register because %s is not a relative address", relativeAddress->s_name);
}


void data_address(TTPtr self, t_symbol *address)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
    long	argc = 0;
	t_atom	*argv = NULL;
	
	// unregister wrapped object (or internals)
	wrappedModularClass_unregister(x);
    
    // use stored arguments
    jamoma_ttvalue_to_Atom(*(EXTRA->arrayArgs), &argc, &argv);
	
	// rebuild wrapped object (or internals)
	defer_low(self,(method)data_new_address, address, argc, argv);
}


// Method for Assistance Messages
void data_assist(TTPtr self, TTPtr b, long msg, long arg, char *dst)
{
	if (msg==1) 						// Inlet
		strcpy(dst, "update value, ramp to new value, or set an attribute");
	else {							// Outlets
		switch(arg) {
			case data_out:
				strcpy(dst, "current value when updated");
				break;
			case dump_out:
				strcpy(dst, "dumpout");
				break;
		}
 	}
}


void data_bang(TTPtr self)
{
	data_list(self, _sym_bang, 0, NULL);
}


void data_int(TTPtr self, long value)
{
	t_atom a;
	
	atom_setlong(&a, value);
    // Forwards to data_float
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

	jamoma_data_command(x->wrappedObject, msg, argc, argv);
    
    // to warn attr ui for example
    object_attr_touch((t_object*)x, _sym_value);
}


void WrappedDataClass_anything(TTPtr self, t_symbol *msg, long argc, t_atom *argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	
	jamoma_data_command(x->wrappedObject, msg, argc, argv);
}


void data_return_value(TTPtr self, t_symbol *msg, long argc, t_atom *argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	
	// avoid blank before data
	if (msg == _sym_nothing)
		outlet_atoms(x->outlets[data_out], argc, argv);
	else
		outlet_anything(x->outlets[data_out], msg, argc, argv);
}


void data_inc(TTPtr self, t_symbol *msg, long argc, t_atom *argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTValue v, none;

	jamoma_ttvalue_from_Atom(v, _sym_nothing, argc, argv);
	x->wrappedObject.send("Inc", v, none);
}


void data_dec(TTPtr self, t_symbol *msg, long argc, t_atom *argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTValue v, none;
	
	jamoma_ttvalue_from_Atom(v, _sym_nothing, argc, argv);
	x->wrappedObject.send("Dec", v, none);
}