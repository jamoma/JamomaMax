/** @file
 *
 * @ingroup implementationMaxExternalsAudioGraph
 *
 * @brief count≈ : wraps the #TTCounter class as a sample counting signal generator external for AudioGraph
 *
 * @details
 *
 * @authors Trond Lossius
 *
 * @copyright © 2012 by Trond Lossius @n
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
	
	options->append(TT("generator"), YES);
	
	options->append(TT("userCanSetNumChannels"), YES);
	
	wrapAsMaxAudioGraph(TT("count"), "j.count≈", &c, options);

	wrapAsMaxAudioGraph(TT("count"), "count≈", &c, options);
	
	return 0;
}
