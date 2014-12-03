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

void model_signal_amenities(TTPtr self, t_symbol *msg, long argc, t_atom *argv)
{
    WrappedModularInstancePtr x = (WrappedModularInstancePtr)self;

    // don't do nothing while internals are processed or the internals table is not availalble
    if (x->iterateInternals || x->internals == NULL)
        return;
    
    TTAddress   modelAdrs, relativeAddress;
    TTObject    aData, aSender;
    TTBoolean   dataInput, dataOutput, audioInput, audioOutput;
    TTValue     v;
    
    // get model:address
    EXTRA->modelInfo->get(kTTSym_address, v);
    modelAdrs = v[0];

    // look into the patcher to know if there are data or audio input and output
    jamoma_patcher_get_input_output(x->patcherPtr, dataInput, dataOutput, audioInput, audioOutput);
    
    if (model_test_amenities(self, TTSymbol("data"))) {
        
        // create internal datas depending on what have been found
        if (dataInput || dataOutput) {
            
            // make internal parameter at data/active address
            if (x->internals->lookup(TTSymbol("data/active"), v)) {
                
                makeInternals_data(x, modelAdrs, TTSymbol("data/active"), gensym("return_data_active"), x->patcherPtr, kTTSym_parameter, aData);
                aData.set(kTTSym_type, kTTSym_boolean);
                aData.set(kTTSym_tags, kTTSym_generic);
                aData.set(kTTSym_description, TTSymbol("this parameter turns on model's data processing"));
                aData.set(kTTSym_valueDefault, YES);
            }
            
            // make an internal sender to access to all in|out instance mute attribute
            if (x->internals->lookup(TTSymbol("data/*.*:mute"), v))
                makeInternals_sender(self, modelAdrs, TTSymbol("data/*.*:mute"), aSender);
        }
        
        if (dataInput && dataOutput) {
            
            // make internal parameter at data/bypass address
            if (x->internals->lookup(TTSymbol("data/bypass"), v)) {
                
                makeInternals_data(x, modelAdrs, TTSymbol("data/bypass"), gensym("return_data_bypass"), x->patcherPtr, kTTSym_parameter, aData);
                aData.set(kTTSym_type, kTTSym_boolean);
                aData.set(kTTSym_tags, kTTSym_generic);
                aData.set(kTTSym_description, TTSymbol("When active, this parameter bypasses the model's data processing algorithm, letting incoming signal pass through unaffected"));
                aData.set(kTTSym_valueDefault, NO);
            }
            
            // make an internal sender to access to all in instance bypass attribute
            if (x->internals->lookup(TTSymbol("data/in.*:bypass"), v))
                makeInternals_sender(self, modelAdrs, TTSymbol("data/in.*:bypass"), aSender);
        }
    }
    
    if (model_test_amenities(self, TTSymbol("audio"))) {
        
        // create internal audio datas depending on what have been found
        if (audioInput || audioOutput) {
            
            // make internal parameter at audio/mute address
            if (x->internals->lookup(TTSymbol("audio/mute"), v)) {
                
                makeInternals_data(x, modelAdrs, TTSymbol("audio/mute"), gensym("return_audio_mute"), x->patcherPtr, kTTSym_parameter, aData);
                aData.set(kTTSym_type, kTTSym_boolean);
                aData.set(kTTSym_tags, kTTSym_generic);
                aData.set(kTTSym_description, TTSymbol("When active, this parameter turns off model's audio processing"));
                aData.set(kTTSym_valueDefault, NO);
            }
            
            // make an internal sender to access to all in|out instance mute attribute
            if (x->internals->lookup(TTSymbol("audio/*.*:mute"), v))
                makeInternals_sender(self, modelAdrs, TTSymbol("audio/*.*:mute"), aSender);
        }
        
        if (audioInput && audioOutput) {
            
            // make internal parameter at audio/bypass address
            if (x->internals->lookup(TTSymbol("audio/bypass"), v)) {
                
                makeInternals_data(x, modelAdrs, TTSymbol("audio/bypass"), gensym("return_audio_bypass"), x->patcherPtr, kTTSym_parameter, aData);
                aData.set(kTTSym_type, kTTSym_boolean);
                aData.set(kTTSym_tags, kTTSym_generic);
                aData.set(kTTSym_description, TTSymbol("When active, this parameter bypasses the model's audio processing algorithm, letting incoming signal pass through unaffected"));
                aData.set(kTTSym_valueDefault, NO);
            }
            
            // make an internal sender to access to all in instance bypass attribute
            if (x->internals->lookup(TTSymbol("audio/in.*:bypass"), v))
                makeInternals_sender(self, modelAdrs, TTSymbol("audio/in.*:bypass"), aSender);
            
            // make internal parameter at data/mix address
            if (x->internals->lookup(TTSymbol("audio/mix"), v)) {
                
                makeInternals_data(x, modelAdrs, TTSymbol("audio/mix"), gensym("return_audio_mix"), x->patcherPtr, kTTSym_parameter, aData);
                aData.set(kTTSym_type, kTTSym_decimal);
                aData.set(kTTSym_tags, kTTSym_generic);
                v = TTValue(0., 100.);
                aData.set(kTTSym_rangeBounds, v);
                aData.set(kTTSym_rangeClipmode, kTTSym_both);
                v = TTValue(100.);
                aData.set(kTTSym_valueDefault, v);							// Assume 100%, so that processed signal is passed through
                aData.set(kTTSym_rampDrive, TTSymbol("max"));
                aData.set(kTTSym_rampFunction, TTSymbol("linear"));
                aData.set(kTTSym_description, TTSymbol("Controls the wet/dry mix in percent"));
            }
            
            // make an internal sender to access to all out instance mix attribute
            if (x->internals->lookup(TTSymbol("audio/out.*:mix"), v))
                makeInternals_sender(self, modelAdrs, TTSymbol("audio/out.*:mix"), aSender);
        }
        
        if (audioOutput) {
            
            // make internal parameter at audio/gain address
            if (x->internals->lookup(TTSymbol("audio/gain"), v)) {
                
                makeInternals_data(x, modelAdrs, TTSymbol("audio/gain"), gensym("return_audio_gain"), x->patcherPtr, kTTSym_parameter, aData);
                aData.set(kTTSym_type, kTTSym_decimal);
                aData.set(kTTSym_tags, kTTSym_generic);
                v = TTValue(0., 127.);
                aData.set(kTTSym_rangeBounds, v);
                aData.set(kTTSym_rangeClipmode, kTTSym_both);
                v = TTValue(100.);
                aData.set(kTTSym_valueDefault, v);
                aData.set(kTTSym_rampDrive, TTSymbol("max"));
                aData.set(kTTSym_rampFunction, TTSymbol("linear"));
                aData.set(kTTSym_description, TTSymbol("Set gain of model's outputs (as MIDI value by default)."));
            }
            
            // make an internal sender to access to all out instance gain attribute
            if (x->internals->lookup(TTSymbol("audio/out.*:gain"), v))
                makeInternals_sender(self, modelAdrs, TTSymbol("audio/out.*:gain"), aSender);
        }
    }
}

