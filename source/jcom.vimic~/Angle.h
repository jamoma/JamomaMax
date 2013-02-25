// Angle.h
/***************************************************/
/*! \class Angle
  \brief Angle class

  This class implements an angle, which is given values 
  in degrees but converts and stores them as radians.

  by Tristan Matthews and Nils Peters, 2007-2008.
 */
/***************************************************/

#ifndef _ANGLE_H_
#define _ANGLE_H_

#include "ext.h"

class Angle {
    private:
        double min_;
        double max_;
        double max2_;
        double coord_;
    public:
        //! Default class constructor.
        Angle();
        //! Class constructor, taking an angle in degrees, a lower bound, an upper bound and another upper bound.
        Angle(double nCoord, double min, double max, double max2); 

        //! Get angle.
        double operator ()() const;	
        //! Set angle.
        void operator () (double nCoord);

        //! Constant to convert degrees to radians.
        static const double PI_X_180; 

        //! Class destructor.
        ~Angle() {};
};

#endif
// vim:sw=4:et:cindent:
