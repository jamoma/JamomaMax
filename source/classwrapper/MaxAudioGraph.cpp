/** @file
 *
 * @ingroup audioGraphMax
 *
 * @brief A thin wrapper of Jamoma AudioGraph for use in the Cycling '74 Max/MSP environment.
 *
 * @details Includes an automated class wrapper to make Jamoma DSP object's available as objects for Max/MSP.
 *
 * @authors Timothy Place, Trond Lossius
 *
 * @copyright Copyright © 2008, Timothy Place @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */


#include "maxAudioGraph.h"
#include "ext_hashtab.h"

using namespace std;

#define MAX_NUM_INLETS  32
#define MAX_NUM_OUTLETS 32

// Data Structure for this object
typedef struct _wrappedInstance {
    t_object					obj;					///< Max audio object header
	TTAudioGraphObjectBasePtr		audioGraphObject;		///< The DSP instance we are wrapping -- MUST BE 2nd!
	TTPtr						audioGraphOutlets[MAX_NUM_OUTLETS];	///< Array of outlets, may eventually want this to be more dynamic
	TTPtr						inlets[MAX_NUM_INLETS];				///< Array of proxy inlets beyond the first inlet
	MaxAudioGraphWrappedClassPtr	wrappedClassDefinition;	///< A pointer to the class definition
	TTUInt8						numInputs;
	TTUInt8						numOutputs;
} WrappedInstance;

typedef WrappedInstance* WrappedInstancePtr;		///< Pointer to a wrapped instance of our object.


/** A hash of all wrapped clases, keyed on the Max class name. */
static t_hashtab*	wrappedMaxClasses = NULL;


t_object* MaxAudioGraphWrappedClass_new(t_symbol* name, long argc, t_atom* argv)
{	
	MaxAudioGraphWrappedClassPtr	wrappedMaxClass = NULL;
    WrappedInstancePtr			self = NULL;
	TTValue						v;
	TTErr						err = kTTErrNone;

 	long						attrstart = attr_args_offset(argc, argv);		// support normal arguments
	
	// Find the WrappedClass
	hashtab_lookup(wrappedMaxClasses, name, (t_object**)&wrappedMaxClass);

	// If the WrappedClass has a validity check defined, then call the validity check function.
	// If it returns an error, then we won't instantiate the object.
	if (wrappedMaxClass) {
		if (wrappedMaxClass->validityCheck)
			err = wrappedMaxClass->validityCheck(wrappedMaxClass->validityCheckArgument);
		else
			err = kTTErrNone;
	}
	else
		err = kTTErrGeneric;
	
	if (!err)
		self = (WrappedInstancePtr)object_alloc(wrappedMaxClass->maxClass);
    if (self) {
		self->numInputs = 1;
		self->numOutputs = 1;
		if (wrappedMaxClass->options && !wrappedMaxClass->options->lookup(TT("argumentDefinesNumInlets"), v)) {
			int argumentOffsetToDefineTheNumberOfInlets = v;
			if ((attrstart-argumentOffsetToDefineTheNumberOfInlets > 0) && argv+argumentOffsetToDefineTheNumberOfInlets)
				self->numInputs = atom_getlong(argv+argumentOffsetToDefineTheNumberOfInlets);
		}
		if (wrappedMaxClass->options && !wrappedMaxClass->options->lookup(TT("wrapperDefinesNumInlets"), v)) {
			int wrapperDefinedNumberOfInlets = v;
			if (wrapperDefinedNumberOfInlets > 0)
				self->numInputs = wrapperDefinedNumberOfInlets;
		}
		// make sure that numInputs is not too large
		self->numInputs = min(self->numInputs, (TTUInt8)MAX_NUM_INLETS);

		for (TTUInt16 i=self->numInputs-1; i>0; i--)
			self->inlets[i-1] = proxy_new(self, i, NULL);
		
    	object_obex_store((void*)self, _sym_dumpout, (object*)outlet_new(self, NULL));	// dumpout
		if (wrappedMaxClass->options && !wrappedMaxClass->options->lookup(TT("argumentDefinesNumOutlets"), v)) {
			int argumentOffsetToDefineTheNumberOfOutlets = v;
			if ((attrstart-argumentOffsetToDefineTheNumberOfOutlets > 0) && argv+argumentOffsetToDefineTheNumberOfOutlets)
				self->numOutputs = atom_getlong(argv+argumentOffsetToDefineTheNumberOfOutlets);
		}
		if (wrappedMaxClass->options && !wrappedMaxClass->options->lookup(TT("wrapperDefinesNumOutlets"), v)) {
			int wrapperDefinedNumberOfOutlets = v;
			if (wrapperDefinedNumberOfOutlets > 0) 
				self->numOutputs = wrapperDefinedNumberOfOutlets;
		}		
		// make sure that numOutputs is not too large
		self->numOutputs = min(self->numOutputs, (TTUInt8)MAX_NUM_OUTLETS);
		
		for (TTInt16 i=self->numOutputs-1; i>=0; i--)
			self->audioGraphOutlets[i] = outlet_new(self, "audio.connect");

				
		self->wrappedClassDefinition = wrappedMaxClass;
		v.resize(3);
		v[0] = wrappedMaxClass->ttClassName;
		v[1] = self->numInputs;
		v[2] = self->numOutputs;
		err = TTObjectBaseInstantiate(TT("audio.object"), (TTObjectBasePtr*)&self->audioGraphObject, v);
		if (wrappedMaxClass->options && !wrappedMaxClass->options->lookup(TT("generator"), v))
			self->audioGraphObject->addAudioFlag(kTTAudioGraphGenerator);
		if (wrappedMaxClass->options && !wrappedMaxClass->options->lookup(TT("nonadapting"), v))
			self->audioGraphObject->addAudioFlag(kTTAudioGraphNonAdapting);
				attr_args_process(self, argc, argv);
	}
	return (t_object*)self;
}


void MaxAudioGraphWrappedClass_free(WrappedInstancePtr self)
{
	if (self->audioGraphObject)
		TTObjectBaseRelease((TTObjectBasePtr*)&self->audioGraphObject);

	for (int i=0; i<MAX_NUM_INLETS; i++) {
		if (self->inlets[i])
			object_free(self->inlets[i]);
	}
}



// METHODS SPECIFIC TO AUDIO GRAPH EXTERNALS

TTErr MaxAudioGraphReset(t_object* x, long vectorSize)
{
	WrappedInstancePtr self = (WrappedInstancePtr)x;
	return self->audioGraphObject->resetAudio();
}


TTErr MaxAudioGraphSetup(t_object* x)
{
	WrappedInstancePtr self = (WrappedInstancePtr)x;
	t_atom		a[2];
	TTUInt16	i=0;
	
	atom_setobj(a+0, (t_object*)self->audioGraphObject);
	while (self->audioGraphOutlets[i]) {
		atom_setlong(a+1, i);
		outlet_anything(self->audioGraphOutlets[i], gensym("audio.connect"), 2, a);
		i++;
	}
	return kTTErrNone;
}


/* A graph link has been established */
TTErr MaxAudioGraphConnect(t_object* x, TTAudioGraphObjectBasePtr audioSourceObject, TTUInt16 sourceOutletNumber)
{
	WrappedInstancePtr	self = WrappedInstancePtr(x);
	long				inletNumber = proxy_getinlet(SELF);
	
	return self->audioGraphObject->connectAudio(audioSourceObject, sourceOutletNumber, inletNumber);
}


/* A graph link has been dropped */
TTErr MaxAudioGraphDrop(t_object* x, long inletNumber, t_object* sourceMaxObject, long sourceOutletNumber)
{
	WrappedInstancePtr		self = WrappedInstancePtr(x);
	TTAudioGraphObjectBasePtr	sourceObject = NULL;
	TTErr 					err;
	
	err = (TTErr)long(object_method(sourceMaxObject, gensym("audio.object"), &sourceObject));
	if (self->audioGraphObject && sourceObject && !err)
		err = self->audioGraphObject->dropAudio(sourceObject, sourceOutletNumber, inletNumber);	
	return err;
}


TTErr MaxAudioGraphObject(t_object* x, TTAudioGraphObjectBasePtr* returnedAudioGraphObject)
{
	WrappedInstancePtr	self = WrappedInstancePtr(x);

	*returnedAudioGraphObject = self->audioGraphObject;
	return kTTErrNone;
}


/* The attribute getter */
t_max_err MaxAudioGraphWrappedClass_attrGet(WrappedInstancePtr self, t_object* attr, long* argc, t_atom** argv)
{
	t_symbol*	attrName = (t_symbol*)object_method(attr, _sym_getname);
	TTValue		v;
	long	i;
	
	TTSymbol	ttAttrName(attrName->s_name);

	self->audioGraphObject->getUnitGenerator().get(ttAttrName, v);

	*argc = v.size();
	if (!(*argv)) // otherwise use memory passed in
		*argv = (t_atom *)sysmem_newptr(sizeof(t_atom) * v.size());

	for (i=0; i<v.size(); i++) {
		if (v[i].type() == kTypeFloat32 || v[i].type() == kTypeFloat64) {
			TTFloat64	value = v[i];
			atom_setfloat(*argv+i, value);
		}
		else if (v[i].type() == kTypeSymbol) {
			TTSymbol	value = v[i];
			atom_setsym(*argv+i, gensym((char*)value.c_str()));
		}
		else {	// assume int
			TTInt32		value = v[i];
			atom_setlong(*argv+i, value);
		}
	}	
	return MAX_ERR_NONE;
}


/* The attribute setter */
t_max_err MaxAudioGraphWrappedClass_attrSet(WrappedInstancePtr self, t_object* attr, long argc, t_atom* argv)
{
	if (argc && argv) {
		t_symbol*	attrName = (t_symbol*)object_method(attr, _sym_getname);
		TTValue		v;
		long		i;
		
		TTSymbol	ttAttrName(attrName->s_name);
		
		v.resize(argc);
		for (i=0; i<argc; i++) {
			if (atom_gettype(argv+i) == A_LONG)
				v[i] = (TTInt32)atom_getlong(argv+i);
			else if (atom_gettype(argv+i) == A_FLOAT)
				v[i] = atom_getfloat(argv+i);
			else if (atom_gettype(argv+i) == A_SYM)
				v[i] = TT(atom_getsym(argv+i)->s_name);
			else
				object_error(SELF, "bad type for attribute setter");
		}
		self->audioGraphObject->getUnitGenerator().set(ttAttrName, v);
		return MAX_ERR_NONE;
	}
	return MAX_ERR_GENERIC;
}


/* Get number of channels of the audio graph signal */
t_max_err MaxAudioGraphWrappedClass_attrGetNumChannels(WrappedInstancePtr self, t_object* attr, long* argc, t_atom** argv)
{
	*argc = 1;
	if (!(*argv)) // otherwise use memory passed in
		*argv = (t_atom*)sysmem_newptr(sizeof(t_atom));
	
	atom_setlong(*argv, self->audioGraphObject->getOutputNumChannels(0));
	return MAX_ERR_NONE;
}


/* Set number of channels of the audio graph signal */
t_max_err MaxAudioGraphWrappedClass_attrSetNumChannels(WrappedInstancePtr self, t_object* attr, long argc, t_atom* argv)
{
	if (argc)
		self->audioGraphObject->setOutputNumChannels(0, atom_getlong(argv));
	return MAX_ERR_NONE;
}


/* Method for "anything" messages */
void MaxAudioGraphWrappedClass_anything(WrappedInstancePtr self, t_symbol* s, long argc, t_atom* argv)
{	
	TTValue		v_in;
	TTValue		v_out;
	TTSymbol	ttName(s->s_name);
	
	if (argc && argv) {
		v_in.resize(argc);
		
		// Typechecking - we only want ints, floats and symbols
		for (long i=0; i<argc; i++) {
			if (atom_gettype(argv+i) == A_LONG)
				v_in[i] = (TTInt32)atom_getlong(argv+i);
			else if (atom_gettype(argv+i) == A_FLOAT)
				v_in[i] = atom_getfloat(argv+i);
			else if (atom_gettype(argv+i) == A_SYM)
				v_in[i] = TT(atom_getsym(argv+i)->s_name);
			else
				object_error(SELF, "bad type for message arg");
		}
	}
	// Now that we know that the message is OK we send it on to the wrapped class
	self->audioGraphObject->getUnitGenerator().send(ttName, v_in, v_out);
		
	// process the returned value for the dumpout outlet
	{
		long	ac = v_out.size();

		if (ac) {
			t_atom*		av = (t_atom*)malloc(sizeof(t_atom) * ac);
			
			for (long i=0; i<ac; i++) {
				if (v_out[0].type() == kTypeSymbol) {
					TTSymbol ttSym = v_out[i];
					atom_setsym(av+i, gensym((char*)ttSym.c_str()));
				}
				else if (v_out[0].type() == kTypeFloat32 || v_out[0].type() == kTypeFloat64) {
					TTFloat64 f = 0.0;
					f = v_out[i];
					atom_setfloat(av+i, f);
				}
				else {
					TTInt32 l = v_out[i];
					atom_setfloat(av+i, l);
				}
			}
			object_obex_dumpout(self, s, ac, av);
			free(av);
		}
	}
}


// Method for Assistance Messages
void MaxAudioGraphWrappedClass_assist(WrappedInstancePtr self, void *b, long msg, long arg, char *dst)
{
	if (msg==1)		{	// Inlets
		if (arg == 0)
			strcpy(dst, "multichannel input and control messages");
		else if (arg > 0)
			snprintf(dst, 256, "multichannel input %ld", arg+1);
	}
	
	else if (msg==2) {// Outlets		
		if (arg == self->numOutputs)
			strcpy(dst, "dumpout");					
		else 
			snprintf(dst, 256, "multichannel output %ld", arg+1); 	
	}
}






TTErr wrapAsMaxAudioGraph(TTSymbol ttClassName, char* maxClassName, MaxAudioGraphWrappedClassPtr* c)
{
	return wrapAsMaxAudioGraph(ttClassName, maxClassName, c, (MaxAudioGraphWrappedClassOptionsPtr)NULL);
}

TTErr wrapAsMaxAudioGraph(TTSymbol ttClassName, char* maxClassName, MaxAudioGraphWrappedClassPtr* c, MaxAudioGraphWrappedClassOptionsPtr options)
{
	TTObjectBasePtr				o = NULL;
	TTValue						v;
	TTUInt16					numChannels = 1;
	MaxAudioGraphWrappedClassPtr	wrappedMaxClass = NULL;
	TTSymbol					name;
	TTCString					nameCString = NULL;
	t_symbol*					nameMaxSymbol = NULL;
	TTUInt32					nameSize = 0;
	
	common_symbols_init();
	TTAudioGraphInit();
	
	if (!wrappedMaxClasses)
		wrappedMaxClasses = hashtab_new(0);
	
	wrappedMaxClass = new MaxAudioGraphWrappedClass;
	wrappedMaxClass->maxClassName = gensym(maxClassName);
	wrappedMaxClass->maxClass = class_new(	maxClassName, 
											(method)MaxAudioGraphWrappedClass_new, 
											(method)MaxAudioGraphWrappedClass_free, 
											sizeof(WrappedInstance), 
											(method)0L, 
											A_GIMME, 
											0);
	wrappedMaxClass->ttClassName = ttClassName;
	wrappedMaxClass->validityCheck = NULL;
	wrappedMaxClass->validityCheckArgument = NULL;
	wrappedMaxClass->options = options;
	
	// Create a temporary instance of the class so that we can query it.
	TTObjectBaseInstantiate(ttClassName, &o, numChannels);

	o->getMessageNames(v);
	for (TTUInt16 i=0; i<v.size(); i++) {
		name = v[i];
		nameSize = strlen(name.c_str());
		nameCString = new char[nameSize+1];
		strncpy_zero(nameCString, name.c_str(), nameSize+1);

		nameMaxSymbol = gensym(nameCString);			
		class_addmethod(wrappedMaxClass->maxClass, (method)MaxAudioGraphWrappedClass_anything, nameCString, A_GIMME, 0);

		delete nameCString;
		nameCString = NULL;
	}
	
	o->getAttributeNames(v);
	for (TTUInt16 i=0; i<v.size(); i++) {
		TTAttributePtr	attr = NULL;
		t_symbol*		maxType = _sym_long;
		TTValue			isGenerator = NO;
		
		name = v[i];
		nameSize = strlen(name.c_str());
		nameCString = new char[nameSize+1];
		strncpy_zero(nameCString, name.c_str(), nameSize+1);
		nameMaxSymbol = gensym(nameCString);
				
		if (name == TT("maxNumChannels"))
			continue;						// don't expose these attributes to Max users
		if (name == TT("bypass")) {
			if (wrappedMaxClass->options && !wrappedMaxClass->options->lookup(TT("generator"), isGenerator))
				continue;					// generators don't have inputs, and so don't really provide a bypass
		}
		
		o->findAttribute(name, &attr);
		
		if (attr->type == kTypeFloat32)
			maxType = _sym_float32;
		else if (attr->type == kTypeFloat64)
			maxType = _sym_float64;
		else if (attr->type == kTypeSymbol || attr->type == kTypeString)
			maxType = _sym_symbol;
		
		class_addattr(wrappedMaxClass->maxClass, attr_offset_new(nameCString, maxType, 0, (method)MaxAudioGraphWrappedClass_attrGet, (method)MaxAudioGraphWrappedClass_attrSet, 0));
		
		// Add display styles for the Max 5 inspector
		if (attr->type == kTypeBoolean)
			CLASS_ATTR_STYLE(wrappedMaxClass->maxClass, (char*)name.c_str(), 0, (char*)"onoff");
		if (name == TT("fontFace"))
			CLASS_ATTR_STYLE(wrappedMaxClass->maxClass,	(char*)"fontFace", 0, (char*)"font");

		delete nameCString;
		nameCString = NULL;
	}
	
	TTObjectBaseRelease(&o);
	
	class_addmethod(wrappedMaxClass->maxClass, (method)MaxAudioGraphReset,		"audio.reset",		A_CANT, 0);
	class_addmethod(wrappedMaxClass->maxClass, (method)MaxAudioGraphSetup,		"audio.setup",		A_CANT, 0);
	class_addmethod(wrappedMaxClass->maxClass, (method)MaxAudioGraphConnect,	"audio.connect",	A_OBJ, A_LONG, 0);
	class_addmethod(wrappedMaxClass->maxClass, (method)MaxAudioGraphDrop,		"audio.drop",		A_CANT, 0);
	class_addmethod(wrappedMaxClass->maxClass, (method)MaxAudioGraphObject,		"audio.object",		A_CANT, 0);
	class_addmethod(wrappedMaxClass->maxClass, (method)MaxGraphConnect,			"graph.connect",		A_OBJ, A_LONG, 0);
 	class_addmethod(wrappedMaxClass->maxClass, (method)MaxGraphDrop,			"graph.drop",			A_CANT, 0);
	class_addmethod(wrappedMaxClass->maxClass, (method)MaxGraphObject,			"graph.object",			A_CANT, 0);
    class_addmethod(wrappedMaxClass->maxClass, (method)object_obex_dumpout, 	"dumpout",				A_CANT, 0); 
	class_addmethod(wrappedMaxClass->maxClass, (method)MaxAudioGraphWrappedClass_assist, 	"assist",				A_CANT, 0L);
	class_addmethod(wrappedMaxClass->maxClass, (method)stdinletinfo,			"inletinfo",			A_CANT, 0);
	
	
	if (wrappedMaxClass->options) {
		TTValue		userCanSetNumChannels = NO;
		TTErr		err = wrappedMaxClass->options->lookup(TT("userCanSetNumChannels"), userCanSetNumChannels);
		
		if (!err && userCanSetNumChannels == TTValue(YES))
			class_addattr(wrappedMaxClass->maxClass, attr_offset_new("numChannels", _sym_long, 0, 
																	 (method)MaxAudioGraphWrappedClass_attrGetNumChannels, 
																	 (method)MaxAudioGraphWrappedClass_attrSetNumChannels, 
																	 0));			
	}
	
	class_register(_sym_box, wrappedMaxClass->maxClass);
	if (c)
		*c = wrappedMaxClass;
	
	hashtab_store(wrappedMaxClasses, wrappedMaxClass->maxClassName, (t_object*)wrappedMaxClass);
	return kTTErrNone;
}


TTErr wrapAsMaxAudioGraph(TTSymbol ttClassName, char* maxClassName, MaxAudioGraphWrappedClassPtr* c, TTValidityCheckFunction validityCheck)
{
	TTErr err = wrapAsMaxAudioGraph(ttClassName, maxClassName, c);
	
	if (!err) {
		(*c)->validityCheck = validityCheck;
		(*c)->validityCheckArgument = (*c)->maxClass;
	}
	return err;
}

TTErr wrapAsMaxAudioGraph(TTSymbol ttClassName, char* maxClassName, MaxAudioGraphWrappedClassPtr* c, TTValidityCheckFunction validityCheck, MaxAudioGraphWrappedClassOptionsPtr options)
{
	TTErr err = wrapAsMaxAudioGraph(ttClassName, maxClassName, c, options);
	
	if (!err) {
		(*c)->validityCheck = validityCheck;
		(*c)->validityCheckArgument = (*c)->maxClass;
	}
	return err;
}


TTErr wrapAsMaxAudioGraph(TTSymbol ttClassName, char* maxClassName, MaxAudioGraphWrappedClassPtr* c, TTValidityCheckFunction validityCheck, TTPtr validityCheckArgument)
{
	TTErr err = wrapAsMaxAudioGraph(ttClassName, maxClassName, c);
	
	if (!err) {
		(*c)->validityCheck = validityCheck;
		(*c)->validityCheckArgument = validityCheckArgument;
	}
	return err;
}

TTErr wrapAsMaxAudioGraph(TTSymbol ttClassName, char* maxClassName, MaxAudioGraphWrappedClassPtr* c, TTValidityCheckFunction validityCheck, TTPtr validityCheckArgument, MaxAudioGraphWrappedClassOptionsPtr options)
{
	TTErr err = wrapAsMaxAudioGraph(ttClassName, maxClassName, c, options);
	
	if (!err) {
		(*c)->validityCheck = validityCheck;
		(*c)->validityCheckArgument = validityCheckArgument;
	}
	return err;
}
