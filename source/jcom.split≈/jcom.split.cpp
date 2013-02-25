/* 
 *	split≈
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
	
	options->append(TT("argumentDefinesNumOutlets"), value);
	wrapAsMaxAudioGraph(TT("audio.split"), "jcom.split≈", NULL, options);
	return wrapAsMaxAudioGraph(TT("audio.split"), "split≈", NULL, options);
}

