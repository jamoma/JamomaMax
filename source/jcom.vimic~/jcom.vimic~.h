//jcom.vimic.h
#ifndef _JCOM_VIMIC_H_
#define _JCOM_VIMIC_H_

#include "Properties.h"
#include <ext.h>
#include <z_dsp.h>

#define _USE_MATH_DEFINES
#include <math.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "TTDSP.h"					// TTBlue Interfaces...

#define t_floatarg double

#define	streq(a,b)			(strcmp(a,b)==0)

class Mirror;
class Mic;
class Room;
class CrossFadeQueue;


typedef struct _vimic {
    t_pxobject	x_obj;
    //TTAudioSignalPtr audioIn;
    //TTAudioSignalPtr audioOut;
    double  x_sr; 
    int		grainCounter;
    int		numOfChannels;
    double	reflGains[Properties::REFLECTIONORDER];
    bool	reflGainFlag;
    int		numOfSources;
    int		maxReflOrder;
	int		distModel;
    int		maxDynRefl;
    int		numRefl;
    int		reflOrder;
    int		blocksize;
    int		renderInterval;
    double	grainsize;
	double	micPolarity;
    CrossFadeQueue  *fades;
    int		c_phase;
    enum	Properties::AudioProcess AudioProcType;
    double	temperature;
    double	speedOfSound;
    double	invSpeedOfSound;
    int		bufSz;
    double	*delay;
    double	*c_vec;
    bool	normalizeSensiFlag;
	bool	minimumDelayFlag;
    bool	minSensiFlag;
    double	minSensi;
    double	*sensitivity;
    double	*currentSensitivity;
    double	*currentDelay;
    double	*delGrain;
    double	*sensiGrain;
    int	    reportFlag;
    int		directBang;
    Room	*room;
} t_vimic;

//static void *vimic_class = NULL;	 // TM: added static keyword to get it to link,
static t_class *vimic_class; // changed [NP]	

//int	main();	// declaring this proto causes linker errors with MSVC [TAP]
void*	vimic_new(t_symbol *s, int argc, t_atom *argv);
void	vimic_free(t_vimic *x);
void	vimic_dsp(t_vimic *x, t_signal **p, short *count);		
void	vimic_dsp64(t_vimic *x, t_object *dsp64, short *count, double samplerate, long maxvectorsize, long flags); // DSP64 Method
void	vimic_bang(t_vimic *x);
void    vimic_sourcePosAbs(t_vimic *x, t_symbol *s, short argc, t_atom *argv);
void    vimic_sourcePos(t_vimic *x,t_symbol *s, short argc, t_atom *argv);
void    vimic_reflGain(t_vimic *x, t_symbol *s, short argc, t_atom *argv);
void    vimic_micPos(t_vimic *x, t_symbol *s, short argc, t_atom *argv);
void    vimic_roomSize(t_vimic *x, t_symbol *s, short argc, t_atom *argv);
void    vimic_disPow(t_vimic *x, t_symbol *s, short argc, t_atom *argv);
void    vimic_dirPow(t_vimic *x, t_symbol *s, short argc, t_atom *argv);
void    vimic_dbUnit(t_vimic *x, t_symbol *s, short argc, t_atom *argv);
void    vimic_micAngle(t_vimic *x, t_symbol *s, short argc, t_atom *argv);
void    vimic_micDirectivity(t_vimic *x, t_symbol *s, short argc, t_atom *argv);
void    vimic_micGain(t_vimic *x, t_symbol *s, short argc, t_atom *argv);
void	vimic_temperature(t_vimic *x, double n); 
void	vimic_minSensi(t_vimic *x, double n);
void	vimic_directBang(t_vimic *x, long n); 
void	vimic_micPolarity(t_vimic *x, long n); 
void	vimic_distModel(t_vimic *x, long n);
void	vimic_renderType(t_vimic *x, long n);
void	vimic_report(t_vimic *x, long n);
void	vimic_sourceYaw(t_vimic *x, long n);
void	vimic_sourceDirectivityFlag(t_vimic *x, long n);
void	vimic_normalizeSensiFlag(t_vimic *x, long n);
void	vimic_minimumDelayFlag(t_vimic *x, long n);
void	vimic_minSensiFlag(t_vimic *x, long n);
void	vimic_airfilter(t_vimic *x, long n);
void	vimic_xFadeLength(t_vimic *x, long n);
void	vimic_xFadeFunction(t_vimic *x, long n);
void	vimic_xFadeThreshold(t_vimic *x, long n);
void	vimic_renderintervall(t_vimic *x, long n);
void	vimic_getDirTable(t_vimic *x,  t_symbol *s);
void	vimic_highCf(t_vimic *x, long n, long freq);
void	vimic_lowCf(t_vimic *x, long n, long freq);
void	vimic_lowAbsorption(t_vimic *x, t_symbol *s, short argc, t_atom *argv);
void	vimic_midAbsorption(t_vimic *x, t_symbol *s, short argc, t_atom *argv);
void	vimic_highAbsorption(t_vimic *x, t_symbol *s, short argc, t_atom *argv);
void	vimic_wallFilter(t_vimic *x, t_symbol *s, short argc, t_atom *argv);
void	vimic_reportAll(t_vimic *x);
void	vimic_warnings(t_vimic *x, long n);
void    vimic_assist(t_vimic *x, Object *b, long msg, long arg, char *s);
void	vimic_anything(t_vimic *x, t_symbol *message, short argc, t_atom *argv);
t_int*	vimic_perform(t_int *w);


#endif // _JCOM_VIMIC_H_
// vim:sw=4:et:cindent:
