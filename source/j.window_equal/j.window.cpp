/** @file
 *
 * @ingroup implementationMaxExternalsAudioGraph
 *
 * @brief j.window= : wraps the #TTWindowFunction class for AudioGraph
 *
 * @details
 *
 * @authors Tim Place, Trond Lossius
 *
 * @copyright © 2010, Tim Place @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */


#include "MaxAudioGraph.h"

int C74_EXPORT main(void)
{
	TTAudioGraphInit();
	wrapAsMaxAudioGraph(TT("WindowFunction"), "j.window=", NULL);
	wrapAsMaxAudioGraph(TT("WindowFunction"), "window=", NULL);
	return 0;
}

