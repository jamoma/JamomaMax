/** @file
 *
 * @ingroup implementationMaxExternalsDSP
 *
 * @brief panorama~ : wraps the #TTPanorama class as a Jamoma external for MSP
 *
 * @details Panpot
 *
 * @authors Tim Place, Nils Peters, Trond Lossius
 *
 * @copyright © 2008 by Timothy Place @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */


#include "TTClassWrapperMax.h"


int TTCLASSWRAPPERMAX_EXPORT main(void)
{	
	WrappedClassOptionsPtr	options = new WrappedClassOptions;
	WrappedClassPtr			c = NULL;	
	TTValue					v(2);
	
	TTDSPInit();
	options->append(TT("fixedNumOutputChannels"), v);
	wrapTTClassAsMaxClass(TT("panorama"), "j.panorama~", &c, options);
	CLASS_ATTR_ENUM(c->maxClass, "mode", 0, "calculate lookup");
	CLASS_ATTR_ENUM(c->maxClass, "shape", 0, "equalPower linear squareRoot");
	
	return 0;
}
