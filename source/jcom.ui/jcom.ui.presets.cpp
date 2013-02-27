/* 
 * jcom.ui
 * External for Jamoma: provide standard user interface component for modules
 * By Tim Place, Copyright © 2007
 * 
 * License: This code is licensed under the terms of the "New BSD License"
 * http://creativecommons.org/licenses/BSD/
 */

#include "jcom.ui.h"

void ui_preset_store_next(t_ui *x)	
{
	long result;
	char *text;
	char buf[512];
	
	strcpy(buf, "chateau de preset");
	
	result = jdialog_showtext("Provide a Name for This Preset", buf, 0, &text);
	if (result != 1)
		return;
	
	ui_viewer_send(x, TTSymbol("preset/store"), TTSymbol(text));
	
	// TODO: do we not have to free text?
}

void ui_preset_doread(t_ui *x)
{
	char 			filename[MAX_FILENAME_CHARS];	// for storing the name of the file locally
	char 			fullpath[MAX_PATH_CHARS];		// path and name passed on to the xml parser
	char			posixpath[MAX_PATH_CHARS];
	short 			path;					// pathID#
    long			filetype = 'TEXT', outtype;  // the file type that is actually true    
	
	if (open_dialog(filename, &path, &outtype, &filetype, 1))		// Returns 0 if successful
		return;														// User Cancelled

	path_topathname(path, filename, fullpath);
	path_nameconform(fullpath, posixpath, PATH_STYLE_NATIVE, PATH_TYPE_BOOT);
	
	ui_viewer_send(x, TTSymbol("preset/read"), TTSymbol(posixpath));
}

void ui_preset_dowrite(t_ui *x)
{
	long 			type = 'TEXT';				// four-char code for Mac file type
	char 			filename[MAX_FILENAME_CHARS];	// for storing the name of the file locally
	char 			fullpath[MAX_PATH_CHARS];	// for storing the absolute path of the file
	char			posixpath[MAX_PATH_CHARS];
	short 			path, err;					// pathID#, error number
	long			outtype;					// the file type that is actually true
	t_filehandle	file_handle;				// a reference to our file (for opening it, closing it, etc.)
	TTNodePtr		patcherNode;
	ObjectPtr		modelPatcher = NULL;
	TTSymbol		modelClass;
	
	// get model patcher class for preset file name
	JamomaDirectory->getTTNode(x->modelAddress, &patcherNode);
	modelPatcher = (ObjectPtr)patcherNode->getContext();

	if (modelPatcher) {
		jamoma_patcher_get_class(modelPatcher, kTTSym_model, modelClass);
		
		if (modelClass)
			snprintf(filename, MAX_FILENAME_CHARS, "%s.model.xml", modelClass.c_str());	// Default File Name
		else
			snprintf(filename, MAX_FILENAME_CHARS, ".model.xml");		// Default File Name
	}
	else
		snprintf(filename, MAX_FILENAME_CHARS, ".model.xml");		// Default File Name
	
	
	saveas_promptset("Save Preset...");											// Instructional Text in the dialog
	err = saveasdialog_extended(filename, &path, &outtype, &type, 1);			// Returns 0 if successful
	if (err)																	// User Cancelled
		return;
	
	// NOW ATTEMPT TO CREATE THE FILE...
	err = path_createsysfile(filename, path, type, &file_handle);
	if (err) {																// Handle any errors that occur
		object_error((t_object*)x, "%s - error %d creating file", filename, err);
		return;	
	}
	
	// ... AND WE SAVE THE fullpath IN THE HUB ATTRIBUTE user_path.
	path_topathname(path, filename, fullpath);
	path_nameconform(fullpath, posixpath, PATH_STYLE_NATIVE, PATH_TYPE_BOOT);
	
	ui_viewer_send(x, TTSymbol("preset/write"), TTSymbol(posixpath));
}

void ui_return_preset_order(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	t_ui* obj = (t_ui*)self;
	
	obj->preset_num = argc;
	
	if (obj->preset_order)
		sysmem_freeptr(obj->preset_order);
	obj->preset_order = (AtomPtr)sysmem_newptr(sizeof(t_atom) * argc);
	
	for (int i=0; i<argc; i++) {
		atom_setsym(&obj->preset_order[i], atom_getsym(&argv[i]));
	}
}

void ui_preset_interface(t_ui *x)
{
	char			filename[MAX_FILENAME_CHARS];
	short			path;
	long			type;
	long			filetype = 'JSON';
	t_dictionary*	d;
	ObjectPtr		p;
	Atom			a;
	
	strncpy_zero(filename, "jcom.preset_interface.maxpat", MAX_FILENAME_CHARS);
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
	
	OBJ_ATTR_SYM(p, "arguments", 0, gensym((char*)x->modelAddress.c_str()));	// the patch needs a [jcom.interfaceArguments.js]
	
	object_method(p, _sym_loadbang);
}
