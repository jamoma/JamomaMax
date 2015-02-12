/** @file
 *
 * @ingroup implementationMaxExternalsAudioGraph
 *
 * @brief j.multimixer= : wraps the #TTMultiMixer class as an external for AudioGraph that mix multiple incoming multichannel signals to multiple multichannel outlets
 *
 * @details
 *
 * @authors Timothy Place, Trond Lossius
 *
 * @copyright © 2009 by Timothy Place @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */


#include "maxAudioGraph.h"


int C74_EXPORT main(void)
{
	MaxAudioGraphWrappedClassOptionsPtr	options = new MaxAudioGraphWrappedClassOptions;
	TTValue								value(0);

	TTAudioGraphInit();
	options->append(TT("argumentDefinesNumInlets"), value);
	value = 1;
	options->append(TT("argumentDefinesNumOutlets"), value);
	wrapAsMaxAudioGraph(TT("multimixer"), "j.multimixer=", NULL, options);
	wrapAsMaxAudioGraph(TT("multimixer"), "multimixer=", NULL, options);
	return 0;
}
