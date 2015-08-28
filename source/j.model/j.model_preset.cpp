/** @file
 *
 * @ingroup implementationMaxExternals
 *
 * @brief j.model / j.view -  - preset features
 *
 * @details
 *
 * @authors Théo de la Hogue, Trond Lossius
 *
 * @copyright Copyright © 2010 Théo de la Hogue @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */


#include "j.model.h"

void model_preset_amenities(TTPtr self)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
    TTAddress                   modelAdrs;
	TTValue						v, a, args, none;
    TTAddress                   presetAddress;

    // get model:address
    EXTRA->modelInfo->get(kTTSym_address, v);
    modelAdrs = v[0];
    
    // create the preset manager
	jamoma_presetManager_create((t_object*)x, *EXTRA->presetManager);
    
    // suscribe it under a preset node 
    presetAddress = modelAdrs.appendAddress(TTAddress("preset"));
    
    args = TTValue(presetAddress, *EXTRA->presetManager, x->patcherPtr);

    if (!MaxApplication.send("ObjectRegister", args, none)) {
	
        EXTRA->presetManager->set(kTTSym_address, modelAdrs);
        
        defer_low(x, (method)model_preset_default, 0, 0, 0L);
    }
}

/*
void model_preset_return_value(TTPtr self, t_symbol *msg, long argc, t_atom *argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	
	// avoid blank before line
	if (msg == _sym_nothing)
		outlet_atoms(x->outlets[line_out], argc, argv);
	else
		outlet_anything(x->outlets[line_out], msg, argc, argv);
}
*/

void model_preset_return_names(TTPtr self, t_symbol *msg, long argc, t_atom *argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	outlet_anything(x->outlets[dump_out], gensym("names"), argc, argv);
}

void model_preset_read(TTPtr self, t_symbol *msg, long argc, t_atom *argv)
{
	defer(self, (method)model_preset_doread, msg, argc, argv);
}

void model_preset_doread(TTPtr self, t_symbol *msg, long argc, t_atom *argv)
{	
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTValue			o, v, none;
	TTSymbol		fullpath;
	TTObject        aTextHandler;
	TTErr			tterr;
	
	if (EXTRA->presetManager->valid()) {
		
		fullpath = jamoma_file_read((t_object*)x, argc, argv, 'TEXT');
		v.append(fullpath);
		
		tterr = x->internals->lookup(kTTSym_TextHandler, o);
		
		if (!tterr) {
			
			aTextHandler = o[0];

			aTextHandler.set(kTTSym_object, *EXTRA->presetManager);
			
			critical_enter(0);
			tterr = aTextHandler.send(kTTSym_Read, v, none);
			critical_exit(0);
			
			if (!tterr)
				object_obex_dumpout(self, _sym_read, argc, argv);
			else
				object_obex_dumpout(self, _sym_error, 0, NULL);
		}
	}
}

void model_preset_read_again(TTPtr self)
{
	defer(self, (method)model_preset_doread_again, NULL, 0, NULL);
}

void model_preset_doread_again(TTPtr self)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTObject        aTextHandler;
	TTValue			o;
	TTErr			tterr;
	
	tterr = x->internals->lookup(kTTSym_TextHandler, o);
	
	if (!tterr) {
		
		aTextHandler = o[0];

		aTextHandler.set(kTTSym_object, *EXTRA->presetManager);
		
		critical_enter(0);
		tterr = aTextHandler.send(kTTSym_ReadAgain);
		critical_exit(0);
		
		if (!tterr)
			object_obex_dumpout(self, _sym_read, 0, NULL);
		else
			object_obex_dumpout(self, _sym_error, 0, NULL);
	}
}

void model_preset_write(TTPtr self, t_symbol *msg, long argc, t_atom *argv)
{
	defer(self, (method)model_preset_dowrite, msg, argc, argv);
}

void model_preset_dowrite(TTPtr self, t_symbol *msg, long argc, t_atom *argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	char 			filename[MAX_FILENAME_CHARS];
	TTSymbol		fullpath;
	TTValue			o, v, none;
	TTObject        aTextHandler;
	TTErr			tterr;
	
	// stop filewatcher
	if (EXTRA->filewatcher)
		filewatcher_stop(EXTRA->filewatcher);
	
	if (EXTRA->presetManager->valid()) {
		
		// Default TEXT File Name
		snprintf(filename, MAX_FILENAME_CHARS, "%s.%s.presets.txt", x->patcherClass.c_str(), x->patcherContext.c_str());
		fullpath = jamoma_file_write((t_object*)x, argc, argv, filename);
		v.append(fullpath);
		
		tterr = x->internals->lookup(kTTSym_TextHandler, o);
		
		if (!tterr) {
			aTextHandler = o[0];

			aTextHandler.set(kTTSym_object, *EXTRA->presetManager);
			
			critical_enter(0);
			tterr = aTextHandler.send(kTTSym_Write, v, none);
			critical_exit(0);
			
			if (!tterr)
				object_obex_dumpout(self, _sym_write, argc, argv);
			else
				object_obex_dumpout(self, _sym_error, 0, NULL);
		}
	}
	
	// start filewatcher
	if (EXTRA->filewatcher)
		filewatcher_start(EXTRA->filewatcher);
}

void model_preset_write_again(TTPtr self)
{
	defer(self, (method)model_preset_dowrite_again, NULL, 0, NULL);
}

void model_preset_dowrite_again(TTPtr self)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTObject        aTextHandler;
	TTValue			o;
	TTErr			tterr;
    
    // stop filewatcher
	if (EXTRA->filewatcher)
		filewatcher_stop(EXTRA->filewatcher);
	
	tterr = x->internals->lookup(kTTSym_TextHandler, o);
	
	if (!tterr) {
		
		aTextHandler = o[0];

		aTextHandler.set(kTTSym_object, *EXTRA->presetManager);
		
		critical_enter(0);
		tterr = aTextHandler.send(kTTSym_WriteAgain);
		critical_exit(0);
		
		if (!tterr)
			object_obex_dumpout(self, _sym_write, 0, NULL);
		else
			object_obex_dumpout(self, _sym_error, 0, NULL);
	}
    
    // start filewatcher
	if (EXTRA->filewatcher)
		filewatcher_start(EXTRA->filewatcher);
}

void model_preset_default(TTPtr self)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	short		outvol;
	t_fourcc	outtype, filetype = 'TEXT';
	char 		fullpath[MAX_PATH_CHARS];		// path and name passed on to the xml parser
	char		posixpath[MAX_PATH_CHARS];
	t_atom		a;
	t_symbol*	textfile;

	if (x->patcherClass != kTTSymEmpty) {
        
        if (EXTRA->attr_presets != kTTSym_none) {
            
            textfile = gensym(EXTRA->attr_presets.c_str());
        }
		else if (x->patcherContext == kTTSym_model)
			jamoma_edit_filename(*ModelPresetFormat, x->patcherClass, &textfile);
		
		else if (x->patcherContext == kTTSym_view)
			jamoma_edit_filename(*ViewPresetFormat, x->patcherClass, &textfile);
		else
			return object_error((t_object*)x, "preset_default : can't get the context of the patcher");
		
		if (locatefile_extended((char*)textfile->s_name, &outvol, &outtype, &filetype, 1)) {
			//object_warn((t_object*)x, "preset_default : can't find %s file in the Max search path", textfile.data());
			return;
		}
		
		path_topathname(outvol, (char*)textfile->s_name, fullpath);
		path_nameconform(fullpath, posixpath, PATH_STYLE_NATIVE, PATH_TYPE_BOOT);
		
		atom_setsym(&a, gensym(posixpath));
		defer_low(self, (method)model_preset_doread, gensym("read"), 1, &a);
		
		// recall the default preset if exists
        atom_setsym(&a, gensym("default"));
		defer_low((t_object*)x, (method)model_preset_dorecall, NULL, 1, &a);
		
		// replace filewatcher
		if (EXTRA->filewatcher) {
			filewatcher_stop(EXTRA->filewatcher);
			object_free(EXTRA->filewatcher);
		}
		
		EXTRA->filewatcher = filewatcher_new((t_object*)x, outvol, (char*)textfile->s_name);
		filewatcher_start(EXTRA->filewatcher);
	}
	else
		object_error((t_object*)x, "preset_default : can't get the class of the patcher");
}

void model_preset_filechanged(TTPtr self, char *filename, short path)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	char 		fullpath[MAX_PATH_CHARS];		// path and name passed on to the xml parser
	char		posixpath[MAX_PATH_CHARS];
	TTValue		v;
	TTSymbol    current;
	t_atom		a;
	
	// get current preset
	EXTRA->presetManager->get("current", v);
	
	path_topathname(path, filename, fullpath);
	path_nameconform(fullpath, posixpath, PATH_STYLE_NATIVE, PATH_TYPE_BOOT);
	
	atom_setsym(&a, gensym(posixpath));
	defer_low(self, (method)model_preset_doread, gensym("read"), 1, &a);
	
    /* since JamomaMax#711 : we decide to mute the triggering of the current preset
     
    // try to recall last current preset
	current = v[0];
	atom_setsym(&a, gensym((char*)current.c_str()));
	defer_low((t_object*)x, (method)model_preset_dorecall, NULL, 1, &a);
     
    */
}

void model_preset_dorecall(TTPtr self, t_symbol *msg, long argc, t_atom *argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTValue		v, none;

	if (argc && argv)
		if (atom_gettype(argv) == A_SYM)
			v = TTValue(TTSymbol(atom_getsym(argv)->s_name));
	
	// recall the preset
	EXTRA->presetManager->send(kTTSym_Recall, v, none);
}

void model_preset_edit(TTPtr self, t_symbol *msg, long argc, const t_atom *argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTString			*buffer;
	char				title[MAX_FILENAME_CHARS];
	TTObject            aTextHandler;
	TTHashPtr			allPresets;
	TTValue				v, o, args, none;
	TTSymbol			name;
    t_atom              a;
	TTErr				tterr;
	
	// choose object to edit : default the cuelist
	*EXTRA->toEdit = *EXTRA->presetManager;
	EXTRA->presetName = kTTSymEmpty;
	
	if (argc && argv) {
		
		if (atom_gettype(argv) == A_LONG) {
			
			// get presets names
			EXTRA->presetManager->get("names", v);
			
			if (atom_getlong(argv) <= (TTInt32) v.size())
				name = v[atom_getlong(argv)-1];
			
			else {
				object_error((t_object*)x, "%d does'nt exist", atom_getlong(argv));
				return;
			}
		}
		else if (atom_gettype(argv) == A_SYM)
			name = TTSymbol(atom_getsym(argv)->s_name);
		
		if (name != kTTSymEmpty) {
			
			// get preset object table
			EXTRA->presetManager->get("presets", v);
			allPresets = TTHashPtr((TTPtr)v[0]);
			
			if (allPresets) {
				
				// get cue to edit
				if (!allPresets->lookup(name, v)) {
					
					// edit a preset
					*EXTRA->toEdit = v[0];
					EXTRA->presetName = name;
				}
				else {
					object_error((t_object*)x, "%s does'nt exist", atom_getsym(argv)->s_name);
					return;
				}
			}
		}
	}
	
	// only one editor can be open in the same time
	if (!EXTRA->textEditor) {
	
		EXTRA->textEditor = (t_object*)object_new(_sym_nobox, _sym_jed, x, 0);
		
		buffer = new TTString();
		
		// get the buffer handler
		tterr = x->internals->lookup(kTTSym_TextHandler, o);
		
		if (!tterr) {
			
			aTextHandler = o[0];
			
			critical_enter(0);
			aTextHandler.set(kTTSym_object, *EXTRA->toEdit);
			tterr = aTextHandler.send(kTTSym_Write, (TTPtr)buffer, none);
			critical_exit(0);
		}
		
		// pass the buffer to the editor
		object_method(EXTRA->textEditor, _sym_settext, buffer->c_str(), _sym_utf_8);
		object_attr_setchar(EXTRA->textEditor, gensym("scratch"), 1);
		
		snprintf(title, MAX_FILENAME_CHARS, "%s preset editor", x->patcherClass.c_str());
		object_attr_setsym(EXTRA->textEditor, _sym_title, gensym(title));
        
        // output a flag
        atom_setsym(&a, gensym("opened"));
        object_obex_dumpout(self, gensym("editor"), 1, &a);
		
		buffer->clear();
		delete buffer;
		buffer = NULL;
	}
}

void model_preset_edclose(TTPtr self, char **text, long size)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	
	EXTRA->text = new TTString(*text);
	EXTRA->textEditor = NULL;
	
	defer_low((t_object*)x, (method)model_preset_doedit, NULL, 0, NULL);
}

void model_preset_doedit(TTPtr self)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTObject            aTextHandler;
	TTValue				o, none;
    t_atom              a;
	TTErr				tterr;
	
	// get the buffer handler
	tterr = x->internals->lookup(kTTSym_TextHandler, o);
	
	if (!tterr) {
		
		aTextHandler = o[0];
		
		critical_enter(0);
		tterr = aTextHandler.send(kTTSym_Read, (TTPtr)EXTRA->text, none);
		critical_exit(0);
		
        // output a flag
        atom_setsym(&a, gensym("closed"));
        object_obex_dumpout(self, gensym("editor"), 1, &a);
		
		if (!tterr)
			object_obex_dumpout(self, _sym_read, 0, NULL);
		else
			object_obex_dumpout(self, _sym_error, 0, NULL);
	}
	
	delete EXTRA->text;
	EXTRA->text = NULL;
	EXTRA->textEditor = NULL;
	*EXTRA->toEdit = *EXTRA->presetManager;
	EXTRA->presetName = kTTSymEmpty;
}

t_max_err model_preset_set_presets(TTPtr self, TTPtr attr, long ac, const t_atom *av)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	
	if (ac&&av) {
		EXTRA->attr_presets = TTSymbol(atom_getsym(av)->s_name);
	}
	else
		EXTRA->attr_presets = kTTSym_none; // default true
	
	return MAX_ERR_NONE;
}

t_max_err model_preset_get_presets(TTPtr self, TTPtr attr, long *ac, t_atom **av)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	
	if ((*ac)&&(*av)) {
		//memory passed in, use it
	} else {
		//otherwise allocate memory
		*ac = 1;
		if (!(*av = (t_atom*)getbytes(sizeof(t_atom)*(*ac)))) {
			*ac = 0;
			return MAX_ERR_OUT_OF_MEM;
		}
	}
	
	atom_setsym(*av, gensym(EXTRA->attr_presets.c_str()));
	
	return MAX_ERR_NONE;
}