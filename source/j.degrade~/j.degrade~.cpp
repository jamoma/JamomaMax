/** @file
 *
 * @ingroup implementationMaxExternalsDSP
 *
 * @brief j.degrade~ : Max AudioGraph external that degrades the audio quality of a signal
 *
 * @details This wraps the Jamoma DSP class #TTDegrade as a Jamoma AudioGraph external for Max MSP
 *
 * @authors Tim Place, Trond Lossius
 *
 * @copyright © 2008 by Timothy Place @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */


#include "TTClassWrapperMax.h"

int C74_EXPORT main(void)
{
	WrappedClassOptionsPtr	options = new WrappedClassOptions;
	TTValue					value;

	TTDSPInit();

	value.clear();
	value.append(TT("srRatio"));
	value.append(TT("bitdepth"));

// TODO: experimental:
//	options->append(TT("additionalSignalInputSetsAttribute"), value);
	
	return wrapTTClassAsMaxClass(TT("degrade"), "j.degrade~", NULL, options);
}

