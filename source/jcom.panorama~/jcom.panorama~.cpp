/* 
 *	jcom.panorama~
 *	External object for Max/MSP
 *	A panpot
 *
 *	Copyright © 2008-2011 by Timothy Place, Nils Peters
 * 
 * License: This code is licensed under the terms of the "New BSD License"
 * http://creativecommons.org/licenses/BSD/
 */

#include "TTClassWrapperMax.h"


int TTCLASSWRAPPERMAX_EXPORT main(void)
{	
	WrappedClassOptionsPtr	options = new WrappedClassOptions;
	WrappedClassPtr			c = NULL;	
	TTValue					v(2);
	
	TTDSPInit();
	options->append(TT("fixedNumOutputChannels"), v);
	wrapTTClassAsMaxClass(TT("panorama"), "jcom.panorama~", &c, options);
	CLASS_ATTR_ENUM(c->maxClass, "mode", 0, "calculate lookup");
	CLASS_ATTR_ENUM(c->maxClass, "shape", 0, "equalPower linear squareRoot");
	
	return 0;
}
