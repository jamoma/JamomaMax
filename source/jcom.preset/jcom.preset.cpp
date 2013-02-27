/* 
 *	jcom.preset
 *	External object
 *	Copyright © 2010 by Théo de la Hogue
 * 
 * License: This code is licensed under the terms of the GNU LGPL
 * http://www.gnu.org/licenses/lgpl.html 
 */

#include "TTModularClassWrapperMax.h"
#include "jpatcher_api.h"

#define line_out 0
#define dump_out 1

// This is used to store extra data
typedef struct extra {
	TTBoolean	attr_load_default;
	TTPtr		filewatcher;		// a preset filewather
	TTObjectBasePtr	toEdit;				// the object to edit (a preset or all the preset list)
	TTSymbol	presetName;			// the name of the edited cue
	TTString	*text;				// the text of the editor to read after edclose
	ObjectPtr	textEditor;			// the text editor window
} t_extra;
#define EXTRA ((t_extra*)x->extra)

// Definitions
void		WrapTTPresetManagerClass(WrappedClassPtr c);
void		WrappedPresetManagerClass_new(TTPtr self, AtomCount argc, AtomPtr argv);
void		WrappedPresetManageClass_free(TTPtr self);

void		preset_assist(TTPtr self, void *b, long msg, long arg, char *dst);

void		preset_return_value(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);
void		preset_return_order(TTPtr self, t_symbol *msg, long argc, t_atom *argv);
void		preset_filechanged(TTPtr self, char *filename, short path);

void		preset_read(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);
void		preset_doread(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);
void		preset_read_again(TTPtr self);
void		preset_doread_again(TTPtr self);
void		preset_write(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);
void		preset_dowrite(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);
void		preset_write_again(TTPtr self);
void		preset_dowrite_again(TTPtr self);
void		preset_default(TTPtr self);
void		preset_dorecall(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);

void		preset_edit(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);
void		preset_edclose(TTPtr self, char **text, long size);
void		preset_doedit(TTPtr self);

void		preset_subscribe(TTPtr self);

t_max_err	preset_get_load_default(TTPtr self, TTPtr attr, AtomCount *ac, AtomPtr *av);
t_max_err	preset_set_load_default(TTPtr self, TTPtr attr, AtomCount ac, AtomPtr av);


int TTCLASSWRAPPERMAX_EXPORT main(void)
{
	ModularSpec *spec = new ModularSpec;
	spec->_wrap = &WrapTTPresetManagerClass;
	spec->_new = &WrappedPresetManagerClass_new;
	spec->_free = &WrappedPresetManageClass_free;
	spec->_any = NULL;
	
	return wrapTTModularClassAsMaxClass(kTTSym_PresetManager, "jcom.preset", NULL, spec);
}

void WrapTTPresetManagerClass(WrappedClassPtr c)
{
	class_addmethod(c->maxClass, (method)preset_assist,					"assist",				A_CANT, 0L);
    
    class_addmethod(c->maxClass, (method)preset_return_value,			"return_value",			A_CANT, 0);
	
	class_addmethod(c->maxClass, (method)preset_return_order,			"return_order",			A_CANT, 0);
	class_addmethod(c->maxClass, (method)preset_filechanged,			"filechanged",			A_CANT, 0);
	
	class_addmethod(c->maxClass, (method)preset_read,					"preset_read",			A_CANT, 0);
	class_addmethod(c->maxClass, (method)preset_write,					"preset_write",			A_CANT, 0);
    
    class_addmethod(c->maxClass, (method)preset_read_again,				"preset_read_again",	A_CANT, 0);
	class_addmethod(c->maxClass, (method)preset_write_again,			"preset_write_again",	A_CANT, 0);
	
	class_addmethod(c->maxClass, (method)preset_edit,					"dblclick",				A_CANT, 0);
	class_addmethod(c->maxClass, (method)preset_edclose,				"edclose",				A_CANT, 0);
	
	class_addmethod(c->maxClass, (method)preset_read,					"read",					A_GIMME, 0);
	class_addmethod(c->maxClass, (method)preset_write,					"write",				A_GIMME, 0);
	class_addmethod(c->maxClass, (method)preset_edit,					"edit",					A_GIMME, 0);
	
	class_addmethod(c->maxClass, (method)preset_read_again,				"read/again",			0);
	class_addmethod(c->maxClass, (method)preset_write_again,			"write/again",			0);
	
	CLASS_ATTR_LONG(c->maxClass,		"load_default",	0,		WrappedModularInstance,	extra);
	CLASS_ATTR_DEFAULT(c->maxClass,		"load_default",	0,		"1")
	CLASS_ATTR_ACCESSORS(c->maxClass,	"load_default",			preset_get_load_default,	preset_set_load_default);
	CLASS_ATTR_STYLE(c->maxClass,		"load_default",	0,		"onoff");
}

void WrappedPresetManagerClass_new(TTPtr self, AtomCount argc, AtomPtr argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	SymbolPtr					relativeAddress;
 	long						attrstart = attr_args_offset(argc, argv);			// support normal arguments
	
	// possible relativeAddress
	if (attrstart && argv) 
		relativeAddress = atom_getsym(argv);
	else
		relativeAddress = _sym_nothing;
	
	x->address = TTAddress(jamoma_parse_dieze((ObjectPtr)x, relativeAddress)->s_name);
	
	// create the preset manager
	jamoma_presetManager_create((ObjectPtr)x, &x->wrappedObject);
	
	// Prepare extra data
	x->extra = (t_extra*)malloc(sizeof(t_extra));
	EXTRA->attr_load_default = true;
	EXTRA->filewatcher = NULL;
	EXTRA->toEdit = x->wrappedObject;
	EXTRA->presetName = kTTSymEmpty;
	EXTRA->text = NULL;
	EXTRA->textEditor = NULL;
	
	// handle attribute args
	attr_args_process(x, argc, argv);
	
	// Make two outlets
	x->outlets = (TTHandle)sysmem_newptr(sizeof(TTPtr) * 1);
	x->outlets[line_out] = outlet_new(x, NULL);						// anything outlet to output data
	
	// Prepare Internals hash to store XmlHanler and TextHandler object
	x->internals = new TTHash();
	
	// The following must be deferred because we have to interrogate our box,
	// and our box is not yet valid until we have finished instantiating the object.
	// Trying to use a loadbang method instead is also not fully successful (as of Max 5.0.6)
	defer_low((ObjectPtr)x, (method)preset_subscribe, NULL, 0, 0);
}

void WrappedPresetManageClass_free(TTPtr self)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	
	// delete filewatcher
	if (EXTRA->filewatcher) {
		filewatcher_stop(EXTRA->filewatcher);
		object_free(EXTRA->filewatcher);
	}
	
	free(EXTRA);
}

void preset_subscribe(TTPtr self)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTValue						v, a, args;
	TTString					presetLevelAddress;
	TTAddress                   absoluteAddress, returnedAddress;
	TTNodePtr					returnedNode = NULL;
    TTNodePtr					returnedContextNode = NULL;
	TTDataPtr					aData;
	TTXmlHandlerPtr				aXmlHandler;
	TTTextHandlerPtr			aTextHandler;
	
	// add 'preset' after the address
	if (x->address != kTTAdrsEmpty) {
		presetLevelAddress = x->address.c_str();
		presetLevelAddress += "/preset";
	}
	else
		presetLevelAddress = "preset";
	
	// if the subscription is successful
	if (!jamoma_subscriber_create((ObjectPtr)x, x->wrappedObject, TTAddress(presetLevelAddress), &x->subscriberObject, returnedAddress, &returnedNode, &returnedContextNode)) {
		
		// get all info relative to our patcher
		jamoma_patcher_get_info((ObjectPtr)x, &x->patcherPtr, x->patcherContext, x->patcherClass, x->patcherName);
		
		// set the Address attribute of the PresetManager if it is empty
		x->wrappedObject->getAttributeValue(kTTSym_address, v);
		absoluteAddress = v[0];
		if (absoluteAddress == kTTAdrsEmpty) {
			returnedNode->getParent()->getAddress(absoluteAddress);
			x->wrappedObject->setAttributeValue(kTTSym_address, absoluteAddress);
		}

		// expose messages of TTPreset as TTData in the tree structure
		x->subscriberObject->exposeMessage(x->wrappedObject, TTSymbol("Store"), &aData);
		aData->setAttributeValue(kTTSym_type, kTTSym_generic);
		aData->setAttributeValue(kTTSym_tag, kTTSym_generic);
		aData->setAttributeValue(kTTSym_description, TTSymbol("Store a preset giving a name"));
		
		x->subscriberObject->exposeMessage(x->wrappedObject, TTSymbol("Recall"), &aData);
        aData->setAttributeValue(kTTSym_type, kTTSym_generic);
		aData->setAttributeValue(kTTSym_tag, kTTSym_generic);
		aData->setAttributeValue(kTTSym_description, TTSymbol("Recall a preset using a name"));
		
		x->subscriberObject->exposeMessage(x->wrappedObject, TTSymbol("Interpolate"), &aData);
		aData->setAttributeValue(kTTSym_type, kTTSym_generic);
		aData->setAttributeValue(kTTSym_tag, kTTSym_generic);
		aData->setAttributeValue(kTTSym_description, TTSymbol("Interpolate 2 presets using their names and a ratio"));
		
		x->subscriberObject->exposeMessage(x->wrappedObject, TTSymbol("Mix"), &aData);
		aData->setAttributeValue(kTTSym_type, kTTSym_generic);
		aData->setAttributeValue(kTTSym_tag, kTTSym_generic);
		aData->setAttributeValue(kTTSym_description, TTSymbol("Mix several presets using their names followed by a factor"));
		
		x->subscriberObject->exposeMessage(x->wrappedObject, TTSymbol("Remove"), &aData);
        aData->setAttributeValue(kTTSym_type, kTTSym_generic);
		aData->setAttributeValue(kTTSym_tag, kTTSym_generic);
		aData->setAttributeValue(kTTSym_description, TTSymbol("Remove a preset using a name"));		
		
		// expose attributes of TTPresetManager as TTData in the tree structure
		x->subscriberObject->exposeAttribute(x->wrappedObject, kTTSym_order, kTTSym_return, &aData);
		aData->setAttributeValue(kTTSym_type, kTTSym_array);
		aData->setAttributeValue(kTTSym_tag, kTTSym_generic);
		aData->setAttributeValue(kTTSym_description, TTSymbol("The order of the preset list"));
		
		// create internal TTXmlHandler
		aXmlHandler = NULL;
		TTObjectBaseInstantiate(kTTSym_XmlHandler, TTObjectBaseHandle(&aXmlHandler), args);
		v = TTValue(aXmlHandler);
		x->internals->append(kTTSym_XmlHandler, v);
		v = TTValue(x->wrappedObject);
		aXmlHandler->setAttributeValue(kTTSym_object, v);
		
		// create internal TTTextHandler
		aTextHandler = NULL;
		TTObjectBaseInstantiate(kTTSym_TextHandler, TTObjectBaseHandle(&aTextHandler), args);
		v = TTValue(aTextHandler);
		x->internals->append(kTTSym_TextHandler, v);
		
		// Create internal messages for Read and Write
		makeInternals_data(self, absoluteAddress, TTSymbol("preset/read"), gensym("preset_read"), x->patcherPtr, kTTSym_message, (TTObjectBasePtr*)&aData);
		aData->setAttributeValue(kTTSym_type, kTTSym_string);
		aData->setAttributeValue(kTTSym_tag, kTTSym_generic);
		aData->setAttributeValue(kTTSym_description, TTSymbol("Read a xml preset file"));

		makeInternals_data(self, absoluteAddress, TTSymbol("preset/write"), gensym("preset_write"), x->patcherPtr, kTTSym_message, (TTObjectBasePtr*)&aData);
		aData->setAttributeValue(kTTSym_type, kTTSym_string);
		aData->setAttributeValue(kTTSym_tag, kTTSym_generic);
		aData->setAttributeValue(kTTSym_description, TTSymbol("Write a xml preset file"));
		
		makeInternals_data(self, absoluteAddress, TTSymbol("preset/read/again"), gensym("preset_read_again"), x->patcherPtr, kTTSym_message, (TTObjectBasePtr*)&aData);
		aData->setAttributeValue(kTTSym_type, kTTSym_none);
		aData->setAttributeValue(kTTSym_tag, kTTSym_generic);
		aData->setAttributeValue(kTTSym_description, TTSymbol("Read from the last xml preset file"));

		makeInternals_data(self, absoluteAddress, TTSymbol("preset/write/again"), gensym("preset_write_again"), x->patcherPtr, kTTSym_message, (TTObjectBasePtr*)&aData);
		aData->setAttributeValue(kTTSym_type, kTTSym_none);
		aData->setAttributeValue(kTTSym_tag, kTTSym_generic);
		aData->setAttributeValue(kTTSym_description, TTSymbol("Write into the last xml preset file"));
	
		// if desired, load default modelClass.patcherContext.xml file preset
		if (EXTRA->attr_load_default)
			defer_low(x, (method)preset_default, 0, 0, 0L);
	}
}

// Method for Assistance Messages
void preset_assist(TTPtr self, void *b, long msg, long arg, char *dst)
{
	if (msg==1)			// Inlets
		strcpy(dst, "");		
	else {							// Outlets
		switch(arg) {
			case line_out:
				strcpy(dst, "preset output");
				break;
			case dump_out:
				strcpy(dst, "dumpout");
				break;
		}
 	}
}

void preset_return_value(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	
	// avoid blank before line
	if (msg == _sym_nothing)
		outlet_atoms(x->outlets[line_out], argc, argv);
	else
		outlet_anything(x->outlets[line_out], msg, argc, argv);
}

void preset_return_order(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	outlet_anything(x->outlets[dump_out], gensym("order"), argc, argv);
}

void preset_read(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	defer(self, (method)preset_doread, msg, argc, argv);
}

void preset_doread(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{	
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTValue			o, v;
	TTSymbol		fullpath;
	TTXmlHandlerPtr	aXmlHandler = NULL;
	TTErr			tterr;
	
	if (x->wrappedObject) {
		
		fullpath = jamoma_file_read((ObjectPtr)x, argc, argv, 'TEXT');
		v.append(fullpath);
		
		tterr = x->internals->lookup(kTTSym_XmlHandler, o);
		
		if (!tterr) {
			
			aXmlHandler = TTXmlHandlerPtr((TTObjectBasePtr)o[0]);
			
			critical_enter(0);
			tterr = aXmlHandler->sendMessage(kTTSym_Read, v, kTTValNONE);
			critical_exit(0);
			
			if (!tterr)
				object_obex_dumpout(self, _sym_read, argc, argv);
			else
				object_obex_dumpout(self, _sym_error, 0, NULL);
		}
	}
}

void preset_read_again(TTPtr self)
{
	defer(self, (method)preset_doread_again, NULL, 0, NULL);
}

void preset_doread_again(TTPtr self)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTXmlHandlerPtr	aXmlHandler = NULL;
	TTValue			o;
	TTErr			tterr;
	
	tterr = x->internals->lookup(kTTSym_XmlHandler, o);
	
	if (!tterr) {
		
		aXmlHandler = TTXmlHandlerPtr((TTObjectBasePtr)o[0]);
		
		critical_enter(0);
		tterr = aXmlHandler->sendMessage(kTTSym_ReadAgain);
		critical_exit(0);
		
		if (!tterr)
			object_obex_dumpout(self, _sym_read, 0, NULL);
		else
			object_obex_dumpout(self, _sym_error, 0, NULL);
	}
}

void preset_write(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	defer(self, (method)preset_dowrite, msg, argc, argv);
}

