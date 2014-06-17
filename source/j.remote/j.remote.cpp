/** @file
 *
 * @ingroup implementationMaxExternals
 *
 * @brief j.remote : Bind to a parameter value
 *
 * @details Useful when designing views and more.
 *
 * @authors Théo de la Hogue, Trond Lossius
 *
 * @copyright © 2010 by Théo de la Hogue @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */


#include "TTModularClassWrapperMax.h"

// those stuffes are needed for handling patchers without using the pcontrol object
#include "jpatcher_api.h"
typedef struct dll {
	t_object d_ob;
	struct dll *d_next;
	struct dll *d_prev;
	void *d_x1;
} t_dll;

typedef struct outlet {
	struct tinyobject o_ob;
	struct dll *o_dll;
} t_outlet;

// This is used to store extra data
typedef struct extra {
    TTAddress   name;           ///< the name to use for subscription
	TTPtr		ui_qelem;		///< to output "qlim'd" data for ui object
	t_object*	connected;		// our ui object
	long		x;				// our ui object x presentation
	long		y;				// our ui object y presentation
	long		w;				// our ui object width presentation
	long		h;				// our ui object heigth presentation
	t_object*	label;			// label to display selection state
	t_atom*		color0;			// label color for selection state == 0
	t_atom*		color1;			// label color for selection state == 1
    TTBoolean   setting;        // a flag to know if the remote is updated by a set message
} t_extra;
#define EXTRA ((t_extra*)x->extra)

#define set_out 0
#define value_out 1
#define attach_out 2
#define	dump_out 3

// Definitions
void        WrapTTViewerClass(WrappedClassPtr c);
void        WrappedViewerClass_new(TTPtr self, long argc, t_atom *argv);
void        WrappedViewerClass_free(TTPtr self);
void        WrappedViewerClass_anything(TTPtr self, t_symbol *msg, long argc, t_atom *argv);

void        remote_assist(TTPtr self, void *b, long msg, long arg, char *dst);

void        remote_return_value(TTPtr self, t_symbol *msg, long argc, t_atom *argv);
void        remote_return_model_address(TTPtr self, t_symbol *msg, long argc, t_atom *argv);
void        remote_return_description(TTPtr self, t_symbol *msg, long argc, t_atom *argv);

void        remote_bang(TTPtr self);
void        remote_int(TTPtr self, long value);
void        remote_float(TTPtr self, double value);
TTErr       remote_list(TTPtr self, t_symbol *msg, long argc, t_atom *argv);

void        remote_set(TTPtr self, t_symbol *msg, long argc, t_atom *argv);

void        remote_address(TTPtr self, t_symbol *address);

void        remote_attach(TTPtr self, int attach_output_id);
void        remote_mousemove(TTPtr self, t_object *patcherview, t_pt pt, long modifiers);
void        remote_mouseleave(TTPtr self, t_object *patcherview, t_pt pt, long modifiers);
void        remote_mousedown(TTPtr self, t_object *patcherview, t_pt pt, long modifiers);

void        remote_subscribe(TTPtr self);

void        remote_ui_queuefn(TTPtr self);

int C74_EXPORT main(void)
{
	ModularSpec *spec = new ModularSpec;
	spec->_wrap = &WrapTTViewerClass;
	spec->_new = &WrappedViewerClass_new;
	spec->_free = &WrappedViewerClass_free;
	spec->_any = &WrappedViewerClass_anything;
	
	return wrapTTModularClassAsMaxClass(kTTSym_Viewer, "j.remote", NULL, spec);
}

void WrapTTViewerClass(WrappedClassPtr c)
{
	class_addmethod(c->maxClass, (method)remote_assist,					"assist",				A_CANT, 0L);
	
	class_addmethod(c->maxClass, (method)remote_mousemove,				"mousemove",			A_CANT, 0);
	class_addmethod(c->maxClass, (method)remote_mouseleave,				"mouseleave",			A_CANT, 0);
	class_addmethod(c->maxClass, (method)remote_mousedown,				"mousedown",			A_CANT, 0);
	
	class_addmethod(c->maxClass, (method)remote_return_value,			"return_value",			A_CANT, 0);
	class_addmethod(c->maxClass, (method)remote_return_model_address,	"return_model_address",	A_CANT, 0);
    class_addmethod(c->maxClass, (method)remote_return_description,     "return_description",	A_CANT, 0);
    
    class_addmethod(c->maxClass, (method)remote_bang,					"bang",					0L);
	class_addmethod(c->maxClass, (method)remote_int,					"int",					A_LONG, 0L);
	class_addmethod(c->maxClass, (method)remote_float,					"float",				A_FLOAT, 0L);
	class_addmethod(c->maxClass, (method)remote_list,					"list",					A_GIMME, 0L);
    
    class_addmethod(c->maxClass, (method)remote_set,					"set",					A_GIMME, 0L);
    
    class_addmethod(c->maxClass, (method)remote_address,				"address",				A_SYM, 0);
}

void WrappedViewerClass_new(TTPtr self, long argc, t_atom *argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	t_symbol					*address;
 	long						attrstart = attr_args_offset(argc, argv);			// support normal arguments
	
	// read the address to bind from the first argument
	if (attrstart > 0 && argv)
		address = atom_getsym(argv);
	else
		address = _sym_nothing;
	
	x->address = TTAddress(jamoma_parse_dieze((t_object*)x, address)->s_name);
	x->index = 0; // the index member is usefull to count how many time the external tries to bind
	
	// Prepare extra data
	x->extra = (t_extra*)malloc(sizeof(t_extra));
    
    // read the name to use for subscription from the first argument
	if (attrstart == 2 && argv)
		EXTRA->name = TTAddress(atom_getsym(argv+1)->s_name);
	else
		EXTRA->name = kTTAdrsEmpty;
    
    EXTRA->connected = NULL;
	EXTRA->label = NULL;
	
	EXTRA->color0 = (t_atom*)sysmem_newptr(sizeof(t_atom) * 4);
	atom_setfloat(EXTRA->color0, 0);
	atom_setfloat(EXTRA->color0+1, 0.);
	atom_setfloat(EXTRA->color0+2, 0.);
	atom_setfloat(EXTRA->color0+3, 1.);
	
	EXTRA->color1 = (t_atom*)sysmem_newptr(sizeof(t_atom) * 4);
	atom_setfloat(EXTRA->color1, 0.62);
	atom_setfloat(EXTRA->color1+1, 0.);
	atom_setfloat(EXTRA->color1+2, 0.36);
	atom_setfloat(EXTRA->color1+3, 0.70);
    
    EXTRA->setting = NO;
	
	jamoma_viewer_create((t_object*)x, x->wrappedObject);
	
	// Make two outlets
	x->outlets = (TTHandle)sysmem_newptr(sizeof(TTPtr) * 3);
	x->outlets[attach_out] = outlet_new(x, NULL);					// anything outlet to select ui
	x->outlets[value_out] = outlet_new(x, NULL);						// anything outlet to output data
	x->outlets[set_out] = outlet_new(x, NULL);						// anything outlet to output qlim data
	
	// Make qelem object
	EXTRA->ui_qelem = qelem_new(x, (method)remote_ui_queuefn);
    
    // clear support for qelem value
    x->argc = 0;
    x->argv = NULL;
	
	// handle attribute args
	attr_args_process(x, argc, argv);

	// The following must be deferred because we have to interrogate our box,
	// and our box is not yet valid until we have finished instantiating the object.
	// Trying to use a loadbang method instead is also not fully successful (as of Max 5.0.6)
	defer_low((t_object*)x, (method)remote_subscribe, NULL, 0, 0);
}

// Method for Assistance Messages
void remote_assist(TTPtr self, void *b, long msg, long arg, char *dst)
{
	if (msg==1) 						// Inlet
		strcpy(dst, "input");
	else {								// Outlets
		switch(arg) {
			case set_out:
				strcpy(dst, "set: connect to ui object");
				break;
			case value_out:
				strcpy(dst, "value");
				break;
			case attach_out:
				strcpy(dst, "attach: connect this outlet to ui object if the set or the value outlets are not directly connected to it");
				break;
			case dump_out:
				strcpy(dst, "dumpout");
				break;
		}
 	}
}

void WrappedViewerClass_free(TTPtr self)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
    
	qelem_free(EXTRA->ui_qelem);
    
    x->wrappedObject.set(kTTSym_address, kTTAdrsEmpty);
    
	free(EXTRA);
}

void remote_subscribe(TTPtr self)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTValue						v;
	t_atom						a[1];
	TTAddress                   contextAddress = kTTAdrsEmpty;
	TTAddress                   absoluteAddress, returnedAddress;
    TTNodePtr                   returnedNode = NULL;
    TTNodePtr                   returnedContextNode = NULL;
	TTObject                    anObject, empty;
    TTErr                       err;
    
    if (x->address == kTTAdrsEmpty)
		return;
    
    // attach the j.remote to connected ui object
    // TODO : this should be done when the an object is connected to one of the j.remote outlet
    // (but this means we need to unsubscribe then subscribe with the new name)
    remote_attach(self, set_out);
    
	// for absolute address we only bind the given address but we don't subscribe the remote into the namespace
	if (x->address.getType() == kAddressAbsolute) {
		
		x->wrappedObject.set(kTTSym_address, x->address);
		
        // observe :description attribute
        if (x->internals->lookup(TTSymbol(":description"), v))
            
            makeInternals_receiver(x, absoluteAddress, TTSymbol(":description"), gensym("return_description"), anObject, YES);
        
        else {
            anObject = v[0];
            anObject.set(kTTSym_address, absoluteAddress.appendAttribute(kTTSym_description));
        }
        
        anObject.send(kTTSym_Get);
        
        return;
	}
	
	// for relative address
	jamoma_patcher_get_info((t_object*)x, &x->patcherPtr, x->patcherContext, x->patcherClass, x->patcherName);
    
    // if no name is provided or can be edited in remote_attach() : use the address
    if (EXTRA->name == kTTAdrsEmpty)
        EXTRA->name = x->address;
	
    // if there is a context
    if (x->patcherContext != kTTSymEmpty) {
        
        // Do we subscribe the Viewer ?
        // View patcher case :
        if (x->patcherContext == kTTSym_view) {
            
            // if the address refer to the j.model (only :attributeName) don't subscribe the Viewer
            if (x->address.getParent() == NO_PARENT &&
                x->address.getName() == NO_NAME &&
                x->address.getInstance() == NO_INSTANCE &&
                x->address.getAttribute() != NO_ATTRIBUTE)
                err = jamoma_subscriber_create((t_object*)x, empty, x->address, x->subscriberObject, returnedAddress, &returnedNode, &returnedContextNode);
            
             // if the address refer to the "model" node don't subscribe the Viewer (to not have model.1)
            else if (x->address.getName() == TTSymbol("model"))
                err = jamoma_subscriber_create((t_object*)x, empty, x->address, x->subscriberObject, returnedAddress, &returnedNode, &returnedContextNode);
            
            // else try to subscribe the Viewer with its name
            else
                err = jamoma_subscriber_create((t_object*)x, x->wrappedObject, EXTRA->name, x->subscriberObject, returnedAddress, &returnedNode, &returnedContextNode);
            
        }
        // Model patcher case :
        // try to binds on the parameter|message|return of the model without subscribing the Viewer
        else if (x->patcherContext == kTTSym_model)
            err = jamoma_subscriber_create((t_object*)x, empty, x->address, x->subscriberObject, returnedAddress, &returnedNode, &returnedContextNode);
        
        // Any other case : give up
        else 
            return;
        
        // if the subscription is succesfull
        if (!err) {
            
            // get the context address to make
            // a viewer on the contextAddress/model:address attribute
            x->subscriberObject.get("contextAddress", v);
            contextAddress = v[0];
            
            // observe model:address attribute (in view patcher : deferlow return_model_address)
            makeInternals_receiver(x, contextAddress, TTSymbol("model:address"), gensym("return_model_address"), anObject, x->patcherContext == kTTSym_view);
            anObject.send(kTTSym_Get);
                
            return;
        }
	}
	// else, if no context, set address directly
	else {
		contextAddress = kTTAdrsRoot;
		absoluteAddress = contextAddress.appendAddress(x->address);
		x->wrappedObject.set(kTTSym_address, absoluteAddress);
		
		atom_setsym(a, gensym((char*)absoluteAddress.c_str()));
		object_obex_dumpout((t_object*)x, gensym("address"), 1, a);
        
        // observe :description attribute
        if (x->internals->lookup(TTSymbol(":description"), v))
            
            makeInternals_receiver(x, absoluteAddress, TTSymbol(":description"), gensym("return_description"), anObject, YES);
        
        else {
            anObject = v[0];
            anObject.set(kTTSym_address, absoluteAddress.appendAttribute(kTTSym_description));
        }
        
        anObject.send(kTTSym_Get);
        
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
		object_error((t_object*)x, "couldn't bind to j.parameter %s", x->address.c_str());
		object_obex_dumpout((t_object*)x, gensym("error"), 0, NULL);
		return;
	}
	
	// The following must be deferred because we have to interrogate our box,
	// and our box is not yet valid until we have finished instantiating the object.
	// Trying to use a loadbang method instead is also not fully successful (as of Max 5.0.6)
	defer_low((t_object*)x, (method)remote_subscribe, NULL, 0, 0);
}

void remote_return_value(TTPtr self, t_symbol *msg, long argc, t_atom *argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
    
    // a gate to not output the value if it have been set by this j.remote
    if (EXTRA->setting) {
        EXTRA->setting = NO;
        return;
    }
	
	// avoid blank before data
	if (msg == _sym_nothing)
		outlet_atoms(x->outlets[value_out], argc, argv);
	else
		outlet_anything(x->outlets[value_out], msg, argc, argv);
	
    // Copy msg and atom in order to avoid losing data
    copy_msg_argc_argv(self, msg, argc, argv);
	
    qelem_set(EXTRA->ui_qelem);
}

void remote_ui_queuefn(TTPtr self)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
    
    if (x->argc && x->argv)
        outlet_anything(x->outlets[set_out], _sym_set, x->argc, x->argv);
}

void remote_bang(TTPtr self)
{
	remote_list(self, _sym_bang, 0, NULL);
}

void remote_int(TTPtr self, long value)
{
	t_atom a;
	
	atom_setlong(&a, value);
	remote_list(self, _sym_int, 1, &a);
}

void remote_float(TTPtr self, double value)
{
	t_atom a;
	
	atom_setfloat(&a, value);
	remote_list(self, _sym_float, 1, &a);
}

TTErr remote_list(TTPtr self, t_symbol *msg, long argc, t_atom *argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	
	return jamoma_viewer_send(x->wrappedObject, msg, argc, argv);
}

void remote_set(TTPtr self, t_symbol *msg, long argc, t_atom *argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	
    EXTRA->setting = YES;
    
    if (remote_list(self, _sym_nothing, argc, argv))
        
        EXTRA->setting = NO;
}

void WrappedViewerClass_anything(TTPtr self, t_symbol *msg, long argc, t_atom *argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTValue		v;
	
	jamoma_viewer_send(x->wrappedObject, msg, argc, argv);
}

void remote_return_model_address(TTPtr self, t_symbol *msg, long argc, t_atom *argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTAddress           absoluteAddress;
    TTObject            anObject;
	t_atom				a[1];
	TTSymbol			service;
	TTValue				v;
	
	if (argc && argv && x->wrappedObject.valid()) {
        
		// set address attribute of the wrapped Viewer object
		absoluteAddress = TTAddress(atom_getsym(argv)->s_name).appendAddress(x->address);
		x->wrappedObject.set(kTTSym_address, absoluteAddress);
		x->index = 0; // the index member is usefull to count how many time the external tries to bind
        
        // observe :description attribute
        if (x->internals->lookup(TTSymbol(":description"), v))
            
            makeInternals_receiver(x, absoluteAddress, TTSymbol(":description"), gensym("return_description"), anObject, YES);
        
        else {
            anObject = v[0];
            anObject.set(kTTSym_address, absoluteAddress.appendAttribute(kTTSym_description));
        }
        
        anObject.send(kTTSym_Get);
		
		atom_setsym(a, gensym((char*)absoluteAddress.c_str()));
		object_obex_dumpout((t_object*)x, gensym("address"), 1, a);
		
		JamomaDebug object_post((t_object*)x, "binds on %s", absoluteAddress.c_str());
	}
}

void remote_return_description(TTPtr self, t_symbol *msg, long argc, t_atom *argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	
    // if an ui object is connected
	if (EXTRA->connected)
        
        // set its annotation attribute
        object_attr_setvalueof(EXTRA->connected, _sym_annotation , argc, argv);
}

void remote_address(TTPtr self, t_symbol *address)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
    
	x->address =  TTAddress(jamoma_parse_dieze((t_object*)x, address)->s_name);
    
    // unsubscribe the remote before
    if (x->subscriberObject.valid())
        x->subscriberObject = TTObject();
    
    remote_subscribe(self);
}

void remote_attach(TTPtr self, int attach_output_id)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	t_outlet	*myoutlet = NULL;
	t_dll		*connecteds = NULL;
	t_object	*object, *box;
    t_symbol    *maxclass = NULL;
	long        ac;
	t_atom		*av;
	
	// get the first object connected to the given outlet
	object_obex_lookup(x, _sym_pound_B, &box);
	
	myoutlet = (t_outlet*)jbox_getoutlet((t_jbox*)box, attach_output_id);
	if (myoutlet)
		connecteds = (t_dll*)myoutlet->o_dll;
	
	if (connecteds) {
        
		object = (t_object*)connecteds->d_x1;
        
        // check object class
        if (object)
           maxclass = object_attr_getsym(object, _sym_maxclass);

        EXTRA->connected = object;
		if (EXTRA->connected && maxclass) {
			
            // get presentation object size
			ac = 0;
			av = NULL;
			object_attr_getvalueof(EXTRA->connected, _sym_presentation_rect , &ac, &av);
			if (ac && av) {
				EXTRA->x = atom_getlong(av+0);
				EXTRA->y = atom_getlong(av+1);
				EXTRA->w = atom_getlong(av+2);
				EXTRA->h = atom_getlong(av+3);
			}
            
            // if no name is provided : edit the name.instance part of the address and the name of the ui object
            if (EXTRA->name == kTTAdrsEmpty) {
                
                TTString editName = x->address.c_str();
                editName += "(";
                editName += maxclass->s_name;
                editName += ")";
                
                EXTRA->name = TTAddress(editName);
            }
		}
	}
    
    // if no ui object are connected to :
    if (!connecteds || !object || !maxclass) {
        
        // the set outlet
        if (attach_output_id == set_out)
            
            // try to see at the data outlet
            return  remote_attach(self, value_out);
        
        // the value outlet
        else if (attach_output_id == value_out)
            
            // try to see at the attach outlet
            return  remote_attach(self, attach_out);
        
        // the attach outlet
        else
            
            // give up
            return;
    }
}

// When the mouse is moving on the j.ui (not our remote object !)
void remote_mousemove(TTPtr self, t_object *patcherview, t_pt pt, long modifiers)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTValue		v;
	TTBoolean	selected;
	t_object	*patcher;
	long        ac;
	t_atom		*av;
	t_atom		a;
	
	if (EXTRA->connected) {
		
		// if the control key is pressed
		if (modifiers & eShiftKey) {
			
			// hide gui
			atom_setlong(&a, 1);
			object_attr_setvalueof(EXTRA->connected, _sym_hidden, 1, &a);
			
			// create a comment object
			if (!EXTRA->label) {
				patcher = NULL;
				ac = 0;
				av = NULL;
				object_obex_lookup(x, gensym("#P"), &patcher);
				EXTRA->label = newobject_sprintf(patcher, "@maxclass comment @presentation 1 @textcolor 1. 1. 1. 1.");
				object_attr_getvalueof(EXTRA->connected, _sym_presentation_rect , &ac, &av);
				if (ac && av && EXTRA->label) {
					object_method_long(EXTRA->label, _sym_fontsize, 10, &a);
					object_method_sym(EXTRA->label, _sym_set, gensym((char*)x->address.c_str()), &a);
					object_method_typed(EXTRA->label, _sym_presentation_rect, ac, av, &a);
				}
			}
			
			// display selected attribute by changing background color if selected
			x->wrappedObject.get(kTTSym_highlight, v);
			selected = v[0];
			
			if (EXTRA->label) {
				if (selected)
					object_attr_setvalueof(EXTRA->label, _sym_bgcolor, 4, (t_atom*)EXTRA->color1);
				else
					object_attr_setvalueof(EXTRA->label, _sym_bgcolor, 4, (t_atom*)EXTRA->color0);
            }
		}
		// else set default color
		// TODO : do this only one time !!!
		else {
			
			// show gui
			atom_setlong(&a, 0);
			object_attr_setvalueof(EXTRA->connected, _sym_hidden, 1, &a);
			
			// delete label
			if (EXTRA->label) {
				object_free(EXTRA->label);
				EXTRA->label = NULL;
			}
		}
	}
}

// When the mouse is leaving on the j.ui (not our remote object !)
void remote_mouseleave(TTPtr self, t_object *patcherview, t_pt pt, long modifiers)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	t_atom		a;
	
	// if mouse leaves j.ui maybe it is on our object
	if (pt.x > EXTRA->x && pt.x < EXTRA->x+EXTRA->w && pt.y > EXTRA->y && pt.y < EXTRA->y+EXTRA->h)
		return;
	
	// else the mouse leaves outside the j.ui
	else {
		
		// show gui
		atom_setlong(&a, 0);
		object_attr_setvalueof(EXTRA->connected, _sym_hidden, 1, &a);
		
		// delete label
		if (EXTRA->label) {
			object_free(EXTRA->label);
			EXTRA->label = NULL;
		}
	}
}

void remote_mousedown(TTPtr self, t_object *patcherview, t_pt pt, long modifiers)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTValue		v;
	TTBoolean	selected;
	
	// if the control key is pressed
	if (modifiers & eShiftKey) {
		
		// if mouse leave j.ui maybe it is on our object
		if (pt.x > EXTRA->x && pt.x < EXTRA->x+EXTRA->w && pt.y > EXTRA->y && pt.y < EXTRA->y+EXTRA->h) {
			
			x->wrappedObject.get(kTTSym_highlight, v);
			selected = v[0];
			
			// reverse selected attribute and change color
			if (EXTRA->label) {
				if (selected) {
					x->wrappedObject.set(kTTSym_highlight, NO);
					object_attr_setvalueof(EXTRA->label, _sym_bgcolor, 4, (t_atom*)EXTRA->color0);
				}
				else {
					x->wrappedObject.set(kTTSym_highlight, YES);
					object_attr_setvalueof(EXTRA->label, _sym_bgcolor, 4, (t_atom*)EXTRA->color1);
				}
            }
		}
	}
}