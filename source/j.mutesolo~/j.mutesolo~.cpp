/** @file
 *
 * @ingroup implementationMaxExternalsDSP
 *
 * @brief j.mutesolo~ : wraps the #TTMutesolo class as a Jamoma external for MSP
 *
 * @details
 *
 * @authors Trond Lossius
 *
 * @copyright © 2014 by Trond Lossius @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */


#include "TTClassWrapperMax.h"

int TTCLASSWRAPPERMAX_EXPORT main(void)
{
	TTDSPInit();
	return wrapTTClassAsMaxClass(TT("mutesolo"), "j.mutesolo~", NULL);
}
