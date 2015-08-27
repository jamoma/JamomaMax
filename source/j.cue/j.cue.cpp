/** @file
 * 
 * @ingroup implementationMaxExternals
 *
 * @brief j.cue - store and recall the state of several models
 *
 * @details
 *
 * @authors Théo de la Hogue, Trond Lossius
 *
 * @copyright © 2010 by Théo de la Hogue @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */


#include "TTModularClassWrapperMax.h"
#include "jpatcher_api.h"

// This is used to store extra data
typedef struct extra {
	TTObject	*toEdit;				// the object to edit (a cue or all the cuelist)
	TTSymbol	cueName;			// the name of the edited cue
	TTString	*text;				// the text of the editor to read after edclose
	t_object*	textEditor;			// the text editor window
} t_extra;
#define EXTRA ((t_extra*)x->extra)

#define line_out 0
#define dump_out 1

// Definitions
void		WrapTTCueManagerClass(WrappedClassPtr c);
void		WrappedCueManagerClass_new(TTPtr self, long argc, t_atom *argv);
void		WrappedCueManageClass_free(TTPtr self);

void		cue_assist(TTPtr self, void *b, long msg, long arg, char *dst);

void		cue_return_value(TTPtr self, t_symbol *msg, long argc, t_atom *argv);
void		cue_return_names(TTPtr self, t_symbol *msg, long argc, t_atom *argv);

void		cue_get(TTPtr self, t_symbol *msg, long argc, t_atom *argv);
void		cue_set(TTPtr self, t_symbol *msg, long argc, t_atom *argv);

void		cue_read(TTPtr self, t_symbol *msg, long argc, t_atom *argv);
void		cue_doread(TTPtr self, t_symbol *msg, long argc, t_atom *argv);
void		cue_read_again(TTPtr self);
void		cue_doread_again(TTPtr self);

void		cue_write(TTPtr self, t_symbol *msg, long argc, t_atom *argv);
void		cue_dowrite(TTPtr self, t_symbol *msg, long argc, t_atom *argv);
void		cue_write_again(TTPtr self);
void		cue_dowrite_again(TTPtr self);

void		cue_edit(TTPtr self, t_symbol *msg, long argc, const t_atom *argv);
void		cue_edclose(TTPtr self, char **text, long size);
void		cue_doedit(TTPtr self);

int C74_EXPORT main(void)
{
	ModularSpec *spec = new ModularSpec;
	spec->_wrap = &WrapTTCueManagerClass;
	spec->_new = &WrappedCueManagerClass_new;
	spec->_free = &WrappedCueManageClass_free;
	spec->_any = NULL;
	
	return wrapTTModularClassAsMaxClass(kTTSym_CueManager, "j.cue", NULL, spec);
}

void WrapTTCueManagerClass(WrappedClassPtr c)
{
	class_addmethod(c->maxClass, (method)cue_assist,				"assist",				A_CANT, 0L);
	
	class_addmethod(c->maxClass, (method)cue_return_value,			"return_value",			A_CANT, 0);
	
	class_addmethod(c->maxClass, (method)cue_return_names,			"return_names",			A_CANT, 0);
    
	class_addmethod(c->maxClass, (method)cue_read,					"cue_read",				A_CANT, 0);
	class_addmethod(c->maxClass, (method)cue_write,					"cue_write",			A_CANT, 0);
	
	class_addmethod(c->maxClass, (method)cue_edit,					"dblclick",				A_CANT, 0);
	class_addmethod(c->maxClass, (method)cue_edclose,				"edclose",				A_CANT, 0);
    
    class_addmethod(c->maxClass, (method)cue_get,					"get",					A_GIMME, 0);
	class_addmethod(c->maxClass, (method)cue_set,					"set",                  A_GIMME, 0);
	
	class_addmethod(c->maxClass, (method)cue_read,					"read",					A_GIMME, 0);
	class_addmethod(c->maxClass, (method)cue_write,					"write",				A_GIMME, 0);
	class_addmethod(c->maxClass, (method)cue_edit,					"edit",					A_GIMME, 0);
	
	class_addmethod(c->maxClass, (method)cue_read_again,			"read/again",			0);
	class_addmethod(c->maxClass, (method)cue_write_again,			"write/again",			0);
}

