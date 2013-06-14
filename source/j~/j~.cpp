/** @file
 *
 * @ingroup implementationMax
 *
 * @brief jamoma~ : creates an MSP external that is able to wrap any Jamoma class
 *
 * @details
 *
 * @authors Tim Place
 *
 * @copyright © 2012 by Timothy Place @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */


#include "TTClassWrapperMax.h"
#include "TTDSP.h"

// Prototypes for methods
ObjectPtr	jamoma_new(SymbolPtr s, AtomCount argc, AtomPtr argv);
ObjectPtr	wrappedClass_new(SymbolPtr name, AtomCount argc, AtomPtr argv);
void		wrappedClass_free(WrappedInstancePtr x);

// Globals
static ClassPtr		s_jamoma_class;
static t_hashtab*	s_jamoma_class_hash = NULL;

/************************************************************************************/
// Define a Max class that does essentially nothing but let users type the name into an object box.
// The class we actually use will be defined in the new method.

int TTCLASSWRAPPERMAX_EXPORT main(void)
{
	s_jamoma_class = class_new("j~", (method)jamoma_new, (method)wrappedClass_free, sizeof(WrappedInstance), (method)0L, A_GIMME, 0);
	class_register(CLASS_BOX, s_jamoma_class);

	common_symbols_init();
	TTDSPInit();
	return 0;
}

/************************************************************************************/
// When a new instance of jamoma~ is created, we look at the first argument to get a Jamoma class name.
// Then we wrap that class as a Max class.
// Finally, we proceed to then instantiate the new Max class instead of the jamoma~ Max class.

ObjectPtr jamoma_new(SymbolPtr s, AtomCount argc, AtomPtr argv)
{
	int				attrstart = attr_args_offset(argc, argv);
	int				i = 0;
	int				channelCount = 2;
	SymbolPtr		className = gensym("gain");
	WrappedClassPtr	classWrapper = NULL;
	char			maxClassName[256];

	if (!attrstart) {
		error("must specify a jamoma class as the first argument");
		return NULL;
	}
	while (attrstart--) {
		if (atom_gettype(argv+i) == A_LONG)
			channelCount = atom_getlong(argv+i);
		else if (atom_gettype(argv+i) == A_SYM)
			className = atom_getsym(argv+i);
		i++;
	}
	
	snprintf(maxClassName, 256, "j.%s~", className->s_name);

	if (!s_jamoma_class_hash)
		s_jamoma_class_hash = hashtab_new(0);
	hashtab_lookup(s_jamoma_class_hash, className, (t_object**)&classWrapper);

	if (!classWrapper) {
		wrapTTClassAsMaxClass(className->s_name, maxClassName, &classWrapper);
		hashtab_store(s_jamoma_class_hash, className, ObjectPtr(classWrapper));
	}

	return wrappedClass_new(gensym(maxClassName), argc-1, argv+1);
}
