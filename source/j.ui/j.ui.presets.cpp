/** @file
 *
 * @ingroup implementationMaxExternals
 *
 * @brief j.ui : Preset management functionalities for j.ui
 *
 * @details
 *
 * @authors Tim Place, Trond Lossius
 *
 * @copyright © 2007 by Tim Place @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */


#include "j.ui.h"

void ui_return_preset_names(TTPtr self, t_symbol *msg, long argc, t_atom* argv)
{
	t_ui* obj = (t_ui*)self;
	
	obj->preset_num = argc;
	
	if (obj->preset_names)
		sysmem_freeptr(obj->preset_names);
	obj->preset_names = (t_atom*)sysmem_newptr(sizeof(t_atom) * argc);
	
	for (int i=0; i<argc; i++) {
		atom_setsym(&obj->preset_names[i], atom_getsym(&argv[i]));
	}
}

void ui_preset_interface(t_ui *x)
{
	char			filename[MAX_FILENAME_CHARS];
	short			path;
	t_fourcc		type;
	t_fourcc		filetype = 'JSON';
	t_dictionary*	d;
	t_object*		p;
	t_atom			a;
	
	strncpy_zero(filename, "j.preset_interface.maxpat", MAX_FILENAME_CHARS);
	locatefile_extended(filename, &path, &type, &filetype, 1);
	dictionary_read(filename, path, &d);
	
	atom_setobj(&a, d);
	p = (t_object*)object_new_typed(_sym_nobox, _sym_jpatcher, 1, &a);
	object_attr_setlong(p, _sym_locked, 1);										// start out locked
	object_attr_setchar(p, _sym_enablehscroll, 0);								// turn off scroll bars
	object_attr_setchar(p, _sym_enablevscroll, 0);
	object_attr_setchar(p, _sym_openinpresentation, 1);	
	object_attr_setchar(p, _sym_toolbarvisible, 0);	
	object_attr_setsym(p, _sym_title, gensym("preset_interface"));		
	object_method_parse(p, _sym_window, "constrain 5 320 179 595", NULL);
	object_attach_byptr_register(x, p, _sym_nobox);
	
	object_method(p, _sym_vis);													// "vis" happens immediately, "front" is defer_lowed
	object_attr_setobj(jpatcher_get_firstview(p), _sym_owner, (t_object*)x);	// become the owner
	
	OBJ_ATTR_SYM(p, "arguments", 0, gensym((char*)x->modelAddress.c_str()));	// the patch needs a [j.interfaceArguments.js]
	
	object_method(p, _sym_loadbang);
}
