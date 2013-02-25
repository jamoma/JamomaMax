// Mic.cpp 
/***************************************************/
/*! \class Mic
  \brief Microphone class

  This class implements a microphone, which consists
  of directivity pattern, a scalar gain, 3-d coordinates,
  azimuth angle and elevation angle.

  by Tristan Matthews and Nils Peters, 2007-2008.
 */
/***************************************************/

#include "Mic.h"
#include "Angle.h"
#include "Coordinate.h"
#include "ext.h"
#include "Moveable.h"
#include "Properties.h"

extern bool globWarningFlag;
extern bool globReportFlag;

Mic::Mic(double x, double y, double z, double newAzi, double newEle) : Moveable(x, y, z)
{
    aziAng_ = Angle(newAzi, -180.0, 180.0, 2 * 180.0);	// initial angle and constraints are defined
    eleAng_ = Angle(newEle, -90.0, 90.0, 90.0);
    gain_ = 1.0;
    dirPow_ = 1.0;
    dirGainA_ = 1.0;
    dirGainB_ = 0.0;
    distPow_ = -1.0;
	//TODO: add dbUnit_
    flag(true);
}

void Mic::printPos() const
{
    post("/MicPos = %f, %f, %f", xPos(), yPos(), zPos());
}

void Mic::printAngles() const
{   
    post("/MicAzi = %f, /MicEle = %f", aziAng_() * Properties::RAD2DEG, eleAng_() * Properties::RAD2DEG);
}

void Mic::reset()
{
    init();
}

void Mic::init()
{
    gain_ = 1.0;
    xPos(0.0);
    yPos(0.0);
    zPos(0.0);
    aziAng_(0.0);
    eleAng_(0.0);
    dirPow_ = 1.0;
    dirGainA_ = 1.0;
    dirGainB_ = 0.0;
    distPow_ = -1.0;
	//TODO: add dbUnit_
    flag(true);
}

void Mic::azi(double newAzi)
{
    aziAng_(newAzi);
    if (globReportFlag)
        printAngles();
    flag(true);
}

double Mic::azi() const
{
    return aziAng_();
}


void Mic::ele(double newEle)
{
    eleAng_(newEle);
    if (globReportFlag)
        printAngles();
    flag(true);
}


double Mic::ele() const
{
    return eleAng_();
}

void Mic::dirGainA(double newDirGain)
{
    bool capped = false;

    if (newDirGain > 1.0){
		newDirGain = 1.0;
        capped = true;
    }
    else if (newDirGain < -1.0){
		newDirGain = -1.0;
        capped = true;
    }

    dirGainA_ = newDirGain;
    dirGainB_ = 1.0 - dirGainA_;
    if (capped && globWarningFlag)
        post("Directivity gain capped at %f", dirGainA_);

    if (globReportFlag)
        post("DirGainA: %f, DirGainB: %f", dirGainA_, dirGainB_);

    flag(true);
}


double Mic::dirGainA() const
{
    return dirGainA_;
}

double Mic::dirGainB() const
{
    return dirGainB_;
}

void Mic::dirPow(double newDirPow)
{
    bool capped = false;

    if (newDirPow > 9.0)
    {
        newDirPow = 9.0;
        capped = true;
    }
    else if (newDirPow < 0.0)
    {
        newDirPow = 0.0;
        capped = true;
    }

    dirPow_ = newDirPow;

    if (capped && globWarningFlag)
        post("Directivity power capped at %f", dirPow_);

    if (globReportFlag)
        post("Mic dirPow = %f", dirPow_);

    flag(true);
}


double Mic::dirPow() const
{
    return dirPow_;
}

void Mic::distPow(double newDistPow)
{
    bool capped = false;

    if (newDistPow > 9.0)
    {
        newDistPow = 9.0;
        capped = true;
    }
    else if (newDistPow < 0.0)
    {
        newDistPow = 0.0;
        capped = true;
    }
    newDistPow = -1.0 * newDistPow; // optimization, for sensi calculation
    distPow_ = newDistPow;
    if (capped && globWarningFlag)
        post("Distance power capped at %f", distPow_);

    if (globReportFlag)
        post("Mic distpow = %f", distPow_);
    flag(true);
}


double Mic::distPow() const
{
    return distPow_;
}

void Mic::dbUnit(double newDbUnit)
{
    bool capped = false;
	
    if (newDbUnit > 60.0)
    {
        newDbUnit = 60.0;
        capped = true;
    }
    else if (newDbUnit < 0.0)
    {
        newDbUnit = 0.0;
        capped = true;	
    }
    newDbUnit = -0.05 * newDbUnit; 
    dbUnit_ = newDbUnit;
    if (capped && globWarningFlag)
        post("dB Unit for exponential distance model capped at %f", dbUnit_);
	
    if (globReportFlag)
        post("dB Unit for exponential distance model = %f", dbUnit_);
    flag(true);
}

double Mic::dbUnit() const
{
    return dbUnit_;
}



void Mic::gain(double newGain)
{
    bool capped = false;

    if (newGain > 1.0)
    {
        newGain = 1.0;
        capped = true;
    }
    else if (newGain < 0.0)
    {
        newGain = 0.0;
        capped = true;
    }

    gain_ = newGain;
    if (capped && globWarningFlag)
        post("Mic gain capped at %f", gain_);

    if (globReportFlag)
        post("Mic gain = %f", gain_);

    flag(true);
}

double Mic::gain() const
{
    return gain_;
}

Mic::~Mic() 
{
}

// vim:sw=4:et:cindent:
