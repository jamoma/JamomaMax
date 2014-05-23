/** @file
 *
 * @ingroup implementationMaxExternalsDSP
 *
 * @brief j.allpass~ : wrapping the #TTAllpass class as an MSP external
 *
 * @details
 *
 * @authors Timothy Place
 *
 * @copyright © 2010 by Timothy Place @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */

#include "TTClassWrapperMax.h"

int C74_EXPORT main(void)
{
	WrappedClassOptionsPtr	options = new WrappedClassOptions;
    WrappedClassPtr			c = NULL;
	
	TTDSPInit();	
	wrapTTClassAsMaxClass(TT("allpass"), "j.allpass~", &c, options);
	CLASS_ATTR_ENUM(c->maxClass, "filter", 0, "allpass.1a allpass.1b allpass.2a allpass.2b allpass.2c allpass.4a");
	return 0;
}

