// Mic.h
/***************************************************/
/*! \class Mic
  \brief Microphone class

  This class implements a microphone, which consists
  of directivity pattern, a scalar gain, 3-d coordinates,
  azimuth angle and elevation angle.

  by Tristan Matthews and Nils Peters, 2007-2008.
 */
/***************************************************/

#ifndef _MIC_H_
#define _MIC_H_

#include "Coordinate.h"
#include "Angle.h"
#include "Moveable.h"
#include "Properties.h"

class Mic : public Moveable {

    private:
        Angle aziAng_;
        Angle eleAng_;
        double dirGainA_;
        double dirGainB_;
        double dirPow_;
        double distPow_;
		double gain_;
		double dbUnit_; // for exponential distance model
		int   distModel; 
        void init();

    public:
        //! Class constructor, taking 3d position and azimuth and elevation angles.
        Mic(double x, double y, double z, double azi, double ele);

        //! Reset microphone to default values.
        void reset();

        //! Set azimuth angle.
        void azi(double angle);
        //! Get azimuth angle.
        double azi() const;

        //! Set elevation angle.
        void ele(double angle);
        //! Get elevation angle.
        double ele() const;

        //! Set gain.
        void gain(double newGain);
        //! Get gain.
        double gain() const;

        //! Set directivity gain a.
        void dirGainA(double newDirGainA);
        //! Get directivity gain a.
        double dirGainA() const;
        //! Get directivity gain b.
        double dirGainB() const;

        //! Set directivity power.
        void dirPow(double newDirPow);
        //! Get directivity power.
        double dirPow() const;

        //! Set distance power.
        void distPow(double newDistPow);
        //! Get distance power.
        double distPow() const;

		//! Set dbUnit for exponential distance model.
		void dbUnit(double newDbUnit);
		//! Get distance power.
		double dbUnit() const;
	
			
        //! Print position in x,y,z.
        virtual void printPos() const;
        //! Print azimuth and elevation.
        void printAngles() const;

        //! Class destructor.
        virtual ~Mic();
};

#endif
// vim:sw=4:et:cindent:
