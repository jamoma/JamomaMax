/* 
 *	jcom.delay~
 *	External object for Max/MSP
 *	Delays a signal using several interpolation methods
 *	Example project for JamomaDSP
 *	Copyright © 2009 by Timothy Place
 * 
 * License: This code is licensed under the terms of the "New BSD License"
 * http://creativecommons.org/licenses/BSD/
 */

#include "TTClassWrapperMax.h"

int TTCLASSWRAPPERMAX_EXPORT main(void)
{
	TTDSPInit();
	return wrapTTClassAsMaxClass(TT("delay"), "jcom.delay~", NULL);
}

