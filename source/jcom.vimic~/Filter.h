// Filter.h
/***************************************************/
/*! \class Filter
  \brief Filter class

  A High Mid Low shelf filter. Shelf centre frequencies are immutable.

  Based on: 
  Biquad.h by Gary Scavone and Perry Cook, and 
  hml_shelf~.c by Thomas Musil, Copyright (c) IEM KUG Graz Austria 2000 - 2006 

  by Tristan Matthews and Nils Peters, 2007-2008.
 */
/***************************************************/

#ifndef _FILTER_H_
#define _FILTER_H_

#include "Properties.h"
#include "TTDSP.h"

class Filter {
    private:
        const static int ORDER_PLUS_ONE = 3;
        double in_[ORDER_PLUS_ONE];
        double out_;

    protected:
        //! Pi divided by the sample rate.
        double sr_; 
        //! Filter coefficient.
        double b1_;
        //! Filter coefficient.
        double b2_;
        //! Filter coefficient.
        double a0_; 
        //! Filter coefficient.
        double a1_;
        //! Filter coefficient.
        double a2_;
        //! Convert percentage to linear gain.
        double percentToGain(double gainPercentage);
        //! Max gain value.
        const static double MAX_;
        //! Min gain value.
        const static double MIN_;

    public:
        //! Class constructor.
        Filter();

        //! Given an input sample, returns a filtered output sample.
        double tick(double input);

        //! Prints information about the given filter.
        virtual void print() const = 0;

        //! Reinitialize filter's memory.
        void clear();

        //! Virtual destructor.
        virtual ~Filter() {};
};

inline double Filter::tick(double input)
{
#ifndef __INTEL_COMPILER
    if (IEM_NAN(input)) // NAN protect
        input = 0.0;
#endif
	
    in_[0] = input + b1_ * in_[1] + b2_ * in_[2];
    out_ = a0_ * in_[0] + a1_ * in_[1] + a2_ * in_[2];
    in_[2] = in_[1];
    in_[1] = in_[0];

    // NAN and denormal protect
#ifndef __INTEL_COMPILER
    TTZeroDenormal(in_[2]);
    TTZeroDenormal(in_[1]);
    if (IEM_NAN(in_[2]))
        in_[2] = 0.0;
    if (IEM_NAN(in_[1]))
        in_[1] = 0.0;
#endif
	
    /*if (IEM_DENORMAL(in_[0]) || IEM_NAN(in_[0]))
      in_[0] = 0.0f;
      if (IEM_DENORMAL(out_) || IEM_NAN(out_))
      out_ = 0.0f;   */

    return out_;
}

#endif
// vim:sw=4:et:cindent:
