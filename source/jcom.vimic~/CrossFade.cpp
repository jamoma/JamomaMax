// CrossFade.cpp
/***************************************************/
/*! \class CrossFade
  \brief CrossFade class

  This class implements a crossfade event, which occurs
  when a delay time changes quickly enough that the old
  delay time must be crossfaded with the new delay time.

  by Tristan Matthews and Nils Peters, 2007-2008.
 */
/***************************************************/

#include "CrossFade.h"
#include "CrossFadeQueue.h"
#include "Properties.h"

extern bool globWarningFlag;
extern bool globReportFlag;


CrossFade::CrossFade(CrossFadeQueue &owner) :
owner_(owner),
fadeLength_(owner.fadeLength()),
fadeInIdx_(fadeLength_ - 1),
fadeOutIdx_(0)
{
    // post("fadeOutIdx: %d, fadeInIdx: %d, ",fadeOutIdx_, fadeInIdx_);
    // update fade gains
    updateGains();
}

void CrossFade::update(long fadeLength)
{
    fadeLength_ = fadeLength;
    updateGains();
}

void CrossFade::updateGains()
{
    // update gain values based on owner's fade table
    fadeOutGain_ = owner_.getTblValAt(fadeOutIdx_);
    fadeInGain_ = owner_.getTblValAt(fadeInIdx_);
}

bool CrossFade::atStart() const
{
    if (fadeOutIdx_ == 0)
        return true;
    else
        return false;
}

// vim:sw=4:et:cindent:
