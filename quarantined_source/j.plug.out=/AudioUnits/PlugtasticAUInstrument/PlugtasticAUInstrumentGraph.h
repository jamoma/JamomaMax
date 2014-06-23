#ifndef __PlugtasticAUGraph_h__
#define __PlugtasticAUGraph_h__

#include "PlugtasticAPI.h"
#include "AUEffectBase.h"
#include "PlugtasticParameter.h"

class PlugtasticAUInstrumentGraph {
	friend class PlugtasticAUParameters;

	TTAudioGraphPreprocessData	mInitData;
	TTAudioSignalPtr			mAudioSignal;
	TTAudioGraphObjectPtr		obj0;
	TTAudioGraphObjectPtr		obj1;
	TTAudioGraphObjectPtr		obj2;
	TTAudioGraphObjectPtr		obj3;
	TTAudioGraphObjectPtr		obj4;
	TTAudioGraphObjectPtr		obj5;
	TTAudioGraphObjectPtr		obj6;
	TTAudioGraphObjectPtr		obj7;
	TTAudioGraphObjectPtr		obj8;
	TTAudioGraphObjectPtr		obj9;
	TTAudioGraphObjectPtr		obj10;
	TTAudioGraphObjectPtr		obj11;
	TTAudioGraphObjectPtr		obj12;
	TTAudioGraphObjectPtr		obj13;
	TTAudioGraphObjectPtr		obj14;
	TTAudioGraphObjectPtr		obj15;
	TTAudioGraphObjectPtr		obj16;
	TTAudioGraphObjectPtr		obj17;
	TTAudioGraphObjectPtr		obj18;
	TTAudioGraphObjectPtr		obj19;
	TTAudioGraphObjectPtr		obj20;
	TTAudioGraphObjectPtr		obj21;
	TTAudioGraphObjectPtr		obj22;
	TTAudioGraphObjectPtr		obj23;
	TTAudioGraphObjectPtr		obj24;
	TTAudioGraphObjectPtr		obj25;
	TTAudioGraphObjectPtr		obj26;

public:
	uint			mVectorSize;

