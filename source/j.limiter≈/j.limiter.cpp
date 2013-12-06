/** @file
 *
 * @ingroup implementationMaxExternalsAudioGraph
 *
 * @brief limiter≈ : wraps the #TTLimiter class as a gain limiting external for AudioGraph
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
	wrapAsMaxAudioGraph(TT("limiter"), "j.limiter≈", NULL);
	wrapAsMaxAudioGraph(TT("limiter"), "limiter≈", NULL);
	return 0;
}

