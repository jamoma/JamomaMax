/*
	==============================================================================

	This file is part of the ObjectiveMax Library and Framework
	An Objective-C API for writing Max external objects
	Copyright 2007 by Electrotap, LLC.

	------------------------------------------------------------------------------

	ObjectiveMax can be redistributed and/or modified under the terms of the
	GNU General Public License, as published by the Free Software Foundation;
	either version 2 of the License, or (at your option) any later version.

	ObjectiveMax is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with ObjectiveMax; if not, visit www.gnu.org/licenses or write to the
	Free Software Foundation, Inc., 59 Temple Place, Suite 330, 
	Boston, MA 02111-1307 USA

	------------------------------------------------------------------------------

	If you'd like to release a closed-source product which uses ObjectiveMax, 
	commercial licenses are also available.  Visit 
		http://electrotap.com/ObjectiveMax
	for more information.

	==============================================================================
*/

#import "MaxAudioSignal.h"


@implementation MaxAudioSignal

//	TTAudioSignal
//	Wrapper for passing N-channels of audio vectors 
//	Copyright © 2007 by Timothy A. Place
//	License: GNU LGPL

// TODO: The old tt audio signal could point to external memory, or allocate its own for the vectors
// This enum was used to keep trac of which was the case:
// enum selectors{
//	k_mode_local = 1,
//	k_mode_external = 0,
//};


- (id) initWithMaxNumChannels:(long)howMany
{
	[super init];
	self->maxNumChannels = howMany;
	vectors = (float **)malloc(sizeof(float *) * howMany);
	//TODO: should I need to zero the vectors here?  probably...
	return self;
}


- (void) dealloc
{
	free(vectors);
	[super dealloc];
}


- (long) setSamplesForChannel:(long)channel withVector:(float *)newVector
{
	// could check against maxnumchannels here
	vectors[channel] = newVector;
	return 0;
}


+ (short) GetMinNumChannelsForASignal:(MaxAudioSignal*)signal1 andAnotherSignal:(MaxAudioSignal*)signal2
{
	if(signal1->numChannels > signal2->numChannels)
		return signal2->numChannels;
	else
		return signal1->numChannels;
}


@end
