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
mFreeze(NO),
mHighlight(kTTSym_none)
{
    if (arguments.size() == 1)
        if (arguments[0].type() == kTypePointer)
            mObject = (t_ui*)(TTPtr(arguments[0]));
    
    addAttributeWithGetterAndSetter(Size, kTypeLocalValue);
    addAttributeWithSetter(Freeze, kTypeBoolean);
    addAttributeWithSetter(Highlight, kTypeSymbol);
    
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
    
	object_attr_set_rect((t_object*)mObject, _sym_presentation_rect, rect);
    
    ui_build(mObject);
	
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
	t_atom      *argv = NULL;
    TTNodePtr   modelNode;
    TTErr       err;
    TTObject    modelObject;
	
    mFreeze = newValue;
    
	// get the TTContainer object of the view patch
    err = accessApplicationLocalDirectory->getTTNode(mObject->viewAddress, &modelNode);
    
    if (!err) {
        
        modelObject = modelNode->getObject();
        
        if (modelObject.valid()) {
            
            jamoma_ttvalue_to_Atom(mFreeze, &argc, &argv);
            
            // set freeze attribute to all j.remote (on 3 levels only as we don't have the // operator)
            jamoma_container_send(modelObject, gensym("*.*:freeze"), argc, argv);
            jamoma_container_send(modelObject, gensym("*.*/*.*:freeze"), argc, argv);
            jamoma_container_send(modelObject, gensym("*.*/*.*/*.*:freeze"), argc, argv);
            
            return kTTErrNone;
        }
    }
    
    return kTTErrGeneric;
}

TTErr TTUiInfo::setHighlight(const TTValue& inputValue)
{
	TTSymbol newHighlight = inputValue;
    
    if (inputValue.size() == 0) {
        TTLogWarning("j.ui - Missing argument when attempting to set highlight color.");
        return kTTErrGeneric;
    }
    
    // Filter repetitions
    if (newHighlight != mHighlight) {
        
        if (newHighlight == TTSymbol("none")) {
            mHighlight = newHighlight;
            TTLogMessage("none\n");
        }
        else if (newHighlight == TTSymbol("red")) {
            mHighlight = newHighlight;
            jrgba_set(&mObject->highlightcolor, 1., 0., 0., 1.);
            TTLogMessage("red\n");
        }
        else if (newHighlight == TTSymbol("orange")) {
            mHighlight = newHighlight;
            jrgba_set(&mObject->highlightcolor, 1., 0.5, 0., 1.);
            TTLogMessage("orange\n");
        }
        else if (newHighlight == TTSymbol("yellow")) {
            mHighlight = newHighlight;
            jrgba_set(&mObject->highlightcolor, 1., 1., 0., 1.);
            TTLogMessage("yellow\n");
        }
        else if (newHighlight == TTSymbol("chartreuseGreen")) {
            mHighlight = newHighlight;
            jrgba_set(&mObject->highlightcolor, 0.5, 1., 0., 1.);
            TTLogMessage("chartreuseGreen\n");
        }
        else if (newHighlight == TTSymbol("green")) {
            mHighlight = newHighlight;
            jrgba_set(&mObject->highlightcolor, 0., 1., 0., 1.);
            TTLogMessage("green\n");
        }
        else if (newHighlight == TTSymbol("springGreen")) {
            mHighlight = newHighlight;
            jrgba_set(&mObject->highlightcolor, 0., 1., 0.5, 1.);
            TTLogMessage("springGreen\n");
        }
        else if (newHighlight == TTSymbol("cyan")) {
            mHighlight = newHighlight;
            jrgba_set(&mObject->highlightcolor, 0., 1., 1., 1.);
            TTLogMessage("cyan\n");
        }
        else if (newHighlight == TTSymbol("azure")) {
            mHighlight = newHighlight;
            jrgba_set(&mObject->highlightcolor, 0., 0.5, 1., 1.);
            TTLogMessage("azure\n");
        }
        else if (newHighlight == TTSymbol("blue")) {
            mHighlight = newHighlight;
            jrgba_set(&mObject->highlightcolor, 0., 0., 1., 1.);
            TTLogMessage("blue\n");
        }
        else if (newHighlight == TTSymbol("violet")) {
            mHighlight = newHighlight;
            jrgba_set(&mObject->highlightcolor, 0.5, 0., 1., 1.);
            TTLogMessage("violet\n");
        }
        else if (newHighlight == TTSymbol("magenta")) {
            mHighlight = newHighlight;
            jrgba_set(&mObject->highlightcolor, 1., 0., 1., 1.);
            TTLogMessage("magenta\n");
        }
        else if (newHighlight == TTSymbol("rose")) {
            mHighlight = newHighlight;
            jrgba_set(&mObject->highlightcolor, 1., 0., 0.5, 1.);
            TTLogMessage("rose\n");
        }
        else if (newHighlight == TTSymbol("black")) {
            mHighlight = newHighlight;
            jrgba_set(&mObject->highlightcolor, 0., 0., 0., 1.);
            TTLogMessage("black\n");
        }
        else if (newHighlight == TTSymbol("white")) {
            mHighlight = newHighlight;
            jrgba_set(&mObject->highlightcolor, 1., 1., 1., 1.);
            TTLogMessage("white\n");
        }
        else if (newHighlight == TTSymbol("jamoma")) {
            mHighlight = newHighlight;
            jrgba_set(&mObject->highlightcolor, 0.62, 0., 0.36, 1.);
            TTLogMessage("jamoma\n");
        }
        else {
            TTLogWarning("j.ui - unknown color used for highlighting.\n");
            return kTTErrGeneric;
        }
        
        // Redraw
        jbox_redraw(&mObject->box);
    }
    
    return kTTErrNone;
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