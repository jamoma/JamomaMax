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
	TTValue					value;
	WrappedClassPtr			c = NULL;

	TTFoundationInit();
	
	value.clear();
	value.append(0);
	options->append(TT("fixedNumChannels"), value);
	
	wrapTTClassAsMaxClass(TT("net.send"), "jcom.net.send", &c, options);
	CLASS_ATTR_ENUM(c->maxClass, "mode", 0, "tcp udp");
	return 0;
}
