/** @file
 *
 * @ingroup implementationMaxExternalsAudioGraph
 *
 * @brief j.clip= : wraps the #Clipper class as a range clipping external for AudioGraph
 *
 * @details
 *
 * @authors Tim Place, Trond Lossius
 *
 * @copyright © 2010 by Tim Place @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */


#include "MaxAudioGraph.h"

int C74_EXPORT main(void)
{
	TTAudioGraphInit();
	wrapAsMaxAudioGraph(TT("clipper"), "j.clip=", NULL);
	wrapAsMaxAudioGraph(TT("clipper"), "clip=", NULL);
	return 0;
}

