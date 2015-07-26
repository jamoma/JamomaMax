/** @file
 *
 * @ingroup implementationMaxExternalsAudioGraph
 *
 * @brief j.pulsesub= : wraps the #TTPulseSub class as a periodic envelope ring modulator for AudioGraph
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
	TTAudioGraphInit();
	wrapAsMaxAudioGraph(TT("pulsesub"), "j.pulsesub=", NULL);
	wrapAsMaxAudioGraph(TT("pulsesub"), "pulsesub=", NULL);
	return 0;
}

