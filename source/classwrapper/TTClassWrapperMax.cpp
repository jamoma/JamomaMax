/* 
 *	TTClassWrapperMax
 *	An automated class wrapper to make TTBlue object's available as objects for Max/MSP
 *	Copyright � 2008 by Timothy Place
 * 
 * License: This code is licensed under the terms of the "New BSD License"
 * http://creativecommons.org/licenses/BSD/
 */

#include "TTClassWrapperMax.h"
#include "ext_hashtab.h"
#include "TTCallback.h"
#ifdef MAC_VERSION
#include <dlfcn.h>
#endif

extern "C" void wrappedClass_receiveNotificationForOutlet(WrappedInstancePtr self, TTValue& arg);


/** A hash of all wrapped clases, keyed on the Max class name. */
static t_hashtab*	wrappedMaxClasses = NULL;


ObjectPtr wrappedClass_new(SymbolPtr name, AtomCount argc, AtomPtr argv)
{	
	WrappedClass*		wrappedMaxClass = NULL;
    WrappedInstancePtr	x = NULL;
	TTValue				sr(sys_getsr());
	TTValue				v;
 	long				attrstart = attr_args_offset(argc, argv);		// support normal arguments
	TTErr				err = kTTErrNone;
	
	// Find the WrappedClass
	hashtab_lookup(wrappedMaxClasses, name, (ObjectPtr*)&wrappedMaxClass);
	
	// If the WrappedClass has a validity check defined, then call the validity check function.
	// If it returns an error, then we won't instantiate the object.
	if(wrappedMaxClass){
		if(wrappedMaxClass->validityCheck)
			err = wrappedMaxClass->validityCheck(wrappedMaxClass->validityCheckArgument);
		else
			err = kTTErrNone;
	}
	else
		err = kTTErrGeneric;
	
	if(!err)
		x = (WrappedInstancePtr)object_alloc(wrappedMaxClass->maxClass);
    if(x){
		x->wrappedClassDefinition = wrappedMaxClass;
		x->maxNumChannels = 2;		// An initial argument to this object will set the maximum number of channels
		if(attrstart && argv)
			x->maxNumChannels = atom_getlong(argv);
		
		ttEnvironment->setAttributeValue(kTTSym_sampleRate, sr);

		
		
		
		
		
		if (wrappedMaxClass->options && !wrappedMaxClass->options->lookup(TT("numChannelsUseFixedRatioInputsToOutputs"), v)) {
		   TTUInt16	inputs;
		   TTUInt16	outputs;
		   
		   v.get(0, inputs);
		   v.get(1, outputs);
		   x->numInputs = x->maxNumChannels * inputs;
		   x->numOutputs = x->maxNumChannels * outputs;
		}
		else if (wrappedMaxClass->options && !wrappedMaxClass->options->lookup(TT("fixedNumChannels"), v)) {
			TTUInt16 numChannels;
			
			v.get(0, numChannels);
			x->numInputs = numChannels;
			x->numOutputs = numChannels;
		}
		else if (wrappedMaxClass->options && !wrappedMaxClass->options->lookup(TT("fixedNumOutputChannels"), v)) {
			TTUInt16 numChannels;
			
			v.get(0, numChannels);
			x->numInputs = x->maxNumChannels;
			x->numOutputs = numChannels;
		}
		else {
		   x->numInputs = x->maxNumChannels;
		   x->numOutputs = x->maxNumChannels;
		}
		
		if (wrappedMaxClass->options && !wrappedMaxClass->options->lookup(TT("additionalSignalInputSetsAttribute"), v)) {
			x->numControlSignals = v.getSize();
			x->controlSignalNames = new TTSymbol[x->numControlSignals];
			for(TTUInt16 i=0; i<x->numControlSignals; i++){
				x->numInputs++;
				v.get(i, x->controlSignalNames[i]);
			}
		}
		
		TTObjectInstantiate(wrappedMaxClass->ttblueClassName, &x->wrappedObject, x->maxNumChannels);		
		TTObjectInstantiate(TT("audiosignal"), &x->audioIn, x->numInputs);
		TTObjectInstantiate(TT("audiosignal"), &x->audioOut,x->numOutputs);
		attr_args_process(x,argc,argv);				// handle attribute args			
    	object_obex_store((void *)x, _sym_dumpout, (object *)outlet_new(x,NULL));	// dumpout
		
		
		dsp_setup((t_pxobject *)x, x->numInputs);			// inlets
				
		//if (wrappedMaxClass->options && !wrappedMaxClass->options->lookup(TT("numControlOutlets"), v))
		//	v.get(0, numControlOutlets);
		if (wrappedMaxClass->options && !wrappedMaxClass->options->lookup(TT("controlOutletFromNotification"), v)) {
            TTUInt16    outletIndex = 0;
            TTSymbol	notificationName;
            
 			v.get(0, outletIndex);
 			v.get(1, notificationName);
            
            // TODO: to support more than one notification->outlet we need see how many args are actually passed-in
            // and then we need to track them in a hashtab or something...
            
            x->controlOutlet = outlet_new((t_pxobject*)x, NULL);
            
            err = TTObjectInstantiate(TT("callback"), &x->controlCallback, kTTValNONE);
            x->controlCallback->setAttributeValue(TT("function"), TTPtr(&wrappedClass_receiveNotificationForOutlet));
            x->controlCallback->setAttributeValue(TT("baton"), TTPtr(x));	
 
        	// dynamically add a message to the callback object so that it can handle the 'objectFreeing' notification
            x->controlCallback->registerMessage(notificationName, (TTMethod)&TTCallback::notify, kTTMessagePassValue);
            
            // tell the source that is passed in that we want to watch it
            x->wrappedObject->registerObserverForNotifications(*x->controlCallback);            

        }
        
		for (short i=0; i < x->numOutputs; i++)
			outlet_new((t_pxobject *)x, "signal");			// outlets

		  
		x->obj.z_misc = Z_NO_INPLACE;
	}
	return ObjectPtr(x);
}


void wrappedClass_free(WrappedInstancePtr x)
{
	dsp_free((t_pxobject *)x);
	TTObjectRelease(&x->wrappedObject);
	TTObjectRelease(&x->audioIn);
	TTObjectRelease(&x->audioOut);
	delete[] x->controlSignalNames;
}


void wrappedClass_receiveNotificationForOutlet(WrappedInstancePtr self, TTValue& arg)
{
    TTString    string = "";
    SymbolPtr   s;
    
    arg.get(0, string);
    s = gensym((char*)string.c_str());
    outlet_anything(self->controlOutlet, s, 0, NULL);
}


t_max_err wrappedClass_attrGet(TTPtr self, ObjectPtr attr, AtomCount* argc, AtomPtr* argv)
{
	SymbolPtr	attrName = (SymbolPtr)object_method(attr, _sym_getname);
	TTValue		v;
	AtomCount	i;
	WrappedInstancePtr x = (WrappedInstancePtr)self;
	TTPtr		rawpointer;
	MaxErr		err;
	
	err = hashtab_lookup(x->wrappedClassDefinition->maxNamesToTTNames, attrName, (ObjectPtr*)&rawpointer);
	if (err)
		return err;

	TTSymbol	ttAttrName(rawpointer);
	
	x->wrappedObject->getAttributeValue(ttAttrName, v);

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

t_max_err wrappedClass_attrSet(TTPtr self, ObjectPtr attr, AtomCount argc, AtomPtr argv)
{
	WrappedInstancePtr x = (WrappedInstancePtr)self;
	
	if (argc && argv) {
		SymbolPtr	attrName = (SymbolPtr)object_method(attr, _sym_getname);
		TTValue		v;
		AtomCount	i;
		MaxErr		err;
		TTPtr		ptr = NULL;
		
		err = hashtab_lookup(x->wrappedClassDefinition->maxNamesToTTNames, attrName, (ObjectPtr*)&ptr);
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
				object_error(ObjectPtr(x), "bad type for attribute setter");
		}
		x->wrappedObject->setAttributeValue(ttAttrName, v);
		return MAX_ERR_NONE;
	}
	return MAX_ERR_GENERIC;
}


void wrappedClass_anything(TTPtr self, SymbolPtr s, AtomCount argc, AtomPtr argv)
{
	WrappedInstancePtr	x = (WrappedInstancePtr)self;
	TTSymbol			ttName;
	MaxErr				err;
	TTValue				v_in;
	TTValue				v_out;
	
	err = hashtab_lookup(x->wrappedClassDefinition->maxNamesToTTNames, s, (ObjectPtr*)&ttName);
	if (err) {
		object_post(ObjectPtr(x), "no method found for %s", s->s_name);
		return;
	}

	if (argc && argv) {
		v_in.setSize(argc);
		for (AtomCount i=0; i<argc; i++) {
			if (atom_gettype(argv+i) == A_LONG)
				v_in.set(i, AtomGetInt(argv+i));
			else if (atom_gettype(argv+i) == A_FLOAT)
				v_in.set(i, atom_getfloat(argv+i));
			else if (atom_gettype(argv+i) == A_SYM)
				v_in.set(i, TT(atom_getsym(argv+i)->s_name));
			else
				object_error(ObjectPtr(x), "bad type for message arg");
		}
	}
	x->wrappedObject->sendMessage(ttName, v_in, v_out);
		
		// process the returned value for the dumpout outlet
		{
			AtomCount	ac = v_out.getSize();

			if (ac) {
				AtomPtr		av = (AtomPtr)malloc(sizeof(Atom) * ac);
				
				for (AtomCount i=0; i<ac; i++) {
					if (v_out.getType() == kTypeSymbol){
						TTSymbol ttSym;
						v_out.get(i, ttSym);
						atom_setsym(av+i, gensym((char*)ttSym.c_str()));
					}
					else if (v_out.getType() == kTypeFloat32 || v_out.getType() == kTypeFloat64) {
						TTFloat64 f = 0.0;
						v_out.get(i, f);
						atom_setfloat(av+i, f);
					}
					else {
						TTInt32 l = 0;
						v_out.get(i, l);
						atom_setfloat(av+i, l);
					}
				}
				object_obex_dumpout(self, s, ac, av);
				free(av);
			}
		}
//	}
//	else
//		x->wrappedObject->sendMessage(ttName);
}


// Method for Assistance Messages
void wrappedClass_assist(WrappedInstancePtr self, void *b, long msg, long arg, char *dst)
{
	if(msg==1)	{		// Inlets
		if (arg==0)
			strcpy(dst, "signal input, control messages"); //leftmost inlet
		else{ 
			if (arg > self->numInputs-self->numControlSignals-1)
				//strcpy(dst, "control signal input");		
				snprintf(dst, 256, "control signal for \"%s\"", self->controlSignalNames[arg - self->numInputs+1].c_str());
			else
				strcpy(dst, "signal input");		
		}
	}
	else if(msg==2)	{	// Outlets
		if (arg < self->numOutputs)
			strcpy(dst, "signal output");
		else
			strcpy(dst, "dumpout"); //rightmost outlet
	}
}


// Perform (signal) Method
t_int *wrappedClass_perform(t_int *w)
{
   	WrappedInstancePtr	x = (WrappedInstancePtr)(w[1]);
	short				i, j;

	for(i=0; i < x->numControlSignals; i++){
		t_float* value = (t_float*)(w[x->numChannels+i]);
		x->wrappedObject->setAttributeValue(x->controlSignalNames[i], *value);
	}
	
	for(i=0; i<x->numChannels; i++){
		j = (i*2) + 1;
		x->audioIn->setVector(i, x->vs, (TTFloat32*)w[j+1]);
	}
	
	if(!x->obj.z_disabled)										// if we are not muted...
		x->wrappedObject->process(x->audioIn, x->audioOut);		// Actual process
	
	for(i=0; i<x->numChannels; i++){
		j = (i*2) + 1;
		x->audioOut->getVector(i, x->vs, (TTFloat32*)w[j+2]);
	}
	
	return w + ((x->numChannels*2)+2);				// +2 = +1 for the x pointer and +1 to point to the next object
}


void wrappedClass_perform64(WrappedInstancePtr self, ObjectPtr dsp64, double **ins, long numins, double **outs, long numouts, long sampleframes, long flags, void *userparam)
{
	TTUInt16 i;
	//TTUInt16 numChannels = numouts;
	
	self->numChannels = numouts; // <-- this is kinda lame, but for the time being I think we can get away with this assumption...
	
	for (i=0; i < self->numControlSignals; i++)
		self->wrappedObject->setAttributeValue(self->controlSignalNames[i], *ins[self->numInputs - self->numControlSignals + i]);
	
	self->audioIn->setNumChannelsWithInt(self->numInputs-self->numControlSignals);
	self->audioOut->setNumChannelsWithInt(self->numOutputs);
	self->audioOut->allocWithVectorSize(sampleframes);
	
	for (i=0; i < self->numInputs-self->numControlSignals; i++)
		self->audioIn->setVector(i, self->vs, ins[i]);
	
	self->wrappedObject->process(self->audioIn, self->audioOut);
	
	for (i=0; i < self->numOutputs; i++) 
		self->audioOut->getVectorCopy(i, self->vs, outs[i]);
	
}


// DSP Method
void wrappedClass_dsp(WrappedInstancePtr x, t_signal **sp, short *count)
{
	short		i, j, k=0;
	void		**audioVectors = NULL;
	
	// make sure that the global sample rate used by the environment is updated, in case it has changed
	ttEnvironment->setAttributeValue(kTTSym_sampleRate, sys_getsr());
		
	audioVectors = (void**)sysmem_newptr(sizeof(void*) * ((x->maxNumChannels * 2) + 1 + x->numControlSignals));
	audioVectors[k] = x;
	k++;
	
	x->numChannels = 0;
	x->vs = 0;
	for(i=0; i < x->maxNumChannels; i++){
		j = x->maxNumChannels + x->numControlSignals + i;
		if(count[i] && count[j]){
			x->numChannels++;
			if(sp[i]->s_n > x->vs)
				x->vs = sp[i]->s_n;
			
			audioVectors[k] = sp[i]->s_vec;
			k++;
			audioVectors[k] = sp[j]->s_vec;
			k++;
		}
	}
	
	x->audioIn->setAttributeValue(kTTSym_numChannels, x->numChannels);
	x->audioOut->setAttributeValue(kTTSym_numChannels, x->numChannels);
	x->audioIn->setAttributeValue(kTTSym_vectorSize, x->vs);
	x->audioOut->setAttributeValue(kTTSym_vectorSize, x->vs);
	//audioIn will be set in the perform method
	x->audioOut->sendMessage(kTTSym_alloc);
	
	x->wrappedObject->setAttributeValue(kTTSym_sampleRate, sp[0]->s_sr);
	
	j=i;
	for(i=0; i < x->numControlSignals; i++){
		audioVectors[k] = sp[j]->s_vec;
		j++;
		k++;
	}
	
	dsp_addv(wrappedClass_perform, k, audioVectors);
	sysmem_freeptr(audioVectors);
}


void wrappedClass_dsp64(WrappedInstancePtr self, ObjectPtr dsp64, short *count, double samplerate, long maxvectorsize, long flags)
{
	ttEnvironment->setAttributeValue(kTTSym_sampleRate, samplerate);
	self->wrappedObject->setAttributeValue(TT("sampleRate"), samplerate);
	
	self->vs = maxvectorsize;
	
	self->audioIn->setAttributeValue(TT("vectorSize"), self->vs);
	self->audioOut->setAttributeValue(TT("vectorSize"), self->vs);
	
	object_method(dsp64, gensym("dsp_add64"), self, wrappedClass_perform64, 0, NULL);
}


TTErr wrapTTClassAsMaxClass(TTSymbol ttblueClassName, const char* maxClassName, WrappedClassPtr* c)
{
	return wrapTTClassAsMaxClass(ttblueClassName, maxClassName, c, (WrappedClassOptionsPtr)NULL);
}

TTErr wrapTTClassAsMaxClass(TTSymbol ttblueClassName, const char* maxClassName, WrappedClassPtr* c, WrappedClassOptionsPtr options)
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
	TTDSPInit();
	
	if (!wrappedMaxClasses)
		wrappedMaxClasses = hashtab_new(0);
	
	wrappedMaxClass = new WrappedClass;
	wrappedMaxClass->maxClassName = gensym((char*)maxClassName);
	wrappedMaxClass->maxClass = class_new(	(char*)maxClassName, 
											(method)wrappedClass_new, 
											(method)wrappedClass_free, 
											sizeof(WrappedInstance), 
											(method)0L, 
											A_GIMME, 
											0);
	wrappedMaxClass->ttblueClassName = ttblueClassName;
	wrappedMaxClass->validityCheck = NULL;
	wrappedMaxClass->validityCheckArgument = NULL;
	wrappedMaxClass->options = options;
	wrappedMaxClass->maxNamesToTTNames = hashtab_new(0);
	
	// Create a temporary instance of the class so that we can query it.
	TTObjectInstantiate(ttblueClassName, &o, numChannels);
	
	if (!o) {
		error("Jamoma ClassWrapper failed to load %s", ttblueClassName.c_str());
		return kTTErrAllocFailed;
	}

	o->getMessageNames(v);
	for (TTUInt16 i=0; i<v.getSize(); i++) {
		v.get(i, name);
		//nameSize = name->getString().length();	// to -- this crash on Windows...
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
		//nameSize = name->getString().length();	// to -- this crash on Windows...
		nameSize = strlen(name.c_str());
		nameCString = new char[nameSize+1];
		strncpy_zero(nameCString, name.c_str(), nameSize+1);
		nameMaxSymbol = gensym(nameCString);
				
		if (name == TT("maxNumChannels"))
			continue;						// don't expose these attributes to Max users
		if (name == TT("bypass")) {
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
			CLASS_ATTR_STYLE(wrappedMaxClass->maxClass, (char*)name.c_str(), 0, (char*)"onoff");
		if (name == TT("fontFace"))
			CLASS_ATTR_STYLE(wrappedMaxClass->maxClass,	(char*)"fontFace", 0, (char*)"font");
		
		delete nameCString;
		nameCString = NULL;
	}
	
	TTObjectRelease(&o);
		
 	class_addmethod(wrappedMaxClass->maxClass, (method)wrappedClass_dsp, 		"dsp",			A_CANT, 0L);
 	class_addmethod(wrappedMaxClass->maxClass, (method)wrappedClass_dsp64, 		"dsp64",		A_CANT, 0L);
    class_addmethod(wrappedMaxClass->maxClass, (method)object_obex_dumpout, 	"dumpout",		A_CANT, 0); 
	class_addmethod(wrappedMaxClass->maxClass, (method)wrappedClass_assist, 	"assist",		A_CANT, 0L);
	class_addmethod(wrappedMaxClass->maxClass, (method)stdinletinfo,			"inletinfo",	A_CANT, 0);
	
	class_dspinit(wrappedMaxClass->maxClass);
	class_register(_sym_box, wrappedMaxClass->maxClass);
	if (c)
		*c = wrappedMaxClass;
	
	hashtab_store(wrappedMaxClasses, wrappedMaxClass->maxClassName, ObjectPtr(wrappedMaxClass));
	return kTTErrNone;
}


TTErr wrapTTClassAsMaxClass(TTSymbol ttblueClassName, const char* maxClassName, WrappedClassPtr* c, TTValidityCheckFunction validityCheck)
{
	TTErr err = wrapTTClassAsMaxClass(ttblueClassName, maxClassName, c);
	
	if (!err) {
		(*c)->validityCheck = validityCheck;
		(*c)->validityCheckArgument = (*c)->maxClass;
	}
	return err;
}

TTErr wrapTTClassAsMaxClass(TTSymbol ttblueClassName, const char* maxClassName, WrappedClassPtr* c, TTValidityCheckFunction validityCheck, WrappedClassOptionsPtr options)
{
	TTErr err = wrapTTClassAsMaxClass(ttblueClassName, maxClassName, c, options);
	
	if (!err) {
		(*c)->validityCheck = validityCheck;
		(*c)->validityCheckArgument = (*c)->maxClass;
	}
	return err;
}


TTErr wrapTTClassAsMaxClass(TTSymbol ttblueClassName, const char* maxClassName, WrappedClassPtr* c, TTValidityCheckFunction validityCheck, TTPtr validityCheckArgument)
{
	TTErr err = wrapTTClassAsMaxClass(ttblueClassName, maxClassName, c);
	
	if (!err) {
		(*c)->validityCheck = validityCheck;
		(*c)->validityCheckArgument = validityCheckArgument;
	}
	return err;
}

TTErr wrapTTClassAsMaxClass(TTSymbol ttblueClassName, const char* maxClassName, WrappedClassPtr* c, TTValidityCheckFunction validityCheck, TTPtr validityCheckArgument, WrappedClassOptionsPtr options)
{
	TTErr err = wrapTTClassAsMaxClass(ttblueClassName, maxClassName, c, options);
	
	if (!err) {
		(*c)->validityCheck = validityCheck;
		(*c)->validityCheckArgument = validityCheckArgument;
	}
	return err;
}



TTErr TTValueFromAtoms(TTValue& v, AtomCount ac, AtomPtr av)
{
	v.clear();
	
	// For now we assume floats for speed (e.g. in the performance sensitive jcom.dataspace object)
	for (int i=0; i<ac; i++)
		v.append((TTFloat64)atom_getfloat(av+i));
	return kTTErrNone;
}

TTErr TTAtomsFromValue(const TTValue& v, AtomCount* ac, AtomPtr* av)
{
	int	size = v.getSize();
	
	if (*ac && *av)
		; // memory was passed-in from the calling function -- use it
	else {
		*ac = size;
		*av = new Atom[size];// (t_atom*)sysmem_newptr(sizeof(t_atom) * size);
	}

	for (int i=0; i<size; i++) {
		atom_setfloat((*av)+i, v.getFloat64(i));
	}
	return kTTErrNone;
}


#include "jit.common.h"

/*
	We cannot count on Jitter matrices being tightly packed.
	There are alignment issues (rows are aligned to 16-byte boundaries)
	but there are additional issues, such as when accessing 1-plane of a 4-plane matrix, etc.
	Jitter is really expecting that any matrix will be broken down into vectors for processing.
	Jamoma does not make this assumption.
 
	Unfortunately, the only way to reliably get what we need into a tightly-packed Jamoma matrix
	is to do a copy -- and not just a copy but a row-by-row iterative copy.
 
	For these reasons, the 'copy' argument is optional, and it defaults to true.
 
	NOTE:	this function does not do the copying itself!
			this function references a matrix such that it is setup to serve as a copy.
 
	There is also the scenario where the output matrix from the Jamoma object is a different size
	than the input matrix, and the Jamoma object cannot change the size of a Jitter matrix.
*/

long TTMatrixReferenceJitterMatrix(TTMatrixPtr aTTMatrix, TTPtr aJitterMatrix, TTBoolean copy)
{
	t_jit_matrix_info	jitterMatrixInfo;
	TTBytePtr			jitterMatrixData;
	long				jitterMatrixLock = (long)jit_object_method(aJitterMatrix, _sym_lock, 1);
	long				jitterDimensionCount;
	TTValue				dimensions;
	
	jit_object_method(aJitterMatrix, _sym_getinfo, &jitterMatrixInfo);
	jit_object_method(aJitterMatrix, _sym_getdata, &jitterMatrixData);
	
	if (!copy)
		aTTMatrix->referenceExternalData(jitterMatrixData);
	
	if (jitterMatrixInfo.type == _sym_char)
		aTTMatrix->setAttributeValue(kTTSym_type, kTTSym_uint8);
	else if (jitterMatrixInfo.type == _sym_long)
		aTTMatrix->setAttributeValue(kTTSym_type, kTTSym_int32);
	else if (jitterMatrixInfo.type == _sym_float32)
		aTTMatrix->setAttributeValue(kTTSym_type, kTTSym_float32);
	else if (jitterMatrixInfo.type == _sym_float64)
		aTTMatrix->setAttributeValue(kTTSym_type, kTTSym_float64);
	
	aTTMatrix->setAttributeValue(kTTSym_elementCount, (int)jitterMatrixInfo.planecount);
	
	jitterDimensionCount = jitterMatrixInfo.dimcount;
	dimensions.setSize(jitterDimensionCount);
	
	for (int d=0; d < jitterDimensionCount; d++) {
		// The first 2 dimensions (rows and columns) are reversed in Jitter as compared to Jamoma
		if (d == 1)
			dimensions.set(0, (int)jitterMatrixInfo.dim[d]);
		else if (d==0 && jitterDimensionCount>1)
			dimensions.set(1, (int)jitterMatrixInfo.dim[d]);			
		else
			dimensions.set(d, (int)jitterMatrixInfo.dim[d]);
	}
	
	aTTMatrix->setAttributeValue(kTTSym_dimensions, dimensions);
		
	return jitterMatrixLock;
}


