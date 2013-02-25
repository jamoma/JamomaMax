#include "AUEffectBase.h"
#include "PlugtasticAUEffectVersion.h"
#include "PlugtasticAUEffectGraph.h"

#if AU_DEBUG_DISPATCHER
#include "AUDebugDispatcher.h"
#endif


#ifndef __PlugtasticAUEffect_h__
#define __PlugtasticAUEffect_h__

class PlugtasticAUParameters;

class PlugtasticAUEffect : public AUEffectBase
{
	PlugtasticAUEffectGraph*	mGraph;
	PlugtasticAUParameters*		mParameters;
	
public:
	
	PlugtasticAUEffect(AudioUnit component);
	
	virtual ~PlugtasticAUEffect() 
	{
		delete mGraph;
		delete mParameters;
		
#if AU_DEBUG_DISPATCHER
		delete mDebugDispatcher; 
#endif
	}
	
	virtual	OSStatus GetParameterValueStrings(AudioUnitScope inScope, AudioUnitParameterID inParameterID, CFArrayRef* outStrings);
    
	virtual	OSStatus GetParameterInfo(AudioUnitScope inScope, AudioUnitParameterID inParameterID, AudioUnitParameterInfo &outParameterInfo);
    
	virtual OSStatus GetPropertyInfo(AudioUnitPropertyID inID,
									 AudioUnitScope inScope,
									 AudioUnitElement inElement,
									 UInt32& outDataSize,
									 Boolean& outWritable);
	
	virtual ComponentResult SetParameter(AudioUnitParameterID	inID, 
										 AudioUnitScope			inScope,
										 AudioUnitElement		inElement, 
										 Float32				inValue, 
										 UInt32					inBufferOffsetInFrames);
	
	virtual void SetParameter(AudioUnitParameterID inID, Float32 inValue);								
	
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
	
	
#pragma mark -
#pragma mark audio
	
	struct PlugtasticScheduledProcessParams {
		ScheduledProcessParams	au;							// official AU way of doing this
		AudioBufferList*		sidechainInputBufferList;	// our extension of the struct to pass sidechains
		AudioBufferList*		sidechainOutputBufferList;
	};
	
	
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


#endif // __PlugtasticAUEffect_h__
