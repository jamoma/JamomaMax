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
} t_extra;
#define EXTRA ((t_extra*)x->extra)


// Definitions
void	WrapTTScoreClass(WrappedClassPtr c);
void	WrappedScoreClass_new(TTPtr self, long argc, t_atom *argv);
void	WrappedScoreClass_free(TTPtr self);

void	score_assist(TTPtr self, void *b, long msg, long arg, char *dst);

void	score_read(TTPtr self, t_symbol *msg, long argc, t_atom *argv);
void	score_doread(TTPtr self, t_symbol *msg, long argc, t_atom *argv);
void	score_read_again(TTPtr self);
void	score_doread_again(TTPtr self);

void	score_write(TTPtr self, t_symbol *msg, long argc, t_atom *argv);
void	score_dowrite(TTPtr self, t_symbol *msg, long argc, t_atom *argv);
void	score_write_again(TTPtr self);
void	score_dowrite_again(TTPtr self);

void	score_edit(TTPtr self, t_symbol *msg, long argc, const t_atom *argv);
void	score_edclose(TTPtr self, char **text, long size);
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
    
    // fill application manager and scenario
    EXTRA->xmlHandler->set(kTTSym_object, TTValue(EXTRA->applicationManager, x->wrappedObject));
	
    // read attributes
	if (attrstart && argv)
        attr_args_process(x, argc, argv);
}

void WrappedScoreClass_free(TTPtr self)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
    
	free(EXTRA);
}

// Method for Assistance Messages
void score_assist(TTPtr self, void *b, long msg, long arg, char *dst)
{
	if (msg==1) 						// Inlet
		strcpy(dst, "input");
	else {								// Outlets
		switch(arg) {
			case dump_out:
				strcpy(dst, "dumpout");
				break;
		}
 	}
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
        critical_enter(0);
        TTErr err = EXTRA->xmlHandler->send(kTTSym_Read, jamoma_file_read((t_object*)x, argc, argv, 0));
        critical_exit(0);
        
        if (!err)
            object_obex_dumpout(self, _sym_read, argc, argv);
        else
            object_obex_dumpout(self, _sym_error, 0, NULL);
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
		// default xml file name
        char filename[MAX_FILENAME_CHARS];
		snprintf(filename, MAX_FILENAME_CHARS, "untitled.score");
		
        critical_enter(0);
        TTErr err = EXTRA->xmlHandler->send(kTTSym_Write, jamoma_file_write((t_object*)x, argc, argv, filename));
        critical_exit(0);
        
        if (!err)
            object_obex_dumpout(self, _sym_write, argc, argv);
        else
            object_obex_dumpout(self, _sym_error, 0, NULL);
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
        critical_enter(0);
        TTErr err = EXTRA->xmlHandler->send(kTTSym_WriteAgain);
        critical_exit(0);
        
        if (!err)
            object_obex_dumpout(self, _sym_write, 0, NULL);
        else
            object_obex_dumpout(self, _sym_error, 0, NULL);
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

