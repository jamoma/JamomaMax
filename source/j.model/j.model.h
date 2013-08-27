/* 
 * j.model | view
 * External for Jamoma : the main control center of a model | view patcher
 * By Tim Place and Théo de la Hogue, Copyright � 2010
 * 
 * License: This code is licensed under the terms of the "New BSD License"
 * http://creativecommons.org/licenses/BSD/
 */

#include "TTModularClassWrapperMax.h"

// This is used to store extra data
typedef struct extra {
	ObjectPtr			modelInternal;		// store an internal model patcher
	TTAddress           modelAddress;		// store the /model/address parameter
	TTBoolean			component;			// is the model a simple component ?
    
    TTString            *text;				// the text of the editor to read after edclose
	ObjectPtr           textEditor;			// the text editor window
    
    TTObjectBasePtr     presetManager;		// the preset manager object
    TTBoolean           attr_load_default;
	TTPtr               filewatcher;		// a preset filewather
	TTObjectBasePtr     toEdit;				// the object to edit (a preset or all the preset list)
	TTSymbol            presetName;			// the name of the edited preset
} t_extra;
#define EXTRA ((t_extra*)x->extra)

#define data_out 0
#define dump_out 1

// Definitions
void		WrapTTContainerClass(WrappedClassPtr c);
void		WrappedContainerClass_new(TTPtr self, AtomCount argc, AtomPtr argv);
void		WrappedContainerClass_free(TTPtr self);
void		WrappedContainerClass_anything(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);

void		model_assist(TTPtr self, void *b, long msg, long arg, char *dst);

void		model_share_patcher_info(TTPtr self, TTValuePtr patcherInfo);
void		model_share_patcher_node(TTPtr self, TTNodePtr *patcherNode);

void		model_return_address(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);
void		model_return_value(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);

void		model_subscribe(TTPtr self);
void		model_subscribe_view(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);

void		model_init(TTPtr self);

void		model_list(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);

void		model_help(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);
void		model_reference(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);
void		model_open(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);
//void		model_mute(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);
void		model_address(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);		// only in view patch

void		model_autodoc(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);
void		model_doautodoc(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);

//void		model_edit(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);
//void		model_edclose(TTPtr self, char **text, long size);
//void		model_doedit(TTPtr self);

//void		model_preset_return_value(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);
void		model_preset_return_order(TTPtr self, t_symbol *msg, long argc, t_atom *argv);
void		model_preset_filechanged(TTPtr self, char *filename, short path);

void		model_preset_read(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);
void		model_preset_doread(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);
void		model_preset_read_again(TTPtr self);
void		model_preset_doread_again(TTPtr self);
void		model_preset_write(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);
void		model_preset_dowrite(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);
void		model_preset_write_again(TTPtr self);
void		model_preset_dowrite_again(TTPtr self);
void		model_preset_default(TTPtr self);
void		model_preset_dorecall(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);

void		model_preset_edit(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);
void		model_preset_edclose(TTPtr self, char **text, long size);
void		model_preset_doedit(TTPtr self);

void		model_preset_subscribe(TTPtr self, TTAddress modelAddress);

t_max_err	model_preset_get_load_default(TTPtr self, TTPtr attr, AtomCount *ac, AtomPtr *av);
t_max_err	model_preset_set_load_default(TTPtr self, TTPtr attr, AtomCount ac, AtomPtr av);
