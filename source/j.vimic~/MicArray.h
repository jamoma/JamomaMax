// MicArray.h
/***************************************************/
/*! \class MicArray
  \brief MicArray class

  This class implements a collection of mics that allows 
  position changes to be applied to all its members.

  by Tristan Matthews and Nils Peters, 2007-2008.
 */
/***************************************************/

#ifndef _MICARRAY_H_
#define _MICARRAY_H_

#include <vector>
#include "Properties.h"

class Mic;			// forward class declaration

class MicArray {
    public:
        //! Class constructor.
        MicArray(short numMics);

        //! True if the channel num >= 0 and < the total number of channels.
        bool validChannel(short channelNum);

        //! Set center in x.
        void centerLR(double newCenterLR);
        //! Set center in y.
        void centerFB(double newCenterFB);
        //! Set center in z.
        void centerUD(double newCenterUD);

        //! Sets all of the MicArray's mics' x positions to x.
        void xPos(double x);
        //! Sets all of the MicArray's mics' y positions to y.
        void yPos(double y);
        //! Sets all of the MicArray's mics' z positions to z.
        void zPos(double z);

        //! Sets all of the MicArray's mics' azimuth angles.
        void azi(double azi);
        //! Sets all of the MicArray's mics' elevation angles.
        void ele(double ele);
        //! Set mic array's radius.
        void centerDistance(double rad);
        //! Sets all of the MicArray's mics' distance powers.
        void distPow(double pow);
		//! Sets all of the MicArray's mics' dB unit
		void dbUnit(double dbUnit);
        //! Sets all of the MicArray's mics' directivity gains.
        void dirGain(double gain);
        //! Sets all of the MicArray's mics' gain.
        void gain(double gain);
        //! Sets all of the MicArray's mics' directivity powers.
        void dirPow(double pow);
        //! Returns the size of the mic array.
        short numChannels() const; 
        //! Updates the specified mic.
        void renderMic(int mic);
        //! Updates all mics.
        void renderMics();

        //! Returns the mic at the given index.
        Mic& operator[](const int idx);
        //! Returns a constant refernce to the mic at the given index.
        const Mic& operator[](const int i) const;
        //! Prints information about all of the mics.
        void print();
        //! Returns true if the mic array has changed, false otherwise.
        bool flag() const;
        //! Sets the mics flag.
        void flag(bool changed);
        //! Checks that new room width will not exclude any mics.
        bool checkWidth(double newWidth);
        //! Checks that new room depth will not exclude any mics.
        bool checkDepth(double newDepth);
        //! Checks that new room height will not exclude any mics.
        bool checkHeight(double newHeight);

        //! Class destructor.
        ~MicArray();

    private:
        double centerLR_, centerFB_, centerUD_, centerDistance_;
        short numChannels_;
        std::vector<Mic> mics;
        static int AziAngle[Properties::MAXNUMCHANNELS][Properties::MAXNUMCHANNELS];	// defined in MicArray.cpp
        bool flag_;
};

#endif

// vim:sw=4:et:cindent:
