/** @file
 *
 * @ingroup modularMax
 *
 * @brief External for Jamoma: jcom.dbapBformat - Distance Based Amplitude Panning using 4-channel ambisonic Bformat signals as sources.
 *
 * @details
 *
 * @authors Trond Lossius
 *
 * @copyright Copyright © 2011, Trond Lossius @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */

#include "Jamoma.h"
#include "jcom.dbapBformat.h"

// Globals
t_class		*this_class;				// Required. Global pointing to this class 

/************************************************************************************/
// Main() Function

int JAMOMA_EXPORT_MAXOBJ main(void)
{	
	t_class *c;

	jamoma_init();
	common_symbols_init();
	psRollOff				= gensym("rolloff");
	psSourcePosition		= gensym("source_position");
	psSourceGain			= gensym("source_gain");
	psSourceMute			= gensym("src_mute");
	psSourceBlur			= gensym("blur");
	psDestinationPosition	= gensym("destination_position");
	psNumberOfSources		= gensym("num_sources");
	psNumberOfDestinations	= gensym("num_destinations");
	
	// Define our class
	c = class_new("jcom.dbapBformat",(method)dbapBformatNew, (method)0L, sizeof(t_dbapBformat), 
		(method)0L, A_GIMME, 0);		

	// Make methods accessible for our class: 
	class_addmethod(c, (method)dbapBformatBlur,				"blur",				A_GIMME,	0);
	class_addmethod(c, (method)dbapBformatBlurAll,			"blurall",			A_FLOAT,	0);
	class_addmethod(c, (method)dbapBformatPolarity,			"polarity",			A_GIMME,	0);
	class_addmethod(c, (method)dbapBformatPolarityAll,		"polarityall",		A_FLOAT,	0);
	class_addmethod(c, (method)dbapBformatSource,			"src_position",		A_GIMME,	0);
	class_addmethod(c, (method)dbapBformatDestination,		"dst_position",		A_GIMME,	0);
	class_addmethod(c, (method)dbapBformatSourceGain,		"src_gain",			A_GIMME,	0);
	class_addmethod(c, (method)dbapBformatSourceWeight,		"src_weight",		A_GIMME,	0);
	class_addmethod(c, (method)dbapBformatMasterGain,		"master_gain",		A_FLOAT,	0);
	class_addmethod(c, (method)dbapBformatSourceMute,		"src_mute",			A_GIMME,	0);

	class_addmethod(c, (method)dbapBformatAssist,			"assist",			A_CANT,		0);
	class_addmethod(c, (method)dbapBformatInfo,				"info",				0);
	class_addmethod(c, (method)object_obex_dumpout,			"dumpout",			0);

	// Add attributes to our class:	
	CLASS_ATTR_LONG(c,		"num_sources",		0,		t_dbapBformat,	attrNumberOfSources);
	CLASS_ATTR_ACCESSORS(c,	"num_sources",		NULL,	dbapBformatAttrSetNumberOfSources);
	
	CLASS_ATTR_LONG(c,		"num_destinations",	0,		t_dbapBformat,	attrNumberOfDestinations);
	CLASS_ATTR_ACCESSORS(c,	"num_destinations",	NULL,	dbapBformatAttrSetNumberOfDestinations);

	CLASS_ATTR_FLOAT(c,		"rolloff",			0,		t_dbapBformat,	attrRollOff);
	CLASS_ATTR_ACCESSORS(c,	"rolloff",			NULL,	dbapBformatAttrSetRollOff);
	
	CLASS_ATTR_FLOAT(c,		"vicinity",			0,		t_dbapBformat,	attrVicinity);
	CLASS_ATTR_ACCESSORS(c,	"vicinity",			NULL,	dbapBformatAttrSetVicinity);
	
	// Finalize our class
	class_register(CLASS_BOX, c);
	this_class = c;	
	return 0;
}


/************************************************************************************/
// Object Life
#pragma mark -
#pragma mark object life

void *dbapBformatNew(t_symbol *msg, long argc, t_atom *argv)
{
	t_dbapBformat *x;
	long i,j;
	
	x = (t_dbapBformat *)object_alloc(this_class);	// create the new instance and return a pointer to it
	
	if (x) {
    	object_obex_store(x, _sym_dumpout, (object *)outlet_new(x,NULL));	// dumpout
		x->outlet = outlet_new(x, 0);				// Left outlet: Feed to matrix~
		
		// Initializing and setting defaults for attributes.
		x->masterGain = 1.;								// default value
		x->attrNumberOfSources = 1;						// default value
		x->attrNumberOfDestinations = 1;				// default value
		x->attrRollOff = 6;								// 6 dB rolloff by default
		x->attrVicinity = 0.15;							// Radius of 0.15 by default
		
		for (i=0; i<MAX_NUM_SOURCES; i++) {
			x->sourcePosition[i].x	= 0.;
			x->sourcePosition[i].y	= 0.;
			x->sourcePosition[i].z	= 0.;
			x->blur[i]				= 0.000001;
			x->sourceGain[i]		= 1.0;
			x->sourceNotMuted[i]	= 1.0;
			x->polarity[i]			= 1.0;
		}
		
		for (i=0; i<MAX_NUM_DESTINATIONS; i++) {
			x->destinationPosition[i].x = 0.;
			x->destinationPosition[i].y = 0.;
			x->destinationPosition[i].z = 0.;
		}

		for (i=0;i<MAX_NUM_SOURCES;i++) {
			for (j=0;j<MAX_NUM_DESTINATIONS;j++) {
				x->sourceWeight[i][j] = 1.;
				// TODO: The following initialisation is preliminary
				x->decodeCoefficients[i][j].w = 0.;
				x->decodeCoefficients[i][j].x = 0.;
				x->decodeCoefficients[i][j].y = 0.;
				x->decodeCoefficients[i][j].z = 0.;
			}
		}
		
		attr_args_process(x, argc, argv);			// Handle attribute args
		dbapBformatCalculateA(x);					// Calculate expo0nent coefficiant used for rolloff
		dbapBformatCalculateVariance(x);			// This implisitly also calculate all matrix values
	}
	return (x);										// Return the pointer
}



/********************************************************************************************/
// Methods bound to input/inlets

#pragma mark -
#pragma mark methods


// set spatial blur for nth source
void dbapBformatBlur(t_dbapBformat *x, t_symbol *msg, long argc, t_atom *argv)
{
	long n;
	float f;
	
	if ((argc>=2) && argv) {	
		n = atom_getlong(argv)-1;							// we start counting from 1 for sources
		if ( (n<0) || (n>=MAX_NUM_SOURCES) ) {
			error("Invalid argument(s) for blur");
			return;
		}
		argv++;
		f = atom_getfloat(argv);
		if (f<0.000001) 
			f = 0.000001;	
		x->blur[n] = f;
		dbapBformatCalculate(x, n);
	}
	else
		error("Invalid argument(s) for blur");
}

// set spatial blur for all sources
void dbapBformatBlurAll(t_dbapBformat *x, double f)
{
	long i;

	if (f<0.000001) 
		f = 0.000001;		
	for (i=0; i<x->attrNumberOfSources; i++) {
		x->blur[i] = f;
		dbapBformatCalculate(x, i);
	}
}

// set polarity for nth source
void dbapBformatPolarity(t_dbapBformat *x, t_symbol *msg, long argc, t_atom *argv)
{
	long n;
	float f;
	
	if ((argc>=2) && argv) {	
		n = atom_getlong(argv)-1;							// we start counting from 1 for sources
		if ( (n<0) || (n>=MAX_NUM_SOURCES) ) {
			error("Invalid argument(s) for blur");
			return;
		}
		argv++;
		f = atom_getfloat(argv);
		if (f<0.0) 
			f = 0.0;
		if (f>1.0)
			f = 1.0;
		x->polarity[n] = f;
		dbapBformatCalculate(x, n);
	}
	else
		error("Invalid argument(s) for blur");
}


// Set polarity for all sources
void dbapBformatPolarityAll(t_dbapBformat *x, double f)
{
	long i;
	
	if (f<0.0) 
		f = 0.0;
	if (f>1.0)
		f = 1.0;		
	for (i=0; i<x->attrNumberOfSources; i++) {
		x->polarity[i] = f;
		dbapBformatCalculate(x, i);
	}
}

// set source position and calculate output
void dbapBformatSource(t_dbapBformat *x, void *msg, long argc, t_atom *argv)
{
	long n;
	
	if (argc >= 4) {
		n = atom_getlong(argv)-1;							// we start counting from 1 for sources
		if ( (n<0) || (n>=MAX_NUM_DESTINATIONS) ) {
			error("Invalid arguments for source.");
			return;
		}

		x->sourcePosition[n].x = atom_getfloat(argv+1);
		x->sourcePosition[n].y = atom_getfloat(argv+2);
		x->sourcePosition[n].z = atom_getfloat(argv+3);

		dbapBformatCalculate(x, n);
	}
	else
		error("Invalid arguments for source.");
}


// set position of a destination
void dbapBformatDestination(t_dbapBformat *x, void *msg, long argc, t_atom *argv)
{
	long n;
	
	if (argc >= 4) {
		n = atom_getlong(argv)-1;							// we start counting from 1 for destinations
		if ( (n<0) || (n>=MAX_NUM_DESTINATIONS) ) {
			error("Invalid arguments for destination.");
			return;
		}
		x->destinationPosition[n].x = atom_getfloat(argv+1);
		x->destinationPosition[n].y = atom_getfloat(argv+2);
		x->destinationPosition[n].z = atom_getfloat(argv+3);
		
		// The set of destination points has been changed - recalculate variance.
		dbapBformatCalculateVariance(x);					// implicitely updates all matrix values
	}
	else
		error("Invalid arguments for speaker.");
}


void dbapBformatSourceGain(t_dbapBformat *x, void *msg, long argc, t_atom *argv)
{
	long n;
	float f;
	
	if ((argc>=2) && argv) {	
		n = atom_getlong(argv)-1;							// we start counting from 1 for sources
		if ( (n<0) || (n>=MAX_NUM_SOURCES) ) {
			error("Invalid argument(s) for source_gain");
			return;
		}
		argv++;
		f = atom_getfloat(argv);
		if (f<0.0) 
			f = 0.0;	
		x->sourceGain[n] = f;
		dbapBformatCalculate(x, n);
	}
	else
		error("Invalid argument(s) for source_gain");
}



void dbapBformatMasterGain(t_dbapBformat *x, double f)
{
	long i;
	
	x->masterGain = f;
	if (x->masterGain<0.)
		x->masterGain = 0;
	
	// Update all matrix values
	for (i=0; i<x->attrNumberOfSources; i++)
		dbapBformatCalculate(x, i);
}

void dbapBformatSourceWeight(t_dbapBformat *x, t_symbol *msg, long argc, t_atom *argv)
{
	long source, i;
	float weight;
	
	if (argc && argv) {			
		
		if (atom_gettype(argv) == A_LONG) {						// the first argument is the source number
			source = atom_getlong(argv)-1;						// we start counting from 1 for sources
		
			if ((source < 0)||(source >= x->attrNumberOfSources)) {
				object_error((t_object*)x, "sourceWeight : the source n°%d doesn't exist", source+1);
				return;
			}
		}
		else {
			object_error((t_object*)x, "sourceWeight : no source id");
			return;
		}
		
		for (i=0; i<x->attrNumberOfDestinations; i++) {				// the rest is the list of weights for each destination
			
			if (i+1 < argc) {
				if (atom_gettype(&argv[i+1]) == A_LONG)
					weight = (float)atom_getlong(&argv[i+1]);
				
				if (atom_gettype(&argv[i+1]) == A_FLOAT)
					weight = atom_getfloat(&argv[i+1]);
			}
			else
				weight = 0.0;									// if the list is smaller than the sourceWeight array, fill sourceWeight with 0.0
			
			if (weight < 0.0) 
				weight = 0.0;
			
			x->sourceWeight[source][i] = weight;
		}
		
		dbapBformatCalculate(x, source);
	}
	else
		object_error((t_object*)x, "sourceWeight : needs arguments");
}

void dbapBformatSourceMute(t_dbapBformat *x, void *msg, long argc, t_atom *argv)
{
	long n;
	
	if ((argc>=2) && argv) {	
		n = atom_getlong(argv)-1;							// we start counting from 1 for sources
		if ( (n<0) || (n>=MAX_NUM_SOURCES) ) {
			error("Invalid argument(s) for source_gain");
			return;
		}
		argv++;	
		x->sourceNotMuted[n] = (atom_getfloat(argv)==0.0);
		dbapBformatCalculate(x, n);
	}
	else
		error("Invalid argument(s) for source_gain");
}

void dbapBformatInfo(t_dbapBformat *x)
{
	t_atom		a[4];
	long i;

	atom_setfloat(&a[0], x->attrRollOff);
	object_obex_dumpout(x, psRollOff, 1, a);
	
	atom_setlong(&a[0], x->attrNumberOfSources);
	object_obex_dumpout(x, psNumberOfSources, 1, a);
	
	for (i=0; i<x->attrNumberOfSources; i++) {
		atom_setlong(&a[0], i+1);
		atom_setfloat(&a[1], x->sourcePosition[i].x);
		atom_setfloat(&a[2], x->sourcePosition[i].y);
		atom_setfloat(&a[3], x->sourcePosition[i].z);
		object_obex_dumpout(x, psSourcePosition, 4, a);
		atom_setfloat(&a[1], x->sourceGain[i]);
		object_obex_dumpout(x, psSourceGain, 2, a);
		atom_setlong(&a[1], (x->sourceNotMuted[i]==0));
		object_obex_dumpout(x, psSourceMute, 2, a);
		atom_setfloat(&a[1], x->blur[i]);
		object_obex_dumpout(x, psSourceBlur, 1, a);
	}
	
	atom_setlong(&a[0], x->attrNumberOfDestinations);
	object_obex_dumpout(x, psNumberOfDestinations, 1, a);
	
	for (i=0; i<x->attrNumberOfDestinations; i++) {
		atom_setlong(&a[0], i+1);
		atom_setfloat(&a[1], x->destinationPosition[i].x);
		atom_setfloat(&a[2], x->destinationPosition[i].y);
		atom_setfloat(&a[3], x->destinationPosition[i].z);
		object_obex_dumpout(x, psDestinationPosition, 4, a);
	}
}


// Method for Assistance Messages
void dbapBformatAssist(t_dbapBformat *x, void *b, long msg, long arg, char *dst)	// Display assistance messages
{
	if (msg==1)
	{ 
		switch(arg)
		{
			case 0: 
				strcpy(dst, "set source and speaker positions");
				break;	
		}
	}
	else if (msg==2)
	{
		switch(arg)
		{
			case 0: 
				strcpy(dst, "(list) messages for matrix~");
				break;
			case 1: 
				strcpy(dst, "dumpout");
				break;
		}
	}
}


/************************************************************************************/
// Methods bound to attributes
#pragma mark -
#pragma mark attribute accessors


// ATTRIBUTE: number of sources
t_max_err dbapBformatAttrSetNumberOfSources(t_dbapBformat *x, void *attr, long argc, t_atom *argv)
{
	long n;
	
	if (argc && argv) {	
		n = atom_getlong(argv);
		if (n<0) 
			n = 0;
		if (n>MAX_NUM_SOURCES) 
			n = MAX_NUM_SOURCES;		
		x->attrNumberOfSources = n;
		// The set of destination points has been changed - recalculate blur radius.
	}	
	return MAX_ERR_NONE;
}

// ATTRIBUTE: number of destinations
t_max_err dbapBformatAttrSetNumberOfDestinations(t_dbapBformat *x, void *attr, long argc, t_atom *argv)
{
	long n;
	
	if (argc && argv) {	
		n = atom_getlong(argv);
		if (n<0) 
			n = 0;
		if (n>MAX_NUM_DESTINATIONS)
			n = MAX_NUM_DESTINATIONS;		
		x->attrNumberOfDestinations = n;
		// The set of destination points has been changed - recalculate blur radius.
		dbapBformatCalculateVariance(x);
	}	
	return MAX_ERR_NONE;
}


// ATTRIBUTE: rolloff
t_max_err dbapBformatAttrSetRollOff(t_dbapBformat *x, void *attr, long argc, t_atom *argv)
{
	float f;
	long i;
	
	if (argc && argv) {	
		f = atom_getfloat(argv);
		if (f<=0.0) {
			error("Invalid argument for rolloff. Must be > 0");
			return MAX_ERR_NONE;;
		}	
		x->attrRollOff = f;
		dbapBformatCalculateA(x);
		// Update all matrix values
		for (i=0; i<x->attrNumberOfSources; i++)
			dbapBformatCalculate(x, i);
	}
	return MAX_ERR_NONE;
}

// ATTRIBUTE: vicinity
t_max_err dbapBformatAttrSetVicinity(t_dbapBformat *x, void *attr, long argc, t_atom *argv)
{
	float f;
	long i;
	
	if (argc && argv) {	
		f = atom_getfloat(argv);
		if (f<=0.0) {
			error("Invalid argument for vicinity. Must be > 0");
			return MAX_ERR_NONE;;
		}	
		x->attrVicinity = f;
		// Update all matrix values
		for (i=0; i<x->attrNumberOfSources; i++)
			dbapBformatCalculate(x, i);
	}
	return MAX_ERR_NONE;
}


/************************************************************************************/
// Methods bound to calculations
#pragma mark -
#pragma mark calculations


void dbapBformatCalculate(t_dbapBformat *x, long n)
{
	float scalingCoefficient;			// Scaling coefficient
	float scalingCoefficientSquareInverse;	// Inverse square of the scaling coefficient
	float dx, dy, dz;					// Distance vector
	float blurSquared;					// Bluriness ratio squared
	float distanceAdjusted
		[MAX_NUM_DESTINATIONS];			// Distance to ith speaker to the power of x->a, adjusted to prevent division by zero

	float sourceSpeakerWeight;			// Calculated weight for current pair of source and speaker
	
	long i;
	
	// Required for ambisonic decoding
	float horisontalDistance;			// Distance from source to destination in the horizontal plane
	float distance;						// Distance from source to destination in 3D
	float cosAzimuth;					// cos(azimuth)
	float sinAzimuth;					// sin(azimuth)
	float cosElevation;					// cos(elevation)
	float sinElevation;					// sin(elevation)
	float k0, k1;						// Polarity coefficients
	float d;							// Distance relative to attrVicinity
	
	t_atom a[3];						// Output array of atoms

	blurSquared = x->blur[n] * x->variance;
	blurSquared = blurSquared*blurSquared;


	
	scalingCoefficientSquareInverse = 0;
	
	for (i=0; i<x->attrNumberOfDestinations; i++) {

		// Calculations of dx and dy might seem strange, but are due to the rotation
		// of spherical vs. Cartesian coordinate systems in SpatDIF
		dx = x->destinationPosition[i].y - x->sourcePosition[n].y;
		dy = x->sourcePosition[n].x		 - x->destinationPosition[i].x;
		dz = x->destinationPosition[i].z - x->sourcePosition[n].z;

		// Absolute and horisontal distance
		horisontalDistance = sqrt(dx*dx + dy*dy);
		distance = sqrt(dx*dx + dy*dy + dz*dz);
		
		// Calculate ambisonics decoding coefficients
		if (distance<=0.0) {
			// If source is positioned at exact same location as speaker, we use only omni signal
			x->decodeCoefficients[n][i].w = sqrt(3.);
			x->decodeCoefficients[n][i].x = 0.0;
			x->decodeCoefficients[n][i].y = 0.0;
			x->decodeCoefficients[n][i].z = 0.0;
		}
		else {
			k1 = x->polarity[n];
			
			// And now we converge to omni if the source is in the vicinity of the speaker
			if (distance<x->attrVicinity) {
				d = distance/x->attrVicinity;
				d = (d*d*d*(d*(6*d-15)+10));	// This is a function that change smoothly from 1 to 0 as source approach the speaker
				k1 = k1 * (d*d*d*(d*(6*d-15)+10));

			}
			
			// Control polarity while keeping intensity constant:
			// If polarity = 1: k0=sqrt(2), k1=1 : This is standard in-phase FuMa decoding coefficients
			// If polarity = 0: k0=sqrt(3), k1=0 : Removes all directivity and decodes omni signal only
			k0 = sqrt(3.0-k1);
			
			// Get cos and sin of azimuth and elevation
			if (horisontalDistance>0.0) {
				cosAzimuth = dx/horisontalDistance;
				sinAzimuth = dy/horisontalDistance;
			}
			else {
				// Avoid dividing by zero (the following two values will be cancelled out anyway)
				cosAzimuth = 1.0;
				sinAzimuth = 0.0;
			}
			cosElevation = horisontalDistance/distance;
			sinElevation = dz/distance;

			x->decodeCoefficients[n][i].w = k0;
			x->decodeCoefficients[n][i].x = k1 * cosAzimuth * cosElevation;
			x->decodeCoefficients[n][i].y = k1 * sinAzimuth * cosElevation;
			x->decodeCoefficients[n][i].z = k1 * sinElevation;
		}
		
		// Now move on to calculations required for DBAP
		
		// Distance adjusted to prevent division by zero
		distanceAdjusted[i] = pow(double(dx*dx + dy*dy + dz*dz + blurSquared), double(0.5*x->a));
		
		scalingCoefficientSquareInverse = scalingCoefficientSquareInverse + (x->sourceWeight[n][i]*x->sourceWeight[n][i])/(distanceAdjusted[i]*distanceAdjusted[i]);
	}

	scalingCoefficient = sqrt(1./scalingCoefficientSquareInverse);
	scalingCoefficient = scalingCoefficient * x->masterGain * x->sourceGain[n] * x->sourceNotMuted[n];

	for (i=0; i<x->attrNumberOfDestinations; i++) {
		sourceSpeakerWeight = x->sourceWeight[n][i] * scalingCoefficient / distanceAdjusted[i];
		atom_setlong(&a[1], i);

		// W signal
		atom_setlong(&a[0], n*4);
		atom_setfloat(&a[2], sourceSpeakerWeight * x->decodeCoefficients[n][i].w);
		outlet_anything(x->outlet, _sym_list, 3, a);
		
		// X signal
		atom_setlong(&a[0], n*4+1);
		atom_setfloat(&a[2], sourceSpeakerWeight * x->decodeCoefficients[n][i].x);
		outlet_anything(x->outlet, _sym_list, 3, a);
		
		// Y signal
		atom_setlong(&a[0], n*4+2);
		atom_setfloat(&a[2], sourceSpeakerWeight * x->decodeCoefficients[n][i].y);
		outlet_anything(x->outlet, _sym_list, 3, a);
		
		// Z signal
		atom_setlong(&a[0], n*4+3);
		atom_setfloat(&a[2], sourceSpeakerWeight * x->decodeCoefficients[n][i].z);
		outlet_anything(x->outlet, _sym_list, 3, a);
	}
}


void dbapBformatCalculateA(t_dbapBformat *x)
{
	x->a = log(pow(10., (x->attrRollOff / 20.)))/log(2.);
}


void dbapBformatCalculateMeanDestinationPosition(t_dbapBformat *x)
{
	long i;
	float a,b,c;

	a = 0;
	b = 0;
	c = 0;
	for (i=0; i<x->attrNumberOfDestinations; i++) {
		a += x->destinationPosition[i].x;
		b += x->destinationPosition[i].y;
		c += x->destinationPosition[i].z;
	}
	x->meanDestinationPosition.x = a/x->attrNumberOfDestinations;
	x->meanDestinationPosition.y = b/x->attrNumberOfDestinations;
	x->meanDestinationPosition.z = c/x->attrNumberOfDestinations;
}


void dbapBformatCalculateVariance(t_dbapBformat *x)
{
	long i;
	float dx, dy, dz;
	float d2=0;
	

	dbapBformatCalculateMeanDestinationPosition(x);

	for (i=0; i<x->attrNumberOfDestinations; i++) {
		dx = x->destinationPosition[i].x - x->meanDestinationPosition.x;
		dy = x->destinationPosition[i].y - x->meanDestinationPosition.y;
		dz = x->destinationPosition[i].z - x->meanDestinationPosition.z;
		d2 += dx*dx + dy*dy + dz*dz;
	}		
	
	x->variance = sqrt(d2/(x->attrNumberOfDestinations-1));
	
	// Update all matrix values
	for (i=0; i<x->attrNumberOfSources; i++)
			dbapBformatCalculate(x, i);
}