void WrappedCueManagerClass_new(TTPtr self, long argc, t_atom *argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	t_symbol*					name;
    TTValue                     v, args;
	TTObject					aTextHandler;
 	long						attrstart = attr_args_offset(argc, argv);			// support normal arguments
	
	// create the cue manager
	jamoma_cueManager_create((t_object*)x, x->wrappedObject);
    
    // read first argument to know if the cue binds a namespace
	if (attrstart && argv) {
		
		if (atom_gettype(argv) == A_SYM) {
			
			name = atom_getsym(argv);
			x->wrappedObject.set(kTTSym_namespace, TTSymbol(name->s_name));
		}
		else
			object_error((t_object*)x, "argument not expected");
	}
	
	// Make two outlets
	x->outlets = (TTHandle)sysmem_newptr(sizeof(TTPtr) * 1);
	x->outlets[line_out] = outlet_new(x, NULL);						// anything outlet to output data
	
	// Prepare Internals hash to store TextHandler object
	x->internals = new TTHash();
    
    // create internal TTTextHandler
    aTextHandler = TTObject(kTTSym_TextHandler);
    x->internals->append(kTTSym_TextHandler, aTextHandler);
	
	// Prepare extra data
	x->extra = (t_extra*)malloc(sizeof(t_extra));
    EXTRA->toEdit = new TTObject();
	*EXTRA->toEdit = x->wrappedObject;
	EXTRA->cueName = kTTSymEmpty;
	EXTRA->text = NULL;
	EXTRA->textEditor = NULL;
	
	// handle attribute args
	attr_args_process(x, argc, argv);
}

void WrappedCueManageClass_free(TTPtr self)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
    
    delete EXTRA->toEdit;
    
    // the texthanler have to forget the cue manager object
    TTValue o;
    x->internals->lookup(kTTSym_TextHandler, o);
    TTObject empty, aTextHandler = o[0];
    aTextHandler.set(kTTSym_object, empty);
    
	free(EXTRA);
}

// Method for Assistance Messages
void cue_assist(TTPtr self, void *b, long msg, long arg, char *dst)
{
	if (msg==1)			// Inlets
		strcpy(dst, "");		
	else {							// Outlets
		switch(arg) {
			case line_out:
				strcpy(dst, "cue output");
				break;
			case dump_out:
				strcpy(dst, "dumpout");
				break;
		}
 	}
}

void cue_return_value(TTPtr self, t_symbol *msg, long argc, t_atom *argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	
	// avoid blank before line
	if (msg == _sym_nothing)
		outlet_atoms(x->outlets[line_out], argc, argv);
	else
		outlet_anything(x->outlets[line_out], msg, argc, argv);
}

void cue_return_names(TTPtr self, t_symbol *msg, long argc, t_atom *argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	outlet_anything(x->outlets[dump_out], gensym("names"), argc, argv);
}

void cue_get(TTPtr self, t_symbol *msg, long argc, t_atom *argv)
{
    WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
    TTHashPtr   allCues;
	TTValue     v;
	TTSymbol    name, attribute;
    TTObject	cue;
    long        ac = 0;
	t_atom      *av = NULL;
    
    if (argc == 2) {
        
        if (atom_gettype(argv) == A_SYM && atom_gettype(argv+1) == A_SYM) {
            
            attribute = TTSymbol((char*)atom_getsym(argv)->s_name);
            name = TTSymbol((char*)atom_getsym(argv+1)->s_name);
            
            // get cue object table
            x->wrappedObject.get("cues", v);
            allCues = TTHashPtr((TTPtr)v[0]);
            
            if (allCues) {
                
                // get cue
                if (!allCues->lookup(name, v)) {
                    
                    cue = v[0];
                    if (!cue.get(attribute, v)) {
                        
                        v.prepend(name);
                        jamoma_ttvalue_to_Atom(v, &ac, &av);
                        
                        object_obex_dumpout(self, atom_getsym(argv), ac, av);
                    }
                    else
                        object_error((t_object*)x, "%s attribute does'nt exist", atom_getsym(argv)->s_name);
                }
                else
                    object_error((t_object*)x, "%s cue does'nt exist", atom_getsym(argv+1)->s_name);
            }
        }
    }
}

void cue_set(TTPtr self, t_symbol *msg, long argc, t_atom *argv)
{
    WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
    TTHashPtr   allCues;
	TTValue     v;
	TTSymbol    name, attribute;
    TTObject	cue;
    
    if (argc >= 2) {
        
        if (atom_gettype(argv) == A_SYM && atom_gettype(argv+1) == A_SYM) {
            
            attribute = TTSymbol((char*)atom_getsym(argv)->s_name);
            name = TTSymbol((char*)atom_getsym(argv+1)->s_name);
            
            // get cue object table
            x->wrappedObject.get("cues", v);
            allCues = TTHashPtr((TTPtr)v[0]);
            
            if (allCues) {
                
                // get cue
                if (!allCues->lookup(name, v)) {
                    
                    cue = v[0];
                    
                    // prepare value to set
                    jamoma_ttvalue_from_Atom(v, _sym_nothing, argc-2, argv+2);
                    
                    if (cue.set(attribute, v))
                        object_error((t_object*)x, "%s attribute does'nt exist", atom_getsym(argv)->s_name);
                }
                else
                    object_error((t_object*)x, "%s cue does'nt exist", atom_getsym(argv+1)->s_name);
            }
        }
    }
}

void cue_read(TTPtr self, t_symbol *msg, long argc, t_atom *argv)
{
	defer(self, (method)cue_doread, msg, argc, argv);
}

void cue_doread(TTPtr self, t_symbol *msg, long argc, t_atom *argv)
{	
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTValue			o, v;
	TTSymbol		fullpath;
	TTObject		aTextHandler;
	TTErr			tterr;
	
	if (x->wrappedObject.valid()) {
		
		fullpath = jamoma_file_read((t_object*)x, argc, argv, (t_fourcc)'TEXT');
		v.append(fullpath);
		
		tterr = x->internals->lookup(kTTSym_TextHandler, o);
		
		if (!tterr) {
			
			aTextHandler = o[0];

			aTextHandler.set(kTTSym_object, x->wrappedObject);
			
			critical_enter(0);
			tterr = aTextHandler.send(kTTSym_Read, v);
			critical_exit(0);
			
			if (!tterr)
				object_obex_dumpout(self, _sym_read, argc, argv);
			else
				object_obex_dumpout(self, _sym_error, 0, NULL);
		}
	}
}

void cue_read_again(TTPtr self)
{
	defer(self, (method)cue_doread_again, NULL, 0, NULL);
}

void cue_doread_again(TTPtr self)
{	
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTValue		o, v;
	TTObject	aTextHandler;
	TTErr		tterr;
	
	if (x->wrappedObject.valid()) {
		
		tterr = x->internals->lookup(kTTSym_TextHandler, o);
		
		if (!tterr) {
			
			aTextHandler = o[0];

			aTextHandler.set(kTTSym_object, x->wrappedObject);
			
			critical_enter(0);
			tterr = aTextHandler.send(kTTSym_ReadAgain, v);
			critical_exit(0);
			
			if (!tterr)
				object_obex_dumpout(self, _sym_read, 0, NULL);
			else
				object_obex_dumpout(self, _sym_error, 0, NULL);
		}
	}
}

void cue_write(TTPtr self, t_symbol *msg, long argc, t_atom *argv)
{
	defer(self, (method)cue_dowrite, msg, argc, argv);
}

void cue_dowrite(TTPtr self, t_symbol *msg, long argc, t_atom *argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	char 			filename[MAX_FILENAME_CHARS];
	TTSymbol		fullpath;
	TTValue			o, v;
	TTObject        aTextHandler;
	TTErr			tterr;
	
	if (x->wrappedObject.valid()) {
		
		// Default TEXT File Name
		snprintf(filename, MAX_FILENAME_CHARS, "untitled.cues.txt");
		
		fullpath = jamoma_file_write((t_object*)x, argc, argv, filename);
		v.append(fullpath);
		
		tterr = x->internals->lookup(kTTSym_TextHandler, o);
		
		if (!tterr) {
			aTextHandler = o[0];

			aTextHandler.set(kTTSym_object, x->wrappedObject);
			
			critical_enter(0);
			tterr = aTextHandler.send(kTTSym_Write, v);
			critical_exit(0);
			
			if (!tterr)
				object_obex_dumpout(self, _sym_write, argc, argv);
			else
				object_obex_dumpout(self, _sym_error, 0, NULL);
		}
	}
}

void cue_write_again(TTPtr self)
{
	defer(self, (method)cue_dowrite_again, NULL, 0, NULL);
}

void cue_dowrite_again(TTPtr self)
{	
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTValue			o, v;
	TTObject        aTextHandler;
	TTErr			tterr;
	
	if (x->wrappedObject.valid()) {
		
		tterr = x->internals->lookup(kTTSym_TextHandler, o);
		
		if (!tterr) {
			
			aTextHandler = o[0];

			aTextHandler.set(kTTSym_object, x->wrappedObject);
			
			critical_enter(0);
			tterr = aTextHandler.send(kTTSym_WriteAgain, v);
			critical_exit(0);
			
			if (!tterr)
				object_obex_dumpout(self, _sym_write, 0, NULL);
			else
				object_obex_dumpout(self, _sym_error, 0, NULL);
		}
	}
}

void cue_edit(TTPtr self, t_symbol *msg, long argc, const t_atom *argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTString			*buffer;
	char				title[MAX_FILENAME_CHARS];
	TTObject            aTextHandler;
	TTHashPtr			allCues;
	TTValue				v, o;
	TTSymbol			name = kTTSymEmpty;
    t_atom				a;
	TTErr				tterr;
	
	// choose object to edit : default the cuelist
	*EXTRA->toEdit = x->wrappedObject;
	EXTRA->cueName = kTTSymEmpty;
	
	if (argc && argv)
    {
		if (atom_gettype(argv) == A_LONG)
        {
            TTUInt32 index = atom_getlong(argv);
			
			// get cues names
			x->wrappedObject.get("names", v);
			
			if (index > 0 && index <= v.size())
				name = v[index-1];
			else
            {
				object_error((t_object*)x, "%d does'nt exist", atom_getlong(argv));
				return;
			}
		}
		else if (atom_gettype(argv) == A_SYM)
			name = TTSymbol(atom_getsym(argv)->s_name);
		
		if (name != kTTSymEmpty)
        {
			// get cue object table
			x->wrappedObject.get("cues", v);
			allCues = TTHashPtr((TTPtr)v[0]);
			
			if (allCues)
            {
				// get cue to edit
				if (!allCues->lookup(name, v))
                {
					// edit a cue
					*EXTRA->toEdit = v[0];
					EXTRA->cueName = name;
				}
				else
                {
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
			tterr = aTextHandler.send(kTTSym_Write, (TTPtr)buffer);
			critical_exit(0);
		}
		
		// pass the buffer to the editor
		object_method(EXTRA->textEditor, _sym_settext, buffer->c_str(), _sym_utf_8);
		object_attr_setchar(EXTRA->textEditor, gensym("scratch"), 1);
		
		snprintf(title, MAX_FILENAME_CHARS, "cuelist editor");
		object_attr_setsym(EXTRA->textEditor, _sym_title, gensym(title));
        
        // output a flag
        atom_setsym(&a, gensym("opened"));
        object_obex_dumpout(self, gensym("editor"), 1, &a);
		
		buffer->clear();
		delete buffer;
		buffer = NULL;
	}
}

void cue_edclose(TTPtr self, char **text, long size)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	
	EXTRA->text = new TTString(*text);
	EXTRA->textEditor = NULL;
	
	defer_low((t_object*)x, (method)cue_doedit, NULL, 0, NULL);
}

void cue_doedit(TTPtr self)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTObject    aTextHandler;
	TTValue		o, args;
    t_atom		a;
	TTErr		tterr;
	
	// get the buffer handler
	tterr = x->internals->lookup(kTTSym_TextHandler, o);
	
	if (!tterr) {
		
		aTextHandler = o[0];
		
		critical_enter(0);
		tterr = aTextHandler.send(kTTSym_Read, (TTPtr)EXTRA->text);
		critical_exit(0);
		
		// output a flag
        atom_setsym(&a, gensym("closed"));
        object_obex_dumpout(self, gensym("editor"), 1, &a);
		
		if (tterr)
			object_obex_dumpout(self, _sym_error, 0, NULL);
	}
	
	delete EXTRA->text;
	EXTRA->text = NULL;
	EXTRA->textEditor = NULL;
	*EXTRA->toEdit = x->wrappedObject;
	EXTRA->cueName = kTTSymEmpty;
}