/** @file
 *
 * @ingroup implementationMaxExternalsJitter
 *
 * @brief j.gain% : Scale values in a matrix
 *
 * @details This is the actual Jitter object
 *
 * @authors Tim Place, Trond Lossius
 *
 * @copyright © 2011 by Timothy Place @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */


#include "jit.common.h"
#include "TTClassWrapperMax.h"


// types and structures
typedef struct _j_gain {
	t_object		obj;
	TTMatrix*		m_x;		// Jamoma matrix object for input
	TTMatrix*		m_y;		// Jamoma matrix object for output
	TTMatrixObject*	m_gain;		// Jamoma object performing matrix operations
} t_gain;


// method prototypes
t_jit_err		GainClassInit	(void); 
t_gain*			GainNew			(void);
void			GainFree		(t_gain* self);
t_jit_err		GainMatrixCalc	(t_gain* self, void *inputs, void *outputs);
t_jit_err		GainGetGain		(t_gain* self, Ptr attr, long* ac, t_atom** av);
t_jit_err		GainSetGain		(t_gain* self, Ptr attr, long ac, t_atom* av);


// globals
static t_class* s_gain_class = NULL;


/************************************************************************************/

t_jit_err GainClassInit(void) 
{
	long			attrflags = 0;// = JIT_ATTR_GET_DEFER_LOW | JIT_ATTR_SET_USURP_LOW;
	t_jit_object	*attr;
	t_jit_object	*mop;
	
	s_gain_class = (t_class*)jit_class_new((char*)"j_gain", (method)GainNew, (method)GainFree, sizeof(t_gain), 0);

	// add matrix operator (mop)
	mop = (t_jit_object*)jit_object_new(_jit_sym_jit_mop, 1, 1); // args are  num inputs and num outputs
	jit_class_addadornment(s_gain_class, mop);

	// add method(s)
	jit_class_addmethod(s_gain_class, (method)GainMatrixCalc, (char*)"matrix_calc", A_CANT, 0);

	// add attribute(s)
	attr = (t_jit_object*)jit_object_new(_jit_sym_jit_attr_offset, 
										 "gain", 
										 _jit_sym_float32, 
										 attrflags, 
										 (method)GainGetGain, (method)GainSetGain, 
										 NULL);
	jit_class_addattr(s_gain_class, attr);
	
	// finalize class
	jit_class_register(s_gain_class);
	return JIT_ERR_NONE;
}


/************************************************************************************/
// Object Life Cycle

t_gain* GainNew(void)
{
	t_gain*	self = (t_gain*)jit_object_alloc(s_gain_class);
	TTValue empty;
	
	self->m_x = new TTMatrix();
	self->m_y = new TTMatrix();
	self->m_gain = new TTMatrixObject("matrix.gain", empty);

	return self;
}


void GainFree(t_gain* self)
{
	delete self->m_gain;
	delete self->m_y;
	delete self->m_x;
}


/************************************************************************************/
// Methods bound to input/inlets

t_jit_err GainMatrixCalc(t_gain* self, void *inputs, void *outputs)
{
	t_jit_err			err = JIT_ERR_NONE;
	long				in_savelock;
	long				out_savelock;
	void				*in_matrix;
	void				*out_matrix;
	
	in_matrix 	= jit_object_method(inputs,_jit_sym_getindex,0);
	out_matrix 	= jit_object_method(outputs,_jit_sym_getindex,0);

	if (self && in_matrix && out_matrix) {
		in_savelock = TTMatrixReferenceJitterMatrix(*self->m_x, in_matrix, false);		// we're just scaling, and this is a trivial example, so we don't copy
		out_savelock = TTMatrixReferenceJitterMatrix(*self->m_y, out_matrix, false);	// we're just scaling, and this is a trivial example, so we don't copy
		
		self->m_gain->calculate(*self->m_x, *self->m_y);
		
		jit_object_method(out_matrix, _jit_sym_lock, out_savelock);
		jit_object_method(in_matrix, _jit_sym_lock, in_savelock);
	}
	else
		return JIT_ERR_INVALID_PTR;
	
	return err;
}


/************************************************************************************/
// Attribute Accessors

t_jit_err GainGetGain(t_gain* self, Ptr attr, long* ac, t_atom** av)
{
	TTFloat64 gain;
	
	if (*ac && *av) {
		; // memory passed-in, use it
	}
	else {
		*av = (t_atom*)sysmem_newptr(sizeof(t_atom));
	}
	*ac = 1;
	
	self->m_gain->get(kTTSym_gain, gain);
	atom_setfloat(*av, gain);
	return JIT_ERR_NONE;
}


t_jit_err GainSetGain(t_gain* self, Ptr attr, long ac, t_atom* av)
{
	self->m_gain->set(kTTSym_gain, atom_getfloat(av));
	return JIT_ERR_NONE;
}

