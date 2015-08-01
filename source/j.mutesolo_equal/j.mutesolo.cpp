/** @file
 *
 * @ingroup implementationMaxExternalsAudioGraph
 *
 * @brief j.overdrive= : wraps the #TTMutesolo class as an external for AudioGraph that provides per-channel muting and soloing
 *
 * @details
 *
 * @authors Trond Lossius
 *
 * @copyright © 2014 by Trond Lossius @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */


#include "MaxAudioGraph.h"

int C74_EXPORT main(void)
{
	TTAudioGraphInit();
	wrapAsMaxAudioGraph(TT("mutesolo"), "j.mutesolo=", NULL);
	return wrapAsMaxAudioGraph(TT("mutesolo"), "mutesolo=", NULL);
}

