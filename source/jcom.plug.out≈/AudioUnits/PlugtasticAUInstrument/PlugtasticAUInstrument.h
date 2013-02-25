#include "PlugtasticAUInstrumentVersion.h"
#include "AUInstrumentBase.h"
#include "PlugtasticAUInstrumentGraph.h"

#if AU_DEBUG_DISPATCHER
#include "AUDebugDispatcher.h"
#endif

#ifndef __PlugtasticAUInstrument_h__
#define __PlugtasticAUInstrument_h__


/*
// 
static const UInt32 kNumNotes = 12;
static const UInt32 kMaxActiveNotes = 8;

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

const double twopi = 2.0 * 3.14159265358979;
inline double pow5(double x) { double x2 = x*x; return x2*x2*x; }

enum {
	kGlobalVolumeParam = 0,
	//Add your parameters here...
	kNumberOfParameters=1
};

static const CFStringRef kGlobalVolumeName = CFSTR("global volume");
*/
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*
struct TestNote : public SynthNote
{
	virtual					~TestNote() {}
	
	virtual void			Attack(const MusicDeviceNoteParams &inParams)
	{ 
		double sampleRate = SampleRate();
		phase = 0.;
		amp = 0.;
		maxamp = 0.4 * pow(inParams.mVelocity/127., 3.); 
		up_slope = maxamp / (0.1 * sampleRate);
		dn_slope = -maxamp / (0.9 * sampleRate);
		fast_dn_slope = -maxamp / (0.005 * sampleRate);
	}

	virtual Float32			Amplitude() { return amp; } // used for finding quietest note for voice stealing.
	virtual OSStatus		Render(UInt32 inNumFrames, AudioBufferList& inBufferList);
	
	double phase, amp, maxamp;
	double up_slope, dn_slope, fast_dn_slope;
};

class PlugtasticAUInstrument : public AUMonotimbralInstrumentBase
{
	public:
	PlugtasticAUInstrument(ComponentInstance inComponentInstance);
				
	virtual OSStatus			Initialize();
//	virtual OSStatus			Version() { return kPlugtasticAUInstrumentVersion; }
	virtual OSStatus			Version() { return kPlugtasticAUEffectVersion; }
	
	virtual OSStatus			GetParameterInfo(AudioUnitScope inScope, AudioUnitParameterID inParameterID, AudioUnitParameterInfo &outParameterInfo);
	private:
	
	TestNote mTestNotes[kNumNotes];
};
*/

class PlugtasticAUParameters;

// TODO: By far, the easiest way to do this is to subclass AUMIDIEffectBase
// Then operate as in an effect, but use the MIDI methods below to push data from our midi.in# object

class PlugtasticAUInstrument : public AUMIDIEffectBase
{
	PlugtasticAUInstrumentGraph*	mGraph;
	PlugtasticAUParameters*			mParameters;
	
public:
	
	PlugtasticAUInstrument(AudioUnit component);
	
	virtual ~PlugtasticAUInstrument() 
	{
		delete mGraph;
		delete mParameters;
		
#if AU_DEBUG_DISPATCHER
		delete mDebugDispatcher; 
#endif
	}
	
//	virtual	OSStatus GetParameterValueStrings(AudioUnitScope inScope, AudioUnitParameterID inParameterID, CFArrayRef* outStrings);
    
	virtual	OSStatus GetParameterInfo(AudioUnitScope inScope, AudioUnitParameterID inParameterID, AudioUnitParameterInfo &outParameterInfo);
    
//	virtual OSStatus GetPropertyInfo(AudioUnitPropertyID inID,
//									 AudioUnitScope inScope,
//									 AudioUnitElement inElement,
//									 UInt32& outDataSize,
//									 Boolean& outWritable);
	
	virtual ComponentResult SetParameter(AudioUnitParameterID	inID, 
										 AudioUnitScope			inScope,
										 AudioUnitElement		inElement, 
										 Float32				inValue, 
										 UInt32					inBufferOffsetInFrames);
	
//	virtual void SetParameter(AudioUnitParameterID inID, Float32 inValue);								
	
	virtual OSStatus GetProperty(AudioUnitPropertyID	inID,
								 AudioUnitScope 		inScope,
								 AudioUnitElement 		inElement,
								 void*					outData);
	
 	virtual	bool SupportsTail() 
	{
		return false; 
	}
	
	virtual OSStatus Version() 
	{ 
		return kPlugtasticAUEffectVersion; 
	}
	
	
	// MIDI
	virtual OSStatus		HandleMidiEvent(UInt8 inStatus, UInt8 inChannel, UInt8 inData1, UInt8 inData2, long inStartFrame);
	virtual ComponentResult StartNote(MusicDeviceInstrumentID inInstrument, MusicDeviceGroupID inGroupID, NoteInstanceID &outNoteInstanceID, UInt32 inOffsetSampleFrame, const MusicDeviceNoteParams &inParams);
	virtual ComponentResult StopNote(MusicDeviceGroupID inGroupID, NoteInstanceID inNoteInstanceID, UInt32 inOffsetSampleFrame);
	
	
	
#pragma mark -
#pragma mark audio
	
//	struct PlugtasticScheduledProcessParams {
//		ScheduledProcessParams	au;							// official AU way of doing this
//		AudioBufferList*		sidechainInputBufferList;	// our extension of the struct to pass sidechains
//		AudioBufferList*		sidechainOutputBufferList;
//	};
	
	
	// Our own custom prototype signature so we can do sidechains
	OSStatus ProcessBufferLists(AudioUnitRenderActionFlags&	ioActionFlags, 
								const AudioBufferList&		inBufferList, 
								AudioBufferList&			outBufferList, 
								UInt32						nFrames,
								const AudioBufferList*		inSidechainBufferList,
								AudioBufferList*			outSidechainBufferList);
	
	// Standard AU Override
	virtual OSStatus ProcessBufferLists(AudioUnitRenderActionFlags& iFlags, 
										const AudioBufferList&		inBufferList, 
										AudioBufferList&			outBufferList, 
										UInt32						iFrames);
	
	virtual OSStatus ProcessScheduledSlice(void*		inUserData,
										   UInt32		inStartFrameInBuffer,
										   UInt32		inSliceFramesToProcess,
										   UInt32		inTotalBufferFrames );	
	
	virtual OSStatus Render(AudioUnitRenderActionFlags&	ioActionFlags,
							const AudioTimeStamp&		inTimeStamp,
							UInt32						nFrames);
};


#endif // #ifndef __PlugtasticAUInstrument_h__

