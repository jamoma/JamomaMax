/** @file
 *
 * @ingroup implementationMaxExternalsDSP
 *
 * @brief j.average~ : wrapping the #TTAverage class as an MSP external
 *
 * @details
 *
 * @authors Tim Place, Trond Lossius
 *
 * @copyright Copyright © 2010 by Timothy Place @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */


#include "TTClassWrapperMax.h"

int C74_EXPORT main(void)
{
	WrappedClassOptionsPtr	options = new WrappedClassOptions;
	WrappedClassPtr			c = NULL;
	
	TTDSPInit();
	wrapTTClassAsMaxClass(TT("average"), "j.average~", &c, options);
	CLASS_ATTR_ENUM(c->maxClass, "mode", 0, "absolute bipolar rms");
	return 0;
}
