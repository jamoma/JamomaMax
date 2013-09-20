/** @file
 *
 * @ingroup implementationMax
 *
 * @brief offset≈ : wraps the #TTAudioGraphOffset class as an envelope following external for AudioGraph
 *
 * @details
 *
 * @authors Nils Peters, Trond Lossius
 *
 * @copyright © 2010 by Nils Peters @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */


#include "maxAudioGraph.h"


int TTCLASSWRAPPERMAX_EXPORT main(void)
{
	MaxAudioGraphWrappedClassOptionsPtr	options = new MaxAudioGraphWrappedClassOptions;
	TTValue								value(0);

	TTAudioGraphInit();
	options->append(TT("nonadapting"), value); // don't change the number of out-channels in response to changes in the number of in-channels
	options->append(TT("userCanSetNumChannels"), NO);
	wrapAsMaxAudioGraph(TT("audio.offset"), "j.offset≈", NULL, options);
	return wrapAsMaxAudioGraph(TT("audio.offset"), "offset≈", NULL, options);
	
}

