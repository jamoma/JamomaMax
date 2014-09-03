/** @file
 * 
 * @ingroup implementationMaxExternalsGraph
 *
 * @brief j.midi.op# - Wraps the #TTOperator class as a Jamoma Graph external object for Max
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


// Data Structure for this object
struct Op {
   	t_object				    obj;
	TTGraphObjectBasePtr	graphObject;
	TTPtr				    graphOutlets[16];	// this _must_ be third (for the setup call)
	t_symbol*			    attrOperator;
	TTFloat32			    attrOperand;
};
typedef Op* OpPtr;


// Prototypes for methods
OpPtr	OpNew			(t_symbol* msg, long argc, t_atom* argv);
void   	OpFree			(OpPtr self);
void   	OpAssist		(OpPtr self, void* b, long msg, long arg, char* dst);
t_max_err 	OpSetOperator	(OpPtr self, void* attr, long argc, t_atom* argv);
t_max_err 	OpSetOperand	(OpPtr self, void* attr, long argc, t_atom* argv);


// Globals
static t_class* sOpClass;


/************************************************************************************/
// Main() Function

int C74_EXPORT main(void)
{
	t_class* c;
	
	TTGraphInit();	
	common_symbols_init();
	
	c = class_new("j.op-", (method)OpNew, (method)OpFree, sizeof(Op), (method)0L, A_GIMME, 0);
	
	class_addmethod(c, (method)MaxGraphReset,		"graph.reset",		A_CANT, 0);
	class_addmethod(c, (method)MaxGraphSetup,		"graph.setup",		A_CANT, 0);
	class_addmethod(c, (method)MaxGraphConnect,		"graph.connect",	A_OBJ, A_LONG, 0);
	class_addmethod(c, (method)MaxGraphDrop,		"graph.drop",		A_CANT, 0);
 	class_addmethod(c, (method)MaxGraphObject,		"graph.object",		A_CANT, 0);

	class_addmethod(c, (method)OpAssist,			"assist",			A_CANT, 0); 
    class_addmethod(c, (method)object_obex_dumpout,	"dumpout",			A_CANT, 0);  
	
	CLASS_ATTR_SYM(c,		"operator",	0,		Op,	attrOperator);
	CLASS_ATTR_ACCESSORS(c,	"operator",	NULL,	OpSetOperator);
	CLASS_ATTR_ENUM(c,		"operator",	0,	"+ - * / % > >= == != <= < abs acos asin atan ceil cos cosh exp floor log log10 sin sinh sqrt tan tanh");

	CLASS_ATTR_FLOAT(c,		"operand",	0,		Op,	attrOperand);
	CLASS_ATTR_ACCESSORS(c,	"operand",	NULL,	OpSetOperand);
	
	class_register(_sym_box, c);
	sOpClass = c;
	return 0;
}


/************************************************************************************/
// Object Creation Method

OpPtr OpNew(t_symbol* msg, long argc, t_atom* argv)
{
    OpPtr	self;
	TTValue	v;
	TTErr	err;
	
    self = OpPtr(object_alloc(sOpClass));
    if (self) {
    	object_obex_store((void*)self, _sym_dumpout, (t_object*)outlet_new(self, NULL));	// dumpout	
		self->graphOutlets[0] = outlet_new(self, "graph.connect");
		
		v.resize(2);
		v[0] = "operator";
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
void OpFree(OpPtr self)
{
	TTObjectBaseRelease((TTObjectBasePtr*)&self->graphObject);
}


/************************************************************************************/
// Methods bound to input/inlets

// Method for Assistance Messages
void OpAssist(OpPtr self, void* b, long msg, long arg, char* dst)
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


// ATTRIBUTE SETTERS

t_max_err OpSetOperator(OpPtr self, void* attr, long argc, t_atom* argv)
{
	if (argc) {
		self->attrOperator = atom_getsym(argv);
		self->graphObject->mKernel.set(TT("operator"), TT(self->attrOperator->s_name));
	}
	return MAX_ERR_NONE;
}


t_max_err OpSetOperand(OpPtr self, void* attr, long argc, t_atom* argv)
{
	if (argc) {
		self->attrOperand = atom_getfloat(argv);
		self->graphObject->mKernel.set(TT("operand"), self->attrOperand);
	}
	return MAX_ERR_NONE;
}

