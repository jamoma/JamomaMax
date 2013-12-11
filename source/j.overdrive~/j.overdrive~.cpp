/** @file
 *
 * @ingroup implementationMaxExternalsDSP
 *
 * @brief j.overdrive~ : wraps the #TTOverdrive class as a Jamoma external for MSP
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
	WrappedClassOptionsPtr	options = new WrappedClassOptions;
	TTValue					value;

	TTDSPInit();
	
	value.clear();
	value.append(TT("drive"));
	options->append(TT("additionalSignalInputSetsAttribute"), value);	
	
	return wrapTTClassAsMaxClass(TT("overdrive"), "j.overdrive~", NULL, options);
}
