/** @file
 *
 * @ingroup implementationMax
 *
<<<<<<< HEAD:source/j.count≈/j.count.cpp
 * @brief j.count≈ : Sample Counting Generator object for Jamoma Audio Graph
=======
 * @brief count≈ : wraps the #TTCounter class as a sample counting signal generator external for AudioGraph
>>>>>>> dev:source/jcom.count≈/jcom.count.cpp
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
	
	options->append(TT("generator"), kTTBoolYes);
	
	options->append(TT("userCanSetNumChannels"), kTTBoolYes);
	
	wrapAsMaxAudioGraph(TT("count"), "j.count≈", &c, options);

	wrapAsMaxAudioGraph(TT("count"), "count≈", &c, options);
	
	return 0;
}
