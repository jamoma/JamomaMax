/** @file
 *
 * @ingroup implementationMaxExternals
 *
 * @brief j.model / j.view - The main control center of Jamoma model and view patcher
 *
 * @details
 *
 * @authors Tim Place, Théo de la Hogue, Trond Lossius
 *
 * @copyright Copyright © 2010 by Tim Place and Théo de la Hogue @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */


#include "TTModularClassWrapperMax.h"
#include "jpatcher_api.h"
#include "TTModelInfo.h"

/** Data structure for storing extra data.
 @ingroup typedefs
 */
typedef struct extra {
	TTObject            *modelInfo;
    TTAddress           containerAddress;   ///< Store the address of the container (see in model_subscribe and model_free).
    TTAddress           argAddress;         ///< Store the address from the argument (see in model_upper_view_model_address).
    
    TTString            *text;				///< The text of the editor to read after edclose.
	t_object            *textEditor;		///< The text editor window.
    
    TTObject            *presetManager;		///< The preset manager object.
    TTBoolean           attr_load_default;
	TTPtr               filewatcher;		///< A preset filewatcher.
	TTObject            *toEdit;			///< The object to edit (a preset or all the preset list).
	TTSymbol            presetName;			///< The name of the edited preset.
    
    TTHashPtr           attr_amenities;
    TTBoolean           all_amenities;
    TTBoolean           no_amenities;
} t_extra;
#define EXTRA ((t_extra*)x->extra)

#define data_out 0
#define dump_out 1


/** Set up what methods (Max messages) that the wrapped class is to respond to.
 @param c			Pointer to the wrapped class.
 */
void		WrapTTContainerClass(WrappedClassPtr c);


/** Constructor: Initiate the wrapped object instance.
 @param self		Pointer to the object.
 @param argc		The number of arguments to the new object instance
 @param argv		Pointer to the array of atoms containing the arguments to the object instance.
 */
void		WrappedContainerClass_new(TTPtr self, long argc, t_atom *argv);


/** Deconstructor: Destroy the object and free memory assigned to it.
 @param self		Pointer to the object.
 */
void		WrappedContainerClass_free(TTPtr self);


/**
 @param self		Pointer to the object.
 @param msg			The message sent to the object.
 @param argc		The number of arguments of the message.
 @param argv		The arguments of the message as an array of atoms.
 */
void		WrappedContainerClass_anything(TTPtr self, t_symbol *msg, long argc, t_atom *argv);


/** Display assist messages for inlets and outlets in Max.
 @param self		Pointer to the object.
 @param b			This does not seem to be used.
 @param msg			"1" if we are to display assist message for an inlet, else we are to display assist message for an outlet.
 @param arg			The number of the inlet or outlet that we are to display assist message for. 0 is the leftmost.
 @param dst			Pointer to the destination used for displaying the assist message.
 */
void		model_assist(TTPtr self, void *b, long msg, long arg, char *dst);


/**
 @param self
 @param patcherInfo
 */
void		model_share_patcher_info(TTPtr self, TTValuePtr patcherInfo);


/**
 @param self
 @param patcherNode
 */
void		model_share_patcher_node(TTPtr self, TTNodePtr *patcherNode);


/**
 @param self
 @param msg
 @param argc
 @param argv
 */
void		model_return_address(TTPtr self, t_symbol *msg, long argc, t_atom *argv);



/**
 @param self
 @param msg
 @param argc
 @param argv
 */
void		model_return_value(TTPtr self, t_symbol *msg, long argc, t_atom *argv);


/**
 @param self
 */
void		model_subscribe(TTPtr self);


/**
 @param self
 @param msg
 @param argc
 @param argv
 */
void		model_subscribe_view(TTPtr self, t_symbol *msg, long argc, t_atom *argv);


/**
 @param self
 @param msg
 @param argc
 @param argv
 */
void        model_return_upper_view_model_address(TTPtr self, t_symbol *msg, long argc, t_atom *argv);


/**
 @param self
 */
void		model_init(TTPtr self);


/**
 @param self
 @param msg
 @param argc
 @param argv
 */
void		model_address(TTPtr self, t_symbol *msg, long argc, t_atom *argv);		// only in view patch


/**
 @param self
 @param msg
 @param argc
 @param argv
 */
void		model_reference_write(TTPtr self, t_symbol *msg, long argc, t_atom *argv);


/**
 @param self
 @param msg
 @param argc
 @param argv
 */
void		model_reference_dowrite(TTPtr self, t_symbol *msg, long argc, t_atom *argv);


/**
 @param self
 */
void		model_preset_amenities(TTPtr self);


/**
 @param self
 @param msg
 @param argc
 @param argv
 */
void		model_preset_return_names(TTPtr self, t_symbol *msg, long argc, t_atom *argv);


/**
 @param self
 @param filename
 @param path
 */
void		model_preset_filechanged(TTPtr self, char *filename, short path);


/**
 @param self
 @param msg
 @param argc
 @param argv
 */
void		model_preset_read(TTPtr self, t_symbol *msg, long argc, t_atom *argv);


/**
 @param self
 @param msg
 @param argc
 @param argv
 */
void		model_preset_doread(TTPtr self, t_symbol *msg, long argc, t_atom *argv);


/**
 @param self
 */
void		model_preset_read_again(TTPtr self);


/**
 @param self
 */
void		model_preset_doread_again(TTPtr self);


/**
 @param self
 @param msg
 @param argc
 @param argv
 */
void		model_preset_write(TTPtr self, t_symbol *msg, long argc, t_atom *argv);


/**
 @param self
 @param msg
 @param argc
 @param argv
 */
void		model_preset_dowrite(TTPtr self, t_symbol *msg, long argc, t_atom *argv);


/**
 @param self
 */
void		model_preset_write_again(TTPtr self);


/**
 @param self
 */
void		model_preset_dowrite_again(TTPtr self);


/**
 @param self
 */
void		model_preset_default(TTPtr self);


/**
 @param self
 @param msg
 @param argc
 @param argv
 */
void		model_preset_dorecall(TTPtr self, t_symbol *msg, long argc, t_atom *argv);


/**
 @param self
 @param msg
 @param argc
 @param argv
 */
void		model_preset_edit(TTPtr self, t_symbol *msg, long argc, const t_atom *argv);


/**
 @param self
 @param text
 @param size
 */
void		model_preset_edclose(TTPtr self, char **text, long size);


/**
 @param self
 */
void		model_preset_doedit(TTPtr self);


/**
 @param self
 @param attr
 @param ac
 @param av
 */
t_max_err	model_preset_get_load_default(TTPtr self, TTPtr attr, long *ac, t_atom **av);


/**
 @param self
 @param attr
 @param ac
 @param av
 */
t_max_err	model_preset_set_load_default(TTPtr self, TTPtr attr, long ac, const t_atom *av);


/**
 @param self
 @param attr
 @param ac
 @param av
 */
t_max_err	model_get_amenities(TTPtr self, TTPtr attr, long *ac, t_atom **av);


/**
 @param self
 @param attr
 @param ac
 @param av
 */
t_max_err	model_set_amenities(TTPtr self, TTPtr attr, long ac, t_atom *av);


/**
 @param self
 @param name
 */
TTBoolean   model_test_amenities(TTPtr self, TTSymbol name);


/**
 @param self
 @param attr
 @param argc
 @param argv
 */
void        model_signal_amenities(TTPtr self, t_symbol *msg, long argc, t_atom *argv);


/**
 @param self
 @param attr
 @param argc
 @param argv
 */
void        model_signal_return_data_mute(TTPtr self, t_symbol *msg, long argc, t_atom *argv);


/**
 @param self
 @param attr
 @param argc
 @param argv
 */
void        model_signal_return_data_bypass(TTPtr self, t_symbol *msg, long argc, t_atom *argv);


/**
 @param self
 @param attr
 @param argc
 @param argv
 */
void        model_signal_return_data_freeze(TTPtr self, t_symbol *msg, long argc, t_atom *argv);


/**
 @param self
 @param attr
 @param argc
 @param argv
 */
void        model_signal_return_data_preview(TTPtr self, t_symbol *msg, long argc, t_atom *argv);


/**
 @param self
 @param attr
 @param argc
 @param argv
 */
void        model_signal_return_audio_mute(TTPtr self, t_symbol *msg, long argc, t_atom *argv);


/**
 @param self
 @param attr
 @param argc
 @param argv
 */
void        model_signal_return_audio_bypass(TTPtr self, t_symbol *msg, long argc, t_atom *argv);


/**
 @param self
 @param attr
 @param argc
 @param argv
 */
void        model_signal_return_audio_mix(TTPtr self, t_symbol *msg, long argc, t_atom *argv);


/**
 @param self
 @param attr
 @param argc
 @param argv
 */
void        model_signal_return_audio_gain(TTPtr self, t_symbol *msg, long argc, t_atom *argv);

