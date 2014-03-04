/** @file
 *
 * @ingroup implementationMaxExternalsAudioGraph
 *
 * @brief j.split≈ : wraps the #TTAudioGraphSplit class as a multichannel signal splitter for AudioGraph
 *
 * @details 
 *
 * @authors Timothy Place, Trond Lossius
 *
 * @copyright © 2008 by Timothy Place @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */

#include "maxAudioGraph.h"


int TTCLASSWRAPPERMAX_EXPORT main(void)
{
	MaxAudioGraphWrappedClassOptionsPtr	options = new MaxAudioGraphWrappedClassOptions;
	TTValue								value(0);

	TTAudioGraphInit();
	
	options->append(TT("argumentDefinesNumOutlets"), value);
	wrapAsMaxAudioGraph(TT("audio.split"), "j.split≈", NULL, options);
	return wrapAsMaxAudioGraph(TT("audio.split"), "split≈", NULL, options);
}