	PlugtasticAUInstrumentGraph() : 
		obj0(NULL),
		obj1(NULL),
		obj2(NULL),
		obj3(NULL),
		obj4(NULL),
		obj5(NULL),
		obj6(NULL),
		obj7(NULL),
		obj8(NULL),
		obj9(NULL),
		obj10(NULL),
		obj11(NULL),
		obj12(NULL),
		obj13(NULL),
		obj14(NULL),
		obj15(NULL),
		obj16(NULL),
		obj17(NULL),
		obj18(NULL),
		obj19(NULL),
		obj20(NULL),
		obj21(NULL),
		obj22(NULL),
		obj23(NULL),
		obj24(NULL),
		obj25(NULL),
		obj26(NULL),
		mAudioSignal(NULL)
	{
		TTValue audioObjectArguments;

		audioObjectArguments.setSize(3);
		PlugtasticInit();
	
		audioObjectArguments.set(0, TT("plugtastic.output"));
		audioObjectArguments.set(1, 2);
		audioObjectArguments.set(2, 1);
		TTObjectBaseInstantiate(TT("audio.object"), (TTObjectBasePtr*)&obj0, audioObjectArguments);
		obj0->mKernel->setAttributeValue(TT("linearGain"), 1.000000);
		obj0->mKernel->setAttributeValue(TT("maxNumChannels"), 0);
		obj0->mKernel->setAttributeValue(TT("midiGain"), 100.000000);
		obj0->mKernel->setAttributeValue(TT("gain"), 0.000000);
		obj0->mKernel->setAttributeValue(TT("bypass"), 0);
		obj0->mKernel->setAttributeValue(TT("mute"), 0);
		obj0->mKernel->setAttributeValue(TT("sampleRate"), 44100u);

		audioObjectArguments.set(0, TT("operator"));
		audioObjectArguments.set(1, 1);
		audioObjectArguments.set(2, 1);
		TTObjectBaseInstantiate(TT("audio.object"), (TTObjectBasePtr*)&obj1, audioObjectArguments);
		obj1->mKernel->setAttributeValue(TT("maxNumChannels"), 0);
		obj1->mKernel->setAttributeValue(TT("operator"), TT("*"));
		obj1->mKernel->setAttributeValue(TT("operand"), 1.000000);
		obj1->mKernel->setAttributeValue(TT("bypass"), 0);
		obj1->mKernel->setAttributeValue(TT("mute"), 0);
		obj1->mKernel->setAttributeValue(TT("sampleRate"), 44100u);

		audioObjectArguments.set(0, TT("wavetable"));
		audioObjectArguments.set(1, 0);
		audioObjectArguments.set(2, 1);
		TTObjectBaseInstantiate(TT("audio.object"), (TTObjectBasePtr*)&obj2, audioObjectArguments);
		obj2->mKernel->setAttributeValue(TT("frequency"), 440.000000);
		obj2->mKernel->setAttributeValue(TT("maxNumChannels"), 1);
		obj2->mKernel->setAttributeValue(TT("size"), 8192u);
		obj2->mKernel->setAttributeValue(TT("gain"), 0.000000);
		obj2->mKernel->setAttributeValue(TT("mode"), TT("sine"));
		obj2->mKernel->setAttributeValue(TT("interpolation"), TT("linear"));
		obj2->mKernel->setAttributeValue(TT("bypass"), 0);
		obj2->mKernel->setAttributeValue(TT("mute"), 0);
		obj2->mKernel->setAttributeValue(TT("sampleRate"), 44100u);

		audioObjectArguments.set(0, TT("operator"));
		audioObjectArguments.set(1, 1);
		audioObjectArguments.set(2, 1);
		TTObjectBaseInstantiate(TT("audio.object"), (TTObjectBasePtr*)&obj3, audioObjectArguments);
		obj3->mKernel->setAttributeValue(TT("maxNumChannels"), 0);
		obj3->mKernel->setAttributeValue(TT("operator"), TT("+"));
		obj3->mKernel->setAttributeValue(TT("operand"), 1.000000);
		obj3->mKernel->setAttributeValue(TT("bypass"), 0);
		obj3->mKernel->setAttributeValue(TT("mute"), 0);
		obj3->mKernel->setAttributeValue(TT("sampleRate"), 44100u);

		audioObjectArguments.set(0, TT("audio.sig"));
		audioObjectArguments.set(1, 1);
		audioObjectArguments.set(2, 1);
		TTObjectBaseInstantiate(TT("audio.object"), (TTObjectBasePtr*)&obj4, audioObjectArguments);
		obj4->mKernel->setAttributeValue(TT("value"), 110.000000);
		obj4->mKernel->setAttributeValue(TT("maxNumChannels"), 0);
		obj4->mKernel->setAttributeValue(TT("bypass"), 0);
		obj4->mKernel->setAttributeValue(TT("mute"), 0);
		obj4->mKernel->setAttributeValue(TT("sampleRate"), 44100u);


		TTObjectBaseInstantiate(TT("graph.object"), (TTObjectBasePtr*)&obj6, TTValue(TT("dataspace")));
		obj6->mKernel->setAttributeValue(TT("inputUnit"), TT("midi"));
		obj6->mKernel->setAttributeValue(TT("outputUnit"), TT("hz"));
		obj6->mKernel->setAttributeValue(TT("dataspace"), TT("time"));
		obj6->mKernel->setAttributeValue(TT("bypass"), 0);


		TTObjectBaseInstantiate(TT("graph.object"), (TTObjectBasePtr*)&obj7, TTValue(TT("midi.filter")));
		obj7->mKernel->setAttributeValue(TT("type"), TT("note"));
		obj7->mKernel->setAttributeValue(TT("bypass"), 0);


		TTObjectBaseInstantiate(TT("graph.object"), (TTObjectBasePtr*)&obj8, TTValue(TT("midi.in")));
		obj8->mKernel->setAttributeValue(TT("owner"), 135826496);
		obj8->mKernel->setAttributeValue(TT("bypass"), 0);
		obj8->mKernel->setAttributeValue(TT("device"), TT("default"));

	obj7->connect(obj8);
	obj6->connect(obj7);
		obj4->connect(obj6);
		obj3->connectAudio(obj4, 0, 0);
		audioObjectArguments.set(0, TT("operator"));
		audioObjectArguments.set(1, 1);
		audioObjectArguments.set(2, 1);
		TTObjectBaseInstantiate(TT("audio.object"), (TTObjectBasePtr*)&obj9, audioObjectArguments);
		obj9->mKernel->setAttributeValue(TT("maxNumChannels"), 0);
		obj9->mKernel->setAttributeValue(TT("operator"), TT("*"));
		obj9->mKernel->setAttributeValue(TT("operand"), 1.000000);
		obj9->mKernel->setAttributeValue(TT("bypass"), 0);
		obj9->mKernel->setAttributeValue(TT("mute"), 0);
		obj9->mKernel->setAttributeValue(TT("sampleRate"), 44100u);

		audioObjectArguments.set(0, TT("wavetable"));
		audioObjectArguments.set(1, 0);
		audioObjectArguments.set(2, 1);
		TTObjectBaseInstantiate(TT("audio.object"), (TTObjectBasePtr*)&obj10, audioObjectArguments);
		obj10->mKernel->setAttributeValue(TT("frequency"), 440.000000);
		obj10->mKernel->setAttributeValue(TT("maxNumChannels"), 1);
		obj10->mKernel->setAttributeValue(TT("size"), 8192u);
		obj10->mKernel->setAttributeValue(TT("gain"), 0.000000);
		obj10->mKernel->setAttributeValue(TT("mode"), TT("sine"));
		obj10->mKernel->setAttributeValue(TT("interpolation"), TT("linear"));
		obj10->mKernel->setAttributeValue(TT("bypass"), 0);
		obj10->mKernel->setAttributeValue(TT("mute"), 0);
		obj10->mKernel->setAttributeValue(TT("sampleRate"), 44100u);

		audioObjectArguments.set(0, TT("operator"));
		audioObjectArguments.set(1, 1);
		audioObjectArguments.set(2, 1);
		TTObjectBaseInstantiate(TT("audio.object"), (TTObjectBasePtr*)&obj11, audioObjectArguments);
		obj11->mKernel->setAttributeValue(TT("maxNumChannels"), 0);
		obj11->mKernel->setAttributeValue(TT("operator"), TT("*"));
		obj11->mKernel->setAttributeValue(TT("operand"), 1.000000);
		obj11->mKernel->setAttributeValue(TT("bypass"), 0);
		obj11->mKernel->setAttributeValue(TT("mute"), 0);
		obj11->mKernel->setAttributeValue(TT("sampleRate"), 44100u);

		obj11->connectAudio(obj4, 0, 0);
		audioObjectArguments.set(0, TT("audio.sig"));
		audioObjectArguments.set(1, 1);
		audioObjectArguments.set(2, 1);
		TTObjectBaseInstantiate(TT("audio.object"), (TTObjectBasePtr*)&obj12, audioObjectArguments);
		obj12->mKernel->setAttributeValue(TT("value"), 10.000000);
		obj12->mKernel->setAttributeValue(TT("maxNumChannels"), 0);
		obj12->mKernel->setAttributeValue(TT("bypass"), 0);
		obj12->mKernel->setAttributeValue(TT("mute"), 0);
		obj12->mKernel->setAttributeValue(TT("sampleRate"), 44100u);

		obj11->connectAudio(obj12, 0, 1);
		obj10->connectAudio(obj11, 0, 0);
		obj9->connectAudio(obj10, 0, 0);
		audioObjectArguments.set(0, TT("operator"));
		audioObjectArguments.set(1, 1);
		audioObjectArguments.set(2, 1);
		TTObjectBaseInstantiate(TT("audio.object"), (TTObjectBasePtr*)&obj16, audioObjectArguments);
		obj16->mKernel->setAttributeValue(TT("maxNumChannels"), 0);
		obj16->mKernel->setAttributeValue(TT("operator"), TT("*"));
		obj16->mKernel->setAttributeValue(TT("operand"), 1.000000);
		obj16->mKernel->setAttributeValue(TT("bypass"), 0);
		obj16->mKernel->setAttributeValue(TT("mute"), 0);
		obj16->mKernel->setAttributeValue(TT("sampleRate"), 44100u);

		obj16->connectAudio(obj11, 0, 0);
		audioObjectArguments.set(0, TT("adsr"));
		audioObjectArguments.set(1, 1);
		audioObjectArguments.set(2, 1);
		TTObjectBaseInstantiate(TT("audio.object"), (TTObjectBasePtr*)&obj17, audioObjectArguments);
		obj17->mKernel->setAttributeValue(TT("sustain"), -12.000000);
		obj17->mKernel->setAttributeValue(TT("release"), 500.000000);
		obj17->mKernel->setAttributeValue(TT("maxNumChannels"), 0);
		obj17->mKernel->setAttributeValue(TT("sampleRate"), 44100u);
		obj17->mKernel->setAttributeValue(TT("attack"), 150.000000);
		obj17->mKernel->setAttributeValue(TT("mode"), TT("hybrid"));
		obj17->mKernel->setAttributeValue(TT("trigger"), 0);
		obj17->mKernel->setAttributeValue(TT("decay"), 150.000000);
		obj17->mKernel->setAttributeValue(TT("mute"), 0);
		obj17->mKernel->setAttributeValue(TT("linearSustain"), 0.251189);
		obj17->mKernel->setAttributeValue(TT("bypass"), 0);

		obj17->connect(obj7);
		obj16->connectAudio(obj17, 0, 1);
		obj9->connectAudio(obj16, 0, 1);
		obj3->connectAudio(obj9, 0, 1);
		obj2->connectAudio(obj3, 0, 0);
		obj1->connectAudio(obj2, 0, 0);
		audioObjectArguments.set(0, TT("adsr"));
		audioObjectArguments.set(1, 1);
		audioObjectArguments.set(2, 1);
		TTObjectBaseInstantiate(TT("audio.object"), (TTObjectBasePtr*)&obj23, audioObjectArguments);
		obj23->mKernel->setAttributeValue(TT("sustain"), -6.000000);
		obj23->mKernel->setAttributeValue(TT("release"), 500.000000);
		obj23->mKernel->setAttributeValue(TT("maxNumChannels"), 0);
		obj23->mKernel->setAttributeValue(TT("sampleRate"), 44100u);
		obj23->mKernel->setAttributeValue(TT("attack"), 50.000000);
		obj23->mKernel->setAttributeValue(TT("mode"), TT("hybrid"));
		obj23->mKernel->setAttributeValue(TT("trigger"), 0);
		obj23->mKernel->setAttributeValue(TT("decay"), 100.000000);
		obj23->mKernel->setAttributeValue(TT("mute"), 0);
		obj23->mKernel->setAttributeValue(TT("linearSustain"), 0.501187);
		obj23->mKernel->setAttributeValue(TT("bypass"), 0);

		obj23->connect(obj7);
		obj1->connectAudio(obj23, 0, 1);
		obj0->connectAudio(obj1, 0, 0);
	}


