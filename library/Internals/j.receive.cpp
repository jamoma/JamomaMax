/** 
 * \file j.receive.cpp
 * External for Jamoma: receive messages from remote
 * By Trond Lossius & Tim Place, Copyright � 2006
 * 
 * License: This code is licensed under the terms of the "New BSD License"
 * http://creativecommons.org/licenses/BSD/
 */

#include "Jamoma.h"


/** Receive Object */
typedef struct _receive{
	t_object					ob;					///< REQUIRED: Our object
	void						*address_out;		///< outlet used to output address of received data
	void						*data_out;			///< outlet used to output received data
	TTReceiverPtr				receiver;			///< the TTObject class to receive data
	
} t_receive;

// Prototypes

/** Object instantiation.
 @param s			Pointer to symbol bassed as message argument to the object.
 @param argc		The number of arguments passed to the object.
 @param argv		Pointer to arguments as an array of atoms.
 @return			Pointer to the newly created object.
 */
void		*receive_new(t_symbol *s, long argc, t_atom *argv);


/** This method is called when the object is free (deleted).
 @param x			Pointer to the object.
 */
void		receive_free(t_receive *x);


/** Method for displaying assist strings for inlets and outlets.
 @param x			Pointer to this object.
 @param b
 @param msg
 @param argc
 @param argv
 */
void		receive_assist(t_receive *x, void *b, long msg, long arg, char *dst);

t_max_err 	receive_setaddress(t_receive *x, void *attr, long argc, t_atom *argv);
t_max_err	receive_getaddress(t_receive *x, void *attr, AtomCount *argc, AtomPtr *argv);

t_max_err 	receive_setattribute(t_receive *x, void *attr, long argc, t_atom *argv);
t_max_err	receive_getattribute(t_receive *x, void *attr, AtomCount *argc, AtomPtr *argv);

t_max_err 	receive_setenable(t_receive *x, void *attr, long argc, t_atom *argv);
t_max_err	receive_getenable(t_receive *x, void *attr, AtomCount *argc, AtomPtr *argv);

void		receive_return_address(t_receive *x, t_symbol *mess, long argc, t_atom *argv);
void		receive_return_value(t_receive *x, t_symbol *mess, long argc, t_atom *argv);

void		receive_build(t_receive *x,  t_symbol *address);

// ask the value to the binded node
void		receive_get(t_receive *x);

// ask the value of any node without binding on it
void		receive_symbol(t_receive *x, t_symbol *mess, long argc, t_atom *argv);

// Globals
static t_class		*s_receive_class;					// Required: Global pointer the j.receive class


/************************************************************************************/

void receive_initclass()
{
	t_class *c;
	t_object *attr;
	
	// Define our class
	c = class_new(	"j.receive", 
					(method)receive_new, 
					(method)receive_free, 
					sizeof(t_receive), 
					(method)0L, 
					A_GIMME, 
					0);

	// Make methods accessible for our class: 
	class_addmethod(c, (method)receive_return_address,			"return_address",		A_CANT, 0);
	class_addmethod(c, (method)receive_return_value,			"return_value",			A_CANT, 0);
    class_addmethod(c, (method)receive_assist,					"assist",				A_CANT, 0);
    class_addmethod(c, (method)object_obex_dumpout,				"dumpout",				A_CANT, 0);
	
	// ask the value to the binded node
	class_addmethod(c, (method)receive_get,						"bang",					0);
	
	// ask the value of any node without binding on it
	class_addmethod(c, (method)receive_symbol,					"anything",				A_GIMME, 0);
	
	// ATTRIBUTE: address
	attr = attr_offset_new("address", _sym_symbol, 0, (method)receive_getaddress, (method)receive_setaddress, NULL);
	class_addattr(c, attr);
	
	// ATTRIBUTE: attribute
	attr = attr_offset_new("attribute", _sym_symbol, 0,  (method)receive_getattribute, (method)receive_setattribute, NULL);
	class_addattr(c, attr);
	
	// ATTRIBUTE: enable
	attr = attr_offset_new("enable", _sym_long, 0, (method)receive_getenable, (method)receive_setenable, NULL);
	class_addattr(c, attr);
	
	// Finalize our class
	class_register(CLASS_BOX, c);
	s_receive_class = c;
}


/************************************************************************************/
// Object Life

// Create
void *receive_new(t_symbol *s, long argc, t_atom *argv)
{
	long		attrstart = attr_args_offset(argc, argv);		// support normal arguments
	t_receive	*x = (t_receive *)object_alloc(s_receive_class);

	if(x){
		x->address_out = outlet_new(x,NULL);		// anything outlet
		x->data_out = outlet_new(x, NULL);			// anything outlet
		
		attr_args_process(x, argc, argv);			// handle attribute args				
		
		// If no address was specified as an attribute
		if(attrstart > 0)
			;//jamoma_receiver_create((ObjectPtr)x, atom_getsym(argv), &x->receiver);

	}
	return x;
}


// Destroy
void receive_free(t_receive *x)
{
	;
}

/************************************************************************************/
// Methods bound to input/inlets

// Method for Assistance Messages
void receive_assist(t_receive *x, void *b, long msg, long arg, char *dst)
{
	if(msg==1) 	// Inlets
		strcpy(dst, "(signal) input to the module");
	else if(msg==2){ // Outlets
		if(arg == 0) 
			strcpy(dst, "output from remote");
		else 
			strcpy(dst, "dumpout");
	}
}


// ATTRIBUTE: address
t_max_err receive_setaddress(t_receive *x, void *attr, long argc, t_atom *argv)
{
	TTValue v;
	
	if (atom_gettype(argv) == A_SYM) {
		
		v.append(TT(atom_getsym(argv)->s_name));
		x->receiver->setAttributeValue(TTSymbol("Address"), v);
		
	}
	else
		return MAX_ERR_GENERIC;
	
	return MAX_ERR_NONE;
}

t_max_err receive_getaddress(t_receive *x, void *attr, AtomCount *argc, AtomPtr *argv)
{
	TTValue v;
	TTSymbol s;
	
	*argc = 1;
	
	if (!(*argv)) { // otherwise use memory passed in
		*argv = (t_atom *)sysmem_newptr(sizeof(t_atom));
		
		x->receiver->getAttributeValue(TTSymbol("Address"), v);
		s = NULL;
		v.get(0, s);
		atom_setsym(*argv, gensym((char*)s.c_str()));
	}
	else
		return MAX_ERR_GENERIC;
	
	return MAX_ERR_NONE;
}


// ATTRIBUTE: attribute
t_max_err receive_setattribute(t_receive *x, void *attr, long argc, t_atom *argv)
{
	TTValue v;
	
	if (atom_gettype(argv) == A_SYM) {
		
		v.append(TT(atom_getsym(argv)->s_name));
		x->receiver->setAttributeValue(TTSymbol("Attribute"), v);
		
	}
	else
		return MAX_ERR_GENERIC;
	
	return MAX_ERR_NONE;
}

t_max_err receive_getattribute(t_receive *x, void *attr, AtomCount *argc, AtomPtr *argv)
{
	TTValue v;
	TTSymbol s;
	
	*argc = 1;
	
	if (!(*argv)) { // otherwise use memory passed in
		*argv = (t_atom *)sysmem_newptr(sizeof(t_atom));
		
		x->receiver->getAttributeValue(TTSymbol("Attribute"), v);
		s = NULL;
		v.get(0, s);
		atom_setsym(*argv, gensym((char*)s.c_str()));
	}
	else
		return MAX_ERR_GENERIC;
	
	return MAX_ERR_NONE;
}

// ATTRIBUTE: enable
t_max_err receive_setenable(t_receive *x, void *attr, long argc, t_atom *argv)
{
	TTValue v;
	
	if (atom_gettype(argv) == A_LONG) {
		
		if (atom_getlong(argv))
			v.append((TTBoolean)kTTBoolYes);
		else
			v.append((TTBoolean)kTTBoolNo);
		
		x->receiver->setAttributeValue(TTSymbol("Enable"), v);
		
	}
	else
		return MAX_ERR_GENERIC;
	
	return MAX_ERR_NONE;
}

t_max_err receive_getenable(t_receive *x, void *attr, AtomCount *argc, AtomPtr *argv)
{
	TTValue v;
	TTBoolean b;
	
	*argc = 1;
	
	if (!(*argv)) { // otherwise use memory passed in
		*argv = (t_atom *)sysmem_newptr(sizeof(t_atom));
		
		x->receiver->getAttributeValue(TTSymbol("Enable"), v);
		b = NULL;
		v.get(0, b);
		atom_setlong(*argv, b);
	}
	else
		return MAX_ERR_GENERIC;
	
	return MAX_ERR_NONE;
}

// ask the value to the binded node
void receive_get(t_receive *x)
{
	x->receiver->sendMessage(TTSymbol("get"));
}

// ask the value of any node without binding on it
void receive_symbol(t_receive *x, t_symbol* msg, long argc, t_atom* argv)
{
	TTReceiverPtr aTempReceiver;
	
	// Make a temporary receiver
	if (msg->s_name[0] == C_SEPARATOR)
	{
		/*if (jamoma_receiver_create((ObjectPtr)x, msg, &aTempReceiver)) {
			aTempReceiver->sendMessage(TTSymbol("get"));
			TTObjectRelease(TTObjectHandle(&aTempReceiver));
		}*/
	}
}

void receive_return_address(t_receive *x, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	outlet_anything(x->address_out, msg, argc, argv);
}

void receive_return_value(t_receive *x, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	outlet_anything(x->data_out, msg, argc, argv);
}

