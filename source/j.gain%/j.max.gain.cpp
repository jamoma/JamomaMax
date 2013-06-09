/* 
 *	External object for Max/MSP/Jitter -- Max Wrapper
 *	Copyright © 2011 by Timothy Place
 * 
 * License: This code is licensed under the terms of the "New BSD License"
 * http://creativecommons.org/licenses/BSD/
 */

#include "jit.common.h"
#include "max.jit.mop.h"
#include "TTClassWrapperMax.h"


// types and structures
typedef struct _jcom_max_gain {
	Object	ob;
	Ptr		obex;
} MaxGainObject;

typedef MaxGainObject* MaxGainObjectPtr;


// method prototypes
t_jit_err	GainClassInit	(void);
TTPtr		MaxGainNew		(t_symbol *s, long argc, t_atom *argv);
void		MaxGainFree		(MaxGainObjectPtr self);


// globals
static ClassPtr sMaxGainClass = NULL;


/************************************************************************************/

int TTCLASSWRAPPERMAX_EXPORT main(void)
{
	void *p, *q;
	
	TTFoundationInit();
	GainClassInit();	
	setup((t_messlist**)&sMaxGainClass, (method)MaxGainNew, (method)MaxGainFree, sizeof(MaxGainObject), 0, A_GIMME, 0);
	
	p = max_jit_classex_setup(calcoffset(MaxGainObject, obex));
	q = jit_class_findbyname(gensym("jcom_gain"));    
    max_jit_classex_mop_wrap(p, q, 0);							// attrs & methods for name, type, dim, planecount, bang, outputmatrix, etc
    max_jit_classex_standard_wrap(p, q, 0);						// attrs & methods for getattributes, dumpout, maxjitclassaddmethods, etc
    addmess((method)max_jit_mop_assist, (char*)"assist", A_CANT, 0);	// standard matrix-operator (mop) assist fn
	return 0;
}



/************************************************************************************/
// Object Life Cycle

void *MaxGainNew(t_symbol *s, long argc, t_atom *argv)
{
	MaxGainObjectPtr	self;
	void				*o;
	
	self = (MaxGainObjectPtr)max_jit_obex_new(sMaxGainClass, gensym("jcom_gain"));
	if (self) {
		o = jit_object_new(gensym("jcom_gain"));
		if (o) {
			max_jit_mop_setup_simple(self, o, argc, argv);			
			max_jit_attr_args(self, argc, argv);
		} 
		else {
			jit_object_error(SELF, (char*)"could not allocate object");
			object_free(SELF);
			self = NULL;
		}
	}
	return self;
}


void MaxGainFree(MaxGainObjectPtr self)
{
	max_jit_mop_free(self);
	jit_object_free(max_jit_obex_jitob_get(self));
	max_jit_obex_free(self);
}

