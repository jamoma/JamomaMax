// Source.h
/***************************************************/
/*! \class Source
  \brief Sound source class

  This class implements a sound source, which consists
  of a 1d signal and its own
  directivity pattern and 3-d position properties.

  by Tristan Matthews and Nils Peters, 2007-2008.
 */
/***************************************************/

#ifndef _SOURCE_H_
#define _SOURCE_H_

#include "Moveable.h"
#include "Properties.h"

#include <vector>

class Room;
class Mirror;

class Source : public Moveable {
    private:
        long aziAngle_; 
        bool directivityFlag_;
        Room &owner_;
        Mirror *mirrors_;
        std::vector<double> directivityTbl_;
        void notifyRoom();
        void init();
    public:
        //! Class constructor, taking the Room to which the source belongs, as well as a pointer to the acoustic mirrors for the room/source.
        Source(Room &room, Mirror *mirrors);

        //! Set directivity table to values obtained from the Max patch.
        void updateDirectivity(long **tbl);

        //! Retrieve directivity gain for a given angle.
        double directivityAt(long angle) const;

        //! Set x position in meters.
        void xPosAbs(double xPos);

        //! Set y position in meters.
        void yPosAbs(double yPos);

        //! Set z position in meters.
        void zPosAbs(double zPos);

        //! Set x position relative to room width (0.0 to 1.0).
        void xPosRel(double xPos);

        //! Set y position relative to room depth (0.0 to 1.0).
        void yPosRel(double yPos);

        //! Set z position relative to room height (0.0 to 1.0).
        void zPosRel(double zPos);
        
		
        //! True if the source's directivity is to be taken into account, false otherwise.
        bool directivityFlag() const;

        //! True if the source's directivity is to be taken into account, false otherwise.
        void directivityFlag(bool flag);

        //! Change azimuth angle, and those of all the mirrors.
        void aziAngle(long angle);

        //! Get azimuth angle.
        long aziAngle() const;

        //! Post xyz position.
        virtual void printPos() const;

        //! Class destructor.
        virtual ~Source() {}
};

#endif
// vim:sw=4:et:cindent:
