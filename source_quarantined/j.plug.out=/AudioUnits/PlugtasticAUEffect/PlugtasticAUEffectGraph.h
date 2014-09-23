#ifndef __PlugtasticAUEffectGraph_h__
#define __PlugtasticAUEffectGraph_h__


#include "PlugtasticAPI.h"
#include "AUEffectBase.h"


class PlugtasticAUEffectGraph {
	
	TTAudioGraphObjectPtr obj0;
	TTAudioGraphObjectPtr obj1;
	TTAudioGraphObjectPtr obj2;
	TTAudioGraphObjectPtr obj3;

	TTAudioGraphPreprocessData	mInitData;
	TTAudioSignalPtr			mAudioSignal;
	
public:
	
	TTUInt32 mVectorSize;
//	TTUInt32 mNumInputChannels;
	
	
	PlugtasticAUEffectGraph() : 
		obj0(NULL),
		obj1(NULL),
		obj2(NULL),
		obj3(NULL),
		mAudioSignal(NULL)
	{		
// With the initial transition to Jamoma, we are sharing the binaries between Jamoma and compiled plug-ins
// But we need to ultimately isolate these...
//		PlugtasticInit("/Library/Application Support/Plugtastic");
		PlugtasticInit();
		
		TTObjectBaseInstantiate(TT("audio.object"), (TTObjectBasePtr*)&obj0, TTValue(TT("plugtastic.output")));
// TODO: the 'filter' object doesn't exist because it is a class that is buried inside of an extern definition
//		 rather than as a proper extension class !!!
//		TTObjectBaseInstantiate(TT("audio.object"), (TTObjectBasePtr*)&obj1, TTValue(TT("filter")));
		TTObjectBaseInstantiate(TT("audio.object"), (TTObjectBasePtr*)&obj1, TTValue(TT("overdrive")));
		TTObjectBaseInstantiate(TT("audio.object"), (TTObjectBasePtr*)&obj2, TTValue(TT("degrade")));
		
		//	TTObjectBaseInstantiate(TT("audio.object"), (TTObjectBasePtr*)&obj3, TTValue(TT("plugtastic.input")))
		TTObjectBaseInstantiate(TT("audio.object"), (TTObjectBasePtr*)&obj3, TTValue(TT("audio.generator")));
		obj3->addAudioFlag(kTTAudioGraphGenerator);
	
		obj2->connectAudio(obj3);
		obj1->connectAudio(obj2);
		obj0->connectAudio(obj1);
		
		
		obj1->getUnitGenerator()->setAttributeValue(TT("drive"), 9.9);
		obj2->getUnitGenerator()->setAttributeValue(TT("bitdepth"), 24);
	}

	
	virtual ~PlugtasticAUEffectGraph()
	{
		TTObjectBaseRelease((TTObjectBasePtr*)&obj0);
		TTObjectBaseRelease((TTObjectBasePtr*)&obj1);
		TTObjectBaseRelease((TTObjectBasePtr*)&obj2);
		TTObjectBaseRelease((TTObjectBasePtr*)&obj3);
	}
	

	void process(const AudioBufferList* inBufferList, AudioBufferList* outBufferList, const AudioBufferList* sidechainInBufferList, AudioBufferList* sidechainOutBufferList)
	{
		TTUInt32 channel;
		TTUInt32 inChannelCount = inBufferList->mNumberBuffers;
		TTUInt32 outChannelCount = outBufferList->mNumberBuffers;
		
		// copy the input
		obj3->getUnitGenerator()->setAttributeValue(TT("vectorSize"), mVectorSize);
		obj3->getUnitGenerator()->setAttributeValue(TT("maxNumChannels"), inChannelCount);
		obj3->getUnitGenerator()->setAttributeValue(TT("numChannels"), inChannelCount);
		obj3->setOutputNumChannels(0, inChannelCount);

		// TODO: sidechain handling
#ifdef SIDECHAIN_INPUT
		
#endif
		
		
		
// TODO: All of this channel-related stuff can be set once at setup -- it doesn't need to be called every vector!
		
		for (channel=0; channel != inChannelCount; channel++)
			TTAudioGraphGeneratorPtr(obj3->getUnitGenerator())->mBuffer->setVector(channel, mVectorSize, (TTFloat32*)inBufferList->mBuffers[channel].mData);	
		
		// run the graph
		mInitData.vectorSize = mVectorSize;
		
		obj0->lockProcessing();
		obj0->preprocess(mInitData);
		obj0->process(mAudioSignal);
		obj0->unlockProcessing();
		
		// copy the output
		for (channel=0; channel != outChannelCount; channel++)
			mAudioSignal->getVector(channel, mVectorSize, (TTFloat32*)outBufferList->mBuffers[channel].mData);
	}
	
};

#endif // #ifndef __PlugtasticAUEffectGraph_h__


