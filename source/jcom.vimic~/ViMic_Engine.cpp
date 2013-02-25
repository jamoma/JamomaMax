// ViMic_Engine.c 
// Handles sensitivity calculations

#include <cmath>
#include "ViMic_Engine.h"
#include "CrossFadeQueue.h"
#include "Properties.h"
#include "Mirror.h"
#include "Mic.h"
#include "Source.h"
#include "TTDSP.h"

extern bool globWarningFlag;
extern bool globReportFlag;

void vimic_mirrors(double *sensi, 
                      double *delay, 
                      Mic *mic, 
                      Mirror *mirror, 
                      Source *source, 
                      double invSpeedofsound, 
                      int NumOfRefl, 
                      Properties::AudioProcess mode, 
                      double *oldDelay, 
                      double *reflGains, 
                      CrossFadeQueue *fades, 
                      double Polarity, 
                      int distModel) 
{
    int n;
    for(n = 0; n < NumOfRefl; n++)		
        vimic_sensitivity(sensi + n, delay + n, mic, mirror + n, source, invSpeedofsound, mode, oldDelay, reflGains, fades, n, Polarity, distModel);
}

void vimic_sensitivity(double *sensi, double *del, Mic *mic, Mirror *mirror, Source *source, double One_over_Speedofsound, Properties::AudioProcess mode, double *oldDelay, double *reflGains, CrossFadeQueue *fades, int reflNum, double Polarity, int distModel)
{
    int order = mirror->order();
    if (mic->gain() != 0.0 || reflGains[order] != 0.0)			// should be || for correct updating
    {
        double orient[3];
        double distance;//, invDistance;
        double newDel = 0.0;
        double newSensi = 0.0;
        double cosAng;
        double tempcos;
		int radiationAngle;

        orient[0] = mirror->xPos() - mic->xPos();
        orient[1] = mirror->yPos() - mic->yPos();
        orient[2] = mirror->zPos() - mic->zPos();
        distance = sqrt((orient[0] * orient[0]) + (orient[1] * orient[1]) + (orient[2] * orient[2]));
		TTLimitMin(distance, 0.1);
		
        tempcos = cos(mic->ele());
        cosAng = (orient[0] * sin(mic->azi()) * tempcos + orient[1] * cos(mic->azi()) * tempcos + orient[2] * sin(mic->ele())) / distance;
		TTLimit(cosAng, -1.0, 1.0); // MAKING SURE IT'S NOT A NaN

		newSensi =  pow((mic->dirGainA() + (mic->dirGainB() * cosAng)), mic->dirPow());
        
		if (distModel == 1){
			newSensi *= pow(distance, mic->distPow()); // inverse proportional decrease
        } else { //if (distModel == 2)
			//exponential decrease
			newSensi *= pow(10.0,(distance* mic->dbUnit())); 
        }  

        // Source Directivity ... frequency independent...so far
		
        if (source->directivityFlag()) {
            switch(reflNum) 
            {
                case 0: //DIRECT SOUND
                    radiationAngle = atan2(orient[0], orient[1]) * Properties::RAD2DEG + 180.5 - source->aziAngle(); 	
                    radiationAngle = radiationAngle - 360 * (int) floor(radiationAngle * Properties::ONE_OVER_360); // modulo operation, to keep the angle between 0..359 degree
                    newSensi *= (double) source->directivityAt(radiationAngle);
                    if (globReportFlag)
                        post ("Direct Sound: radiationAngle: %d", radiationAngle); 
                    break;
                case 1: //left wall
                case 2: //right wall 
                    radiationAngle = 180.5 - (atan2(orient[0], orient[1]) * Properties::RAD2DEG)  - source->aziAngle();
                    radiationAngle = radiationAngle - 360 * (int) floor(radiationAngle * Properties::ONE_OVER_360); // modulo operation, to keep the angle between 0..359 degree 
                    newSensi *= (double) source->directivityAt(radiationAngle);
                    if (globReportFlag)
                        post ("radiationAngle for Refl. %d : %d",reflNum, radiationAngle); 
                    break;

                case 3://front wall
                case 4://back wall
                    radiationAngle = 360.5 - (atan2(orient[0], orient[1]) * Properties::RAD2DEG)  - source->aziAngle();
                    radiationAngle = radiationAngle - 360 * (int) floor(radiationAngle * Properties::ONE_OVER_360); // modulo operation, to keep the angle between 0..359 degree 
                    newSensi *= (double) source->directivityAt(radiationAngle);
                    if (globReportFlag)
                        post ("radiationAngle for Refl. %d : %d",reflNum, radiationAngle); 
                    break;

                default:	//for simplification we treat all other walls in the same way	
                    newSensi *= (double) source->directivityAt(360); //the 360th entry of the directivity-table contains the mean directivity value
                    //if (globReportFlag)
                    //		post ("mean directivity gain: %f", sourceDirectivity); 
                    break;
            }             
        }

        newSensi *= mic->gain();		
        newSensi *= reflGains[order];
		
#ifndef __INTEL_COMPILER // with icc, we use the flushtozero flag which takes care of that
		TTZeroDenormal(newSensi);
#endif
		TTLimit(newSensi, Polarity, 1.0);
		
        /*if(newSensi > 1.0)
        {
            if (globWarningFlag)
                post("Sensitivity %f capped at 1.0", newSensi);
            newSensi = 1.0;  	// clip to maximum gain 
        }
        else if (newSensi < Polarity)//-1.0) //TODO: option restrict polarity, if (newSensi < 0).... newSensi = 0;
        {
            if (globWarningFlag)
                post("Sensitivity %f capped at %f", newSensi, Polarity);
            newSensi = Polarity;//-1.0;	// clip to minimum gain
        }
        else if (IEM_NAN(newSensi)) // if it's NAN 
        {
            newSensi = 0.0;
            if (globWarningFlag)
                error("Sensitivity caused a NaN!");
        }*/
#if 0
        else if (newSensi != 0.0 && IEM_DENORMAL(newSensi)) // if it's denormal
        {
            if (globWarningFlag)
                error("Sensitivity caused a denormal, equal to %f", newSensi);
            //	newSensi = 0.0;
        }
#endif

        // only update if we're not in xfade more, or if we are, the fade is either inactive or at the start
        // we don't want a moving target!
        if (!(mode == Properties::X_FADE_LITE || mode == Properties::X_FADE_XL) || !fades->isActive() || fades->atStart())
            *sensi = newSensi;

        newDel = distance * One_over_Speedofsound; 	
		TTLimit(newDel, 0.0, double(Properties::DELAYSIZE));   // check for abnormal values
		
        /*if (newDel >= Properties::DELAYSIZE)	// cap max delay time
        {
            newDel = Properties::DELAYSIZE;
            if (globWarningFlag)
                post("Delay time capped at %f", newDel);
        }*/

        // only update delay time if it's >= 0, and we're not in crossfade more, or if we are, we are not in the middle of a crossfade

        if (newDel != *del)
        {
            if (newDel >= 0.0 && (!(mode == Properties::X_FADE_LITE || mode == Properties::X_FADE_XL) || (!fades->isActive() || fades->atStart())))
                *del = newDel;
            else if (newDel < 0.0)
                post("new Delay less than 0: %f", newDel);

            if (/*order == DIRECT &&*/ (abs(*del - *oldDelay) > fades->fadeThreshold() 
                        && (mode == Properties::X_FADE_LITE || mode == Properties::X_FADE_XL)))		
            {
                if (fades->startFade() && globReportFlag)
                    post("new del: %f, old del: %f", *del, *oldDelay);
            }
        }
    }
    else
        *sensi = 0.0;
}

// returns inverse of sqrt of sum of sensitivities squared
double vimic_invSqrtSumSensi(double *sensi, long size) 
{
    double sum = 0.0;

    for (int i = 0; i < size; i++)
        sum += sensi[i] * sensi[i];

    return pow(sum, -0.5); //equals to 1.0 / sqrt(sum);
}

void vimic_floorSensi(double *sensi, double minSensi)
{
    if (abs(*sensi) < minSensi)
        *sensi = 0.0;
}

// normalizes sensitivity based on a given maximum, which must be given as the inverse
void vimic_normalizeSensi(double *sensi, double invMax)
{
    *sensi = (*sensi) * invMax;
}

void vimic_minimizeDelay(double *delay, double minValue)
{
    *delay = (*delay) - minValue;
}

double vimic_findMinDelayValue(double *delay, long size) 
{
	double minDelayValue = delay[0];
	
	for (int i = 1; i < size; i++){
		if (delay[i] < minDelayValue)
			minDelayValue = delay[i];
	}
	return minDelayValue;
}
