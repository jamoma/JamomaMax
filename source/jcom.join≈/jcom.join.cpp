/* 
 *	join≈
 *	External object for Jamoma AudioGraph
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
	
	options->append(TT("argumentDefinesNumInlets"), value);
	options->append(TT("nonadapting"), value); // don't change the number of out-channels in response to changes in the number of in-channels
	wrapAsMaxAudioGraph(TT("audio.join"), "jcom.join≈", NULL, options);
	return wrapAsMaxAudioGraph(TT("audio.join"), "join≈", NULL, options);
}
