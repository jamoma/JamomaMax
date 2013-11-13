/** 
 * \file j.send.cpp
 * External for Jamoma: send messages from remote
 * By Trond Lossius & Tim Place, Copyright � 2006
 * 
 * License: This code is licensed under the terms of the "New BSD License"
 * http://creativecommons.org/licenses/BSD/
 */

#include "Jamoma.h"

/** Send Object */
typedef struct _send{
	t_object					ob;					///< REQUIRED: Our object
	TTSenderPtr					sender;				///< the TTObject class to send data
} t_send;

// Prototypes
/** Called at object instantiation.
 @param s			Pointer to symbol bassed as message argument to the object.
 @param argc		The number of arguments passed to the object.
 @param argv		Pointer to arguments as an array of atoms.
 @return			Pointer to the newly created object.
 */
void *send_new(t_symbol *s, long argc, t_atom *argv);


/** Free up and dispose of the object.
 @param x			Pointer to this object.
 */
void send_free(t_send *x);


/** Method for displaying assist strings for inlets and outlets.
 @param x			Pointer to this object.
 @param b
 @param msg
 @param argc
 @param argv
 */
void send_assist(t_send *x, void *b, long msg, long arg, char *dst);


t_max_err	send_setaddress(t_send *x, void *attr, AtomCount argc, AtomPtr argv);
t_max_err	send_getaddress(t_send *x, void *attr, AtomCount *argc, AtomPtr *argv);

t_max_err	send_setattribute(t_send *x, void *attr, AtomCount argc, AtomPtr argv);
t_max_err	send_getattribute(t_send *x, void *attr, AtomCount *argc, AtomPtr *argv);

/** Forward a bang to the associated receive objects.
 @param c			Pointer to this object.
 */
void send_bang(t_send *x);


/** Forward an int to the associated receive objects.
 @param c			Pointer to this object.
 @param value		The value to send.
 */
void send_int(t_send *x, long value);


/** Forward a float to the associated receive objects.
 @param c			Pointer to this object.
 @param value		The value to send.
 */
void send_float(t_send *x, double value);


/** Forward a list or message to the associated receive objects.
 @param c			Pointer to this object.
 @param msg			The message to send as pointer to a symbol.
 @param argc		The number of arguments of the message.
 @param argv		The arguments as a pointer to an array of atoms.
 */
void send_list(t_send *x, t_symbol *msg, long argc, t_atom *argv);

// Globals
static t_class		*s_send_class;				// Required: Global pointer for our class


/************************************************************************************/
// Main() Function

void send_initclass()
{
	t_class *c;
	t_object *attr;
	
	// Define our class
	c = class_new("j.send", 
				  (method)send_new, 
				  (method)send_free, 
				  sizeof(t_send), 
				  (method)0L, 
				  A_GIMME, 
				  0);

	// Make methods accessible for our class:
	class_addmethod(c, (method)send_bang,				"bang",							0L);
	class_addmethod(c, (method)send_int,				"int",							A_LONG, 0L);
	class_addmethod(c, (method)send_float,				"float",						A_FLOAT, 0L);
	class_addmethod(c, (method)send_list,				"list",							A_GIMME, 0L);
	class_addmethod(c, (method)send_list,				"anything",						A_GIMME, 0L);
    class_addmethod(c, (method)send_assist,				"assist",						A_CANT, 0L);
    class_addmethod(c, (method)object_obex_dumpout, 	"dumpout",						A_CANT,0);
	 
	// ATTRIBUTE: address
	attr = attr_offset_new("address", _sym_symbol, 0,
		(method)send_getaddress, (method)send_setaddress, NULL);
	class_addattr(c, attr);
	 
	 // ATTRIBUTE: attribute
	 attr = attr_offset_new("attribute", _sym_symbol, 0,
	 (method)send_getattribute, (method)send_setattribute, NULL);
	 class_addattr(c, attr);
	
	// Finalize our class
	class_register(CLASS_BOX, c);
	s_send_class = c;
}


/************************************************************************************/
// Object Life

