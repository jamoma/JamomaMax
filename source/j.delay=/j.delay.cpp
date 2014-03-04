/** @file
 *
 * @ingroup implementationMaxExternalsAudioGraph
 *
 * @brief j.delay= : wraps the #TTDelay class as audio delay external for AudioGraph with several options for interpolation method
 *
 * @details
 *
 * @authors Tim Place, Trond Lossius
 *
 * @copyright © 2009 by Timothy Place @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */


#include "maxAudioGraph.h"

int TTCLASSWRAPPERMAX_EXPORT main(void)
{   
	MaxAudioGraphWrappedClassOptionsPtr	options = new MaxAudioGraphWrappedClassOptions;
	TTValue								value(0);
	MaxAudioGraphWrappedClassPtr			c = NULL;
	
	TTAudioGraphInit();
	
	wrapAsMaxAudioGraph(TT("delay"), "j.delay=", &c, options);
	CLASS_ATTR_ENUM(c->maxClass, "interpolation", 0, "none linear cubic");

	wrapAsMaxAudioGraph(TT("delay"), "delay=", &c, options);
	CLASS_ATTR_ENUM(c->maxClass, "interpolation", 0, "none linear cubic");

	return 0;
}

