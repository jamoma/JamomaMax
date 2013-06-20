// Moveable.h
/***************************************************/
/*! \class Moveable
  \brief Moveable class

  This class implements an object that can be moved in
  3d space.

  by Tristan Matthews and Nils Peters, 2007-2008.
 */
/***************************************************/

#ifndef _MOVEABLE_H_
#define _MOVEABLE_H_

#include "Coordinate.h"

class Moveable {
    private:
        Coordinate xPos_, yPos_, zPos_;
        bool flag_;

    public:
        //! Class constructor.
        Moveable();
        //! Class constructor, taking arguments for x, y and z position.
        Moveable(double x, double y, double z);
        virtual ~Moveable() {}
        //! Get x position.
        double xPos() const;
        //! Set x position.
        void xPos(double x);
        //! Get y position.
        double yPos() const;
        //! Set y position.
        void yPos(double y);
        //! Get z position.
        double zPos() const;
        //! Set z position.
        void zPos(double z);
        //! True if object has moved.
        bool flag() const;
        //! To be set if object has moved.
        void flag(bool changed);
        //! Check if a room's new width will still contain this object.
        bool checkWidth(double newWidth);
        //! Check if a room's new depth will still contain this object.
        bool checkDepth(double newDepth);
        //! Check if a room's new height will still contain this object.
        bool checkHeight(double newHeight);
        //! Virtual function that must be overriden in derived classes. Prints position for this object.
        virtual void printPos() const = 0;
};

#endif

// vim:sw=4:et:cindent:
