/** @file
 *
 * @ingroup implementationMaxExternalsDSP
 *
 * @brief j.onepole~ : wraps the #TTOnePole class as a Jamoma external for MSP
 *
 * @details Simple One Pole Filter Object
 *
 * @authors Tim Place, Trond Lossius
 *
 * @copyright © 2010 by Timothy Place @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */


#include "TTClassWrapperMax.h"

int C74_EXPORT main(void)
{
	TTDSPInit();
	return wrapTTClassAsMaxClass(TT("onepole"), "j.onepole~", NULL);
}
