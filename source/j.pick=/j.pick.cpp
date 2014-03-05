/** @file
 *
 * @ingroup implementationMaxExternalsAudioGraph
 *
 * @brief j.pick= : wraps the #TTAudioGraphPick class as an external that extracts N specific audio signals from a Jamoma AudioGraph signal
 *
 * @details
 *
 * @authors Nils Peters, Trond Lossius
 *
 * @copyright © 2011 by Nils Peters @n
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
	wrapAsMaxAudioGraph(TT("audio.pick"), "j.pick=", NULL, options);
	return wrapAsMaxAudioGraph(TT("audio.pick"), "pick=", NULL, options);
	
	
		//TTAudioGraphInit();
		//wrapAsMaxAudioGraph(TT("audio.pick"), "j.pick=", NULL);
		//wrapAsMaxAudioGraph(TT("audio.pick"), "pick=", NULL);
		//return 0;
	
	
}

