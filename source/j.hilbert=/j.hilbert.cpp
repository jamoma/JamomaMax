/** @file
 *
 * @ingroup implementationMaxExternalsAudioGraph
 *
 * @brief j.hilbert= : wraps the #TTHilbertLinear33 class as a hilbert filter external for AudioGraph
 *
 * @details
 *
 * @authors Timothy Place, Trond Lossius
 *
 * @copyright © 2010 by Timothy Place @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */


#include "maxAudioGraph.h"

int TTCLASSWRAPPERMAX_EXPORT main(void)
{
	MaxAudioGraphWrappedClassOptionsPtr	options = new MaxAudioGraphWrappedClassOptions;
	TTValue								value(2);
	MaxAudioGraphWrappedClassPtr		c = NULL;

	TTAudioGraphInit();
    
	options->append(TT("wrapperDefinesNumOutlets"), value);
//	wrapAsMaxAudioGraph(TT("hilbert.9"), "j.hilbert=", &c, options);
	wrapAsMaxAudioGraph(TT("hilbert.linear.33"), "j.hilbert=", &c, options);
	wrapAsMaxAudioGraph(TT("hilbert.linear.33"), "hilbert=", &c, options);
		
	return 0;
}

