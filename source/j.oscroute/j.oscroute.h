/** @file
 *
 * @ingroup implementationMaxExternals
 *
 * @brief j.oscroute - parse and pass OSC messages
 *
 * @details
 *
 * @authors Tim Place, Trond Lossius
 *
 * @copyright Copyright © 2006 Tim Place @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */

#include "JamomaForMax.h"

#define MAX_ARGCOUNT 100
#define MAX_MESS_SIZE 2048

typedef struct _oscroute{						///< Data Structure for this object.
	t_object		ob;							///< REQUIRED: Our object,
	void			*outlets[MAX_ARGCOUNT];		///< my outlet array.
	void			*outlet_overflow;			///< This outlet doubles as the dumpout outlet.
	t_symbol		*arguments[MAX_ARGCOUNT];	///< Symbols to match.
	long unsigned	arglen[MAX_ARGCOUNT];		///< strlen of symbols to match,
	short			num_args;
	void*			proxy_inlet[MAX_ARGCOUNT];	///< Array of pointers to inlets for changing what symbols to route.
} t_oscroute;

// Prototypes for our methods:

/** Object instance constructor.
 @param s			Symbol passed as an argument to the new object instance.
 @param argc		The number of arguments passed to the new object instance.
 @param argv		The arguments passed to the object instance as a pointer to an array.
 */
void *oscroute_new(t_symbol *s, long argc, t_atom *argv);



/** Object instance destructor, ensures that all memory assigned is properly freed.
 @param x			Pointer to the object instance to free.
 */
void oscroute_free(t_oscroute *x);


/** Provide assistance on input and output while patching.
 @param x		The object instance.
 @param b
 @param	msg		Determines if assistance is requested for an input or output.
 @param arg		Determines what input/output assistance is requested for.
 @param dst		Destination address that assistance string is copied to.
 */
void oscroute_assist(t_oscroute *x, void *b, long msg, long arg, char *dst);


/** Method called when a "bang" is passed to the object.
 The bang is passed straight on to the rightmost (overflow) outlet.
 @param x			The object instance.
 */
void oscroute_bang(t_oscroute *x);


/** Method called when an "int" is passed to the object.
 @details Integer values are passed straight to the rightmost (overflow) outlet.
 @param x			The object instance.
 @param n			The integer value passed to the object instance.
 */
void oscroute_int(t_oscroute *x, long n);


/** Method called when a "float" is passed to the object.
 @details Floats are passed straight to the rightmost (overflow) outlet.
 @param x			The object instance.
 @param f			The float value passed to the object instance.
 */
void oscroute_float(t_oscroute *x, double f);


/** Method called when a list is passed to the object.
 @details Lists are passed straight to the rightmost (overflow) outlet.
 @param x			The object instance.
 @param msg			The message passed to the object, usually "list".
 @param argc		The number of arguments.
 @param argv		The arguments of the list as a pointer to an array.
 */
void oscroute_list(t_oscroute *x, t_symbol *msg, long argc, t_atom *argv);


/** Method called when a symbol is passed to the object.
 @details The symbol is compared to the various symbols that the object instance is looking for.
 If there's a match, the message is stripped of the matched part of the message, and passed to the appropriate outlet.
 If not the messae is passed on to the rightmost (overflow) outlet.
 @param x			The object instance.
 @param msg			The message passed to the object.
 @param argc		The number of arguments.
 @param argv		The arguments of the list as a pointer to an array.
 */
void oscroute_symbol(t_oscroute *x, t_symbol *msg, long argc, t_atom *argv);


// Globals
t_class		*oscroute_class;				///< Required: Global pointer for our class

