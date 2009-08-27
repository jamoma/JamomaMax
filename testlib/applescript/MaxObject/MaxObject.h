/*
	==============================================================================

	This file is part of the ObjectiveMax Library and Framework
	An Objective-C API for writing Max external objects
	Copyright 2007 by Electrotap, LLC.

	------------------------------------------------------------------------------

	ObjectiveMax can be redistributed and/or modified under the terms of the
	GNU General Public License, as published by the Free Software Foundation;
	either version 2 of the License, or (at your option) any later version.

	ObjectiveMax is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with ObjectiveMax; if not, visit www.gnu.org/licenses or write to the
	Free Software Foundation, Inc., 59 Temple Place, Suite 330, 
	Boston, MA 02111-1307 USA

	------------------------------------------------------------------------------

	If you'd like to release a closed-source product which uses ObjectiveMax, 
	commercial licenses are also available.  Visit 
		http://electrotap.com/ObjectiveMax
	for more information.

	==============================================================================
*/

// ObjC includes
#import <Cocoa/Cocoa.h>
#import <objc/objc.h>
#import <objc/objc-runtime.h>

// Max includes
#include "ext.h"
#include "ext_obex.h"
#include "z_dsp.h"
#include "commonsyms.h"

@interface MaxObject : NSObject 
{
	@public
		// maxobject must be public because of use in the c-interfaced attr accessors
		t_object	*maxObjectBridge;
		long		inletNum;								// proxy input identification
		t_hashtab	*inletNameIndex;
		t_hashtab	*outletNameIndex;
		long		numInlets;
		long		numOutlets;

	@private
		void		**inlets;
		t_symbol	**inletNames;
		char		**inletAssistance;

		void		**outlets;
		t_symbol	**outletNames;
		char		**outletAssistance;
}

+ (t_class *)	createMaxClassWithName:		(char*)maxclassname fromObjcClassWithName:(char*)objcclassname;
- (id)			initWithObject:				(t_object *)x name:(t_symbol *)s numArgs:(long)argc andValues:(t_atom *)argv;
- (t_max_err)	createInletWithIndex:		(long)indexNum named:(char*)cname withAssistanceMessage:(char*)assist;
- (t_max_err)	createOutletWithIndex:		(long)indexNum named:(char*)cname withAssistanceMessage:(char*)assist;
- (void)		setInletPointer:			(void*)ptr forIndex:(long)inletNum;
- (void)		setOutletPointer:			(void*)ptr forIndex:(long)inletNum;
- (t_object *)	getInletPointerForIndex:	(long)indexNum;
- (t_object *)	getOutletPointerForIndex:	(long)indexNum;
- (t_symbol *)	getNameForInletAtIndex:		(long)indexNum;
- (t_symbol *)	getNameForOutletAtIndex:	(long)indexNum;

- (t_max_err)	sendMessage:	(t_symbol *)s	withNumArgs:(long)argc andValues:(t_atom *)argv toOutlet:(long)indexNum;
- (t_max_err)	sendMessage:	(t_symbol *)s 	withNumArgs:(long)argc andValues:(t_atom *)argv toOutletNamed:(t_symbol *)outletName;
- (t_max_err)	sendMessage:	(t_symbol *)s	toOutlet:(long)indexNum;
- (t_max_err)	sendMessage:	(t_symbol *)s	toOutletNamed:(t_symbol *)outletName;
- (t_max_err)	sendInt:		(long)value		toOutlet:(long)indexNum;
- (t_max_err)	sendInt:		(long)value		toOutletNamed:(t_symbol*)outletName;
- (t_max_err)	sendFloat:		(double)value	toOutlet:(long)indexNum;
- (t_max_err)	sendFloat:		(double)value	toOutletNamed:(t_symbol*)outletName;

- (t_max_err)	assistanceMessage:			(long)msg forIndex:(long)arg withResultingString:(char*)dst;
- (void)		setLong:					(long)value forKey:(NSString *)key;
- (long)		longForKey:					(NSString *)key;
- (void)		setFloat:					(float)value forKey:(NSString *)key;
- (float)		floatForKey:				(NSString *)key;
- (void)		setSymbol:					(t_symbol*)value forKey:(NSString *)key;
- (t_symbol *)	symbolForKey:				(NSString *)key;

- (void) postMessage:(char*)string, ...;
- (void) postWarning:(char*)string, ...;
- (void) postError:(char*)string, ...;

@end
