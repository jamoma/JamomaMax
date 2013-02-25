/* 
 *	matrix≈
 *	External object for Jamoma AudioGraph
 *	Copyright © 2009 by Timothy Place
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

	options->append(TT("nonadapting"), value); // don't change the number of out-channels in response to changes in the number of in-channels
	wrapAsMaxAudioGraph(TT("spat"), "jcom.spat≈", NULL, options);
	wrapAsMaxAudioGraph(TT("spat"), "spat≈", NULL, options);
	return 0;
}
