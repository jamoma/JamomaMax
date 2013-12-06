/** @file
 *
 * @ingroup implementationMaxExternalsDSP
 *
 * @brief highmidlowshelf~ : wraps the #TTLimiter class as a Jamoma external for MSP
 *
 * @details
 *
 * @authors Tim Place, Trond Lossius
 *
 * @copyright © 2008 by Timothy Place @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */


#include "TTClassWrapperMax.h"

int TTCLASSWRAPPERMAX_EXPORT main(void)
{
	TTDSPInit();
	return wrapTTClassAsMaxClass(TT("limiter"), "j.limiter~", NULL);
}
