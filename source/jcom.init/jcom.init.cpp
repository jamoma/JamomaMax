/** @file
 *
 * @ingroup modularMax
 *
 * @brief External for Jamoma: jcom.init - Send bang to initialize something.
 *
 * @details Bang source may be global or for just one module
 *
 * @authors Tim Place, Trond Lossius
 *
 * @copyright Copyright © 2006 by Tim Place @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */


#include "Jamoma.h"

// Data Structure for this object
typedef struct _init{
	Object				obj;
	TTNodePtr			patcherNode;
	TTReceiverPtr		initReceiver;
	TTSubscriberPtr		subscriberObject;
	TTAddress	address;
	void				*outlet;
	void				*dumpout;
} t_init;

// Prototypes for methods
void *init_new(SymbolPtr s, AtomCount argc, AtomPtr argv);			// New Object Creation Method
void init_free(t_init *x);
void init_assist(t_init *x, void *b, long m, long a, char *s);		// Assistance Method
void init_subscribe(t_init *x);
void init_return_address(t_init *x, SymbolPtr msg, AtomCount argc, AtomPtr argv);
void init_return_value(t_init *x, SymbolPtr msg, AtomCount argc, AtomPtr argv);
//void init_bang(t_init *x);

// Globals
t_class			*g_init_class;			// Required. Global pointing to this class


/************************************************************************************/
// Main() Function

int JAMOMA_EXPORT_MAXOBJ main(void)
{
	t_class		*c;
	
	jamoma_init();
	common_symbols_init();

	// Define our class
	c = class_new("jcom.init",(method)init_new, (method)init_free, sizeof(t_init), (method)0L, A_GIMME, 0);

	// Make methods accessible for our class: 
	//class_addmethod(c, (method)init_bang,				"bang",				0L);
	class_addmethod(c, (method)init_return_address,		"return_address",	A_CANT, 0);
	class_addmethod(c, (method)init_return_value,		"return_value",		A_CANT, 0);
    class_addmethod(c, (method)init_assist,				"assist",			A_CANT, 0L);
	
	// Finalize our class
	class_register(CLASS_BOX, c);
	g_init_class = c;

	return 0;
}


/************************************************************************************/
// Object Life

// Create
void *init_new(SymbolPtr s, AtomCount argc, AtomPtr argv)
{
	long 		attrstart = attr_args_offset(argc, argv);						// support normal arguments
	t_init 		*x = (t_init *)object_alloc(g_init_class);
	SymbolPtr	relativeAddress = _sym_nothing;											// could be used to binds on a sub level jcom.hub

	if (attrstart && argv)
		atom_arg_getsym(&relativeAddress, 0, attrstart, argv);
	
	if (x) {
		
		x->dumpout = outlet_new(x, NULL);
		x->outlet = outlet_new(x, NULL);
		object_obex_store((void *)x, jps_dumpout, (object *)x->dumpout);		// setup the dumpout

		x->patcherNode = NULL;
		x->initReceiver = NULL;
		x->subscriberObject = NULL;
		x->address = TTAddress(jamoma_parse_dieze((ObjectPtr)x, relativeAddress)->s_name);
		
		attr_args_process(x, argc, argv);										// handle attribute args				

		// The following must be deferred because we have to interrogate our box,
		// and our box is not yet valid until we have finished instantiating the object.
		// Trying to use a loadbang method instead is also not fully successful (as of Max 5.0.6)
		defer_low((ObjectPtr)x, (method)init_subscribe, NULL, 0, 0);
	}
	
	return (x);																	// Return the pointer
}

void init_free(t_init *x)
{	
	if (x->initReceiver)
		TTObjectBaseRelease(TTObjectBaseHandle(&x->initReceiver));
	
	if (x->subscriberObject)
		TTObjectBaseRelease(TTObjectBaseHandle(&x->subscriberObject));
}



/************************************************************************************/
// Methods bound to input/inlets

// Method for Assistance Messages
void init_assist(t_init *x, void *b, long msg, long arg, char *dst)
{
	if (msg==1)			// Inlets
		strcpy(dst, "");
	else if (msg==2) { // Outlets
		if (arg == 0) 
			strcpy(dst, "0 when initialization starts, 1 when initilization is done");
		else 
			strcpy(dst, "dumpout");
	}
}

void init_subscribe(t_init *x)
{
	TTValue			v, args;
	TTAddress       contextAddress = kTTAdrsEmpty;
    TTAddress       returnedAddress;
    TTNodePtr       returnedNode = NULL;
    TTNodePtr       returnedContextNode = NULL;
	TTObjectBasePtr	returnAddressCallback, returnValueCallback;
	TTValuePtr		returnAddressBaton, returnValueBaton;
	
	// for relative address
	if (x->address.getType() == kAddressRelative) {

		if (!jamoma_subscriber_create((ObjectPtr)x, NULL, x->address, &x->subscriberObject, returnedAddress, &returnedNode, &returnedContextNode)) {
            
			// get the context address to make
			// a receiver on the contextAddress/model/address parameter
			x->subscriberObject->getAttributeValue(TTSymbol("contextAddress"), v);
			contextAddress = v[0];
		}
		
		// bind on the /model/address parameter (view patch) or return (model patch)
		if (contextAddress != kTTAdrsEmpty) {
			
			// Make a TTReceiver object
			returnAddressCallback = NULL;			// without this, TTObjectBaseInstantiate try to release an oldObject that doesn't exist ... Is it good ?
			TTObjectBaseInstantiate(TTSymbol("callback"), &returnAddressCallback, kTTValNONE);
			returnAddressBaton = new TTValue(TTPtr(x));
			returnAddressCallback->setAttributeValue(kTTSym_baton, TTPtr(returnAddressBaton));
			returnAddressCallback->setAttributeValue(kTTSym_function, TTPtr(&jamoma_callback_return_address));
			args.append(returnAddressCallback);
			
			returnValueCallback = NULL;				// without this, TTObjectBaseInstantiate try to release an oldObject that doesn't exist ... Is it good ?
			TTObjectBaseInstantiate(TTSymbol("callback"), &returnValueCallback, kTTValNONE);
			returnValueBaton = new TTValue(TTPtr(x));
			returnValueCallback->setAttributeValue(kTTSym_baton, TTPtr(returnValueBaton));
			returnValueCallback->setAttributeValue(kTTSym_function, TTPtr(&jamoma_callback_return_value));
			args.append(returnValueCallback);
			
			x->initReceiver = NULL;
			TTObjectBaseInstantiate(kTTSym_Receiver, TTObjectBaseHandle(&x->initReceiver), args);
			
			x->initReceiver->setAttributeValue(kTTSym_address, contextAddress.appendAttribute(kTTSym_initialized));
		}
		
		// while the context node is not registered : try to binds again :(
		// (to -- this is not a good way todo. For binding we should make a subscription 
		// to a notification mechanism and each time an TTObjet subscribes to the namespace
		// using jamoma_subscriber_create we notify all the externals which have used 
		// jamoma_subscriber_create with NULL object to bind)
		else {
			
			// release the subscriber
			TTObjectBaseRelease(TTObjectBaseHandle(&x->subscriberObject));
			x->subscriberObject = NULL;
			
			// The following must be deferred because we have to interrogate our box,
			// and our box is not yet valid until we have finished instantiating the object.
			// Trying to use a loadbang method instead is also not fully successful (as of Max 5.0.6)
			defer_low((ObjectPtr)x, (method)init_subscribe, NULL, 0, 0);
		}
	}
	else
		object_error((ObjectPtr)x, "can't bind because %s is not a relative address", x->address.c_str());
}

void init_return_address(t_init *x, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	;
}

// GO !
void init_return_value(t_init *x, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	if (atom_gettype(argv) == A_LONG)
		outlet_int(x->outlet, atom_getlong(argv));
}

/*
// BANG !
void init_bang(t_init *x)
{
	if (x->contextNode)
		if (x->contextNode->getObject())
			x->contextNode->getObject()->sendMessage(TTSymbol("Init"));
}
 */
