/** @file
 *
 * @ingroup implementationMax
 *
 * @brief Wraps Jamoma Core classes as objects for Max/MSP
 *
 * @details
 *
 * @authors Timothy Place, Theo de la Hogue, Trond Lossius
 *
 * @copyright © 2010-13 by Timothy Place, Theo de la Hogue @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */


#ifndef __TT_MODULAR_CLASS_WRAPPER_MAX_H__
#define __TT_MODULAR_CLASS_WRAPPER_MAX_H__

#include "ext.h"					// Max Header
#include "ext_obex.h"				// Max Object Extensions (attributes) Header
#include "ext_user.h"
#include "ext_common.h"
#include "ext_hashtab.h"

#ifdef UI_EXTERNAL
#include "jpatcher_api.h"			// jpatcher_api.h must come before z_dsp.h
#include "jgraphics.h"
#endif

#include "TTClassWrapperMax.h"

#include "TTModular.h"				// Jamoma Modular API
#include "JamomaForMax.h"           // Jamoma for Max
#include "TTInputAudio.h"
#include "TTOutputAudio.h"


#define selectedObject getSelectedObject(x)
#define selectedAddress x->cursor

#define MAX_ARRAY_SIZE 256


/** Definition for specific TT class things. TODO: This description is non-informative.
 @param c
 @ingroup typedefs
*/
typedef void (*Spec_WrapTTModularClass)(WrappedClassPtr c);


/** Wrapper for the new method, called when a new obejct is being instantiated.
 @param self		This object
 @param argc		Atom array count (length) for the array of arguments
 @param argv		Pointer to the atom array of arguments
 @ingroup typedefs
*/
typedef void (*Spec_WrappedClass_new)(TTPtr self, AtomCount argc, AtomPtr argv);


/** Wrapper for the 'free' method, called when an object is being freed.
 @details Free up memory, ensure that any events scheduled in the future are terminated, etc.
 @param self		This object
 @ingroup typedefs
*/
typedef void (*Spec_WrappedClass_free)(TTPtr self);


/** Wrapper for the method called in response to 'anything' messages.
 @details This wrapped method catches all messages to the object that have not been declared on and associated with their own specific methods.
 @param self		This object
 @param msg			Message passed to this object
 @param argc		Atom array count (length) for the array of arguments
 @param argv		Pointer to the atom array of arguments
*/
typedef void (*Spec_WrappedClass_anything)(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);


/** Wrapper for a method called when the object receives notifications.
 @details Examples of notifications are messages sent to the node, or notifications about changes to the patcher context, e.g., that the containing patch is being deleted.
 @param self		This object
 @param s			TODO: What is this?
 @param msg			The notification message
 @param sender		Pointer to the notifier
 @param data		Additional data provided as arguments to the notification
*/
typedef t_max_err (*Spec_WrappedClass_notify)(TTPtr self, t_symbol *s, t_symbol *msg, void *sender, void *data);


/**
*/
typedef struct _modularSpecificities {
	
	Spec_WrapTTModularClass		_wrap;
	Spec_WrappedClass_new		_new;
	Spec_WrappedClass_free		_free;
	Spec_WrappedClass_anything	_any;
	Spec_WrappedClass_notify	_notify;
	
} ModularSpec;


/** Data Structure for this object
*/
typedef struct _wrappedModularInstance {
#ifdef AUDIO_EXTERNAL
	t_pxobject								obj;						///< Max msp object header
#else 
#ifdef UI_EXTERNAL
	t_jbox									box;						///< Max ui object header
#else
    t_object								obj;						///< Max control object header
#endif
#endif
	TTHandle								inlets;						///< an array of inlets
	long									index;						///< index of the inlet used
	TTHandle								outlets;					///< an array of outlet
	SymbolPtr								msg;
	AtomCount								argc;						
	AtomPtr									argv;

	WrappedClassPtr							wrappedClassDefinition;		///< A pointer to the class definition

#ifndef ARRAY_EXTERNAL
	TTObjectBasePtr							wrappedObject;				///< The instance of the TTBlue object we are wrapping
	TTSubscriberPtr							subscriberObject;			///< The instance of a TTSubscriber object used to 
																		///< register the wrapped object in the tree structure
#endif
	
	TTBoolean								useInternals;				///< The hash table can be used as an array of wrappedObject
	TTHashPtr								internals;					///< An hash table to store any internal TTObjectBases (like TTData, TTViewer, ...)
	TTBoolean								iterateInternals;			///< The flag is true when an iteration is done on the internals
	TTSymbol								cursor;						///< to select an entry in x->internals
	
	TTAddress								address;					///< sometime external needs to store an address (e.g. send, receive, view, ...)
	
	ObjectPtr								patcherPtr;					///< the patcher in which the external is (ignoring subpatcher)
	TTSymbol								patcherContext;				///< the patcher context in which the external is (model, view)
	TTSymbol								patcherClass;				///< the patcher class in which the external is
	TTSymbol								patcherName;				///< the patcher name in which the external is
	TTAddress								patcherAddress;				///< the patcher address in which the external is
	
#ifdef ARRAY_EXTERNAL
	TTUInt32								arraySize;					// the size of the array size for iteration
	TTUInt32								arrayIndex;					// the index number for array selection
	TTAddress								arrayAddress;				// keep the address in memory to filter repetitions
	TTValue									arrayArgs;					// keep attributes argument of the external for dynamic creation
	
	TTString								arrayFormatInteger;         ///< a format string to edit numeric instance
	TTString								arrayFormatString;			///< a format string to edit string instance
	
	SymbolPtr								arrayAttrFormat;			// Is it 'single' format output or 'array' format output
#endif
	
	void*									extra;						///< used to keep very specific things
	
} WrappedModularInstance;

typedef WrappedModularInstance* WrappedModularInstancePtr;	///< Pointer to a wrapped instance of our object.



// FUNCTIONS


/** tools to copy msg, argc and argv into the member msg, argc and argv of the WrappedModularInstance
*/
void		copy_msg_argc_argv(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);

// Use internals to store several objects :

/**
 */
TTErr		makeInternals_data(TTPtr self, TTAddress address, TTSymbol name, SymbolPtr callbackMethod, TTPtr context, TTSymbol service, TTObjectBasePtr *returnedData, TTBoolean deferlow = NO);
TTErr		makeInternals_explorer(TTPtr self, TTSymbol name, SymbolPtr callbackMethod, TTObjectBasePtr *returnedExplorer, TTBoolean deferlow = NO);


/**
 */
TTErr		makeInternals_viewer(TTPtr self, TTAddress address, TTSymbol name, SymbolPtr callbackMethod, TTObjectBasePtr *returnedViewer, TTBoolean deferlow = NO);


/**
 */
TTErr		makeInternals_receiver(TTPtr self, TTAddress address, TTSymbol name, SymbolPtr callbackMethod, TTObjectBasePtr *returnedReceiver, TTBoolean deferlow = NO, TTBoolean appendNameAsAttribute = NO);

/**
 */
TTErr       makeInternals_sender(TTPtr self, TTAddress address, TTSymbol name, TTObjectBasePtr *returnedSender, TTBoolean appendNameAsAttribute = NO);

/**
 */
TTErr		removeInternals_data(TTPtr self, TTAddress address, TTSymbol name);


/** In case internals table is used as an array of wrappedObject here is a method usefull to get the selected object in both case (use wrappedObject or use internals)
*/
TTObjectBasePtr	getSelectedObject(WrappedModularInstancePtr x);


/** Wrap a TTBlue class as a Max class.
*/
TTErr		wrapTTModularClassAsMaxClass(TTSymbol& ttblueClassName, const char* maxClassName, WrappedClassPtr* c, ModularSpec* specificities);


/** Wrapped methods ('self' has to be TTPtr because different wrappers (such as the ui wrapper) have different implementations)
 @param name		Message passed to this object
 @param argc		Atom array count (length)
 @param argv		Pointer to the atom array
*/
ObjectPtr	wrappedModularClass_new(SymbolPtr name, AtomCount argc, AtomPtr argv);


/**
*/
void		wrappedModularClass_unregister(WrappedModularInstancePtr x);


/**
*/
void		wrappedModularClass_free(WrappedModularInstancePtr x);


/**
*/
t_max_err	wrappedModularClass_notify(TTPtr self, t_symbol *s, SymbolPtr msg, void *sender, void *data);


/**
*/
void		wrappedModularClass_shareContextNode(TTPtr self, TTNodePtr *contextNode);


/**
 @param self		This object
 @param s			Message passed to this object
 @param argc		Atom array count (length)
 @param argv		Pointer to the atom array
*/
t_max_err	wrappedModularClass_attrGet(TTPtr self, ObjectPtr attr, AtomCount* argc, AtomPtr* argv);


/**
 @param self		This object
 @param s			Message passed to this object
 @param argc		Atom array count (length)
 @param argv		Pointer to the atom array
*/
t_max_err	wrappedModularClass_attrSet(TTPtr self, ObjectPtr attr, AtomCount argc, AtomPtr argv);


/**
 @param self		This object
 @param s			Message passed to this object
 @param argc		Atom array count (length)
 @param argv		Pointer to the atom array
*/
void		wrappedModularClass_anything(TTPtr self, SymbolPtr s, AtomCount argc, AtomPtr argv);


/**
 @param self		This object
 @param s			Message passed to this object
 @param argc		Atom array count (length)
 @param argv		Pointer to the atom array
*/
TTErr		wrappedModularClass_sendMessage(TTPtr self, SymbolPtr s, AtomCount argc, AtomPtr argv);


/**
 @param self		This object
 @param s			Message passed to this object
 @param argc		Atom array count (length)
 @param argv		Pointer to the atom array
*/
TTErr		wrappedModularClass_setAttribute(TTPtr self, SymbolPtr s, AtomCount argc, AtomPtr argv);


/**
*/
void		wrappedModularClass_dump(TTPtr self);


#ifdef UI_EXTERNAL
void		wrappedModularClass_paint(WrappedModularInstancePtr x, t_object *view);


/**
*/
TTPtr		wrappedModularClass_oksize(TTPtr self, t_rect *newrect);


/**
*/
void		wrappedModularClass_mousedblclick(TTPtr self, ObjectPtr patcherview, t_pt pt, long modifiers);


/**
*/
void		wrappedModularClass_mousedown(TTPtr self, ObjectPtr patcherview, t_pt pt, long modifiers);


/**
*/
void		wrappedModularClass_mousedrag(TTPtr self, ObjectPtr patcherview, t_pt pt, long modifiers);


/**
*/
void		wrappedModularClass_mouseup(TTPtr self, ObjectPtr patcherview, t_pt pt, long modifiers);


/**
*/
void		wrappedModularClass_mouseenter(TTPtr self, ObjectPtr patcherview, t_pt pt, long modifiers);


/**
*/
void		wrappedModularClass_mousemove(TTPtr self, ObjectPtr patcherview, t_pt pt, long modifiers);


/**
*/
void		wrappedModularClass_mouseleave(TTPtr self, ObjectPtr patcherview, t_pt pt, long modifiers);


/**
*/
int			convertModifiersFromMaxToTTGraphics(int maxModifiers);
#endif


#ifdef ARRAY_EXTERNAL
/**
 @param attr		The name of the attribute to get
 @param s			Message passed to this object
 @param argc		Atom array count (length)
 @param argv		Pointer to the atom array
*/
t_max_err	wrappedModularClass_FormatGet(TTPtr self, TTPtr attr, AtomCount *ac, AtomPtr *av);


/**
 @param self		This object
 @param attr		The name of the attribute to set
 @param argc		Atom array count (length)
 @param argv		Pointer to the atom array
*/
t_max_err	wrappedModularClass_FormatSet(TTPtr self, TTPtr attr, AtomCount ac, AtomPtr av);


/**
 @param self		This object
 @param msg			Message passed to this object
 @param argc		Atom array count (length)
 @param argv		Pointer to the atom array
*/
void		wrappedModularClass_ArraySelect(TTPtr self, SymbolPtr msg, AtomCount ac, AtomPtr av);


/**
*/
void		wrappedModularClass_ArrayResize(TTPtr self, long newSize);
#endif

#endif // __TT_MODULAR_CLASS_WRAPPER_MAX_H__
