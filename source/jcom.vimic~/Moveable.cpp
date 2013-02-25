// Implements methods for base class Moveable

#include "Moveable.h"
#include "ext.h"
#include "Coordinate.h"

extern bool globWarningFlag;
extern bool globReportFlag;

Moveable::Moveable()
{
    xPos_ = Coordinate(0.0);
    yPos_ = Coordinate(0.0);
    zPos_ = Coordinate(0.0);
    flag_ = true;
}

Moveable::Moveable(double x, double y, double z)
{
    xPos_ = Coordinate(x);
    yPos_ = Coordinate(y);
    zPos_ = Coordinate(z);
    flag_ = true;
}

double Moveable::xPos() const
{ 
    return xPos_(); 
}

void Moveable::xPos(double x) 
{ 
    xPos_(x);
    if (globReportFlag)
        printPos();
    flag_ = true;
}

double Moveable::yPos() const
{ 
    return yPos_();
}

void Moveable::yPos(double y) 
{ 
    yPos_(y); 
    if (globReportFlag)
        printPos();
    flag_ = true;
}

double Moveable::zPos() const
{ 
    return zPos_(); 
}

void Moveable::zPos(double z) 
{ 
    zPos_(z); 
    if (globReportFlag)
        printPos();
    flag_ = true;
}

bool Moveable::flag() const
{ 
    return flag_; 
}

void Moveable::flag(bool changed) 
{ 
    flag_ = changed;
}

bool Moveable::checkWidth(double newWidth)
{
    return ((newWidth * 0.5) >= abs(xPos_()));
}

bool Moveable::checkDepth(double newDepth)
{
    return ((newDepth * 0.5) >= abs(yPos_()));
}

bool Moveable::checkHeight(double newHeight)
{
    return ((newHeight * 0.5) >= abs(zPos_()));
}

// vim:sw=4:et:cindent:
