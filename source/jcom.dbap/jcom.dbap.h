/** @file
 * @ingroup modularMax
 *
 * @brief External for Jamoma: jcom.dbap - Distance Based Amplitude Panning
 *
 * @details
 *
 * @authors Trond Lossius, Tim Place, Théo de la Hogue
 *
 * @copyright Copyright © 2009, Trond Lossius @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */

#include "jit.common.h"
#include "hull2D.h"

// This seems to be the current restrictions of matrix~
const long MAX_NUM_SOURCES = 250;
const long MAX_NUM_DESTINATIONS = 500;

const long MAX_NUM_WEIGHTED_SOURCES = 64;
const long MAX_NUM_WEIGHTED_DESTINATIONS = 32;

const long MAX_SIZE_VIEW_X = 80;
const long MAX_SIZE_VIEW_Y = 60;

t_symbol		*ps_rollloff,
				*ps_dimensions,
				*ps_rolloff,
				*ps_num_sources,
				*ps_num_destinations,
				*ps_dst_position,
				*ps_src_position,
				*ps_src_gain,
				*ps_src_mute,
				*ps_src_blur;

/** Data structure for storing a 1,2 or 3 dimensional space data */
typedef struct _xyz{
	float		x;										///< x position
	float		y;										///< y position
	float		z;										///< z position
} t_xyz;												///< Cartesian coordinate of a point

/** Data structure for 1 dimensional convex hull */
typedef struct _hull1{
	float		min;									///< minimum x value
	float		max;									///< maximum x value
} t_hull1;												///< Convex hull in 1 dimension

/** Data structure for 2 dimensional convex hull */
typedef struct _hull2{
	long		num_dst;								///< number dst in the convex hull
	long		id_dst[MAX_NUM_DESTINATIONS];			///< index of dst in dst_position[]
	float		dst2next[MAX_NUM_DESTINATIONS];			///< squared length of each border of the hull
} t_hull2;												///< Convex hull in 2 dimensions
	
typedef struct _dbap{									///< Data structure for this object 
	t_object	ob;										///< Must always be the first field; used by Max
	t_xyz		src_position[MAX_NUM_SOURCES];			///< Positions of the virtual source
	float		blur[MAX_NUM_SOURCES];					///< Spatial bluriness ratio in percents for each source
	float		src_gain[MAX_NUM_SOURCES];				///< Linear gain for each source, not yet used
	float		src_weight[MAX_NUM_WEIGHTED_SOURCES][MAX_NUM_WEIGHTED_DESTINATIONS];///< Weight for each source for each destination 
	float		src_not_muted[MAX_NUM_SOURCES];			///< Mute and unmute sources
	float		master_gain;							///< Mater gain for all of the algorithm
	t_xyz		dst_position[MAX_NUM_DESTINATIONS];		///< Array of speaker positions
	t_xyz		mean_dst_position;						///< Mean position of the field of destination points
	bool		hull_io;								///< On/off calculation of distances to hull
	t_hull1		hull1;									///< Convex hull in 1 dimension
	t_hull2		hull2;									///< Convex hull in 2 dimensions
	float		variance;								///< Bias-corrected variance of distance from destination points to mean destination point
	long		attr_dimensions;						///< Number of dimensions of the speaker and source system
	float		attr_rolloff;							///< Set rolloff with distance in dB.
	long		attr_num_sources;						///< number of active sources
	long		attr_num_destinations;					///< number of active destinations

	void		*view_matrix;							///< a jitter matrix to handle the view
	t_symbol	*view_name;								///< a unique name for the jitter matrix
	t_jit_matrix_info view_info;						///< a data structure to handle the jitter matrix properties
	t_xyz		attr_view_start;						///< coordinate of the start point of the view
	t_xyz		attr_view_end;							///< coordinate of the end point of the view
	bool		attr_view_update;						///< IO the view updating
	t_atom		last_view[2];							///< memorize the last view [dst src]
	
	float		a;										///< Constant: Exponent controlling amplitude dependance on distance. Depends on attr_rolloff
	void		*outlet[3];								////< Pointer to outlets. Need one for each outlet
} t_dbap;

// Prototypes for methods: need a method for each incoming message

void *dbap_new(t_symbol *msg, long argc, t_atom *argv);
t_max_err dbap_setstep(t_dbap *x, void *attr, long argc, t_atom *argv);

void dbap_free(t_dbap *x);

/** Set spatial blur for nth source. */
void dbap_blur(t_dbap *x, t_symbol *msg, long argc, t_atom *argv);

/** Set spatial blur for all sources. */
void dbap_blurall(t_dbap *x, double f);

/** Set the position of the nth virtual source. */
void dbap_source(t_dbap *x, void *msg, long argc, t_atom *argv);

/** Set the position of the nth speaker. */
void dbap_destination(t_dbap *x, void *msg, long argc, t_atom *argv);

/** Set input gain for nth source. */
void dbap_sourcegain(t_dbap *x, void *msg, long argc, t_atom *argv);

/** Set master gain for all values passed from the object to matrix~. */
void dbap_mastergain(t_dbap *x, double f);

/** Set weight for nth source by passing a list to balance each destination. */
void dbap_sourceweight(t_dbap *x, t_symbol *msg, long argc, t_atom *argv);

/** Mute and unmute sources */
void dbap_sourcemute(t_dbap *x, void *msg, long argc, t_atom *argv);

/** Turn on/off the calculation of distance to hull */
void dbap_hull(t_dbap *x, long f);

/** Display a hitmap view of the dbap for a destination and a source weight config or all (on the info outlet ?) */
void dbap_view(t_dbap *x, void *msg, long argc, t_atom *argv);

/** Turn on/off the auto view updating */
void dbap_view_update(t_dbap *x, long io);

/** Set the size of hitmap view window */
void dbap_view_size(t_dbap *x, long sizeX, long sizeY);

/** Set the start point of the hitmap view window */
void dbap_view_start(t_dbap *x, void *msg, long argc, t_atom *argv);

/** Set the end point of the hitmap view window */
void dbap_view_end(t_dbap *x, void *msg, long argc, t_atom *argv);

/** Get info on destination setup ++ */
void dbap_info(t_dbap *x);

/** Display assist strings while patching. */
void dbap_assist(t_dbap *x, void *b, long msg, long arg, char *dst);

/** Set number of dimensions of the system. */
t_max_err dbap_attr_setdimensions(t_dbap *x, void *attr, long argc, t_atom *argv);

/** Set the number of sources of the system. */
t_max_err dbap_attr_setnum_sources(t_dbap *x, void *attr, long argc, t_atom *argv);

/** Set the number of destinations of the system. */
t_max_err dbap_attr_setnum_destinations(t_dbap *x, void *attr, long argc, t_atom *argv);

/** Set spatial blur coefficient */
t_max_err dbap_attr_setblur(t_dbap *x, void *attr, long argc, t_atom *argv);

/** Set rolloff in dB */
t_max_err dbap_attr_setrolloff(t_dbap *x, void *attr, long argc, t_atom *argv);

/** Calculation of exponent coefficient based on rolloff */
void dbap_calculate_a(t_dbap *x);

/** General method for calculation of matrix coefficient for nth source. */
void dbap_calculate(t_dbap *x, long n);

/** Calculate matrix coefficients for nth source: 1D space. */
void dbap_calculate1D(t_dbap *x, long n);

/** Calculate matrix coefficients for nth source: 2D space. */
void dbap_calculate2D(t_dbap *x, long n);

/** Calculate matrix coefficients for nth source: 3D space. */
void dbap_calculate3D(t_dbap *x, long n);

/** Calculate mean position of the destination points. */
void dbap_calculate_mean_dst_position(t_dbap *x);

/** Calculate bias-corrected variance of distance from destination points to mean destination point. */
void dbap_calculate_variance(t_dbap *x);

/** Calculate convex hull of space spanned by destination points. */ 
void dbap_calculate_hull(t_dbap *x, long n);

/** Calculate convex hull of space spanned by destination points: 1D */
void dbap_calculate_hull1D(t_dbap *x, long n);

/** Calculate convex hull of space spanned by destination points: 2D */
void dbap_calculate_hull2D(t_dbap *x, long n);
void dbap_hull2_postpoint(t_dbap *x, t_H2D h2); // debug

/** Calculate convex hull of space spanned by destination points: 3D */
void dbap_calculate_hull3D(t_dbap *x, long n);

/** Calculate the view (2D-matrix) */
void dbap_calculate_view(t_dbap *x, long dst, long src);

/** If the attr_view_update is true : calculate the last view */
void dbap_update_view(t_dbap *x);

/** Calculate the view (2D-matrix) : 1D */
void dbap_calculate_view1D(t_dbap *x, long dst, long src);

/** Calculate the view (2D-matrix) : 2D */
void dbap_calculate_view2D(t_dbap *x, long dst, long src);

/** Calculate the view (2D-matrix) : 3D */
void dbap_calculate_view3D(t_dbap *x, long dst, long src);

/** Output the calculated view */
void dbap_output_view(t_dbap *x);