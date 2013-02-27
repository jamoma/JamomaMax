/** 
 * \file jcom.oscroute.cpp
 * External for Jamoma: parse and pass OpenSoundControl messages
 * By Tim Place, Copyright � 2006
 * 
 * License: This code is licensed under the terms of the "New BSD License"
 * http://creativecommons.org/licenses/BSD/
 */

#include "Jamoma.h"

#define MAX_ARGCOUNT 100
#define MAX_MESS_SIZE 2048

typedef struct _oscroute{					// Data Structure for this object
	t_object		ob;							// REQUIRED: Our object
	void			*outlets[MAX_ARGCOUNT];		// my outlet array
	void			*outlet_overflow;			// this outlet doubles as the dumpout outlet
	t_symbol		*arguments[MAX_ARGCOUNT];	// symbols to match
	long unsigned	arglen[MAX_ARGCOUNT];		// strlen of symbols to match
	short			num_args;
	//long			attr_strip;					// ATTRIBUTE: 1 = strip leading slash off any messages
	void			*proxy_inlet;				// pointer to the second inlet (when present)
} t_oscroute;

// Prototypes for our methods:
void *oscroute_new(t_symbol *s, long argc, t_atom *argv);
void oscroute_free(t_oscroute *x);
void oscroute_assist(t_oscroute *x, void *b, long msg, long arg, char *dst);
void oscroute_bang(t_oscroute *x);
void oscroute_int(t_oscroute *x, long n);
void oscroute_float(t_oscroute *x, double f);
void oscroute_list(t_oscroute *x, t_symbol *msg, long argc, t_atom *argv);
void oscroute_symbol(t_oscroute *x, t_symbol *msg, long argc, t_atom *argv);
//void oscroute_list(t_oscroute *x, t_symbol *msg, long argc, t_atom *argv);

// Globals
t_class		*oscroute_class;				// Required: Global pointer for our class


/************************************************************************************/
// Main() Function

int JAMOMA_EXPORT_MAXOBJ main(void)
{
	//long attrflags = 0;
	t_class *c;
	//t_object *attr;
	
	// Initialize Globals
	jamoma_init();
	common_symbols_init();

	// Define our class
	c = class_new("jcom.oscroute",(method)oscroute_new, (method)oscroute_free, sizeof(t_oscroute), (method)0L, A_GIMME, 0);

	// Make methods accessible for our class: 
	class_addmethod(c, (method)oscroute_bang,			"bang",		0L,			0L);	
	class_addmethod(c, (method)oscroute_int,			"int",		A_DEFLONG,	0L);
	class_addmethod(c, (method)oscroute_float,			"float",	A_DEFFLOAT,	0L);
	class_addmethod(c, (method)oscroute_list,			"list",		A_GIMME,	0L);
  	class_addmethod(c, (method)oscroute_symbol,			"anything", A_GIMME,	0L);	
	class_addmethod(c, (method)oscroute_assist,			"assist",	A_CANT,		0L); 
    class_addmethod(c, (method)object_obex_dumpout, 	"dumpout",	A_CANT,		0);

	// ATTRIBUTE: strip
	/*attr = attr_offset_new("strip", _sym_long, attrflags,
		(method)0, (method)0, calcoffset(t_oscroute, attr_strip));
	class_addattr(c, attr);	*/

	// Finalize our class
	class_register(CLASS_BOX, c);
	oscroute_class = c;
	return 0;
}


/************************************************************************************/
// Object Life

void *oscroute_new(t_symbol *s, long argc, t_atom *argv)
{
	short i;
	t_oscroute	*x = (t_oscroute *)object_alloc(oscroute_class);
	
	if (x) {
		x->outlet_overflow = outlet_new(x, 0);		// overflow outlet
		//object_obex_store((void *)x, _sym_dumpout, (object *)x->outlet_overflow);	// dumpout
		x->num_args = argc;
		
		if (argc < 1) {	// if no args are provided, we provide a way to set the arg using an inlet
			x->num_args = 1;
			x->arguments[0] = gensym("/nil");
			x->arglen[0] = 4;
			x->proxy_inlet = proxy_new(x, 1, 0L);
			x->outlets[0] = outlet_new(x, 0);
		}
		else {
			x->proxy_inlet = 0;
			for (i=x->num_args-1; i >= 0; i--) {				
				x->outlets[i] = outlet_new(x, 0);		// Create Outlet
				switch(argv[i].a_type) {
					case A_SYM:
						//atom_setsym(&(x->arguments[i]), atom_getsym(argv+i));
						x->arguments[i] = atom_getsym(argv+i);
						x->arglen[i] = strlen(atom_getsym(argv+i)->s_name);
						break;
					case A_LONG:
						{
							char	tempstr[256];
							
							snprintf(tempstr, 256, "%ld", atom_getlong(argv+i));
							x->arguments[i] = gensym(tempstr);
							x->arglen[i] = strlen(tempstr);
						}
						break;
					case A_FLOAT:
						{
							char	tempstr[256];
							
							snprintf(tempstr, 256, "%f", atom_getfloat(argv+i));
							x->arguments[i] = gensym(tempstr);
							x->arglen[i] = strlen(tempstr);
						}
						break;
					default:
						error("jcom.oscroute - invalid arguments - all args must be symbols");
				}
			}
		}
		//attr_args_process(x, argc, argv);			//handle attribute args	
	}
	return (x);										// return the pointer to our new instantiation
}

void oscroute_free(t_oscroute *x)
{
	if (x->proxy_inlet != 0)
		freeobject((t_object *)(x->proxy_inlet));
}



/************************************************************************************/
// Methods bound to input/inlets

// Method for Assistance Messages
void oscroute_assist(t_oscroute *x, void *b, long msg, long arg, char *dst)
{
	if (msg==1) 						// Inlet
		strcpy(dst, "Input");
	else if (msg==2) { 				// Outlets
		if (arg < x->num_args)
			strcpy(dst, x->arguments[arg]->s_name);
		else
			strcpy(dst, "dumpout / overflow from non-matching input");	
 	}		
}


// BANG INPUT: STRAIGHT TO OVERFLOW
void oscroute_bang(t_oscroute *x)
{
	outlet_bang(x->outlet_overflow);
}

// INT INPUT: STRAIGHT TO OVERFLOW
void oscroute_int(t_oscroute *x, long n)
{
	outlet_int(x->outlet_overflow, n);
}

// FLOAT INPUT: STRAIGHT TO OVERFLOW
void oscroute_float(t_oscroute *x, double f)
{
	outlet_float(x->outlet_overflow, f);
}

// LIST INPUT: STRAIGHT TO OVERFLOW
void oscroute_list(t_oscroute *x, t_symbol *msg, long argc, t_atom *argv)
{
	outlet_list(x->outlet_overflow, _sym_list, argc , argv);
}

void output_msg(t_oscroute *x, char *msg, int outlet, long argc, t_atom *argv)
{
	t_symbol *output;
	if (msg == '\0') {
		
		if (argc == 0) {
			outlet_bang(x->outlets[outlet]);
		} else if (argc==1) {
		
			if (argv->a_type==A_LONG) 
				outlet_int(x->outlets[outlet],argv->a_w.w_long);				
			else if (argv->a_type==A_FLOAT) 
				outlet_float(x->outlets[outlet],argv->a_w.w_float);
			else if (argv->a_type==A_SYM) 
				outlet_anything(x->outlets[outlet],argv->a_w.w_sym,0,0);
				
		} else {
			if (argv->a_type==A_SYM) {
				output = argv->a_w.w_sym;
				argc--;
				argv++;
			} else {
				output = _sym_list;
			}
					
			outlet_anything(x->outlets[outlet], output, argc, argv);
		}				
	} else 
		outlet_anything(x->outlets[outlet], gensym(msg), argc, argv);
	
}

