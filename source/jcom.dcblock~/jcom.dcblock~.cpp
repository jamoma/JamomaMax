/* 
 *	tt.dcblock~
 *	External object for Max/MSP
 *	Remove DC Offsets from a signal
 *	Example project for TTBlue
 *	Copyright © 2008 by Timothy Place
 * 
 * License: This code is licensed under the terms of the "New BSD License"
 * http://creativecommons.org/licenses/BSD/
 */

#include "TTClassWrapperMax.h"

int TTCLASSWRAPPERMAX_EXPORT main(void)
{
	TTDSPInit();
	return wrapTTClassAsMaxClass(TT("dcblock"), "jcom.dcblock~", NULL);
}

