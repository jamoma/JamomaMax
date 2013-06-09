// Filter.cpp
/***************************************************/
/*! \class Filter
  \brief Filter class

  A generic biquad filter.

  Based on: 
  Biquad.h by Gary Scavone and Perry Cook, and 
  hml_shelf~.c by Thomas Musil, Copyright (c) IEM KUG Graz Austria 2000 - 2006 

  by Tristan Matthews and Nils Peters, 2007-2008.
 */
/***************************************************/

#include "Filter.h"
#include "Properties.h"
#include "TTBase.h"

extern bool globWarningFlag;
extern bool globReportFlag;

const double Filter::MAX_ = 1.0;
const double Filter::MIN_ = 0.0000001;

Filter::Filter() : 
    sr_(kTTPi / Properties::SAMPLERATE)
{
    this->clear();              // initialize buffer to 0's
}

void Filter::clear()
{
    out_ = 0.0;

    for (int i = 0; i < ORDER_PLUS_ONE; i++)
        in_[i] = 0.0;
}

double Filter::percentToGain(double gain)
{
    return exp(0.5 * log(1.0 - 0.01 * gain));
}

