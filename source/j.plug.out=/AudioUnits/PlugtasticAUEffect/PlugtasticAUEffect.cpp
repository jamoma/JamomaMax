#include "PlugtasticAUEffect.h"


COMPONENT_ENTRY(PlugtasticAUEffect)


PlugtasticAUEffect::PlugtasticAUEffect(AudioUnit component) : 
AUEffectBase::AUEffectBase(component, false)
{	
	CreateElements();
	Globals()->UseIndexedParameters(kNumberOfParameters);

#ifdef PlugtasticAUEffect_HasSidechainInput	
	// defaults to 1 for PlugtasticAUEffect
	OSStatus status = SetBusCount(kAudioUnitScope_Input, 2);
	TT_ASSERT(setBusCount, status == noErr);
#endif
	
#if AU_DEBUG_DISPATCHER
	mDebugDispatcher = new AUDebugDispatcher (this);
#endif
	
	mGraph = new PlugtasticAUEffectGraph;
	mParameters = new PlugtasticAUParameters;
	mParameters->setDefaults(this);
}


OSStatus PlugtasticAUEffect::GetParameterValueStrings(AudioUnitScope		inScope,
													  AudioUnitParameterID	inParameterID,
													  CFArrayRef*			outStrings)
{
    return kAudioUnitErr_InvalidProperty;
}


OSStatus PlugtasticAUEffect::GetParameterInfo(AudioUnitScope			inScope,
											  AudioUnitParameterID		inParameterID,
											  AudioUnitParameterInfo	&outParameterInfo )
{
	return mParameters->getInfo(inScope, inParameterID, outParameterInfo);
}


OSStatus PlugtasticAUEffect::GetPropertyInfo(AudioUnitPropertyID	inID,
											 AudioUnitScope			inScope,
											 AudioUnitElement		inElement,
											 UInt32&				outDataSize,
											 Boolean&				outWritable)
{
	return AUEffectBase::GetPropertyInfo(inID, inScope, inElement, outDataSize, outWritable);
}


OSStatus PlugtasticAUEffect::GetProperty(AudioUnitPropertyID	inID,
										 AudioUnitScope 		inScope,
										 AudioUnitElement		inElement,
										 void*					outData)
{
	return AUEffectBase::GetProperty(inID, inScope, inElement, outData);
}


ComponentResult PlugtasticAUEffect::SetParameter(AudioUnitParameterID	inID, 
												 AudioUnitScope			inScope,
												 AudioUnitElement		inElement, 
												 Float32				inValue, 
												 UInt32					inBufferOffsetInFrames)
{
	mParameters->setParameter(mGraph, inID,inValue);
    return AUBase::SetParameter(inID, inScope, inElement, inValue, inBufferOffsetInFrames);
}


void PlugtasticAUEffect::SetParameter(AudioUnitParameterID inID, Float32 inValue)
{
	mParameters->setParameter(mGraph, inID, inValue);
	AUEffectBase::SetParameter(inID, inValue);
}


// Added for Plugtastic so we can do sidechains
// note that we use pointers for sidechains instead of references so that we can easily check for NULL
OSStatus PlugtasticAUEffect::ProcessBufferLists(AudioUnitRenderActionFlags&	ioActionFlags, 
												const AudioBufferList&		inBufferList, 
												AudioBufferList&			outBufferList, 
												UInt32						nFrames,
												const AudioBufferList*		inSidechainBufferList,
												AudioBufferList*			outSidechainBufferList)
{
	mGraph->mVectorSize = nFrames;
	mGraph->process(&inBufferList, &outBufferList, inSidechainBufferList, outSidechainBufferList);
	
	// This flag can be set in a render input callback (or in the audio unit's render operation itself) 
    // and is used to indicate that the render buffer contains only silence. It can then be used by the 
    // caller as a hint to whether the buffer needs to be processed or not.
    ioActionFlags &= ~kAudioUnitRenderAction_OutputIsSilence;
	
    return noErr; 
}


OSStatus PlugtasticAUEffect::ProcessBufferLists(AudioUnitRenderActionFlags& ioActionFlags, 
												const AudioBufferList& inBufferList, 
												AudioBufferList& outBufferList, 
												UInt32 nFrames) 
{ 
	return ProcessBufferLists(ioActionFlags, inBufferList, outBufferList, nFrames, NULL, NULL);
}


// ____________________________________________________________________________
//
//	This method is called (potentially repeatedly) by ProcessForScheduledParams()
//	in order to perform the actual DSP required for this portion of the entire buffer
//	being processed.  The entire buffer can be divided up into smaller "slices"
//	according to the timestamps on the scheduled parameters...
//
OSStatus PlugtasticAUEffect::ProcessScheduledSlice(	void				*inUserData,
												   UInt32				inStartFrameInBuffer,
												   UInt32				inSliceFramesToProcess,
												   UInt32				inTotalBufferFrames )
{
	PlugtasticScheduledProcessParams&	sliceParams = *((PlugtasticScheduledProcessParams*)inUserData);
	AudioUnitRenderActionFlags&			actionFlags = *sliceParams.au.actionFlags;
	AudioBufferList&					inputBufferList = *sliceParams.au.inputBufferList;
	AudioBufferList&					outputBufferList = *sliceParams.au.outputBufferList;
	AudioBufferList*					sidechainInputBufferList = sliceParams.sidechainInputBufferList;
	AudioBufferList*					sidechainOutputBufferList = sliceParams.sidechainOutputBufferList;
	
	// fix the size of the buffer we're operating on before we render this slice of time
	for (unsigned int i=0; i < inputBufferList.mNumberBuffers; i++) {
		inputBufferList.mBuffers[i].mDataByteSize = (inputBufferList.mBuffers[i].mNumberChannels * inSliceFramesToProcess * sizeof(AudioUnitSampleType));
	}
	
	for (unsigned int i = 0; i < outputBufferList.mNumberBuffers; i++) {
		outputBufferList.mBuffers[i].mDataByteSize = (outputBufferList.mBuffers[i].mNumberChannels * inSliceFramesToProcess * sizeof(AudioUnitSampleType));
	}
	
	// process the buffer
	OSStatus result = ProcessBufferLists(actionFlags, inputBufferList, outputBufferList, inSliceFramesToProcess, sidechainInputBufferList, sidechainOutputBufferList);
	
	// we just partially processed the buffers, so increment the data pointers to the next part of the buffer to process
	for (unsigned int i = 0; i < inputBufferList.mNumberBuffers; i++) {
		inputBufferList.mBuffers[i].mData = (AudioUnitSampleType *)inputBufferList.mBuffers[i].mData + inputBufferList.mBuffers[i].mNumberChannels * inSliceFramesToProcess;
	}
	
	for (unsigned int i = 0; i < outputBufferList.mNumberBuffers; i++) {
		outputBufferList.mBuffers[i].mData = (AudioUnitSampleType *)outputBufferList.mBuffers[i].mData + outputBufferList.mBuffers[i].mNumberChannels * inSliceFramesToProcess;
	}
	
	return result;
}


