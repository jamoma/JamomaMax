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
	TTObjectBasePtr	toEdit;				// the object to edit (a cue or all the cuelist)
	TTSymbol	cueName;			// the name of the edited cue
	TTString	*text;				// the text of the editor to read after edclose
	ObjectPtr	textEditor;			// the text editor window
} t_extra;
#define EXTRA ((t_extra*)x->extra)

#define line_out 0
#define dump_out 1

// Definitions
void		WrapTTCueManagerClass(WrappedClassPtr c);
void		WrappedCueManagerClass_new(TTPtr self, AtomCount argc, AtomPtr argv);
void		WrappedCueManageClass_free(TTPtr self);

void		cue_assist(TTPtr self, void *b, long msg, long arg, char *dst);

void		cue_return_value(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);
void		cue_return_order(TTPtr self, t_symbol *msg, long argc, t_atom *argv);

void		cue_get(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);
void		cue_set(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);

void		cue_read(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);
void		cue_doread(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);
void		cue_read_again(TTPtr self);
void		cue_doread_again(TTPtr self);

void		cue_write(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);
void		cue_dowrite(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);
void		cue_write_again(TTPtr self);
void		cue_dowrite_again(TTPtr self);

void		cue_dorecall(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);

void		cue_edit(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);
void		cue_edclose(TTPtr self, char **text, long size);
void		cue_doedit(TTPtr self);

void		cue_subscribe(TTPtr self);

void		cue_return_model_address(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);

t_max_err	cue_get_relative(TTPtr self, TTPtr attr, AtomCount *ac, AtomPtr *av);
t_max_err	cue_set_relative(TTPtr self, TTPtr attr, AtomCount ac, AtomPtr av);

int TTCLASSWRAPPERMAX_EXPORT main(void)
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
    
    class_addmethod(c->maxClass, (method)cue_return_model_address,  "return_model_address", A_CANT, 0);
	
	class_addmethod(c->maxClass, (method)cue_return_value,			"return_value",			A_CANT, 0);
	
	class_addmethod(c->maxClass, (method)cue_return_order,			"return_order",			A_CANT, 0);
    
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
    
    CLASS_ATTR_LONG(c->maxClass,		"relative",	0,		WrappedModularInstance,	index);	// use index member to store relative
	CLASS_ATTR_ACCESSORS(c->maxClass,	"relative",	cue_get_relative,	cue_set_relative);
	CLASS_ATTR_STYLE(c->maxClass,		"relative",	0,		"onoff");
}

void WrappedCueManagerClass_new(TTPtr self, AtomCount argc, AtomPtr argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	SymbolPtr					name;
    TTValue                     v, args;
	TTTextHandlerPtr			aTextHandler;
 	long						attrstart = attr_args_offset(argc, argv);			// support normal arguments
	
	// create the cue manager
	jamoma_cueManager_create((ObjectPtr)x, &x->wrappedObject);
    
    // read first argument to know if the cue binds a namespace
	if (attrstart && argv) {
		
		if (atom_gettype(argv) == A_SYM) {
			
			name = atom_getsym(argv);
			x->wrappedObject->setAttributeValue(kTTSym_namespace, TTSymbol(name->s_name));
		}
		else
			object_error((ObjectPtr)x, "argument not expected");
	}
	
	// Make two outlets
	x->outlets = (TTHandle)sysmem_newptr(sizeof(TTPtr) * 1);
	x->outlets[line_out] = outlet_new(x, NULL);						// anything outlet to output data
	
	// Prepare Internals hash to store TextHandler object
	x->internals = new TTHash();
    
    // create internal TTTextHandler
    aTextHandler = NULL;
    TTObjectBaseInstantiate(kTTSym_TextHandler, TTObjectBaseHandle(&aTextHandler), args);
    v = TTValue(aTextHandler);
    x->internals->append(kTTSym_TextHandler, v);
	
	// Prepare extra data
	x->extra = (t_extra*)malloc(sizeof(t_extra));
	EXTRA->toEdit = x->wrappedObject;
	EXTRA->cueName = kTTSymEmpty;
	EXTRA->text = NULL;
	EXTRA->textEditor = NULL;
	
	// handle attribute args
	attr_args_process(x, argc, argv);
}

void WrappedCueManageClass_free(TTPtr self)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	
	free(EXTRA);
}

