/** @file
 *
 * @ingroup implementationMax
 *
 * @brief noise≈ : wraps the #TTNoise class as a audio noise genrator external for AudioGraph
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
	options->append(TT("generator"), kTTBoolYes);
	options->append(TT("userCanSetNumChannels"), kTTBoolYes);
	wrapAsMaxAudioGraph(TT("noise"), "jcom.noise≈", &c, options);
	CLASS_ATTR_ENUM(c->maxClass, "mode", 0, "white pink brown blue gauss");
	wrapAsMaxAudioGraph(TT("noise"), "noise≈", &c, options);
	CLASS_ATTR_ENUM(c->maxClass, "mode", 0, "white pink brown blue gauss");
	return 0;
}
