/** @file
 *
 * @ingroup implementationMaxExternals
 *
 * @brief j.init - Send bang to initialize something.
 *
 * @details Bang source may be global or for just one module
 *
 * @authors Tim Place, Trond Lossius
 *
 * @copyright Copyright © 2006 by Tim Place @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */


#include "JamomaForMax.h"
#include "MaxCommon.h"

#define start_out 0
#define	end_out 1

// Data Structure for this object
typedef struct _init{
	t_object            obj;
	TTNodePtr			patcherNode;
	TTObject            initReceiver;
	TTObject            subscriberObject;
	TTAddress           address;
	TTHandle            outlets;
} t_init;

// Prototypes for methods
void *init_new(t_symbol* s, long argc, t_atom* argv);			// New Object Creation Method
void init_free(t_init *x);
void init_assist(t_init *x, void *b, long m, long a, char *s);		// Assistance Method
void init_subscribe(t_init *x);
void init_return_address(t_init *x, t_symbol *msg, long argc, t_atom *argv);
void init_return_value(t_init *x, t_symbol *msg, long argc, t_atom *argv);
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
	c = class_new("j.init",(method)init_new, (method)init_free, sizeof(t_init), (method)0L, A_GIMME, 0);

	// Make methods accessible for our class: 
	//class_addmethod(c, (method)init_bang,				"bang",				0L);
	class_addmethod(c, (method)init_return_address,		"return_address",	A_CANT, 0);
	class_addmethod(c, (method)init_return_value,		"return_value",		A_CANT, 0);
    class_addmethod(c, (method)init_assist,				"assist",			A_CANT, 0L);
	class_addmethod(c, (method)jamoma_fileusage, "fileusage", A_CANT, 0);
	
	// Finalize our class
	class_register(CLASS_BOX, c);
	g_init_class = c;

	return 0;
}


/************************************************************************************/
// Object Life

// Create
void *init_new(t_symbol *s, long argc, t_atom *argv)
{
	long 		attrstart = attr_args_offset(argc, argv);						// support normal arguments
	t_init 		*x = (t_init *)object_alloc(g_init_class);
	t_symbol	*relativeAddress = _sym_nothing;											// could be used to binds on a sub level j.hub

	if (attrstart && argv)
		atom_arg_getsym(&relativeAddress, 0, attrstart, argv);
	
	if (x)
    {
        x->outlets = (TTHandle)sysmem_newptr(sizeof(TTPtr) * 2);
        x->outlets[end_out] = bangout(x);
		x->outlets[start_out] = bangout(x);

		x->patcherNode = NULL;
		x->address = TTAddress(jamoma_parse_dieze((t_object*)x, relativeAddress)->s_name);
		
		attr_args_process(x, argc, argv);										// handle attribute args				

		// The following must be deferred because we have to interrogate our box,
		// and our box is not yet valid until we have finished instantiating the object.
		// Trying to use a loadbang method instead is also not fully successful (as of Max 5.0.6)
		defer_low((t_object*)x, (method)init_subscribe, NULL, 0, 0);
	}
	
	return (x);																	// Return the pointer
}

void init_free(t_init *x)
{
    // release the receiver
    if (x->initReceiver.valid())
    {
        x->initReceiver.set(kTTSym_address, kTTAdrsEmpty);
        x->initReceiver = TTObject();
    }
    
    // release the subscriber
    if (x->subscriberObject.valid())
        x->subscriberObject = TTObject();
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
			strcpy(dst, "bang when initialization starts");
		else 
			strcpy(dst, "bang when initilization is done");
	}
}

void init_subscribe(t_init *x)
{
	TTValue     v, args, none;
	TTAddress   contextAddress = kTTAdrsEmpty;
    TTAddress   returnedAddress;
    TTNodePtr   returnedNode = NULL;
    TTNodePtr   returnedContextNode = NULL;
	TTObject    returnAddressCallback, returnValueCallback, empty;
	
	// for relative address
	if (x->address.getType() == kAddressRelative)
    {
		if (!jamoma_subscriber_create((t_object*)x, empty, x->address, x->subscriberObject, returnedAddress, &returnedNode, &returnedContextNode))
        {
            if (returnedNode)
            {
                if (returnedNode->getObject().valid())
                {
                    returnedNode->getAddress(contextAddress);
                }
            }
		}
		
		// bind on the /model:address parameter (view patch) or return (model patch)
		if (contextAddress != kTTAdrsEmpty)
        {
			// Make a TTReceiver object
			returnAddressCallback = TTObject("callback");
			returnAddressCallback.set(kTTSym_baton, TTPtr(x));
			returnAddressCallback.set(kTTSym_function, TTPtr(&jamoma_callback_return_address));
			args.append(returnAddressCallback);
			
			returnValueCallback = TTObject("callback");
			returnValueCallback.set(kTTSym_baton, TTPtr(x));
			returnValueCallback.set(kTTSym_function, TTPtr(&jamoma_callback_return_value));
			args.append(returnValueCallback);
			
			x->initReceiver = TTObject(kTTSym_Receiver, args);
			
			x->initReceiver.set(kTTSym_address, contextAddress.appendAttribute(kTTSym_initialized));
		}
		
		// while the context node is not registered : try to binds again :(
		// (to -- this is not a good way todo. For binding we should make a subscription 
		// to a notification mechanism and each time an TTObjet subscribes to the namespace
		// using jamoma_subscriber_create we notify all the externals which have used 
		// jamoma_subscriber_create with NULL object to bind)
		else
        {
			// release the subscriber
			x->subscriberObject = TTObject();
			
			// The following must be deferred because we have to interrogate our box,
			// and our box is not yet valid until we have finished instantiating the object.
			// Trying to use a loadbang method instead is also not fully successful (as of Max 5.0.6)
			defer_low((t_object*)x, (method)init_subscribe, NULL, 0, 0);
		}
	}
	else
		object_error((t_object*)x, "can't bind because %s is not a relative address", x->address.c_str());
}

void init_return_address(t_init *x, t_symbol *msg, long argc, t_atom *argv)
{
	;
}

// GO !
void init_return_value(t_init *x, t_symbol *msg, long argc, t_atom *argv)
{
	if (atom_gettype(argv) == A_LONG)
    {
        if (atom_getlong(argv) == 0)
            outlet_bang(x->outlets[start_out]);
        else
            outlet_bang(x->outlets[end_out]);
        
    }
}

/*
// BANG !
void init_bang(t_init *x)
{
	if (x->contextNode)
		if (x->contextNode->getObject().valid())
			x->contextNode->getObject().send("Init");
}
 */