// Create
void *send_new(t_symbol *s, long argc, t_atom *argv)
{
	long	 attrstart = attr_args_offset(argc, argv);		// support normal arguments
	t_send	 *x = (t_send *)object_alloc(s_send_class);
	
	if(x){
		object_obex_store((void *)x, _sym_dumpout, (object *)outlet_new(x, NULL));
		
		attr_args_process(x, argc, argv);			// handle attribute args				
		
		// If no address was specified as an attribute
		if(attrstart > 0)
			;//jamoma_sender_create((ObjectPtr)x, atom_getsym(argv), &x->sender);

	}
	return x;
}

void send_free(t_send *x)
{
	TTObjectRelease(TTObjectHandle(&x->sender));
}


/************************************************************************************/
// Methods bound to input/inlets

// Method for Assistance Messages
void send_assist(t_send *x, void *b, long msg, long arg, char *dst)
{
	if(msg==1) 			// Inlets
		strcpy(dst, "input to dispatch to j.receive objects");
	else if(msg==2)		// Outlets
		strcpy(dst, "dumpout");
}

// ATTRIBUTE: address
t_max_err send_setaddress(t_send *x, void *attr, AtomCount argc, AtomPtr argv)
{
	TTValue v;
	
	if (atom_gettype(argv) == A_SYM) {
		
		v.append(TT(atom_getsym(argv)->s_name));
		x->sender->setAttributeValue(TTSymbol("Address"), v);
		
	}
	else
		return MAX_ERR_GENERIC;
	
	return MAX_ERR_NONE;
}

t_max_err send_getaddress(t_send *x, void *attr, AtomCount *argc, AtomPtr *argv)
{
	TTValue v;
	TTSymbol s;
	
	*argc = 1;
	
	if (!(*argv)) { // otherwise use memory passed in
		*argv = (t_atom *)sysmem_newptr(sizeof(t_atom));
		
		x->sender->getAttributeValue(TTSymbol("Address"), v);
		s = NULL;
		v.get(0, s);
		atom_setsym(*argv, gensym((char*)s.c_str()));
	}
	else
		return MAX_ERR_GENERIC;
	
	return MAX_ERR_NONE;
}

// ATTRIBUTE: attribute
t_max_err send_setattribute(t_send *x, void *attr, AtomCount argc, AtomPtr argv)
{
	TTValue v;
	
	if (atom_gettype(argv) == A_SYM) {
		
		v.append(TT(atom_getsym(argv)->s_name));
		x->sender->setAttributeValue(TTSymbol("Attribute"), v);
		
	}
	else
		return MAX_ERR_GENERIC;
	
	return MAX_ERR_NONE;
}

t_max_err send_getattribute(t_send *x, void *attr, AtomCount *argc, AtomPtr *argv)
{
	TTValue v;
	TTSymbol s;
	
	*argc = 1;
	
	if (!(*argv)) { // otherwise use memory passed in
		*argv = (t_atom *)sysmem_newptr(sizeof(t_atom));
		
		x->sender->getAttributeValue(TTSymbol("Attribute"), v);
		s = NULL;
		v.get(0, s);
		atom_setsym(*argv, gensym((char*)s.c_str()));
	}
	else
		return MAX_ERR_GENERIC;
	
	return MAX_ERR_NONE;
}

void send_bang(t_send *x)
{
	send_list(x, _sym_bang, 0, NULL);
}

void send_int(t_send *x, long value)
{
	t_atom a;
	
	atom_setlong(&a, value);
	send_list(x, _sym_int, 1, &a);
}


void send_float(t_send *x, double value)
{
	t_atom a;
	
	atom_setfloat(&a, value);
	send_list(x, _sym_float, 1, &a);
}

void send_list(t_send *x, t_symbol *msg, long argc, t_atom *argv)
{
	TTValue		c;
	TTSenderPtr	aTempSender;
	
	// Make a temporary sender
	if (msg->s_name[0] == C_SEPARATOR)
	{
		;/*if (jamoma_sender_create((ObjectPtr)x, msg, &aTempSender)) {
			jamoma_sender_send(aTempSender, _sym_list, argc, argv);
			TTObjectRelease(TTObjectHandle(&aTempSender));
		}*/
	}
	else
		jamoma_sender_send(x->sender, msg, argc, argv);
}
