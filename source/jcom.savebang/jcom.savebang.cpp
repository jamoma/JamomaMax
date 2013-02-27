/** 
 * \file jcom.savebang.cpp
 * External for Jamoma: send a bang when a user saves the patcher
 * by Tim Place, Copyright © 2009
 * 
 * License: This code is licensed under the terms of the "New BSD License"
 * http://creativecommons.org/licenses/BSD/
 */

#include "Jamoma.h"


typedef struct _savebang{
	t_object	obj;
	void*		outlet;
} t_savebang;


void *savebang_new(void);
void savebang_free(t_savebang *x);
void savebang_assist(t_savebang *x, void *b, long m, long a, char *s);
void savebang_save(t_savebang *x, t_symbol *s, long argc, t_atom *argv);


static t_class* s_savebang_class;


/************************************************************************************/
int JAMOMA_EXPORT_MAXOBJ main(void)
{
	t_class *c;
	
	jamoma_init();
	common_symbols_init();
	
	// Define our class
	c = class_new("jcom.savebang",(method)savebang_new, (method)savebang_free, sizeof(t_savebang), (method)0L, 0L, 0);

	// Make methods accessible for our class: 
	class_addmethod(c, (method)savebang_save,	"save",		A_CANT, 0L);
    class_addmethod(c, (method)savebang_assist, "assist",	A_CANT, 0L); 

	// Finalize our class
	class_register(_sym_box, c);
	s_savebang_class = c;
	return 0;
}


/************************************************************************************/
void *savebang_new(void)
{	
	t_savebang *x;
	
	x = (t_savebang *)object_alloc(s_savebang_class);	// Create object, store pointer to it (get 1 inlet free)

	if (x) {
		x->outlet = outlet_new(x, NULL);
	}
	return (x);
}


void savebang_free(t_savebang *x)
{
	;
}			


/************************************************************************************/
void savebang_assist(t_savebang *x, void *b, long m, long a, char *dst)
{
	strcpy(dst, "sends a bang when the containing patcher is saved");
}	


void savebang_save(t_savebang *x, t_symbol *s, long argc, t_atom *argv)
{
	outlet_bang(x->outlet);
}

