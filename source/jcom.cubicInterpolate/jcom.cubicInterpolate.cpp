/** @file
 * 
 * @ingroup modularMax
 *
 * @brief External for Jamoma: jcom.cubicInterpolate - Cubic interpolation on a stream of floats
 *
 * @details
 *
 * @authors Trond Lossius, Tim Place
 *
 * @copyright Copyright © 2006, Trond Lossius @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */


#include "Jamoma.h"

typedef struct _cubic_interp{	// Data structure for this object 
	t_object	ob;				// Must always be the first field; used by Max
	float		value[4];		// Four y values used for interpolation
	float		mu;				// Previous interpolated x-position
	float		attr_step;		// ATTRIBUTE: step size	
	char		clearflag;
	void		*outlet2;		// Pointer to outlet. need one for each outlet
	void		*outlet;
} t_cubic_interp;

// Prototypes for methods: need a method for each incoming message
void *cubic_interpolate_new(t_symbol *msg, long argc, t_atom *argv);
t_max_err cubic_interpolation_setstep(t_cubic_interp *x, void *attr, long argc, t_atom *argv);
void cubic_interpolate_bang(t_cubic_interp *x);
void cubic_interpolate_int(t_cubic_interp *x, long n);
void cubic_interpolate_float(t_cubic_interp *x, double f);
void cubic_interpolate_clear(t_cubic_interp *x);
void cubic_interpolate_assist(t_cubic_interp *x, void *b, long msg, long arg, char *dst);



// Globals
t_class		*this_class;				// Required. Global pointing to this class 



/************************************************************************************/
// Main() Function

int JAMOMA_EXPORT_MAXOBJ main(void)
{	
	long attrflags = 0;
	t_class *c;
	t_object *attr;

	common_symbols_init();

	// Define our class
	c = class_new("jcom.cubicInterpolate",(method)cubic_interpolate_new, (method)0L, sizeof(t_cubic_interp), 
		(method)0L, A_GIMME, 0);		

	// Make methods accessible for our class: 
	class_addmethod(c, (method)cubic_interpolate_bang,		"bang",		A_CANT,		0);
	class_addmethod(c, (method)cubic_interpolate_int,		"int",		A_LONG,		0);
 	class_addmethod(c, (method)cubic_interpolate_float, 	"float",	A_FLOAT,	0);
	class_addmethod(c, (method)cubic_interpolate_assist, 	"assist",	A_CANT,		0);  
    class_addmethod(c, (method)cubic_interpolate_clear,		"clear",	0);
	class_addmethod(c, (method)object_obex_dumpout,			"dumpout",	A_CANT,		0);  

	// Add attributes to our class:	
	// ATTRIBUTE: step size - clipped to the range [0, 1]
	attr = attr_offset_new("step", _sym_float, attrflags,
		(method)0L, (method)cubic_interpolation_setstep, calcoffset(t_cubic_interp, attr_step));
	class_addattr(c, attr);
	
	// Finalize our class
	class_register(CLASS_BOX, c);
	this_class = c;	
	return 0;
}


/************************************************************************************/
// Object Life

void *cubic_interpolate_new(t_symbol *msg, long argc, t_atom *argv)
{
	t_cubic_interp *x;
	
	x = (t_cubic_interp *)object_alloc(this_class);	// create the new instance and return a pointer to it
	
	if (x) {
    	object_obex_store((void *)x, _sym_dumpout, (object *)outlet_new(x,NULL));	// dumpout	
		x->outlet2 = bangout(x);					// create 2nd outlet. Used to ask for new value
		x->outlet = floatout(x);					// create the outlet
		cubic_interpolate_clear(x);					// initilaize instance		
		x->attr_step = 1.;							// default value
		attr_args_process(x, argc, argv);			// handle attribute args
	}
	return (x);										// return the pointer
}


/************************************************************************************/
// Methods bound to input/inlets


// ATTRIBUTE: step
t_max_err cubic_interpolation_setstep(t_cubic_interp *x, void *attr, long argc, t_atom *argv)
{
	float f;
	
	f = atom_getfloat(argv);
	if (f<0) f = 0;
	if (f>1) f = 1;
	
	x->attr_step = f;
	return MAX_ERR_NONE;
}

// BANG input
void cubic_interpolate_bang(t_cubic_interp *x)
{
	double y0, y1, y2, y3, mu, mu2;
	double a0,a1,a2,a3;
	
	if (x->clearflag) {
		outlet_bang(x->outlet2);					// ask for a new value
		if (x->clearflag) {							// check again
			outlet_float(x->outlet, 0);				// if we still have not received any points, return 0
			return;
		}	
	}	
	
	if (x->attr_step>1)
		x->attr_step=1;
	if (x->attr_step<0.)
		x->attr_step=0;
	mu = x->mu + x->attr_step;
	if (mu>=1.) {
		outlet_bang(x->outlet2);					// ask for a new value
		mu = mu - 1.;
	}			
	mu2 = mu*mu;
	
	y0 = x->value[0];
	y1 = x->value[1];
	y2 = x->value[2];
	y3 = x->value[3];

	a0 = y3 - y2 - y0 + y1;
	a1 = y0 - y1 - a0;
	a2 = y2 - y0;
	a3 = y1;

	outlet_float(x->outlet, a0*mu*mu2+a1*mu2+a2*mu+a3);
	x->mu = mu;
}


// INT input
void cubic_interpolate_int(t_cubic_interp *x, long n)
{
	cubic_interpolate_float(x, (double)n);
}


// FLOAT input
void cubic_interpolate_float(t_cubic_interp *x, double f)
{
	long i;

	if (x->clearflag) {
		for (i=0; i<4; i++)	
			x->value[i] = f;
		x->clearflag = 0;
		}
	else {
		for (i=0; i<3; i++)
			x->value[i] = x->value[i+1];
		x->value[3] = f;
	}
}


// CLEAR input
void cubic_interpolate_clear(t_cubic_interp *x)
{	
	x->mu = 0.;				
	x->clearflag = 1;
}


// Method for Assistance Messages
void cubic_interpolate_assist(t_cubic_interp *x, void *b, long msg, long arg, char *dst)	// Display assistance messages
{
	if (msg==1)
	{ 
		switch(arg)
		{
			case 0: strcpy(dst, "(bang/float) interpolate, set next");
			break;	
		}
	}
	else if (msg==2)
	{
		switch(arg)
		{
				case 0: strcpy(dst, "(float) interpolated value"); break;
				case 1: strcpy(dst, "(bang) need new target value"); break;
				case 2: strcpy(dst, "dumpout"); break;
		}
	}
}