// SYMBOL INPUT
void oscroute_symbol(t_oscroute *x, t_symbol *msg, long argc, t_atom *argv)
{
	t_symbol	*output;
	char		input[MAX_MESS_SIZE];	// our input string
	long		inlet = proxy_getinlet((t_object *)x);

	// If the message comes in the second inlet, then set the string to match...
	if (inlet == 1) {
		x->arguments[0] = msg;
		x->arglen[0] = strlen(msg->s_name);
		return;
	}
	
	// Otherwise match the stored string(s) and output...
	strcpy(input, msg->s_name);

	/*	to -- the introduction of relative address feature
		in modular0.6 make this test useless
	 
	// Make sure we are dealing with valid OSC input by looking for a leading slash
	if (input[0] != '/') {
		outlet_anything(x->outlet_overflow, msg, argc , argv);
		return;
	}
	 */
	
	char *wc, *c;
	bool overFlow = true;
	for (int pos=0; pos < x->num_args; pos++) {
		// Look for exact matches first.
		if (strncmp(msg->s_name, x->arguments[pos]->s_name, x->arglen[pos])==0) {
			// If incoming message is longer than argument...
			if (strlen(msg->s_name) > x->arglen[pos]) {
				// ...it is only a match if it continues with a slash
				if (input[x->arglen[pos]] == '/') {
					output = gensym(msg->s_name + x->arglen[pos] +1);		// 0.6 changes : +1 to remove don't have a leading slash and output a relative adddress 
					outlet_anything(x->outlets[pos], output, argc , argv);
					overFlow = false;
					break;
				}
			}
			// If the incoming message is no longer we know that we have a match
			else {
			
				// We then have to check what message to return.
				// The message received has no arguments:
				if (argc == 0) {
					outlet_bang(x->outlets[pos]);
					overFlow = false;
					break;
				}
				// The message received has one argument only:
				else if (argc==1) {
					overFlow = false;
					// int argument
					if (argv->a_type==A_LONG) {
						outlet_int(x->outlets[pos],argv->a_w.w_long);
						break;
					}				
					// float argument
					else if (argv->a_type==A_FLOAT) {
						outlet_float(x->outlets[pos],argv->a_w.w_float);
						break;
					}
					// something else
					else if (argv->a_type==A_SYM) {
						outlet_anything(x->outlets[pos],argv->a_w.w_sym,0,0);
						break;
					}				
					else { // something completely different: copy to output as list
						outlet_anything(x->outlets[pos], _sym_list, 1, argv);
						break;
					}
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
					outlet_anything(x->outlets[pos], output, argc , argv);
					overFlow = false;
					break;
				}
			}
		}
	}
	// XXX Putting this here makes crashes go away.  It would be really good to know why.
	//cpost("temp hack to prevent optimizations that cause this object to crash in Deployment");
	// If no exact matches, look for wildcards.
	for (int index=0; index < x->num_args; index++) {	

		if (wc = strstr(x->arguments[index]->s_name, "*")) {
			// Does the argument have anything following the wildcard?
			if (*(wc+1) == '\0') {
				// Now compare the argument up to the asterisk to the message
				if (strncmp(msg->s_name, x->arguments[index]->s_name, x->arglen[index] - 1) == 0) {

					// Increment string past everything that matches including the asterisk
					char *temp = msg->s_name + (x->arglen[index] - 1);
					// Check for a slash, an asterisk causes us to strip off everything up to the next slash
					char *outMsg = strstr(temp, "/");
					if (outMsg)
						output_msg(x, outMsg, index, argc, argv);
					else {
						// no slash, output everything following the message
						output_msg(x, NULL, index, argc, argv);
					}
					return;
				} else {
					// We break here because if the strncmp() fails it means we have a wildcard following an 
					// OSC message i.e. /robot/* but the incoming message doesn't begin with /robot
					//break;
				}
			} else {
				// There is no NULL char after asterisk
				c = msg->s_name;
				while (wc && *(wc) == '*') {
					wc++;
					c++;
				}
					
				c += strlen(c) - strlen(wc);
				if (strncmp(c, wc, strlen(c)) == 0) {
					output_msg(x, c, index, argc, argv);
					return;
				}
			}
		} 
	}

	// the message was never reckognised
	if (overFlow)
		outlet_anything(x->outlet_overflow, msg, argc , argv);
}
