/** @file
 *
 * @ingroup implementationMaxExternalsAudioGraph
 *
 * @brief j.audiounit≈ : wraps the #TTAudioUnit class as an AudioUnit plugin host for AudioGraph
 *
 * @details
 *
 * @authors Timothy Place, Nils Peters, Trond Lossius
 *
 * @copyright © 2008 by Nils Peters @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */


#include "maxAudioGraph.h"

int TTCLASSWRAPPERMAX_EXPORT main(void)
{
	TTAudioGraphInit();
	wrapAsMaxAudioGraph(TT("audiounit"), "j.audiounit≈", NULL);
	return 0;
}

