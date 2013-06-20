/** @file
 *
 * @ingroup implementationMax
 *
<<<<<<< HEAD:source/j.audiounit≈/j.audiounit.cpp
 * @brief j.audiounit≈ : Jamoma AudioGraph external for Max for hosting AudioUnit plugins
=======
 * @brief audiounit≈ : wraps the #TTAudioUnit class as an AudioUnit plugin host for AudioGraph
>>>>>>> dev:source/j.audiounit≈/j.audiounit.cpp
 *
 * @details
 *
 * @authors Timothy Place, Nils Peters, Trond Lossius
 *
 * @copyright © 2008 by Nils Peters @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */


#include "maxAudioGraph.h"

int TTCLASSWRAPPERMAX_EXPORT main(void)
{
	TTAudioGraphInit();
	wrapAsMaxAudioGraph(TT("audiounit"), "j.audiounit≈", NULL);
	return 0;
}

