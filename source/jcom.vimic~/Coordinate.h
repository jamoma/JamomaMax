// Coordinate.h
/***************************************************/
/*! \class Coordinate
  \brief Coordinate class

  This class implements a 1d coordinate. 

  by Tristan Matthews and Nils Peters, 2007-2008.
 */
/***************************************************/

#ifndef _COORDINATE_H_
#define _COORDINATE_H_

class Coordinate {
    private:
        double coord_, min_, max_;
    public:
        //! Default class constructor.
        Coordinate();
        //! Class constructor which takes a coordinate value.
        Coordinate(double nCoord);

        //! Get.
        double operator ()() const; 
        //! Set.
        void operator () (double nCoord);	

        //! Class destructor.
        ~Coordinate() {};
};

#endif
// vim:sw=4:et:cindent:
