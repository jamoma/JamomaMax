/** @file
 *
 * @ingroup implementationMax
 *
 * @brief jcom.clip≈ : Range clipping external for Jamoma AudioGraph.
 *
 * @details This wraps the Jamoma DSP class #Clipper as a Jamoma AudioGraph external for Max.
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
	TTDSPInit();
	return wrapTTClassAsMaxClass(TT("clipper"), "jcom.clip~", NULL);
}
