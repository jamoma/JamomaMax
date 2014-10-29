/** @file
 *
 * @ingroup implementationMaxExternalsDSP
 *
 * @brief j.waveshaper~ : wraps the #TTWaveshaper class as a Jamoma external for MSP
 *
 * @details
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
	return wrapTTClassAsMaxClass(TT("waveshaper"), "j.waveshaper~", NULL);
}

