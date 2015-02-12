/** @file
 *
 * @ingroup implementationMaxExternalsDSP
 *
 * @brief j.array~ : wrapping the #TTArray class as an MSP external
 *
 * @details This wraps the Jamoma DSP class #TTAudioObjectBaseArray as a Jamoma DSP external for Max.
 *
 * @authors Timothy Place
 *
 * @copyright © 2011 by Timothy Place @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */


#include "TTClassWrapperMax.h"

int C74_EXPORT main(void)
{
	TTDSPInit();
	return wrapTTClassAsMaxClass(TT("array"), "j.array~", NULL);
}

