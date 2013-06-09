// File with global constants used for entire simulation

#ifndef _PROPERTIES_H_
#define _PROPERTIES_H_

#include "ext.h"
#include "TTBase.h"

#define IEM_NAN(f) (f != f)

namespace Properties {
enum dimIndex {WIDTH, DEPTH, HEIGHT, ALL};
enum fadeMode {COS, COS_SQUARED, LINEAR, TANH, SQRT, LOG, SIGMOID};
enum wallName {AIR = 0, LEFT, RIGHT, FRONT, REAR, FLOOR, CEILING, LEFT_FRONT, RIGHT_FRONT, LEFT_REAR, 
    RIGHT_REAR, LEFT_FLOOR, RIGHT_FLOOR, LEFT_CEILING, RIGHT_CEILING, FRONT_FLOOR, REAR_FLOOR, FRONT_CEILING, REAR_CEILING};
enum reflectionOrder {DIRECT = 0, FIRST, SECOND}; 
static const int REFLECTIONORDER = 3;
static const int NUMWALLS = 6;
// static const int FILTER_MAP[REFLECTIONORDER * NUMWALLS] = {0, 0, 1, 2, 3, 4, 5, 6, 7, 6, 7, 6, 7, 6, 7, 8, 9, 8, 9};
enum AudioProcess {NONE, VIMIC_LITE, AMP_PAN, X_FADE_LITE, X_FADE_XL, VIMIC_XL, STATIC};
static const int MAXNUMCHANNELS = 144;
static const double SAMPLERATE = 44100.0; // should that be here? we have x->s_sr !
static const double MAX_ROOM_DIM = 40.0;
static const int NUMSOURCES = 1;
static const int DELAYSIZE = 12288;// 3 * 4096 blocksize   was 12160; //190 * BLOCKSIZE(64); // 12160 samples
static const int DELAYBYTES = 2 * DELAYSIZE;
static const double RAD2DEG = 180.0 / kTTPi;
static const double ONE_OVER_360 = 1.0 / 360.0; 
static const int REFLECTIONS_PER_REFLECTION_ORDER[]  = {1, 7, 19, 5};
static const int FADE_TABLE_SIZE = 3201;
}

#endif
