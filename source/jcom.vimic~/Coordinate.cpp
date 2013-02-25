// Coordinate.cpp
/***************************************************/
/*! \class Coordinate
  \brief Coordinate class

  This class implements a 1d coordinate. 

  by Tristan Matthews and Nils Peters, 2007-2008.
 */
/***************************************************/

#include "Coordinate.h"
#include "Properties.h"

Coordinate::Coordinate() :
    coord_(0.0),
    min_(-Properties::MAX_ROOM_DIM),   
    max_(Properties::MAX_ROOM_DIM)   
{}

// constraints check maybe not ideal
Coordinate::Coordinate(double nCoord) :
    coord_(0.0),
    min_(-Properties::MAX_ROOM_DIM),
    max_(Properties::MAX_ROOM_DIM)
{		
    if (nCoord >= min_ && nCoord <= max_)
        coord_ = nCoord;
}

// get function
double Coordinate::operator ()()	const 
{
    return coord_;
}

// set function
void Coordinate::operator ()(double nCoord)	
{
    if (nCoord >= min_ && nCoord <= max_)
        coord_ = nCoord;
}

