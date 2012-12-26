/* 
 * JamomaMaxTypes
 * Data types for Max objects that fit more naturally with the Jamoma coding style.
 * 
 * License: This code is licensed under the terms of the "New BSD License"
 * http://creativecommons.org/licenses/BSD/
 */

#ifndef __MAX_OBJECT_TYPES_H__
#define __MAX_OBJECT_TYPES_H__

#ifndef WIN_VERSION
#include <Carbon/Carbon.h>
#endif

#include "ext.h"					// Max Header
#include "ext_obex.h"				// Max Object Extensions (attributes) Header
#include "z_dsp.h"

typedef t_pxobject	MspObject;

typedef t_class*	ClassPtr;
typedef t_object*	ObjectPtr;
typedef MspObject*	MspObjectPtr;
typedef t_symbol*	SymbolPtr;
typedef t_atom*		AtomPtr;
typedef long		AtomCount;
typedef t_max_err	MaxErr;

typedef t_linklist*	LinkedListPtr;
typedef t_hashtab*	HashtabPtr;


//SymbolPtr SymbolGen(const char* string);	// temporarilty implemented in Jamoma.cpp
											// use this instead of gensym() so that we don't have tons of const warnings
template <class T>
SymbolPtr SymbolGen(T stringArg)
{
	return gensym((char*)stringArg);
}

template <class T>
SymbolPtr SymbolGen(const char* stringArg)
{
	return gensym((char*)stringArg);
}
											
#ifndef SELF
#define SELF (ObjectPtr(self))
#endif

#endif // __MAX_OBJECT_TYPES_H__
