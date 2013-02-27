/** 
 * \file jcom.route.cpp
 * External for Jamoma: route messages to an outlet if they meet our criteria
 * By Tim Place, Copyright © 2005
 * 
 * License: This code is licensed under the terms of the "New BSD License"
 * http://creativecommons.org/licenses/BSD/
 */

#include "Jamoma.h"

#define MAX_LIST_LENGTH 100

typedef struct _route{				// Data Structure for this object
	t_object		ob;								// REQUIRED: Our object
	void 			*my_outlet[2];					// my outlet array -- NOTE: the attribute dump outlet is handled automagically 

	t_symbol		*searchlist[MAX_LIST_LENGTH];	// ATTRIBUTE: storage of which inlets tigger output from the object (essentially an array of toggles)
	long			searchlistlen;
	long			searchpositions[MAX_LIST_LENGTH];
	long			searchpositionslen;	
//	long			stripmatch;						// ATTRIBUTE: toggle strip_match
	long			partialmatch;
	t_symbol		*searchsymbol;
} t_route;

// Prototypes for our methods:
void *route_new(t_symbol *s, long argc, t_atom *argv);
void route_assist(t_route *x, void *b, long msg, long arg, char *dst);
void route_symbol(t_route *x, t_symbol *msg, long argc, t_atom *argv);
void route_list(t_route *x, t_symbol *msg, long argc, t_atom *argv);
void route_bang(t_route *x);
char find_match(t_route *x, t_symbol *input, short position);

// Globals
t_class		*route_class;				// Required: Global pointer for our class

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
	c = class_new("jcom.route",(method)route_new, (method)0L, sizeof(t_route), (method)0L, A_GIMME, 0);

	// Make methods accessible for our class: 
 	class_addmethod(c, (method)route_bang,				"bang", 0L);
  	class_addmethod(c, (method)route_list,				"list", A_GIMME, 0L);	
  	class_addmethod(c, (method)route_symbol,			"anything", A_GIMME, 0L);	
	class_addmethod(c, (method)route_assist,			"assist", A_CANT, 0L); 
    class_addmethod(c, (method)object_obex_dumpout, 	"dumpout", A_CANT,0);

	// ATTRIBUTE: searchstring
	attr = attr_offset_array_new("searchstring", _sym_symbol, MAX_LIST_LENGTH, attrflags, 
		(method)0, (method)0, calcoffset(t_route, searchlistlen), calcoffset(t_route, searchlist));
	class_addattr(c, attr);	

	// ATTRIBUTE: searchpositions
	attr = attr_offset_array_new("searchpositions", _sym_long, MAX_LIST_LENGTH, attrflags, 
		(method)0, (method)0, calcoffset(t_route, searchpositionslen), calcoffset(t_route, searchpositions));
	class_addattr(c, attr);	

	// ATTRIBUTE: partialmatch
	attr = attr_offset_new("partialmatch", _sym_long, attrflags,
		(method)0, (method)0, calcoffset(t_route, partialmatch));
	class_addattr(c, attr);	

	// ATTRIBUTE: stripmatch
//	attr = attr_offset_new("stripmatch", _sym_long, attrflags,
//		(method)0, (method)0, calcoffset(t_route, stripmatch));
//	class_addattr(c, attr);	


	// Finalize our class
	class_register(CLASS_BOX, c);
	route_class = c;
	return 0;
}


/************************************************************************************/
// Object Life

void *route_new(t_symbol *s, long argc, t_atom *argv)
{
	t_route	*x = (t_route *)object_alloc(route_class);
	if (x) {
		object_obex_store((void *)x, _sym_dumpout, (object *)outlet_new(x,NULL));	// dumpout
			
		// Create Outlets
		x->my_outlet[1] = outlet_new(x, 0);
		x->my_outlet[0] = outlet_new(x, 0);
			
		// Set defaults before I go loading in values from the attributes
		x->searchlist[0] = gensym("default");
		x->searchlistlen = 1;
		x->searchpositions[0] = 1;
		x->searchpositionslen = 1;	
	//	x->stripmatch = 0;
		x->partialmatch = 0;
		
		attr_args_process(x,argc,argv); //handle attribute args	
	}
	return (x);											// return the pointer to our new instantiation
}


