// LowPass.h
/***************************************************/
/*! \class LowPass
  \brief Low pass filter class

  A 2nd order low pass filter.

  Based on: 
  Biquad.h by Gary Scavone and Perry Cook, and 
  hml_shelf~.c by Thomas Musil, Copyright (c) IEM KUG Graz Austria 2000 - 2006 

  by Tristan Matthews and Nils Peters, 2007-2008.
 */
/***************************************************/

#ifndef _LOWPASS_H_
#define _LOWPASS_H_

#include "Filter.h"
#include "Properties.h"

class LowPass: public Filter {
    private:
        long cutOff_;
        void init();
    public:
        //! Class constructor.
        LowPass();

        //! Set cutoff frequency.
        void cutOff(long newCutOff);

        //! Print out info about this filter.
        virtual void print() const;

        //! Class destructor.
        virtual ~LowPass() {};
};

#endif
// vim:sw=4:et:cindent:
