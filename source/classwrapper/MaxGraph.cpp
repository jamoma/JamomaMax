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
	TTGraphObjectPtr		graphObject;				///< ** must be second **
	TTPtr					graphOutlets[MAX_NUM_INLETS];			///< Array of outlets, may eventually want this to be more dynamic
	TTPtr					inlets[MAX_NUM_INLETS];					///< Array of proxy inlets beyond the first inlet
	WrappedClassPtr			wrappedClassDefinition;		///< A pointer to the class definition
} WrappedInstance;

typedef WrappedInstance* WrappedInstancePtr;		///< Pointer to a wrapped instance of our object.


/** A hash of all wrapped clases, keyed on the Max class name. */
static t_hashtab*	wrappedMaxClasses = NULL;


ObjectPtr wrappedClass_new(SymbolPtr name, AtomCount argc, AtomPtr argv)
{	
	WrappedClass*		wrappedMaxClass = NULL;
    WrappedInstancePtr	self = NULL;
	TTValue				v;
	TTErr				err = kTTErrNone;
	TTUInt8				numInputs = 1;
	TTUInt8				numOutputs = 1;
 	long				attrstart = attr_args_offset(argc, argv);		// support normal arguments
	
	// Find the WrappedClass
	hashtab_lookup(wrappedMaxClasses, name, (ObjectPtr*)&wrappedMaxClass);
	
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
    if (self){

		if (wrappedMaxClass->options && !wrappedMaxClass->options->lookup(TT("argumentDefinesNumInlets"), v)) {
			long argumentOffsetToDefineTheNumberOfInlets = v;
			if ((attrstart-argumentOffsetToDefineTheNumberOfInlets > 0) && argv+argumentOffsetToDefineTheNumberOfInlets)
				numInputs = atom_getlong(argv+argumentOffsetToDefineTheNumberOfInlets);
		}
		for (TTUInt16 i=numInputs-1; i>0; i--)
			self->inlets[i-1] = proxy_new(self, i, NULL);
		
    	object_obex_store((void*)self, _sym_dumpout, (object*)outlet_new(self, NULL));	// dumpout
		if (wrappedMaxClass->options && !wrappedMaxClass->options->lookup(TT("argumentDefinesNumOutlets"), v)) {
			long argumentOffsetToDefineTheNumberOfOutlets = v;
			if ((attrstart-argumentOffsetToDefineTheNumberOfOutlets > 0) && argv+argumentOffsetToDefineTheNumberOfOutlets)
				numOutputs = atom_getlong(argv+argumentOffsetToDefineTheNumberOfOutlets);
		}
		for (TTInt16 i=numOutputs-1; i>=0; i--)
			self->graphOutlets[i] = outlet_new(self, "audio.connect");

		self->wrappedClassDefinition = wrappedMaxClass;
		v.setSize(3);
		v.set(0, wrappedMaxClass->ttClassName);
		v.set(1, numInputs);
		v.set(2, numOutputs);
		err = TTObjectInstantiate(TT("audio.object"), (TTObjectPtr*)&self->graphObject, v);
				
		attr_args_process(self, argc, argv);
	}
	return ObjectPtr(self);
}


void wrappedClass_free(WrappedInstancePtr self)
{
	if (self->graphObject)
		TTObjectRelease((TTObjectPtr*)&self->graphObject);

	for (int i=0; i<MAX_NUM_INLETS; i++) {
		if (self->inlets[i])
			object_free(self->inlets[i]);
	}
}



// METHODS SPECIFIC TO AUDIO GRAPH EXTERNALS


TTErr MaxGraphReset(ObjectPtr x)
{
	WrappedInstancePtr self = WrappedInstancePtr(x);
	return self->graphObject->reset();
}


TTErr MaxGraphSetup(ObjectPtr x)
{
	WrappedInstancePtr	self = WrappedInstancePtr(x);
	Atom				a[2];
	TTUInt16			i=0;
	
	atom_setobj(a+0, ObjectPtr(self->graphObject));
	while (self->graphOutlets[i]) {
		atom_setlong(a+1, i);
		outlet_anything(self->graphOutlets[i], GENSYM("graph.connect"), 2, a);
		i++;
	}
	return kTTErrNone;
}


TTErr MaxGraphConnect(ObjectPtr x, TTGraphObjectPtr audioSourceObject, TTUInt16 sourceOutletNumber)
{
	WrappedInstancePtr	self = WrappedInstancePtr(x);
	long				inletNumber = proxy_getinlet(SELF);
	
	return self->graphObject->connect(audioSourceObject, sourceOutletNumber, inletNumber);
}


