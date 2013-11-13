/** @file
 *
 * @ingroup implementationMax
 *
 * @brief JamomaModular For Max Shared Library
 *
 * @details Functions and resources based on Modular framework used by Max objects
 *
 * @authors Théo de la Hogue, Tim Place
 *
 * @copyright © 2013, Théo de la Hogue & Tim Place @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */

#ifndef __JAMOMA_MODULAR_FOR_MAX_H__
#define __JAMOMA_MODULAR_FOR_MAX_H__

#include "JamomaForMax.h"

#include "TTNode.h"
#include "TTNodeDirectory.h"
#include "TTRegex.h"
#include "TTSubscriber.h"
#include "TTInput.h"
#include "TTOutput.h"

extern JAMOMA_EXPORT	TTSymbol			kTTSym_Jamoma;
extern JAMOMA_EXPORT	TTApplicationPtr	JamomaApplication;
extern JAMOMA_EXPORT	TTNodeDirectoryPtr	JamomaDirectory;

extern JAMOMA_EXPORT	TTRegex*			ttRegexForJmod;			///< A global regex to parse jmod. (usefull to detect a 0.5 module)
extern JAMOMA_EXPORT	TTRegex*			ttRegexForJcom;			///< A global regex to parse j.
extern JAMOMA_EXPORT	TTRegex*			ttRegexForModel;		///< A global regex to parse .model
extern JAMOMA_EXPORT	TTRegex*			ttRegexForModule;		///< A global regex to parse .module
extern JAMOMA_EXPORT	TTRegex*			ttRegexForView;			///< A global regex to parse .view
extern JAMOMA_EXPORT	TTRegex*			ttRegexForMaxpat;		///< A global regex to parse .maxpat
extern JAMOMA_EXPORT	TTRegex*			ttRegexForMaxhelp;		///< A global regex to parse .maxhelp
extern JAMOMA_EXPORT	TTRegex*			ttRegexForBracket;		///< A global regex to parse [ and ]

extern JAMOMA_EXPORT	TTString*			ModelPatcherFormat;
extern JAMOMA_EXPORT	TTString*			ModelPresetFormat;
extern JAMOMA_EXPORT	TTString*			ViewPresetFormat;
extern JAMOMA_EXPORT	TTString*			HelpPatcherFormat;
extern JAMOMA_EXPORT	TTString*			RefpageFormat;
extern JAMOMA_EXPORT	TTString*			DocumentationFormat;

#define ModelPatcher "model" 
#define ViewPatcher "view"

#define JamomaDebug if (getLocalApplicationDebug)


// Method to deal with the jamoma directory
/////////////////////////////////////////

/** Dump all the OSC address of the directory in the max window */
TTErr JAMOMA_EXPORT jamoma_directory_dump_observers(void);


// Method to deal with TTSubscriber
///////////////////////////////////////////////////////////////////////

/**	Create a subscriber object and register a TTObject into the tree
 or, if aTTObject is NULL, retrieve all context info to bind on an object */
TTErr JAMOMA_EXPORT jamoma_subscriber_create(ObjectPtr x, TTObjectBasePtr aTTObjectBase, TTAddress relativeAddress, TTSubscriberPtr *returnedSubscriber, TTSymbol& returnedAddress, TTNodePtr *returnedNode, TTNodePtr *returnedContextNode);

/** Get the <patcher name, patcher pointer> list above an external
 To understand what this method have to provide see in TTSubscriber.h and .cpp */
void JAMOMA_EXPORT jamoma_subscriber_get_patcher_list(ObjectPtr x, TTList& aContextListToFill);

// Method to deal with TTContainer
///////////////////////////////////////////////////////////////////////

/**	Create a container object */
TTErr JAMOMA_EXPORT jamoma_container_create(ObjectPtr x, TTObjectBasePtr *returnedContainer);

/**	Send Max data using a container object */
TTErr JAMOMA_EXPORT jamoma_container_send(TTContainerPtr aContainer, SymbolPtr relativeAddressAndAttribute, AtomCount argc, AtomPtr argv);


// Method to deal with TTData
///////////////////////////////////////////////////////////////////////

/**	Create a data object */
TTErr JAMOMA_EXPORT jamoma_data_create(ObjectPtr x, TTObjectBasePtr *returnedData, TTSymbol service);

/**	Send Max data command */
TTErr JAMOMA_EXPORT jamoma_data_command(TTDataPtr aData, SymbolPtr msg, AtomCount argc, AtomPtr argv);


// Method to deal with TTSender
///////////////////////////////////////////////////////////////////////

/**	Create a sender object */
TTErr JAMOMA_EXPORT jamoma_sender_create(ObjectPtr x, TTObjectBasePtr *returnedSender);

/**	Create a sender object for audio signal */
TTErr JAMOMA_EXPORT jamoma_sender_create_audio(ObjectPtr x, TTObjectBasePtr *returnedSender);

/**	Send Max data using a sender object */
TTErr JAMOMA_EXPORT jamoma_sender_send(TTSenderPtr aSender, SymbolPtr msg, AtomCount argc, AtomPtr argv);


// Method to deal with TTReceiver
///////////////////////////////////////////////////////////////////////

/**	Create a receiver object */
TTErr JAMOMA_EXPORT jamoma_receiver_create(ObjectPtr x, TTObjectBasePtr *returnedReceiver);

/**	Create a receiver object for audio signal */
TTErr JAMOMA_EXPORT jamoma_receiver_create_audio(ObjectPtr x, TTObjectBasePtr *returnedReceiver);

// Method to deal with TTPresetManager and TTCueManager
///////////////////////////////////////////////////////////////////////

/**	Create a preset manager object */
TTErr JAMOMA_EXPORT jamoma_presetManager_create(ObjectPtr x, TTObjectBasePtr *returnedPresetManager);

/**	Create a cue manager object */
TTErr JAMOMA_EXPORT jamoma_cueManager_create(ObjectPtr x, TTObjectBasePtr *returnedCueManager);


// Method to deal with TTInput
///////////////////////////////////////////////////////////////////////

/**	Create an input object for signal */
TTErr JAMOMA_EXPORT jamoma_input_create(ObjectPtr x, TTObjectBasePtr *returnedInput);

/**	Create an input object for audio signal */
TTErr JAMOMA_EXPORT jamoma_input_create_audio(ObjectPtr x, TTObjectBasePtr *returnedInput);

/**	Send any signal to an input object */
TTErr JAMOMA_EXPORT jamoma_input_send(TTInputPtr anInput, SymbolPtr msg, AtomCount argc, AtomPtr argv);


// Method to deal with TTOutput
///////////////////////////////////////////////////////////////////////

/**	Create an output object for signal */
TTErr JAMOMA_EXPORT jamoma_output_create(ObjectPtr x, TTObjectBasePtr *returnedOutput);

/**	Create an output object for audio signal */
TTErr JAMOMA_EXPORT jamoma_output_create_audio(ObjectPtr x, TTObjectBasePtr *returnedOutput);

/**	Send any signal to an output object */
TTErr JAMOMA_EXPORT jamoma_output_send(TTOutputPtr anOutput, SymbolPtr msg, AtomCount argc, AtomPtr argv);


// Method to deal with TTMapper
///////////////////////////////////////////////////////////////////////

/**	Create a mapper object */
TTErr JAMOMA_EXPORT jamoma_mapper_create(ObjectPtr x, TTObjectBasePtr *returnedMapper);


// Method to deal with TTViewer
///////////////////////////////////////////////////////////////////////

/**	Create a viewer object */
TTErr JAMOMA_EXPORT jamoma_viewer_create(ObjectPtr x, TTObjectBasePtr *returnedViewer);

/**	Send Max data using a viewer object */
TTErr JAMOMA_EXPORT jamoma_viewer_send(TTViewerPtr aViewer, SymbolPtr msg, AtomCount argc, AtomPtr argv);


// Method to deal with TTExplorer
///////////////////////////////////////////////////////////////////////

/**	Create an explorer object */
TTErr JAMOMA_EXPORT jamoma_explorer_create(ObjectPtr x, TTObjectBasePtr *returnedExplorer);


TTHashPtr JAMOMA_EXPORT jamoma_explorer_default_filter_bank(void);

// Method to deal with TTRamp
///////////////////////////////////////////////////////////////////////
TTErr JAMOMA_EXPORT jamoma_ramp_create(ObjectPtr x, TTObjectBasePtr *returnedRamp);

void JAMOMA_EXPORT jamoma_callback_return_ramped_value(void *o, TTUInt32 n, TTFloat64 *v);

// Method to return data
///////////////////////////////////////////////////////////////////////

/** Return an address to a j. external */
void JAMOMA_EXPORT jamoma_callback_return_address(TTPtr baton, TTValue& v);

/** Return the value to a j. external as _sym_nothing, argc, argv */
void JAMOMA_EXPORT jamoma_callback_return_value(TTPtr baton, TTValue& v);

/** Return the value to a j. external as msg, argc, argv */
void JAMOMA_EXPORT jamoma_callback_return_value_typed(TTPtr baton, TTValue& v);

/** Return any signal */
void JAMOMA_EXPORT jamoma_callback_return_signal(TTPtr baton, TTValue& v);

/** Return audio signal */
void JAMOMA_EXPORT jamoma_callback_return_signal_audio(TTPtr baton, TTValue& v);


// Patcher
///////////////////////////////////////////////

/** Convenient method to get the patcher easily */
ObjectPtr JAMOMA_EXPORT jamoma_patcher_get(ObjectPtr obj);

/** Convenient method to get the patcher argument easily.
 In poly case it also return the voice index (0 else) */
long JAMOMA_EXPORT jamoma_patcher_get_args(t_object *patcher, long *argc, t_atom **argv);

/** Get the hierarchy of the patcher : bpatcher, subpatcher or toplevel */
SymbolPtr JAMOMA_EXPORT jamoma_patcher_get_hierarchy(ObjectPtr patcher);

/** Get the context from the upper jcom model|view in the patcher or from patcher's name */
void JAMOMA_EXPORT jamoma_patcher_get_context(ObjectPtr *patcher, TTSymbol& returnedContext);

/** Get the class of the patcher from the file name (removing .model and .view convention name if they are in) */
void JAMOMA_EXPORT jamoma_patcher_get_class(ObjectPtr patcher,  TTSymbol context, TTSymbol& returnedClass);

/** Get the name of the patcher from his arguments */
void JAMOMA_EXPORT jamoma_patcher_get_name(ObjectPtr patcher, TTSymbol context, TTSymbol& returnedName);

/** Get all context info from the root jcom model|view in the patcher */
void JAMOMA_EXPORT jamoma_patcher_share_info(ObjectPtr patcher, ObjectPtr *returnedPatcher, TTSymbol& returnedContext, TTSymbol& returnedClass,  TTSymbol& returnedName);

/** Get patcher's node from the root jcom model|view in the patcher */
void JAMOMA_EXPORT jamoma_patcher_share_node(ObjectPtr obj, TTNodePtr *patcherNode);

/** Get all context info from an object (his patcher and the context, the class and the name of his patcher) */
TTErr JAMOMA_EXPORT jamoma_patcher_get_info(ObjectPtr obj, ObjectPtr *returnedPatcher, TTSymbol& returnedContext, TTSymbol& returnedClass,  TTSymbol& returnedName);

/** Get the "aClass.model" external in the patcher */
void JAMOMA_EXPORT jamoma_patcher_get_model_patcher(ObjectPtr patcher, TTSymbol modelClass, ObjectPtr *returnedModelPatcher);

// Tools
///////////////////////////////////////////////

/** Make a typed Atom array from a TTValue (!!! this method allocate memory for the Atom array ! free it after ! */
void JAMOMA_EXPORT jamoma_ttvalue_to_typed_Atom(const TTValue& v, SymbolPtr *msg, AtomCount *argc, AtomPtr *argv, TTBoolean& shifted);

/** Make an Atom array from a TTValue (!!! this method allocate memory for the Atom array ! free it after ! */
void JAMOMA_EXPORT jamoma_ttvalue_to_Atom(const TTValue& v, AtomCount *argc, AtomPtr *argv);

/** Make a TTValue from Atom array */
void JAMOMA_EXPORT jamoma_ttvalue_from_Atom(TTValue& v, SymbolPtr msg, AtomCount argc, AtomPtr argv);

/** Convert a TTSymbol "MyObjectMessage" into a SymbolPtr "my/object/message"
 or return NULL if the TTSymbol doesn't begin by an uppercase letter */
SymbolPtr JAMOMA_EXPORT jamoma_TTName_To_MaxName(TTSymbol TTName);

/** Load an external for internal use. Returns true if successful */
TTBoolean JAMOMA_EXPORT jamoma_extern_load(SymbolPtr objectname, AtomCount argc, AtomPtr argv, ObjectPtr *object);

/** returned the N inside "pp/xx.[N]/yyy" and a format string as "pp/xx.%d/yy" and a format string as "pp/xx.%s/yy" */
TTUInt32 JAMOMA_EXPORT jamoma_parse_bracket(SymbolPtr s, TTString& si_format, TTString& ss_format);

/** edit a new instance of the given format address using interger */
void JAMOMA_EXPORT jamoma_edit_numeric_instance(TTString format, SymbolPtr *returnedName, long i);

/** edit a new instance of the given format address using string */
void JAMOMA_EXPORT jamoma_edit_string_instance(TTString format, SymbolPtr *returnedName, TTString s);

/** edit a file name from a given file format and a class name */
void JAMOMA_EXPORT jamoma_edit_filename(TTString format, TTSymbol className, SymbolPtr *returnedFileName);

/** Parse #N inside address and replace them by parent patcher arguments if there are */
SymbolPtr JAMOMA_EXPORT jamoma_parse_dieze(ObjectPtr x, SymbolPtr address);


// Files
///////////////////////////////////////////////

/** Get BOOT style filepath from args or, if no args open a dialog to write a file */
TTSymbol JAMOMA_EXPORT jamoma_file_write(ObjectPtr x, AtomCount argc, AtomPtr argv, char* default_filename);

/** Get BOOT style filepath from args or, if no args open a dialog to read a file */
TTSymbol JAMOMA_EXPORT jamoma_file_read(ObjectPtr x, AtomCount argc, AtomPtr argv, t_fourcc filetype);

#endif // __JAMOMA_MODULAR_FOR_MAX_H__
	


