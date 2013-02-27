/** 
 * \file jcom.pass.cpp
 * External for Jamoma: pass messages if they match our criteria
 * By Tim Place, Copyright © 2005
 * 
 * License: This code is licensed under the terms of the "New BSD License"
 * http://creativecommons.org/licenses/BSD/
 */

#include "Jamoma.h"

#define MAX_ARGCOUNT 100
#define MAX_MESS_SIZE 2048

typedef struct _pass{						// Data Structure for this object
	t_object	ob;							// REQUIRED: Our object
	void 		*outlets[MAX_ARGCOUNT];		// my outlet array
	void		*outlet_overflow;			// this outlet doubles as the dumpout outlet
	t_atom		arguments[MAX_ARGCOUNT];
	short		num_args;
	long		attr_strip;					// ATTRIBUTE: 1 = strip leading slash off any messages
	long		attr_stripnonmatches;		// ATTRIBUTE: 1 = strip leading slash off overflow
} t_pass;

// Prototypes for our methods:
void *pass_new(t_symbol *s, long argc, t_atom *argv);
void pass_assist(t_pass *x, void *b, long msg, long arg, char *dst);
void pass_int(t_pass *x, long n);
void pass_float(t_pass *x, double f);
void pass_symbol(t_pass *x, t_symbol *msg, long argc, t_atom *argv);
void pass_list(t_pass *x, t_symbol *msg, long argc, t_atom *argv);

// Globals
t_class		*pass_class;				// Required: Global pointer for our class


/************************************************************************************/
// Main() Function

int JAMOMA_EXPORT_MAXOBJ main(void)
{
	long attrflags = 0;
	t_class *c;
	t_object *attr;
	
	jamoma_init();
	common_symbols_init();

	// Define our class
	c = class_new("jcom.pass",(method)pass_new, (method)0L, sizeof(t_pass), (method)0L, A_GIMME, 0);

	// Make methods accessible for our class: 
	class_addmethod(c, (method)pass_int,				"int",		A_DEFLONG,	0L);
	class_addmethod(c, (method)pass_float,				"float",	A_DEFFLOAT,	0L);
  	class_addmethod(c, (method)pass_list,				"list",		A_GIMME, 0L);	
  	class_addmethod(c, (method)pass_symbol,				"anything", A_GIMME, 0L);	
	class_addmethod(c, (method)pass_assist,				"assist",	A_CANT, 0L); 
    class_addmethod(c, (method)object_obex_dumpout, 	"dumpout",	A_CANT,0);

	// ATTRIBUTE: strip
	attr = attr_offset_new("strip", _sym_long, attrflags,
		(method)0, (method)0, calcoffset(t_pass, attr_strip));
	class_addattr(c, attr);	

	// ATTRIBUTE: stripnonmatches
	attr = attr_offset_new("stripnonmatches", _sym_long, attrflags,
		(method)0, (method)0, calcoffset(t_pass, attr_stripnonmatches));
	class_addattr(c, attr);

	// Finalize our class
	class_register(CLASS_BOX, c);
	pass_class = c;
	return 0;
}


/************************************************************************************/
// Object Life

void *pass_new(t_symbol *s, long argc, t_atom *argv)
{
	short i;
	char argument[MAX_MESS_SIZE];	// temporary container for arguments
	t_pass	*x = (t_pass *)object_alloc(pass_class);
	long attrstart = attr_args_offset(argc, argv);
	
	if (x) {
		x->outlet_overflow = outlet_new(x, 0);		// overflow outlet
		object_obex_store((void *)x, _sym_dumpout, (object *)x->outlet_overflow);	// dumpout
//		x->num_args = argc;
		x->num_args = attrstart;

		for (i=x->num_args-1; i >= 0; i--) {				
			x->outlets[i] = outlet_new(x, 0);		// Create Outlet
			switch(argv[i].a_type) {
				case A_LONG:
					atom_setlong(&(x->arguments[i]), atom_getlong(argv+i));
					break;
				case A_FLOAT:
					atom_setfloat(&(x->arguments[i]), atom_getfloat(argv+i));
					break;
				case A_SYM:
					strcpy(argument, atom_getsym(argv+i)->s_name);
					if (argument[0] == '/')
						atom_setsym(&(x->arguments[i]), gensym(argument+1));
//					else if (argument[0] == '@')		// This is the start of our attributes
//						goto out;
					else
						atom_setsym(&(x->arguments[i]), gensym(argument));
					break;
			}
		}
//out:
		x->attr_strip = 1;							// set default
		x->attr_stripnonmatches = 0;
		attr_args_process(x, argc, argv);			//handle attribute args	
	}
	return (x);										// return the pointer to our new instantiation
}


