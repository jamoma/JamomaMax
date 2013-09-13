/** @file
 *
 * @ingroup maxLibrary
 *
 * @brief A base class for Jamoma models
 *
 * @details
 *
 * @authors Théo de la Hogue
 *
 * @copyright © 2013, Théo de la Hogue @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */

#include "TTModel.h"

#define thisTTClass			TTModel
#define thisTTClassName		"Model"
#define thisTTClassTags		"model"

TT_MODULAR_CONSTRUCTOR,
mClass(kTTSymEmpty)
{
    TT_ASSERT("Correct number of args to create TTModel", arguments.size() == 0);
    
    addAttributeWithSetter(Address, kTypeSymbol);
    addAttribute(Class, kTypeSymbol);
    
    addMessage(HelpOpen);
    addMessage(ReferenceOpen);
    
    // cache some attribute for observer notification
    this->findAttribute(kTTSym_address, &addressAttribute);
}


TTModel::~TTModel()
{
    ;
}

TTErr TTModel::setAddress(const TTValue& newValue)
{
    mAddress = newValue[0];
    
    // notify content observers
    addressAttribute->sendNotification(kTTSym_notify, mAddress);	// we use kTTSym_notify because we know that observers are TTCallback
}

TTErr TTModel::HelpOpen()
{
	// opening the model helpfile
	if (mClass != kTTSymEmpty) {
		
		SymbolPtr helpfileName;
		jamoma_edit_filename(*HelpPatcherFormat, gensym((char*)mClass.c_str()), &helpfileName);
		classname_openhelp((char*)helpfileName->s_name);
        
        return kTTErrNone;
	}
    
    return kTTErrGeneric;
}

TTErr TTModel::ReferenceOpen()
{
    // opening the model reference
    if (mClass != kTTSymEmpty) {
        
		SymbolPtr refpagefileName;
		jamoma_edit_filename(*RefpageFormat, gensym((char*)mClass.c_str()), &refpagefileName);
		classname_openrefpage((char*)refpagefileName->s_name);
        
        return kTTErrNone;
	}
    
    return kTTErrGeneric;
}