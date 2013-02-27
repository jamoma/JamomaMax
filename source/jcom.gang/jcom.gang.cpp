/** @file
 *
 * @ingroup modularMax
 *
 * @brief External for Jamoma: jcom.gang - Gang multiple objects together
 *
 * @details
 *
 * @authors Tim Place, Trond Lossius
 *
 * @copyright Copyright © 2005 by Tim Place @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */


#include "Jamoma.h"

#define NUM_INLETS 4
#define NUM_OUTLETS 4
#define MAX_LIST_LENGTH 256


// Data Structure for this object
typedef struct _gang{
	t_object		ob;
	void			*outlets[NUM_OUTLETS];
	void			*inlets[NUM_INLETS];		// for proxy inlets
	bool			type_is_list;				// flag for the data type (false=float, true=list)
	bool			set_by_pp;					// flag: if true, the value was set by pp, which takes precedance
	float			parameter_value;			// FLOAT INPUT
	float			parameter_value_pp;
	t_atom			argv[MAX_LIST_LENGTH];		// LIST INPUT: stored atoms for output
	short			argc;						// LIST INPUT: len
	void			*qelem_send_pp;				// queue element
	void			*qelem_send_ui;				// queue element
	void			*qelem_send_pattr;			// queue element
	void			*qelem_send_scope;			// queue element
} t_gang;

// Prototypes for methods: need a method for each incoming message type:
void *gang_new(t_symbol *msg, long argc, t_atom *argv);
void gang_free(t_gang *x);
void gang_assist(t_gang *x, void *b, long msg, long arg, char *dst);
void gang_int(t_gang *x, long value);
void gang_float(t_gang *x, double value);
void gang_list(t_gang *x, t_symbol *msg, long argc, t_atom *argv);
void gang_qfn_send_pp(t_gang *x);
void gang_qfn_send_ui(t_gang *x);
void gang_qfn_send_pattr(t_gang *x);
void gang_qfn_send_scope(t_gang *x);
float gang_bitsafe(double in);

// Class Globals
t_class 	*gang_class;						// Required. Global pointing to this class


/************************************************************************************/
// Main() Function

int JAMOMA_EXPORT_MAXOBJ main(void)
{
	t_class *c;
	
	jamoma_init();
	common_symbols_init();

	c = class_new("jcom.gang",(method)gang_new, (method)gang_free, sizeof(t_gang), (method)0L, A_GIMME, 0);

	class_addmethod(c, (method)gang_float,	"float",	0L);
	class_addmethod(c, (method)gang_int,	"int",		0L);
	class_addmethod(c, (method)gang_list,	"list",		A_GIMME, 0L);
    class_addmethod(c, (method)gang_assist, "assist",	A_CANT, 0L); 

	// Finalize our class
	class_register(CLASS_BOX, c);
	gang_class = c;

	return 0;
}


/************************************************************************************/
// Object Creation Method

void *gang_new(t_symbol *msg, long argc, t_atom *argv)
{
	t_gang *x;
	short i;
	 
	x = (t_gang *)object_alloc(gang_class);
	if (x) {
		// outlets
		object_obex_store((void *)x, _sym_dumpout, (object *)outlet_new(x,NULL));	
		for (i = NUM_OUTLETS-1; i>=0; i--)
    		x->outlets[i] = floatout(x);
    	
		// Create Inlets (inlets beyond the default (num 0) inlet)
		for (i = NUM_INLETS-1; i >= 1; i--)
			x->inlets[i] = proxy_new(x, i, 0L);

		// defaults
		x->parameter_value = -2000000;
		x->argc = 0;
		x->set_by_pp = false;
			
		// qelem
		x->qelem_send_ui = qelem_new(x, (method)gang_qfn_send_ui);
		x->qelem_send_pp = qelem_new(x, (method)gang_qfn_send_pp);
		x->qelem_send_pattr = qelem_new(x, (method)gang_qfn_send_pattr);
		x->qelem_send_scope = qelem_new(x, (method)gang_qfn_send_scope);

		//handle attribute args	
    	attr_args_process(x, argc, argv); 
    }
 	return (x);
}

void gang_free(t_gang *x)
{
	short i;
	
	qelem_free(x->qelem_send_ui);
	qelem_free(x->qelem_send_pp);
	qelem_free(x->qelem_send_pattr);
	qelem_free(x->qelem_send_scope);

	for (i = NUM_INLETS-1; i >= 1; i--)
		freeobject((t_object *)x->inlets[i]);
}

/************************************************************************************/
// Methods bound to input/inlets

// Method for Assistance Messages
void gang_assist(t_gang *x, void *b, long msg, long arg, char *dst)
{
	if (msg==1) { 		// Inlets
		switch(arg) {
			case 0: strcpy(dst, "connect to ui object"); break;
			case 1: strcpy(dst, "connect to pp"); break;
			case 2: strcpy(dst, "aux object 1"); break;
			case 3: strcpy(dst, "aux object 2"); break;
		}
	}
	else if (msg==2) { 	// Outlets
		switch(arg) {
			case 0: strcpy(dst, "connect to ui object"); break;
			case 1: strcpy(dst, "connect to pp"); break;
			case 2: strcpy(dst, "aux object 1"); break;
			case 3: strcpy(dst, "aux object 2"); break;
			default: strcpy(dst, "dumpout"); break;
		}
	}
}


// METHOD: int conversion
void gang_int(t_gang *x, long value)
{
	gang_float(x, value);
}


// METHOD: float input
void gang_float(t_gang *x, double value)
{
	long inletnum = proxy_getinlet((object *)x);
	
	if (value == x->parameter_value) return;
	//x->parameter_value = value;
	x->parameter_value = gang_bitsafe(value);
	x->type_is_list = false;

	switch(inletnum) {
		case 0:			// UI Input
			qelem_set(x->qelem_send_pp);
			qelem_set(x->qelem_send_pattr);
			qelem_set(x->qelem_send_scope);
			break;
		case 1:			// PP Input
			x->set_by_pp = true;
			x->parameter_value_pp = x->parameter_value;
			qelem_set(x->qelem_send_ui);
			qelem_set(x->qelem_send_pattr);
			qelem_set(x->qelem_send_scope);
			break;
		case 2:			// Pattr Input
			qelem_set(x->qelem_send_pp);
			qelem_set(x->qelem_send_ui);
			qelem_set(x->qelem_send_scope);
			break;
		case 3:			// Scope Input
			qelem_set(x->qelem_send_pp);
			qelem_set(x->qelem_send_ui);
			qelem_set(x->qelem_send_pattr);
			break;
	}
}


// METHOD: list input
void gang_list(t_gang *x, t_symbol *msg, long argc, t_atom *argv)
{
	long inletnum = proxy_getinlet((object *)x);
	short i,n;
	Atom *ap;
	
//	if (x->set_by_pp == false) return;	// this has already been set by pp, which takes precedance
	
	n = MIN(MAX_LIST_LENGTH, argc);
	ap = x->argv;
	x->type_is_list = true;

	// check to see if the list has changed
	for (i=0; i<n; i++) {
		if (atom_getfloat(ap+i) != atom_getfloat(argv+i)) goto process;
	}
	return;
	
process:
	// copy input to our private copy
	for (i=0; i < n; i++, argv++, ap++) {
//		*ap = *argv;
		atom_setfloat(ap, gang_bitsafe(atom_getfloat(argv)));

	}
	x->argc = n;

	switch(inletnum) {
		case 0:			// UI Input
			qelem_set(x->qelem_send_pp);
			qelem_set(x->qelem_send_pattr);
			qelem_set(x->qelem_send_scope);
			break;
		case 1:			// PP Input
			qelem_set(x->qelem_send_ui);
			qelem_set(x->qelem_send_pattr);
			qelem_set(x->qelem_send_scope);
			break;
		case 2:			// Pattr Input
			qelem_set(x->qelem_send_pp);
			qelem_set(x->qelem_send_ui);
			qelem_set(x->qelem_send_scope);
			break;
		case 3:			// Scope Input
			qelem_set(x->qelem_send_pp);
			qelem_set(x->qelem_send_ui);
			qelem_set(x->qelem_send_pattr);
			break;
	}
}


// METHOD: Queue Function
void gang_qfn_send_ui(t_gang *x)
{	
	if (x->type_is_list)
		outlet_list(x->outlets[0], _sym_list, x->argc, x->argv);
	else {
		if (x->set_by_pp) 	outlet_float(x->outlets[0], x->parameter_value_pp);
		else 				outlet_float(x->outlets[0], x->parameter_value);
	}
	x->set_by_pp = false;
}

// METHOD: Queue Function
void gang_qfn_send_pp(t_gang *x)
{	
	if (x->type_is_list)
		outlet_list(x->outlets[1], _sym_list, x->argc, x->argv);
	else {
		if (x->set_by_pp) 	outlet_float(x->outlets[1], x->parameter_value_pp);
		else 				outlet_float(x->outlets[1], x->parameter_value);
	}
	x->set_by_pp = false;
}

// METHOD: Queue Function
void gang_qfn_send_pattr(t_gang *x)
{	
	if (x->type_is_list)
		outlet_list(x->outlets[2], _sym_list, x->argc, x->argv);
	else {
		if (x->set_by_pp) 	outlet_float(x->outlets[2], x->parameter_value_pp);
		else 				outlet_float(x->outlets[2], x->parameter_value);
	}
	x->set_by_pp = false;
}

// METHOD: Queue Function
void gang_qfn_send_scope(t_gang *x)
{	
	if (x->type_is_list)
		outlet_list(x->outlets[3], _sym_list, x->argc, x->argv);
	else {
		if (x->set_by_pp) 	outlet_float(x->outlets[3], x->parameter_value_pp);
		else 				outlet_float(x->outlets[3], x->parameter_value);
	}
	x->set_by_pp = false;
}


// FILTER OUT NANs
float gang_bitsafe(double in)
{
	double temp = in;
	if (temp != in)	// nan does not equal itself
		temp = 0;
	return(temp);
}
