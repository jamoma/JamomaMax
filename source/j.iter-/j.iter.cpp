/** @file
 * 
 * @ingroup implementationMaxExternalsGraph
 *
 * @brief j.iter# - Iterate key/value pairs from a dictionary to a sequence of Max messages.
 *
 * @details
 *
 * @authors Tim Place, Trond Lossius
 *
 * @copyright Copyright © 2011 by Timothy Place @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */


#include "maxGraph.h"
#include "TTCallback.h"


// Data Structure for this object
struct Iter {
   	t_object				obj;
	TTGraphObjectBasePtr	graphObject;
	TTPtr				graphOutlets[16];	// this _must_ be third (for the setup call)
	TTObject*			callback;			// TTCallback object that attaches to the graphObject to be notified when there is new data to output.
};
typedef Iter* IterPtr;


// Prototypes for methods
IterPtr	IterNew				(t_symbol* msg, long argc, t_atom* argv);
void   	IterFree			(IterPtr self);
void   	IterAssist			(IterPtr self, void* b, long msg, long arg, char* dst);
void	IterGraphCallback	(IterPtr self, TTValue& arg);


// Globals
static t_class* sIterClass;


/************************************************************************************/
// Main() Function

int TTGRAPH_EXTERNAL_EXPORT main(void)
{
	t_class* c;
	
	TTGraphInit();	
	common_symbols_init();
	
	c = class_new("j.iter-", (method)IterNew, (method)IterFree, sizeof(Iter), (method)0L, A_GIMME, 0);
	
	class_addmethod(c, (method)MaxGraphReset,		"graph.reset",		A_CANT, 0);
	class_addmethod(c, (method)MaxGraphConnect,		"graph.connect",	A_OBJ, A_LONG, 0);
	class_addmethod(c, (method)MaxGraphDrop,		"graph.drop",		A_CANT, 0);
 	class_addmethod(c, (method)MaxGraphObject,		"graph.object",		A_CANT, 0);

	class_addmethod(c, (method)IterAssist,			"assist",			A_CANT, 0); 
    class_addmethod(c, (method)object_obex_dumpout,	"dumpout",			A_CANT, 0);  
	
	class_register(_sym_box, c);
	sIterClass = c;
	return 0;
}


/************************************************************************************/
// Object Creation Method

IterPtr IterNew(t_symbol* msg, long argc, t_atom* argv)
{
    IterPtr	self;
	TTValue	v, none;
	TTErr	err;
	
    self = IterPtr(object_alloc(sIterClass));
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
		
		self->callback->set(TT("function"), TTPtr(&IterGraphCallback));
		self->callback->set(TT("baton"), TTPtr(self));
		// dynamically add a message to the callback object so that it can handle the 'dictionaryReceived' notification
		self->callback->instance()->registerMessage(TT("dictionaryReceived"), (TTMethod)&TTCallback::notify, kTTMessagePassValue);
		// tell the graph object that we want to watch it
		self->graphObject->mKernel.registerObserverForNotifications(*self->callback);
		
		attr_args_process(self, argc, argv);
	}
	return self;
}


// Memory Deallocation
void IterFree(IterPtr self)
{
	delete self->callback;
}


/************************************************************************************/
// Methods bound to input/inlets

// Method for Assistance Messages
void IterAssist(IterPtr self, void* b, long msg, long arg, char* dst)
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
void IterGraphCallback(IterPtr self, TTValue& arg)
{
	TTDictionaryPtr aDictionary = NULL;
	TTValue			v;
	TTValue			keys;
	TTUInt32		numKeys;
	
	aDictionary = (TTDictionaryPtr)(TTPtr)arg[0];
	//aDictionary->getValue(v);
	
	aDictionary->getKeys(keys);
	numKeys = keys.getSize();
	
	for (TTUInt32 k=0; k<numKeys; k++) {
		TTSymbol	key;
		long	ac = 0;
		t_atom*		ap = NULL;
		
		key = keys[k];
		aDictionary->lookup(key, v);
		
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
					v.getType() == kTypeInt64  ||
					v.getType() == kTypeUInt64)
				{
					TTInt32 ival;
					
					ival = v[i];
					atom_setlong(ap+i, ival);
				}
				else if (v.getType() == kTypeFloat32 || v.getType() == kTypeFloat64)
				{
					atom_setfloat(ap+i, v.getFloat64(i));
				}
				else if (v.getType() == kTypeSymbol)
				{
					TTSymbol s;
					
					s = v[i];
					atom_setsym(ap+i, gensym((char*)s.c_str()));
				}
			}
			
			outlet_anything(self->graphOutlets[0], gensym(key.c_str()), ac, ap);			
			delete ap;
		}
		
	}
}


