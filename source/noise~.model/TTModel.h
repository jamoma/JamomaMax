/* 
	allpass~.model
	A simple Jamoma 0.6 model, created in C++ rather than in Max.

	By Tim Place, Copyright © 2013

	License: This code is licensed under the terms of the "New BSD License"
	http://creativecommons.org/licenses/BSD/
*/

#include "TTModularClassWrapperMax.h"
#include "ext.h"                                // Max Header
#include "z_dsp.h"                              // MSP Header
#include "ext_obex.h"                           // Max Object Extensions (attributes) Header


class TTModel {
	
    TTObject                mContainer;         // a model is based on a #TTcontainer class
    TTSymbol				mName;              // the name of our model
	TTPtr					mContext;           // the context of our model
    
    TTObject                mApplicationLocal;  // ease the access to our local application
    TTList                  mMembers;           // the name of each registered members

public:
	TTModel(TTSymbol aName, TTPtr aContext) :
    mName(aName),
	mContext(aContext),
    mApplicationLocal(accessApplicationLocal)
	{
		// create container object
		mContainer = TTObject("Container"); // TODO: (optional) pass address callback and value callback (these are both for the activity return mechanism)
		mContainer.set(kTTSym_tag, kTTSym_model);
		
        // register the container object into the local application directly under the root
		TTAddress	address = kTTAdrsRoot.appendAddress(TTAddress(mName));
        TTValue		v, args = TTValue(address, mContainer, mContext);
        mApplicationLocal.send("ObjectRegister", args, v);
		
        // set the effective registration address as container address
		mContainer.set("address", v);
	}
	
	~TTModel()
	{
        TTValue none;
        
        // unregister all members (and destroy them if nobody else references them)
        for (mMembers.begin(); mMembers.end(); mMembers.end())
        {
            TTAddress address = mMembers.current()[0];
            mApplicationLocal.send("ObjectUnregister", address, none);
        }
	}
	
	/** Create a data object -- used by the creators for parameter/message/return */
	TTErr createData(TTSymbol aName, TTSymbol aServiceName, TTFunctionWithBatonAndValue aCallbackFunction, TTPtr aBaton, TTObject& dataObject)
	{
        // create a data object
		dataObject = TTObject("Data", aServiceName);
        dataObject.set("baton",	aBaton);
		dataObject.set("function", TTPtr(aCallbackFunction));
        
        // register the data object into the local application under a /mName/aName address
		TTAddress   address = kTTAdrsRoot.appendAddress(TTAddress(mName)).appendAddress(TTAddress(aName));
        TTValue     v, args = TTValue(address, dataObject);
        mApplicationLocal.send("ObjectRegister", args, v);
        
        // remember its effective registration address to unregister it later
        mMembers.append(v);
        
		return kTTErrNone;
	}
	
    
	TTErr createParameter(TTSymbol aName, TTFunctionWithBatonAndValue aCallbackFunction, TTPtr aBaton, TTSymbol aType, TTSymbol aDescription, TTValue aDefaultValue)
	{
        TTObject parameterObject;
		TTErr err = createData(aName, kTTSym_parameter, aCallbackFunction, aBaton, parameterObject);
        
        // set attributes
        if (!err) {
            
            parameterObject.set("type", aType);
            parameterObject.set("description", aDescription);
            parameterObject.set("defaultValue", aDescription);
        }
        
        return err;
	}

	
	TTErr createMessage(TTSymbol aName, TTFunctionWithBatonAndValue aCallbackFunction, TTPtr aBaton, TTSymbol aType, TTSymbol aDescription)
	{
		TTObject messageObject;
		TTErr err = createData(aName, kTTSym_message, aCallbackFunction, aBaton, messageObject);
        
        // set attributes
        if (!err) {
            
            messageObject.set("type", aType);
            messageObject.set("description", aDescription);
        }
        
        return err;
	}

	
	TTErr createReturn(TTSymbol aName, TTFunctionWithBatonAndValue aCallbackFunction, TTPtr aBaton, TTSymbol aType, TTSymbol aDescription)
	{
		TTObject returnObject;
		TTErr err = createData(aName, kTTSym_return, aCallbackFunction, aBaton, returnObject);
        
        // set attributes
        if (!err) {
            
            returnObject.set("type", aType);
            returnObject.set("description", aDescription);
        }
        
        return err;
	}

	
	TTErr createInput(TTSymbol aName, TTObject& inputAudioObject)
	{
        // create a audio input object
		inputAudioObject =  TTObject("Input.audio");
		
        // register the audio input object into the local application under a /mName/audio/in.aName address
		TTAddress   address = kTTAdrsRoot.appendAddress(TTAddress(mName)).appendAddress(TTAddress("audio/in")).appendInstance(TTAddress(aName));
        TTValue     v, args = TTValue(address, inputAudioObject);
        mApplicationLocal.send("ObjectRegister", args, v);
        
        // remember its effective registration address to unregister it later
        mMembers.append(v);
        
		return kTTErrNone;
	}
		
	
	TTErr createOutput(TTSymbol aName, TTObject& outputAudioObject)
	{
        // create a audio output object
		outputAudioObject =  TTObject("Output.audio");
		
        // register the audio output object into the local application under a /mName/audio/out.aName address
		TTAddress   address = kTTAdrsRoot.appendAddress(TTAddress(mName)).appendAddress(TTAddress("audio/out")).appendInstance(TTAddress(aName));
        TTValue     v, args = TTValue(address, outputAudioObject);
        mApplicationLocal.send("ObjectRegister", args, v);
        
        // remember its effective registration address to unregister it later
        mMembers.append(v);
        
		return kTTErrNone;
	}
	
    TTErr createPresetManager()
	{
        // create a preset manager object
		TTObject presetManagerObject =  TTObject("PresetManager");
		
        // register the preset manager object into the local application under a /mName/preset address
		TTAddress   address = kTTAdrsRoot.appendAddress(TTAddress(mName)).appendAddress(TTAddress("preset"));
        TTValue     v, args = TTValue(address, presetManagerObject);
        mApplicationLocal.send("ObjectRegister", args, v);
        
        // remember its effective registration address to unregister it later
        mMembers.append(v);
        
        // TODO: tell it to load a preset
		// 1. create TTXMLHandler object
		// 2. set the object attr of the above object to be the PresetManager
		// 3. send read message to the TTXMLHandler w/ the filepath as an argument
		// 4. send recall message on the PresetManager
		// 5. free the TTXMLHandler
        
		return kTTErrNone;
	}


	void init()
	{
		mContainer.send("Init");
	}
	
};

