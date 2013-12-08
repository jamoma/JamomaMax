/** @file
 *
 * @ingroup implementationMaxExternalsAudioGraph
 *
 * @brief j.filter≈ : wraps the #TTFilter class as generic filter external for AudioGraph providing access to a wide variety of filters
 *
 * @details The filters have a unified interface for setting filter frequency and Q
 *
 * @authors Timothy Place, Nils Peters, Trond Lossius
 *
 * @copyright © 2008 by Timothy Place @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */


#include "maxAudioGraph.h"


int TTCLASSWRAPPERMAX_EXPORT main(void)
{
	TTAudioGraphInit();
	wrapAsMaxAudioGraph(TT("filter"), "j.filter≈", NULL);
	return wrapAsMaxAudioGraph(TT("filter"), "filter≈", NULL);
}