void preset_dowrite(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	char 			filename[MAX_FILENAME_CHARS];
	TTSymbol		fullpath;
	TTValue			o, v;
	TTXmlHandlerPtr	aXmlHandler;
	TTErr			tterr;
	
	// stop filewatcher
	if (EXTRA->filewatcher)
		filewatcher_stop(EXTRA->filewatcher);
	
	if (x->wrappedObject) {
		
		// Default XML File Name
		snprintf(filename, MAX_FILENAME_CHARS, "%s.%s.xml", x->patcherClass.c_str(), x->patcherContext.c_str());
		fullpath = jamoma_file_write((ObjectPtr)x, argc, argv, filename);
		v.append(fullpath);
		
		tterr = x->internals->lookup(kTTSym_XmlHandler, o);
		
		if (!tterr) {
			aXmlHandler = TTXmlHandlerPtr((TTObjectBasePtr)o[0]);
			
			critical_enter(0);
			tterr = aXmlHandler->sendMessage(kTTSym_Write, v, kTTValNONE);
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

void preset_write_again(TTPtr self)
{
	defer(self, (method)preset_dowrite_again, NULL, 0, NULL);
}

void preset_dowrite_again(TTPtr self)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTXmlHandlerPtr	aXmlHandler = NULL;
	TTValue			o;
	TTErr			tterr;
	
	tterr = x->internals->lookup(kTTSym_XmlHandler, o);
	
	if (!tterr) {
		
		aXmlHandler = TTXmlHandlerPtr((TTObjectBasePtr)o[0]);
		
		critical_enter(0);
		tterr = aXmlHandler->sendMessage(kTTSym_WriteAgain);
		critical_exit(0);
		
		if (!tterr)
			object_obex_dumpout(self, _sym_write, 0, NULL);
		else
			object_obex_dumpout(self, _sym_error, 0, NULL);
	}
}

void preset_default(TTPtr self)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	short		outvol;
	long		outtype, filetype = 'TEXT';
	char 		fullpath[MAX_PATH_CHARS];		// path and name passed on to the xml parser
	char		posixpath[MAX_PATH_CHARS];
	Atom		a;
	SymbolPtr	xmlfile;

	if (x->patcherClass != kTTSymEmpty) {
		
		if (x->patcherContext == kTTSym_model)
			jamoma_edit_filename(*ModelPresetFormat, x->patcherClass, &xmlfile);
		
		else if (x->patcherContext == kTTSym_view)
			jamoma_edit_filename(*ViewPresetFormat, x->patcherClass, &xmlfile);
		else
			return object_error((ObjectPtr)x, "preset_default : can't get the context of the patcher");
		
		if (locatefile_extended((char*)xmlfile->s_name, &outvol, &outtype, &filetype, 1)) {
			//object_warn((ObjectPtr)x, "preset_default : can't find %s file in the Max search path", xmlfile.data());
			return;
		}
		
		path_topathname(outvol, (char*)xmlfile->s_name, fullpath);
		path_nameconform(fullpath, posixpath, PATH_STYLE_NATIVE, PATH_TYPE_BOOT);
		
		atom_setsym(&a, gensym(posixpath));
		defer_low(self, (method)preset_doread, gensym("read"), 1, &a);
		
		// recall the default preset if exists
        atom_setsym(&a, gensym("default"));
		defer_low((ObjectPtr)x, (method)preset_dorecall, NULL, 1, &a);
		
		// replace filewatcher
		if (EXTRA->filewatcher) {
			filewatcher_stop(EXTRA->filewatcher);
			object_free(EXTRA->filewatcher);
		}
		
		EXTRA->filewatcher = filewatcher_new((ObjectPtr)x, outvol, (char*)xmlfile->s_name);
		filewatcher_start(EXTRA->filewatcher);
	}
	else
		object_error((ObjectPtr)x, "preset_default : can't get the class of the patcher");
}

void preset_filechanged(TTPtr self, char *filename, short path)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	char 		fullpath[MAX_PATH_CHARS];		// path and name passed on to the xml parser
	char		posixpath[MAX_PATH_CHARS];
	TTValue		v;
	TTSymbol    current;
	Atom		a;
	
	// get current preset
	x->wrappedObject->getAttributeValue(TTSymbol("current"), v);
	
	path_topathname(path, filename, fullpath);
	path_nameconform(fullpath, posixpath, PATH_STYLE_NATIVE, PATH_TYPE_BOOT);
	
	atom_setsym(&a, gensym(posixpath));
	defer_low(self, (method)preset_doread, gensym("read"), 1, &a);
	
	// try to recall last current preset
	current = v[0];
	atom_setsym(&a, gensym((char*)current.c_str()));
	defer_low((ObjectPtr)x, (method)preset_dorecall, NULL, 1, &a);
}

