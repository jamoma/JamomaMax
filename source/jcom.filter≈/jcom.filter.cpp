/* 
 *	filter≈
 *	Filter object for Jamoma AudioGraph
 *	Copyright © 2008 by Timothy Place
 * 
 * License: This code is licensed under the terms of the "New BSD License"
 * http://creativecommons.org/licenses/BSD/
 */

#include "maxAudioGraph.h"


int TTCLASSWRAPPERMAX_EXPORT main(void)
{
	TTAudioGraphInit();
	wrapAsMaxAudioGraph(TT("filter"), "jcom.filter≈", NULL);
	return wrapAsMaxAudioGraph(TT("filter"), "filter≈", NULL);
}
