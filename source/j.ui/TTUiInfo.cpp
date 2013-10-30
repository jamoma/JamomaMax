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

TT_MODULAR_CONSTRUCTOR
{
    TT_ASSERT("Correct number of args to create TTUiInfo", arguments.size() == 1);
    
    if (arguments.size() == 1)
        if (arguments[0].type() == kTypePointer)
            mObject = t_uiPtr(TTPtr(arguments[0]));
    
    addAttributeWithGetterAndSetter(Size, kTypeLocalValue);
    
    // set default size value
    mSize = TTValue(TTUInt32(mObject->box.b_presentation_rect.width));
    mSize.append(TTUInt32(mObject->box.b_presentation_rect.height));
}


TTUiInfo::~TTUiInfo()
{
    ;
}

TTErr TTUiInfo::setSize(const TTValue& newValue)
{
    t_rect* rect;
    
    mSize = newValue;
    
	rect = (t_rect*)malloc(sizeof(t_rect));
	rect->x = 0;
	rect->y = 0;
	rect->width = TTUInt32(mSize[0]);
	rect->height = TTUInt32(mSize[1]);
    
	object_attr_set_rect((ObjectPtr)mObject, _sym_presentation_rect, rect);
	
	jbox_redraw(&mObject->box);
	free(rect);
    
    return kTTErrNone;
}

TTErr TTUiInfo::getSize(TTValue& value)
{
    mSize = TTValue(TTUInt32(mObject->box.b_presentation_rect.width));
    mSize.append(TTUInt32(mObject->box.b_presentation_rect.height));
    
    value = mSize;
    
    return kTTErrNone;
}