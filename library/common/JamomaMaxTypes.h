/* 
 * JamomaMaxTypes
 * Data types for Max objects that fit more naturally with the Jamoma coding style.
 * 
 * License: This code is licensed under the terms of the GNU LGPL
 * http://www.gnu.org/licenses/lgpl.html 
 */

#ifndef __JAMOMAMAXTYPES_H__
#define __JAMOMAMAXTYPES_H__

#include "ext.h"					// Max Header
#include "ext_obex.h"				// Max Object Extensions (attributes) Header


typedef t_class*	ClassPtr;
typedef t_object*	ObjectPtr;
typedef t_symbol*	SymbolPtr;
typedef t_atom*		AtomPtr;
typedef long		AtomCount;
typedef t_max_err	MaxErr;

typedef t_linklist*	LinkedListPtr;
typedef t_hashtab*	HashtabPtr;


SymbolPtr SymbolGen(const char* string);	// temporarilty implemented in Jamoma.cpp
											// use this instead of gensym() so that we don't have tons of const warnings

#define SELF (ObjectPtr(self))

#endif // __JAMOMAMAXTYPES_H__
