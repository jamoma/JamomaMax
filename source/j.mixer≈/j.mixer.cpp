/** @file
 *
 * @ingroup implementationMax
 *
 * @brief mixer≈ : wraps the #TTMixer class as a matrix mixing external for AudioGraph
 *
 * @details
 *
 * @authors Timothy Place, Nils Peters, Trond Lossius
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
	
	TTAudioGraphInit();

	options->append(TT("nonadapting"), value); // don't change the number of out-channels in response to changes in the number of in-channels
	wrapAsMaxAudioGraph(TT("mixer"), "j.mixer≈", NULL, options);
	wrapAsMaxAudioGraph(TT("mixer"), "mixer≈", NULL, options);
	return 0;
}
