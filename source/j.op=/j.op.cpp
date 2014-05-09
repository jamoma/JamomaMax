/** @file
 *
 * @ingroup implementationMaxExternalsAudioGraph
 *
 * @brief j.op= : wraps the #TTOperator class as an external for AudioGraph performing basic mathematical operations on multichannel signals
 *
 * @details
 *
 * @authors Timothy Place, Nils Peters, Trond Lossius
 *
 * @copyright © 2008 by Timothy Place @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */


#include "maxAudioGraph.h"
#include "maxGraph.h"


// Data Structure for this object
struct Op {
   	Object					obj;
	TTAudioGraphObjectBasePtr	audioGraphObject;
	TTPtr					outlet;
	TTPtr					unused;				// NULL pointer to signal end of JAG outlets to the class wrapper functions
	TTPtr					inlet;				// proxy for the right inlet
	long					inletnum;			// proxy input inlet number
	t_symbol*				attrOperator;
	TTFloat32				attrOperand;
};
typedef Op* OpPtr;


// Prototypes for methods
OpPtr	OpNew			(t_symbol* msg, long argc, t_atom* argv);
void   	OpFree			(OpPtr self);
void   	OpAssist		(OpPtr self, void* b, long msg, long arg, char* dst);
TTErr  	OpResetAudio	(OpPtr self, long vectorSize);
TTErr  	OpSetupAudio	(OpPtr self);
//TTErr	OpSetup			(OpPtr self);
TTErr  	OpConnectAudio	(OpPtr self, TTAudioGraphObjectBasePtr audioSourceObject, long sourceOutletNumber);
TTErr	OpDropAudio		(OpPtr self, long inletNumber, (t_object*) sourceMaxObject, long sourceOutletNumber);
t_max_err 	OpSetOperator	(OpPtr self, void* attr, long argc, t_atom* argv);
t_max_err	OpGetOperator	(OpPtr self, (t_object*) attr, long* argc, t_atom** argv);
t_max_err 	OpSetOperand	(OpPtr self, void* attr, long argc, t_atom* argv);
t_max_err	OpGetOperand	(OpPtr self, (t_object*) attr, long* argc, t_atom** argv);


// Globals
static t_class* sOpClass;


/************************************************************************************/
// Main() Function

int TTCLASSWRAPPERMAX_EXPORT main(void)
{
	t_class* c;
	
	TTAudioGraphInit();	
	common_symbols_init();
	
	c = class_new("j.op=", (method)OpNew, (method)OpFree, sizeof(Op), (method)0L, A_GIMME, 0);
	
	class_addmethod(c, (method)OpResetAudio,		"audio.reset",		A_CANT, 0);
	class_addmethod(c, (method)OpSetupAudio,		"audio.setup",		A_CANT, 0);
	class_addmethod(c, (method)OpConnectAudio,		"audio.connect",	A_OBJ, A_LONG, 0);
	class_addmethod(c, (method)OpDropAudio,			"audio.drop",		A_CANT, 0);
	class_addmethod(c, (method)MaxAudioGraphObject,	"audio.object",		A_CANT, 0);
	class_addmethod(c, (method)MaxAudioGraphReset,	"graph.reset",			A_CANT, 0);
	//class_addmethod(c, (method)OpSetup,			"graph.setup",			A_CANT, 0); // no setup -- no graph outlets
	class_addmethod(c, (method)MaxGraphConnect,		"graph.connect",		A_OBJ, A_LONG, 0);
 	class_addmethod(c, (method)MaxGraphDrop,		"graph.drop",			A_CANT, 0);
	class_addmethod(c, (method)MaxGraphObject,		"graph.object",			A_CANT, 0);
	class_addmethod(c, (method)OpAssist,			"assist",				A_CANT, 0); 
    class_addmethod(c, (method)object_obex_dumpout,	"dumpout",				A_CANT, 0);  
	
	CLASS_ATTR_SYM(c,		"operator",	0,		Op,	attrOperator);
	CLASS_ATTR_ACCESSORS(c,	"operator",	OpGetOperator,	OpSetOperator);
	CLASS_ATTR_ENUM(c,		"operator",	0,	"+ - * / % > >= == != <= < abs acos asin atan ceil cos cosh exp floor log log10 sin sinh sqrt tan tanh");
	
	CLASS_ATTR_FLOAT(c,		"operand",	0,		Op,	attrOperand);
	CLASS_ATTR_ACCESSORS(c,	"operand",	OpGetOperand,	OpSetOperand);
	
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
		self->outlet = outlet_new(self, "audio.connect");
		self->inlet  = proxy_new(self, 1, &self->inletnum);
		
		v.resize(2);
		v.set(0, TT("operator"));
		v.set(1, TTUInt32(1));	// we set it up with 1 inlet, and later modify to 2 inlets if the connection is made
		err = TTObjectBaseInstantiate(TT("audio.object"), (TTObjectBasePtr*)&self->audioGraphObject, v);

		if (!self->audioGraphObject->getUnitGenerator()) {
			object_error(SELF, "cannot load Jamoma DSP object");
			return NULL;
		}
		
		attr_args_process(self, argc, argv);
	}
	return self;
}


// Memory Deallocation
void OpFree(OpPtr self)
{
	TTObjectBaseRelease((TTObjectBasePtr*)&self->audioGraphObject);
	object_free(self->inlet);
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


// METHODS SPECIFIC TO AUDIO GRAPH EXTERNALS

TTErr OpResetAudio(OpPtr self, long vectorSize)
{
	self->audioGraphObject->setAttributeValue(TT("numAudioInlets"), 1);
	return self->audioGraphObject->resetAudio();
}


TTErr OpSetupAudio(OpPtr self)
{
	t_atom a[2];
	
	atom_setobj(a+0, (t_object*)(self->audioGraphObject));
	atom_setlong(a+1, 0);
	outlet_anything(self->outlet, gensym("audio.connect"), 2, a);
	return kTTErrNone;
}


/*
TTErr OpSetup(OpPtr self)
{
	t_atom				a[2];
	TTUInt16			i=0;
	
	atom_setobj(a+0, (t_object*)(self->graphObject));
	while (self->graphOutlets[i]) {
		atom_setlong(a+1, i);
		outlet_anything(self->graphOutlets[i], gensym("graph.connect"), 2, a);
		i++;
	}
	return kTTErrNone;
}
 */


TTErr OpConnectAudio(OpPtr self, TTAudioGraphObjectBasePtr audioSourceObject, long sourceOutletNumber)
{
	long inletNumber = proxy_getinlet(SELF);
	
	if (inletNumber == 1)
		self->audioGraphObject->setAttributeValue(TT("numAudioInlets"), 2);
	return self->audioGraphObject->connectAudio(audioSourceObject, sourceOutletNumber, inletNumber);
}


TTErr OpDropAudio(OpPtr self, long inletNumber, (t_object*) sourceMaxObject, long sourceOutletNumber)
{
	TTAudioGraphObjectBasePtr	sourceObject = NULL;
	TTErr 					err;
	
	if (inletNumber == 1)
		self->audioGraphObject->setAttributeValue(TT("numAudioInlets"), 1);
	err = (TTErr)TTPtrSizedInt(object_method(sourceMaxObject, GENSYM("audio.object"), &sourceObject));
	if (self->audioGraphObject && sourceObject && !err)
		err = self->audioGraphObject->dropAudio(sourceObject, sourceOutletNumber, inletNumber);	
	return err;
}


// ATTRIBUTE SETTERS

t_max_err OpSetOperator(OpPtr self, void* attr, long argc, t_atom* argv)
{
	if (argc) {
		self->attrOperator = atom_getsym(argv);
		self->audioGraphObject->getUnitGenerator()->setAttributeValue(TT("operator"), TT(self->attrOperator->s_name));
	}
	return MAX_ERR_NONE;
}


t_max_err OpGetOperator(OpPtr self, (t_object*) attr, long* argc, t_atom** argv)
{
	TTValue v;
	
	self->audioGraphObject->getUnitGenerator()->getAttributeValue(TT("operator"), v);
	
	*argc = v.getSize();
	if (!(*argv)) // otherwise use memory passed in
		*argv = (t_atom *)sysmem_newptr(sizeof(t_atom) * v.getSize());
	
	for (int i=0; i<v.getSize(); i++) {
		if (v.getType(i) == kTypeFloat32 || v.getType(i) == kTypeFloat64) {
			TTFloat64	value;
			v.get(i, value);
			atom_setfloat(*argv+i, value);
		}
		else if (v.getType(i) == kTypeSymbol) {
			TTSymbol	value;
			v.get(i, value);
			atom_setsym(*argv+i, gensym((char*)value.c_str()));
		}
		else {	// assume int
			TTInt32		value;
			v.get(i, value);
			atom_setlong(*argv+i, value);
		}
	}	
	return MAX_ERR_NONE;
}

t_max_err OpSetOperand(OpPtr self, void* attr, long argc, t_atom* argv)
{
	if (argc) {
		self->attrOperand = atom_getfloat(argv);
		self->audioGraphObject->getUnitGenerator()->setAttributeValue(TT("operand"), self->attrOperand);
	}
	return MAX_ERR_NONE;
}


t_max_err OpGetOperand(OpPtr self, (t_object*) attr, long* argc, t_atom** argv)
{
	TTValue v;
	
	self->audioGraphObject->getUnitGenerator()->getAttributeValue(TT("operand"), v);
	
	*argc = v.getSize();
	if (!(*argv)) // otherwise use memory passed in
		*argv = (t_atom *)sysmem_newptr(sizeof(t_atom) * v.getSize());
	
	for (int i=0; i<v.getSize(); i++) {
		if (v.getType(i) == kTypeFloat32 || v.getType(i) == kTypeFloat64) {
			TTFloat64	value;
			v.get(i, value);
			atom_setfloat(*argv+i, value);
		}
		else if (v.getType(i) == kTypeSymbol) {
			TTSymbol	value;
			v.get(i, value);
			atom_setsym(*argv+i, gensym((char*)value.c_str()));
		}
		else {	// assume int
			TTInt32		value;
			v.get(i, value);
			atom_setlong(*argv+i, value);
		}
	}	
	return MAX_ERR_NONE;
}
