/** @file
 *
 * @ingroup implementationMax
 *
 * @brief dcblock~ : Remove DC Offsets from a signal
 *
 * @details This wraps the Jamoma DSP class #TTDCBlock as a Jamoma external for Max MSP
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
	return wrapTTClassAsMaxClass(TT("dcblock"), "jcom.dcblock~", NULL);
}

