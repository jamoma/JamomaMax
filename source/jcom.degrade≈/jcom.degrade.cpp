/* 
 *	degrade≈
 *	Jamoma AudioGraph external object for Max
 *	Copyright © 2008 by Timothy Place
 * 
 * License: This code is licensed under the terms of the "New BSD License"
 * http://creativecommons.org/licenses/BSD/
 */

#include "maxAudioGraph.h"

int TTCLASSWRAPPERMAX_EXPORT main(void)
{
	TTAudioGraphInit();
	wrapAsMaxAudioGraph(TT("degrade"), "jcom.degrade≈", NULL);
	wrapAsMaxAudioGraph(TT("degrade"), "degrade≈", NULL);
	return 0;
}

