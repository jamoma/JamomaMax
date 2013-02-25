/* 
 *	External object for Max/MSP
 *	Copyright © 2010 by Timothy Place
 * 
 *	License: This code is licensed under the terms of the "New BSD License"
 *	http://creativecommons.org/licenses/BSD/
 */

#include "TTClassWrapperMax.h"

int TTCLASSWRAPPERMAX_EXPORT main(void)
{
	WrappedClassOptionsPtr	options = new WrappedClassOptions;
    WrappedClassPtr			c = NULL;
	
	TTDSPInit();	
	wrapTTClassAsMaxClass(TT("allpass"), "jcom.allpass~", &c, options);
	CLASS_ATTR_ENUM(c->maxClass, "filter", 0, "allpass.1a allpass.1b allpass.2a allpass.2b allpass.2c allpass.4a");
	return 0;
}

