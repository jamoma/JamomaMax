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
    TT_ASSERT("Correct number of args to create TTModel", arguments.size() == 1);
    
    if (arguments.size() == 1)
        if (arguments[0].type() == kTypePointer)
            mObject = ObjectPtr(TTPtr(arguments[0]));
    
    addAttributeWithSetter(Address, kTypeSymbol);
    addAttribute(Class, kTypeSymbol);
    
    addMessage(InternalOpen);
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
    
    return kTTErrNone;
}

TTErr TTModel::InternalOpen()
{	
	ObjectPtr p = jamoma_patcher_get(mObject);
	
	object_method(p, _sym_vis);
    
    return kTTErrNone;
}

TTErr TTModel::HelpOpen()
{
	// opening the model helpfile
	if (mClass != kTTSymEmpty) {
		
		SymbolPtr helpfileName;
		jamoma_edit_filename(*HelpPatcherFormat, mClass, &helpfileName);
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
		jamoma_edit_filename(*RefpageFormat, mClass, &refpagefileName);
		classname_openrefpage((char*)refpagefileName->s_name);
        
        return kTTErrNone;
	}
    
    return kTTErrGeneric;
}

TTErr TTModel::Mute()
{
    /*
     WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
     ObjectPtr					patcher = jamoma_patcher_get((ObjectPtr)x);
     long						mute;
     t_atom						a[2];
     
     // 'setrock' is the message that is used by pcontrol to enable patcher
     // it was inside former j.in or out. Not sure for what it was used (audio mute maybe...)
     
     if (argc && argv)
        if (atom_gettype(argv) == A_LONG) {
        mute = atom_getlong(argv);
        atom_setlong(a+0, !mute);
        atom_setlong(a+1, 1);
        object_method(patcher, gensym("setrock"), 2, a);
     }
     */
    
    return kTTErrGeneric;
}