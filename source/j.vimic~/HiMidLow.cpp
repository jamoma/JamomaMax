// HiMidLow.cpp
/***************************************************/
/*! \class HiMidLow
  \brief HiMidLow filter class

  A High Mid Low shelf filter. Shelf centre frequencies are mutable.

  Based on: 
  Biquad.h by Gary Scavone and Perry Cook, and 
  hml_shelf~.c by Thomas Musil, Copyright (c) IEM KUG Graz Austria 2000 - 2006 

  by Tristan Matthews and Nils Peters, 2007-2008.
 */
/***************************************************/

#include "Filter.h"
#include "HiMidLow.h"
#include "Properties.h"

extern bool globWarningFlag;
extern bool globReportFlag;

HiMidLow::HiMidLow() : Filter(),
    lf_(450.0),
    hf_(3500.0),
    mf_(sqrt(hf_) * sqrt(lf_)), // mf_ depends on hf_ and lf_
    lg_(MAX_),	                // was initialized to 0.0 (dB) in original
    mg_(MAX_),
    hg_(MAX_)
{
    init();
}

void HiMidLow::lowShelfFrequency(double lf)
{
    if (lf < hf_)
    {
        if (lf >= 10.0 && lf <= 10000.0)
        {
            lf_ = lf;
            mf_ = sqrt(hf_) * sqrt(lf_); // mf_ depends on hf_ and lf_
            init();
        }
        else if (globWarningFlag)
            error("HiMidLow: Low shelf frequency must be between 10 and 10000 hz.");
    }
    else if (globWarningFlag)
        error("HiMidLow: Low shelf frequency must be less than high shelf frequency %f.", hf_);
}

void HiMidLow::highShelfFrequency(double hf)
{
    if (hf > lf_)
    {
        if (hf >= 10.0 && hf <= 10000.0)
        {
            hf_ = hf;
            mf_ = sqrt(hf_) * sqrt(lf_); // mf_ depends on hf_ and lf_
            init();
        }
        else if (globWarningFlag)
            error("HiMidLow: High shelf frequency must be between 10 and 10000 hz.");
    }
    else if (globWarningFlag)
        error("HiMidLow: High shelf frequency must be greater than low shelf frequency %f.", lf_);
}

void HiMidLow::lowGain(double newLg)
{   
    newLg = percentToGain(newLg);	// convert from percentage to gain
    bool capped = false;
    if (newLg > MAX_)
    {
        newLg = MAX_;
        capped = true;
    }
    else if (newLg < MIN_)
    {
        newLg = MIN_;
        capped = true;
    }

    if (lg_ != newLg)
    {
        lg_ = newLg;
        init();
    }

    if (capped && globWarningFlag)
        post("Filter: Low gain capped at %f", lg_);
}

void HiMidLow::midGain(double newMg)
{   
    newMg = percentToGain(newMg);	// convert from percentage to gain
    bool capped = false;
    if (newMg > MAX_)
    {
        newMg = MAX_;
        capped = true;
    }
    else if (newMg < MIN_)
    {
        newMg = MIN_;
        capped = true;
    }

    if (mg_ != newMg)
    {
        mg_ = newMg;
        init();
    }

    if (capped && globWarningFlag)
        post("HiMidLow: Mid gain capped at %f", mg_);
}

void HiMidLow::highGain(double newHg)
{
    newHg = percentToGain(newHg);	// convert from percentage to gain
    bool capped = false;
    if (newHg > MAX_)
    {
        newHg = MAX_;
        capped = true;
    }
    else if (newHg < MIN_)
    {
        newHg = MIN_;
        capped = true;
    }

    if (hg_ != newHg)
    {
        hg_ = newHg;
        init();
    }

    if (capped && globWarningFlag)
        post("HiMidLow: High gain capped at %f", hg_);
}

void HiMidLow::init()
{
    double f = mf_ * sr_; //ok
    double rf = sqrt(hf_) / sqrt(lf_); //ok
    double l = cos(f) / sin(f);//ok
    double invHg = 1.0 / hg_;
    double invLg = 1.0 / lg_;
    double invMg = 1.0 / mg_;
    double k1 = rf * l;
    double k2 = l / rf;
    double k3 = l * l;
    double k4 = k3 * hg_;
    double k5 = k3 * invHg;
    double k6 = invLg + k5;
    double k7 = invMg * k1 +  k2 * invLg * invHg * mg_;
    double k8 = lg_ + k4;
    double k9 = (mg_ * k1) + (k2 * lg_ * hg_ * invMg);
    double k10 = 1.0 / (k6 + k7);

    double tempb2 = k10 * (k7 - k6);
    double tempb1 = k10 * 2.0 * (k5 - invLg);
    double tempa2 = k10 * (k8 - k9);
    double tempa1 = k10 * 2.0 * (lg_ - k4);
    double tempa0 = k10 * (k8 + k9);

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

void HiMidLow::print() const
{
    post("b1: %f, b2: %f, a0: %f, a1: %f, a2: %f, lg: %f, mg: %f, hg: %f", b1_, b2_, a0_, a1_, a2_, lg_, mg_, hg_);
}

// vim:sw=4:et:cindent:
