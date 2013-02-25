/* 
 *	pulsesub≈
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
	wrapAsMaxAudioGraph(TT("pulsesub"), "jcom.pulsesub≈", NULL);
	wrapAsMaxAudioGraph(TT("pulsesub"), "pulsesub≈", NULL);
	return 0;
}