/************************************************************************************/
// Methods bound to input/inlets

// Method for Assistance Messages
void pass_assist(t_pass *x, void *b, long msg, long arg, char *dst)
{
	if (msg==1) 						// Inlet
		strcpy(dst, "Input");
	else if (msg==2) { 				// Outlets
		if (arg < x->num_args) {
			t_symbol	*argname;
			char		tempstring[200];
			switch(x->arguments[arg].a_type) {
				case A_LONG:
					snprintf(tempstring, 200, "%ld", atom_getlong(&x->arguments[arg]));
					strcpy(dst, tempstring);
					break;
				case A_FLOAT:
					snprintf(tempstring, 200, "%f", atom_getfloat(&x->arguments[arg]));
					strcpy(dst, tempstring);
					break;
				case A_SYM:
					argname = atom_getsym(&x->arguments[arg]);
					strcpy(dst, argname->s_name);
					break;
			}
		}
		else
			strcpy(dst, "dumpout / overflow from non-matching input");	
 	}		
}


// INT INPUT
void pass_int(t_pass *x, long n)
{
	short i;
	
	for (i=0; i< x->num_args; i++) {
		if (x->arguments[i].a_type == A_LONG) {
			if (n == atom_getlong(&x->arguments[i])) {
				outlet_int(x->outlets[i], n);
				return;
			}
		}
	}
	outlet_int(x->outlet_overflow, n);
}


// FLOAT INPUT
void pass_float(t_pass *x, double f)
{
	short i;
	
	for (i=0; i< x->num_args; i++) {
		if (x->arguments[i].a_type == A_FLOAT) {
			if (f == atom_getfloat(&x->arguments[i])) {
				outlet_float(x->outlets[i], f);
				return;
			}
		}
	}
	outlet_float(x->outlet_overflow, f);
}


// SYMBOL INPUT
void pass_symbol(t_pass *x, t_symbol *msg, long argc, t_atom *argv)
{
	short		i;
	t_symbol	*message;
	char *input = msg->s_name;

	// strip any leading slashes
	if (*input == '/')
		input++;
	message = gensym(input);

	// parse and send
	for (i=0; i< x->num_args; i++) {
		if (message == atom_getsym(&x->arguments[i])) {
			if (x->attr_strip != 0)
				outlet_anything(x->outlets[i], message, argc , argv);
			else
				outlet_anything(x->outlets[i], msg, argc , argv);
			return;
		}
	}
	if (x->attr_stripnonmatches !=0)
		outlet_anything(x->outlet_overflow, message, argc , argv);
	else
		outlet_anything(x->outlet_overflow, msg, argc , argv);
}


// LIST INPUT
void pass_list(t_pass *x, t_symbol *msg, long argc, t_atom *argv)
{
	short		i;
	t_symbol	*message;
	
	// strip any leading slashes
	if (x->attr_strip != 0) {
		char *input = msg->s_name;
		if (*input == '/')
			input++;
		message = gensym(input);
	}
		
	// parse and send
	switch(argv[0].a_type) {
		case A_LONG:
			for (i=0; i< x->num_args; i++) {
				if (x->arguments[i].a_type == A_LONG) {
					if (atom_getlong(argv) == atom_getlong(&x->arguments[i])) {
						outlet_list(x->outlets[i], 0L, argc , argv);
						return;
					}
				}
			}
			outlet_list(x->outlet_overflow, 0L, argc , argv);
			break;
		case A_FLOAT:
			for (i=0; i< x->num_args; i++) {
				if (x->arguments[i].a_type == A_FLOAT) {
					if (atom_getfloat(argv) == atom_getfloat(&x->arguments[i])) {
						outlet_list(x->outlets[i], 0L, argc , argv);
						return;
					}
				}
			}
			outlet_list(x->outlet_overflow, 0L, argc , argv);
			break;
		case A_SYM:
			for (i=0; i< x->num_args; i++) {
				if (atom_getsym(argv) == atom_getsym(&x->arguments[i])) {
					outlet_anything(x->outlets[i], message, argc , argv);
					return;
				}
			}
			outlet_list(x->outlet_overflow, 0L, argc , argv);
			break;
		default:
			outlet_list(x->outlet_overflow, 0L, argc , argv);
			break;
	}
}