/************************************************************************************/
// Methods bound to input/inlets

// Method for Assistance Messages
void route_assist(t_route *x, void *b, long msg, long arg, char *dst)
{
	if (msg==1) 						// Inlet
		strcpy(dst, "Input");
	else if (msg==2) { 				// Outlets
		switch(arg) {
			case 0: strcpy(dst, "Matching Output"); break;
			case 1: strcpy(dst, "Unmatching Output"); break;
			case 2: strcpy(dst, "Dumpout"); break;
 		}
 	}		
}


// generate a single symbol out of the multiple symbols given in the attribute
void route_bang(t_route *x)
{
	short		i;
	char		newstring[500];
	
	newstring[0] = 0;
	for (i=0; i< (x->searchlistlen); i++) {
		strcat(newstring, x->searchlist[i]->s_name);
		strcat(newstring, " ");
	}
	// knock out the last space
	newstring[strlen(newstring) - 1] = 0;
	
	x->searchsymbol = gensym(newstring);
}


// utility function to help out the methods
char find_match(t_route *x, t_symbol *input, short position)
{
	short i;
	char matched = 0;
	short len;
	
	for (i=0; i<MAX_LIST_LENGTH ;i++) {
		matched += (x->searchpositions[i] == position);
	}
	
	if (matched > 0) {
		if (x->partialmatch) {
			len = strlen(x->searchsymbol->s_name);
			for (i=0; i<len; i++) {
				if (input->s_name[i] != x->searchsymbol->s_name[i])
					return 0;
			}
			return 1;
		}
		else
			return (input == x->searchsymbol);
	}
	else
		return 0;
}


// SYMBOL INPUT
void route_symbol(t_route *x, t_symbol *msg, long argc, t_atom *argv)
{
	short		i;
	char		matched;
	char		tempstring[50];
	t_symbol	*tempsym;
	
	route_bang(x);
	matched = 0;
	
	// match the symbol
	matched += find_match(x, msg, 1);
	
	// match the arguments
	for (i=0; i<argc; i++) {
		switch(argv[i].a_type) {
			case A_LONG:
				snprintf(tempstring, 50, "%ld", argv[i].a_w.w_long);
				tempsym = gensym(tempstring);
				break;
			case A_FLOAT:
				snprintf(tempstring, 50, "%f", argv[i].a_w.w_float);
				tempsym = gensym(tempstring);
				break;
			case A_SYM:
				tempsym = argv[i].a_w.w_sym;
				break;
		}
		matched += find_match(x, tempsym, i+2);	
	}

	// Output
	if (matched > 0)
		outlet_anything(x->my_outlet[0], msg, argc , argv);
	else
		outlet_anything(x->my_outlet[1], msg, argc, argv);		
}



// LIST INPUT
void route_list(t_route *x, t_symbol *msg, long argc, t_atom *argv)
{
	short		i;
	char		matched;
	char		tempstring[50];
	t_symbol	*tempsym;
	
	route_bang(x);
	matched = 0;
	
	// match the arguments
	for (i=0; i<argc; i++) {
		switch(argv[i].a_type) {
			case A_LONG:
				snprintf(tempstring, 50, "%ld", argv[i].a_w.w_long);
				tempsym = gensym(tempstring);
				break;
			case A_FLOAT:
				snprintf(tempstring, 50, "%f", argv[i].a_w.w_float);
				tempsym = gensym(tempstring);
				break;
			case A_SYM:
				tempsym = argv[i].a_w.w_sym;
				break;
		}
		matched += find_match(x, tempsym, i+1);	// NOTE THE DIFFERENCE HERE COMPARED TO ABOVE	
	}

	// Output
	if (matched > 0)
		outlet_anything(x->my_outlet[0], msg, argc , argv);
	else
		outlet_anything(x->my_outlet[1], msg, argc, argv);		

}
