/** @file
 *
 * @ingroup implementationMaxExternals
 *
 * @brief j.model / j.view - signal features
 *
 * @details
 *
 * @authors Théo de la Hogue, Trond Lossius
 *
 * @copyright Copyright © 2010 Théo de la Hogue @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */


#include "j.model.h"

void model_signal_return_content(TTPtr self, t_symbol* msg, long argc, t_atom* argv)
{
    WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
    TTAddress   modelAdrs;
    TTValue     v;
    
    // get model:address
    EXTRA->modelInfo->getAttributeValue(kTTSym_address, v);
    modelAdrs = v[0];
    
    // to avoid infinite loop (as there are data registrations here)
    if (EXTRA->readingContent)
        return;
    
    EXTRA->readingContent = YES;
    
    TTAddress       relativeAddress;
    TTBoolean       dataInput = NO;
    TTBoolean       dataOutput = NO;
    TTBoolean       audioInput = NO;
    TTBoolean       audioOutput = NO;
    TTObjectBasePtr aData, aSender;
    
    // look the content to know which object exist
    for (long i=0; i<argc; i++) {
        
        relativeAddress = TTAddress(atom_getsym(argv+i)->s_name);
        
        if (relativeAddress.getName() == TTSymbol("in")) {
            
            if (relativeAddress.getParent() == TTAddress("data"))
                dataInput = YES;
            
            else if (relativeAddress.getParent() == TTAddress("audio"))
                audioInput = YES;
            
        }
        else if (relativeAddress.getName() == TTSymbol("out")) {
            
            if (relativeAddress.getParent() == TTAddress("data"))
                dataOutput = YES;
            
            else if (relativeAddress.getParent() == TTAddress("audio"))
                audioOutput = YES;
        }
    }
    
    if (model_test_amenities(self, TTSymbol("data"))) {
        
        // create internal data datas depending on what have been found
        if (dataInput || dataOutput) {
            
            // make internal parameter at data/mute address
            if (x->internals->lookup(TTSymbol("data/mute"), v)) {
                
                makeInternals_data(x, modelAdrs, TTSymbol("data/mute"), gensym("return_data_mute"), x->patcherPtr, kTTSym_parameter, (TTObjectBasePtr*)&aData);
                aData->setAttributeValue(kTTSym_type, kTTSym_boolean);
                aData->setAttributeValue(kTTSym_tag, kTTSym_generic);
                aData->setAttributeValue(kTTSym_description, TTSymbol("When active, this parameter turns off model's data processing"));
                aData->setAttributeValue(kTTSym_valueDefault, NO);
            }
            
            // make an internal sender to access to all in|out instance mute attribute
            if (x->internals->lookup(TTSymbol("data/*.*:mute"), v))
                makeInternals_sender(self, modelAdrs, TTSymbol("data/*.*:mute"), &aSender);
        }
        
        if (dataInput && dataOutput) {
            
            // make internal parameter at data/bypass address
            if (x->internals->lookup(TTSymbol("data/bypass"), v)) {
                
                makeInternals_data(x, modelAdrs, TTSymbol("data/bypass"), gensym("return_data_bypass"), x->patcherPtr, kTTSym_parameter, (TTObjectBasePtr*)&aData);
                aData->setAttributeValue(kTTSym_type, kTTSym_boolean);
                aData->setAttributeValue(kTTSym_tag, kTTSym_generic);
                aData->setAttributeValue(kTTSym_description, TTSymbol("When active, this parameter bypasses the model's data processing algorithm, letting incoming signal pass through unaffected"));
                aData->setAttributeValue(kTTSym_valueDefault, NO);
            }
            
            // make an internal sender to access to all in instance bypass attribute
            if (x->internals->lookup(TTSymbol("data/in.*:bypass"), v))
                makeInternals_sender(self, modelAdrs, TTSymbol("data/in.*:bypass"), &aSender);
        }
        
        if (dataOutput) {
            
            // make internal parameter at data/freeze address
            if (x->internals->lookup(TTSymbol("data/freeze"), v)) {
                
                makeInternals_data(x, modelAdrs, TTSymbol("data/freeze"), gensym("return_data_freeze"), x->patcherPtr, kTTSym_parameter, (TTObjectBasePtr*)&aData);
                aData->setAttributeValue(kTTSym_type, kTTSym_boolean);
                aData->setAttributeValue(kTTSym_tag, kTTSym_generic);
                aData->setAttributeValue(kTTSym_description, TTSymbol("Freezes the last state of model's outputs from the data processing algorithm"));
                aData->setAttributeValue(kTTSym_valueDefault, NO);
            }
            
            // make an internal sender to access to all out instance freeze attribute
            if (x->internals->lookup(TTSymbol("data/out.*:freeze"), v))
                makeInternals_sender(self, modelAdrs, TTSymbol("data/out.*:freeze"), &aSender);
            
            
            // TODO : preview should not be inside the model
            // make internal parameter at data/preview address
            if (x->internals->lookup(TTSymbol("data/preview"), v)) {
                
                makeInternals_data(x, modelAdrs, TTSymbol("data/preview"), gensym("return_data_preview"), x->patcherPtr, kTTSym_parameter, (TTObjectBasePtr*)&aData);
                aData->setAttributeValue(kTTSym_type, kTTSym_boolean);
                aData->setAttributeValue(kTTSym_tag, kTTSym_generic);
                aData->setAttributeValue(kTTSym_description, TTSymbol("Turns on/off preview display of model's outputs from the data processing algorithm"));
                aData->setAttributeValue(kTTSym_valueDefault, NO);
            }
        }
    }
    
    if (model_test_amenities(self, TTSymbol("audio"))) {
        
        // create internal audio datas depending on what have been found
        if (audioInput || audioOutput) {
            
            // make internal parameter at audio/mute address
            if (x->internals->lookup(TTSymbol("audio/mute"), v)) {
                
                makeInternals_data(x, modelAdrs, TTSymbol("audio/mute"), gensym("return_audio_mute"), x->patcherPtr, kTTSym_parameter, (TTObjectBasePtr*)&aData);
                aData->setAttributeValue(kTTSym_type, kTTSym_boolean);
                aData->setAttributeValue(kTTSym_tag, kTTSym_generic);
                aData->setAttributeValue(kTTSym_description, TTSymbol("When active, this parameter turns off model's audio processing"));
                aData->setAttributeValue(kTTSym_valueDefault, NO);
            }
            
            // make an internal sender to access to all in|out instance mute attribute
            if (x->internals->lookup(TTSymbol("audio/*.*:mute"), v))
                makeInternals_sender(self, modelAdrs, TTSymbol("audio/*.*:mute"), &aSender);
        }
        
        if (audioInput && audioOutput) {
            
            // make internal parameter at audio/bypass address
            if (x->internals->lookup(TTSymbol("audio/bypass"), v)) {
                
                makeInternals_data(x, modelAdrs, TTSymbol("audio/bypass"), gensym("return_audio_bypass"), x->patcherPtr, kTTSym_parameter, (TTObjectBasePtr*)&aData);
                aData->setAttributeValue(kTTSym_type, kTTSym_boolean);
                aData->setAttributeValue(kTTSym_tag, kTTSym_generic);
                aData->setAttributeValue(kTTSym_description, TTSymbol("When active, this parameter bypasses the model's audio processing algorithm, letting incoming signal pass through unaffected"));
                aData->setAttributeValue(kTTSym_valueDefault, NO);
            }
            
            // make an internal sender to access to all in instance bypass attribute
            if (x->internals->lookup(TTSymbol("audio/in.*:bypass"), v))
                makeInternals_sender(self, modelAdrs, TTSymbol("audio/in.*:bypass"), &aSender);
            
            // make internal parameter at data/mix address
            if (x->internals->lookup(TTSymbol("audio/mix"), v)) {
                
                makeInternals_data(x, modelAdrs, TTSymbol("audio/mix"), gensym("return_audio_mix"), x->patcherPtr, kTTSym_parameter, (TTObjectBasePtr*)&aData);
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
                makeInternals_sender(self, modelAdrs, TTSymbol("audio/out.*:mix"), &aSender);
        }
        
        if (audioOutput) {
            
            // make internal parameter at audio/gain address
            if (x->internals->lookup(TTSymbol("audio/gain"), v)) {
                
                makeInternals_data(x, modelAdrs, TTSymbol("audio/gain"), gensym("return_audio_gain"), x->patcherPtr, kTTSym_parameter, (TTObjectBasePtr*)&aData);
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
                makeInternals_sender(self, modelAdrs, TTSymbol("audio/out.*:gain"), &aSender);
        }
    }
    
    EXTRA->readingContent = NO;
}

void model_signal_return_data_mute(TTPtr self, t_symbol* msg, long argc, t_atom* argv)
{
    WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTObjectBasePtr aSender;
    TTValue         v, out;
	
	if (!x->internals->lookup(TTSymbol("data/*.*:mute"), v)) {
        
        aSender = v[0];
        
        jamoma_ttvalue_from_Atom(v, msg, argc, argv);
        
        aSender->sendMessage(kTTSym_Send, v, out);
    }
}

void model_signal_return_data_bypass(TTPtr self, t_symbol* msg, long argc, t_atom* argv)
{
    WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTObjectBasePtr aSender;
    TTValue         v, out;
	
	if (!x->internals->lookup(TTSymbol("data/in.*:bypass"), v)) {
        
        aSender = v[0];
        
        jamoma_ttvalue_from_Atom(v, msg, argc, argv);
        
        aSender->sendMessage(kTTSym_Send, v, out);
    }
}

void model_signal_return_data_freeze(TTPtr self, t_symbol* msg, long argc, t_atom* argv)
{
    WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTObjectBasePtr aSender;
    TTValue         v, out;
	
	if (!x->internals->lookup(TTSymbol("data/out.*:freeze"), v)) {
        
        aSender = v[0];
        
        jamoma_ttvalue_from_Atom(v, msg, argc, argv);
        
        aSender->sendMessage(kTTSym_Send, v, out);
    }
}

void model_signal_return_data_preview(TTPtr self, t_symbol* msg, long argc, t_atom* argv)
{
    // do nothing
}

void model_signal_return_audio_mute(TTPtr self, t_symbol* msg, long argc, t_atom* argv)
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

void model_signal_return_audio_bypass(TTPtr self, t_symbol* msg, long argc, t_atom* argv)
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

void model_signal_return_audio_mix(TTPtr self, t_symbol* msg, long argc, t_atom* argv)
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

void model_signal_return_audio_gain(TTPtr self, t_symbol* msg, long argc, t_atom* argv)
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
