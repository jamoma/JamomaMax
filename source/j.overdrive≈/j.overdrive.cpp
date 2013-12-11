/** @file
 *
 * @ingroup implementationMaxExternalsAudioGraph
 *
 * @brief j.overdrive≈ : wraps the #TTOverdrive class as a saturation/overdrive effect processing external for AudioGraph
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
	wrapAsMaxAudioGraph(TT("overdrive"), "j.overdrive≈", NULL);
	return wrapAsMaxAudioGraph(TT("overdrive"), "overdrive≈", NULL);
}