// Assumes jitter matrix is locked, matrix dimensions agree , and we're ready to go 
TTErr TTMatrixCopyDataFromJitterMatrix(TTMatrixPtr aTTMatrix, TTPtr aJitterMatrix)
{
	t_jit_matrix_info	jitterMatrixInfo;
	TTBytePtr			jitterMatrixData;
	TTValue				dimensions;
	int					dimcount;
	TTBytePtr			data = aTTMatrix->getLockedPointer();
	
	jit_object_method(aJitterMatrix, _sym_getinfo, &jitterMatrixInfo);
	jit_object_method(aJitterMatrix, _sym_getdata, &jitterMatrixData);
	
	dimcount = jitterMatrixInfo.dimcount;
	
	if (dimcount == 1) {
		memcpy(data, jitterMatrixData, jitterMatrixInfo.dimstride[0] * jitterMatrixInfo.dim[0]);
	}
	else if (dimcount == 2) {
		for (int i=0; i<jitterMatrixInfo.dim[1]; i++) { // step through the jitter matrix by row
			memcpy(data+(i*jitterMatrixInfo.dim[0] * aTTMatrix->getComponentStride()),
				   jitterMatrixData+(i*jitterMatrixInfo.dimstride[1]), 
				   jitterMatrixInfo.dimstride[0] * jitterMatrixInfo.dim[0]);
		}
	}
	else {
		// not supporting other dimcounts yet...
		return kTTErrInvalidType;
	}
	return kTTErrNone;
}


// Assumes jitter matrix is locked, matrix dimensions agree , and we're ready to go 
TTErr TTMatrixCopyDataToJitterMatrix(TTMatrixPtr aTTMatrix, TTPtr aJitterMatrix)
{
	t_jit_matrix_info	jitterMatrixInfo;
	TTBytePtr			jitterMatrixData;
	TTValue				dimensions;
	int					dimcount;
	TTBytePtr			data = aTTMatrix->getLockedPointer();
	
	jit_object_method(aJitterMatrix, _sym_getinfo, &jitterMatrixInfo);
	jit_object_method(aJitterMatrix, _sym_getdata, &jitterMatrixData);
	
	dimcount = jitterMatrixInfo.dimcount;
	
	// TODO: need to actually resize the Jitter matrix?
	
	if (dimcount == 1) {
		memcpy(jitterMatrixData, data, jitterMatrixInfo.dimstride[0] * jitterMatrixInfo.dim[0]);
	}
	else if (dimcount == 2) {
		for (int i=0; i<jitterMatrixInfo.dim[1]; i++) {  // step through the jitter matrix by row
			memcpy(jitterMatrixData+(i*jitterMatrixInfo.dimstride[1]), 
				   data+(i*jitterMatrixInfo.dim[0] * aTTMatrix->getComponentStride()), 
				   jitterMatrixInfo.dimstride[0] * jitterMatrixInfo.dim[0]);
		}
	}
	else {
		// not supporting other dimcounts yet...
		return kTTErrInvalidType;
	}
	return kTTErrNone;
}
