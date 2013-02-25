/** @file
 *
 * @ingroup audioGraphMax
 *
 * @brief jcom.average≈ : Signal average analysis object for Jamoma AudioGraph.
 *
 * @details This wraps the Jamoma DSP class #TTAverage as a Jamoma AudioGraph external for Max.
 *
 * @authors Nils Peters, Trond Lossius
 *
 * @copyright Copyright © 2011 by Nils Peters @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */


#include "maxAudioGraph.h"

int TTCLASSWRAPPERMAX_EXPORT main(void)
{   
	MaxAudioGraphWrappedClassOptionsPtr	options = new MaxAudioGraphWrappedClassOptions;
	TTValue								value(0);
	MaxAudioGraphWrappedClassPtr		c = NULL;
	
	TTAudioGraphInit();
	
	wrapAsMaxAudioGraph(TT("average"), "jcom.average≈", &c, options);
	CLASS_ATTR_ENUM(c->maxClass, "mode", 0, "absolute bipolar rms");

	wrapAsMaxAudioGraph(TT("average"), "average≈", &c, options);
	CLASS_ATTR_ENUM(c->maxClass, "mode", 0, "absolute bipolar rms");

	return 0;
}

