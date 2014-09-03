/** @file
 *
 * @ingroup implementationMaxLibrary
 *
 * @brief The global jamoma object.
 *
 * @details Functions and resources used by Max objects.
 *
 * @authors Tim Place, Trond Lossius
 *
 * @copyright Copyright © 2007, Tim Place @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */

#include "JamomaObject.h"

// statics and globals
static t_class		*s_jamoma_class;

/************************************************************************************/

void jamoma_object_initclass(void)
{
	t_class *c;
	
	// Define our class
	c = class_new(	"jamoma", 
					(method)jamoma_object_new, 
					(method)jamoma_object_free, 
					sizeof(t_jamoma_object), 
					(method)NULL, 
					0L, 0);

	// Finalize our class
	class_register(CLASS_BOX, c);
	s_jamoma_class = c;
}


t_object *jamoma_object_new()
{
	t_jamoma_object		*obj = (t_jamoma_object *)object_alloc(s_jamoma_class);
	if (obj) {
		;
	}
	return (t_object*)obj;
}


void jamoma_object_free(t_jamoma_object *obj)
{
	;
}