void preset_dorecall(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTValue		v;

	if (argc && argv)
		if (atom_gettype(argv) == A_SYM)
			v = TTValue(TTSymbol(atom_getsym(argv)->s_name));
	
	// recall the preset
	x->wrappedObject->sendMessage(kTTSym_Recall, v, kTTValNONE);
}

void preset_edit(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTString			*buffer;
	char				title[MAX_FILENAME_CHARS];
	TTTextHandlerPtr	aTextHandler = NULL;
	TTHashPtr			allPresets;
	TTValue				v, o, args;
	TTSymbol			name;
    Atom                a;
	TTErr				tterr;
	
	// choose object to edit : default the cuelist
	EXTRA->toEdit = x->wrappedObject;
	EXTRA->presetName = kTTSymEmpty;
	
	if (argc && argv) {
		
		if (atom_gettype(argv) == A_LONG) {
			
			// get presets order
			x->wrappedObject->getAttributeValue(TTSymbol("order"), v);
			
			if (atom_getlong(argv) <= v.size())
				name = v[atom_getlong(argv)-1];
			
			else {
				object_error((ObjectPtr)x, "%d does'nt exist", atom_getlong(argv));
				return;
			}
		}
		else if (atom_gettype(argv) == A_SYM)
			name = TTSymbol(atom_getsym(argv)->s_name);
		
		if (name != kTTSymEmpty) {
			
			// get preset object table
			x->wrappedObject->getAttributeValue(TTSymbol("presets"), v);
			allPresets = TTHashPtr((TTPtr)v[0]);
			
			if (allPresets) {
				
				// get cue to edit
				if (!allPresets->lookup(name, v)) {
					
					// edit a preset
					EXTRA->toEdit = v[0];
					EXTRA->presetName = name;
				}
				else {
					object_error((ObjectPtr)x, "%s does'nt exist", atom_getsym(argv)->s_name);
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
			
			aTextHandler = TTTextHandlerPtr((TTObjectBasePtr)o[0]);
			
			critical_enter(0);
			o = TTValue(EXTRA->toEdit);
			aTextHandler->setAttributeValue(kTTSym_object, o);
			args = TTValue((TTPtr)buffer);
			tterr = aTextHandler->sendMessage(kTTSym_Write, args, kTTValNONE);
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

void preset_edclose(TTPtr self, char **text, long size)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	
	EXTRA->text = new TTString(*text);
	EXTRA->textEditor = NULL;
	
	defer_low((ObjectPtr)x, (method)preset_doedit, NULL, 0, NULL);
}

void preset_doedit(TTPtr self)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTTextHandlerPtr	aTextHandler = NULL;
	TTValue				o, args;
    Atom                a;
	TTErr				tterr;
	
	// get the buffer handler
	tterr = x->internals->lookup(kTTSym_TextHandler, o);
	
	if (!tterr) {
		
		aTextHandler = TTTextHandlerPtr((TTObjectBasePtr)o[0]);
		
		critical_enter(0);
		args = TTValue((TTPtr)EXTRA->text);
		tterr = aTextHandler->sendMessage(kTTSym_Read, args, kTTValNONE);
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
	EXTRA->toEdit = x->wrappedObject;
	EXTRA->presetName = kTTSymEmpty;
}

t_max_err preset_set_load_default(TTPtr self, TTPtr attr, AtomCount ac, AtomPtr av) 
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	
	if (ac&&av) {
		EXTRA->attr_load_default = atom_getlong(av) == 1;
	}
	else
		EXTRA->attr_load_default = true; // default true
	
	return MAX_ERR_NONE;
}

t_max_err preset_get_load_default(TTPtr self, TTPtr attr, AtomCount *ac, AtomPtr *av)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	
	if ((*ac)&&(*av)) {
		//memory passed in, use it
	} else {
		//otherwise allocate memory
		*ac = 1;
		if (!(*av = (AtomPtr)getbytes(sizeof(Atom)*(*ac)))) {
			*ac = 0;
			return MAX_ERR_OUT_OF_MEM;
		}
	}
	
	atom_setlong(*av, EXTRA->attr_load_default == 1);
	
	return MAX_ERR_NONE;
}