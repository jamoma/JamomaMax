/* 
 	tt.onepole~
 	External object for Max/MSP

 	Simple One Pole Filter Object
 	Copyright © 2010 by Timothy Place
  
	License: This code is licensed under the terms of the GNU LGPL
	http://www.gnu.org/licenses/lgpl.html 
 */

#include "TTClassWrapperMax.h"

int TTCLASSWRAPPERMAX_EXPORT main(void)
{
	TTDSPInit();
	return wrapTTClassAsMaxClass(TT("onepole"), "jcom.onepole~", NULL);
}
