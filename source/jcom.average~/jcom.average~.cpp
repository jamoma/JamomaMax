/* 
 *	External object for Max/MSP
 *	Copyright © 2010 by Timothy Place
 * 
 * License: This code is licensed under the terms of the "New BSD License"
 * http://creativecommons.org/licenses/BSD/
 */

#include "TTClassWrapperMax.h"

int TTCLASSWRAPPERMAX_EXPORT main(void)
{
	WrappedClassOptionsPtr	options = new WrappedClassOptions;
	WrappedClassPtr			c = NULL;
	
	TTDSPInit();
	wrapTTClassAsMaxClass(TT("average"), "jcom.average~", &c, options);
	CLASS_ATTR_ENUM(c->maxClass, "mode", 0, "absolute bipolar rms");
	return 0;
}
