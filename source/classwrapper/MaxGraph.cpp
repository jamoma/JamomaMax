/* 
 *	MaxGraph
 *	A thin wrapper of the Jamoma Graph system for use in the Cycling '74 Max/MSP environment.
 *	Includes an automated class wrapper to make TTFoundation objects available as objects for Max/MSP.
 *	Copyright © 2010 by Timothy Place
 * 
 * License: This code is licensed under the terms of the "New BSD License"
 * http://creativecommons.org/licenses/BSD/
 */

#include "maxGraph.h"
#include "ext_hashtab.h"

#define MAX_NUM_INLETS 16

// Data Structure for this object
typedef struct _wrappedInstance {
    t_object				obj;						///< Max audio object header
	TTGraphObjectBasePtr	graphObject;				///< ** must be second **
	TTPtr					graphOutlets[MAX_NUM_INLETS];			///< Array of outlets, may eventually want this to be more dynamic
	TTPtr					inlets[MAX_NUM_INLETS];					///< Array of proxy inlets beyond the first inlet
	WrappedClassPtr			wrappedClassDefinition;		///< A pointer to the class definition
} WrappedInstance;

typedef WrappedInstance* WrappedInstancePtr;		///< Pointer to a wrapped instance of our object.


/** A hash of all wrapped clases, keyed on the Max class name. */
static t_hashtab*	wrappedMaxClasses = NULL;


t_object* wrappedClass_new(t_symbol* name, long argc, t_atom* argv)
{	
	WrappedClass*		wrappedMaxClass = NULL;
    WrappedInstancePtr	self = NULL;
	TTValue				v;
	TTErr				err = kTTErrNone;
	TTUInt8				numInputs = 1;
	TTUInt8				numOutputs = 1;
 	long				attrstart = attr_args_offset(argc, argv);		// support normal arguments
	
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

		if (wrappedMaxClass->options && !wrappedMaxClass->options->lookup(TT("argumentDefinesNumInlets"), v)) {
			int argumentOffsetToDefineTheNumberOfInlets = v;
			if ((attrstart-argumentOffsetToDefineTheNumberOfInlets > 0) && argv+argumentOffsetToDefineTheNumberOfInlets)
				numInputs = atom_getlong(argv+argumentOffsetToDefineTheNumberOfInlets);
		}
		for (TTUInt16 i=numInputs-1; i>0; i--)
			self->inlets[i-1] = proxy_new(self, i, NULL);
		
    	object_obex_store((void*)self, _sym_dumpout, (object*)outlet_new(self, NULL));	// dumpout
		if (wrappedMaxClass->options && !wrappedMaxClass->options->lookup(TT("argumentDefinesNumOutlets"), v)) {
			int argumentOffsetToDefineTheNumberOfOutlets = v;
			if ((attrstart-argumentOffsetToDefineTheNumberOfOutlets > 0) && argv+argumentOffsetToDefineTheNumberOfOutlets)
				numOutputs = atom_getlong(argv+argumentOffsetToDefineTheNumberOfOutlets);
		}
		for (TTInt16 i=numOutputs-1; i>=0; i--)
			self->graphOutlets[i] = outlet_new(self, "audio.connect");

		self->wrappedClassDefinition = wrappedMaxClass;
		v.resize(3);
		v[0] = wrappedMaxClass->ttClassName;
		v[1] = numInputs;
		v[2] = numOutputs;
		err = TTObjectBaseInstantiate(TT("audio.object"), (TTObjectBasePtr*)&self->graphObject, v);
				
		attr_args_process(self, argc, argv);
	}
	return (t_object*)self;
}


void wrappedClass_free(WrappedInstancePtr self)
{
	if (self->graphObject)
		TTObjectBaseRelease((TTObjectBasePtr*)&self->graphObject);

	for (int i=0; i<MAX_NUM_INLETS; i++) {
		if (self->inlets[i])
			object_free(self->inlets[i]);
	}
}



// METHODS SPECIFIC TO AUDIO GRAPH EXTERNALS


TTErr MaxGraphReset(t_object* x)
{
	WrappedInstancePtr self = WrappedInstancePtr(x);
	return self->graphObject->reset();
}


