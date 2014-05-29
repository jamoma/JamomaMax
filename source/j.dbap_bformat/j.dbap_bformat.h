/** @file
 * @ingroup implementationMaxExternals
 *
 * @brief j.dbap_bformat - Distance Based Amplitude Panning using 4-channel ambisonic Bformat signals as sources.
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
const long MAX_NUM_SOURCES = 16;
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
	double		x;												///< x position
	double		y;												///< y position
	double		z;												///< z position
} t_xyz;														///< Cartesian coordinate of a point


/** Data structure for storing ambisonics decoding coeficients 
 @ingroup typedefs
 */
typedef struct _decodeCoefficients{
	double		w;												///< Zero  order W coefficient
	double		x;												///< First order X coefficient
	double		y;												///< First order Y coefficient
	double		z;												///< First order Z coefficient
} t_decodeCoefficients;

/** Structure for the j.dbap_bformat Max object.
 @ingroup typedefs
 */
typedef struct _dbap_bformat{									///< Data structure for this object
	// Max stuff
	t_object	ob;												///< Must always be the first field; used by Max
	void		*outlet;										////< Pointer to outlets. Need one for each outlet

	// Sources
	long		attrNumberOfSources;							///< number of active sources
	t_xyz		sourcePosition[MAX_NUM_SOURCES];				///< Positions of the virtual source
	double		blur[MAX_NUM_SOURCES];							///< Spatial bluriness ratio in percents for each source
	double		polarity[MAX_NUM_SOURCES];						///< Polarity for each source, from 0 (omni) to 1 (in-phase) decoding
	double		sourceGain[MAX_NUM_SOURCES];					///< Linear gain for each source, not yet used
	double		sourceNotMuted[MAX_NUM_SOURCES];				///< Mute and unmute sources

	double		sourceWeight
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
	double		masterGain;										///< Mater gain for all of the algorithm
	double		variance;										///< Bias-corrected variance of distance from destination points to mean destination point
	double		attrRollOff;									///< Set rolloff with distance in dB
	double		attrVicinity;									///< Set radius of field of vicinity around speaker where decoding gets increasingly omni
	double		a;												///< Constant: Exponent controlling amplitude dependance on distance. Depends on attrRollOff
	} t_dbap_bformat;


// Prototypes for methods: need a method for each incoming message

void *dbap_bformatNew(t_symbol *msg, long argc, t_atom *argv);
t_max_err dbap_bformat_setstep(t_dbap_bformat *x, void *attr, long argc, t_atom *argv);

/** Set spatial blur for nth source. */
void dbap_bformatBlur(t_dbap_bformat *x, t_symbol *msg, long argc, t_atom *argv);

/** Set spatial blur for all sources. */
void dbap_bformatBlurAll(t_dbap_bformat *x, double f);

/** Set polarity of the nth virtual source */
void dbap_bformatPolarity(t_dbap_bformat *x, t_symbol *msg, long argc, t_atom *argv);

/** Set polarity for all sources */
void dbap_bformatPolarityAll(t_dbap_bformat *x, double f);

/** Set radius of vicinity field around speaker where decoding will converge towards omni */
t_max_err dbap_bformatAttrSetVicinity(t_dbap_bformat *x, void *attr, long argc, t_atom *argv);

/** Set the position of the nth virtual source. */
void dbap_bformatSource(t_dbap_bformat *x, void *msg, long argc, t_atom *argv);

/** Set the position of the nth speaker. */
void dbap_bformatDestination(t_dbap_bformat *x, void *msg, long argc, t_atom *argv);

/** Set input gain for nth source. */
void dbap_bformatSourceGain(t_dbap_bformat *x, void *msg, long argc, t_atom *argv);

/** Set master gain for all values passed from the object to matrix~. */
void dbap_bformatMasterGain(t_dbap_bformat *x, double f);

/** Set weight for nth source by passing a list to balance each destination. */
void dbap_bformatSourceWeight(t_dbap_bformat *x, t_symbol *msg, long argc, t_atom *argv);

/** Mute and unmute sources */
void dbap_bformatSourceMute(t_dbap_bformat *x, void *msg, long argc, t_atom *argv);

/** Get info on destination setup ++ */
void dbap_bformatInfo(t_dbap_bformat *x);

/** Display assist strings while patching. */
void dbap_bformatAssist(t_dbap_bformat *x, void *b, long msg, long arg, char *dst);

/** Set the number of sources of the system. */
t_max_err dbap_bformatAttrSetNumberOfSources(t_dbap_bformat *x, void *attr, long argc, t_atom *argv);

/** Set the number of destinations of the system. */
t_max_err dbap_bformatAttrSetNumberOfDestinations(t_dbap_bformat *x, void *attr, long argc, t_atom *argv);

/** Set spatial blur coefficient */
t_max_err dbap_bformatAttrSetBlur(t_dbap_bformat *x, void *attr, long argc, t_atom *argv);

/** Set rolloff in dB */
t_max_err dbap_bformatAttrSetRollOff(t_dbap_bformat *x, void *attr, long argc, t_atom *argv);

/** Calculation of exponent coefficient based on rolloff */
void dbap_bformatCalculateA(t_dbap_bformat *x);

/** General method for calculation of matrix coefficient for nth source. */
void dbap_bformatCalculate(t_dbap_bformat *x, long n);

/** Calculate mean position of the destination points. */
void dbap_bformatCalculateMeanDestinationPosition(t_dbap_bformat *x);

/** Calculate bias-corrected variance of distance from destination points to mean destination point. */
void dbap_bformatCalculateVariance(t_dbap_bformat *x);

/** Calculate the view (2D-matrix) */
void dbap_bformatCalculateView(t_dbap_bformat *x, long dst, long src);

/** If the attrViewMatrixUpdate is true : calculate the last view */
void dbap_bformatUpdateView(t_dbap_bformat *x);

/** Calculate the view (2D-matrix) : 1D */
void dbap_bformatCalculateView1D(t_dbap_bformat *x, long dst, long src);

/** Calculate the view (2D-matrix) : 2D */
void dbap_bformatCalculateView2D(t_dbap_bformat *x, long dst, long src);

/** Calculate the view (2D-matrix) : 3D */
void dbap_bformatCalculateView3D(t_dbap_bformat *x, long dst, long src);

/** Output the calculated view */
void dbap_bformatOutputView(t_dbap_bformat *x);