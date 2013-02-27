/** 
 * \file jcom.push.cpp
 * Simple physical modelling: Push an object about within a confined space.
 * Can be used for e.g. trajectories.
 *
 * Previously named tl.push
 * By Trond Lossius, Copyright 2011
 * 
 * License: This code is licensed under the terms of the "New BSD License"
 * http://creativecommons.org/licenses/BSD/
 */
	


#include "Jamoma.h"
#include "TTDSP.h"	// use the Jamoma DSP clipping functions


#define nonzero(x)				((x > 0) ? x : 1.)
#define MAXDIMENSIONS			10
#define	CLOSETOBORDER			0.9

t_symbol*		ps_clip;
t_symbol*		ps_bounce;
t_symbol*		ps_repel;

typedef struct _push{								///< Data structure for this object 
	t_object	ob;									///< Must always be the first field; used by Max
	float		previousPosition[MAXDIMENSIONS];	///< The previous position
	float		previousVelocity[MAXDIMENSIONS];	///< The previous velocity
	float		attrFriction;						///< Friction coefficient
	int			attrDimensions;						///< The number of dimensions used
	float		attrSize[MAXDIMENSIONS];			///< Room size, defined individually for each dimension
	t_symbol*   attrBoundaryMode;					///< Boundary mode
	float		force[MAXDIMENSIONS];				///< Force applied on the object
	void		*outlet;							///< Pointer to outlet. Need one for each outlet
} t_push;

// Prototypes for methods: need a method for each incoming message
void *push_new(t_symbol *msg, long argc, t_atom *argv);
void push_bang(t_push *x);
void push_force(t_push *x, t_symbol *s, long argc, t_atom *argv);
void push_position(t_push *x, t_symbol *s, long argc, t_atom *argv);
void push_clear(t_push *x);
void push_assist(t_push *x, void *b, long msg, long arg, char *dst);
t_max_err push_attr_setdimensions(t_push *x, void *attr, long argc, t_atom *argv);
t_max_err push_attr_setfriction(t_push *x, void *attr, long argc, t_atom *argv);
t_max_err push_attr_setsize(t_push *x, void *attr, long argc, t_atom *argv);
t_max_err push_attr_getsize(t_push *x, void *attr, long *argc, t_atom **argv);
t_max_err push_attr_setBoundaryMode(t_push *x, void *attr, long argc, t_atom *argv);


// Globals
t_class		*this_class;				// Required. Global pointing to this class 



/************************************************************************************/
// Main() Function

int JAMOMA_EXPORT_MAXOBJ main(void)
{	
	t_class *c;
	
	jamoma_init();
	common_symbols_init();
	ps_clip		= gensym("clip");
	ps_bounce	= gensym("bounce");
	ps_repel	= gensym("repel");

	// Define our class
	c = class_new("jcom.push",(method)push_new, (method)0L, sizeof(t_push), (method)0L, A_GIMME, 0);			

	// Make methods accessible for our class: 
	class_addmethod(c, (method)push_bang,				"bang",		A_CANT,		0);
	class_addmethod(c, (method)push_force,				"force",	A_GIMME,	0);
	class_addmethod(c, (method)push_position,			"position",	A_GIMME,	0);
	class_addmethod(c, (method)push_clear,				"clear",	0);
	class_addmethod(c, (method)push_assist, 			"assist",	A_CANT,		0); 
	class_addmethod(c, (method)object_obex_dumpout, 	"dumpout",	A_CANT,		0);

	CLASS_ATTR_FLOAT(c,		"friction",			0,		t_push,	attrFriction);
	CLASS_ATTR_ACCESSORS(c,	"friction",			NULL,	push_attr_setfriction);
	
	// Add attributes to our class:	
	CLASS_ATTR_LONG(c,		"dimensions",		0,		t_push,	attrDimensions);
	CLASS_ATTR_ACCESSORS(c,	"dimensions",		NULL,	push_attr_setdimensions);
	
	CLASS_ATTR_ATOM(c,		"size",				0,		t_push, attrSize);
	CLASS_ATTR_ACCESSORS(c,	"size",		push_attr_getsize,	push_attr_setsize);

	// ATTRIBUTE: boundary mode - options are none, clip, wrap, fold, repel
	CLASS_ATTR_SYM( c, 		"boundary",			0,		t_push, attrBoundaryMode);
	CLASS_ATTR_ACCESSORS(c, "boundary",			NULL,	push_attr_setBoundaryMode);
	CLASS_ATTR_ENUM(c,		"boundary",		0,	(char*)"none clip bounce fold repel");
	
	// Finalize our class
	class_register(CLASS_BOX, c);
	this_class = c;
	return 0;
}

#pragma mark -
#pragma mark Object life
/************************************************************************************/
// Object Life

void *push_new(t_symbol *msg, long argc, t_atom *argv)
{
	t_push *x;
	int i;
	
	x = (t_push *)object_alloc(this_class);	// create the new instance and return a pointer to it
	if (x) {
		// create inlets and outlets		
    	object_obex_store((void *)x, _sym_dumpout, (object *)outlet_new(x,NULL));	// dumpout
		x->outlet = floatout(x);			// velocity
		x->attrDimensions = 3;
		x->attrFriction = 0.1;
		for (i=0; i<MAXDIMENSIONS; i++)
			x->attrSize[i] = 40.0;			// This is the same default as for ViMiC
		x->attrBoundaryMode = jps_none;
		push_clear(x);						// initilaize instance
		attr_args_process(x, argc, argv);	// handle attribute args

	}
	return (x);
}


/************************************************************************************/
// Methods bound to attributes
#pragma mark -
#pragma mark attribute accessors


// ATTRIBUTE: dimensions
t_max_err push_attr_setdimensions(t_push *x, void *attr, long argc, t_atom *argv)
{
	long n;
	
	if (argc && argv) {
		n = atom_getlong(argv);
		if (n<1) n = 1;
		if (n>MAXDIMENSIONS) n = MAXDIMENSIONS;
		x->attrDimensions = n;
	}
	push_clear(x);
	return MAX_ERR_NONE;
}


// ATTRIBUTE: dimensions (1-3)
t_max_err push_attr_setfriction(t_push *x, void *attr, long argc, t_atom *argv)
{
	float f;
	
	if (argc && argv) {
		f = atom_getfloat(argv);
		if (f<=0.0 || f>=1.0) {
			error("Invalid argument for friction. Must be in the range (0, 1)");
			return MAX_ERR_NONE;
		}
		x->attrFriction = f;
	}
	return MAX_ERR_NONE;
}


t_max_err push_attr_setsize(t_push *x, void *attr, long argc, t_atom *argv)
{
	int i;
	float f;
	
	if ((argc==x->attrDimensions) && argv) {
		for (i=0; i<x->attrDimensions; i++) {
			f = atom_getfloat(argv);
			if (f>0.0) {
				x->attrSize[i] = f;
				argv++;
			}
			else 
				post("jcom.push: Ignored faulty value for size");
		}
	}
	return MAX_ERR_NONE;
}

t_max_err push_attr_getsize(t_push *x, void *attr, long *argc, t_atom **argv)
{
	int i;
	
	*argc = x->attrDimensions; 
	*argv = (t_atom*)sysmem_newptr((sizeof(t_atom))*x->attrDimensions);
	for (i=0; i<x->attrDimensions; i++) {
		atom_setfloat(*argv+i, x->attrSize[i]);
	}
		
	return MAX_ERR_NONE;
	// TODO: We need to free the memory assigned for argv
}


t_max_err push_attr_setBoundaryMode(t_push *x, void *attr, long argc, t_atom *argv)
{
	t_symbol* s;
	
	if (argc && argv) {
		s = atom_getsym(argv);
		if ((s==jps_none) || (s==ps_clip) || (s==jps_wrap) || (s==ps_bounce) || (s==ps_repel))
			x->attrBoundaryMode = s;
	}
	return MAX_ERR_NONE;
}


#pragma mark -
#pragma mark methods
/************************************************************************************/
// Methods bound to input/inlets


// BANG input
void push_bang(t_push *x)
{
	int i;
	float position, velocity, vicinity, repel;
	float rangeLow, rangeHigh;
	t_atom *a = NULL;
	a = (AtomPtr)sysmem_newptr(sizeof(Atom) * x->attrDimensions);
	
	for (i=0; i<x->attrDimensions; i++) {
		// Determine range
		rangeHigh = 0.5*x->attrSize[i];
		rangeLow = -rangeHigh;
		
		// repel mode: Push away from border
		if (x->attrBoundaryMode == ps_repel) {
			// Are we in the vicinity of a border?
			vicinity = fabs(x->previousPosition[i])/rangeHigh;
			vicinity = (vicinity-CLOSETOBORDER)/(1.0-CLOSETOBORDER);
			TTLimit(vicinity, (float)0.0, (float)1.0);
			repel = vicinity*x->previousPosition[i]/rangeHigh;
		}
		else
			repel = 0.0;
		
		// Numerical integration
		position = x->previousPosition[i] + (1.0-x->attrFriction)*x->previousVelocity[i] + x->force[i] - repel;
		velocity = position - x->previousPosition[i];
		
		// Boundary conditions
		if ((x->attrBoundaryMode==ps_clip) || (x->attrBoundaryMode==ps_repel)) {
			TTLimit(position, rangeLow, rangeHigh);
			velocity = position - x->previousPosition[i];
		}
		else if (x->attrBoundaryMode == jps_wrap)
			position = TTInfWrap(position, rangeLow, rangeHigh);
		else if (x->attrBoundaryMode == ps_bounce) {
			// Do we need to fold? The following test works because of symetry while avoiding fabs()
			if ((position*position) >= (rangeHigh*rangeHigh)) {
				position = TTFold(position, rangeLow, rangeHigh);
				// Invert direction of velocity
				velocity = -velocity;
			}
		}
		
		x->previousPosition[i] = position;
		x->previousVelocity[i] = velocity;
		x->force[i] = 0; 		// Force is reset to zero when it has been applied
		atom_setfloat(&a[i], position);
	}

	
	outlet_anything(x->outlet, _sym_list, x->attrDimensions, a);
	sysmem_freeptr(a);
}


// FORCE input
void push_force(t_push *x, t_symbol *s, long argc, t_atom *argv)
{
	int i;
	
	if (argc==x->attrDimensions) {
		for (i=0; i<x->attrDimensions; i++) {
			x->force[i] = atom_getfloat(argv);
			argv++;
		}
	}
	else {
		post("jcom.push: force vector has wrong dimension");
		return;
	}
}


// CLEAR input
void push_clear(t_push *x)
{
	int i;
	
	for (i=0; i< x->attrDimensions; i++) {
		x->previousPosition[i] = 0.0;
		x->previousVelocity[i] = 0.0;
		x->force[i] = 0.0;
	}
	push_bang(x);
}


// POSITION input
void push_position(t_push *x, t_symbol *s, long argc, t_atom *argv)
{
	int i;
	float f, min, max;
	
	if ((argc==x->attrDimensions) && argv) {
		for (i=0; i<x->attrDimensions; i++) {
			max = 0.5*x->attrSize[i];
			min = -max;
			f = atom_getfloat(argv);
			TTLimit(f, min, max);
			x->previousPosition[i] = f;
			x->previousVelocity[i] = 0.0;
			x->force[i] = 0.0;
			argv++;
		}
	}
	push_bang(x);
}


// Method for Assistance Messages
void push_assist(t_push *x, void *b, long msg, long arg, char *dst)	// Display assistance messages
{
	if (msg==1)
	{ 
		switch(arg)
		{
			case 0:
				strcpy(dst, "(list) force applied to object");
				break;	
		}
	}
	else if (msg==2)
	{
		switch(arg)
		{
			case 0:
				strcpy(dst, "(list) resulting position of object");
				break;
			case 1:
				strcpy(dst, "dumpout");
				break;
		}
	}
}
