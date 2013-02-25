/** @file
 *
 * @ingroup audioGraphMax
 *
 * @brief jcom.array≈ : Array object for Jamoma AudioGraph.
 *
 * @details This wraps the Jamoma DSP class #TTAudioObjectBaseArray as a Jamoma AudioGraph external for Max.
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
	TTAudioGraphInit();
	wrapAsMaxAudioGraph(TT("array"), "jcom.array≈", NULL);
	return wrapAsMaxAudioGraph(TT("array"), "array≈", NULL);
}