TTErr MaxGraphDrop(ObjectPtr x, long inletNumber, ObjectPtr sourceMaxObject, long sourceOutletNumber)
{
	WrappedInstancePtr	self = WrappedInstancePtr(x);
	TTGraphObjectPtr	sourceObject = NULL;
	TTErr 				err;
	
	err = (TTErr)long(object_method(sourceMaxObject, GENSYM("graph.object"), &sourceObject));
	if (self->graphObject && sourceObject && !err)
		err = self->graphObject->drop(sourceObject, sourceOutletNumber, inletNumber);	
	return err;
}


TTErr MaxGraphObject(ObjectPtr x, TTGraphObjectPtr* returnedGraphObject)
{
	WrappedInstancePtr	self = WrappedInstancePtr(x);
	
	*returnedGraphObject = self->graphObject;
	return kTTErrNone;
}


t_max_err wrappedClass_attrGet(WrappedInstancePtr self, ObjectPtr attr, AtomCount* argc, AtomPtr* argv)
{
	SymbolPtr	attrName = (SymbolPtr)object_method(attr, _sym_getname);
	TTValue		v;
	AtomCount	i;
	TTPtr		rawpointer;
	MaxErr		err;
	
	err = hashtab_lookup(self->wrappedClassDefinition->maxNamesToTTNames, attrName, (ObjectPtr*)&rawpointer);
	if (err)
		return err;

	TTSymbol	ttAttrName(rawpointer);
	
	self->graphObject->mKernel->getAttributeValue(ttAttrName, v);

	*argc = v.getSize();
	if (!(*argv)) // otherwise use memory passed in
		*argv = (t_atom *)sysmem_newptr(sizeof(t_atom) * v.getSize());

	for (i=0; i<v.getSize(); i++) {
		if(v.getType(i) == kTypeFloat32 || v.getType(i) == kTypeFloat64){
			TTFloat64	value;
			v.get(i, value);
			atom_setfloat(*argv+i, value);
		}
		else if(v.getType(i) == kTypeSymbol){
			TTSymbol	value;
			v.get(i, value);
			atom_setsym(*argv+i, gensym((char*)value.c_str()));
		}
		else{	// assume int
			TTInt32		value;
			v.get(i, value);
			atom_setlong(*argv+i, value);
		}
	}	
	return MAX_ERR_NONE;
}


t_max_err wrappedClass_attrSet(WrappedInstancePtr self, ObjectPtr attr, AtomCount argc, AtomPtr argv)
{
	if (argc && argv) {
		SymbolPtr	attrName = (SymbolPtr)object_method(attr, _sym_getname);
		TTValue		v;
		AtomCount	i;
		MaxErr		err;
		TTPtr		ptr;
		
		err = hashtab_lookup(self->wrappedClassDefinition->maxNamesToTTNames, attrName, (ObjectPtr*)&ptr);
		if (err)
			return err;
		
		TTSymbol	ttAttrName(ptr);
		
		v.setSize(argc);
		for (i=0; i<argc; i++) {
			if(atom_gettype(argv+i) == A_LONG)
				v.set(i, AtomGetInt(argv+i));
			else if(atom_gettype(argv+i) == A_FLOAT)
				v.set(i, atom_getfloat(argv+i));
			else if(atom_gettype(argv+i) == A_SYM)
				v.set(i, TT(atom_getsym(argv+i)->s_name));
			else
				object_error(SELF, "bad type for attribute setter");
		}
		self->graphObject->mKernel->setAttributeValue(ttAttrName, v);
		return MAX_ERR_NONE;
	}
	return MAX_ERR_GENERIC;
}


void wrappedClass_anything(WrappedInstancePtr self, SymbolPtr s, AtomCount argc, AtomPtr argv)
{
	TTValue		v;
	TTSymbol	ttName;
	MaxErr		err;
	
	err = hashtab_lookup(self->wrappedClassDefinition->maxNamesToTTNames, s, (ObjectPtr*)&ttName);
	if (err) {
		object_post(SELF, "no method found for %s", s->s_name);
		return;
	}

	if (argc && argv) {
		TTValue	v;
		
		v.setSize(argc);
		for (AtomCount i=0; i<argc; i++) {
			if (atom_gettype(argv+i) == A_LONG)
				v.set(i, AtomGetInt(argv+i));
			else if (atom_gettype(argv+i) == A_FLOAT)
				v.set(i, atom_getfloat(argv+i));
			else if (atom_gettype(argv+i) == A_SYM)
				v.set(i, TT(atom_getsym(argv+i)->s_name));
			else
				object_error(SELF, "bad type for message arg");
		}
		self->graphObject->mKernel->sendMessage(ttName, v, v); // FIXME: TEMPORARY HACK WHILE WE TRANSITION FROM 1-ARG MESSAGES to 2-ARG MESSAGES
		
		// process the returned value for the dumpout outlet
		{
			AtomCount	ac = v.getSize();

			if (ac) {
				AtomPtr		av = (AtomPtr)malloc(sizeof(Atom) * ac);
				
				for (AtomCount i=0; i<ac; i++) {
					if (v.getType() == kTypeSymbol){
						TTSymbol ttSym;
						v.get(i, ttSym);
						atom_setsym(av+i, gensym((char*)ttSym.c_str()));
					}
					else if (v.getType() == kTypeFloat32 || v.getType() == kTypeFloat64) {
						TTFloat64 f = 0.0;
						v.get(i, f);
						atom_setfloat(av+i, f);
					}
					else {
						TTInt32 l = 0;
						v.get(i, l);
						atom_setfloat(av+i, l);
					}
				}
				object_obex_dumpout(self, s, ac, av);
				free(av);
			}
		}
	}
	else
		self->graphObject->mKernel->sendMessage(ttName);
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
	TTObject*		o = NULL;
	TTValue			v;
	TTUInt16		numChannels = 1;
	WrappedClass*	wrappedMaxClass = NULL;
	TTSymbol		name;
	TTCString		nameCString = NULL;
	SymbolPtr		nameMaxSymbol = NULL;
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
	TTObjectInstantiate(ttClassName, &o, numChannels);

	o->getMessageNames(v);
	for (TTUInt16 i=0; i<v.getSize(); i++) {
		v.get(i, name);
		nameSize = strlen(name.c_str());
		nameCString = new char[nameSize+1];
		strncpy_zero(nameCString, name.c_str(), nameSize+1);

		nameMaxSymbol = gensym(nameCString);			
		hashtab_store(wrappedMaxClass->maxNamesToTTNames, nameMaxSymbol, ObjectPtr(name.rawpointer()));
		class_addmethod(wrappedMaxClass->maxClass, (method)wrappedClass_anything, nameCString, A_GIMME, 0);

		delete nameCString;
		nameCString = NULL;
	}
	
	o->getAttributeNames(v);
	for (TTUInt16 i=0; i<v.getSize(); i++) {
		TTAttributePtr	attr = NULL;
		SymbolPtr		maxType = _sym_long;
		
		v.get(i, name);
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
		
		hashtab_store(wrappedMaxClass->maxNamesToTTNames, nameMaxSymbol, ObjectPtr(name.rawpointer()));
		class_addattr(wrappedMaxClass->maxClass, attr_offset_new(nameCString, maxType, 0, (method)wrappedClass_attrGet, (method)wrappedClass_attrSet, 0));
		
		// Add display styles for the Max 5 inspector
		if (attr->type == kTypeBoolean)
			CLASS_ATTR_STYLE(wrappedMaxClass->maxClass, (char*)name.c_str(), 0, "onoff");
		if (name == TT("fontFace"))
			CLASS_ATTR_STYLE(wrappedMaxClass->maxClass,	"fontFace", 0, "font");

		delete nameCString;
		nameCString = NULL;
	}
	
	TTObjectRelease(&o);
	
	class_addmethod(wrappedMaxClass->maxClass, (method)MaxGraphReset,		"graph.reset",		A_CANT, 0);
	class_addmethod(wrappedMaxClass->maxClass, (method)MaxGraphSetup,		"graph.setup",		A_CANT, 0);
	class_addmethod(wrappedMaxClass->maxClass, (method)MaxGraphConnect,		"graph.connect",	A_OBJ, A_LONG, 0);
    class_addmethod(wrappedMaxClass->maxClass, (method)object_obex_dumpout, "dumpout",			A_CANT, 0); 
	class_addmethod(wrappedMaxClass->maxClass, (method)wrappedClass_assist, "assist",			A_CANT, 0L);
	class_addmethod(wrappedMaxClass->maxClass, (method)stdinletinfo,		"inletinfo",		A_CANT, 0);
	
	class_register(_sym_box, wrappedMaxClass->maxClass);
	if (c)
		*c = wrappedMaxClass;
	
	hashtab_store(wrappedMaxClasses, wrappedMaxClass->maxClassName, ObjectPtr(wrappedMaxClass));
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


// NOTE: DUPLICATIONS FROM THE MSP WRAPPER

#ifdef __LP64__
TTInt64	AtomGetInt(AtomPtr a)
{
	return (TTInt64)atom_getlong(a);
}
#else
int AtomGetInt(AtomPtr a)
{
	return (int)atom_getlong(a);
}
#endif
