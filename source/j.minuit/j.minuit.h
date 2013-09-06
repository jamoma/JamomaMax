/** @file
 *
 * @ingroup implementationMax
 *
 * @brief minuit : wraps the #Minuit ProtocolLib extension class part 
 *
 * @details Minuit protocol is a query-answer protocol built on top of the OSC protocol
 *
 * @authors Theo de la Hogue
 *
 * @copyright © 2010-13 by Theo de la Hogue @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */

#include "TTModularClassWrapperMax.h"

#define dump_out 0

static TTSymbol kTTSym_Minuit;

// This is used to store extra data
typedef struct extra {
	
	TTSymbol			applicationName;	// remember the application name it handles
	
} t_extra;
#define EXTRA ((t_extra*)x->extra)


// Definitions

/** Wrap the j.minuit class as a Max object.
 @param c			The class to be wrapped
 @see				WrappedOutputClass_new, WrappedOutputClass_free
 */
void	WrapMinuitClass(WrappedClassPtr c);

/** Wrapper for the j.minuit constructor class, called when an instance is created.
 @param self		Pointer to this object.
 @param argc		The number of arguments passed to the object.
 @param argv		Pointer to an array of atoms passed to the object.
 @see				WrappedMinuitClass_free
 */
void	WrappedMinuitClass_new(TTPtr self, AtomCount argc, AtomPtr argv);

/** Wrapper for the j.minuit deconstructor class, called when an instance is destroyed.
 @param self		Pointer to this object.
 @see				WrappedOutputClass_new
 */
void	WrappedMinuitClass_free(TTPtr self);

/** Assistance Method.
 @param self		Pointer to this object.
 @param b			Pointer to (exactly what?)
 @param msg			The message passed to the object.
 @param arg
 @param dst			Pointer to the destination that assistance strings are passed to for display.
 */
void	minuit_assist(TTPtr self, void *b, long msg, long arg, char *dst);

/** ...
 @param self		Pointer to this object.
 @param msg			The message sent to this object.
 @param argc		The number of arguments passed to the object.
 @param argv		Pointer to an array of atoms passed to the object.
 @see				...
 */
void	minuit_return_activity_in(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);

/** ...
 @param self		Pointer to this object.
 @param msg			The message sent to this object.
 @param argc		The number of arguments passed to the object.
 @param argv		Pointer to an array of atoms passed to the object.
 @see				...
 */
//void	minuit_protocol_setup(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);

/** ...
 @param self		Pointer to this object.
 @param msg			The message sent to this object.
 @param argc		The number of arguments passed to the object.
 @param argv		Pointer to an array of atoms passed to the object.
 @see				...
 */
//void	minuit_namespace_read(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);

/** ...
 @param self		Pointer to this object.
 @param msg			The message sent to this object.
 @param argc		The number of arguments passed to the object.
 @param argv		Pointer to an array of atoms passed to the object.
 @see				...
 */
//void	minuit_namespace_doread(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);

/** ...
 @param self		Pointer to this object.
 @param msg			The message sent to this object.
 @param argc		The number of arguments passed to the object.
 @param argv		Pointer to an array of atoms passed to the object.
 @see				...
 */
//void	minuit_namespace_write(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);

/** ...
 @param self		Pointer to this object.
 @param msg			The message sent to this object.
 @param argc		The number of arguments passed to the object.
 @param argv		Pointer to an array of atoms passed to the object.
 @see				...
 */
//void	minuit_namespace_dowrite(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);
