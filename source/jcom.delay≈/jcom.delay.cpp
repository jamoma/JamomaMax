/* 
 *	delay≈
 *	Jamoma AudioGraph external object for Max
 *	Copyright © 2008 by Timothy Place
 * 
 * License: This code is licensed under the terms of the "New BSD License"
 * http://creativecommons.org/licenses/BSD/
 */

#include "maxAudioGraph.h"

int TTCLASSWRAPPERMAX_EXPORT main(void)
{   
	MaxAudioGraphWrappedClassOptionsPtr	options = new MaxAudioGraphWrappedClassOptions;
	TTValue								value(0);
	MaxAudioGraphWrappedClassPtr			c = NULL;
	
	TTAudioGraphInit();
	
	wrapAsMaxAudioGraph(TT("delay"), "jcom.delay≈", &c, options);
	CLASS_ATTR_ENUM(c->maxClass, "interpolation", 0, "none linear cubic");

	wrapAsMaxAudioGraph(TT("delay"), "delay≈", &c, options);
	CLASS_ATTR_ENUM(c->maxClass, "interpolation", 0, "none linear cubic");

	return 0;
}

