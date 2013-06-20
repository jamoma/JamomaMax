// HiMidLow.h
/***************************************************/
/*! \class HiMidLow
  \brief HiMidLow filter class

  A High Mid Low shelf filter. Shelf centre frequencies are immutable.

  Based on: 
  Biquad.h by Gary Scavone and Perry Cook, and 
  hml_shelf~.c by Thomas Musil, Copyright (c) IEM KUG Graz Austria 2000 - 2006 

  by Tristan Matthews and Nils Peters, 2007-2008.
 */
/***************************************************/

#ifndef _HIMIDLOW_H_
#define _HIMIDLOW_H_

#include "Filter.h"
#include "Properties.h"

class HiMidLow : public Filter {
    private:
        double lf_, hf_, mf_, lg_, mg_, hg_;
        void init();
    public:
        //! Class constructor.
        HiMidLow();

        //! Set low shelf's center frequency.
        void lowShelfFrequency(double lf);

        //! Set high shelf's center frequency.
        void highShelfFrequency(double hf);

        //! Sets low gain.
        void lowGain(double newLg);

        //! Sets mid gain.
        void midGain(double newMg);

        //! Set high gain.
        void highGain(double newHg);

        //! Prints information about this filter.
        virtual void print() const;

        //! Class destructor.
        virtual ~HiMidLow() {};
};

#endif
// vim:sw=4:et:cindent:
