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
	TTDSPInit();
	return wrapTTClassAsMaxClass(TT("clipper"), "jcom.clip~", NULL);
}
