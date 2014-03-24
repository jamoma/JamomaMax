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


// Method to deal with the jamoma directory
/////////////////////////////////////////

/** Dump all the OSC address of the directory in the max window.
 @return						#TTErr error message if the method does not execute as expected.
 */
TTErr JAMOMA_EXPORT jamoma_directory_dump_observers(void);


// Methods to deal with TTSubscriber
///////////////////////////////////////////////////////////////////////

/**	Create a #TTSubscriber object and register a #TTObject into the tree
 or, if aTTObject is NULL, retrieve all context info to bind on an object.
 @param x
 @param aTTObjectBase
 @param relativeAddress
 @param returnedSubscriber		Pointer to the new #TTSubscriber object.
 @param returnedAddress
 @param returnedNode
 @param returnedContextNode
 @return						#TTErr error message if the method does not execute as expected.
 */
TTErr JAMOMA_EXPORT jamoma_subscriber_create(ObjectPtr x, TTObjectBasePtr aTTObjectBase, TTAddress relativeAddress, TTSubscriberPtr *returnedSubscriber, TTSymbol& returnedAddress, TTNodePtr *returnedNode, TTNodePtr *returnedContextNode);


/** Get the <patcher name, patcher pointer> list above an external.
 @details	To understand what this method have to provide see in TTSubscriber.h and TTSubscriber.cpp.
 @param x
 @param aContextListToFill
 */
void JAMOMA_EXPORT jamoma_subscriber_get_patcher_list(ObjectPtr x, TTList& aContextListToFill);



// Method to deal with #TTContainer
///////////////////////////////////////////////////////////////////////

/**	Create a #TTContainer object.
 @param x
 @param returnedContainer
 @return						#TTErr error message if the method does not execute as expected.
 */
TTErr JAMOMA_EXPORT jamoma_container_create(ObjectPtr x, TTObjectBasePtr *returnedContainer);


/**	Send Max data to a node (e.g., a j.parameter object) using a #TTContainer object.
 @param aContainer
 @param relativeAddressAndAttribute	The relative address and attribute of the node that the message is to be sent to.
 @param argc					The number of arguments of the message.
 @param argv					Pointer to the array of arguments.
 @return						#TTErr error message if the method does not execute as expected.
 */
TTErr JAMOMA_EXPORT jamoma_container_send(TTContainerPtr aContainer, SymbolPtr relativeAddressAndAttribute, AtomCount argc, AtomPtr argv);



// Method to deal with #TTNodeInfo
///////////////////////////////////////////////////////////////////////

/**	Create a #TTNodeInfo object.
 @param x
 @param returnedNodeInfo
 @return						#TTErr error message if the method does not execute as expected.
 */
TTErr JAMOMA_EXPORT jamoma_node_info_create(ObjectPtr x, TTObjectBasePtr *returnedNodeInfo);



// Method to deal with #TTData
///////////////////////////////////////////////////////////////////////

/**	Create a #TTData object.
 @param x
 @param returnedData
 @param service
 @return						#TTErr error message if the method does not execute as expected.
 */
TTErr JAMOMA_EXPORT jamoma_data_create(ObjectPtr x, TTObjectBasePtr *returnedData, TTSymbol service);


/**	Set the #TTData value attribute using the #TTData::Command method.
 @param aData                   #TTData instance (the Modular class which handles parameter, message or return)
 @param msg                     A symbol describing the Max type (_sym_bang, _sym_float, ...)
 @param argc					The number of arguments of the command
 @param argv					Pointer to the array of arguments.
 @return						#TTErr error message if the method does not execute as expected.
 */
TTErr JAMOMA_EXPORT jamoma_data_command(TTDataPtr aData, SymbolPtr msg, AtomCount argc, AtomPtr argv);



// Methods to deal with #TTSender
///////////////////////////////////////////////////////////////////////

/**	Create a #TTSender object.
 @param x
 @param returnedSender
 @return						#TTErr error message if the method does not execute as expected.
 */
TTErr JAMOMA_EXPORT jamoma_sender_create(ObjectPtr x, TTObjectBasePtr *returnedSender);


/**	Create a #TTSender object for audio signal.
 @param x
 @param returnedSender
 @return						#TTErr error message if the method does not execute as expected.
 */
TTErr JAMOMA_EXPORT jamoma_sender_create_audio(ObjectPtr x, TTObjectBasePtr *returnedSender);


/**	Send Max data using a #TTSender object.
 @param aSender
 @param msg
 @param arc						The number of arguments of the message.
 @param argv					Pointer to the array of arguments.
 @return						#TTErr error message if the method does not execute as expected.
 */
TTErr JAMOMA_EXPORT jamoma_sender_send(TTSenderPtr aSender, SymbolPtr msg, AtomCount argc, AtomPtr argv);



// Method to deal with #TTReceiver
///////////////////////////////////////////////////////////////////////

/**	Create a #TTReceiver object.
 @param x
 @param returnedReceiver
 @return						#TTErr error message if the method does not execute as expected.
 */
TTErr JAMOMA_EXPORT jamoma_receiver_create(ObjectPtr x, TTObjectBasePtr *returnedReceiver);


/**	Create a #TTReceiver object for audio signal.
 @param x
 @param returnedReceiver
 @return						#TTErr error message if the method does not execute as expected.
 */
TTErr JAMOMA_EXPORT jamoma_receiver_create_audio(ObjectPtr x, TTObjectBasePtr *returnedReceiver);



// Method to deal with TTPresetManager and TTCueManager
///////////////////////////////////////////////////////////////////////

/**	Create a #TTPresetManager object. 
 @param x
 @param returnedPresetManager
 @return						#TTErr error message if the method does not execute as expected.
 */
TTErr JAMOMA_EXPORT jamoma_presetManager_create(ObjectPtr x, TTObjectBasePtr *returnedPresetManager);


/**	Create a #TTCueManager object.
 @param x
 @param returnedCueManager
 @return						#TTErr error message if the method does not execute as expected.
 */
TTErr JAMOMA_EXPORT jamoma_cueManager_create(ObjectPtr x, TTObjectBasePtr *returnedCueManager);



// Method to deal with TTInput
///////////////////////////////////////////////////////////////////////

/**	Create a #TTInput object for signal.
 @param x
 @param returnedInput
 @return						#TTErr error message if the method does not execute as expected.
 */
TTErr JAMOMA_EXPORT jamoma_input_create(ObjectPtr x, TTObjectBasePtr *returnedInput);


/**	Create a #TTInput object for audio signal. 
 @param x
 @param returnedInput
 @return						#TTErr error message if the method does not execute as expected.
 */
TTErr JAMOMA_EXPORT jamoma_input_create_audio(ObjectPtr x, TTObjectBasePtr *returnedInput);


/**	Send any signal to a TTInput object.
 @param anInput
 @param msg
 @param argc					The number of arguments of the message.
 @param argv					Pointer to the array of arguments.
 @return						#TTErr error message if the method does not execute as expected.
 */
TTErr JAMOMA_EXPORT jamoma_input_send(TTInputPtr anInput, SymbolPtr msg, AtomCount argc, AtomPtr argv);



// Method to deal with TTOutput
///////////////////////////////////////////////////////////////////////

/**	Create a TTOutput object for signal.
 @param x
 @param returnedOutput
 @return						#TTErr error message if the method does not execute as expected.
 */
TTErr JAMOMA_EXPORT jamoma_output_create(ObjectPtr x, TTObjectBasePtr *returnedOutput);


/**	Create an output object for audio signal.
 @param x
 @param returnedOutput
 @return						#TTErr error message if the method does not execute as expected.
 */
TTErr JAMOMA_EXPORT jamoma_output_create_audio(ObjectPtr x, TTObjectBasePtr *returnedOutput);


/**	Send any signal to a TTOutput object.
 @param anOutput
 @param msg
 @param argc					The number of arguments of the message.
 @param argv					Pointer to the array of arguments.
 @return						#TTErr error message if the method does not execute as expected.
 */
TTErr JAMOMA_EXPORT jamoma_output_send(TTOutputPtr anOutput, SymbolPtr msg, AtomCount argc, AtomPtr argv);


// Method to deal with TTMapper
///////////////////////////////////////////////////////////////////////

/**	Create a TTMapper object.
 @param x
 @param returnedMapper
 @return						#TTErr error message if the method does not execute as expected.
 */
TTErr JAMOMA_EXPORT jamoma_mapper_create(ObjectPtr x, TTObjectBasePtr *returnedMapper);



// Method to deal with #TTViewer
///////////////////////////////////////////////////////////////////////

/**	Create a #TTViewer object.
 @param x
 @param returnedViewer
 @return						#TTErr error message if the method does not execute as expected.
 */
TTErr JAMOMA_EXPORT jamoma_viewer_create(ObjectPtr x, TTObjectBasePtr *returnedViewer);


/**	Send Max data using a #TTViewer object.
 @param aViewer
 @param msg
 @param argc					The number of arguments of the message.
 @param argv					Pointer to the array of arguments.
 @return						#TTErr error message if the method does not execute as expected.
 */
TTErr JAMOMA_EXPORT jamoma_viewer_send(TTViewerPtr aViewer, SymbolPtr msg, AtomCount argc, AtomPtr argv);



// Method to deal with #TTExplorer
///////////////////////////////////////////////////////////////////////

/**	Create a #TTExplorer object.
 @param x
 @param returnedExplorer
 @return						#TTErr error message if the method does not execute as expected.
 */
TTErr JAMOMA_EXPORT jamoma_explorer_create(ObjectPtr x, TTObjectBasePtr *returnedExplorer);


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
TTErr JAMOMA_EXPORT jamoma_ramp_create(ObjectPtr x, TTObjectBasePtr *returnedRamp);


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
ObjectPtr JAMOMA_EXPORT jamoma_patcher_get(ObjectPtr obj);


/** Convenient method to get the patcher argument easily.
 In poly case it also return the voice index (0 else) 
 @param patcher
 @param argc					The number of arguments of the message.
 @param argv					Pointer to the array of arguments.
 @return
 */
long JAMOMA_EXPORT jamoma_patcher_get_args(t_object *patcher, long *argc, t_atom **argv);


/** Get the hierarchy of the patcher : bpatcher, subpatcher or toplevel.
 @param patcher
 @return
 */
SymbolPtr JAMOMA_EXPORT jamoma_patcher_get_hierarchy(ObjectPtr patcher);


/** Get the context from the upper jcom model|view in the patcher or from patcher's name.
 @param patcher
 @param returnedContext
 */
void JAMOMA_EXPORT jamoma_patcher_get_context(ObjectPtr *patcher, TTSymbol& returnedContext);


/** Get the class of the patcher from the file name (removing .model and .view convention name if they are in) */
void JAMOMA_EXPORT jamoma_patcher_get_class(ObjectPtr patcher,  TTSymbol context, TTSymbol& returnedClass);


/** Get the name of the patcher from his arguments.
 @param patcher
 @param context
 @param returnedName
 */
void JAMOMA_EXPORT jamoma_patcher_get_name(ObjectPtr patcher, TTSymbol context, TTSymbol& returnedName);

/** Get all context info from the root jcom model|view in the patcher.
 @param patcher
 @param returnedPatcher
 @param returnedContext
 @param returnedClass
 @param returnedName
 */
void JAMOMA_EXPORT jamoma_patcher_share_info(ObjectPtr patcher, ObjectPtr *returnedPatcher, TTSymbol& returnedContext, TTSymbol& returnedClass,  TTSymbol& returnedName);


/** Get patcher's node from the root jcom model|view in the patcher.
 @param obj
 @param patcherNode
 */
void JAMOMA_EXPORT jamoma_patcher_share_node(ObjectPtr obj, TTNodePtr *patcherNode);


/** Get all context info from an object (his patcher and the context, the class and the name of his patcher).
 @param obj
 @param returnedPatcher
 @param returnedContext
 @param modelClass
 @param returnedName
 @return						#TTErr error message if the method does not execute as expected.
 */
TTErr JAMOMA_EXPORT jamoma_patcher_get_info(ObjectPtr obj, ObjectPtr *returnedPatcher, TTSymbol& returnedContext, TTSymbol& returnedClass,  TTSymbol& returnedName);

/** Get j.model or j.view of a patcher 
 @param patcher
 @param returnedModelOrView
 */
void JAMOMA_EXPORT jamoma_patcher_get_model_or_view(ObjectPtr patcher, ObjectPtr *returnedModelOrView);

/** Get the "aClass.model" external in the patcher.
 @param patcher
 @param modelClass
 @param returnedModelPatcher
 */
void JAMOMA_EXPORT jamoma_patcher_get_model_patcher(ObjectPtr patcher, TTSymbol modelClass, ObjectPtr *returnedModelPatcher);



// Tools
///////////////////////////////////////////////

/** Make a typed Atom array from a #TTValue. (NB: This method allocate memory for the Atom array. Make sure to free it afterwards!)
 @param v
 @param msg
 @param argc					The number of arguments of the message.
 @param argv					Pointer to the array of arguments.
 @param shifted
 */
void JAMOMA_EXPORT jamoma_ttvalue_to_typed_Atom(const TTValue& v, SymbolPtr *msg, AtomCount *argc, AtomPtr *argv, TTBoolean& shifted);


/** Make an Atom array from a #TTValue. (NB: This method allocate memory for the Atom array. Make sure to free it afterwards!)
 @param v
 @param argc					The number of arguments of the message.
 @param argv					Pointer to the array of arguments.
 */
void JAMOMA_EXPORT jamoma_ttvalue_to_Atom(const TTValue& v, AtomCount *argc, AtomPtr *argv);


/** Make a #TTValue from Atom array. 
 @param v
 @param msg
 @param argc					The number of arguments of the message.
 @param argv					Pointer to the array of arguments.
 */
void JAMOMA_EXPORT jamoma_ttvalue_from_Atom(TTValue& v, SymbolPtr msg, AtomCount argc, AtomPtr argv);


/** Convert a TTSymbol "MyObjectMessage" into a SymbolPtr "my/object/message"
 or return NULL if the TTSymbol doesn't begin by an uppercase letter.
 @param TTName
 @return
 */
SymbolPtr JAMOMA_EXPORT jamoma_TTName_To_MaxName(TTSymbol TTName);


/** Load an external for internal use. Returns true if successful.
 @param objectname
 @param argc					The number of arguments of the message.
 @param argv					Pointer to the array of arguments.
 @param object
 @return
 */
TTBoolean JAMOMA_EXPORT jamoma_extern_load(SymbolPtr objectname, AtomCount argc, AtomPtr argv, ObjectPtr *object);


/** Returned the N inside "pp/xx.[N]/yyy" and a format string as "pp/xx.%d/yy" and a format string as "pp/xx.%s/yy".
 @param s
 @param si_format
 @param ss_format
 @return
 */
TTUInt32 JAMOMA_EXPORT jamoma_parse_bracket(SymbolPtr s, TTString& si_format, TTString& ss_format);


/** Edit a new instance of the given format address using interger.
 @param format
 @param returnedName
 @param i
 */
void JAMOMA_EXPORT jamoma_edit_numeric_instance(TTString format, SymbolPtr *returnedName, long i);


/** Edit a new instance of the given format address using string.
 @param format
 @param returnedName
 @param s
 */
void JAMOMA_EXPORT jamoma_edit_string_instance(TTString format, SymbolPtr *returnedName, TTString s);


/** Edit a file name from a given file format and a class name.
 @param format
 @param className
 @param returnedFileName
 */
void JAMOMA_EXPORT jamoma_edit_filename(TTString format, TTSymbol className, SymbolPtr *returnedFileName);


/** Parse #N inside address and replace them by parent patcher arguments if there are.
 @param x
 @param address
 @return
 */
SymbolPtr JAMOMA_EXPORT jamoma_parse_dieze(ObjectPtr x, SymbolPtr address);



// Files
///////////////////////////////////////////////

/** Get BOOT style filepath from args or, if no args open a dialog to write a file.
 @param x
 @param argc					The number of arguments of the message.
 @param argv					Pointer to the array of arguments.
 @param default_filename
 @return
 */
TTSymbol JAMOMA_EXPORT jamoma_file_write(ObjectPtr x, AtomCount argc, AtomPtr argv, char* default_filename);


/** Get BOOT style filepath from args or, if no args open a dialog to read a file.
 @param x
 @param argc					The number of arguments of the message.
 @param argv					Pointer to the array of arguments.
 @param filetype
 @return
 */
TTSymbol JAMOMA_EXPORT jamoma_file_read(ObjectPtr x, AtomCount argc, AtomPtr argv, t_fourcc filetype);

#endif // __JAMOMA_MODULAR_FOR_MAX_H__
	


