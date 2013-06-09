// CrossFade.h 
/***************************************************/
/*! \class CrossFade
  \brief CrossFade class

  This class implements a crossfade event, which occurs
  when a delay time changes quickly enough that the old
  delay time must be crossfaded with the new delay time.

  by Tristan Matthews and Nils Peters, 2007-2008.
 */
/***************************************************/

#ifndef _CROSSFADE_H_
#define _CROSSFADE_H_

#include "Properties.h"
#include "CrossFadeQueue.h"
#include <cassert>

class CrossFade {
    private:
        CrossFadeQueue &owner_;
        long fadeLength_;
        long fadeInIdx_;
        long fadeOutIdx_;
        double fadeInGain_;
        double fadeOutGain_;
        void updateGains();

    public:
        //! Class constructor, takes CrossFadeQueue that owns it.
        CrossFade(CrossFadeQueue &owner);

        //! Returns true if the CrossFade is at step 0.
        bool atStart() const;

        //! updates the CrossFade with a new fadelength.
        void update(long fadeLength);

        //! Outputs crossfade of two samples.
        double tick(double fadeInInput, double fadeOutInput);

        //! Increments the pointer to the crossfade table.
        void increment();

        //! Class destructor.
        ~CrossFade() {};
};

inline double CrossFade::tick(double fadeInInput, double fadeOutInput)
{
    //post("fadeOutGain: %f, fadeInGain: %f, sumgains %f",  fadeOutGain_, fadeInGain_, fadeOutGain_ + fadeInGain_);
    return ((double) fadeInInput * fadeInGain_) + ((double) fadeOutInput * fadeOutGain_);	
}

inline void CrossFade::increment()
{
    fadeOutIdx_++;
    fadeInIdx_--;

    if (fadeOutIdx_ >= fadeLength_)         // fade is finished
    {
        assert(fadeInIdx_ < 0);
        owner_.finishFade();            // TODO: check if this is safe
    }
    else
        updateGains();
}

#endif 
// vim:sw=4:et:cindent:
