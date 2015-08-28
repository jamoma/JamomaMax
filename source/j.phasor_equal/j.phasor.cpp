/** @file
 *
 * @ingroup implementationMaxExternalsAudioGraph
 *
 * @brief j.phasor= : wraps the #TTPhasor class as an sawtooth signal generating external for AudioGraph
 *
 * @details
 *
 * @authors Timothy Place, Trond Lossius
 *
 * @copyright © 2008 by Timothy Place @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */


#include "MaxAudioGraph.h"

int C74_EXPORT main(void)
{
	MaxAudioGraphWrappedClassOptionsPtr	options = new MaxAudioGraphWrappedClassOptions;
	TTValue								value(0);

	TTAudioGraphInit();

	options->append(TT("generator"), value);
	wrapAsMaxAudioGraph(TT("phasor"), "j.phasor=", NULL, options);
	wrapAsMaxAudioGraph(TT("phasor"), "phasor=", NULL, options);
	return 0;
}

