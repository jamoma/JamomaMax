// MicArray.cpp
// A collection of mics that allows position changes to be applied to all its members.
// TODO: Have real out of bounds error

#include "MicArray.h"
#include "Mic.h"
#include "Properties.h"
#include "Angle.h"
#include "TTBase.h"
#include <cassert>
#include <vector>

extern bool globReportFlag;

int MicArray::AziAngle[Properties::MAXNUMCHANNELS][Properties::MAXNUMCHANNELS] = { // first NumOfChannels, second Speaker Angle
    /*  1ch */	{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
    /*  2ch */	{-30,30,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
    /*  3ch */	{-30,0,30,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
    /*  4ch */	{-135,-45,45,135,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
    /*  5ch */	{-110,-30,0,30,110,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
    /*  6ch */	{-110,-30,0,30,110,180,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
    /*  7ch */	{-110,-30,0,30,110,180,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
    /*  8ch */	{0,45,90,135,180,-135,-90,-45,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},  //{-135,-90,-45,0,45,90,135,180,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}, // 8 channels
    /*  9ch */	{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
    /* 10ch */	{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
    /* 11ch */	{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
    /* 12ch */	{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
    /* 13ch */	{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
    /* 14ch */	{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
    /* 15ch */	{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
 //   /* 16ch */	{0,22.5,45,67.5,90,112.5,135,157.5,180,-157.5,-135,-112.5,-90,-67.5,-45,-22.5,0,0,0,0,0,0,0,0},
	/* 16ch */	{0,22,45,67,90,112,135,157,180,-157,-135,-112,-90,-67,-45,-22,0,0,0,0,0,0,0,0},
    //{-157.5,-135,-112.5,-90,-67.5,-45,-22.5,0,22.5,45,67.5,90,112.5,135,157.5,180,0,0,0,0,0,0,0,0},
    /* 17ch */	{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
    /* 18ch */	{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
    /* 19ch */	{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
//  /* 20ch */	{-157.5,-135,-112.5,-90,-67.5,-45,-22.5,0,22.5,45,67.5,90,112.5,135,157.5,180,-135,-45,45,135,0,0,0,0},
	/* 20ch */	{-157,-135,-112,-90,-67,-45,-22,0,22,45,67,90,112,135,157,180,-135,-45,45,135,0,0,0,0},
    /* 21ch */	{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
    /* 22ch */	{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
    /* 23ch */	{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
    /* 24ch */	{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
};

MicArray::MicArray(short initNumChannels = 8)
{
    centerLR_ = 0.0;
    centerFB_ = 0.0;
    centerUD_ = 0.0;
    centerDistance_ = 0; //NP: was 5

    if (initNumChannels <= Properties::MAXNUMCHANNELS && initNumChannels > 0)
        numChannels_ = initNumChannels;
    else
        numChannels_ = 8;

    for (int i = 0; i < numChannels_; i++)
        mics.push_back(Mic(0.0, 0.0, 0.0, AziAngle[numChannels_ - 1][i], 0.0));
    flag_ = true;
}

MicArray::~MicArray() {}

void MicArray::centerLR(double newCenterLR)
{
    centerLR_ = newCenterLR;
    renderMics();
}

void MicArray::centerFB(double newCenterFB)
{
    centerFB_ = newCenterFB;
    renderMics();
}

void MicArray::centerUD(double newCenterUD)
{
    centerUD_ = newCenterUD;
    renderMics();
}

void MicArray::centerDistance(double newCenterDistance)
{
    centerDistance_ = newCenterDistance;
    renderMics();
}

// recalculates all mic positions
void MicArray::renderMics()
{
    for (int m = 0; m < numChannels_; m++)
        renderMic(m);
    flag_ = true;
}

// updates the mic position based on the current array geometry
void MicArray::renderMic(int m)
{
    double temp;

    temp = (double)(AziAngle[numChannels_ - 1][m] * Angle::PI_X_180);

    mics[m].xPos(centerLR_ + sin((double) temp) * centerDistance_);
    mics[m].yPos(centerFB_ + cos((double) temp) * centerDistance_);
    mics[m].zPos(centerUD_);
    mics[m].azi(AziAngle[numChannels_ - 1][m]);
    mics[m].ele(0);
}

// returns reference to Mic at position index
Mic& MicArray::operator [](const int index) 
{
    assert(index >= 0 && index < numChannels_);	// should already be checked at higher level
    return mics[index];
}

// returns reference to Mic at position index (const version)
const Mic& MicArray::operator [](const int index) const
{
    assert(index >= 0 && index < numChannels_);	// should already be checked at higher level
    return mics[index];
}

void MicArray::print()
{   double rad2deg_ = 180.0/kTTPi;
    post("Number of Channels: %d", numChannels_);
    post("Mic Array Center: %f, %f, %f, Distance: %f", centerLR_, centerFB_, centerUD_, centerDistance_);
    int m = 0;
    for (std::vector<Mic>::iterator iter = mics.begin(); iter != mics.end(); iter++, m++)
    {
        post("Mic %d: Pos: %f, %f, %f ::::: Orientation: %f azimuth, %f elevation", m + 1, iter->xPos(), iter->yPos(), iter->zPos(), iter->azi()*rad2deg_, iter->ele()*rad2deg_);
        post("Directivitiy: %f, DirPow: %f, DisPow: %f", iter->dirGainA(), iter->dirPow(), -1.0*iter->distPow());
    }
}				

bool MicArray::validChannel(short b)
{
    if (b > 0 && b <= numChannels_)
        return true;
    else
        return false;
}

void MicArray::distPow(double newDistPow)
{
    for (std::vector<Mic>::iterator iter = mics.begin(); iter != mics.end(); iter++)
        iter->distPow(newDistPow);
    flag_ = true;
}

void MicArray::dbUnit(double newDbUnit)
{
    for (std::vector<Mic>::iterator iter = mics.begin(); iter != mics.end(); iter++)
        iter->dbUnit(newDbUnit);
    flag_ = true;
}

void MicArray::dirGain(double newDirGain)
{
    for (std::vector<Mic>::iterator iter = mics.begin(); iter != mics.end(); iter++)
        iter->dirGainA(newDirGain);
    flag_ = true;
}

void MicArray::gain(double newGain)
{
    for (std::vector<Mic>::iterator iter = mics.begin(); iter != mics.end(); iter++)	
        iter->gain(newGain);
    flag_ = true;
}

void MicArray::dirPow(double newDirPow)
{
    for (std::vector<Mic>::iterator iter = mics.begin(); iter != mics.end(); iter++)
        iter->dirPow(newDirPow);
    flag_ = true;
}

void MicArray::xPos(double newXpos)
{
    for (std::vector<Mic>::iterator iter = mics.begin(); iter != mics.end(); iter++)
        iter->xPos(newXpos);
    flag_ = true;
}

void MicArray::yPos(double newYpos)
{
    for (std::vector<Mic>::iterator iter = mics.begin(); iter != mics.end(); iter++)
        iter->yPos(newYpos);
    flag_ = true;
}

void MicArray::zPos(double newZpos)
{
    for (std::vector<Mic>::iterator iter = mics.begin(); iter != mics.end(); iter++)
        iter->zPos(newZpos);
    flag_ = true;
}

void MicArray::azi(double newAzi)
{
    for (std::vector<Mic>::iterator iter = mics.begin(); iter != mics.end(); iter++)
        iter->azi(newAzi);
    flag_ = true;
}

void MicArray::ele(double newEle)
{
    for (std::vector<Mic>::iterator iter = mics.begin(); iter != mics.end(); iter++)
        iter->ele(newEle);
    flag_ = true;
}

void MicArray::flag(bool changed)
{
    flag_ = changed;
}

bool MicArray::flag() const
{
    return flag_;
}

bool MicArray::checkWidth(double newWidth)
{
    for (std::vector<Mic>::iterator iter = mics.begin(); iter != mics.end(); iter++)
    {
        if (!iter->checkWidth(newWidth))
            return false;
    }
    return true;
}

bool MicArray::checkDepth(double newDepth)
{
    for (std::vector<Mic>::iterator iter = mics.begin(); iter != mics.end(); iter++)
    {
        if (!iter->checkDepth(newDepth))
            return false;
    }
    return true;
}

bool MicArray::checkHeight(double newHeight)
{
    for (std::vector<Mic>::iterator iter = mics.begin(); iter != mics.end(); iter++)
    {
        if (!iter->checkHeight(newHeight))
            return false;
    }
    return true;
}

short MicArray::numChannels() const
{
    return numChannels_;
}

// vim:sw=4:et:cindent:
