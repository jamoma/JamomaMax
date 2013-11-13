/* 
	allpass~.model
	A simple Jamoma 0.6 model, created in C++ rather than in Max.

	By Tim Place, Copyright © 2013

	License: This code is licensed under the terms of the "New BSD License"
	http://creativecommons.org/licenses/BSD/
*/

#include "TTModularClassWrapperMax.h"
#include "ext.h"						// Max Header
#include "z_dsp.h"						// MSP Header
#include "ext_obex.h"					// Max Object Extensions (attributes) Header


class TTModel {
	typedef std::vector<TTObjectBasePtr>	TTModelMemberObjects;
	typedef TTModelMemberObjects::iterator	TTModelMemberIter;
	
	TTPtr					mContext;
	TTSymbol				mName;
	TTContainer*			mContainer;
	TTApplicationPtr		mApplication;
	TTNodeDirectoryPtr		mDirectory;
	TTModelMemberObjects	mMembers;		///< The member TTData, TTInput, TTPresetManager, etc.
	TTModelMemberObjects	mCallbacks;		///< The callbacks used by TTData, TTInput, TTPresetManager, etc.

public:
	TTModel(TTPtr aContext, TTSymbol aName) :
	mContext(aContext),
	mName(aName),
	mContainer(NULL)
	{
		TTValue		args; // TODO: (optional) pass address callback and value callback (these are both for the activity return mechanism)
		TTNodePtr	returnedNode		= NULL;
		TTBoolean	newInstanceCreated	= NO;
		TTAddress	address(mName);

		mApplication = (TTApplicationPtr)TTApplicationManagerGetApplication("Jamoma");
		mDirectory = TTApplicationGetDirectory(TTObjectBasePtr(mApplication));

		TTObjectBaseInstantiate(TTSymbol("Container"), TTObjectBaseHandle(&mContainer), args);
		mContainer->setAttributeValue(kTTSym_tag, kTTSym_model);
		
		mDirectory->TTNodeCreate(address, mContainer, mContext, &returnedNode, &newInstanceCreated);
		mContainer->setAttributeValue("address", address);
	}
	
	~TTModel()
	{
		chuck(TTObjectBaseHandle(&mContainer));
		
		for (TTModelMemberIter i = mMembers.begin(); i != mMembers.begin(); i++) {
			TTObjectBasePtr thing = *i;
			chuck(&thing);
		}
		
		for (TTModelMemberIter i = mMembers.begin(); i != mMembers.begin(); i++) {
			TTObjectBasePtr callback = *i;
			TTObjectBaseRelease(TTObjectBaseHandle(&callback));
		}
	}
	
	/**	Free a single item (container, data, input, output, preset, etc).  Used by destructor. */
	void chuck(TTObjectBaseHandle aThing)
	{
		TTValue vAddress;
		TTSymbol symAddress;
		
		(*aThing)->getAttributeValue(kTTSym_address, vAddress);
		symAddress = vAddress;
		TTAddress address(symAddress);
		mDirectory->TTNodeRemove(address);
		TTObjectBaseRelease(TTObjectBaseHandle(aThing));
	}
	
	/** Create a generic thing -- used by the creators for parameter/message/return */
	TTErr createThing(TTSymbol aServiceName, TTSymbol aName, TTSymbol aType, TTFunctionWithBatonAndValue aCallbackFunction, TTPtr aBaton, TTSymbol aDescription)
	{
		TTCallback*	callback = NULL;
		TTValuePtr	baton = new TTValue(TTPtr(aBaton));
		TTData*		parameter = NULL;
		TTValue		parameter_args, none;
		TTString	name("/");
		TTNodePtr	returnedNode = NULL;
		TTBoolean	newInstanceCreated = NO;
		
		name += aName.string();
		
		TTObjectBaseInstantiate(TTSymbol("callback"), TTObjectBaseHandle(&callback), none);
		callback->setAttributeValue(TTSymbol("baton"),	baton);
		callback->setAttributeValue(TTSymbol("function"), TTPtr(aCallbackFunction));
		
		parameter_args.append(callback);
		parameter_args.append(aServiceName);
		
		TTObjectBaseInstantiate(TTSymbol("Data"), TTObjectBaseHandle(&parameter), parameter_args);
		parameter->setAttributeValue(kTTSym_type, aType);
		parameter->setAttributeValue(kTTSym_description, aDescription);
		
		TTAddress address(TTString(mName.string()) + name);
		mDirectory->TTNodeCreate(address, parameter, mContext, &returnedNode, &newInstanceCreated);
		
		mCallbacks.push_back(callback);
		mMembers.push_back(parameter);
		return kTTErrNone;
	}
	
	
	TTErr createParameter(TTSymbol aName, TTSymbol aType, TTValue aDefaultValue, TTFunctionWithBatonAndValue aCallbackFunction, TTPtr aBaton, TTSymbol aDescription)
	{
		TTErr	err = createThing(kTTSym_parameter, aName, aType, aCallbackFunction, aBaton, aDescription);
		TTData*	parameter = NULL;
		
		if (!err) {
			parameter = (TTData*)mMembers.back();
			parameter->setAttributeValue(kTTSym_valueDefault, aDefaultValue);
		}
		return err;
	}

	
	TTErr createMessage(TTSymbol aName, TTSymbol aType, TTFunctionWithBatonAndValue aCallbackFunction, TTPtr aBaton, TTSymbol aDescription)
	{
		return createThing(kTTSym_message, aName, aType, aCallbackFunction, aBaton, aDescription);
	}

	
	TTErr createReturn(TTSymbol aName, TTSymbol aType, TTFunctionWithBatonAndValue aCallbackFunction, TTPtr aBaton, TTSymbol aDescription)
	{
		return createThing(kTTSym_return, aName, aType, aCallbackFunction, aBaton, aDescription);
	}

	
	TTInputAudio* createInput(TTSymbol aName)
	{
		TTValue			in_args;
		TTString		name("/");
		TTObjectBasePtr	inputObject = NULL;
		TTNodePtr		returnedNode = NULL;
		TTBoolean		newInstanceCreated = NO;
		
		in_args.append(TT("audio"));
		name += aName.string();
		
		TTAddress address(TTString(mName.string()) + name);
		
		TTObjectBaseInstantiate(TTSymbol("Input.audio"), TTObjectBaseHandle(&inputObject), in_args);
		mDirectory->TTNodeCreate(address, inputObject, mContext, &returnedNode, &newInstanceCreated);
		mMembers.push_back(inputObject);
		return (TTInputAudio*)inputObject;
	}
		
	
	TTOutputAudio* createOutput(TTSymbol aName)
	{
		TTValue			out_args;
		TTString		name("/");
		TTObjectBasePtr	outputObject = NULL;
		TTNodePtr		returnedNode = NULL;
		TTBoolean		newInstanceCreated = NO;
				
		out_args.append(TT("audio"));
		name += aName.string();
		
		TTAddress address(TTString(mName.string()) + name);
		
		TTObjectBaseInstantiate(TTSymbol("Output.audio"), TTObjectBaseHandle(&outputObject), out_args);
		mDirectory->TTNodeCreate(address, outputObject, mContext, &returnedNode, &newInstanceCreated);
		mMembers.push_back(outputObject);
		return (TTOutputAudio*)outputObject;
	}
	
	
	TTErr createPresetManager()
	{
		TTValue			preset_args; // no args needed
		TTString		name("/preset");
		TTAddress		address(TTString(mName.string()) + name);
		TTObjectBasePtr	presetManager = NULL;
		TTNodePtr		returnedNode = NULL;
		TTBoolean		newInstanceCreated = NO;
		
		TTObjectBaseInstantiate(kTTSym_PresetManager, TTObjectBaseHandle(&presetManager), preset_args);
		mDirectory->TTNodeCreate(address, presetManager, mContext, &returnedNode, &newInstanceCreated);
		
		presetManager->setAttributeValue("address", TTAddress(name));
		mMembers.push_back(presetManager);
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
		mContainer->sendMessage("Init");
	}
	
};

