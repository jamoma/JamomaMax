/** @file
 *
 * @ingroup implementationMaxExternalsAudioGraph
 *
 * @brief j.ramp≈ : wraps the #TTRamp class as a linear ramp generator for AudioGraph
 *
 * @details
 *
 * @authors Timothy Place, Trond Lossius
 *
 * @copyright © 2008 by Timothy Place @n
 * This code is licensed under the terms of the "New BSD License" @n
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
	options->append(TT("generator"), YES);
	options->append(TT("userCanSetNumChannels"), YES);
	wrapAsMaxAudioGraph(TT("ramp"), "j.ramp≈", &c, options);
	wrapAsMaxAudioGraph(TT("ramp"), "ramp≈", &c, options);

	CLASS_ATTR_ENUM(c->maxClass, "mode", 0, "vector sample");
	return 0;
}
