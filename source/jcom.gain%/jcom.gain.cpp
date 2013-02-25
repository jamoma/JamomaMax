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
typedef struct _jcom_gain {
	t_object		obj;
	TTMatrixPtr		x;			// Jamoma matrix object for input
	TTMatrixPtr		y;			// Jamoma matrix object for output
	TTDataObjectBasePtr	gainObject;	// Jamoma object performing matrix operations
} GainObject;

typedef GainObject* GainObjectPtr;


// method prototypes
t_jit_err		GainClassInit	(void); 
GainObjectPtr	GainNew			(void);
void			GainFree		(GainObjectPtr self);
t_jit_err		GainMatrixCalc	(GainObjectPtr self, void *inputs, void *outputs);
t_jit_err		GainGetGain		(GainObjectPtr self, Ptr attr, AtomCount* ac, AtomPtr* av);
t_jit_err		GainSetGain		(GainObjectPtr self, Ptr attr, AtomCount ac, AtomPtr av);


// globals
static ClassPtr sGainClass = NULL;


/************************************************************************************/

t_jit_err GainClassInit(void) 
{
	long			attrflags = 0;// = JIT_ATTR_GET_DEFER_LOW | JIT_ATTR_SET_USURP_LOW;
	t_jit_object	*attr;
	t_jit_object	*mop;
	
	sGainClass = (ClassPtr)jit_class_new((char*)"jcom_gain", (method)GainNew, (method)GainFree, sizeof(GainObject), 0);

	// add matrix operator (mop)
	mop = (t_jit_object*)jit_object_new(_jit_sym_jit_mop, 1, 1); // args are  num inputs and num outputs
	jit_class_addadornment(sGainClass, mop);

	// add method(s)
	jit_class_addmethod(sGainClass, (method)GainMatrixCalc, (char*)"matrix_calc", A_CANT, 0);

	// add attribute(s)
	attr = (t_jit_object*)jit_object_new(_jit_sym_jit_attr_offset, 
										 "gain", 
										 _jit_sym_float32, 
										 attrflags, 
										 (method)GainGetGain, (method)GainSetGain, 
										 NULL);
	jit_class_addattr(sGainClass, attr);
	
	// finalize class
	jit_class_register(sGainClass);
	return JIT_ERR_NONE;
}


/************************************************************************************/
// Object Life Cycle

GainObjectPtr GainNew(void)
{
	GainObjectPtr	self = (GainObjectPtr)jit_object_alloc(sGainClass);
	TTErr			err;
	
	if (self) {
		err = TTObjectBaseInstantiate(kTTSym_matrix, (TTObjectBasePtr*)&self->x, kTTValNONE);
		err = TTObjectBaseInstantiate(kTTSym_matrix, (TTObjectBasePtr*)&self->y, kTTValNONE);
		err = TTObjectBaseInstantiate(TT("matrix.gain"), (TTObjectBasePtr*)&self->gainObject, kTTValNONE);
	} 
	return self;
}


void GainFree(GainObjectPtr self)
{
	TTErr err;
	
	err = TTObjectBaseRelease((TTObjectBasePtr*)&self->x);
	err = TTObjectBaseRelease((TTObjectBasePtr*)&self->y);
	err = TTObjectBaseRelease((TTObjectBasePtr*)&self->gainObject);
}


/************************************************************************************/
// Methods bound to input/inlets

t_jit_err GainMatrixCalc(GainObjectPtr self, void *inputs, void *outputs)
{
	t_jit_err			err = JIT_ERR_NONE;
	long				in_savelock;
	long				out_savelock;
	void				*in_matrix;
	void				*out_matrix;
	
	in_matrix 	= jit_object_method(inputs,_jit_sym_getindex,0);
	out_matrix 	= jit_object_method(outputs,_jit_sym_getindex,0);

	if (self && in_matrix && out_matrix) {
		in_savelock = TTMatrixReferenceJitterMatrix(self->x, in_matrix, false);		// we're just scaling, and this is a trivial example, so we don't copy
		out_savelock = TTMatrixReferenceJitterMatrix(self->y, out_matrix, false);	// we're just scaling, and this is a trivial example, so we don't copy
		
		self->gainObject->calculate(self->x, self->y);
		
		jit_object_method(out_matrix, _jit_sym_lock, out_savelock);
		jit_object_method(in_matrix, _jit_sym_lock, in_savelock);
	}
	else
		return JIT_ERR_INVALID_PTR;
	
	return err;
}


/************************************************************************************/
// Attribute Accessors

t_jit_err GainGetGain(GainObjectPtr self, Ptr attr, AtomCount* ac, AtomPtr* av)
{
	TTFloat64 gain;
	
	if (*ac && *av) {
		; // memory passed-in, use it
	}
	else {
		*av = (AtomPtr)sysmem_newptr(sizeof(Atom));
	}
	*ac = 1;
	
	self->gainObject->getAttributeValue(kTTSym_gain, gain);
	atom_setfloat(*av, gain);
	return JIT_ERR_NONE;
}


t_jit_err GainSetGain(GainObjectPtr self, Ptr attr, AtomCount ac, AtomPtr av)
{
	self->gainObject->setAttributeValue(kTTSym_gain, atom_getfloat(av));
	return JIT_ERR_NONE;
}

