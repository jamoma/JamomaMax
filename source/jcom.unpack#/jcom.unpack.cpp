/* 
 *	unpack#
 *	External object for Max/MSP to perform basic mathematical operations on objects in a Jamoma Graph.
 *	Copyright © 2010 by Timothy Place
 * 
 * License: This code is licensed under the terms of the "New BSD License"
 * http://creativecommons.org/licenses/BSD/
 */

#include "maxGraph.h"
#include "TTCallback.h"


// Data Structure for this object
struct Unpack {
   	Object				obj;
	TTGraphObjectPtr	graphObject;
	TTPtr				graphOutlets[16];	// this _must_ be third (for the setup call)
	TTObjectBasePtr			callback;		// TTCallback object that attaches to the graphObject to be notified when there is new data to output.
};
typedef Unpack* UnpackPtr;


// Prototypes for methods
UnpackPtr	UnpackNew			(SymbolPtr msg, AtomCount argc, AtomPtr argv);
void   		UnpackFree			(UnpackPtr self);
void   		UnpackAssist		(UnpackPtr self, void* b, long msg, long arg, char* dst);
void		UnpackGraphCallback	(UnpackPtr self, TTValue& arg);


// Globals
static ClassPtr sUnpackClass;


/************************************************************************************/
// Main() Function

int TTGRAPH_EXTERNAL_EXPORT main(void)
{
	ClassPtr c;
	
	TTGraphInit();	
	common_symbols_init();
	
	c = class_new("jcom.unpack#", (method)UnpackNew, (method)UnpackFree, sizeof(Unpack), (method)0L, A_GIMME, 0);
	
	class_addmethod(c, (method)MaxGraphReset,		"graph.reset",		A_CANT, 0);
	class_addmethod(c, (method)MaxGraphConnect,		"graph.connect",	A_OBJ, A_LONG, 0);
	class_addmethod(c, (method)MaxGraphDrop,		"graph.drop",		A_CANT, 0);
 	class_addmethod(c, (method)MaxGraphObject,		"graph.object",		A_CANT, 0);

	class_addmethod(c, (method)UnpackAssist,		"assist",			A_CANT, 0); 
    class_addmethod(c, (method)object_obex_dumpout,	"dumpout",			A_CANT, 0);  
	
	class_register(_sym_box, c);
	sUnpackClass = c;
	return 0;
}


/************************************************************************************/
// Object Creation Method

UnpackPtr UnpackNew(SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
    UnpackPtr	self;
	TTValue	v;
	TTErr	err;
	
    self = UnpackPtr(object_alloc(sUnpackClass));
    if (self) {
    	object_obex_store((void*)self, _sym_dumpout, (ObjectPtr)outlet_new(self, NULL));	// dumpout	
		self->graphOutlets[0] = outlet_new(self, NULL);
		
		v.setSize(2);
		v.set(0, TT("graph.output"));
		v.set(1, TTUInt32(1));
		err = TTObjectBaseInstantiate(TT("graph.object"), (TTObjectBasePtr*)&self->graphObject, v);
		
		if (!self->graphObject->mKernel) {
			object_error(SELF, "cannot load Jamoma object");
			return NULL;
		}
		
		err = TTObjectBaseInstantiate(TT("callback"), (TTObjectBasePtr*)&self->callback, kTTValNONE);
		self->callback->setAttributeValue(TT("function"), TTPtr(&UnpackGraphCallback));
		self->callback->setAttributeValue(TT("baton"), TTPtr(self));	
		// dynamically add a message to the callback object so that it can handle the 'dictionaryReceived' notification
		self->callback->registerMessage(TT("dictionaryReceived"), (TTMethod)&TTCallback::notify, kTTMessagePassValue);
		// tell the graph object that we want to watch it
		self->graphObject->mKernel->registerObserverForNotifications(*self->callback);
		
		attr_args_process(self, argc, argv);
	}
	return self;
}


// Memory Deallocation
void UnpackFree(UnpackPtr self)
{
	TTObjectBaseRelease((TTObjectBasePtr*)&self->graphObject);
}


/************************************************************************************/
// Methods bound to input/inlets

// Method for Assistance Messages
void UnpackAssist(UnpackPtr self, void* b, long msg, long arg, char* dst)
{
	if (msg==1)			// Inlets
		strcpy (dst, "multichannel input and control messages");		
	else if (msg==2){	// Outlets
		if (arg == 0)
			strcpy(dst, "multichannel output");
		else
			strcpy(dst, "dumpout");
	}
}


// C Callback from any Graph Source objects we are observing
void UnpackGraphCallback(UnpackPtr self, TTValue& arg)
{
	TTDictionaryPtr aDictionary = NULL;
	TTValue			v;
	AtomCount		ac;
	AtomPtr			ap;
	TTBoolean		firstItemASymbol = NO;
	TTSymbol		firstItem;
	
	arg.get(0, (TTPtr*)(&aDictionary));
	aDictionary->getValue(v);
	ac = v.getSize();
	if (ac) {
		ap = new Atom[ac];
		for (int i=0; i<ac; i++) {
			if (v.getType() == kTypeInt8   ||
				v.getType() == kTypeUInt8  ||
				v.getType() == kTypeInt16  ||
				v.getType() == kTypeUInt16 ||
				v.getType() == kTypeInt32  ||
				v.getType() == kTypeUInt32 ||
				v.getType() == kTypeInt64  ||
				v.getType() == kTypeUInt64)
			{
				TTInt32 ival;
				
				v.get(i, ival);
				atom_setlong(ap+i, ival);
			}
			else if (v.getType() == kTypeFloat32 || v.getType() == kTypeFloat64)
			{
				atom_setfloat(ap+i, v.getFloat64(i));
			}
			else if (v.getType() == kTypeSymbol)
			{
				TTSymbol s;
				
				v.get(i, s);
				atom_setsym(ap+i, gensym((char*)s.c_str()));
				if (i==0) {
					firstItemASymbol = YES;
					firstItem = s;
				}
			}
		}
		
		if (firstItemASymbol)
			outlet_anything(self->graphOutlets[0], gensym((char*)firstItem.c_str()), ac-1, ap+1);
		else if (ac == 1)
			outlet_float(self->graphOutlets[0], atom_getfloat(ap));
		else
			outlet_anything(self->graphOutlets[0], _sym_list, ac, ap);

		delete ap;
	}
}


