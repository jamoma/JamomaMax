// CrossFadeQueue.h
/***************************************************/
/*! \class CrossFadeQueue
  \brief CrossFadeQueue class

  This class implements a sound source, which consists
  of variables that are common to all crossfades, as well as the 
  queue of crossfade events.

  by Tristan Matthews and Nils Peters, 2007-2008.
 */
/***************************************************/

#ifndef _CROSS_FADE_QUEUE_H_
#define _CROSS_FADE_QUEUE_H_

#include "Properties.h"
#include <deque>
#include <vector>

class CrossFade;

class CrossFadeQueue {
    private:
        bool changed_;
        long fadeThreshold_;
        long fadeLength_;
        std::vector<double> fadeTbl_;
        double sampleRate_;
        Properties::fadeMode fadeType_;
        void computeFadeTbl();
        void notifyCrossFades();
        std::deque<CrossFade*> fadeQueue_;

    public:
        /*! Class constructor, taking a value that determines how great a change in delay time (in samples)
          there must be to trigger a crossfade, as well as the length of the crossfade, the type of crossfade,
          and the sample rate.
         */
        CrossFadeQueue(long fadeThreshold, long fadeLength, Properties::fadeMode fadeType, double sampleRate);

        //! Triggers a crossfade, returns true if fade has started.
        bool startFade();

        //! Manages cleanup and end of crossfade.
        void finishFade();

        //! Returns crossfade table value at given index.
        double getTblValAt(int index) const;

        //! Get fade threshold in samples.
        long fadeThreshold() const;
        //! Set fade threshold in samples.
        void fadeThreshold(long newThreshold);

        //! Get fade time in samples.
        double fadeLength() const;
        //! Set fade time in samples.
        void fadeLength(long newLength);

        //! Set fade type (LINEAR, COS, COS_SQUARED, TANH, SQRT, LOG, SIGMOID) 
        void fadeFunction(Properties::fadeMode fadeType);

        //! Out value of crossfade.
        double tick(double fadeInInput, double fadeOutInput);

        //! Increment top level crossfade.
        void increment();

        //! Return number of crossfades being queued.
        int size();

        //! True if a crossfade is underway, false othewise.
        bool isActive() const;

        //! True if at beginning of crossfade.
        bool atStart() const;

        //! Class destructor.
        ~CrossFadeQueue();
};

#endif
// vim:sw=4:et:cindent:
