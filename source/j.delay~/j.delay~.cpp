/** @file
 *
 * @ingroup implementationMax
 *
 * @brief delay~ : Delays a signal using several interpolation methods
 *
 * @details This wraps the Jamoma DSP class #TTDelay as a Jamoma external for Max MSP
 *
 * @authors Tim Place, Trond Lossius
 *
 * @copyright Copyright © 2009 by Timothy Place @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */


#include "TTClassWrapperMax.h"

int TTCLASSWRAPPERMAX_EXPORT main(void)
{
	TTDSPInit();
	return wrapTTClassAsMaxClass(TT("delay"), "j.delay~", NULL);
}

