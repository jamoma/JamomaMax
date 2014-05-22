/** @file
 *
 * @ingroup implementationMaxExternalsGraph
 *
 * @brief j.append# - External object for Max to append keys to a dictionary being passed in a Jamoma Graph
 *
 * @details
 *
 * @authors Timothy Place
 *
 * @copyright © 2010 by Timothy Place @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */


#include "maxGraph.h"


// Data Structure for this object
struct Append {
   	t_object				   obj;
	TTGraphObjectBasePtr	graphObject;
	TTPtr				    graphOutlets[16];	// this _must_ be third (for the setup call)
	t_symbol*			    attrKey;
    t_symbol*			    attrValue;
};
typedef Append* AppendPtr;


// Prototypes for methods
AppendPtr	AppendNew		(t_symbol* msg, long argc, t_atom* argv);
void		AppendFree		(AppendPtr self);
void		AppendAssist	(AppendPtr self, void* b, long msg, long arg, char* dst);
t_max_err		AppendSetKey	(AppendPtr self, void* attr, long argc, t_atom* argv);
t_max_err		AppendSetValue	(AppendPtr self, void* attr, long argc, t_atom* argv);


// Globals
static t_class* sAppendClass;


/************************************************************************************/
// Main() Function

int TTGRAPH_EXTERNAL_EXPORT main(void)
{
	t_class* c;
	
	TTGraphInit();	
	common_symbols_init();
	
	c = class_new("j.append-", (method)AppendNew, (method)AppendFree, sizeof(Append), (method)0L, A_GIMME, 0);
	
	class_addmethod(c, (method)MaxGraphReset,		"graph.reset",		A_CANT, 0);
	class_addmethod(c, (method)MaxGraphSetup,		"graph.setup",		A_CANT, 0);
	class_addmethod(c, (method)MaxGraphConnect,		"graph.connect",	A_OBJ, A_LONG, 0);
	class_addmethod(c, (method)MaxGraphDrop,		"graph.drop",		A_CANT, 0);
 	class_addmethod(c, (method)MaxGraphObject,		"graph.object",		A_CANT, 0);

	class_addmethod(c, (method)AppendAssist,		"assist",			A_CANT, 0); 
    class_addmethod(c, (method)object_obex_dumpout,	"dumpout",			A_CANT, 0);  
	
	CLASS_ATTR_SYM(c,		"key",		0,		Append,	attrKey);
	CLASS_ATTR_ACCESSORS(c,	"key",		NULL,	AppendSetKey);
	
	CLASS_ATTR_FLOAT(c,		"value",	0,		Append,	attrValue);
	CLASS_ATTR_ACCESSORS(c,	"value",	NULL,	AppendSetValue);
	
	class_register(_sym_box, c);
	sAppendClass = c;
	return 0;
}


/************************************************************************************/
// Object Creation Method

AppendPtr AppendNew(t_symbol* msg, long argc, t_atom* argv)
{
    AppendPtr	self;
	TTValue		v;
	TTErr		err;
	
    self = AppendPtr(object_alloc(sAppendClass));
    if (self) {
    	object_obex_store((void*)self, _sym_dumpout, (t_object*)outlet_new(self, NULL));	// dumpout	
		self->graphOutlets[0] = outlet_new(self, "graph.connect");
		
		v.resize(2);
		v[0] = "dictionary.append";
		v[1] = 1;
		err = TTObjectBaseInstantiate(TT("graph.object"), (TTObjectBasePtr*)&self->graphObject, v);

		if (!self->graphObject->mKernel.valid()) {
			object_error(SELF, "cannot load Jamoma object");
			return NULL;
		}
		
		attr_args_process(self, argc, argv);
	}
	return self;
}


// Memory Deallocation
void AppendFree(AppendPtr self)
{
	TTObjectBaseRelease((TTObjectBasePtr*)&self->graphObject);
}


/************************************************************************************/
// Methods bound to input/inlets

// Method for Assistance Messages
void AppendAssist(AppendPtr self, void* b, long msg, long arg, char* dst)
{
	if (msg==1)			// Inlets
		strcpy (dst, "dictionary input and control messages");		
	else if (msg==2) {	// Outlets
		if (arg == 0)
			strcpy(dst, "dictionary output");
		else
			strcpy(dst, "dumpout");
	}
}


// ATTRIBUTE SETTERS

t_max_err AppendSetKey(AppendPtr self, void* attr, long argc, t_atom* argv)
{
	if (argc) {
		self->attrKey = atom_getsym(argv);
		self->graphObject->mKernel.set(TT("key"), TT(self->attrKey->s_name));
	}
	return MAX_ERR_NONE;
}


t_max_err AppendSetValue(AppendPtr self, void* attr, long argc, t_atom* argv)
{
	if (argc) {
		self->attrValue = atom_getsym(argv);
		self->graphObject->mKernel.set(TT("value"), TT(self->attrValue->s_name));
	}
	return MAX_ERR_NONE;
}

