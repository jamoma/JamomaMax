/** @file
 *
 * @ingroup implementationMax
 *
 * @brief jcom.average≈ : Signal average analysis object for Jamoma AudioGraph.
 *
 * @details This wraps the Jamoma DSP class #TTAverage as a Jamoma AudioGraph external for Max.
 *
 * @authors Tim Place, Trond Lossius
 *
 * @copyright Copyright © 2010 by Timothy Place @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */


#include "TTClassWrapperMax.h"

int TTCLASSWRAPPERMAX_EXPORT main(void)
{
	WrappedClassOptionsPtr	options = new WrappedClassOptions;
	WrappedClassPtr			c = NULL;
	
	TTDSPInit();
	wrapTTClassAsMaxClass(TT("average"), "j.average~", &c, options);
	CLASS_ATTR_ENUM(c->maxClass, "mode", 0, "absolute bipolar rms");
	return 0;
}
