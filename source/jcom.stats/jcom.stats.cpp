/**
 * \file jcom.stats.cpp
 * External for Jamoma: calculate running statistical values
 * By Trond Lossius, Copyright � 2001-06
 * 
 * License: This code is licensed under the terms of the "New BSD License"
 * http://creativecommons.org/licenses/BSD/
 */

#include "Jamoma.h"

typedef struct _stats{			// Data structure for this object 
	struct	object ob;			// Must always be the first field; used by Max
	double	sumOfValues;		// Sum of values
	double	sumOfSquaredValues;	// Sum of squared values
	unsigned long	maxWindowSize;		// Maximum window size
	unsigned long	windowSize;			// Actual window size
	long	attr_windowed;		// ATTRIBUTE: Flag indicating if we calculating windowed statistics
	unsigned long	valueCount;			// Number of floats counted so far
	double	*values;			// Pointer to array of values
	double	min;				// Min value recorded (within the window)
	double	max;				// Max value recorded (within the window)
	unsigned long	index;				// Next value goes at this index in array
	void	*outlet;			// Pointer to outlet. Need one for each outlet. This is for mean
	void	*outlet2;			// This is for standard deviation
	void	*outlet3;			// This is for counter
	void	*outlet4;			// This is for min value
	void	*outlet5;			// This is for max value
} t_stats;



// Prototypes for methods: need a method for each incoming message
void *stats_new(t_symbol *s, long argc, t_atom *argv);
void stats_free(t_stats *x);
void stats_setwindowed(t_stats *x, void *attr, long argc, t_atom *argv);
void stats_bang(t_stats *x);
void stats_int(t_stats *x, long n);
void stats_float(t_stats *x, double f);
void stats_clear(t_stats *x);
void stats_window(t_stats *x, long n);
void stats_set(t_stats *x, double f);
void stats_assist(t_stats *x, void *b, long msg, long arg, char *dst);


// Globals
t_class		*this_class;		// Required. Global pointing to this class


/************************************************************************************/
// Main() Function

int JAMOMA_EXPORT_MAXOBJ main(void)
{
	long attrflags = 0;
	t_class *c;
	t_object *attr;
	
	jamoma_init();
	common_symbols_init();

	// Define our class
	c = class_new("jcom.stats",(method)stats_new, (method)stats_free, sizeof(t_stats), (method)0L, A_GIMME, 0);		
		
	// Make methods accessible for our class: 

	class_addmethod(c, (method)stats_bang,				"bang",			0);
	class_addmethod(c, (method)stats_int,				"int",			A_LONG,		0);
 	class_addmethod(c, (method)stats_float, 			"float",		A_FLOAT,	0);		
	class_addmethod(c, (method)stats_assist, 			"assist",		A_CANT,		0); 
    class_addmethod(c, (method)stats_set,				"set",			A_FLOAT,	0);
	class_addmethod(c, (method)stats_window,			"window_size",	A_LONG,		0);
    class_addmethod(c, (method)stats_clear,				"clear",		0);
	class_addmethod(c, (method)object_obex_dumpout, 	"dumpout",		A_CANT,		0);
	
	// ATTRIBUTE: windowed
	attr = attr_offset_new("windowed", _sym_long, attrflags,
		(method)0, (method)stats_setwindowed, calcoffset(t_stats, attr_windowed));
	class_addattr(c, attr);	
	
	// Finalize our class
	class_register(CLASS_BOX, c);
	this_class = c;
	return 0;
}


/************************************************************************************/
// Object Life

void *stats_new(t_symbol *s, long argc, t_atom *argv)
{
	t_stats *x;
	
	
	x = (t_stats *)object_alloc(this_class);	// create the new instance and return a pointer to it
	if (x) {
		long attrstart = attr_args_offset(argc, argv);
		
		// Create outlets
    	object_obex_store((void *)x, _sym_dumpout, (object *)outlet_new(x,NULL));	// dumpout		
		x->outlet5 = floatout(x);				// 5th outlet: standard deviation
		x->outlet4 = floatout(x);				// 4th outlet: mean
		x->outlet3 = floatout(x);				// 3rd outlet: maximum
		x->outlet2 = floatout(x);				// 2nd outlet: minimum
		x->outlet = intout(x);					// 1st outlet: counter
		
		// Setting max window size and actual window size
		x->maxWindowSize = 0;
		x->windowSize = 0;
		if (attrstart && argv)		
			x->maxWindowSize = atom_getlong(argv);

		if ((attrstart==2) && argv)
			x->windowSize = atom_getlong(argv+1);
		if (x->maxWindowSize <= 0)
			x->maxWindowSize = 500;				// changing to default value
		if (x->windowSize <= 0)	
			x->windowSize = x->maxWindowSize;	// changing to default value
		if (x->windowSize > x->maxWindowSize)
			x->windowSize = x->maxWindowSize;	// making sure we do not read outside array
			
		// allocate memory for array			
		x->values = (double *)sysmem_newptr(sizeof(double) * x->maxWindowSize); 		
		if (x->values == NULL) {
			error("jcom.stats: memory allocation error"); // whoops, out of memory...
			return 0;
		}
		
		x->attr_windowed = 1;					// set default
		attr_args_process(x, argc, argv);		// handle attribute args			
		
		stats_clear(x);							// initilaize instance
		return (x);								// return the pointer to our new instantiation
	}
	else
		return 0;
}


void stats_free(t_stats *x)
{
	sysmem_freeptr(x->values);
}


/************************************************************************************/
// Methods bound to input/inlets


// ATTRIBUT: set_windowed
void stats_setwindowed(t_stats *x, void *attr, long argc, t_atom *argv)
{
	x->attr_windowed = atom_getlong(argv);
	stats_clear(x);
}

// BANG input
void stats_bang(t_stats *x)
{
	double mean, standardDeviation;
   
/*	if (x->valueCount < 0)
		mean = 0;
	else 
		mean = x->sumOfValues / x->valueCount;
	if (x->valueCount > 1)
		standardDeviation = sqrt((x->sumOfSquaredValues - ((x->sumOfValues*x->sumOfValues) / x->valueCount)) / (x->valueCount - 1));
	else
		standardDeviation = 0;*/

/////small optimization by Nils Peters////

	if (x->valueCount >= 0)
		mean = x->sumOfValues / x->valueCount;  
	else
		mean = 0;
    if (x->valueCount > 1)
        standardDeviation = sqrt((x->sumOfSquaredValues - (x->sumOfValues*mean)) / (x->valueCount - 1));  /* i just simplified the equation by using the mean which was already calculated before*/
    else
        standardDeviation = 0;
///// end of small optimization by Nils Peters////  
	outlet_float(x->outlet5, standardDeviation);
	outlet_float(x->outlet4, mean);
	outlet_float(x->outlet3, x->max);
	outlet_float(x->outlet2, x->min);
	outlet_int(x->outlet, x->valueCount);
}


// INT input
void stats_int(t_stats *x, long n)
{
	stats_set(x,(double)n);
	stats_bang(x);
}


// FLOAT input
void stats_float(t_stats *x, double f)
{
	stats_set(x, f);
	stats_bang(x);
}



// SET input
void stats_set(t_stats *x, double f)
{
	double old, temp;
	unsigned long i;

	// Calculating windowed statistics
	if (x->attr_windowed) {	
		if (x->valueCount < x->windowSize)
			x->valueCount++;

		// Remove oldest value
		old = x->values[x->index];
		x->sumOfValues -= old;
		x->sumOfSquaredValues -= old*old;
		
		// Insert new value
		x->values[x->index] = f;
		x->sumOfValues += f;
		x->sumOfSquaredValues += f*f;
		x->index++;
		
		// Do we need to update min or max?
		if (x->valueCount == 1) {
			x->min = f;
			x->max = f;
		}
		else {
			// Check new value
			if (f<x->min)
				x->min = f;
			if (f>x->max)
				x->max = f;
			// Do we need to update min or max because we are leaving current record holder behind?
			if (old==x->min) {
				temp = x->values[0];
				for (i=1; i< x->valueCount ; i++)
					if (x->values[i] < temp)
						temp = x->values[i];
				x->min = temp;
			}
			
			// Do we need to update min or max?
			if (old==x->max) {
				temp = x->values[0];
				for (i=1; i<x->valueCount ; i++)
					if (x->values[i] > temp)
						temp = x->values[i];
				x->max = temp;
			}		
		}
		
		// Wrap around at end of window
		if (x->index >= x->windowSize)
			x->index = 0;
	}
	
	// Calculating for infinite series
	else {
		x->valueCount++;
		x->sumOfValues += f;
		x->sumOfSquaredValues += f*f;
		if (x->valueCount == 1) {
			x->min = f;
			x->max = f;
		}
		else {
			if (f<x->min)
				x->min = f;
			if (f>x->max)
				x->max = f;
		}
	}
}


void stats_window(t_stats *x, long n)
{
	x->windowSize = n;
	
	if (x->windowSize <= 0)
		x->windowSize = x->maxWindowSize;
	if (x->windowSize > x->maxWindowSize)
		x->windowSize = x->maxWindowSize;
	stats_clear(x);
}


// CLEAR input
void stats_clear(t_stats *x)
{
	unsigned long i;

	x->sumOfValues = 0;
	x->sumOfSquaredValues = 0;
	x->valueCount = 0;
	x->index = 0;
	for (i=0; i<x->windowSize; i++)
		x->values[i] = 0;
	x->min = 0;
	x->max = 0;
}


// Method for Assistance Messages
void stats_assist(t_stats *x, void *b, long msg, long arg, char *dst)	// Display assistance messages
{
	if (msg==1) { 
		strcpy(dst, "(int/float) function value");
	}
	else if (msg==2) {
		if (arg==0)
			strcpy(dst, "(int) counter");
		else if (arg==1)
			strcpy(dst, "(float) minimum");
		else if (arg==2)
			strcpy(dst, "(float) maximum");
		else if (arg==3)
			strcpy(dst, "(float) mean");
		else if (arg==4)
			strcpy(dst, "(float) standard deviation");
		else
			strcpy(dst, "dumpout");
	}
}
