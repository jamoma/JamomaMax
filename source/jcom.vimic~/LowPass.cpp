// LowPass.h
/***************************************************/
/*! \class LowPass
  \brief Low pass filter class

  A 2nd order low pass filter.

  Based on: 
  Biquad.h by Gary Scavone and Perry Cook, and 
  hml_shelf~.c by Thomas Musil, Copyright (c) IEM KUG Graz Austria 2000 - 2006 

  by Tristan Matthews and Nils Peters, 2007-2008.
 */
/***************************************************/

#include "Filter.h"
#include "LowPass.h"
#include "Properties.h"

extern bool globWarningFlag;
extern bool globReportFlag;

LowPass::LowPass() : Filter(), cutOff_(10000)
{
    init();
}

void LowPass::cutOff(long newCutOff)
{
    if (newCutOff < 500)
    {
        newCutOff = 500;
        if (globWarningFlag)
            post("Air filter cutoff capped at 500.");
    }
    else if (newCutOff > (long) Properties::SAMPLERATE * 0.44)
    {
        newCutOff = (long) Properties::SAMPLERATE * 0.44;
        if (globWarningFlag)
            post("Air filter cutoff capped at %f.", Properties::SAMPLERATE * 0.44);
    }

    cutOff_ = newCutOff;
    init();
}

void LowPass::init()
{
    double l, al, bl2, rcp;
    double tempa0, tempa1, tempa2, tempb1, tempb2;

    l = cutOff_ * sr_;

    if (l < 1.0e-20)
    {
        l = 1.0e20;
        if (globWarningFlag)
            post("l capped at %f", l);
    }
    else if (l > 1.57079632)
    {
        l = 0.0;
        if (globWarningFlag)
            post("l capped at %f", l);
    }
    else
    {
        double si = sin(l);
        double co = cos(l);
        l = co / si;
    }

    al = l * 1.41421;	// damping
    bl2 = (l * l) + 1.0;
    rcp = 1.0 / (al + bl2);

    tempa0 = rcp;
    tempa1 = 2.0 * rcp;
    tempa2 = tempa0;
    tempb1 = rcp * 2.0 * (bl2 - 2.0);
    tempb2 = rcp * (al - bl2);

    //this->clear();

    /* stability check */

    double discriminant = tempb1 * tempb1 + 4.0 * tempb2;
    if(tempb1 <= -1.9999996)
        tempb1 = -1.9999996;
    else if(tempb1 >= 1.9999996)
        tempb1 = 1.9999996;

    if(tempb2 <= -0.9999998)
        tempb2 = -0.9999998;
    else if(tempb2 >= 0.9999998)
        tempb2 = 0.9999998;

    if(discriminant >= 0.0)
    {
        if(0.9999998 - tempb1 - tempb2 < 0.0)
            tempb2 = 0.9999998 - tempb1;
        if(0.9999998 + tempb1 - tempb2 < 0.0)
            tempb2 = 0.9999998 + tempb1;
    }

    a0_ = tempa0;
    a1_ = tempa1;
    a2_ = tempa2;
    b1_ = tempb1;
    b2_ = tempb2;
}

void LowPass::print() const
{
    post("b1: %f, b2: %f, a0: %f, a1: %f, a2: %f, cutoff: %f", b1_, b2_, a0_, a1_, a2_, cutOff_);
}

// vim:sw=4:et:cindent:
