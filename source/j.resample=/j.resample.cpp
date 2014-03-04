/** @file
 *
 * @ingroup implementationMaxExternalsAudioGraph
 *
 * @brief j.resample= : wraps the #TTResample class as a resampler for AudioGraph
 *
 * @details Convert input to an output with different block size, sample rate, or other characteristics.
 *
 * @authors Timothy Place, Trond Lossius
 *
 * @copyright © 2010 by Timothy Place @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */


#include "maxAudioGraph.h"

int TTCLASSWRAPPERMAX_EXPORT main(void)
{
	TTAudioGraphInit();
	wrapAsMaxAudioGraph(TT("resample"), "j.resample=", NULL);
	wrapAsMaxAudioGraph(TT("resample"), "resample=", NULL);
	return 0;
}

