/** @file
 *
 * @ingroup implementationMaxExternals
 *
 * @brief j.unfocus : Remove the focus from any specific object in a patcher
 *
 * @details
 *
 * @authors Tim Place, Trond Lossius
 *
 * @copyright © 2009 by Tim Place @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */


#include "JamomaForMax.h"
#include "MaxCommon.h"

// Data Structure for this object
typedef struct _unfocus{
	Object	base;
} t_unfocus;


// Prototypes for methods: need a method for each incoming message type:
void *unfocus_new(t_symbol *msg, long argc, t_atom *argv);
void unfocus_assist(t_unfocus *x, void *b, long msg, long arg, char *dst);
void unfocus_bang(t_unfocus *x);


// Class Statics
static t_class*	sUnfocusClass;


/************************************************************************************/
// Main() Function

int JAMOMA_EXPORT_MAXOBJ main(void)
{
	ClassPtr	c = class_new("j.unfocus",(method)unfocus_new, (method)NULL, sizeof(t_unfocus), (method)0L, A_GIMME, 0);
	
	common_symbols_init();
	class_addmethod(c, (method)unfocus_bang,	"bang",		0L);
    class_addmethod(c, (method)unfocus_assist,	"assist",	A_CANT, 0L); 
	class_addmethod(c, (method)jamoma_fileusage, "fileusage", A_CANT, 0);

	class_register(_sym_box, c);
	sUnfocusClass = c;
	return 0;
}


/************************************************************************************/
// Object Creation Method

void *unfocus_new(t_symbol *msg, long argc, t_atom *argv)
{
	t_unfocus *x;
	 
	x = (t_unfocus*)object_alloc(sUnfocusClass);
	if (x) {
		//handle attribute args	
    	// attr_args_process(x, argc, argv); 
    }
 	return (x);
}


/************************************************************************************/
// Methods bound to input/inlets

// Method for Assistance Messages
void unfocus_assist(t_unfocus *x, void *b, long msg, long arg, char *dst)
{
	if (msg==1) { 		// Inlets
		switch (arg) {
			case 0: strcpy(dst, "(bang) remove the focus from elsewhere and give it to the patcher view"); break;
		}
	}
	else if (msg==2) { 	// Outlets
		switch (arg) {
			default: strcpy(dst, ""); break;
		}
	}
}


// METHOD: bang
void unfocus_bang(t_unfocus *x)
{
	t_object*	patcher = NULL;
	t_object*	patcherview = NULL;
	
	object_obex_lookup(x, gensym("#P"), &patcher);
	if (patcher)
		patcherview = object_attr_getobj(patcher, _sym_firstview);
//		patcherview = jpatcher_get_firstview(patcher);
	if (patcherview)
		object_method(patcherview, _sym_select);
}
