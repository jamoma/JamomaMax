/* 
 *	noise≈
 *	Noiselator object for Jamoma AudioGraph
 *	Copyright © 2008 by Timothy Place
 * 
 * License: This code is licensed under the terms of the "New BSD License"
 * http://creativecommons.org/licenses/BSD/
 */

#include "maxAudioGraph.h"

int TTCLASSWRAPPERMAX_EXPORT main(void)
{
	MaxAudioGraphWrappedClassOptionsPtr	options = new MaxAudioGraphWrappedClassOptions;
//	TTValue								value(0);
	MaxAudioGraphWrappedClassPtr			c = NULL;

	TTAudioGraphInit();

//	options->append(TT("generator"), value);
	options->append(TT("generator"), kTTBoolYes);
	options->append(TT("userCanSetNumChannels"), kTTBoolYes);
	wrapAsMaxAudioGraph(TT("ramp"), "jcom.ramp≈", &c, options);
	wrapAsMaxAudioGraph(TT("ramp"), "ramp≈", &c, options);

	CLASS_ATTR_ENUM(c->maxClass, "mode", 0, "vector sample");
	return 0;
}
