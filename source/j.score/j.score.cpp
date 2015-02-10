/** @file
 *
 * @ingroup implementationMaxExternals
 *
 * @brief j.score - external to handle a score project localy or remotely
 *
 * @details
 *
 * @author Théo de la Hogue
 *
 * @copyright Copyright © 2014, Théo de la Hogue @n
 * This code is licensed under the terms of the "CeCILL-C" @n
 * http://www.cecill.info
 */


#include "TTModularClassWrapperMax.h"
#include "TTScore.h"

#define dump_out 0

// This is used to store extra data
typedef struct extra
{
    TTObject    *applicationManager;// TTModularApplicationManager object
    TTObject    *xmlHandler;        // read/write .score file format
    TTObject    *textHandler;       // read/write from/to text editor
	TTString	*text;				// the text of the editor to read after edclose
	t_object*	textEditor;			// the text editor window
    TTPtr       filewatcher;		// a .score filewatcher
} t_extra;
#define EXTRA ((t_extra*)x->extra)


/** Set up what methods (Max messages) that the wrapped class is to respond to.
 @param c			Pointer to the wrapped class.
 */
void	WrapTTScoreClass(WrappedClassPtr c);

/** Constructor: Initiate the wrapped object instance.
 @param self		Pointer to the object.
 @param argc		The number of arguments to the new object instance
 @param argv		Pointer to the array of atoms containing the arguments to the object instance.
 */
void	WrappedScoreClass_new(TTPtr self, long argc, t_atom *argv);

/** Deconstructor: Destroy the object and free memory assigned to it.
 @param self		Pointer to the object.
 */
void	WrappedScoreClass_free(TTPtr self);

/** Display assist messages for inlets and outlets in Max.
 @param self		Pointer to the object.
 @param b			This does not seem to be used.
 @param msg			"1" if we are to display assist message for an inlet, else we are to display assist message for an outlet.
 @param arg			The number of the inlet or outlet that we are to display assist message for. 0 is the leftmost.
 @param dst			Pointer to the destination used for displaying the assist message.
 */
void	score_assist(TTPtr self, void *b, long msg, long arg, char *dst);

/**
 @param self
 @param filename
 @param path
 */
void    score_filechanged(TTPtr self, char *filename, short path);

/**
 @param self
 @param msg
 @param argc
 @param argv
 */
void	score_read(TTPtr self, t_symbol *msg, long argc, t_atom *argv);

/**
 @param self
 @param msg
 @param argc
 @param argv
 */
void	score_doread(TTPtr self, t_symbol *msg, long argc, t_atom *argv);

/**
 @param self
 */
void	score_read_again(TTPtr self);

/**
 @param self
 */
void	score_doread_again(TTPtr self);

/**
 @param self
 @param msg
 @param argc
 @param argv
 */
void	score_write(TTPtr self, t_symbol *msg, long argc, t_atom *argv);

/**
 @param self
 @param msg
 @param argc
 @param argv
 */
void	score_dowrite(TTPtr self, t_symbol *msg, long argc, t_atom *argv);

/**
 @param self
 */
void	score_write_again(TTPtr self);

/**
 @param self
 */
void	score_dowrite_again(TTPtr self);

/**
 @param self
 @param msg
 @param argc
 @param argv
 */
void	score_edit(TTPtr self, t_symbol *msg, long argc, const t_atom *argv);

/**
 @param self
 @param text
 @param size
 */
void	score_edclose(TTPtr self, char **text, long size);

/**
 @param self
 */
void	score_doedit(TTPtr self);

int C74_EXPORT main(void)
{
	ModularSpec *spec = new ModularSpec;
	spec->_wrap = &WrapTTScoreClass;
	spec->_new = &WrappedScoreClass_new;
	spec->_any = NULL;
	spec->_free = &WrappedScoreClass_free;
	
    // wrap Scenario class
    TTSymbol kTTSym_Scenario = TTSymbol("Scenario");
	return wrapTTModularClassAsMaxClass(kTTSym_Scenario, "j.score", NULL, spec);
}

void WrapTTScoreClass(WrappedClassPtr c)
{
	class_addmethod(c->maxClass, (method)score_assist,					"assist",               A_CANT, 0L);
    class_addmethod(c->maxClass, (method)score_filechanged,             "filechanged",			A_CANT, 0);
	
    class_addmethod(c->maxClass, (method)score_read,					"read",					A_GIMME, 0);
	class_addmethod(c->maxClass, (method)score_write,					"write",				A_GIMME, 0);
	class_addmethod(c->maxClass, (method)score_edit,					"edit",					A_GIMME, 0);
	
	class_addmethod(c->maxClass, (method)score_read_again,              "read/again",			0);
	class_addmethod(c->maxClass, (method)score_write_again,             "write/again",			0);
}

