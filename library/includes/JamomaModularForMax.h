/** @file
 *
 * @ingroup implementationMaxLibrary
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

extern JAMOMA_EXPORT	TTSymbol			kTTSym_Jamoma;			///<
extern JAMOMA_EXPORT	TTObject            JamomaApplicationManager;///<
extern JAMOMA_EXPORT	TTObject            JamomaApplication;		///<

extern JAMOMA_EXPORT	TTRegex*			ttRegexForJmod;			///< A global regex to parse jmod. (usefull to detect a 0.5 module)
extern JAMOMA_EXPORT	TTRegex*			ttRegexForJcom;			///< A global regex to parse j.
extern JAMOMA_EXPORT	TTRegex*			ttRegexForModel;		///< A global regex to parse .model
extern JAMOMA_EXPORT	TTRegex*			ttRegexForModule;		///< A global regex to parse .module
extern JAMOMA_EXPORT	TTRegex*			ttRegexForView;			///< A global regex to parse .view
extern JAMOMA_EXPORT	TTRegex*			ttRegexForMaxpat;		///< A global regex to parse .maxpat
extern JAMOMA_EXPORT	TTRegex*			ttRegexForMaxhelp;		///< A global regex to parse .maxhelp
extern JAMOMA_EXPORT	TTRegex*			ttRegexForBracket;		///< A global regex to parse [ and ]

extern JAMOMA_EXPORT	TTString*			ModelPatcherFormat;		///<
extern JAMOMA_EXPORT	TTString*			ModelPresetFormat;		///<
extern JAMOMA_EXPORT	TTString*			ViewPresetFormat;		///<
extern JAMOMA_EXPORT	TTString*			HelpPatcherFormat;		///<
extern JAMOMA_EXPORT	TTString*			RefpageFormat;			///<
extern JAMOMA_EXPORT	TTString*			DocumentationFormat;	///<

#define ModelPatcher "model" 
#define ViewPatcher "view"

#define JamomaDebug if (accessApplicationLocalDebug)


// Methods to deal with TTSubscriber
///////////////////////////////////////////////////////////////////////

/**	Create a #TTSubscriber object and register a #TTObject into the tree
 or, if aTTObject is NULL, retrieve all context info to bind on an object.
 @param x
 @param anObject
 @param relativeAddress
 @param returnedSubscriber		Pointer to the new #TTSubscriber object.
 @param returnedAddress
 @param returnedNode
 @param returnedContextNode
 @return						#TTErr error message if the method does not execute as expected.
 */
TTErr JAMOMA_EXPORT jamoma_subscriber_create(t_object *x, TTObject& anObject, TTAddress relativeAddress, TTObject& returnedSubscriber, TTSymbol& returnedAddress, TTNodePtr *returnedNode, TTNodePtr *returnedContextNode);


/** Get the <patcher name, patcher pointer> list above an external.
 @details	To understand what this method have to provide see in TTSubscriber.h and TTSubscriber.cpp.
 @param x
 @param aContextListToFill
 */
void JAMOMA_EXPORT jamoma_subscriber_get_patcher_list(t_object *x, TTList& aContextListToFill);



// Method to deal with #TTContainer
///////////////////////////////////////////////////////////////////////

/**	Create a #TTContainer object.
 @param x
 @param returnedContainer
 @return						#TTErr error message if the method does not execute as expected.
 */
TTErr JAMOMA_EXPORT jamoma_container_create(t_object *x, TTObject& returnedContainer);


/**	Send Max data to a node (e.g., a j.parameter object) using a #TTContainer object.
 @param aContainer
 @param relativeAddressAndAttribute	The relative address and attribute of the node that the message is to be sent to.
 @param argc					The number of arguments of the message.
 @param argv					Pointer to the array of arguments.
 @return						#TTErr error message if the method does not execute as expected.
 */
TTErr JAMOMA_EXPORT jamoma_container_send(TTObject& aContainer, t_symbol *relativeAddressAndAttribute, long argc, const t_atom *argv);



// Method to deal with #TTNodeInfo
///////////////////////////////////////////////////////////////////////

