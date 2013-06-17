/** @file
 *
 * @ingroup implementationMax
 *
<<<<<<< HEAD:source/j.adsr≈/j.adsr.cpp
 * @brief j.adsr~ : Envelope Generator object for Jamoma Audio Graph
=======
 * @brief adsr≈ : wraps the #TTAdsr class as an envelope following external for AudioGraph
>>>>>>> dev:source/j.adsr≈/j.adsr.cpp
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
	MaxAudioGraphWrappedClassOptionsPtr	options = new MaxAudioGraphWrappedClassOptions;
	//	TTValue								value(0);
	MaxAudioGraphWrappedClassPtr			c = NULL;
	
	TTAudioGraphInit();
	
	options->append(TT("generator"), kTTBoolYes);
	
	options->append(TT("userCanSetNumChannels"), kTTBoolYes);
	
	wrapAsMaxAudioGraph(TT("adsr"), "j.adsr≈", &c, options);
	CLASS_ATTR_ENUM(c->maxClass, "mode", 0, "exponential hybrid linear");

	wrapAsMaxAudioGraph(TT("adsr"), "adsr≈", &c, options);
	CLASS_ATTR_ENUM(c->maxClass, "mode", 0, "exponential hybrid linear");
	
	return 0;
}