	virtual ~PlugtasticAUInstrumentGraph()
	{
		TTObjectBaseRelease((TTObjectBasePtr*)&obj0);
		TTObjectBaseRelease((TTObjectBasePtr*)&obj1);
		TTObjectBaseRelease((TTObjectBasePtr*)&obj2);
		TTObjectBaseRelease((TTObjectBasePtr*)&obj3);
		TTObjectBaseRelease((TTObjectBasePtr*)&obj4);
		TTObjectBaseRelease((TTObjectBasePtr*)&obj5);
		TTObjectBaseRelease((TTObjectBasePtr*)&obj6);
		TTObjectBaseRelease((TTObjectBasePtr*)&obj7);
		TTObjectBaseRelease((TTObjectBasePtr*)&obj8);
		TTObjectBaseRelease((TTObjectBasePtr*)&obj9);
		TTObjectBaseRelease((TTObjectBasePtr*)&obj10);
		TTObjectBaseRelease((TTObjectBasePtr*)&obj11);
		TTObjectBaseRelease((TTObjectBasePtr*)&obj12);
		TTObjectBaseRelease((TTObjectBasePtr*)&obj13);
		TTObjectBaseRelease((TTObjectBasePtr*)&obj14);
		TTObjectBaseRelease((TTObjectBasePtr*)&obj15);
		TTObjectBaseRelease((TTObjectBasePtr*)&obj16);
		TTObjectBaseRelease((TTObjectBasePtr*)&obj17);
		TTObjectBaseRelease((TTObjectBasePtr*)&obj18);
		TTObjectBaseRelease((TTObjectBasePtr*)&obj19);
		TTObjectBaseRelease((TTObjectBasePtr*)&obj20);
		TTObjectBaseRelease((TTObjectBasePtr*)&obj21);
		TTObjectBaseRelease((TTObjectBasePtr*)&obj22);
		TTObjectBaseRelease((TTObjectBasePtr*)&obj23);
		TTObjectBaseRelease((TTObjectBasePtr*)&obj24);
		TTObjectBaseRelease((TTObjectBasePtr*)&obj25);
		TTObjectBaseRelease((TTObjectBasePtr*)&obj26);
	}
	

