/** @file
 *
 * @ingroup implementationMaxExternalsAudioGraph
 *
 * @brief j.sig= : wraps the #TTAudioSignal class as constant signal generator for AudioGraph
 *
 * @details 
 *
 * @authors Timothy Place, Trond Lossius
 *
 * @copyright © 2010 by Timothy Place @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */


#include "maxAudioGraph.h"

int C74_EXPORT main(void)
{
	MaxAudioGraphWrappedClassOptionsPtr	options = new MaxAudioGraphWrappedClassOptions;
	MaxAudioGraphWrappedClassPtr		c = NULL;
	
	TTAudioGraphInit();
	
	options->append(TT("generator"), YES);
	options->append(TT("userCanSetNumChannels"), YES);
	wrapAsMaxAudioGraph(TT("audio.sig"), "j.sig=", &c, options);
	wrapAsMaxAudioGraph(TT("audio.sig"), "sig=", &c, options);
	
	return 0;
}
