/** @file
 *
 * @ingroup audioGraphMax
 *
 * @brief jcom.adsr~ : Envelope Generator object for Jamoma Audio Graph
 *
 * @details This wraps the Jamoma DSP class #TTAdsr as a Jamoma AudioGraph external for Max.
 *
 * @authors Timothy Place, Nils Peters, Trond Lossius
 *
 * @copyright Copyright © 2010, Timothy Place @n
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
	
	wrapAsMaxAudioGraph(TT("adsr"), "jcom.adsr≈", &c, options);
	CLASS_ATTR_ENUM(c->maxClass, "mode", 0, "exponential hybrid linear");

	wrapAsMaxAudioGraph(TT("adsr"), "adsr≈", &c, options);
	CLASS_ATTR_ENUM(c->maxClass, "mode", 0, "exponential hybrid linear");
	
	return 0;
}
