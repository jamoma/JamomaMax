// Source.cpp

/***************************************************/
/*! \class Source
  \brief Sound source class

  This class implements a sound source, which consists
  of a 1d signal and its own
  directivity pattern and 3-d position properties.

  by Tristan Matthews and Nils Peters, 2007-2008.
 */
/***************************************************/

#include "Source.h"
#include "Room.h"
#include "Mirror.h"
#include "Moveable.h"
#include "ext.h"


extern bool globWarningFlag;
extern bool globReportFlag;

// default constructor
Source::Source(Room &room, Mirror *mirrors) :
    Moveable(), owner_(room), mirrors_(mirrors)
{
    init();
}

void Source::init()
{
    aziAngle_ = 0;
    directivityFlag_ = false;

    directivityTbl_.resize(361, 1.0f);		// reserve space for all degrees
}

void Source::updateDirectivity(long **tbl)
{
    int n = 0;
    for (std::vector<double>::iterator iter = directivityTbl_.begin(); iter != directivityTbl_.end(); iter++, n++)
    {
        *iter = (*((*tbl) + n)) * 0.0001;		// retrieve the nth element from the table, and divide by 10000
        if (globReportFlag)
            post("directTbl[%d]: %f", n, *iter);
    }

    flag(true);
}

double Source::directivityAt(long angle) const
{
    if (angle >= 0 && angle < 361)		// index 361 gives us the average source directivity
    {
        return directivityTbl_[angle];
    }
    else			// out of bounds
    {
        if (globWarningFlag)
            error("Angle out of bounds for directivity table.");

        return 1.0;
    }
}

void Source::aziAngle(long angle)
{
    if (angle >= 0 && angle < 360)
    {
        aziAngle_ = angle;

        // update mirrors azi angles accordingly
        mirrors_[0].aziAngle(aziAngle_);

      /*  if (owner_.reflOrder() > 0)
        {
            mirrors_[LEFT].aziAngle((aziAngle_ + 270) % 360);
            mirrors_[RIGHT].aziAngle((aziAngle_ + 90) % 360);
            mirrors_[FRONT].aziAngle(aziAngle_);
            mirrors_[REAR].aziAngle((aziAngle_ + 180) % 360);		
            mirrors_[FLOOR].aziAngle(360);			// at angle 360, we look at the mean for the directivity table.	
            mirrors_[CEILING].aziAngle(360);
        }

        if (owner_.reflOrder() > 1)
        {
            mirrors_[LEFT_FRONT].aziAngle(mirrors_[LEFT].aziAngle());
            mirrors_[RIGHT_FRONT].aziAngle(mirrors_[RIGHT].aziAngle());
            mirrors_[LEFT_REAR].aziAngle(mirrors_[LEFT].aziAngle());
            mirrors_[RIGHT_REAR].aziAngle(mirrors_[RIGHT].aziAngle());
            mirrors_[LEFT_FLOOR].aziAngle(mirrors_[LEFT].aziAngle());
            mirrors_[RIGHT_FLOOR].aziAngle(mirrors_[RIGHT].aziAngle());
            mirrors_[LEFT_CEILING].aziAngle(mirrors_[LEFT].aziAngle());
            mirrors_[RIGHT_CEILING].aziAngle(mirrors_[RIGHT].aziAngle());
            mirrors_[FRONT_FLOOR].aziAngle(mirrors_[FRONT].aziAngle());
            mirrors_[REAR_FLOOR].aziAngle(mirrors_[REAR].aziAngle());
            mirrors_[FRONT_CEILING].aziAngle(mirrors_[FRONT].aziAngle());
            mirrors_[REAR_CEILING].aziAngle(mirrors_[REAR].aziAngle());
        }
        */
        flag(true);
    }
    else if (globWarningFlag)
        post("Source angle must be between 0 and 360.");
}

long Source::aziAngle() const
{
    return aziAngle_;
}

void Source::printPos() const
{
    post("SourcePos= X: %f,Y: %f,Z: %f,Orientation: %ld", xPos(), yPos(), zPos(), aziAngle_);
}

void Source::xPosAbs(double newXPos)
{
    if (newXPos < owner_.halfWidth() && newXPos > -owner_.halfWidth())
    {
        xPos(newXPos);
        notifyRoom();
    }
    else if (globWarningFlag)
        post("source exceeds room");
}

void Source::yPosAbs(double newYPos)
{
    if (newYPos < owner_.halfDepth() && newYPos > -owner_.halfDepth())
    {
        yPos(newYPos);
        notifyRoom();
    }
    else if (globWarningFlag)
        post("source exceeds room");
}

void Source::zPosAbs(double newZPos)
{
    if (newZPos < owner_.halfHeight() && newZPos > -owner_.halfHeight())
    {
        zPos(newZPos);
        notifyRoom();
    }
    else if (globWarningFlag)
        post("source exceeds room");
}

void Source::xPosRel(double newXPos)
{
    if (newXPos < 1 && newXPos > -1)
    {
        xPos(newXPos * owner_.halfWidth());
        notifyRoom();
    }
    else if (globWarningFlag)
        post("source exceeds room");
}

void Source::yPosRel(double newYPos)
{
    if (newYPos < 1 && newYPos > -1)
    {
        yPos(newYPos * owner_.halfDepth());
        notifyRoom();
    }
    else if (globWarningFlag)
        post("source exceeds room");
}

void Source::zPosRel(double newZPos)
{
    if (newZPos < 1 && newZPos > -1)
    {
        zPos(newZPos * owner_.halfHeight());
        notifyRoom();
    }
    else if (globWarningFlag)
        post("source exceeds room");
}

// let Room know that this source has changed
void Source::notifyRoom()
{
    owner_.sourceChanged();
}


bool Source::directivityFlag() const
{
    return directivityFlag_;
}

void Source::directivityFlag(bool newFlag)
{
    directivityFlag_ = newFlag;
    this->flag(true);
}

// vim:sw=4:et:cindent:
