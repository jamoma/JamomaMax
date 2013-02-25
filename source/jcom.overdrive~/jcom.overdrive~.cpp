/* 
 *	tt.overdrive~
 *	External object for Max/MSP
 * 
 *	
 *	Copyright © 2008 by Timothy Place
 * 
 * License: This code is licensed under the terms of the "New BSD License"
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
	
	return wrapTTClassAsMaxClass(TT("overdrive"), "jcom.overdrive~", NULL, options);
}
