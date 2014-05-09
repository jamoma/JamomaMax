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

#include "TTModelInfo.h"

#define thisTTClass			TTModelInfo
#define thisTTClassName		"ModelInfo"
#define thisTTClassTags		"model info"

TT_MODULAR_CONSTRUCTOR,
mClass(kTTSymEmpty)
{
    TT_ASSERT("Correct number of args to create TTModelInfo", arguments.size() == 1);
    
    if (arguments.size() == 1)
        if (arguments[0].type() == kTypePointer)
            mObject = (t_object*)(TTPtr(arguments[0]));
    
    addAttributeWithSetter(Address, kTypeSymbol);
    addAttribute(Class, kTypeSymbol);
    
    addMessage(InternalOpen);
    addMessage(HelpOpen);
    addMessage(ReferenceOpen);
    addMessage(ReferenceWrite);
    
    // cache some attribute for observer notification
    this->findAttribute(kTTSym_address, &addressAttribute);
}


TTModelInfo::~TTModelInfo()
{
    ;
}

TTErr TTModelInfo::setAddress(const TTValue& newValue)
{
    mAddress = newValue[0];
    
    // notify content observers
    addressAttribute->sendNotification(kTTSym_notify, mAddress);	// we use kTTSym_notify because we know that observers are TTCallback
    
    return kTTErrNone;
}

void TTModelInfo::setAddressReadOnly(TTBoolean readOnly)
{
    addressAttribute->setreadOnly(readOnly);
}

TTErr TTModelInfo::InternalOpen()
{	
	t_object *p = jamoma_patcher_get(mObject);
	
	object_method(p, _sym_vis);
    
    return kTTErrNone;
}

TTErr TTModelInfo::HelpOpen()
{
	// opening the model helpfile
	if (mClass != kTTSymEmpty) {
		
		t_symbol *helpfileName;
		jamoma_edit_filename(*HelpPatcherFormat, mClass, &helpfileName);
		classname_openhelp((char*)helpfileName->s_name);
        
        return kTTErrNone;
	}
    
    return kTTErrGeneric;
}

TTErr TTModelInfo::ReferenceOpen()
{
    // opening the model reference
    if (mClass != kTTSymEmpty) {
        
		t_symbol *refpagefileName;
		jamoma_edit_filename(*RefpageFormat, mClass, &refpagefileName);
		classname_openrefpage((char*)refpagefileName->s_name);
        
        return kTTErrNone;
	}
    
    return kTTErrGeneric;
}

TTErr TTModelInfo::ReferenceWrite()
{
    object_method(mObject, gensym("reference_write"));
    
    return kTTErrNone;
}

TTErr TTModelInfo::Mute()
{
    /*
     WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
     t_object*					patcher = jamoma_patcher_get((t_object*)x);
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