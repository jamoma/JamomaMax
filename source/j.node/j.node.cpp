/** @file
 *
 * @ingroup implementationMaxExternals
 *
 * @brief j.node : edit priority, tag and description for a node that doesn't refer to any parameter, message or return
 *
 * @details
 *
 * @authors Théo de la Hogue
 *
 * @copyright © 2014 by Théo de la Hogue @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */


#include "TTModularClassWrapperMax.h"

#define	dump_out 0

// Definitions
void		WrapTTNodeInfoClass(WrappedClassPtr c);
void		WrappedNodeInfoClass_new(TTPtr self, AtomCount argc, AtomPtr argv);
void        WrappedNodeInfoClass_free(TTPtr self);


/** Provide assistance on input and output while patching.
 @param self	The node instance.
 @param b
 @param	msg		Determines if assistance is requested for an input or output.
 @param arg		Determines what input/output assistance is requested for.
 @param dst		Destination address that assistance string is copied to.
 */
void		node_assist(TTPtr self, TTPtr b, long msg, AtomCount arg, char *dst);

/** Subscribe the j.node into the directory.
 @param self	The node instance.
 @param relativeAddres where to subscribe the node relatively into the tree structure.
 @param argc    useless
 @param argv    useless
 */
void        node_subscribe(TTPtr self, SymbolPtr relativeAddress, AtomCount argc, AtomPtr argv);

int TTCLASSWRAPPERMAX_EXPORT main(void)
{
	ModularSpec *spec = new ModularSpec;
	spec->_wrap = &WrapTTNodeInfoClass;
	spec->_new = &WrappedNodeInfoClass_new;
	spec->_free = NULL;
	spec->_any = NULL;
	
	return wrapTTModularClassAsMaxClass(kTTSym_NodeInfo, "j.node", NULL, spec);
}


void WrapTTNodeInfoClass(WrappedClassPtr c)
{
	class_addmethod(c->maxClass, (method)node_assist,						"assist",				A_CANT, 0L);
}


void WrappedNodeInfoClass_new(TTPtr self, AtomCount argc, AtomPtr argv)
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
        
        object_error((ObjectPtr)x, "%s address is reserved by j.model", relativeAddress->s_name);
		return;
    }
    
    jamoma_node_info_create((ObjectPtr)x, &x->wrappedObject);
	
	if (argc && argv)
        attr_args_process(x, argc, argv);
	
	// The following must be deferred because we have to interrogate our box,
	// and our box is not yet valid until we have finished instantiating the object.
	// Trying to use a loadbang method instead is also not fully successful (as of Max 5.0.6)
	defer_low((ObjectPtr)x, (method)node_subscribe, relativeAddress, argc, argv);
}

void node_subscribe(TTPtr self, SymbolPtr relativeAddress, AtomCount argc, AtomPtr argv)
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

// Method for Assistance Messages
void node_assist(TTPtr self, TTPtr b, long msg, AtomCount arg, char *dst)
{
	if (msg==1) 						// Inlet
		strcpy(dst, "input");
	else {							// Outlets
		switch(arg) {
			case dump_out:
				strcpy(dst, "dumpout");
				break;
		}
 	}
}