OSStatus PlugtasticAUEffect::Render(AudioUnitRenderActionFlags&	ioActionFlags,
									const AudioTimeStamp&		inTimeStamp,
									UInt32						nFrames)
{
	if (!HasInput(0))
		return kAudioUnitErr_NoConnection;
	
	OSStatus			result = noErr;
	AUOutputElement*	theOutput = GetOutput(0);			// throws if error	
	AUInputElement*		theInput = GetInput(0);
	AUOutputElement*	theSidechainOutput = NULL;	
	AUInputElement*		theSidechainInput = NULL;	
	
#ifdef PlugtasticAUEffect_HasSidechainOutput
	theSidechainOutput = GetOutput(1);	// throws if error	
#endif
#ifdef PlugtasticAUEffect_HasSidechainInput
	theSidechainInput = GetInput(1);	
#endif
	
	result = theInput->PullInput(ioActionFlags, inTimeStamp, 0 /* element */, nFrames);
	if (theSidechainInput && result == noErr)
		result = theSidechainInput->PullInput(ioActionFlags, inTimeStamp, 0 /* element */, nFrames);
	
	if (result == noErr) {
		if (ProcessesInPlace() && theOutput->WillAllocateBuffer()) {
			theOutput->SetBufferList(theInput->GetBufferList() );
		}
		
		if (ShouldBypassEffect()) {
			// leave silence bit alone
			
			if (!ProcessesInPlace()) {
				theInput->CopyBufferContentsTo (theOutput->GetBufferList());
			}
		}
		else {
			if (mParamList.size() == 0 ) {
				// this will read/write silence bit
#ifdef PlugtasticAUEffect_HasSidechainInput
				result = ProcessBufferLists(ioActionFlags, theInput->GetBufferList(), theOutput->GetBufferList(), nFrames, &theSidechainInput->GetBufferList(), NULL);
#else
				result = ProcessBufferLists(ioActionFlags, theInput->GetBufferList(), theOutput->GetBufferList(), nFrames);
#endif
			}
			else {
				// deal with scheduled parameters...
				
				AudioBufferList& inputBufferList = theInput->GetBufferList();
				AudioBufferList& outputBufferList = theOutput->GetBufferList();
				AudioBufferList* sidechainInputBufferList = NULL;
				AudioBufferList* sidechainOutputBufferList = NULL;
				
#ifdef PlugtasticAUEffect_HasSidechainOutput
				sidechainOutputBufferList = &theSidechainOutput->GetBufferList();
#endif
#ifdef PlugtasticAUEffect_HasSidechainInput
				sidechainInputBufferList = &theSidechainInput->GetBufferList();
#endif
				
				PlugtasticScheduledProcessParams processParams;
				processParams.au.actionFlags = &ioActionFlags;
				processParams.au.inputBufferList = &inputBufferList;
				processParams.au.outputBufferList = &outputBufferList;
				processParams.sidechainInputBufferList = sidechainInputBufferList;
				processParams.sidechainOutputBufferList = sidechainOutputBufferList;
				
				// divide up the buffer into slices according to scheduled params then
				// do the DSP for each slice (ProcessScheduledSlice() called for each slice)
				result = ProcessForScheduledParams(mParamList, nFrames, &processParams);
				
				// fixup the buffer pointers to how they were before we started
				for (unsigned int i=0; i < inputBufferList.mNumberBuffers; i++ ) {
					inputBufferList.mBuffers[i].mData = (AudioUnitSampleType *)inputBufferList.mBuffers[i].mData - inputBufferList.mBuffers[i].mNumberChannels * nFrames;
					inputBufferList.mBuffers[i].mDataByteSize = (inputBufferList.mBuffers[i].mNumberChannels * nFrames * sizeof(AudioUnitSampleType));
				}
				
				for (unsigned int i=0; i < outputBufferList.mNumberBuffers; i++ ) {
					outputBufferList.mBuffers[i].mData = (AudioUnitSampleType *)outputBufferList.mBuffers[i].mData - outputBufferList.mBuffers[i].mNumberChannels * nFrames;
					outputBufferList.mBuffers[i].mDataByteSize = (outputBufferList.mBuffers[i].mNumberChannels * nFrames * sizeof(AudioUnitSampleType));
				}
			}
		}
		
		if ((ioActionFlags & kAudioUnitRenderAction_OutputIsSilence) && !ProcessesInPlace()) {
			AUBufferList::ZeroBuffer(theOutput->GetBufferList() );
		}
	}
	
	return result;
}