void model_signal_return_data_active(TTPtr self, t_symbol *msg, long argc, t_atom *argv)
{
    WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTObject    aSender;
    TTValue     v, out;
	
	if (!x->internals->lookup(TTSymbol("data/*.*:mute"), v)) {
        
        aSender = v[0];
        
        v = TTBoolean(atom_getlong(argv) == 0);
        
        aSender.send(kTTSym_Send, v, out);
    }
}

void model_signal_return_data_bypass(TTPtr self, t_symbol *msg, long argc, t_atom *argv)
{
    WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTObject    aSender;
    TTValue     v, out;
	
	if (!x->internals->lookup(TTSymbol("data/in.*:bypass"), v)) {
        
        aSender = v[0];
        
        jamoma_ttvalue_from_Atom(v, msg, argc, argv);
        
        aSender.send(kTTSym_Send, v, out);
    }
}

void model_signal_return_audio_mute(TTPtr self, t_symbol *msg, long argc, t_atom *argv)
{
    WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTObject    aSender;
    TTValue     v, out;
	
	if (!x->internals->lookup(TTSymbol("audio/*.*:mute"), v)) {
        
        aSender = v[0];
        
        jamoma_ttvalue_from_Atom(v, msg, argc, argv);
        
        aSender.send(kTTSym_Send, v, out);
    }
}

void model_signal_return_audio_bypass(TTPtr self, t_symbol *msg, long argc, t_atom *argv)
{
    WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTObject    aSender;
    TTValue     v, out;
	
	if (!x->internals->lookup(TTSymbol("audio/in.*:bypass"), v)) {
        
        aSender = v[0];
        
        jamoma_ttvalue_from_Atom(v, msg, argc, argv);
        
        aSender.send(kTTSym_Send, v, out);
    }
}

void model_signal_return_audio_mix(TTPtr self, t_symbol *msg, long argc, t_atom *argv)
{
    WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTObject    aSender;
    TTValue     v, out;
	
	if (!x->internals->lookup(TTSymbol("audio/out.*:mix"), v)) {
        
        aSender = v[0];
        
        jamoma_ttvalue_from_Atom(v, msg, argc, argv);
        
        aSender.send(kTTSym_Send, v, out);
    }
}

void model_signal_return_audio_gain(TTPtr self, t_symbol *msg, long argc, t_atom *argv)
{
    WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTObject    aSender;
    TTValue     v, out;
	
	if (!x->internals->lookup(TTSymbol("audio/out.*:gain"), v)) {
        
        aSender = v[0];
        
        jamoma_ttvalue_from_Atom(v, msg, argc, argv);
        
        aSender.send(kTTSym_Send, v, out);
    }
}
