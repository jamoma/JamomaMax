#ifndef _VIMIC_ENGINE_H_
#define _VIMIC_ENGINE_H_

// TODO: clean up these parameter lists
#include "Properties.h"
#include "CrossFadeQueue.h"

class Mic; 
class Mirror;
class Source;

void vimic_mirrors(double *sensi, double *delay, Mic *mic, Mirror *mirror, Source *source, double Speedofsound, int NumOfRefl, Properties::AudioProcess mode, double *oldDelay, double *reflGains, CrossFadeQueue *fades, double Polarity, int distModel);
void vimic_sensitivity(double *sensi, double *del, Mic *mic, Mirror *mirror, Source *source, double Speedofsound, Properties::AudioProcess mode, double *oldDelay, double *reflGains, CrossFadeQueue *fades, int n, double Polarity, int distModel);
void vimic_normalizeSensi(double *sensi, double max);
void vimic_floorSensi(double *sensi, double min);
double vimic_invSqrtSumSensi(double *sensi, long size);
double vimic_findMinDelayValue(double *delay, long size); 
void vimic_minimizeDelay(double *delay, double minValue);

#endif
// vim:sw=4:et:cindent:
