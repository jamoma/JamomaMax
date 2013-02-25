/* 
 *	limiter≈
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
	wrapAsMaxAudioGraph(TT("limiter"), "jcom.limiter≈", NULL);
	wrapAsMaxAudioGraph(TT("limiter"), "limiter≈", NULL);
	return 0;
}

