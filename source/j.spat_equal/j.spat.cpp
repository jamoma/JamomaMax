/** @file
 *
 * @ingroup implementationMaxExternalsAudioGraph
 *
 * @brief j.spat= : wraps the #TTSpat class as a spatialisation mixer for AudioGraph
 *
 * @details 
 *
 * @authors Timothy Place, Trond Lossius, Nils Peters
 *
 * @copyright © 2009 by Timothy Place @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */


#include "maxAudioGraph.h"


int C74_EXPORT main(void)
{
	MaxAudioGraphWrappedClassOptionsPtr	options = new MaxAudioGraphWrappedClassOptions;
	TTValue								value(0);
	
	TTAudioGraphInit();

	options->append(TT("nonadapting"), value); // don't change the number of out-channels in response to changes in the number of in-channels
	wrapAsMaxAudioGraph(TT("spat"), "j.spat=", NULL, options);
	wrapAsMaxAudioGraph(TT("spat"), "spat=", NULL, options);
	return 0;
}
