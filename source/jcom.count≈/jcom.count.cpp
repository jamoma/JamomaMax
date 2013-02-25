/** @file
 *
 * @ingroup audioGraphMax
 *
 * @brief jcom.count≈ : Sample Counting Generator object for Jamoma Audio Graph
 *
 * @details This wraps the Jamoma DSP class #TTCounter as a Jamoma AudioGraph external for Max.
 *
 * @authors Trond Lossius
 *
 * @copyright Copyright © 2012 by Trond Lossius @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */


#include "maxAudioGraph.h"

int TTCLASSWRAPPERMAX_EXPORT main(void)
{
	MaxAudioGraphWrappedClassOptionsPtr	options = new MaxAudioGraphWrappedClassOptions;
	//	TTValue								value(0);
	MaxAudioGraphWrappedClassPtr			c = NULL;
	
	TTAudioGraphInit();
	
	options->append(TT("generator"), kTTBoolYes);
	
	options->append(TT("userCanSetNumChannels"), kTTBoolYes);
	
	wrapAsMaxAudioGraph(TT("count"), "jcom.count≈", &c, options);

	wrapAsMaxAudioGraph(TT("count"), "count≈", &c, options);
	
	return 0;
}
