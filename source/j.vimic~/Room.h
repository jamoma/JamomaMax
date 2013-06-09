// Room.h
/***************************************************/
/*! \class Room
  \brief Room class

  This class implements a room, composed of 4 walls, a ceiling
  and a floor, as well as a sound source and reflections.

  by Tristan Matthews and Nils Peters, 2007-2008.
 */
/***************************************************/

#ifndef _ROOM_H_
#define _ROOM_H_

#include "MicArray.h"
#include "Properties.h"
#include <vector>

class Source;	// forward declarations
class Mirror;
class HiMidLow;
class LowPass;

class Room {
    private:
        double width_, depth_, height_;
        short numMics_; 
        short reflOrder_;
        bool mirrorFlag_;
        int filtersPerMic_;
        void printWalls();

    public: // FIXME: public data !!! gross
        //! Sound source.	
        Source *sources;
        //! Sound mirrors.	
        Mirror *mirrors;
        //! Filters which simulate room damping.	
        HiMidLow **walls;
        //! Filters which simulate room damping for XFADE_LITE mode.	
        HiMidLow **xfadeWalls;
        //! Filters which simulate air absorption.
        LowPass **air;
        //! Filters which simulate air absorption for XFADE_LITE mode.
        LowPass *xfadeAir;
        //! Collection of mics.
        MicArray mics;

        //! Class constructor.
        Room(double newWidth, double newDepth, double newHeight, short numChannels, short numSources, short reflOrder);
        //! Print information about this room and its contents.
        void print();
        //! Update mirrors.
        void renderMirrors();
        //! Allows source to notify mirror that it has changed.
        void sourceChanged();

        //! Returns true if mirrors have changed.
        bool mirrorFlag() const;
        //! Get reflection order (either 0, 1 or 2).
        short reflOrder() const;
        //! Set width.
        void width(double newWidth);
        //! Set height.
        void height(double newHeight);
        //! Set depth.
        void depth(double newDepth);
        //! Get width.
        double width() const;
        //! Get height.
        double height() const;
        //! Get depth.
        double depth() const; 

        //! Get half width.
        double halfWidth() const;
        //! Get half height.
        double halfHeight() const;
        //! Get half depth.
        double halfDepth() const; 

        //! Class destructor.
        ~Room();
};

#endif

// vim:sw=4:et:cindent:
