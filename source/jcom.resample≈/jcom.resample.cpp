/* 
 *	resample≈
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
	wrapAsMaxAudioGraph(TT("resample"), "jcom.resample≈", NULL);
	wrapAsMaxAudioGraph(TT("resample"), "resample≈", NULL);
	return 0;
}

