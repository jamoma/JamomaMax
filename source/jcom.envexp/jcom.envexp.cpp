/** @file
 *
 * @ingroup modularMax
 *
 * @brief External for Jamoma: jcom.envexp - Create envelope with linear attack and exponential decay.
 *
 * @details This object replaces tl.envexp, previously a part of the tl.objects distribution.
 *
 * @authors Trond Lossius, Tim Place, Peter Castine, Jan Schacher, François-Eudes Chanfrault, Jeremy Bernstein
 *
 * @copyright Copyright © 2006, Trond Lossius @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */


/* ****************************************************************************
*                                                                              
* 	Input:																		
*			list:	Maximum amplitude, attack time, decay time					
*			bang:	Trigger new amplitude using stored values					
*			set:	Set envelope properties without triggering					
*			threshold (float):													
*					Change low threshold value									
*			steal (int):														
*					Enable/disable note stealing								
*																				
*	Arguments:																	
*			int:	Threshold amplitude. Envelope is terminated when this low	
*					threshold is reached. Defaults to -90 dB.					
*			int:	Note stealing properties.									
*						If 0: Note stealing disabled. When a envelope is		
*							triggered, a "0" is sent first so that amplitude	
*							immediately is set to 0.							
*						If non-zero: "0" is not sent. Hence the attack section	
*							of the envelope takes of from current amplitude		
*							 value.												
*						Defaults to 1 (non-zero)								
* 	Output:																		
*			list:	Envelope in line~ format.									
*			int:	If note-stealing is disabled, the value "0" is transmitted	
*					prior to list of envelope data.								
* 																				
* Trond Lossius 2000-06-26														
********************************************************************************/

#include "Jamoma.h"									// include Jamoma lib


#define NUM_OF_POINTS 128							///< maximum number of points that line~ accepts
		
typedef struct _envExp {							///< Data structure for this object
	t_object 	ob;									///< REQUIRED: Our object
	void 		*outlet;							///< pointer to outlet. Need one for each outlet
	Atom 		envelope[NUM_OF_POINTS * 2];		///< array of envelope points in line~ format
	double 		attr_coeff;							///< exponential coeffisient. Depends on threshold, decay rate and number of points that envelope is made from
	double 		attr_amplitude;						///< ATTRIBUTE: peak amplitude
	double 		attr_attack;						///< ATTRIBUTE: attack time in ms
	double 		attr_decayrate;						///< ATTRIBUTE: how many dB amplitude decrease per second during the decay
	double		attr_threshold;						///< ATTRIBUTE: low threshold for forcing amplitude to zero
	long		attr_steal;							///< ATTRIBUTE: note stealing enabled/disabled (boolean)
}	t_envExp;



// Prototypes for methods: need a method for each incoming message

/** Creates new instance */
void *envExp_new(Symbol *s, long argc, t_atom *argv);

/** Trigger new amplitude envelope using currenlty stored values
  * @return array of data points for envelope
  */
void envExp_bang(t_envExp *x);

/** Set peak amplitude attribute and trigger output
  * @return array of data points for envelope
  */
void envExp_float(t_envExp *x, double f);

/** Provides assistance cues
  * @return pointer to assistance cue
  */
void envExp_assist(t_envExp *x, void *b, long msg, long arg, char *dst);

/** Set attack time in ms */
void envExp_setattack(t_envExp *x, void *attr, long argc, t_atom *argv);

/** Sets the peak amplitude */
void envExp_setamplitude(t_envExp *x, void *attr, long argc, t_atom *argv);

/** Sets the decay rate attribute */
void envExp_setdecayrate(t_envExp *x, void *attr, long argc, t_atom *argv);

/** Sets the threshold attribute */
void envExp_setthreshold(t_envExp *x, void *attr, long argc, t_atom *argv);

/** Sets the note stealing attribute */
void envExp_steal(t_envExp *x, long var);

/** Calculates array of envelope points
  */
void envExp_calculate(t_envExp *x);



// Globals
t_class		*this_class;				///< Required. Global pointing to this class
t_symbol	*jps_symbol;
t_symbol	*jps_long;
t_symbol	*jps_float32;
t_symbol	*jps_dumpout;


/** Class Definition
  */
int JAMOMA_EXPORT_MAXOBJ main(void)
{
	//post("main");
	
	long attrflags = 0;
	t_class *c;
	t_object *attr;

	jamoma_init();
common_symbols_init();
	jps_symbol  = gensym("symbol");
	jps_long    = gensym("long");
	jps_float32 = gensym("float32");
	jps_dumpout = gensym("dumpout");

	// Define our class
	c = class_new("jcom.envexp",(method)envExp_new, 0L, sizeof(t_envExp), (method)0L, A_GIMME, 0);

	// Make methods accessible for our class: 
	class_addmethod(c, (method)envExp_bang,				"bang",		A_CANT,		0);
	class_addmethod(c, (method)envExp_float,			"float",	A_FLOAT,	0);
	class_addmethod(c, (method)envExp_assist, 			"assist",	A_CANT,		0); 
	class_addmethod(c, (method)object_obex_dumpout, 	"dumpout",	A_CANT,		0);
	
	// ATTRIBUTE: attack
	attr = attr_offset_new("attack", jps_float32, attrflags,
		(method)0L, (method)envExp_setattack, calcoffset(t_envExp, attr_attack));
	class_addattr(c, attr);

	// ATTRIBUTE: maximum amplitude
	attr = attr_offset_new("amplitude", jps_float32, attrflags,
		(method)0L, (method)envExp_setamplitude, calcoffset(t_envExp, attr_amplitude));
	class_addattr(c, attr);
		
	// ATTRIBUTE: decay rate
	attr = attr_offset_new("decayrate", jps_float32, attrflags,
		(method)0L, (method)envExp_setdecayrate, calcoffset(t_envExp, attr_decayrate));
	class_addattr(c, attr);

	// ATTRIBUTE: low threshold
	attr = attr_offset_new("threshold", jps_float32, attrflags,
		(method)0L, (method)envExp_setthreshold, calcoffset(t_envExp, attr_threshold));
	class_addattr(c, attr);	
	
	// ATTRIBUTE: note stealing
	attr = attr_offset_new("steal", jps_long, attrflags,
		(method)0L, (method)0L, calcoffset(t_envExp, attr_steal));
	class_addattr(c, attr);

	// Finalize our class
	class_register(CLASS_BOX, c);
	this_class = c;
	
	return 0;
}


/************************************************************************************/
#pragma mark -
#pragma mark life cycle


void *envExp_new(Symbol *s, long argc, t_atom *argv)
{
	//create the new instance and returns a pointer to it
	t_envExp *x = (t_envExp *)object_alloc(this_class);
	
	//post("new");
	if (x) {
			//post("new_x");
		// dumpout
		object_obex_store((void *)x, jps_dumpout, (object *)outlet_new(x,NULL));
		// create outlet
		x->outlet =outlet_new(x, 0L);
	
		//Initialisation of attributes
		x->attr_attack = 10;
		x->attr_amplitude = 1.;
		x->attr_decayrate = 90.;
		x->attr_threshold = -90;
		x->attr_steal = 1;
		// handle attribute args
		attr_args_process(x,argc,argv);
		envExp_calculate(x);
	}
	return(x);						//must return a pointer to the new instance
}


/************************************************************************************/
// Methods bound to input/inlets
#pragma mark -
#pragma mark methods


void envExp_bang(t_envExp *x)
{
	if (!x->attr_steal)
		outlet_float(x->outlet, 0.);
	outlet_list(x->outlet, 0L, NUM_OF_POINTS * 2, x->envelope);
}


// Set peak amplitude and trigger output
void envExp_float(t_envExp *x, double f)
{
	x->attr_amplitude = f;
	envExp_calculate(x);
	envExp_bang(x);
}


// Set attack
void envExp_setattack(t_envExp *x, void *attr, long argc, t_atom *argv)
{
	double f;
	
	if (argc)
	{
		f = atom_getfloat(argv);
		if (f>=0)
			x->attr_attack = f;
		envExp_calculate(x);
	}
}


// Set amplitude
void envExp_setamplitude(t_envExp *x, void *attr, long argc, t_atom *argv)
{
	if (argc)
	{
		x->attr_amplitude = atom_getfloat(argv);
		envExp_calculate(x);
	}
}


// Set decay rate
void envExp_setdecayrate(t_envExp *x, void *attr, long argc, t_atom *argv)
{
	double f;
	
	if (argc)
	{
		f = atom_getfloat(argv);
		if (f>0)
		{
			x->attr_decayrate = f;
			envExp_calculate(x);
		}
	}
}


//	Set threshold
void envExp_setthreshold(t_envExp *x, void *attr, long argc, t_atom *argv)
{	
	double f;
	if (argc) {
		f = atom_getfloat(argv);
		if (f >= 0)
			error ("jcom.envexp: Invalid threshold value");
		else {
			x->attr_threshold = f;
			envExp_calculate(x);
		}
	}
}


/*	Display assistance messages */
void envExp_assist(t_envExp *x, void *b, long msg, long arg, char *dst)	
{
	if (msg==1) { 
		switch(arg) {
			case 0: strcpy(dst, "(List) Max. ampl, attack time, decay time");
			break;
		}
	}
	else if (msg==2) {
		strcpy(dst, "Envelope data in line~ format");
	}
}




/************************************************************************************/
// Internal methods used to calculate envelope
#pragma mark -
#pragma mark calculations


void envExp_calculate(t_envExp *x)
{
	long i, j;
	double timestep, k;
	
	// write delta time steps to array
	j = 1;
	atom_setfloat(&x->envelope[j], x->attr_attack);
	timestep = (-1000.*x->attr_threshold) /(x->attr_decayrate*(NUM_OF_POINTS - 2.));
	for (i=1; i<NUM_OF_POINTS; i++)
	{
		j = j+2;
		atom_setfloat(&x->envelope[j], timestep);
	}
	
	/*	write amplitude values to array */
	k = pow(10.,-0.05*x->attr_decayrate);
	for (i=0; i<(NUM_OF_POINTS-1); i++)
	{
		j = 2*i;
		atom_setfloat(&x->envelope[j], x->attr_amplitude*pow(k,i*timestep*0.001) );
	}
	j = (NUM_OF_POINTS-1)*2;
	atom_setfloat(&x->envelope[j], 0.);
}

