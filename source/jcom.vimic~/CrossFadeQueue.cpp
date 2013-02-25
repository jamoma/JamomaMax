// CrossFadeQueue.cpp
/***************************************************/
/*! \class CrossFadeQueue
  \brief CrossFadeQueue class

  This class implements a sound source, which consists
  of variables that are common to all crossfades, as well as the 
  queue of crossfade events.

  by Tristan Matthews and Nils Peters, 2007-2008.
 */
/***************************************************/

#include "CrossFade.h"
#include "CrossFadeQueue.h"
#include "Properties.h"
#include "ext_critical.h" //FIXME: this amy be added globally ?
#include "TTBase.h"

#include <cassert>
#include <deque>
#include <vector>

extern bool globReportFlag;
extern bool globWarningFlag;

CrossFadeQueue::CrossFadeQueue(long newFadeThreshold, long newFadeLength, Properties::fadeMode fadeType, double sampleRate) :
    changed_(true),
    fadeThreshold_(newFadeThreshold),
    fadeLength_(newFadeLength),
    fadeTbl_(),
    sampleRate_(sampleRate),
    fadeType_(fadeType),
    fadeQueue_()
{
    if (fadeLength_ <= 0)
    {
        fadeLength_ = 64;
        if (globWarningFlag)
            post ("Invalid fadelength, set to default of %d samps", fadeLength_);
    }

    notifyCrossFades();
	computeFadeTbl();
}

CrossFadeQueue::~CrossFadeQueue()
{
    // delete any Crossfades still in queue.
    while (!fadeQueue_.empty())
    {
        delete fadeQueue_.front();
        fadeQueue_.pop_front();
    }
}

double CrossFadeQueue::getTblValAt(int index) const
{
    return fadeTbl_[index];
}

double CrossFadeQueue::fadeLength() const
{
    return fadeLength_;
}

void CrossFadeQueue::fadeLength(long newFadeLength)
{
    if (newFadeLength > 0)
    {
        fadeLength_ = newFadeLength;

        changed_ = true;
        notifyCrossFades();

        computeFadeTbl();
    }
    else if (globWarningFlag)
        error("Invalid fadelength %d, no action taken", newFadeLength);

    if (globReportFlag)
        post("FadeLength: %d", fadeLength_);	
}

void CrossFadeQueue::fadeFunction(Properties::fadeMode fadeType)
{
    fadeType_ =  fadeType;
    computeFadeTbl();
    if (globReportFlag)
    {
        switch (fadeType_)
        {
            case Properties::COS_SQUARED:
                post("x-fade fade-function: cosine squared");
                break;

            case Properties::COS:
                post("x-fade fade-function: cosine");
                break;

            case Properties::LINEAR:
                post("x-fade fade-function: linear");
                break;

            case Properties::TANH:
                post("x-fade fade-function: tangens hyperbolicus");
                break;

            case Properties::SQRT:
                post("x-fade fade-function: square root");
                break;
				
			case Properties::LOG:
                post("x-fade fade-function: logarithm");
                break;	
				
			case Properties::SIGMOID:
                post("x-fade fade-function: Sigmoid");
                break;		
        }
    }
}

// reset and initialize fade tbl to appropriate fade function.
// This will resize the fadetbl_ vector
void CrossFadeQueue::computeFadeTbl()
{
    fadeTbl_.resize(fadeLength_);       
    double i = 0.0; 
    int tableIdx;
    //    double k = 0.0;
    //int experiment = 64;

    // parameter for the tanh-fade function

    double b = 0.5;
    double width = 0.9;
    double a = log(7.)/width;
    double f0=tanh(a*(-b));
    double f1=tanh(a*(1-b));
    // This will never be division by zero, due to the fact that we always have width > 0
    double alpha = 1/(f1-f0);
    double beta = f0;

    critical_enter(0); //making the creation of the table threadsafe 
    switch(fadeType_)
    {
        case Properties::COS: //cosine 
				//for (i = 0.0, tableIdx = 0; tableIdx < fadeLength_; i += (double) (kTTHalfPi / (fadeLength_ - 1)), tableIdx++) //kTTHalfPi was M_PI_2
				//fadeTbl_[tableIdx] = (double) cos(i);  // read forward to fade out, backward to fade in		
			for (i = 0.0, tableIdx = 0; tableIdx < fadeLength_; i += (double) (kTTPi / (fadeLength_ - 1)), tableIdx++) //kTTHalfPi was M_PI_2
				{//post("last i %f",i);
				fadeTbl_[tableIdx] = (double) 0.5*(1.0 + cos(i));  // read forward to fade out, backward to fade in	
				}
            break;		

        case Properties::COS_SQUARED: //cosine squared
			//for (i = 0.0, tableIdx = 0; tableIdx < fadeLength_; i += (double) (kTTHalfPi / (fadeLength_ - 1)), tableIdx++)	//kTTHalfPi was M_PI_2		
            //    fadeTbl_[tableIdx] = (double) pow(cos(i),2.0);	// read forward to fade out, backward to fade in
			for (i = 0.0, tableIdx = 0; tableIdx < fadeLength_; i += (double) (1.0 / (fadeLength_ -1)), tableIdx++)	//kTTHalfPi was M_PI_2		
			{//post("last i %f",i);
				fadeTbl_[tableIdx] = (double) (1.0 + cos(i*i*kTTPi))*0.5;	// read forward to fade out, backward to fade in
			}
			break;

        case Properties::LINEAR: //linear
            for (i = 1.0, tableIdx = 0; tableIdx < fadeLength_; i -= (double) (1.0 / (fadeLength_ -1)), tableIdx++)
                {//post("last i %f",i);
				fadeTbl_[tableIdx] = (double) i;	// read forward to fade out, backward to fade in
				}
            break;

        case Properties::TANH: //tanh-function		 
            for (i = 1.0, tableIdx = 0; tableIdx < fadeLength_; i -= (double) (1.0 / (fadeLength_ -1)), tableIdx++)
                {//post("last i %f",i);
				fadeTbl_[tableIdx] = (double) alpha*(tanh(a*(i-b)) - beta);// read forward to fade out, backward to fade in
				}
			break;
		
		case Properties::LOG: //log-function
		{ 
		    for (i = 1.0, tableIdx = 0; tableIdx < fadeLength_; i -= (double) (1.0 / (fadeLength_ )), tableIdx++)
			{ //post("last i %f",i);
				fadeTbl_[tableIdx] = (double) 20*log10((i)*pow(10.0,((1-i)*0.05)));// read forward to fade out, backward to fade in
			}
			double temp = -1.0 * fadeTbl_[fadeLength_ -1]; 
			for (tableIdx = 0; tableIdx < fadeLength_; tableIdx++)
				fadeTbl_[tableIdx] = (fadeTbl_[tableIdx]+temp)/(temp);
			}
			break;
					
		case Properties::SIGMOID: //sigmoid function 1/(1+exp(t))
			//double temp = -8;
			//double tempk = temp * -2.0;
			for (i = -8.0, tableIdx = 0; tableIdx < fadeLength_; i += (double) (16.0 / (fadeLength_- 1)), tableIdx++)
                {//post("last i %f",i);
					fadeTbl_[tableIdx] = (double) 1.0 / (1.0 + exp(i));// read forward to fade out, backward to fade in
				}
			break;		
            /*if (fadeLength_ >= experiment)
              {   

              for (i = 1.0, tableIdx = 0; tableIdx < experiment; i -= (double) (1.0 / (experiment)), tableIdx++)
              fadeTbl_[tableIdx] = i;
              for (tableIdx = experiment; tableIdx < fadeLength_; tableIdx++)
              fadeTbl_[tableIdx] = 0.0f;
              } */
            //for (i = 0, tableIdx = 0; tableIdx < fadeLength_; i -= (double) (9.0 / (fadeLength_)), tableIdx++)
            //    fadeTbl_[tableIdx] = log10(i);	// read forward to fade out, backward to fade in
            //break;

        case Properties::SQRT: //square root
            for (i = 1.0, tableIdx = 0; tableIdx < fadeLength_; i -= (double) (1.0 / (fadeLength_ - 1)), tableIdx++)
                {//post("last i %f",i);
					fadeTbl_[tableIdx] = sqrt(i);	// read forward to fade out, backward to fade in
				}
            break;	

    }
    critical_exit(0); 
	if (fadeType_ != Properties::SIGMOID)
    fadeTbl_[fadeLength_ - 1] = 0.0;	 // last value == 0.0

    if (globReportFlag)
    {
        for (tableIdx = 0; tableIdx < fadeLength_; tableIdx++)
            post("Fade[%d]: %f", tableIdx, fadeTbl_[tableIdx]);
    }
}

// update individual CrossFades with new fadelength
void CrossFadeQueue::notifyCrossFades()
{
    if (changed_)
    {
        for (std::deque< CrossFade *>::iterator iter = fadeQueue_.begin(); iter != fadeQueue_.end(); ++iter)
            (*iter)->update(fadeLength_);
    }
}

// add new crossfade to queue, which has a pointer to this, returns true if started
bool CrossFadeQueue::startFade()
{

    /*if (fadeQueue_.size() >= 3)  // destroy oldest inactive (2nd to front) element, shift up queue.
      {
    // start at end of queue (back)
    std::deque<CrossFade*>::iterator iter = fadeQueue_.begin(); 
    iter++;         // get element before front
    fadeQueue_.erase(iter);         // erase this element
    }*/

    if (!isActive())                            // if empty
    {
        fadeQueue_.push_back(new CrossFade(*this));         // enqueue new crossfade

        /*
        // swap new and old filter sets if at start of fade
        for (int i = 0; i < 3; i++)
        {
        int temp = oldFilterIdx[i];
        oldFilterIdx[i] = newFilterIdx[i];
        newFilterIdx[i] = temp;
        }*/

        if (globReportFlag)
            post("new crossfade added, total crossfades = %d", fadeQueue_.size());
        return true;
    }
    else
        return false;
}

int CrossFadeQueue::size()
{
    return fadeQueue_.size();
}

long CrossFadeQueue::fadeThreshold() const
{
    return fadeThreshold_;
}

void CrossFadeQueue::fadeThreshold(long newThreshold)
{
    if (newThreshold >= 1)
        fadeThreshold_ = newThreshold;
    else if (globWarningFlag)
        error("Invalid crossfade threshold %ld, must be >= 1", newThreshold);

    if (globReportFlag)
        post("Crossfade threshold in samples: %d", fadeThreshold_);
}

void CrossFadeQueue::finishFade()
{
    assert(isActive());         // make sure there's an element on the queue
    delete fadeQueue_.front();
    fadeQueue_.pop_front();
}

void CrossFadeQueue::increment()
{
    fadeQueue_.front()->increment();
}

bool CrossFadeQueue::isActive() const
{
    return !fadeQueue_.empty();
}

double CrossFadeQueue::tick(double fadeInInput, double fadeOutInput)
{
    return fadeQueue_.front()->tick(fadeInInput, fadeOutInput);
}

// tells caller if crossfade is at beginning or not
bool CrossFadeQueue::atStart() const
{
    if (isActive())
    {
        return fadeQueue_.front()->atStart();
    }
    else
        return false;
}

// vim:sw=4:et:cindent:
