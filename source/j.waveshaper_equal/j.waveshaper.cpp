/** @file
 *
 * @ingroup implementationMaxExternalsAudioGraph
 *
 * @brief j.waveshaper= : wraps the #TTWaveshaper class for AudioGraph
 *
 * @details
 *
 * @authors Tim Place, Trond Lossius
 *
 * @copyright © 2008, Tim Place @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */


#include "MaxAudioGraph.h"

int C74_EXPORT main(void)
{
	TTAudioGraphInit();
	wrapAsMaxAudioGraph(TT("waveshaper"), "j.waveshaper=", NULL);
	wrapAsMaxAudioGraph(TT("waveshaper"), "waveshaper=", NULL);
	return 0;
}

