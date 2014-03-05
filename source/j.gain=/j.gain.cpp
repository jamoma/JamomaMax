/** @file
 *
 * @ingroup implementationMaxExternalsAudioGraph
 *
 * @brief j.gain= : wraps the #TTGain class as an audio gain regulating external for AudioGraph
 *
 * @details
 *
 * @authors Timothy Place, Nils Peters, Trond Lossius
 *
 * @copyright © 2010 by Timothy Place @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */


#include "maxAudioGraph.h"

int TTCLASSWRAPPERMAX_EXPORT main(void)
{
	TTAudioGraphInit();
	wrapAsMaxAudioGraph(TT("gain"), "j.gain=", NULL);
	wrapAsMaxAudioGraph(TT("gain"), "gain=", NULL);
	return 0;
}

