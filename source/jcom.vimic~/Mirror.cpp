// Mirror.cpp
/***************************************************/
/*! \class Mirror
  \brief Sound mirror class

  This class implements a sound mirror, which reflects
  sound that originates at either a sound source or another
  mirror.

  by Tristan Matthews and Nils Peters, 2007-2008.
 */
/***************************************************/

#include "Mirror.h"
#include "Coordinate.h"
#include "Moveable.h"
#include "Properties.h"
#include "ext.h"

extern bool globWarningFlag;

Mirror::Mirror() : Moveable()
{
    order_ = 0;	 // direct sound by default
    aziAngle_ = 0;
}

short Mirror::order() const
{ 
    return order_; 
}

void Mirror::printPos() const
{
    post("/MirrorPos: %f, %f, %f", xPos(), yPos(), zPos());
}

void Mirror::order(short newOrder)
{
    if (newOrder >= 0 && newOrder < Properties::REFLECTIONORDER)
        order_ = newOrder;
    else if (globWarningFlag)
        post("Mirror: order must be between %d and %d", 0, Properties::REFLECTIONORDER - 1);
}

void Mirror::aziAngle(long angle)
{
    if (angle >= 0 && angle < 360)
    {
        aziAngle_ = angle;
        flag(true);
    }
    else if (globWarningFlag)
        post("Mirror angle must be between 0 and 360.");
}

long Mirror::aziAngle() const
{
    return aziAngle_;
}

// vim:sw=4:et:cindent:
