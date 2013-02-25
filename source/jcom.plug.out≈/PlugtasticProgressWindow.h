/* 
 *	PlugtasticProgressWindow.h
 *	Plugtastic Output External
 *	Copyright © 2010 by Timothy Place
 * 
 *	License: This code is licensed under the terms of the "New BSD License"
 *	http://creativecommons.org/licenses/BSD/
 */


#import <Cocoa/Cocoa.h>
#include "jcom.plug.out.h"


@interface PlugtasticProgressWindow : NSWindow {
	@public
	NSProgressIndicator*		progressIndicator;
}

@end

