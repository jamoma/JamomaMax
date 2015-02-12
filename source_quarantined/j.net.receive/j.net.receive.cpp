/** @file
 *
 * @ingroup implementationMaxExternals
 *
 * @brief j.net.receive - network communication receiver
 *
 * @details
 *
 * @authors Timothy Place, Trond Lossius
 *
 * @copyright Copyright © 2010 Timothy Place @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */


#include "TTClassWrapperMax.h"

int TTCLASSWRAPPERMAX_EXPORT main(void)
{
	WrappedClassOptionsPtr	options = new WrappedClassOptions;
	TTValue					value;
	WrappedClassPtr			c = NULL;

	
	TTFoundationInit();
	
	value.clear();
	value.append(0);
	options->append(TT("fixedNumChannels"), value);
	
	value.clear();
	value.append(0);
	value.append(TT("receivedMessage"));
	options->append(TT("controlOutletFromNotification"), value);
	
	wrapTTClassAsMaxClass(TT("net.receive"), "j.net.receive", &c, options);
	CLASS_ATTR_ENUM(c->maxClass, "mode", 0, "tcp udp");
	return 0;
}
