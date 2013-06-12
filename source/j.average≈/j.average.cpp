/** @file
 *
 * @ingroup implementationMax
 *
<<<<<<< HEAD:source/j.average≈/j.average.cpp
 * @brief j.average≈ : Signal average analysis object for Jamoma AudioGraph.
=======
 * @brief average≈ : wraps the #TTAverage class as an average analysis object for AudioGraph
>>>>>>> dev:source/jcom.average≈/jcom.average.cpp
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
	MaxAudioGraphWrappedClassPtr		c = NULL;
	
	TTAudioGraphInit();
	
	wrapAsMaxAudioGraph(TT("average"), "j.average≈", &c, options);
	CLASS_ATTR_ENUM(c->maxClass, "mode", 0, "absolute bipolar rms");

	wrapAsMaxAudioGraph(TT("average"), "average≈", &c, options);
	CLASS_ATTR_ENUM(c->maxClass, "mode", 0, "absolute bipolar rms");

	return 0;
}

