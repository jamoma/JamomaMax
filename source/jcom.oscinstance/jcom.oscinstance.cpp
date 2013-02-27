/** 
 * \file jcom.oscinstance.cpp
 * External for Jamoma: retrieve instance numbers or ids from osc messages
 * By Trond Lossius, Copyright � 2005
 * 
 * License: This code is licensed under the terms of the "New BSD License"
 * http://creativecommons.org/licenses/BSD/
 */

#include "Jamoma.h"

#define MAX_MESS_SIZE 2048

typedef struct _oscinstance{				///< Data Structure for this object
	t_object	ob;							///< REQUIRED: Our object
	void		*outlet0;					///< Leftmost outlet, passing osc messages
	void		*outlet1;					///< 2nd outlet, passing instance number or ID
	void		*outlet2;					///< 3rd outlet, passing the arguments of incomming OSC messages
	void		*outlet_overflow;			///< The rightmost outlet: This outlet doubles as the dumpout outlet
} t_oscinstance;

/** The jcom.oscinstance constructor */
void *oscinstance_new(t_symbol *s, long argc, t_atom *argv);

/** Provide assistance strings in the patcher window. */
void oscinstance_assist(t_oscinstance *x, void *b, long msg, long arg, char *dst);

/** Method for bang input. */
void oscinstance_bang(t_oscinstance *x);

/** Method for int input. */
void oscinstance_int(t_oscinstance *x, long n);

/** Method for int float. */
void oscinstance_float(t_oscinstance *x, double f);

/** Method for anything else, including OSC messages. */
void oscinstance_symbol(t_oscinstance *x, t_symbol *msg, long argc, t_atom *argv);
//void oscinstance_list(t_oscinstance *x, t_symbol *msg, long argc, t_atom *argv);

// Globals
t_class		*oscinstance_class;				// Required: Global pointer for our class


/************************************************************************************/
// Main() Function

int JAMOMA_EXPORT_MAXOBJ main(void)
{
	t_class *c;
	
	jamoma_init();
	common_symbols_init();

	c = class_new("jcom.oscinstance",(method)oscinstance_new, (method)0L, sizeof(t_oscinstance), (method)0L, A_GIMME, 0);

	class_addmethod(c, (method)oscinstance_bang,		"bang",		0);	
	class_addmethod(c, (method)oscinstance_int,			"int",		A_DEFLONG,	0L);
	class_addmethod(c, (method)oscinstance_float,		"float",	A_DEFFLOAT,	0L);
  	class_addmethod(c, (method)oscinstance_symbol,		"list", 	A_GIMME, 0L);
  	class_addmethod(c, (method)oscinstance_symbol,		"anything", A_GIMME, 0L);
	class_addmethod(c, (method)oscinstance_assist,		"assist",	A_CANT, 0L); 
    class_addmethod(c, (method)object_obex_dumpout, 	"dumpout",	A_CANT,0);

	// Finalize our class
	class_register(CLASS_BOX, c);
	oscinstance_class = c;
	return 0;
}


/************************************************************************************/
// Object Life

void *oscinstance_new(t_symbol *s, long argc, t_atom *argv)
{
	t_oscinstance	*x = (t_oscinstance *)object_alloc(oscinstance_class);
	
	if (x) {
		x->outlet_overflow = outlet_new(x, 0);		// overflow outlet
		object_obex_store((void *)x, _sym_dumpout, (object *)x->outlet_overflow);	// dumpout
		x->outlet2 = outlet_new(x, 0);				// Create Outlet
		x->outlet1 = outlet_new(x, 0);				// Create Outlet
		x->outlet0 = outlet_new(x, 0);				// Create Outlet
	}
	return (x);										// return the pointer to our new instantiation
}


/************************************************************************************/
// Methods bound to input/inlets

// Method for Assistance Messages
void oscinstance_assist(t_oscinstance *x, void *b, long msg, long arg, char *dst)
{
	if (msg==1) 						// Inlet
		strcpy(dst, "Input");
	else if (msg==2) { 				// Outlets
		if (arg == 0)
			strcpy(dst, "OSC message with instance info stripped");
		else if (arg == 1)
		 	strcpy(dst, "OSC instance number or ID");
		else if (arg == 2)
		 	strcpy(dst, "parameter value");		
		else
			strcpy(dst, "dumpout / overflow from non-matching input");	
 	}		
}


void oscinstance_bang(t_oscinstance *x)
{
	outlet_bang(x->outlet_overflow);
}


// INT INPUT
void oscinstance_int(t_oscinstance *x, long n)
{
	outlet_int(x->outlet_overflow, n);
}


// FLOAT INPUT
void oscinstance_float(t_oscinstance *x, double f)
{
	outlet_float(x->outlet_overflow, f);
}


// SYMBOL INPUT
void oscinstance_symbol(t_oscinstance *x, t_symbol *msg, long argc, t_atom *argv)
{
	char			input[MAX_MESS_SIZE];	// our input string
	char			*input2 = input;		// pointer to our input string
	char			*dot;
	char			*slash;
	t_symbol		*instance;
	char			*instanceEnd;
	t_symbol		*output;
	t_symbol		*osc = NULL;
	long			i;
	bool			leadingSlash;

	strcpy(input, msg->s_name);
	
	/*	to -- the introduction of relative address feature
		in modular0.6 make this test useless
	 
	
	// This object only deals with OSC messages
	if (!(*input2 == '/')) {
		goto spillover;
	}
	*/
	leadingSlash = *input2 == '/';
	if (leadingSlash)
		input2++;							// jump past the leading slash

	dot = strchr(input2, '.');				// look for dot
	if (dot == NULL)
		goto spillover;

	slash = strchr(input2, '/');			// checking for additional osc branches

	if ( slash == 0) {
		*dot = NULL;
		osc = gensym(input2 - leadingSlash);// reintroduce the leading slash if needed
		instance = gensym(dot+1);
	}
	else {
		if ( slash<dot )
			goto spillover;					// there are instances, but not in the leading branch		
		*dot = NULL;	
		*slash = NULL;						// temporarily remove the slash
		instance = gensym(dot+1);
		*slash = '/';						// put slash back in
		strcat(input, slash);				// remove the instance part and concatenate
		osc = gensym(input2 - leadingSlash); // reintroduce the leading slash if needed
	}	
		
	// Output from 3rd outlet: The arguments of the OSC message

	// We have to check what message to return.
	// The message received has no arguments:
	if (argc == 0) {
		outlet_bang(x->outlet2);
	}
	// The message received has one argument only:
	else if (argc==1) {
		// int argument
		if (argv->a_type==A_LONG)
			outlet_int(x->outlet2,argv->a_w.w_long);
		// float argument
		else if (argv->a_type==A_FLOAT)
			outlet_float(x->outlet2,argv->a_w.w_float);
		// something else
		else if (argv->a_type==A_SYM)
			outlet_anything(x->outlet2,argv->a_w.w_sym,0,0);
	}		
	// There are two or more arguments: check if first is A_SYM	
	else {
		if (argv->a_type==A_SYM) {
			output = argv->a_w.w_sym;
			argc--;
			argv++;
		}
		else
			output = _sym_list;
		outlet_anything(x->outlet2, output, argc , argv);
	}

	// Output from 2nd outlet: Instance. Check if the instance is an integer (long):
	i = strtol (instance->s_name,&instanceEnd,10);		
	if (instance->s_name[0] != '\n' && (*instanceEnd == '\n' || *instanceEnd == '\0'))
		outlet_int(x->outlet1, i);
	else
		outlet_anything(x->outlet1, instance, NULL, 0L);		

	// Output from 1st outlet: OC name with instance removed
	outlet_anything(x->outlet0, osc, NULL, 0L);		
	return;

	spillover:
		outlet_anything(x->outlet_overflow, msg, argc , argv);
		return;	
}


