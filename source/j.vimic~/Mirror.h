// Mirror.h 
/***************************************************/
/*! \class Mirror
  \brief Sound mirror class

  This class implements a sound mirror, which reflects
  sound that originates at either a sound source or another
  mirror.

  by Tristan Matthews and Nils Peters, 2007-2008.
 */
/***************************************************/

#ifndef _MIRROR_H_
#define _MIRROR_H_

#include "Moveable.h"

class Mirror : public Moveable {
    private:
        short order_;
        long aziAngle_;

    public:
        //! Class constructor.
        Mirror();

        //! Get order.
        short order() const; 
        //! Set order.
        void order(short);

        //! Set azimuth angle.
        void aziAngle(long angle);
        //! Get azimuth angle.
        long aziAngle() const;

        //! Print xyz position.
        virtual void printPos() const;

        //! Class destructor.
        virtual ~Mirror() {}
};

#endif 
// vim:sw=4:et:cindent:
