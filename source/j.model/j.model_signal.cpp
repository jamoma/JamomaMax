/* 
 *	j.model signal features
 *	External object functions
 *	Copyright © 2010 by Théo de la Hogue
 * 
 * License: This code is licensed under the terms of the GNU LGPL
 * http://www.gnu.org/licenses/lgpl.html 
 */

#include "j.model.h"

void model_signal_return_content(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
    WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
    
    // to avoid infinite loop (as there are data registrations here)
    if (EXTRA->readingContent)
        return;
    
    EXTRA->readingContent = YES;
    
    TTAddress       relativeAddress;
    TTBoolean       flowInput = NO;
    TTBoolean       flowOutput = NO;
    TTBoolean       audioInput = NO;
    TTBoolean       audioOutput = NO;
    TTObjectBasePtr aData, aSender;
    TTValue         v;
    
    // look the content to know which object exist
    for (long i=0; i<argc; i++) {
        
        relativeAddress = TTAddress(atom_getsym(argv+i)->s_name);
        
        if (relativeAddress.getName() == TTSymbol("in")) {
            
            if (relativeAddress.getParent() == TTAddress("flow"))
                flowInput = YES;
            
            else if (relativeAddress.getParent() == TTAddress("audio"))
                audioInput = YES;
            
        }
        else if (relativeAddress.getName() == TTSymbol("out")) {
            
            if (relativeAddress.getParent() == TTAddress("flow"))
                flowOutput = YES;
            
            else if (relativeAddress.getParent() == TTAddress("audio"))
                audioOutput = YES;
        }
    }
	   
    // create internal flow datas depending on what have been found
    if (flowInput || flowOutput) {
        
        // make internal parameter at flow/mute address
        if (x->internals->lookup(TTSymbol("flow/mute"), v)) {
            
            makeInternals_data(x, EXTRA->modelAddress, TTSymbol("flow/mute"), gensym("return_flow_mute"), x->patcherPtr, kTTSym_parameter, (TTObjectBasePtr*)&aData);
            aData->setAttributeValue(kTTSym_type, kTTSym_boolean);
            aData->setAttributeValue(kTTSym_tag, kTTSym_generic);
            aData->setAttributeValue(kTTSym_description, TTSymbol("When active, this parameter turns off model's flow processing"));
        }
        
        // make an internal sender to access to all in|out instance mute attribute
        if (x->internals->lookup(TTSymbol("flow/*.*:mute"), v))
            makeInternals_sender(self, EXTRA->modelAddress, TTSymbol("flow/*.*:mute"), &aSender);
    }
    
    if (flowInput && flowOutput) {
        
        // make internal parameter at flow/bypass address
        if (x->internals->lookup(TTSymbol("flow/bypass"), v)) {
            
            makeInternals_data(x, EXTRA->modelAddress, TTSymbol("flow/bypass"), gensym("return_flow_bypass"), x->patcherPtr, kTTSym_parameter, (TTObjectBasePtr*)&aData);
            aData->setAttributeValue(kTTSym_type, kTTSym_boolean);
            aData->setAttributeValue(kTTSym_tag, kTTSym_generic);
            aData->setAttributeValue(kTTSym_description, TTSymbol("When active, this parameter bypasses the model's flow processing algorithm, letting incoming signal pass through unaffected"));
        }
        
        // make an internal sender to access to all in instance bypass attribute
        if (x->internals->lookup(TTSymbol("flow/in.*:bypass"), v))
            makeInternals_sender(self, EXTRA->modelAddress, TTSymbol("flow/in.*:bypass"), &aSender);
    }
    
    if (flowOutput) {
        
        // make internal parameter at flow/freeze address
        if (x->internals->lookup(TTSymbol("flow/freeze"), v)) {
            
            makeInternals_data(x, EXTRA->modelAddress, TTSymbol("flow/freeze"), gensym("return_flow_freeze"), x->patcherPtr, kTTSym_parameter, (TTObjectBasePtr*)&aData);
            aData->setAttributeValue(kTTSym_type, kTTSym_boolean);
            aData->setAttributeValue(kTTSym_tag, kTTSym_generic);
            aData->setAttributeValue(kTTSym_description, TTSymbol("Freezes the last state of model's outputs from the flow processing algorithm"));
            v = TTValue(NO);
            aData->setAttributeValue(kTTSym_valueDefault, v);
        }
        
        // make an internal sender to access to all out instance freeze attribute
        if (x->internals->lookup(TTSymbol("flow/out.*:freeze"), v))
            makeInternals_sender(self, EXTRA->modelAddress, TTSymbol("flow/out.*:freeze"), &aSender);
        
        
        // TODO : preview should not be inside the model
        // make internal parameter at flow/preview address
        if (x->internals->lookup(TTSymbol("flow/preview"), v)) {
            
            makeInternals_data(x, EXTRA->modelAddress, TTSymbol("flow/preview"), gensym("return_flow_preview"), x->patcherPtr, kTTSym_parameter, (TTObjectBasePtr*)&aData);
            aData->setAttributeValue(kTTSym_type, kTTSym_boolean);
            aData->setAttributeValue(kTTSym_tag, kTTSym_generic);
            aData->setAttributeValue(kTTSym_description, TTSymbol("Turns on/off preview display of model's outputs from the flow processing algorithm"));
            v = TTValue(NO);
            aData->setAttributeValue(kTTSym_valueDefault, v);
        }
    }
    
    // create internal audio datas depending on what have been found
    if (audioInput || audioOutput) {
        
        // make internal parameter at audio/mute address
        if (x->internals->lookup(TTSymbol("audio/mute"), v)) {
            
            makeInternals_data(x, EXTRA->modelAddress, TTSymbol("audio/mute"), gensym("return_audio_mute"), x->patcherPtr, kTTSym_parameter, (TTObjectBasePtr*)&aData);
            aData->setAttributeValue(kTTSym_type, kTTSym_boolean);
            aData->setAttributeValue(kTTSym_tag, kTTSym_generic);
            aData->setAttributeValue(kTTSym_description, TTSymbol("When active, this parameter turns off model's audio processing"));
        }
        
        // make an internal sender to access to all in|out instance mute attribute
        if (x->internals->lookup(TTSymbol("audio/*.*:mute"), v))
            makeInternals_sender(self, EXTRA->modelAddress, TTSymbol("audio/*.*:mute"), &aSender);
    }
    
    if (audioInput && audioOutput) {
        
        // make internal parameter at audio/bypass address
        if (x->internals->lookup(TTSymbol("audio/bypass"), v)) {
            
            makeInternals_data(x, EXTRA->modelAddress, TTSymbol("audio/bypass"), gensym("return_audio_bypass"), x->patcherPtr, kTTSym_parameter, (TTObjectBasePtr*)&aData);
            aData->setAttributeValue(kTTSym_type, kTTSym_boolean);
            aData->setAttributeValue(kTTSym_tag, kTTSym_generic);
            aData->setAttributeValue(kTTSym_description, TTSymbol("When active, this parameter bypasses the model's audio processing algorithm, letting incoming signal pass through unaffected"));
        }
        
        // make an internal sender to access to all in instance bypass attribute
        if (x->internals->lookup(TTSymbol("audio/in.*:bypass"), v))
            makeInternals_sender(self, EXTRA->modelAddress, TTSymbol("audio/in.*:bypass"), &aSender);
        
        // make internal parameter at flow/mix address
        if (x->internals->lookup(TTSymbol("audio/mix"), v)) {
            
            makeInternals_data(x, EXTRA->modelAddress, TTSymbol("audio/mix"), gensym("return_audio_mix"), x->patcherPtr, kTTSym_parameter, (TTObjectBasePtr*)&aData);
            aData->setAttributeValue(kTTSym_type, kTTSym_decimal);
            aData->setAttributeValue(kTTSym_tag, kTTSym_generic);
            v = TTValue(0., 100.);
            aData->setAttributeValue(kTTSym_rangeBounds, v);
            aData->setAttributeValue(kTTSym_rangeClipmode, kTTSym_both);
            v = TTValue(100.);
            aData->setAttributeValue(kTTSym_valueDefault, v);							// Assume 100%, so that processed signal is passed through
            aData->setAttributeValue(kTTSym_rampDrive, TTSymbol("Max"));
            aData->setAttributeValue(kTTSym_rampFunction, TTSymbol("linear"));
            aData->setAttributeValue(kTTSym_description, TTSymbol("Controls the wet/dry mix in percent"));
        }
        
        // make an internal sender to access to all out instance mix attribute
        if (x->internals->lookup(TTSymbol("audio/out.*:mix"), v))
            makeInternals_sender(self, EXTRA->modelAddress, TTSymbol("audio/out.*:mix"), &aSender);
    }
    
    if (audioOutput) {
        
        // make internal parameter at audio/gain address
        if (x->internals->lookup(TTSymbol("audio/gain"), v)) {
            
            makeInternals_data(x, EXTRA->modelAddress, TTSymbol("audio/gain"), gensym("return_audio_gain"), x->patcherPtr, kTTSym_parameter, (TTObjectBasePtr*)&aData);
            aData->setAttributeValue(kTTSym_type, kTTSym_decimal);
            aData->setAttributeValue(kTTSym_tag, kTTSym_generic);
            v = TTValue(0., 127.);
            aData->setAttributeValue(kTTSym_rangeBounds, v);
            aData->setAttributeValue(kTTSym_rangeClipmode, kTTSym_both);
            v = TTValue(100.);
            aData->setAttributeValue(kTTSym_valueDefault, v);
            aData->setAttributeValue(kTTSym_rampDrive, TTSymbol("Max"));
            aData->setAttributeValue(kTTSym_rampFunction, TTSymbol("linear"));
            aData->setAttributeValue(kTTSym_description, TTSymbol("Set gain of model's outputs (as MIDI value by default)."));
        }
        
        // make an internal sender to access to all out instance gain attribute
        if (x->internals->lookup(TTSymbol("audio/out.*:gain"), v))
            makeInternals_sender(self, EXTRA->modelAddress, TTSymbol("audio/out.*:gain"), &aSender);
    }
    
    EXTRA->readingContent = NO;
}

void model_signal_return_flow_mute(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
    WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTObjectBasePtr aSender;
    TTValue         v, out;
	
	if (!x->internals->lookup(TTSymbol("flow/*.*:mute"), v)) {
        
        aSender = v[0];
        
        jamoma_ttvalue_from_Atom(v, msg, argc, argv);
        
        aSender->sendMessage(kTTSym_Send, v, out);
    }
}

void model_signal_return_flow_bypass(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
    WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTObjectBasePtr aSender;
    TTValue         v, out;
	
	if (!x->internals->lookup(TTSymbol("flow/in.*:bypass"), v)) {
        
        aSender = v[0];
        
        jamoma_ttvalue_from_Atom(v, msg, argc, argv);
        
        aSender->sendMessage(kTTSym_Send, v, out);
    }
}

void model_signal_return_flow_freeze(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
    WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTObjectBasePtr aSender;
    TTValue         v, out;
	
	if (!x->internals->lookup(TTSymbol("flow/out.*:freeze"), v)) {
        
        aSender = v[0];
        
        jamoma_ttvalue_from_Atom(v, msg, argc, argv);
        
        aSender->sendMessage(kTTSym_Send, v, out);
    }
}

void model_signal_return_flow_preview(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
    // do nothing
}

void model_signal_return_audio_mute(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
    WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTObjectBasePtr aSender;
    TTValue         v, out;
	
	if (!x->internals->lookup(TTSymbol("audio/*.*:mute"), v)) {
        
        aSender = v[0];
        
        jamoma_ttvalue_from_Atom(v, msg, argc, argv);
        
        aSender->sendMessage(kTTSym_Send, v, out);
    }
}

void model_signal_return_audio_bypass(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
    WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTObjectBasePtr aSender;
    TTValue         v, out;
	
	if (!x->internals->lookup(TTSymbol("audio/in.*:bypass"), v)) {
        
        aSender = v[0];
        
        jamoma_ttvalue_from_Atom(v, msg, argc, argv);
        
        aSender->sendMessage(kTTSym_Send, v, out);
    }
}

void model_signal_return_audio_mix(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
    WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTObjectBasePtr aSender;
    TTValue         v, out;
	
	if (!x->internals->lookup(TTSymbol("audio/out.*:mix"), v)) {
        
        aSender = v[0];
        
        jamoma_ttvalue_from_Atom(v, msg, argc, argv);
        
        aSender->sendMessage(kTTSym_Send, v, out);
    }
}

void model_signal_return_audio_gain(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
    WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTObjectBasePtr aSender;
    TTValue         v, out;
	
	if (!x->internals->lookup(TTSymbol("audio/out.*:gain"), v)) {
        
        aSender = v[0];
        
        jamoma_ttvalue_from_Atom(v, msg, argc, argv);
        
        aSender->sendMessage(kTTSym_Send, v, out);
    }
}
