/* 
 *	j.model signal features
 *	External object functions
 *	Copyright © 2010 by Théo de la Hogue
 * 
 * License: This code is licensed under the terms of the GNU LGPL
 * http://www.gnu.org/licenses/lgpl.html 
 */

#include "j.model.h"

void model_signal_subscribe(TTPtr self, TTAddress modelAddress)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	ObjectPtr       obj;
	SymbolPtr       _sym_objclass, _sym_jin, _sym_jout, _sym_jin_tild, _sym_jout_tild;
    TTBoolean       flowInput, flowOutput, audioInput, audioOutput;
    TTObjectBasePtr aData;
    TTValue         v;
	
	obj = object_attr_getobj(x->patcherPtr, _sym_firstobject);
	
	// TODO : cache those t_symbol else where ...
	_sym_jin = gensym("j.in");
	_sym_jin_tild = gensym("j.in~");
	_sym_jout = gensym("j.out");
    _sym_jout_tild = gensym("j.out~");
    
    // look into the patcher to find in and out
    flowInput = NO;
    flowOutput = NO;
    audioInput = NO;
    audioOutput = NO;
    
	while (obj) {
        
		_sym_objclass = object_attr_getsym(obj, _sym_maxclass);
        
		if (_sym_objclass == _sym_jin) flowInput = YES;
        else if (_sym_objclass == _sym_jout) flowOutput = YES;
        else if (_sym_objclass == _sym_jin_tild) audioInput = YES;
        else if (_sym_objclass == _sym_jout_tild) audioOutput = YES;
        
		obj = object_attr_getobj(obj, _sym_nextobject);
	}
    
    // create internal flow datas depending on what have been found
    if (flowInput || flowOutput) {
        
        // make internal parameter at flow/mute address
        makeInternals_data(x, modelAddress, TTSymbol("flow/mute"), gensym("return_flow_mute"), x->patcherPtr, kTTSym_parameter, (TTObjectBasePtr*)&aData);
        aData->setAttributeValue(kTTSym_type, kTTSym_boolean);
        aData->setAttributeValue(kTTSym_tag, kTTSym_generic);
        aData->setAttributeValue(kTTSym_description, TTSymbol("When active, this parameter turns off model's flow processing"));
    }
    
    if (flowInput && flowOutput) {
        
        // make internal parameter at flow/bypass address
        makeInternals_data(x, modelAddress, TTSymbol("flow/bypass"), gensym("return_flow_bypass"), x->patcherPtr, kTTSym_parameter, (TTObjectBasePtr*)&aData);
        aData->setAttributeValue(kTTSym_type, kTTSym_boolean);
        aData->setAttributeValue(kTTSym_tag, kTTSym_generic);
        aData->setAttributeValue(kTTSym_description, TTSymbol("When active, this parameter bypasses the model's flow processing algorithm, letting incoming signal pass through unaffected"));
    }
    
    if (flowOutput) {
        
        // make internal parameter at flow/freeze address
        makeInternals_data(x, modelAddress, TTSymbol("flow/freeze"), gensym("return_flow_freeze"), x->patcherPtr, kTTSym_parameter, (TTObjectBasePtr*)&aData);
        aData->setAttributeValue(kTTSym_type, kTTSym_boolean);
        aData->setAttributeValue(kTTSym_tag, kTTSym_generic);
        aData->setAttributeValue(kTTSym_description, TTSymbol("Freezes the last state of model's outputs from the flow processing algorithm"));
        v = TTValue(NO);
        aData->setAttributeValue(kTTSym_valueDefault, v);
        
        // make internal parameter at flow/preview address
        makeInternals_data(x, modelAddress, TTSymbol("flow/preview"), gensym("return_flow_preview"), x->patcherPtr, kTTSym_parameter, (TTObjectBasePtr*)&aData);
        aData->setAttributeValue(kTTSym_type, kTTSym_boolean);
        aData->setAttributeValue(kTTSym_tag, kTTSym_generic);
        aData->setAttributeValue(kTTSym_description, TTSymbol("Turns on/off preview display of model's outputs from the flow processing algorithm"));
        v = TTValue(NO);
        aData->setAttributeValue(kTTSym_valueDefault, v);
    }
    
    // create internal audio datas depending on what have been found
    if (audioInput || audioOutput) {
        
        // make internal parameter at audio/mute address
        makeInternals_data(x, modelAddress, TTSymbol("audio/mute"), gensym("return_audio_mute"), x->patcherPtr, kTTSym_parameter, (TTObjectBasePtr*)&aData);
        aData->setAttributeValue(kTTSym_type, kTTSym_boolean);
        aData->setAttributeValue(kTTSym_tag, kTTSym_generic);
        aData->setAttributeValue(kTTSym_description, TTSymbol("When active, this parameter turns off model's audio processing"));
    }
    
    if (audioInput && audioOutput) {
        
        // make internal parameter at audio/bypass address
        makeInternals_data(x, modelAddress, TTSymbol("audio/bypass"), gensym("return_audio_bypass"), x->patcherPtr, kTTSym_parameter, (TTObjectBasePtr*)&aData);
        aData->setAttributeValue(kTTSym_type, kTTSym_boolean);
        aData->setAttributeValue(kTTSym_tag, kTTSym_generic);
        aData->setAttributeValue(kTTSym_description, TTSymbol("When active, this parameter bypasses the model's audio processing algorithm, letting incoming signal pass through unaffected"));
        
        // make internal parameter at flow/mix address
        makeInternals_data(x, modelAddress, TTSymbol("audio/mix"), gensym("return_audio_mix"), x->patcherPtr, kTTSym_parameter, (TTObjectBasePtr*)&aData);
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
    
    if (audioOutput) {
        
        // make internal parameter at audio/gain address
        makeInternals_data(x, modelAddress, TTSymbol("audio/gain"), gensym("return_audio_gain"), x->patcherPtr, kTTSym_parameter, (TTObjectBasePtr*)&aData);
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
}

void model_signal_return_flow_mute(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
    WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	ObjectPtr       obj;
	SymbolPtr       _sym_objclass, _sym_jin, _sym_jout;
	
	obj = object_attr_getobj(x->patcherPtr, _sym_firstobject);
	
	// TODO : cache those t_symbol else where ...
	_sym_jin = gensym("j.in");
	_sym_jout = gensym("j.out");
    
    // look into the patcher to find in and out
	while (obj) {
        
		_sym_objclass = object_attr_getsym(obj, _sym_maxclass);
        
		if (_sym_objclass == _sym_jin || _sym_objclass == _sym_jout)
            object_attr_setvalueof(obj, gensym("mute"), argc, argv);
        
		obj = object_attr_getobj(obj, _sym_nextobject);
	}
}

void model_signal_return_flow_bypass(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
    WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	ObjectPtr       obj;
	SymbolPtr       _sym_objclass, _sym_jin;
	
	obj = object_attr_getobj(x->patcherPtr, _sym_firstobject);
	
	// TODO : cache those t_symbol else where ...
	_sym_jin = gensym("j.in");
    
    // look into the patcher to find in
	while (obj) {
        
		_sym_objclass = object_attr_getsym(obj, _sym_maxclass);
        
		if (_sym_objclass == _sym_jin)
            object_attr_setvalueof(obj, gensym("bypass"), argc, argv);
        
		obj = object_attr_getobj(obj, _sym_nextobject);
	}
}

void model_signal_return_flow_freeze(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
    WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	ObjectPtr       obj;
	SymbolPtr       _sym_objclass, _sym_jout;
	
	obj = object_attr_getobj(x->patcherPtr, _sym_firstobject);
	
	// TODO : cache those t_symbol else where ...
	_sym_jout = gensym("j.out");
    
    // look into the patcher to find out
	while (obj) {
        
		_sym_objclass = object_attr_getsym(obj, _sym_maxclass);
        
		if (_sym_objclass == _sym_jout)
            object_attr_setvalueof(obj, gensym("freeze"), argc, argv);
        
		obj = object_attr_getobj(obj, _sym_nextobject);
	}
}

void model_signal_return_flow_preview(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
    WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	ObjectPtr       obj;
	SymbolPtr       _sym_objclass, _sym_jout;
	
	obj = object_attr_getobj(x->patcherPtr, _sym_firstobject);
	
	// TODO : cache those t_symbol else where ...
	_sym_jout = gensym("j.out");
    
    // look into the patcher to find out
	while (obj) {
        
		_sym_objclass = object_attr_getsym(obj, _sym_maxclass);
        
		if (_sym_objclass == _sym_jout)
            object_attr_setvalueof(obj, gensym("preview"), argc, argv);
        
		obj = object_attr_getobj(obj, _sym_nextobject);
	}
}

void model_signal_return_audio_mute(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
    WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	ObjectPtr       obj;
	SymbolPtr       _sym_objclass, _sym_jin_tild, _sym_jout_tild;
	
	obj = object_attr_getobj(x->patcherPtr, _sym_firstobject);
	
	// TODO : cache those t_symbol else where ...
	_sym_jin_tild = gensym("j.in~");
	_sym_jout_tild = gensym("j.out~");
    
    // look into the patcher to find in~ and out~
	while (obj) {
        
		_sym_objclass = object_attr_getsym(obj, _sym_maxclass);
        
		if (_sym_objclass == _sym_jin_tild || _sym_objclass == _sym_jout_tild)
            object_attr_setvalueof(obj, gensym("mute"), argc, argv);
        
		obj = object_attr_getobj(obj, _sym_nextobject);
	}
}

void model_signal_return_audio_bypass(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
    WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	ObjectPtr       obj;
	SymbolPtr       _sym_objclass, _sym_jin_tild;
	
	obj = object_attr_getobj(x->patcherPtr, _sym_firstobject);
	
	// TODO : cache those t_symbol else where ...
	_sym_jin_tild = gensym("j.in~");
    
    // look into the patcher to find in~
	while (obj) {
        
		_sym_objclass = object_attr_getsym(obj, _sym_maxclass);
        
		if (_sym_objclass == _sym_jin_tild)
            object_attr_setvalueof(obj, gensym("bypass"), argc, argv);
        
		obj = object_attr_getobj(obj, _sym_nextobject);
	}
}

void model_signal_return_audio_mix(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
    WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	ObjectPtr       obj;
	SymbolPtr       _sym_objclass, _sym_jout_tild;
	
	obj = object_attr_getobj(x->patcherPtr, _sym_firstobject);
	
	// TODO : cache those t_symbol else where ...
	_sym_jout_tild = gensym("j.out~");
    
    // look into the patcher to find out~
	while (obj) {
        
		_sym_objclass = object_attr_getsym(obj, _sym_maxclass);
        
		if (_sym_objclass == _sym_jout_tild)
            object_attr_setvalueof(obj, gensym("mix"), argc, argv);
        
		obj = object_attr_getobj(obj, _sym_nextobject);
	}
}

void model_signal_return_audio_gain(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
    WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	ObjectPtr       obj;
	SymbolPtr       _sym_objclass, _sym_jout_tild;
	
	obj = object_attr_getobj(x->patcherPtr, _sym_firstobject);
	
	// TODO : cache those t_symbol else where ...
	_sym_jout_tild = gensym("j.out~");
    
    // look into the patcher to find out~
	while (obj) {
        
		_sym_objclass = object_attr_getsym(obj, _sym_maxclass);
        
		if (_sym_objclass == _sym_jout_tild)
            object_attr_setvalueof(obj, gensym("gain"), argc, argv);
        
		obj = object_attr_getobj(obj, _sym_nextobject);
	}
}
