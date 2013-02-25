/** @file
 *
 * @ingroup audioGraphMax
 *
 * @brief jcom.pick≈ - extracts N specific audio signals from a Jamoma AudioGraph signal
 *
 * @details 
 *
 * @authors Nils Peters
 *
 * @copyright Copyright © 2011, Nils Peters @n
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
	options->append(TT("userCanSetNumChannels"), kTTBoolNo);
	wrapAsMaxAudioGraph(TT("audio.pick"), "jcom.pick≈", NULL, options);
	return wrapAsMaxAudioGraph(TT("audio.pick"), "pick≈", NULL, options);
	
	
		//TTAudioGraphInit();
		//wrapAsMaxAudioGraph(TT("audio.pick"), "jcom.pick≈", NULL);
		//wrapAsMaxAudioGraph(TT("audio.pick"), "pick≈", NULL);
		//return 0;
	
	
}

