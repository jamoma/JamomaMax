/** @file
 *
 * @ingroup maxLibrary
 *
 * @brief A base class for j.ui info
 *
 * @details
 *
 * @authors Théo de la Hogue
 *
 * @copyright © 2013, Théo de la Hogue @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */

#include "TTUiInfo.h"

#define thisTTClass			TTUiInfo
#define thisTTClassName		"UiInfo"
#define thisTTClassTags		"ui info"

TT_MODULAR_CONSTRUCTOR,
mFreeze(NO)
{
    TT_ASSERT("Correct number of args to create TTUiInfo", arguments.size() == 1);
    
    if (arguments.size() == 1)
        if (arguments[0].type() == kTypePointer)
            mObject = (t_ui*)(TTPtr(arguments[0]));
    
    addAttributeWithGetterAndSetter(Size, kTypeLocalValue);
    addAttributeWithSetter(Freeze, kTypeBoolean);
    
    addMessageWithArguments(ColorContentBackground);
    addMessageWithArguments(ColorToolbarBackground);
    addMessageWithArguments(ColorToolbarText);
    addMessageWithArguments(ColorBorder);
    addMessage(Panel);
}


TTUiInfo::~TTUiInfo()
{
    ;
}

TTErr TTUiInfo::setSize(const TTValue& newValue)
{
    t_rect* rect;
    
	rect = (t_rect*)malloc(sizeof(t_rect));
	rect->x = 0;
	rect->y = 0;
	rect->width = TTUInt32(newValue[0]);
	rect->height = TTUInt32(newValue[1]);
    
	object_attr_set_rect((ObjectPtr)mObject, _sym_presentation_rect, rect);
	
	jbox_redraw(&mObject->box);
	free(rect);
    
    return kTTErrNone;
}

TTErr TTUiInfo::getSize(TTValue& value)
{
    value = TTValue(TTUInt32(mObject->box.b_presentation_rect.width));
    value.append(TTUInt32(mObject->box.b_presentation_rect.height));
    
    return kTTErrNone;
}

TTErr TTUiInfo::setFreeze(const TTValue& newValue)
{
    long		argc = 0;
	AtomPtr		argv = NULL;
    TTNodePtr   modelNode;
    TTErr       err;
	
    mFreeze = newValue;
    
	// get the TTContainer object of the view patch
    err = JamomaDirectory->getTTNode(mObject->viewAddress, &modelNode);
    
    if (!err) {
        
        if (modelNode->getObject()) {
            
            jamoma_ttvalue_to_Atom(mFreeze, &argc, &argv);
            
            // set freeze attribute to all j.remote (on 3 levels only as we don't have the // operator)
            jamoma_container_send(TTContainerPtr(modelNode->getObject()), gensym("*.*:freeze"), argc, argv);
            jamoma_container_send(TTContainerPtr(modelNode->getObject()), gensym("*.*/*.*:freeze"), argc, argv);
            jamoma_container_send(TTContainerPtr(modelNode->getObject()), gensym("*.*/*.*/*.*:freeze"), argc, argv);
            
            return kTTErrNone;
        }
    }
    
    return kTTErrGeneric;
}

TTErr TTUiInfo::ColorContentBackground(const TTValue& inputValue, TTValue& outputValue)
{
    long		argc = 0;
	AtomPtr		argv = NULL;
    
    jamoma_ttvalue_to_Atom(inputValue, &argc, &argv);
    
	// Colors default to "0". If default value is passed, we avoid setting the color, in order to stick to object defaults.
	if (argc > 1) {
        
		object_attr_setvalueof(mObject, _sym_bgcolor, argc, argv);
        return kTTErrNone;
    }
    
    return kTTErrGeneric;
}

TTErr TTUiInfo::ColorToolbarBackground(const TTValue& inputValue, TTValue& outputValue)
{
    long		argc = 0;
	AtomPtr		argv = NULL;
    
    jamoma_ttvalue_to_Atom(inputValue, &argc, &argv);
    
	if (argc > 1) {
        
		object_attr_setvalueof(mObject, gensym("headercolor"), argc, argv);
        return kTTErrNone;
    }
    
    return kTTErrGeneric;
}

TTErr TTUiInfo::ColorToolbarText(const TTValue& inputValue, TTValue& outputValue)
{
    long		argc = 0;
	AtomPtr		argv = NULL;
    
    jamoma_ttvalue_to_Atom(inputValue, &argc, &argv);
    
	if (argc > 1) {
        
		object_attr_setvalueof(mObject, _sym_textcolor, argc, argv);
        return kTTErrNone;
    }
    
    return kTTErrGeneric;
}

TTErr TTUiInfo::ColorBorder(const TTValue& inputValue, TTValue& outputValue)
{
    long		argc = 0;
	AtomPtr		argv = NULL;
    
    jamoma_ttvalue_to_Atom(inputValue, &argc, &argv);
    
	if (argc > 1) {
        
		object_attr_setvalueof(mObject, gensym("bordercolor"), argc, argv);
		mObject->memo_bordercolor = mObject->bordercolor;
        return kTTErrNone;
	}
    
    return kTTErrGeneric;
}

TTErr TTUiInfo::Panel()
{
	t_atom a;
    
    if (mObject->patcher_panel) {
	
        // open ui panel and set title
        atom_setsym(&a, gensym((char*)mObject->viewAddress.c_str()));
        object_attr_setvalueof(mObject->patcher_panel, _sym_title, 1, &a);
        object_method(mObject->patcher_panel, _sym_vis);
        return kTTErrNone;
    }
    
    return kTTErrGeneric;
}