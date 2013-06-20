// Room.cpp
/***************************************************/
/*! \class Room
  \brief Room class

  This class implements a room, composed of 4 walls, a ceiling
  and a floor, as well as a sound source and reflections.
  
  based on code by Jonas Braasch,
  adapted by Tristan Matthews, Nils Peters, 2007-2008.
 */
/***************************************************/

#include "Room.h"
#include "Source.h"
#include "MicArray.h"
#include "HiMidLow.h"
#include "LowPass.h"
#include "Mirror.h"
#include "Mic.h"
#include "Properties.h"

#include "ext.h"
#include <vector>

extern bool globWarningFlag;
extern bool globReportFlag;

Room::Room(double newWidth, double newDepth, double newHeight, short numChannels, short numSources, short newReflOrder) : 
    width_(newWidth), 
    depth_(newDepth), 
    height_(newHeight), 
    numMics_(numChannels), 
    reflOrder_(newReflOrder),
    mirrorFlag_(true),
    filtersPerMic_(reflOrder_ * Properties::NUMWALLS),
    mics(MicArray(numMics_))
{
    short numRefls;

    /* 
       According to the image Model the number of Reflections can be determined based on the Reflection Order
       that is how many times a ray is allowed to hit a wall.
     */
    if (reflOrder_ < 0 || reflOrder_ > 3)
    {
        post("Invalid reflection order, defaulting to 2.");
        reflOrder_ = 2;
    }
    numRefls = Properties::REFLECTIONS_PER_REFLECTION_ORDER[reflOrder_];

    mirrors = new Mirror[numRefls];

    // initialize mirrors with correct order
    for (int i = 0; i < numRefls; i++)
    {
        if (i == Properties::DIRECT)			// direct
            mirrors[i].order(0);
        else if (i <= Properties::NUMWALLS)			// first order refls.
            mirrors[i].order(1);
        else					// 2nd order
            mirrors[i].order(2);
    }
    // sound source
    sources = new Source(*this, mirrors);

    filtersPerMic_ = (reflOrder_ * Properties::NUMWALLS);

    if (reflOrder_ > 0)		// if we need filters
    {
        walls = new HiMidLow*[numMics_];
        air = new LowPass*[numMics_];

        xfadeWalls = new HiMidLow*[numMics_];
        xfadeAir = new LowPass[numMics_];

        for (int i = 0; i < numMics_; i++)
        {
            walls[i] = new HiMidLow[filtersPerMic_];
            xfadeWalls[i] = new HiMidLow[3];

            air[i] = new LowPass[reflOrder_];
        }
    }
}

Room::~Room()
{
    if (reflOrder_ > 0)
    {
        for (int n = 0; n < numMics_; n++)
        {
            delete [] xfadeWalls[n];
            delete [] walls[n];
            delete [] air[n];
        }

        delete [] xfadeWalls;
        delete [] walls;
        delete [] air;
        delete [] xfadeAir;
    }

    //delete [] sources;
    delete sources;
    delete [] mirrors;
}

void Room::printWalls()
{
    for (int m = 0; m < numMics_; m++)
    {
        for (int n = 0; n < filtersPerMic_; n++)
        {
            post("Mic[%d], wall[%d]: ", m, n);
            walls[m][n].print();
        }
    }
}

void Room::print()
{
    post("Width: %f, Depth %f, Height %f", width_, depth_, height_);
    printWalls();
}

// source has changed
void Room::sourceChanged()
{
    mirrorFlag_ = true;
    mics.flag(true);
}

void Room::width(double newWidth)
{
    if (newWidth <= Properties::MAX_ROOM_DIM && sources[0].checkWidth(newWidth) && mics.checkWidth(newWidth))
    {
        width_ = newWidth;
        mirrorFlag_ = true;
        sources[0].flag(true);
        mics.flag(true);
        if (globReportFlag)
            post("/RoomWidth= %f", width_);
    }
    else if (globWarningFlag)
        post("bad value for Room Width: %f", newWidth);
}

void Room::height(double newHeight)
{
    if (newHeight <= Properties::MAX_ROOM_DIM && sources[0].checkHeight(newHeight) && mics.checkHeight(newHeight))
    {
        height_ = newHeight;
        mirrorFlag_ = true;
        sources[0].flag(true);
        mics.flag(true);
        if (globReportFlag)
            post("/RoomHeight = %f", width_);
    }
    else if (globWarningFlag)
        post("bad value for Room height: %f", newHeight);
}

void Room::depth(double newDepth)
{
    if (newDepth <= Properties::MAX_ROOM_DIM && sources[0].checkDepth(newDepth) && mics.checkDepth(newDepth))
    {
        depth_ = newDepth;
        mirrorFlag_ = true;
        sources[0].flag(true);
        mics.flag(true);
        if (globReportFlag)
            post("/RoomDepth = %f", depth_);
    }
    else if (globWarningFlag)
        post("bad value for Room depth: %f", newDepth);
}

double Room::width() const
{
    return width_;
}

double Room::depth() const
{
    return depth_;
}

double Room::height() const
{
    return height_;
}

double Room::halfWidth() const
{
    return width_ * 0.5;
}

double Room::halfDepth() const
{
    return depth_ * 0.5;
}

double Room::halfHeight() const
{
    return height_ * 0.5;
}

bool Room::mirrorFlag() const 
{ 
    return mirrorFlag_; 
}

void Room::renderMirrors()
{
    // Estimation of mirror images
    // direct sound source
    mirrors[0].xPos(sources[0].xPos());
    mirrors[0].yPos(sources[0].yPos());
    mirrors[0].zPos(sources[0].zPos());

    // first order reflections
    if (reflOrder_ > 0) 
    {
        // left wall
        mirrors[Properties::LEFT].xPos(-width_ - sources[0].xPos()); // case 6 -> .xPos(mirrors[Properties::LEFT].xPos());//
        mirrors[Properties::LEFT].yPos(sources[0].yPos());
        mirrors[Properties::LEFT].zPos(sources[0].zPos());

        //right wall
        mirrors[Properties::RIGHT].xPos(width_ - sources[0].xPos()); // case 5 -> .xPos(mirrors[Properties::RIGHT].xPos());//
        mirrors[Properties::RIGHT].yPos(sources[0].yPos());
        mirrors[Properties::RIGHT].zPos(sources[0].zPos());

        // front wall
        mirrors[Properties::FRONT].xPos(sources[0].xPos());
        mirrors[Properties::FRONT].yPos(depth_ - sources[0].yPos()); //case 4 -> .yPos(mirrors[Properties::FRONT].yPos());//
        mirrors[Properties::FRONT].zPos(sources[0].zPos());

        // rear wall
        mirrors[Properties::REAR].xPos(sources[0].xPos());
        mirrors[Properties::REAR].yPos(-depth_ - sources[0].yPos());//case 3 -> y.Pos(mirrors[REAR].yPos());//
        mirrors[Properties::REAR].zPos(sources[0].zPos());

        // floor
        mirrors[Properties::FLOOR].xPos(sources[0].xPos());
        mirrors[Properties::FLOOR].yPos(sources[0].yPos());
        mirrors[Properties::FLOOR].zPos(height_ - sources[0].zPos());  //case 2 -> z.Pos(mirrors[FLOOR].zPos());//

        // ceiling
        mirrors[Properties::CEILING].xPos(sources[0].xPos());
        mirrors[Properties::CEILING].yPos(sources[0].yPos());
        mirrors[Properties::CEILING].zPos(-height_ - sources[0].zPos()); //case 1 -> z.Pos(mirrors[Properties::CEILING].zPos());//

    }
    if (reflOrder_ > 1)
    {
        // second order reflections
        //left wall/front wall
        mirrors[Properties::LEFT_FRONT].xPos(mirrors[Properties::LEFT].xPos());//.xPos(-width_ - sources[0].xPos()); // case 6
        mirrors[Properties::LEFT_FRONT].yPos(mirrors[Properties::FRONT].yPos());//.yPos(depth_ - sources[0].yPos());//case 4
        mirrors[Properties::LEFT_FRONT].zPos(sources[0].zPos());

        // right wall/ front wall	
        mirrors[Properties::RIGHT_FRONT].xPos(mirrors[Properties::RIGHT].xPos());//.xPos(width_ - sources[0].xPos()); // case 5
        mirrors[Properties::RIGHT_FRONT].yPos(mirrors[Properties::FRONT].yPos());//.yPos(depth_ - sources[0].yPos());//case 4
        mirrors[Properties::RIGHT_FRONT].zPos(sources[0].zPos());

        // left wall/rear wall
        mirrors[Properties::LEFT_REAR].xPos(mirrors[Properties::LEFT].xPos());//.xPos(-width_ - sources[0].xPos()); // case 6
        mirrors[Properties::LEFT_REAR].yPos(mirrors[Properties::REAR].yPos());//.yPos(-depth_ - sources[0].yPos()); //case 3
        mirrors[Properties::LEFT_REAR].zPos(sources[0].zPos());

        // right wall/rear wall
        mirrors[Properties::RIGHT_REAR].xPos(mirrors[Properties::RIGHT].xPos());//.xPos(width_ - sources[0].xPos()); // case 5
        mirrors[Properties::RIGHT_REAR].yPos(mirrors[Properties::REAR].yPos());//.yPos(-depth_ - sources[0].yPos()); //case 3
        mirrors[Properties::RIGHT_REAR].zPos(sources[0].zPos());

        // left wall/floor 
        mirrors[Properties::LEFT_FLOOR].xPos(mirrors[Properties::LEFT].xPos());//.xPos(-width_ - sources[0].xPos()); // case 6
        mirrors[Properties::LEFT_FLOOR].yPos(sources[0].yPos());
        mirrors[Properties::LEFT_FLOOR].zPos(mirrors[Properties::FLOOR].zPos());//.zPos(height_ - sources[0].zPos()); //case 2

        // right wall/floor 
        mirrors[Properties::RIGHT_FLOOR].xPos(mirrors[Properties::RIGHT].xPos());//.xPos(width_ - sources[0].xPos()); // case 5
        mirrors[Properties::RIGHT_FLOOR].yPos(sources[0].yPos());
        mirrors[Properties::RIGHT_FLOOR].zPos(mirrors[Properties::FLOOR].zPos());//.zPos(height_ - sources[0].zPos()); //case 2

        // left wall/ceiling
        mirrors[Properties::LEFT_CEILING].xPos(mirrors[Properties::LEFT].xPos());//.xPos(-width_ - sources[0].xPos()); // case 6
        mirrors[Properties::LEFT_CEILING].yPos(sources[0].yPos());
        mirrors[Properties::LEFT_CEILING].zPos(mirrors[Properties::CEILING].zPos());//.zPos(-height_ - sources[0].zPos()); //case 1

        // right wall/ceiling 
        mirrors[Properties::RIGHT_CEILING].xPos(mirrors[Properties::RIGHT].xPos());//.xPos(width_ - sources[0].xPos()); // case 5
        mirrors[Properties::RIGHT_CEILING].yPos(sources[0].yPos());
        mirrors[Properties::RIGHT_CEILING].zPos(mirrors[Properties::CEILING].zPos());//.zPos(-height_ - sources[0].zPos()); //case 1

        // front wall/floor 
        mirrors[Properties::FRONT_FLOOR].xPos(sources[0].xPos());
        mirrors[Properties::FRONT_FLOOR].yPos(mirrors[Properties::FRONT].yPos());//.yPos(depth_ - sources[0].yPos()); //case 4
        mirrors[Properties::FRONT_FLOOR].zPos(mirrors[Properties::FLOOR].zPos());//.zPos(height_ - sources[0].zPos()); //case 2

        // rear wall/floor 
        mirrors[Properties::REAR_FLOOR].xPos(sources[0].xPos());
        mirrors[Properties::REAR_FLOOR].yPos(mirrors[Properties::REAR].yPos());//.yPos(-depth_ - sources[0].yPos()); //case 3
        mirrors[Properties::REAR_FLOOR].zPos(mirrors[Properties::FLOOR].zPos());//.zPos(height_ - sources[0].zPos()); //case 2

        // front wall/ceiling
        mirrors[Properties::FRONT_CEILING].xPos(sources[0].xPos());
        mirrors[Properties::FRONT_CEILING].yPos(mirrors[Properties::FRONT].yPos());//.yPos(depth_ - sources[0].yPos()); //case 4
        mirrors[Properties::FRONT_CEILING].zPos(mirrors[Properties::CEILING].zPos());//.zPos(-height_ - sources[0].zPos()); //case 1

        // rear wall/ceiling
        mirrors[Properties::REAR_CEILING].xPos(sources[0].xPos());
        mirrors[Properties::REAR_CEILING].yPos(mirrors[Properties::REAR].yPos());//.yPos(-depth_ - sources[0].yPos());  //case 3
        mirrors[Properties::REAR_CEILING].zPos(mirrors[Properties::CEILING].zPos());//.zPos(-height_ - sources[0].zPos()); // case 1
    }
    mirrorFlag_ = false;
    mics.flag(true);
}

short Room::reflOrder() const
{
    return reflOrder_;
}

// vim:sw=4:et:cindent:
