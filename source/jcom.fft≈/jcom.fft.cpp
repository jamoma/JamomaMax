/** @file
 *
 * @ingroup implementationMax
 *
 * @brief fft≈ : wraps the #TTfft class as an external for AudioGraph performing Fourier and Inverse Fourier Transforms
 *
 * @details
 *
 * @authors Timothy Place, Nils Peters, Trond Lossius
 *
 * @copyright © 2010 by Timothy Place @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */


#include "maxAudioGraph.h"

int TTCLASSWRAPPERMAX_EXPORT main(void)
{
	wrapAsMaxAudioGraph(TT("fft"), "jcom.fft≈", NULL);
	wrapAsMaxAudioGraph(TT("fft"), "fft≈", NULL);
	return 0;
}