void WrappedScoreClass_new(TTPtr self, long argc, t_atom *argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
 	long						attrstart = attr_args_offset(argc, argv);			// support normal arguments
    
	// j.score
	if (attrstart)
    {
        ;
	}
    
    // create main scenario
    x->wrappedObject = TTObject("Scenario");
	
	// prepare extra data
	x->extra = (t_extra*)malloc(sizeof(t_extra));
    EXTRA->applicationManager = new TTObject(TTModularApplicationManager);
    EXTRA->xmlHandler = new TTObject(kTTSym_XmlHandler);
	EXTRA->textHandler = new TTObject(kTTSym_TextHandler);
	EXTRA->text = NULL;
	EXTRA->textEditor = NULL;
    EXTRA->filewatcher = NULL;
    
    // fill application manager and scenario
    EXTRA->xmlHandler->set(kTTSym_object, TTValue(EXTRA->applicationManager, x->wrappedObject));
	
    // read attributes
	if (attrstart && argv)
        attr_args_process(x, argc, argv);
}

void WrappedScoreClass_free(TTPtr self)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
    
    // stop the score
    x->wrappedObject.send("End");
    
    // delete filewatcher
	if (EXTRA->filewatcher)
    {
		filewatcher_stop(EXTRA->filewatcher);
		object_free(EXTRA->filewatcher);
	}
    
	free(EXTRA);
}

// Method for Assistance Messages
void score_assist(TTPtr self, void *b, long msg, long arg, char *dst)
{
	if (msg==1) 						// Inlet
		strcpy(dst, "input");
	else {								// Outlets
		switch(arg)
        {
			case dump_out:
				strcpy(dst, "dumpout");
				break;
		}
 	}
}

void score_filechanged(TTPtr self, char *filename, short path)
{
	char 		fullpath[MAX_PATH_CHARS];		// path and name passed on to the xml parser
	char		posixpath[MAX_PATH_CHARS];
	t_atom		a;
	
	path_topathname(path, filename, fullpath);
	path_nameconform(fullpath, posixpath, PATH_STYLE_NATIVE, PATH_TYPE_BOOT);
	
	atom_setsym(&a, gensym(posixpath));
	defer_low(self, (method)score_doread, gensym("read"), 1, &a);
}

void score_read(TTPtr self, t_symbol *msg, long argc, t_atom *argv)
{
	defer(self, (method)score_doread, msg, argc, argv);
}

void score_doread(TTPtr self, t_symbol *msg, long argc, t_atom *argv)
{
	WrappedModularInstancePtr x = (WrappedModularInstancePtr)self;

	if (x->wrappedObject.valid())
    {
        // stop the score
        x->wrappedObject.send("End");
        
        TTSymbol filepath = jamoma_file_read((t_object*)x, argc, argv, 0);
        
        critical_enter(0);
        TTErr err = EXTRA->xmlHandler->send(kTTSym_Read, filepath);
        critical_exit(0);
        
        if (!err)
            object_obex_dumpout(self, _sym_read, argc, argv);
        else
            object_obex_dumpout(self, _sym_error, 0, NULL);
        
        // replace filewatcher
		if (EXTRA->filewatcher)
        {
			filewatcher_stop(EXTRA->filewatcher);
			object_free(EXTRA->filewatcher);
		}
        
        short       outvol;
        t_fourcc	outtype, filetype = 'TEXT';
        
        if (locatefile_extended((char*)filepath.c_str(), &outvol, &outtype, &filetype, 0))
			return;
		
		EXTRA->filewatcher = filewatcher_new((t_object*)x, outvol, (char*)filepath.c_str());
		filewatcher_start(EXTRA->filewatcher);
	}
}

void score_read_again(TTPtr self)
{
	defer(self, (method)score_doread_again, NULL, 0, NULL);
}

void score_doread_again(TTPtr self)
{
	WrappedModularInstancePtr x = (WrappedModularInstancePtr)self;
    
	if (x->wrappedObject.valid())
    {
        // stop the score
        x->wrappedObject.send("End");
        
        critical_enter(0);
        TTErr err = EXTRA->xmlHandler->send(kTTSym_ReadAgain);
        critical_exit(0);
        
        if (!err)
            object_obex_dumpout(self, _sym_read, 0, NULL);
        else
            object_obex_dumpout(self, _sym_error, 0, NULL);
	}
}

void score_write(TTPtr self, t_symbol *msg, long argc, t_atom *argv)
{
	defer(self, (method)score_dowrite, msg, argc, argv);
}

void score_dowrite(TTPtr self, t_symbol *msg, long argc, t_atom *argv)
{
	WrappedModularInstancePtr x = (WrappedModularInstancePtr)self;
	
	if (x->wrappedObject.valid())
    {
        // stop filewatcher
        if (EXTRA->filewatcher)
            filewatcher_stop(EXTRA->filewatcher);
        
		// default xml file name
        char filename[MAX_FILENAME_CHARS];
		snprintf(filename, MAX_FILENAME_CHARS, "untitled.score");
        
        TTSymbol filepath = jamoma_file_write((t_object*)x, argc, argv, filename);
		
        critical_enter(0);
        TTErr err = EXTRA->xmlHandler->send(kTTSym_Write, filepath);
        critical_exit(0);
        
        if (!err)
            object_obex_dumpout(self, _sym_write, argc, argv);
        else
            object_obex_dumpout(self, _sym_error, 0, NULL);
        
        // replace filewatcher
		if (EXTRA->filewatcher)
        {
			filewatcher_stop(EXTRA->filewatcher);
			object_free(EXTRA->filewatcher);
		}
        
        short       outvol;
        t_fourcc	outtype, filetype = 'TEXT';
        
        if (locatefile_extended((char*)filepath.c_str(), &outvol, &outtype, &filetype, 0))
			return;
		
		EXTRA->filewatcher = filewatcher_new((t_object*)x, outvol, (char*)filepath.c_str());
		filewatcher_start(EXTRA->filewatcher);
	}
}

void score_write_again(TTPtr self)
{
	defer(self, (method)score_dowrite_again, NULL, 0, NULL);
}

void score_dowrite_again(TTPtr self)
{
	WrappedModularInstancePtr x = (WrappedModularInstancePtr)self;
	
	if (x->wrappedObject.valid())
    {
        // stop filewatcher
        if (EXTRA->filewatcher)
            filewatcher_stop(EXTRA->filewatcher);
        
        critical_enter(0);
        TTErr err = EXTRA->xmlHandler->send(kTTSym_WriteAgain);
        critical_exit(0);
        
        if (!err)
            object_obex_dumpout(self, _sym_write, 0, NULL);
        else
            object_obex_dumpout(self, _sym_error, 0, NULL);
        
        // start filewatcher
        if (EXTRA->filewatcher)
            filewatcher_start(EXTRA->filewatcher);
	}
}

void score_edit(TTPtr self, t_symbol *msg, long argc, const t_atom *argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTString    *buffer;
	char        title[MAX_FILENAME_CHARS];
    t_atom      a;
	
	// find event's state to edit it in text format
	if (argc && argv)
    {
		if (atom_gettype(argv) == A_SYM)
        {
            TTBoolean found = NO;
            
			// get all scenario events
            TTValue events;
			x->wrappedObject.get("timeEvents", events);
            
            for (TTElementIter it = events.begin(); it != events.end(); it++)
            {
                TTObject event = TTElement(*it);
                TTSymbol name;
                event.get("name", name);
                
                if (name == TTSymbol(atom_getsym(argv)->s_name))
                {
                    TTObject state;
                    event.get("state", state);
                    EXTRA->textHandler->set(kTTSym_object, state);
                    found = YES;
                }
            }
            
            if (!found)
            {
                object_error((t_object*)x, "%s event does'nt exist", atom_getsym(argv)->s_name);
                return;
            }
		}
	}
    
	// only one editor can be open in the same time
	if (!EXTRA->textEditor)
    {
		EXTRA->textEditor = (t_object*)object_new(_sym_nobox, _sym_jed, x, 0);
		
        // write state content into a string buffer
		buffer = new TTString();
		
        critical_enter(0);
        TTErr err = EXTRA->textHandler->send(kTTSym_Write, (TTPtr)buffer);
        critical_exit(0);

		// pass the string buffer to the editor
		object_method(EXTRA->textEditor, _sym_settext, buffer->c_str(), _sym_utf_8);
		object_attr_setchar(EXTRA->textEditor, gensym("scratch"), 1);
		
		snprintf(title, MAX_FILENAME_CHARS, "state editor");
		object_attr_setsym(EXTRA->textEditor, _sym_title, gensym(title));
        
        if (err)
        {
            // output error
            object_obex_dumpout(self, _sym_error, 0, NULL);
        }
        else
        {
            // output a flag
            atom_setsym(&a, gensym("opened"));
            object_obex_dumpout(self, gensym("editor"), 1, &a);
        }
		
		buffer->clear();
		delete buffer;
		buffer = NULL;
	}
}

void score_edclose(TTPtr self, char **text, long size)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	
	EXTRA->text = new TTString(*text);
	EXTRA->textEditor = NULL;
	
	defer_low((t_object*)x, (method)score_doedit, NULL, 0, NULL);
}

void score_doedit(TTPtr self)
{
	WrappedModularInstancePtr x = (WrappedModularInstancePtr)self;
    t_atom a;
	
	// get the string buffer
    critical_enter(0);
    TTErr err = EXTRA->textHandler->send(kTTSym_Read, (TTPtr)EXTRA->text);
    critical_exit(0);
		
    if (err)
    {
        // output error
        object_obex_dumpout(self, _sym_error, 0, NULL);
    }
    else
    {
        // output a flag
        atom_setsym(&a, gensym("closed"));
        object_obex_dumpout(self, gensym("editor"), 1, &a);
    }
	
	delete EXTRA->text;
	EXTRA->text = NULL;
	EXTRA->textEditor = NULL;
}