/**	Create a #TTNodeInfo object.
 @param x
 @param returnedNodeInfo
 @return						#TTErr error message if the method does not execute as expected.
 */
TTErr JAMOMA_EXPORT jamoma_node_info_create(t_object *x, TTObject& returnedNodeInfo);



// Method to deal with #TTData
///////////////////////////////////////////////////////////////////////

/**	Create a #TTData object.
 @param x
 @param returnedData
 @param service
 @return						#TTErr error message if the method does not execute as expected.
 */
TTErr JAMOMA_EXPORT jamoma_data_create(t_object *x, TTObject& returnedData, TTSymbol service);


/**	Set the #TTData value attribute using the #TTData::Command method.
 @param aData                   #TTData instance (the Modular class which handles parameter, message or return)
 @param msg                     A symbol describing the Max type (_sym_bang, _sym_float, ...)
 @param argc					The number of arguments of the command
 @param argv					Pointer to the array of arguments.
 @return						#TTErr error message if the method does not execute as expected.
 */
TTErr JAMOMA_EXPORT jamoma_data_command(TTObject& aData, t_symbol *msg, long argc, const t_atom *argv);



// Methods to deal with #TTSender
///////////////////////////////////////////////////////////////////////

/**	Create a #TTSender object.
 @param x
 @param returnedSender
 @return						#TTErr error message if the method does not execute as expected.
 */
TTErr JAMOMA_EXPORT jamoma_sender_create(t_object *x, TTObject& returnedSender);


/**	Create a #TTSender object for audio signal.
 @param x
 @param returnedSender
 @return						#TTErr error message if the method does not execute as expected.
 */
TTErr JAMOMA_EXPORT jamoma_sender_create_audio(t_object *x, TTObject& returnedSender);


/**	Send Max data using a #TTSender object.
 @param aSender
 @param msg
 @param arc						The number of arguments of the message.
 @param argv					Pointer to the array of arguments.
 @return						#TTErr error message if the method does not execute as expected.
 */
TTErr JAMOMA_EXPORT jamoma_sender_send(TTObject& aSender, t_symbol *msg, long argc, const t_atom *argv);



// Method to deal with #TTReceiver
///////////////////////////////////////////////////////////////////////

/**	Create a #TTReceiver object.
 @param x
 @param returnedReceiver
 @return						#TTErr error message if the method does not execute as expected.
 */
TTErr JAMOMA_EXPORT jamoma_receiver_create(t_object *x, TTObject& returnedReceiver);


/**	Create a #TTReceiver object for audio signal.
 @param x
 @param returnedReceiver
 @return						#TTErr error message if the method does not execute as expected.
 */
TTErr JAMOMA_EXPORT jamoma_receiver_create_audio(t_object *x, TTObject& returnedReceiver);



// Method to deal with TTPresetManager and TTCueManager
///////////////////////////////////////////////////////////////////////

/**	Create a #TTPresetManager object. 
 @param x
 @param returnedPresetManager
 @return						#TTErr error message if the method does not execute as expected.
 */
TTErr JAMOMA_EXPORT jamoma_presetManager_create(t_object *x, TTObject& returnedPresetManager);


/**	Create a #TTCueManager object.
 @param x
 @param returnedCueManager
 @return						#TTErr error message if the method does not execute as expected.
 */
TTErr JAMOMA_EXPORT jamoma_cueManager_create(t_object *x, TTObject& returnedCueManager);



// Method to deal with TTInput
///////////////////////////////////////////////////////////////////////

/**	Create a #TTInput object for signal.
 @param x
 @param returnedInput
 @return						#TTErr error message if the method does not execute as expected.
 */
TTErr JAMOMA_EXPORT jamoma_input_create(t_object *x, TTObject& returnedInput);


/**	Create a #TTInput object for audio signal. 
 @param x
 @param returnedInput
 @return						#TTErr error message if the method does not execute as expected.
 */
TTErr JAMOMA_EXPORT jamoma_input_create_audio(t_object *x, TTObject& returnedInput);


/**	Send any signal to a TTInput object.
 @param anInput
 @param msg
 @param argc					The number of arguments of the message.
 @param argv					Pointer to the array of arguments.
 @return						#TTErr error message if the method does not execute as expected.
 */
TTErr JAMOMA_EXPORT jamoma_input_send(TTObject& anInput, t_symbol *msg, long argc, const t_atom *argv);



// Method to deal with TTOutput
///////////////////////////////////////////////////////////////////////

/**	Create a TTOutput object for signal.
 @param x
 @param returnedOutput
 @return						#TTErr error message if the method does not execute as expected.
 */
TTErr JAMOMA_EXPORT jamoma_output_create(t_object *x, TTObject& returnedOutput);


/**	Create an output object for audio signal.
 @param x
 @param returnedOutput
 @return						#TTErr error message if the method does not execute as expected.
 */
TTErr JAMOMA_EXPORT jamoma_output_create_audio(t_object *x, TTObject& returnedOutput);


/**	Send any signal to a TTOutput object.
 @param anOutput
 @param msg
 @param argc					The number of arguments of the message.
 @param argv					Pointer to the array of arguments.
 @return						#TTErr error message if the method does not execute as expected.
 */
TTErr JAMOMA_EXPORT jamoma_output_send(TTObject& anOutput, t_symbol *msg, long argc, const t_atom *argv);


// Method to deal with TTMapper
///////////////////////////////////////////////////////////////////////

/**	Create a TTMapper object.
 @param x
 @param returnedMapper
 @return						#TTErr error message if the method does not execute as expected.
 */
TTErr JAMOMA_EXPORT jamoma_mapper_create(t_object *x, TTObject& returnedMapper);



// Method to deal with #TTViewer
///////////////////////////////////////////////////////////////////////

/**	Create a #TTViewer object.
 @param x
 @param returnedViewer
 @return						#TTErr error message if the method does not execute as expected.
 */
TTErr JAMOMA_EXPORT jamoma_viewer_create(t_object *x, TTObject& returnedViewer);


/**	Send Max data using a #TTViewer object.
 @param aViewer
 @param msg
 @param argc					The number of arguments of the message.
 @param argv					Pointer to the array of arguments.
 @return						#TTErr error message if the method does not execute as expected.
 */
TTErr JAMOMA_EXPORT jamoma_viewer_send(TTObject& aViewer, t_symbol *msg, long argc, const t_atom *argv);



// Method to deal with #TTExplorer
///////////////////////////////////////////////////////////////////////

/**	Create a #TTExplorer object.
 @param x
 @param returnedExplorer
 @return						#TTErr error message if the method does not execute as expected.
 */
TTErr JAMOMA_EXPORT jamoma_explorer_create(t_object *x, TTObject& returnedExplorer);


/** 
 @return
 */
TTHashPtr JAMOMA_EXPORT jamoma_explorer_default_filter_bank(void);



// Method to deal with TTRamp
///////////////////////////////////////////////////////////////////////

/** Create a #TTRamp object.
 @param x
 @param returnedRamp
 @return						#TTErr error message if the method does not execute as expected.
 */
TTErr JAMOMA_EXPORT jamoma_ramp_create(t_object *x, TTObject& returnedRamp);


/**
 @param o
 @param n
 @param v
 */
void JAMOMA_EXPORT jamoma_callback_return_ramped_value(void *o, TTUInt32 n, TTFloat64 *v);



// Method to return data
///////////////////////////////////////////////////////////////////////

/** Return an address to a j. external.
 @param baton
 @param v
 */
void JAMOMA_EXPORT jamoma_callback_return_address(const TTValue& baton, const TTValue& v);


/** Return the value to a j.* external as msg, argc, argv.
 @param baton       The Max wrapper object
 @param v           The value(s) being passed back. This is passed back as an array of three argumens: msg, argc and argv
 */
void JAMOMA_EXPORT jamoma_callback_return_value(const TTValue& baton, const TTValue& v);


/** Return the value to a j.* external as msg, argc, argv. The msg part carries information about what type of atom(s) we are getting, 
 @param baton       The Max wrapper object
 @param v           The value(s) being passed back. This is passed back as an array of three argumens: msg, argc and argv
 */
void JAMOMA_EXPORT jamoma_callback_return_value_typed(const TTValue& baton, const TTValue& v);


/** Return any signal.
 @param baton
 @param v
 */
void JAMOMA_EXPORT jamoma_callback_return_signal(const TTValue& baton, const TTValue& v);


/** Return audio signal.
 @param baton
 @param v
 */
void JAMOMA_EXPORT jamoma_callback_return_signal_audio(const TTValue& baton, const TTValue& v);



// Patcher
///////////////////////////////////////////////

/** Convenient method to get the patcher easily.
 @param obj
 */
t_object *JAMOMA_EXPORT jamoma_patcher_get(t_object *obj);


/** Convenient method to get the patcher argument easily.
 In poly case it also return the voice index (0 else) 
 @param patcher
 @param argc					The number of arguments of the message.
 @param argv					Pointer to the array of arguments.
 */
void JAMOMA_EXPORT jamoma_patcher_get_args(t_object *patcher, long *argc, t_atom **argv);


/** Get the hierarchy of the patcher : bpatcher, subpatcher or toplevel.
 @param patcher
 @return
 */
t_symbol *JAMOMA_EXPORT jamoma_patcher_get_hierarchy(t_object *patcher);


/** Get the context from the upper jcom model|view in the patcher or from patcher's name.
 @param patcher
 @param returnedContext
 */
void JAMOMA_EXPORT jamoma_patcher_get_context(t_object **patcher, TTSymbol& returnedContext);


/** Get the class of the patcher from the file name (removing .model and .view convention name if they are in) */
void JAMOMA_EXPORT jamoma_patcher_get_class(t_object *patcher, TTSymbol context, TTSymbol& returnedClass);


/** Get the name of the patcher from his arguments.
 @param patcher
 @param context
 @param returnedName
 */
void JAMOMA_EXPORT jamoma_patcher_get_name(t_object *patcher, TTSymbol context, TTSymbol& returnedName);

/** Get all context info from the root jcom model|view in the patcher.
 @param patcher
 @param returnedPatcher
 @param returnedContext
 @param returnedClass
 @param returnedName
 */
void JAMOMA_EXPORT jamoma_patcher_share_info(t_object *patcher, t_object **returnedPatcher, TTSymbol& returnedContext, TTSymbol& returnedClass,  TTSymbol& returnedName);


/** Get patcher's node from the root jcom model|view in the patcher.
 @param obj
 @param patcherNode
 */
void JAMOMA_EXPORT jamoma_patcher_share_node(t_object *obj, TTNodePtr *patcherNode);


/** Get all context info from an object (his patcher and the context, the class and the name of his patcher).
 @param obj
 @param returnedPatcher
 @param returnedContext
 @param modelClass
 @param returnedName
 @return						#TTErr error message if the method does not execute as expected.
 */
TTErr JAMOMA_EXPORT jamoma_patcher_get_info(t_object *obj, t_object **returnedPatcher, TTSymbol& returnedContext, TTSymbol& returnedClass, TTSymbol& returnedName);

/** Get j.model or j.view of a patcher 
 @param patcher
 @param returnedModelOrView
 */
void JAMOMA_EXPORT jamoma_patcher_get_model_or_view(t_object *patcher, t_object **returnedModelOrView);

/** Get the "aClass.model" external in the patcher.
 @param patcher
 @param modelClass
 @param returnedModelPatcher
 */
void JAMOMA_EXPORT jamoma_patcher_get_model_patcher(t_object *patcher, TTSymbol modelClass, t_object **returnedModelPatcher);

/** Look into the given patcher to know if there are data or audio inputs and outputs
 @param patcher
 @param dataInput       is there a data input in the patcher ?
 @param dataOutput      is there a data output in the patcher ?
 @param audioInput      is there an audio input in the patcher ?
 @param audioOutput     is there an audio output in the patcher ?
 */
void JAMOMA_EXPORT jamoma_patcher_get_input_output(t_object *patcher, TTBoolean& dataInput, TTBoolean& dataOutput, TTBoolean& audioInput, TTBoolean& audioOutput);

/** Look into the given patcher to know if there is a j.ui
 @param patcher
 @return true if there is a j.ui in the patcher
 */
TTBoolean JAMOMA_EXPORT jamoma_patcher_get_ui(t_object *patcher);


// Tools
///////////////////////////////////////////////

/** Make a typed Atom array from a #TTValue. (NB: This method allocate memory for the Atom array. Make sure to free it afterwards!)
 @param v
 @param msg
 @param argc					The number of arguments of the message.
 @param argv					Pointer to the array of arguments.
 @param shifted
 */
void JAMOMA_EXPORT jamoma_ttvalue_to_typed_Atom(const TTValue& v, t_symbol **msg, long *argc, t_atom **argv, TTBoolean& shifted);


/** Make an Atom array from a #TTValue. (NB: This method allocate memory for the Atom array. Make sure to free it afterwards!)
 @param v
 @param argc					The number of arguments of the message.
 @param argv					Pointer to the array of arguments.
 */
void JAMOMA_EXPORT jamoma_ttvalue_to_Atom(const TTValue& v, long *argc, t_atom **argv);


/** Make a #TTValue from Atom array. 
 @param v
 @param msg
 @param argc					The number of arguments of the message.
 @param argv					Pointer to the array of arguments.
 */
void JAMOMA_EXPORT jamoma_ttvalue_from_Atom(TTValue& v, t_symbol *msg, long argc, const t_atom *argv);


/** Convert a TTSymbol "MyObjectMessage" into a t_symbol *"my/object/message"
 or return NULL if the TTSymbol doesn't begin by an uppercase letter.
 @param TTName
 @return
 */
t_symbol *JAMOMA_EXPORT jamoma_TTName_To_MaxName(TTSymbol TTName);


/** Load an external for internal use. Returns true if successful.
 @param objectname
 @param argc					The number of arguments of the message.
 @param argv					Pointer to the array of arguments.
 @param object
 @return
 */
TTBoolean JAMOMA_EXPORT jamoma_extern_load(t_symbol *objectname, long argc, const t_atom *argv, t_object** object);


/** Returned the N inside "pp/xx.[N]/yyy" and a format string as "pp/xx.%d/yy" and a format string as "pp/xx.%s/yy".
 @param s
 @param si_format
 @param ss_format
 @return
 */
TTUInt32 JAMOMA_EXPORT jamoma_parse_bracket(t_symbol *s, TTString& si_format, TTString& ss_format);


/** Edit a new instance of the given format address using interger.
 @param format
 @param returnedName
 @param i
 */
void JAMOMA_EXPORT jamoma_edit_numeric_instance(TTString format, t_symbol** returnedName, long i);


/** Edit a new instance of the given format address using string.
 @param format
 @param returnedName
 @param s
 */
void JAMOMA_EXPORT jamoma_edit_string_instance(TTString format, t_symbol** returnedName, TTString s);


/** Edit a file name from a given file format and a class name.
 @param format
 @param className
 @param returnedFileName
 */
void JAMOMA_EXPORT jamoma_edit_filename(TTString format, TTSymbol className, t_symbol** returnedFileName);


/** Parse #N inside address and replace them by parent patcher arguments if there are.
 @param x
 @param address
 @return
 */
t_symbol *JAMOMA_EXPORT jamoma_parse_dieze(t_object *x, t_symbol *address);



// Files
///////////////////////////////////////////////

/** Get BOOT style filepath from args or, if no args open a dialog to write a file.
 @param x
 @param argc					The number of arguments of the message.
 @param argv					Pointer to the array of arguments.
 @param default_filename
 @return
 */
TTSymbol JAMOMA_EXPORT jamoma_file_write(t_object *x, long argc, const t_atom *argv, char* default_filename);


/** Get BOOT style filepath from args or, if no args open a dialog to read a file.
 @param x
 @param argc					The number of arguments of the message.
 @param argv					Pointer to the array of arguments.
 @param filetype
 @return
 */
TTSymbol JAMOMA_EXPORT jamoma_file_read(t_object *x, long argc, const t_atom *argv, t_fourcc filetype);

#endif // __JAMOMA_MODULAR_FOR_MAX_H__
	


