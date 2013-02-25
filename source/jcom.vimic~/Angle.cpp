// Angle.cpp
/***************************************************/
/*! \class Angle
  \brief Angle class

  This class implements an angle, which is given values 
  in degrees but converts and stores them as radians.

  by Tristan Matthews and Nils Peters, 2007-2008.
 */
/***************************************************/

#include "Angle.h"
#include "ext.h"
#include "TTBase.h"

const double Angle::PI_X_180 = kTTPi / 180.0; 
extern bool globWarningFlag;

// default constructor
Angle::Angle() : min_(-kTTPi), max_(kTTPi), max2_(kTTTwoPi), coord_(0.0)
{}

// constraints check maybe not ideal
Angle::Angle(double nCoord, double min, double max, double max2) : min_(-kTTPi), max_(kTTPi), max2_(kTTTwoPi), coord_(0.0)
{	
    nCoord *= PI_X_180;				
    min *= PI_X_180;
    max *= PI_X_180;

    if (min < max && max <= max2)
    {
        min_ = min;
        max_ = max;
        max2_ = max2;
    }
    else
        post("Invalid bounds for angle");

    if (nCoord >= min_ && nCoord <= max_)
        coord_ = nCoord;
    else if (nCoord >= max_ && nCoord <= max2_ && max_ != max2_)
        coord_ = nCoord - kTTTwoPi;			// offset phase
    else if (globWarningFlag)
        post("Invalid angle, default to %f", coord_);
}

void Angle::operator ()(double nCoord)	// set function
{	
    nCoord = nCoord * PI_X_180;

    if (nCoord >= min_ && nCoord <= max_)
        coord_ = nCoord;
    else if (nCoord >= max_ && nCoord <= max2_ && max_ != max2_)
        coord_ = nCoord - max2_;
    else if (globWarningFlag)
        post("Invalid angle %f, must be >= %f and <= %f", nCoord, min_, max_);
}

// get function
double Angle::operator ()() const 
{ 
    return coord_; 
}  

// vim:sw=4:et:cindent:
