/*=============================================================================
	PlugtasticAUInstrument.cpp
	
 =============================================================================*/

/*
	This is an example implementation of a sin wave synth using AUInstrumentBase classes
	
	It illustrates a basic usage of these classes
	
	It artificially limits the number of notes at one time to 12, so the note-stealing 
	algorithm is used - you should know how this works!
	
	Most of the work you need to do is defining a Note class (see TestNote). AUInstrument manages the
	creation and destruction of notes, the various stages of a note's lifetime.
	
	The project also defines CA_AUTO_MIDI_MAP (OTHER_C_FLAGS). This adds all the code that is needed
	to map MIDI messages to specific parameter changes. This can be seen in AU Lab's MIDI Editor window
	CA_AUTO_MIDI_MAP is implemented in AUMIDIBase.cpp/.h
*/


#include "PlugtasticAUInstrument.h"

COMPONENT_ENTRY(PlugtasticAUInstrument)

#pragma mark PlugtasticAUInstrument Methods

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//	PlugtasticAUInstrument::PlugtasticAUInstrument
//
// This synth has No inputs, One output
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
PlugtasticAUInstrument::PlugtasticAUInstrument(ComponentInstance inComponentInstance)
//	: AUMonotimbralInstrumentBase(inComponentInstance, 0, 1)
	: AUInstrumentBase(inComponentInstance, 0, 1)
{
	CreateElements();	
	Globals()->UseIndexedParameters (kNumberOfParameters); // we're only defining one param
//	Globals()->SetParameter (kGlobalVolumeParam, 1.0);
	
#if AU_DEBUG_DISPATCHER
	mDebugDispatcher = new AUDebugDispatcher (this);
#endif
	
	mGraph = new PlugtasticAUInstrumentGraph;
	mParameters = new PlugtasticAUParameters;
	mParameters->setDefaults(this);
}

/*
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//	PlugtasticAUInstrument::Initialize
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
OSStatus PlugtasticAUInstrument::Initialize()
{	
	AUMonotimbralInstrumentBase::Initialize();	
	SetNotes(kNumNotes, kMaxActiveNotes, mTestNotes, sizeof(TestNote));
	
	return noErr;
}
*/

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//	PlugtasticAUInstrument::GetParameterInfo
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
OSStatus PlugtasticAUInstrument::GetParameterInfo(AudioUnitScope inScope, AudioUnitParameterID inParameterID, AudioUnitParameterInfo &outParameterInfo)
{
	return mParameters->getInfo(inScope, inParameterID, outParameterInfo);
}




ComponentResult PlugtasticAUInstrument::SetParameter(AudioUnitParameterID	inID, 
												 AudioUnitScope			inScope,
												 AudioUnitElement		inElement, 
												 Float32				inValue, 
												 UInt32					inBufferOffsetInFrames)
{
	mParameters->setParameter(mGraph, inID,inValue);
    return AUBase::SetParameter(inID, inScope, inElement, inValue, inBufferOffsetInFrames);
}


//void PlugtasticAUInstrument::SetParameter(AudioUnitParameterID inID, Float32 inValue)
//{
//	mParameters->setParameter(mGraph, inID, inValue);
//	AUInstrumentBase::SetParameter(inID, inValue);
//}





#pragma mark TestNote Methods

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//	PlugtasticAUInstrument::Render
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
OSStatus		PlugtasticAUInstrument::Render(UInt32 inNumFrames, AudioBufferList& inBufferList)
{
	float *left, *right;
/* ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~	
	Changes to this parameter (kGlobalVolumeParam) are not being de-zippered; 
	Left as an exercise for the reader
 ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ */
	float globalVol = GetGlobalParameter(kGlobalVolumeParam);
	
	int numChans = inBufferList.mNumberBuffers;
	if (numChans > 2) 
		return -1;
	
	left = (float*)inBufferList.mBuffers[0].mData;
	right = numChans == 2 ? (float*)inBufferList.mBuffers[1].mData : 0;

	double sampleRate = SampleRate();
	double freq = Frequency() * (twopi/sampleRate);

	switch (GetState()) {
		case kNoteState_Attacked :
		case kNoteState_Sostenutoed :
		case kNoteState_ReleasedButSostenutoed :
		case kNoteState_ReleasedButSustained : {
				for (UInt32 frame=0; frame<inNumFrames; ++frame) {
					if (amp < maxamp) 
						amp += up_slope;
					float out = pow5(sin(phase)) * amp * globalVol;
					phase += freq;
					if (phase > twopi) 
						phase -= twopi;
					left[frame] += out;
					if (right) 
						right[frame] += out;
				}
			}
			break;
			
		case kNoteState_Released :
			{
				UInt32 endFrame = 0xFFFFFFFF;
				for (UInt32 frame=0; frame<inNumFrames; ++frame)
				{
					if (amp > 0.0) 
						amp += dn_slope;
					else if (endFrame == 0xFFFFFFFF) 
						endFrame = frame;
					float out = pow5(sin(phase)) * amp * globalVol;
					phase += freq;
					left[frame] += out;
					if (right) 
						right[frame] += out;
				}
				if (endFrame != 0xFFFFFFFF)
					NoteEnded(endFrame);
			}
			break;
			
		case kNoteState_FastReleased :
			{
				UInt32 endFrame = 0xFFFFFFFF;
				for (UInt32 frame=0; frame<inNumFrames; ++frame)
				{
					if (amp > 0.0) 
						amp += fast_dn_slope;
					else if (endFrame == 0xFFFFFFFF) 
						endFrame = frame;
					float out = pow5(sin(phase)) * amp * globalVol;
					phase += freq;
					left[frame] += out;
					if (right) 
						right[frame] += out;
				}
				if (endFrame != 0xFFFFFFFF)
					NoteEnded(endFrame);
			}
			break;
		default :
			break;
	}
	
	return noErr;
}

