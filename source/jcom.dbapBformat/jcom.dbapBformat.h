/** @file
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


// This is currently restricted if memory for struct is to be assigned using malloc
const long MAX_NUM_SOURCES = 32;
const long MAX_NUM_DESTINATIONS = 32;


t_symbol		*psRollOff,
				*psNumberOfSources,
				*psNumberOfDestinations,
				*psDestinationPosition,
				*psSourcePosition,
				*psSourceGain,
				*psSourceMute,
				*psSourceBlur;


/** Data structure for storing a 1,2 or 3 dimensional space data 
 @ingroup typedefs
 */
typedef struct _xyz{
	float		x;												///< x position
	float		y;												///< y position
	float		z;												///< z position
} t_xyz;														///< Cartesian coordinate of a point


/** Data structure for storing ambisonics decoding coeficients 
 @ingroup typedefs
 */
typedef struct _decodeCoefficients{
	float		w;												///< Zero  order W coefficient
	float		x;												///< First order X coefficient
	float		y;												///< First order Y coefficient
	float		z;												///< First order Z coefficient
} t_decodeCoefficients;

/** Structure for the jcom.dbapBformat Max object.
 @ingroup typedefs
 */
typedef struct _dbapBformat{									///< Data structure for this object
	// Max stuff
	t_object	ob;												///< Must always be the first field; used by Max
	void		*outlet;										////< Pointer to outlets. Need one for each outlet

	// Sources
	long		attrNumberOfSources;							///< number of active sources
	t_xyz		sourcePosition[MAX_NUM_SOURCES];				///< Positions of the virtual source
	float		blur[MAX_NUM_SOURCES];							///< Spatial bluriness ratio in percents for each source
	float		polarity[MAX_NUM_SOURCES];						///< Polarity for each source, from 0 (omni) to 1 (in-phase) decoding
	float		sourceGain[MAX_NUM_SOURCES];					///< Linear gain for each source, not yet used
	float		sourceNotMuted[MAX_NUM_SOURCES];				///< Mute and unmute sources

	float		sourceWeight
					[MAX_NUM_SOURCES]
					[MAX_NUM_DESTINATIONS];						///< Weight for each source for each destination 
	t_decodeCoefficients 
				decodeCoefficients
					[MAX_NUM_SOURCES]
					[MAX_NUM_DESTINATIONS];						///< Ambisonics decoding coefficients for each source for each destination
	
	// Destinations
	long		attrNumberOfDestinations;						///< Number of active destinations
	t_xyz		destinationPosition[MAX_NUM_DESTINATIONS];		///< Array of speaker positions
	t_xyz		meanDestinationPosition;						///< Mean position of the field of destination points
	
	// Globals
	float		masterGain;										///< Mater gain for all of the algorithm
	float		variance;										///< Bias-corrected variance of distance from destination points to mean destination point	
	float		attrRollOff;									///< Set rolloff with distance in dB
	float		attrVicinity;									///< Set radius of field of vicinity around speaker where decoding gets increasingly omni
	float		a;												///< Constant: Exponent controlling amplitude dependance on distance. Depends on attrRollOff
	} t_dbapBformat;


// Prototypes for methods: need a method for each incoming message

void *dbapBformatNew(t_symbol *msg, long argc, t_atom *argv);
t_max_err dbapBformat_setstep(t_dbapBformat *x, void *attr, long argc, t_atom *argv);

/** Set spatial blur for nth source. */
void dbapBformatBlur(t_dbapBformat *x, t_symbol *msg, long argc, t_atom *argv);

/** Set spatial blur for all sources. */
void dbapBformatBlurAll(t_dbapBformat *x, double f);

/** Set polarity of the nth virtual source */
void dbapBformatPolarity(t_dbapBformat *x, t_symbol *msg, long argc, t_atom *argv);

/** Set polarity for all sources */
void dbapBformatPolarityAll(t_dbapBformat *x, double f);

/** Set radius of vicinity field around speaker where decoding will converge towards omni */
t_max_err dbapBformatAttrSetVicinity(t_dbapBformat *x, void *attr, long argc, t_atom *argv);

/** Set the position of the nth virtual source. */
void dbapBformatSource(t_dbapBformat *x, void *msg, long argc, t_atom *argv);

/** Set the position of the nth speaker. */
void dbapBformatDestination(t_dbapBformat *x, void *msg, long argc, t_atom *argv);

/** Set input gain for nth source. */
void dbapBformatSourceGain(t_dbapBformat *x, void *msg, long argc, t_atom *argv);

/** Set master gain for all values passed from the object to matrix~. */
void dbapBformatMasterGain(t_dbapBformat *x, double f);

/** Set weight for nth source by passing a list to balance each destination. */
void dbapBformatSourceWeight(t_dbapBformat *x, t_symbol *msg, long argc, t_atom *argv);

/** Mute and unmute sources */
void dbapBformatSourceMute(t_dbapBformat *x, void *msg, long argc, t_atom *argv);

/** Get info on destination setup ++ */
void dbapBformatInfo(t_dbapBformat *x);

/** Display assist strings while patching. */
void dbapBformatAssist(t_dbapBformat *x, void *b, long msg, long arg, char *dst);

/** Set the number of sources of the system. */
t_max_err dbapBformatAttrSetNumberOfSources(t_dbapBformat *x, void *attr, long argc, t_atom *argv);

/** Set the number of destinations of the system. */
t_max_err dbapBformatAttrSetNumberOfDestinations(t_dbapBformat *x, void *attr, long argc, t_atom *argv);

/** Set spatial blur coefficient */
t_max_err dbapBformatAttrSetBlur(t_dbapBformat *x, void *attr, long argc, t_atom *argv);

/** Set rolloff in dB */
t_max_err dbapBformatAttrSetRollOff(t_dbapBformat *x, void *attr, long argc, t_atom *argv);

/** Calculation of exponent coefficient based on rolloff */
void dbapBformatCalculateA(t_dbapBformat *x);

/** General method for calculation of matrix coefficient for nth source. */
void dbapBformatCalculate(t_dbapBformat *x, long n);

/** Calculate mean position of the destination points. */
void dbapBformatCalculateMeanDestinationPosition(t_dbapBformat *x);

/** Calculate bias-corrected variance of distance from destination points to mean destination point. */
void dbapBformatCalculateVariance(t_dbapBformat *x);

/** Calculate the view (2D-matrix) */
void dbapBformatCalculateView(t_dbapBformat *x, long dst, long src);

/** If the attrViewMatrixUpdate is true : calculate the last view */
void dbapBformatUpdateView(t_dbapBformat *x);

/** Calculate the view (2D-matrix) : 1D */
void dbapBformatCalculateView1D(t_dbapBformat *x, long dst, long src);

/** Calculate the view (2D-matrix) : 2D */
void dbapBformatCalculateView2D(t_dbapBformat *x, long dst, long src);

/** Calculate the view (2D-matrix) : 3D */
void dbapBformatCalculateView3D(t_dbapBformat *x, long dst, long src);

/** Output the calculated view */
void dbapBformatOutputView(t_dbapBformat *x);