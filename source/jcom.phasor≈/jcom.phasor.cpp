/* 
 *	phasor≈
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

	TTAudioGraphInit();

	options->append(TT("generator"), value);
	wrapAsMaxAudioGraph(TT("phasor"), "jcom.phasor≈", NULL, options);
	wrapAsMaxAudioGraph(TT("phasor"), "phasor≈", NULL, options);
	return 0;
}