void cue_subscribe(TTPtr self)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTValue						v;
	TTAddress                   contextAddress = kTTAdrsEmpty;
	TTAddress                   absoluteAddress, returnedAddress;
    TTNodePtr                   returnedNode;
    TTNodePtr                   returnedContextNode;
	TTObjectBasePtr				anObject;
	
	jamoma_patcher_get_info((ObjectPtr)x, &x->patcherPtr, x->patcherContext, x->patcherClass, x->patcherName);
	
	if (!jamoma_subscriber_create((ObjectPtr)x, NULL, kTTAdrsEmpty, &x->subscriberObject, returnedAddress, &returnedNode, &returnedContextNode)) {
        
		// get the context address to make
		// a receiver on the contextAddress/model:address attribute
		x->subscriberObject->getAttributeValue(TTSymbol("contextAddress"), v);
		contextAddress = v[0];
	}
	
	// bind on the model:address attribute
	if (contextAddress != kTTAdrsEmpty) {
		
		absoluteAddress = contextAddress.appendAddress(x->address);
		x->wrappedObject->setAttributeValue(kTTSym_address, x->address);
		
		makeInternals_receiver(x, contextAddress, TTSymbol("/model:address"), gensym("return_model_address"), &anObject, YES); // YES : we want to deferlow this method
		anObject->sendMessage(kTTSym_Get);
	}
	
	// while the context node is not registered : try to binds again :(
	// (to -- this is not a good way todo. For binding we should make a subscription
	// to a notification mechanism and each time an TTObjet subscribes to the namespace
	// using jamoma_subscriber_create we notify all the externals which have used
	// jamoma_subscriber_create with NULL object to bind)
	else {
		
		// release the subscriber
		TTObjectBaseRelease(TTObjectBaseHandle(&x->subscriberObject));
		x->subscriberObject = NULL;
		
		// The following must be deferred because we have to interrogate our box,
		// and our box is not yet valid until we have finished instantiating the object.
		// Trying to use a loadbang method instead is also not fully successful (as of Max 5.0.6)
		defer_low((ObjectPtr)x, (method)cue_subscribe, NULL, 0, 0);
	}
}

void cue_return_model_address(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTAddress   absoluteAddress;
	
	if (argc && argv) {
		
		// set address attribute of the wrapped Receiver object
		absoluteAddress = TTAddress(atom_getsym(argv)->s_name).appendAddress(x->address);
		x->wrappedObject->setAttributeValue(kTTSym_address, absoluteAddress);
	}
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

void cue_return_value(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	
	// avoid blank before line
	if (msg == _sym_nothing)
		outlet_atoms(x->outlets[line_out], argc, argv);
	else
		outlet_anything(x->outlets[line_out], msg, argc, argv);
}

void cue_return_order(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	outlet_anything(x->outlets[dump_out], gensym("order"), argc, argv);
}

void cue_get(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
    WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
    TTHashPtr   allCues;
	TTValue     v;
	TTSymbol    name, attribute;
    TTObjectBasePtr cue;
    AtomCount	ac = 0;
	AtomPtr		av = NULL;
    
    if (argc == 2) {
        
        if (atom_gettype(argv) == A_SYM && atom_gettype(argv+1) == A_SYM) {
            
            attribute = TTSymbol((char*)atom_getsym(argv)->s_name);
            name = TTSymbol((char*)atom_getsym(argv+1)->s_name);
            
            // get cue object table
            x->wrappedObject->getAttributeValue("cues", v);
            allCues = TTHashPtr((TTPtr)v[0]);
            
            if (allCues) {
                
                // get cue
                if (!allCues->lookup(name, v)) {
                    
                    cue = v[0];
                    if (!cue->getAttributeValue(attribute, v)) {
                        
                        v.prepend(name);
                        jamoma_ttvalue_to_Atom(v, &ac, &av);
                        
                        object_obex_dumpout(self, atom_getsym(argv), ac, av);
                    }
                    else
                        object_error((ObjectPtr)x, "%s attribute does'nt exist", atom_getsym(argv)->s_name);
                }
                else
                    object_error((ObjectPtr)x, "%s cue does'nt exist", atom_getsym(argv+1)->s_name);
            }
        }
    }
}

void cue_set(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
    WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
    TTHashPtr   allCues;
	TTValue     v;
	TTSymbol    name, attribute;
    TTObjectBasePtr cue;
    
    if (argc >= 2) {
        
        if (atom_gettype(argv) == A_SYM && atom_gettype(argv+1) == A_SYM) {
            
            attribute = TTSymbol((char*)atom_getsym(argv)->s_name);
            name = TTSymbol((char*)atom_getsym(argv+1)->s_name);
            
            // get cue object table
            x->wrappedObject->getAttributeValue("cues", v);
            allCues = TTHashPtr((TTPtr)v[0]);
            
            if (allCues) {
                
                // get cue
                if (!allCues->lookup(name, v)) {
                    
                    cue = v[0];
                    
                    // prepare value to set
                    jamoma_ttvalue_from_Atom(v, _sym_nothing, argc-2, argv+2);
                    
                    if (cue->setAttributeValue(attribute, v))
                        object_error((ObjectPtr)x, "%s attribute does'nt exist", atom_getsym(argv)->s_name);
                }
                else
                    object_error((ObjectPtr)x, "%s cue does'nt exist", atom_getsym(argv+1)->s_name);
            }
        }
    }
}

void cue_read(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	defer(self, (method)cue_doread, msg, argc, argv);
}

void cue_doread(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{	
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTValue			o, v, none;
	TTSymbol		fullpath;
	TTTextHandlerPtr	aTextHandler = NULL;
	TTErr			tterr;
	
	if (x->wrappedObject) {
		
		fullpath = jamoma_file_read((ObjectPtr)x, argc, argv, (t_fourcc)'TEXT');
		v.append(fullpath);
		
		tterr = x->internals->lookup(kTTSym_TextHandler, o);
		
		if (!tterr) {
			
			aTextHandler = TTTextHandlerPtr((TTObjectBasePtr)o[0]);
            
            o = TTValue(x->wrappedObject);
			aTextHandler->setAttributeValue(kTTSym_object, o);
			
			critical_enter(0);
			tterr = aTextHandler->sendMessage(kTTSym_Read, v, none);
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
	TTValue			o, v, none;
	TTTextHandlerPtr	aTextHandler = NULL;
	TTErr			tterr;
	
	if (x->wrappedObject) {
		
		tterr = x->internals->lookup(kTTSym_TextHandler, o);
		
		if (!tterr) {
			
			aTextHandler = TTTextHandlerPtr((TTObjectBasePtr)o[0]);
            
            o = TTValue(x->wrappedObject);
			aTextHandler->setAttributeValue(kTTSym_object, o);
			
			critical_enter(0);
			tterr = aTextHandler->sendMessage(kTTSym_ReadAgain, v, none);
			critical_exit(0);
			
			if (!tterr)
				object_obex_dumpout(self, _sym_read, 0, NULL);
			else
				object_obex_dumpout(self, _sym_error, 0, NULL);
		}
	}
}

void cue_write(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	defer(self, (method)cue_dowrite, msg, argc, argv);
}

void cue_dowrite(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	char 			filename[MAX_FILENAME_CHARS];
	TTSymbol		fullpath;
	TTValue			o, v, none;
	TTTextHandlerPtr	aTextHandler;
	TTErr			tterr;
	
	if (x->wrappedObject) {
		
		// Default TEXT File Name
		snprintf(filename, MAX_FILENAME_CHARS, "untitled.cues.txt");
		
		fullpath = jamoma_file_write((ObjectPtr)x, argc, argv, filename);
		v.append(fullpath);
		
		tterr = x->internals->lookup(kTTSym_TextHandler, o);
		
		if (!tterr) {
			aTextHandler = TTTextHandlerPtr((TTObjectBasePtr)o[0]);
            
            o = TTValue(x->wrappedObject);
			aTextHandler->setAttributeValue(kTTSym_object, o);
			
			critical_enter(0);
			tterr = aTextHandler->sendMessage(kTTSym_Write, v, none);
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
	TTValue			o, v, none;
	TTTextHandlerPtr	aTextHandler = NULL;
	TTErr			tterr;
	
	if (x->wrappedObject) {
		
		tterr = x->internals->lookup(kTTSym_TextHandler, o);
		
		if (!tterr) {
			
			aTextHandler = TTTextHandlerPtr((TTObjectBasePtr)o[0]);
            
            o = TTValue(x->wrappedObject);
			aTextHandler->setAttributeValue(kTTSym_object, o);
			
			critical_enter(0);
			tterr = aTextHandler->sendMessage(kTTSym_WriteAgain, v, none);
			critical_exit(0);
			
			if (!tterr)
				object_obex_dumpout(self, _sym_write, 0, NULL);
			else
				object_obex_dumpout(self, _sym_error, 0, NULL);
		}
	}
}

void cue_dorecall(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTValue			v, none;
	TTNodePtr		contextNode;
	TTObjectBasePtr	o;
	TTBoolean		initialized;
	
	if (argc && argv) {
		if (atom_gettype(argv) == A_SYM) {
			v = TTValue((TTPtr)atom_getsym(argv));
			x->wrappedObject->sendMessage(kTTSym_Recall, v, none);
		}
		
		// Check Context Node
		if (x->subscriberObject) {
			
			x->subscriberObject->getAttributeValue(TTSymbol("contextNode"), v);
			contextNode = TTNodePtr((TTPtr)v[0]);
			
			// If it is a none initialized Container : initialize it
            o = contextNode->getObject();
			if (o) {
                
				if (o->getName() == kTTSym_Container) {
					
					o->getAttributeValue(kTTSym_initialized, v);
					initialized = v[0];
					
					if (!initialized)
						o->sendMessage(kTTSym_Init);
				}
            }
		}
	}
}

void cue_edit(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTString			*buffer;
	char				title[MAX_FILENAME_CHARS];
	TTTextHandlerPtr	aTextHandler = NULL;
	TTHashPtr			allCues;
	TTValue				v, o, args, none;
	TTSymbol			name = kTTSymEmpty;
    t_atom				a;
	TTErr				tterr;
	
	// choose object to edit : default the cuelist
	EXTRA->toEdit = x->wrappedObject;
	EXTRA->cueName = kTTSymEmpty;
	
	if (argc && argv) {
		
		if (atom_gettype(argv) == A_LONG) {
			
			// get cues order
			x->wrappedObject->getAttributeValue(TTSymbol("order"), v);
			
			if (atom_getlong(argv) <= v.size())
				v.get(atom_getlong(argv)-1, name);
			else {
				object_error((ObjectPtr)x, "%d does'nt exist", atom_getlong(argv));
				return;
			}
		}
		else if (atom_gettype(argv) == A_SYM)
			name = TTSymbol(atom_getsym(argv)->s_name);
		
		if (name != kTTSymEmpty) {
			
			// get cue object table
			x->wrappedObject->getAttributeValue(TTSymbol("cues"), v);
			allCues = TTHashPtr((TTPtr)v[0]);
			
			if (allCues) {
				
				// get cue to edit
				if (!allCues->lookup(name, v)) {
					
					// edit a cue
					EXTRA->toEdit = v[0];
					EXTRA->cueName = name;
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
			tterr = aTextHandler->sendMessage(kTTSym_Write, args, none);
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
	
	defer_low((ObjectPtr)x, (method)cue_doedit, NULL, 0, NULL);
}

void cue_doedit(TTPtr self)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTTextHandlerPtr	aTextHandler = NULL;
	TTValue				o, args, none;
    t_atom				a;
	TTErr				tterr;
	
	// get the buffer handler
	tterr = x->internals->lookup(kTTSym_TextHandler, o);
	
	if (!tterr) {
		
		aTextHandler = TTTextHandlerPtr((TTObjectBasePtr)o[0]);
		
		critical_enter(0);
		args = TTValue((TTPtr)EXTRA->text);
		tterr = aTextHandler->sendMessage(kTTSym_Read, args, none);
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
	EXTRA->toEdit = x->wrappedObject;
	EXTRA->cueName = kTTSymEmpty;
}

t_max_err cue_get_relative(TTPtr self, TTPtr attr, AtomCount *ac, AtomPtr *av)
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
	
	atom_setlong(*av, x->index);
	
	return MAX_ERR_NONE;
}

t_max_err cue_set_relative(TTPtr self, TTPtr attr, AtomCount ac, AtomPtr av)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	
	if (ac&&av) {
		x->index = atom_getlong(av);
		
		if (x->index) {
			// The following must be deferred because we have to interrogate our box,
			// and our box is not yet valid until we have finished instantiating the object.
			// Trying to use a loadbang method instead is also not fully successful (as of Max 5.0.6)
			defer_low((ObjectPtr)x, (method)cue_subscribe, NULL, 0, 0);
		}
		
	} else {
		// no args
		x->index = 0;
	}
	return MAX_ERR_NONE;
}