TTErr MaxGraphSetup(t_object* x)
{
	WrappedInstancePtr	self = WrappedInstancePtr(x);
	t_atom				a[2];
	TTUInt16			i=0;
	
	atom_setobj(a+0, (t_object*)self->graphObject);
	while (self->graphOutlets[i]) {
		atom_setlong(a+1, i);
		outlet_anything(self->graphOutlets[i], gensym("graph.connect"), 2, a);
		i++;
	}
	return kTTErrNone;
}


TTErr MaxGraphConnect(t_object* x, TTGraphObjectBasePtr audioSourceObject, TTUInt16 sourceOutletNumber)
{
	WrappedInstancePtr	self = WrappedInstancePtr(x);
	long				inletNumber = proxy_getinlet(SELF);
	
	return self->graphObject->connect(audioSourceObject, sourceOutletNumber, inletNumber);
}


TTErr MaxGraphDrop(t_object* x, long inletNumber, t_object* sourceMaxObject, long sourceOutletNumber)
{
	WrappedInstancePtr	    self            = WrappedInstancePtr(x);
	TTGraphObjectBasePtr    sourceObject    = NULL;
	TTErr 				    err;
	
	err = (TTErr)long(object_method(sourceMaxObject, gensym("graph.object"), &sourceObject));
	if (self->graphObject && sourceObject && !err)
		err = self->graphObject->drop(sourceObject, sourceOutletNumber, inletNumber);	
	return err;
}


TTErr MaxGraphObject(t_object* x, TTGraphObjectBasePtr* returnedGraphObject)
{
	WrappedInstancePtr	self = WrappedInstancePtr(x);
	
	*returnedGraphObject = self->graphObject;
	return kTTErrNone;
}


t_max_err wrappedClass_attrGet(WrappedInstancePtr self, t_object* attr, long* argc, t_atom** argv)
{
	t_symbol*	attrName = (t_symbol*)object_method(attr, _sym_getname);
	TTValue		v;
	long		i;
	TTPtr		rawpointer;
	t_max_err	err;
	
	err = hashtab_lookup(self->wrappedClassDefinition->maxNamesToTTNames, attrName, (t_object**)&rawpointer);
	if (err)
		return err;

	TTSymbol	ttAttrName(rawpointer);
	
	self->graphObject->mKernel.get(ttAttrName, v);

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


t_max_err wrappedClass_attrSet(WrappedInstancePtr self, t_object* attr, long argc, t_atom* argv)
{
	if (argc && argv) {
		t_symbol*	attrName = (t_symbol*)object_method(attr, _sym_getname);
		TTValue		v;
		long	i;
		t_max_err		err;
		TTPtr		ptr;
		
		err = hashtab_lookup(self->wrappedClassDefinition->maxNamesToTTNames, attrName, (t_object**)&ptr);
		if (err)
			return err;
		
		TTSymbol	ttAttrName(ptr);
		
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
		self->graphObject->mKernel.set(ttAttrName, v);
		return MAX_ERR_NONE;
	}
	return MAX_ERR_GENERIC;
}


void wrappedClass_anything(WrappedInstancePtr self, t_symbol* s, long argc, t_atom* argv)
{
	TTValue		v;
	TTSymbol	ttName;
	t_max_err	err;
	
	err = hashtab_lookup(self->wrappedClassDefinition->maxNamesToTTNames, s, (t_object**)&ttName);
	if (err) {
		object_post(SELF, "no method found for %s", s->s_name);
		return;
	}

	if (argc && argv) {
		TTValue	v;
		
		v.resize(argc);
		for (long i=0; i<argc; i++) {
			if (atom_gettype(argv+i) == A_LONG)
				v[i] = (TTInt32)atom_getlong(argv+i);
			else if (atom_gettype(argv+i) == A_FLOAT)
				v[i] = atom_getfloat(argv+i);
			else if (atom_gettype(argv+i) == A_SYM)
				v[i] = TT(atom_getsym(argv+i)->s_name);
			else
				object_error(SELF, "bad type for message arg");
		}
		self->graphObject->mKernel.send(ttName, v, v); // FIXME: TEMPORARY HACK WHILE WE TRANSITION FROM 1-ARG MESSAGES to 2-ARG MESSAGES
		
		// process the returned value for the dumpout outlet
		{
			long	ac = v.size();

			if (ac) {
				t_atom*		av = (t_atom*)malloc(sizeof(t_atom) * ac);
				
				for (long i=0; i<ac; i++) {
					if (v[i].type() == kTypeSymbol) {
						TTSymbol ttSym = v[i];
						atom_setsym(av+i, gensym((char*)ttSym.c_str()));
					}
					else if (v[i].type() == kTypeFloat32 || v[i].type() == kTypeFloat64) {
						TTFloat64 f = v[i];
						atom_setfloat(av+i, f);
					}
					else {
						TTInt32 l = v[i];
						atom_setfloat(av+i, l);
					}
				}
				object_obex_dumpout(self, s, ac, av);
				free(av);
			}
		}
	}
	else
		self->graphObject->mKernel.send(ttName);
}


// Method for Assistance Messages
void wrappedClass_assist(WrappedInstancePtr self, void *b, long msg, long arg, char *dst)
{
	if (msg==1)			// Inlets
		strcpy(dst, "multichannel input and control messages");		
	else if (msg==2) {	// Outlets
		if (arg == 0)
			strcpy(dst, "multichannel output");
		else
			strcpy(dst, "dumpout");
	}
}






TTErr wrapAsMaxGraph(TTSymbol& ttClassName, char* maxClassName, WrappedClassPtr* c)
{
	return wrapAsMaxGraph(ttClassName, maxClassName, c, (WrappedClassOptionsPtr)NULL);
}

TTErr wrapAsMaxGraph(TTSymbol& ttClassName, char* maxClassName, WrappedClassPtr* c, WrappedClassOptionsPtr options)
{
	TTObjectBasePtr	o = NULL;
	TTValue			v;
	TTUInt16		numChannels = 1;
	WrappedClass*	wrappedMaxClass = NULL;
	TTSymbol		name;
	TTCString		nameCString = NULL;
	t_symbol*		nameMaxSymbol = NULL;
	TTUInt32		nameSize = 0;

	common_symbols_init();
	TTGraphInit();
	
	if (!wrappedMaxClasses)
		wrappedMaxClasses = hashtab_new(0);
	
	wrappedMaxClass = new WrappedClass;
	wrappedMaxClass->maxClassName = gensym(maxClassName);
	wrappedMaxClass->maxClass = class_new(	maxClassName, 
											(method)wrappedClass_new, 
											(method)wrappedClass_free, 
											sizeof(WrappedInstance), 
											(method)0L, 
											A_GIMME, 
											0);
	wrappedMaxClass->ttClassName = ttClassName;
	wrappedMaxClass->validityCheck = NULL;
	wrappedMaxClass->validityCheckArgument = NULL;
	wrappedMaxClass->options = options;
	wrappedMaxClass->maxNamesToTTNames = hashtab_new(0);
	
	// Create a temporary instance of the class so that we can query it.
	TTObjectBaseInstantiate(ttClassName, &o, numChannels);

	o->getMessageNames(v);
	for (TTUInt16 i=0; i<v.size(); i++) {
		name = v[i];
		nameSize = strlen(name.c_str());
		nameCString = new char[nameSize+1];
		strncpy_zero(nameCString, name.c_str(), nameSize+1);

		nameMaxSymbol = gensym(nameCString);			
		hashtab_store(wrappedMaxClass->maxNamesToTTNames, nameMaxSymbol, (t_object*)name.rawpointer());
		class_addmethod(wrappedMaxClass->maxClass, (method)wrappedClass_anything, nameCString, A_GIMME, 0);

		delete nameCString;
		nameCString = NULL;
	}
	
	o->getAttributeNames(v);
	for (TTUInt16 i=0; i<v.size(); i++) {
		TTAttributePtr	attr = NULL;
		t_symbol*		maxType = _sym_long;
		
		name = v[i];
		nameSize = strlen(name.c_str());
		nameCString = new char[nameSize+1];
		strncpy_zero(nameCString, name.c_str(), nameSize+1);
		nameMaxSymbol = gensym(nameCString);
				
		if (name == TT("MaxNumChannels"))
			continue;						// don't expose these attributes to Max users
		if (name == TT("Bypass")) {
			if (wrappedMaxClass->options && !wrappedMaxClass->options->lookup(TT("generator"), v))
				continue;					// generators don't have inputs, and so don't really provide a bypass
		}
		
		o->findAttribute(name, &attr);
		
		if (attr->type == kTypeFloat32)
			maxType = _sym_float32;
		else if (attr->type == kTypeFloat64)
			maxType = _sym_float64;
		else if (attr->type == kTypeSymbol || attr->type == kTypeString)
			maxType = _sym_symbol;
		
		hashtab_store(wrappedMaxClass->maxNamesToTTNames, nameMaxSymbol, (t_object*)name.rawpointer());
		class_addattr(wrappedMaxClass->maxClass, attr_offset_new(nameCString, maxType, 0, (method)wrappedClass_attrGet, (method)wrappedClass_attrSet, 0));
		
		// Add display styles for the Max 5 inspector
		if (attr->type == kTypeBoolean)
			CLASS_ATTR_STYLE(wrappedMaxClass->maxClass, (char*)name.c_str(), 0, "onoff");
		if (name == TT("fontFace"))
			CLASS_ATTR_STYLE(wrappedMaxClass->maxClass,	"fontFace", 0, "font");

		delete nameCString;
		nameCString = NULL;
	}
	
	TTObjectBaseRelease(&o);
	
	class_addmethod(wrappedMaxClass->maxClass, (method)MaxGraphReset,		"graph.reset",		A_CANT, 0);
	class_addmethod(wrappedMaxClass->maxClass, (method)MaxGraphSetup,		"graph.setup",		A_CANT, 0);
	class_addmethod(wrappedMaxClass->maxClass, (method)MaxGraphConnect,		"graph.connect",	A_OBJ, A_LONG, 0);
    class_addmethod(wrappedMaxClass->maxClass, (method)object_obex_dumpout, "dumpout",			A_CANT, 0); 
	class_addmethod(wrappedMaxClass->maxClass, (method)wrappedClass_assist, "assist",			A_CANT, 0L);
	class_addmethod(wrappedMaxClass->maxClass, (method)stdinletinfo,		"inletinfo",		A_CANT, 0);
	
	class_register(_sym_box, wrappedMaxClass->maxClass);
	if (c)
		*c = wrappedMaxClass;
	
	hashtab_store(wrappedMaxClasses, wrappedMaxClass->maxClassName, (t_object*)wrappedMaxClass);
	return kTTErrNone;
}


TTErr wrapAsMaxGraph(TTSymbol& ttClassName, char* maxClassName, WrappedClassPtr* c, TTValidityCheckFunction validityCheck)
{
	TTErr err = wrapAsMaxGraph(ttClassName, maxClassName, c);
	
	if (!err) {
		(*c)->validityCheck = validityCheck;
		(*c)->validityCheckArgument = (*c)->maxClass;
	}
	return err;
}

TTErr wrapAsMaxGraph(TTSymbol& ttClassName, char* maxClassName, WrappedClassPtr* c, TTValidityCheckFunction validityCheck, WrappedClassOptionsPtr options)
{
	TTErr err = wrapAsMaxGraph(ttClassName, maxClassName, c, options);
	
	if (!err) {
		(*c)->validityCheck = validityCheck;
		(*c)->validityCheckArgument = (*c)->maxClass;
	}
	return err;
}


TTErr wrapAsMaxGraph(TTSymbol& ttClassName, char* maxClassName, WrappedClassPtr* c, TTValidityCheckFunction validityCheck, TTPtr validityCheckArgument)
{
	TTErr err = wrapAsMaxGraph(ttClassName, maxClassName, c);
	
	if (!err) {
		(*c)->validityCheck = validityCheck;
		(*c)->validityCheckArgument = validityCheckArgument;
	}
	return err;
}

TTErr wrapAsMaxGraph(TTSymbol& ttClassName, char* maxClassName, WrappedClassPtr* c, TTValidityCheckFunction validityCheck, TTPtr validityCheckArgument, WrappedClassOptionsPtr options)
{
	TTErr err = wrapAsMaxGraph(ttClassName, maxClassName, c, options);
	
	if (!err) {
		(*c)->validityCheck = validityCheck;
		(*c)->validityCheckArgument = validityCheckArgument;
	}
	return err;
}

