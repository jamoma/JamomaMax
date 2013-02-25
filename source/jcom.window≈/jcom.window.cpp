/* 
 *	window≈
 *	Jamoma AudioGraph external object for Max
 *	Copyright © 2010 by Timothy Place
 * 
 * License: This code is licensed under the terms of the "New BSD License"
 * http://creativecommons.org/licenses/BSD/
 */

#include "maxAudioGraph.h"

int TTCLASSWRAPPERMAX_EXPORT main(void)
{
	TTAudioGraphInit();
	wrapAsMaxAudioGraph(TT("WindowFunction"), "jcom.window≈", NULL);
	wrapAsMaxAudioGraph(TT("WindowFunction"), "window≈", NULL);
	return 0;
}

