/** @file
 *
 * @ingroup audioGraphMax
 *
 * @brief jcom.audiounit≈ : Jamoma AudioGraph external for Max for hosting AudioUnit plugins
 *
 * @details This wraps the Jamoma DSP class #TTAudioUnit as a Jamoma AudioGraph external for Max.
 *
 * @authors Timothy Place, Nils Peters, Trond Lossius
 *
 * @copyright Copyright © 2011 by Nils Peters @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */

/*
 *	audiounit≈
 *	Jamoma AudioGraph external object for Max
 *	Copyright © 2008 by Timothy Place
 * 
 * License: This code is licensed under the terms of the "New BSD License"
 * http://creativecommons.org/licenses/BSD/
 */

#include "maxAudioGraph.h"

int TTCLASSWRAPPERMAX_EXPORT main(void)
{
	TTAudioGraphInit();
	wrapAsMaxAudioGraph(TT("audiounit"), "jcom.audiounit≈", NULL);
	return 0;
}

