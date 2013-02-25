/* 
 *	External object for Max/MSP/Jitter -- Actual Jitter Object
 *	Copyright © 2011 by Timothy Place
 * 
 * License: This code is licensed under the terms of the "New BSD License"
 * http://creativecommons.org/licenses/BSD/
 */

#include "jit.common.h"
#include "TTClassWrapperMax.h"


// types and structures
typedef struct _jcom_stencil {
	t_object		obj;
	TTMatrixPtr		x;				// Jamoma matrix object for input
	TTMatrixPtr		y;				// Jamoma matrix object for output
	TTDataObjectBasePtr	stencilObject;	// Jamoma object performing matrix operations
} StencilObject;

typedef StencilObject* StencilObjectPtr;


// method prototypes
t_jit_err			StencilClassInit	(void); 
StencilObjectPtr	StencilNew			(void);
void				StencilFree			(StencilObjectPtr self);
t_jit_err			StencilMatrixCalc	(StencilObjectPtr self, void *inputs, void *outputs);
t_jit_err			StencilGetStepSize	(StencilObjectPtr self, Ptr attr, AtomCount* ac, AtomPtr* av);
t_jit_err			StencilSetStepSize	(StencilObjectPtr self, Ptr attr, AtomCount ac, AtomPtr av);
t_jit_err			StencilGetEdges		(StencilObjectPtr self, Ptr attr, AtomCount* ac, AtomPtr* av);
t_jit_err			StencilSetEdges		(StencilObjectPtr self, Ptr attr, AtomCount ac, AtomPtr av);


// globals
static ClassPtr sStencilClass = NULL;


/************************************************************************************/

t_jit_err StencilClassInit(void) 
{
	long			attrflags = 0;// = JIT_ATTR_GET_DEFER_LOW | JIT_ATTR_SET_USURP_LOW;
	t_jit_object	*attr;
	t_jit_object	*mop;
	
	sStencilClass = (ClassPtr)jit_class_new((char*)"jcom_stencil", (method)StencilNew, (method)StencilFree, sizeof(StencilObject), 0);

	// add matrix operator (mop)
	mop = (t_jit_object*)jit_object_new(_jit_sym_jit_mop, 1, 1); // args are  num inputs and num outputs
	jit_class_addadornment(sStencilClass, mop);

	// add method(s)
	jit_class_addmethod(sStencilClass, (method)StencilMatrixCalc, (char*)"matrix_calc", A_CANT, 0);

	// add attribute(s)
	attr = (t_jit_object*)jit_object_new(_jit_sym_jit_attr_offset_array, 
										 "stepSize", 
										 _jit_sym_long, 
										 JIT_MATRIX_MAX_PLANECOUNT,
										 attrflags, 
										 (method)StencilGetStepSize, (method)StencilSetStepSize, 
										 NULL, NULL);
	jit_class_addattr(sStencilClass, attr);
	
	attr = (t_jit_object*)jit_object_new(_jit_sym_jit_attr_offset,
										 "edges",
										 _jit_sym_symbol,
										 attrflags,
										 (method)StencilGetEdges, (method)StencilSetEdges,
										 NULL);
	jit_class_addattr(sStencilClass, attr);

	
	// finalize class
	jit_class_register(sStencilClass);
	return JIT_ERR_NONE;
}


/************************************************************************************/
// Object Life Cycle

StencilObjectPtr StencilNew(void)
{
	StencilObjectPtr	self = (StencilObjectPtr)jit_object_alloc(sStencilClass);
	TTErr				err;
	
	if (self) {
		err = TTObjectBaseInstantiate(kTTSym_matrix, (TTObjectBasePtr*)&self->x, kTTValNONE);
		err = TTObjectBaseInstantiate(kTTSym_matrix, (TTObjectBasePtr*)&self->y, kTTValNONE);
		err = TTObjectBaseInstantiate(TT("matrix.stencil"), (TTObjectBasePtr*)&self->stencilObject, kTTValNONE);
	} 
	return self;
}


void StencilFree(StencilObjectPtr self)
{
	TTErr err;
	
	err = TTObjectBaseRelease((TTObjectBasePtr*)&self->x);
	err = TTObjectBaseRelease((TTObjectBasePtr*)&self->y);
	err = TTObjectBaseRelease((TTObjectBasePtr*)&self->stencilObject);
}


/************************************************************************************/
// Methods bound to input/inlets

t_jit_err StencilMatrixCalc(StencilObjectPtr self, void *inputs, void *outputs)
{
	t_jit_err			err = JIT_ERR_NONE;
	long				in_savelock;
	long				out_savelock;
	void				*in_matrix;
	void				*out_matrix;
	
	in_matrix 	= jit_object_method(inputs,_jit_sym_getindex,0);
	out_matrix 	= jit_object_method(outputs,_jit_sym_getindex,0);

	if (self && in_matrix && out_matrix) {
		in_savelock = TTMatrixReferenceJitterMatrix(self->x, in_matrix);
		out_savelock = TTMatrixReferenceJitterMatrix(self->y, out_matrix);
		
		TTMatrixCopyDataFromJitterMatrix(self->x, in_matrix);
		self->stencilObject->calculate(self->x, self->y);
		TTMatrixCopyDataToJitterMatrix(self->y, out_matrix);
	
		jit_object_method(out_matrix, _jit_sym_lock, out_savelock);
		jit_object_method(in_matrix, _jit_sym_lock, in_savelock);
	}
	else
		return JIT_ERR_INVALID_PTR;
	
	return err;
}


/************************************************************************************/
// Attribute Accessors

t_jit_err StencilGetStepSize(StencilObjectPtr self, Ptr attr, AtomCount* ac, AtomPtr* av)
{
	TTValue		v;
	
	if (*ac && *av) {
		; // memory passed-in, use it
	}
	else {
		*av = (AtomPtr)sysmem_newptr(sizeof(Atom)*2);
	}
	*ac = 2;
	
	self->stencilObject->getAttributeValue(TT("stepSize"), v);
	for (AtomCount k=0; k < *ac; k++) {
		TTInt32 step;
		
		v.get(k, step);
		atom_setlong((*av)+k, step);
	}
	return JIT_ERR_NONE;
}


t_jit_err StencilSetStepSize(StencilObjectPtr self, Ptr attr, AtomCount ac, AtomPtr av)
{
	TTValue v;
	
	v.setSize(ac);
	for (AtomCount k=0; k<ac; k++)
		v.set(k, (int)atom_getlong(av+k));
	
	self->stencilObject->setAttributeValue(TT("stepSize"), v);
	return JIT_ERR_NONE;
}


t_jit_err StencilGetEdges(StencilObjectPtr self, Ptr attr, AtomCount* ac, AtomPtr* av)
{
	TTValue		v;
	TTSymbol	s;
	
	if (*ac && *av) {
		; // memory passed-in, use it
	}
	else {
		*av = (AtomPtr)sysmem_newptr(sizeof(Atom));
	}
	*ac = 1;
	
	self->stencilObject->getAttributeValue(TT("edges"), v);
	v.get(0, s);
	atom_setsym(*av, gensym(s.c_str()));
	return JIT_ERR_NONE;
}


t_jit_err StencilSetEdges(StencilObjectPtr self, Ptr attr, AtomCount ac, AtomPtr av)
{
	self->stencilObject->setAttributeValue(TT("edges"), TT(atom_getsym(av)->s_name));
	return JIT_ERR_NONE;
}

