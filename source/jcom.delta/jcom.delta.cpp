/** @file
 *
 * @ingroup modularMax
 *
 * @brief External for Jamoma: jcom.delta - Calculate 1st/2nd order differences and velocity.
 *
 * @details This object replaces tl.delta, tl.delta2 and tl.velocity from the tl.objects distribution.
 *
 * @authors Trond Lossius, Tim Place, Jan Schacher, François-Eudes Chanfrault
 *
 * @copyright Copyright © 2006, Trond Lossius @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */	

/*
	<---MAXREF
	
		/maxref/object/name
			jcom.delta

		/maxref/object/digest
			Calculate difference between incomming numbers

		/maxref/object/description
			<o>jcom.delta</o> calculates the difference between the last incomming value x[n]
			and the previous value received:<br/>
			delta = x[n]-x[n-1] 



		/maxref/metadata/author
			Trond Lossius, Tim Place, Jan Schacher, François-Eudes Chanfrault

		/maxref/metadata/tag
			Jamoma Max Math



		/maxref/inletlist/0
			Calculate Difference, int, float

		/maxref/outletlist/0
			Delta Value

		/maxref/outletlist/1		
			Dumpout



		/maxref/argument/
			None



		/maxref/message/float
			Caculate difference using between this and the previous number received.

		/maxref/message/int
			Converted to float


		
		/maxref/example/image	
			jcom.delta.gif
			
		/maxref/example/caption
			Calculate difference between the last two numbers received.


		
		/maxref/seealso/object/name
			jcom.delta2
		
		/maxref/seealso/object/description
			Calculate the 2nd order difference of incomming numbers.
		
		/maxref/seealso/object/name
			jcom.velocity

		/maxref/seealso/object/description
			Calculate velocity (rate of change per second) for incomming values.		
		
	MAXREF--->
*/

#include "Jamoma.h"

#define nonzero(x)				((x > 0) ? x : 1.)

typedef struct _delta{			///< Data structure for this object 
	t_object	ob;				///< Must always be the first field; used by Max
	float		x0;				///< Most recerntly received value
	float		x1;				///< Previous value
	float		x2;				///< 2nd last value received
	float		delta;			///< 1st order differential
	float		delta2;			///< 2nd order differential
	long		lasttime;		///< Time code for previous value received
	char		clearflag;		///< Flag indicating that history has been cleared
	void		*outlets[3];		///< Pointer to outlet. Need one for each outlet 
} t_delta;

// Prototypes for methods: need a method for each incoming message
void *delta_new(void);
void delta_bang(t_delta *x);
void delta_int(t_delta *x, long n);
void delta_float(t_delta *x, double f);
void delta_clear(t_delta *x);
void delta_set(t_delta *x, Symbol *s, long ac, Atom *setval);
void delta_assist(t_delta *x, void *b, long msg, long arg, char *dst);

// Globals
t_class		*this_class;				// Required. Global pointing to this class 



/************************************************************************************/
// Main() Function

int JAMOMA_EXPORT_MAXOBJ main(void)
{	
	t_class *c;
	
	jamoma_init();
	common_symbols_init();

	// Define our class
	c = class_new("jcom.delta",(method)delta_new, (method)0L, sizeof(t_delta), (method)0L, 0L, 0);			

	// Make methods accessible for our class: 
	class_addmethod(c, (method)delta_bang,				"bang",		A_CANT,		0);
	class_addmethod(c, (method)delta_int,				"int",		A_LONG,		0);
 	class_addmethod(c, (method)delta_float, 			"float",	A_FLOAT,	0);		
	class_addmethod(c, (method)delta_assist, 			"assist",	A_CANT,		0); 
    class_addmethod(c, (method)delta_set,				"set",		A_GIMME,	0);  
    class_addmethod(c, (method)delta_clear,				"clear",	0);
	class_addmethod(c, (method)object_obex_dumpout, 	"dumpout",	A_CANT,		0);
	
	// Finalize our class
	class_register(CLASS_BOX, c);
	this_class = c;
	return 0;
}

#pragma mark -
#pragma mark Object life
/************************************************************************************/
// Object Life

void *delta_new(void)
{
	t_delta *x;	
	x = (t_delta *)object_alloc(this_class);	// create the new instance and return a pointer to it
	if (x) {
		// create inlets and outlets		
    	object_obex_store((void *)x, _sym_dumpout, (object *)outlet_new(x,NULL));	// dumpout
		x->outlets[2] = floatout(x);			// velocity
		x->outlets[1] = floatout(x);			// 2nd order difference
		x->outlets[0] = floatout(x);			// 1st order difference

		delta_clear(x);							// initilaize instance
	}
	return (x);
}


#pragma mark -
#pragma mark methods
/************************************************************************************/
// Methods bound to input/inlets


// BANG input
void delta_bang(t_delta *x)
{
	long thistime;
	float velocity;

	thistime = gettime();	
	velocity = (1000 * (x->delta) ) / (nonzero(thistime - x->lasttime));
	x->lasttime = thistime;

	outlet_float(x->outlets[2], velocity);		
	outlet_float(x->outlets[1], x->delta2);
	outlet_float(x->outlets[0], x->delta);
}


// INT input
void delta_int(t_delta *x, long n)
{
	double f;
	
	f = (double)n;
	delta_float(x,f);
}


// FLOAT input
void delta_float(t_delta *x, double f)
{
	if (x->clearflag) {
		x->x1 = f;
		x->x0 = f;
		x->clearflag = 0;
	}
	x->x2 = x->x1;	
	x->x1 = x->x0;			
	x->x0 = f;
	
	x->delta = x->x0 - x->x1;
	x->delta2 = x->x0 - 2*x->x1 + x->x2;
	
	delta_bang(x);
}


// SET input
void delta_set(t_delta *x, t_symbol *s, long argc, t_atom *argv)
{
	float f;

	if (argc) 
		f = atom_getfloat(argv);
	if (x->clearflag) {
		x->x1 = f;
		x->x0 = f;
		x->clearflag = 0;
	}
	x->x2 = x->x1;	
	x->x1 = x->x0;			
	x->x0 = f;
	x->lasttime = gettime();
	
	x->delta = x->x0 - x->x1;
	x->delta2 = x->x0 - 2*x->x1 + x->x2;
}


// CLEAR input
void delta_clear(t_delta *x)
{
	x->clearflag = 1;
	x->delta = 0;
	x->delta2 = 0;
	x->lasttime = gettime();
}


// Method for Assistance Messages
void delta_assist(t_delta *x, void *b, long msg, long arg, char *dst)	// Display assistance messages
{
	if (msg==1)
	{ 
		switch(arg)
		{
			case 0:
				strcpy(dst, "(int/float) function value");
				break;	
		}
	}
	else if (msg==2)
	{
		switch(arg)
		{
			case 0:
				strcpy(dst, "(float) 1st order difference");
				break;
			case 1:
				strcpy(dst, "(float) 2nd order difference");
				break;
			case 2:
				strcpy(dst, "(float) velocity");
				break;
			case 3:
				strcpy(dst, "dumpout");
				break;
		}
	}
}
