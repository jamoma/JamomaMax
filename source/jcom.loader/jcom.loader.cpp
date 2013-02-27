/** @file
 *
 * @ingroup modularMax
 *
 * @brief External for Jamoma: jcom.loader - Simply used to load the framework when Max is launched
 *
 * @details
 *
 * @authors Tim Place, Trond Lossius
 *
 * @copyright Copyright © 2007 by Tim Place @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */

#include "Jamoma.h"


// Data Structure for this object
typedef struct _loader{
	t_object		ob;	
} t_loader;


// Prototypes for methods
void*		loader_new(t_symbol *name, long argc, t_atom *argv);


// Globals
t_class		*loader_class;




/************************************************************************************/
// A class that we can send messages to in the same way that messages are sent to ;max or ;dsp

#ifdef STUFF_INHERITED_FROM_PLUGTASTIC

static ClassPtr		sPlugtasticClass;
static ObjectPtr	sPlugtasticObject;
static SymbolPtr	ps_plugtastic;
static long			sPlugtasticSplash = 1;


typedef struct _plugtastic {
	Object		obj;
	long*		openSplash;
	ObjectPtr	forward;
} t_plugtastic;


t_plugtastic* plugtastic_new()
{
	t_plugtastic*	self = (t_plugtastic*)(object_alloc(sPlugtasticClass));
	//t_atom			a;
	t_class*		c;
	t_object*		p;
	
	c = class_findbyname(_sym_box, _sym_forward);
	if (!c) {
		p = (t_object*)newinstance(_sym_forward, 0, NULL);
		if (p) {
			c = class_findbyname(_sym_box, _sym_forward);
			freeobject(p);
			p = NULL;
		}
	}/*
	  atom_setsym(&a, GENSYM("plugtastic_extra_toggle"));
	  self->forward = (t_object*)object_new_typed(CLASS_BOX, _sym_forward, 1, &a);
	  
	  self->openSplash = &sPlugtasticSplash;
	  a.a_type = 0;
	  preferences_getatomforkey(GENSYM("plugtastic_splash"), &a);
	  if (a.a_type)
	  *self->openSplash = atom_getlong(&a);
	  */	
	return self;
}


// prefs

 t_max_err plugtastic_getpref(void *dummy, void *attr, long *argc, t_atom **argv)
 {
 char alloc;
 
 atom_alloc_array(1, argc, argv, &alloc);
 atom_setlong(*argv, sPlugtasticSplash);
 return MAX_ERR_NONE;
 }
 
 t_max_err plugtastic_setpref(void *dummy, void *attr, long argc, t_atom *argv)
 {
 sPlugtasticSplash = atom_getlong(argv);
 return MAX_ERR_NONE;
 }


// methods

 void plugtastic_get_splash(t_plugtastic* self)
 {
 t_atom a;
 
 // receive name: plugtastic_extra_toggle
 if (self->forward != NULL) {
 atom_setlong(&a, *self->openSplash);
 object_method_typed(self->forward, _sym_int, 1, &a, NULL);
 }
 }
 
 
 void plugtastic_set_splash(t_plugtastic* self, long state)
 {
 *self->openSplash = state;
 }

void plugtastic_classinit()
{
	sPlugtasticClass = class_new((char*)"plugtastic", (method)plugtastic_new, (method)NULL, sizeof(t_plugtastic), (method)NULL, 0);
	
	/*class_addmethod(sPlugtasticClass, (method)plugtastic_get_splash,	"get_show_extra_on_launch",	0);
	 class_addmethod(sPlugtasticClass, (method)plugtastic_set_splash,	"set_show_extra_on_launch",	A_LONG, 0);*/
	
	class_register(_sym_nobox, sPlugtasticClass);
	
	//preferences_define("plugtastic_splash", "long", "Show Plugtastic Intro Screen At Launch", "onoff", "Plugtastic", 0, 
	//				   (method)plugtastic_getpref, (method)plugtastic_setpref, 0/*PREFERENCES_FLAGS_INVISIBLE*/);
	
}

#endif // STUFF_INHERITED_FROM_PLUGTASTIC



/************************************************************************************/
// Main() Function

int JAMOMA_EXPORT_MAXOBJ main(void)
{
	t_class *c;
	
	jamoma_init();
	common_symbols_init();

	// Define our class
	c = class_new("jcom.loader",(method)loader_new, (method)NULL, sizeof(t_loader), (method)NULL, A_GIMME, 0);

	
#ifdef STUFF_INHERITED_FROM_PLUGTASTIC
	plugtastic_classinit();
	sPlugtasticObject = (t_object*)plugtastic_new();
	ps_plugtastic = GENSYM("plugtastic");
	ps_plugtastic->s_thing = sPlugtasticObject;
	
	post("Plugtastic                                            Version %s | jamoma.org", PLUGTASTIC_VERSION);
	
	// This tells Max 5.0.6 and higher that we want the patcher files to be saved such that they are sorted.
	// Having the saved this way makes our GIT diffs much more meaningful.
	// But it is already the default on Max 6
	// object_method_long(sMaxObject, GENSYM("sortpatcherdictonsave"), 1, NULL);
	
	// This tells Max 4.5.7 and higher to take any posts to the Max window and also make the
	// post to the system console, which greatly aids in debugging problems and crashes
	// object_method_long(sMaxObject, GENSYM("setmirrortoconsole"), 1, NULL);
	

	 // OPEN THE SPLASH
	 
	 if (sPlugtasticSplash) {
		 char			name[MAX_FILENAME_CHARS];
		 short			path = 0;
		 long			type = 0;
		 long			typelist[2] = {'JSON', 'TEXT'};
		 short			err;
		 t_dictionary*	d;
		 t_object*		p;
		 t_atom			a[2];
		 
		 strncpy_zero(name, "Plugtastic.maxpat", MAX_FILENAME_CHARS);
		 err = locatefile_extended(name, &path, &type, typelist, 2);
		 dictionary_read(name, path, &d);
		 
		 atom_setobj(a, d);
		 p = (t_object*)object_new_typed(_sym_nobox, _sym_jpatcher, 1, a);
		 object_attr_setlong(p, _sym_locked, 1);			// start out locked
		 object_attr_setchar(p, _sym_enablehscroll, 0);		// turn off scroll bars
		 object_attr_setchar(p, _sym_enablevscroll, 0);
		 object_attr_setchar(p, _sym_toolbarvisible, 0);	
		 object_attr_setsym(p, _sym_title, gensym("Welcome to Plugtastic"));		
		 object_attr_setparse(p, _sym_rect, "271 170 799 489");
		 object_attr_setparse(p, _sym_defrect, "271 170 799 489");
		 
		 object_method(p, _sym_vis);	// "vis" happens immediately, "front" is defer_lowed
		 object_method(p, _sym_loadbang);
		 
		 //		object_method_parse(p, _sym_window, "constrain 799 489 799 489", NULL);
		 object_method_parse(p, _sym_window, "flags nozoom", NULL);
		 object_method_parse(p, _sym_window, "flags nogrow", NULL);
		 object_method_parse(p, _sym_window, "exec", NULL);
	 }
#endif // STUFF_INHERITED_FROM_PLUGTASTIC
	
	
	// Finalize our class
	class_register(CLASS_BOX, c);
	loader_class = c;
	return 0;
}


/************************************************************************************/
// Object Life

void *loader_new(t_symbol *name, long argc, t_atom *argv)
{
	t_loader *obj;

	obj = (t_loader*)object_alloc(loader_class);
	return obj;
}

