/* 
 *	fft≈
 *	External object for Jamoma AudioGraph
 *	Copyright © 2010 by Timothy Place
 * 
 * License: This code is licensed under the terms of the "New BSD License"
 * http://creativecommons.org/licenses/BSD/
 */

#include "maxAudioGraph.h"

int TTCLASSWRAPPERMAX_EXPORT main(void)
{
	wrapAsMaxAudioGraph(TT("fft"), "jcom.fft≈", NULL);
	wrapAsMaxAudioGraph(TT("fft"), "fft≈", NULL);
	return 0;
}
