/** @file
 *
 * @ingroup implementationMaxExternalsAudioGraph
 *
 * @brief j.join= : wraps the #TTAudioGraphJoin class as external for AudioGraph that joins several multichannel signals
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

	options->append(TT("argumentDefinesNumInlets"), value);
	options->append(TT("nonadapting"), value); // don't change the number of out-channels in response to changes in the number of in-channels
	wrapAsMaxAudioGraph(TT("audio.join"), "j.join=", NULL, options);
	return wrapAsMaxAudioGraph(TT("audio.join"), "join=", NULL, options);
}