	void process(const AudioBufferList* inBufferList, AudioBufferList* outBufferList, const AudioBufferList* sidechainInBufferList, AudioBufferList* sidechainOutBufferList)
	{
		TTUInt16 channel;
		TTUInt16 inChannelCount = inBufferList->mNumberBuffers;
		TTUInt32 outChannelCount = outBufferList->mNumberBuffers;
		
		// copy the input
		->getUnitGenerator()->setAttributeValue(TT("vectorSize"), mVectorSize);
		->getUnitGenerator()->setAttributeValue(TT("maxNumChannels"), inChannelCount);
		->getUnitGenerator()->setAttributeValue(TT("numChannels"), inChannelCount);
		->setOutputNumChannels(0, inChannelCount);
		
		// TODO: All of this channel-related stuff can be set once at setup -- it doesn't need to be called every vector!
		
		for (channel=0; channel != inChannelCount; channel++)
			TTAudioGraphGeneratorPtr(->getUnitGenerator())->mBuffer->setVector(channel, mVectorSize, (TTFloat32*)inBufferList->mBuffers[channel].mData);
		
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




enum {
	kNumberOfParameters = 0
};

#include "PlugtasticAUInstrument.h"

class PlugtasticAUParameters {
	// we copy this function from the AUBase file, because that file declares this method as a protected member for some reason
	static void FillInParameterName (AudioUnitParameterInfo& ioInfo, CFStringRef inName, bool inShouldRelease)
	{
		ioInfo.cfNameString = inName;
		ioInfo.flags |= kAudioUnitParameterFlag_HasCFNameString;
		if (inShouldRelease)
			ioInfo.flags |= kAudioUnitParameterFlag_CFNameRelease;
		CFStringGetCString(inName, ioInfo.name, offsetof (AudioUnitParameterInfo, clumpID), kCFStringEncodingUTF8);
	}


public:
	OSStatus getInfo(AudioUnitScope inScope, AudioUnitParameterID inParameterID, AudioUnitParameterInfo &outParameterInfo)
	{
		OSStatus result = noErr;

		outParameterInfo.flags = kAudioUnitParameterFlag_IsWritable | kAudioUnitParameterFlag_IsReadable;

	    if (inScope == kAudioUnitScope_Global) {
	        switch (inParameterID) {
	            default:
	                result = kAudioUnitErr_InvalidParameter;
	                break;
			}
		}
		else
	        result = kAudioUnitErr_InvalidParameter;

		return result;
	}
	

	void setDefaults(PlugtasticAUInstrument* self)
	{
	}
	

	void setParameter(PlugtasticAUInstrumentGraph* graph, AudioUnitParameterID inID, Float32 inValue)
	{
		switch (inID) {
			default:
				break;
		}
	}
};


#endif // __PlugtasticAUGraph_h__
