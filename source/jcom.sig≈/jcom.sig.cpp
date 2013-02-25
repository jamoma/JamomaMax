/* 
 *	sig≈
 *	Object to generate a signal from a constant for Jamoma Audio Graph
 *	Copyright © 2010 by Timothy Place
 * 
 * License: This code is licensed under the terms of the "New BSD License"
 * http://creativecommons.org/licenses/BSD/
 */

#include "maxAudioGraph.h"

int TTCLASSWRAPPERMAX_EXPORT main(void)
{
	MaxAudioGraphWrappedClassOptionsPtr	options = new MaxAudioGraphWrappedClassOptions;
	MaxAudioGraphWrappedClassPtr		c = NULL;
	
	TTAudioGraphInit();
	
	options->append(TT("generator"), kTTBoolYes);
	options->append(TT("userCanSetNumChannels"), kTTBoolYes);
	wrapAsMaxAudioGraph(TT("audio.sig"), "jcom.sig≈", &c, options);
	wrapAsMaxAudioGraph(TT("audio.sig"), "sig≈", &c, options);
	
	return 0;
}
