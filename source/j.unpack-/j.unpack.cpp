/** @file
 * 
 * @ingroup implementationMaxExternalsGraph
 *
 * @brief j.unpack# - External object for Max/MSP to get Max values from a Jamoma Graph.
 *
 * @details
 *
 * @authors Tim Place, Trond Lossius
 *
 * @copyright Copyright © 2010 by Timothy Place @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */


#include "maxGraph.h"
#include "TTCallback.h"


// Data Structure for this object
struct Unpack {
   	t_object				obj;
	TTGraphObjectBasePtr	graphObject;
	TTPtr				    graphOutlets[16];	///< this _must_ be third (for the setup call)
	TTObject*				callback;			///< TTCallback object that attaches to the graphObject to be notified when there is new data to output.
};
typedef Unpack* UnpackPtr;


// Prototypes for methods
UnpackPtr	UnpackNew			(t_symbol *msg, long argc, t_atom* argv);
void   		UnpackFree			(UnpackPtr self);
void   		UnpackAssist		(UnpackPtr self, void* b, long msg, long arg, char* dst);
void		UnpackGraphCallback	(UnpackPtr self, TTValue& arg);


// Globals
static t_class* sUnpackClass;


/************************************************************************************/
// Main() Function

int TTGRAPH_EXTERNAL_EXPORT main(void)
{
	t_class *c;
	
	TTGraphInit();	
	common_symbols_init();
	
	c = class_new("j.unpack-", (method)UnpackNew, (method)UnpackFree, sizeof(Unpack), (method)0L, A_GIMME, 0);
	
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

UnpackPtr UnpackNew(t_symbol *msg, long argc, t_atom* argv)
{
    UnpackPtr	self;
	TTValue		v, none;
	TTErr		err;
	
    self = UnpackPtr(object_alloc(sUnpackClass));
    if (self) {
    	object_obex_store((void*)self, _sym_dumpout, (t_object*)outlet_new(self, NULL));	// dumpout	
		self->graphOutlets[0] = outlet_new(self, NULL);
		
		v.resize(2);
		v[0] = "graph.output";
		v[1] = 1;
		err = TTObjectBaseInstantiate(TT("graph.object"), (TTObjectBasePtr*)&self->graphObject, v);
		
		if (!self->graphObject->mKernel.valid()) {
			object_error(SELF, "cannot load Jamoma object");
			return NULL;
		}
		
		self->callback = new TTObject("callback");
		self->callback->set(TT("function"), TTPtr(&UnpackGraphCallback));
		self->callback->set(TT("baton"), TTPtr(self));
		
		// Dynamically add a message to the callback object so that it can handle the 'dictionaryReceived' notification
		self->callback->instance()->registerMessage(TT("dictionaryReceived"), (TTMethod)&TTCallback::notify, kTTMessagePassValue);
		// Tell the graph object that we want to watch it
		self->graphObject->mKernel.registerObserverForNotifications(*self->callback);
		
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
	else if (msg==2) {	// Outlets
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
	long			ac;
	t_atom*			ap;
	TTBoolean		firstItemASymbol = NO;
	TTSymbol		firstItem;
	
	//arg.get(0, (TTPtr*)(&aDictionary));
	aDictionary = (TTDictionaryPtr)(TTPtr)arg[0];
	aDictionary->getValue(v);
	ac = v.size();
	if (ac) {
		ap = new t_atom[ac];
		for (int i=0; i<ac; i++) {
			if (v[i].type() == kTypeInt8   ||
				v[i].type() == kTypeUInt8  ||
				v[i].type() == kTypeInt16  ||
				v[i].type() == kTypeUInt16 ||
				v[i].type() == kTypeInt32  ||
				v[i].type() == kTypeUInt32 ||
				v[i].type() == kTypeInt64  ||
				v[i].type() == kTypeUInt64)
			{
				TTInt32 ival;
				
				ival = v[i];
				atom_setlong(ap+i, ival);
			}
			else if (v[i].type() == kTypeFloat32 || v[i].type() == kTypeFloat64)
			{
				atom_setfloat(ap+i, v[i]);
			}
			else if (v[i].type() == kTypeSymbol)
			{
				TTSymbol s;
				
				s = v[i];
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


