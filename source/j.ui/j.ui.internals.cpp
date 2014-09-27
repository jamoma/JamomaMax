/** @file
 *
 * @ingroup implementationMaxExternals
 *
 * @brief j.ui : Handling internal objects embedded in j.ui
 *
 * @details
 *
 * @authors Tim Place, Trond Lossius
 *
 * @copyright © 2007 by Tim Place @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */


#include "j.ui.h"

void ui_register_info(t_ui* obj)
{
	TTObject        anObject;
    TTAddress       returnedAddress;
    TTNodePtr       returnedNode = NULL;
    TTNodePtr       returnedContextNode = NULL;
	TTValue			v, args;
    
    // create a ui info object
    obj->uiInfo = TTObject("UiInfo", (TTPtr)obj);
	
	// create a ui node with our patcher as context
	if (!jamoma_subscriber_create((t_object*)obj, obj->uiInfo, TTAddress("ui"), obj->uiSubscriber, returnedAddress, &returnedNode, &returnedContextNode)) {
        
		// get info relative to our patcher
		jamoma_patcher_get_info((t_object*)obj, &obj->patcherPtr, obj->patcherContext, obj->patcherClass, obj->patcherName);
		
		// get the view address from the ui address
		obj->uiSubscriber.get("contextAddress", v);
		obj->viewAddress = v[0];
		
		// make a receiver on contextAddress/model:address attribute
		ui_receiver_create(obj, anObject, gensym("return_model_address"), TTSymbol("model:address"), obj->viewAddress, YES); // YES : we want to deferlow this method
	}
}

void ui_unregister_info(t_ui *obj)
{
    // unregister the ui info object
    if (obj->uiSubscriber.valid())
        obj->uiSubscriber = TTObject();
    
    // delete the ui info object
    if (obj->uiInfo.valid())
        obj->uiInfo = TTObject();
}

void ui_data_interface(t_ui *x, TTSymbol name)
{
	char			filename[MAX_FILENAME_CHARS];
	short			path;
	t_fourcc		type, filetype = 'JSON';
	t_dictionary*	d;
	t_object*		p;
	TTAddress address;
	t_atom			a;
	
	strncpy_zero(filename, "j.reference_interface.maxpat", MAX_FILENAME_CHARS);
	locatefile_extended(filename, &path, &type, &filetype, 1);
	dictionary_read(filename, path, &d);
	
	atom_setobj(&a, d);
	p = (t_object*)object_new_typed(_sym_nobox, _sym_jpatcher, 1, &a);
	object_attr_setlong(p, _sym_locked, 1);										// start out locked
	object_attr_setchar(p, _sym_enablehscroll, 0);								// turn off scroll bars
	object_attr_setchar(p, _sym_enablevscroll, 0);
	object_attr_setchar(p, _sym_openinpresentation, 1);	
	object_attr_setchar(p, _sym_toolbarvisible, 0);	
	object_attr_setsym(p, _sym_title, gensym("reference_interface"));		
	object_method_parse(p, _sym_window, "constrain 5 320 200 500", NULL);
	object_attach_byptr_register(x, p, _sym_nobox);
	
	object_method(p, _sym_vis);													// "vis" happens immediately, "front" is defer_lowed
	object_attr_setobj(jpatcher_get_firstview(p), _sym_owner, (t_object*)x);	// become the owner
	
	address = x->modelAddress.appendAddress(TTAddress(name.c_str()));
	
	OBJ_ATTR_SYM(p, "arguments", 0, gensym((char*)address.c_str()));		// the patch needs a [j.interfaceArguments.js]
	
	object_method(p, _sym_loadbang);
}

void ui_receiver_create(t_ui *obj, TTObject& returnedReceiver, t_symbol *aCallbackMethod, TTSymbol name, TTAddress address, TTBoolean deferlow, TTBoolean appendNameAsAttribute)
{
	TTValue		baton, args;
	TTObject    returnValueCallback, empty;
	TTAddress   adrs;
	
	// prepare arguments
	args.append(empty);
	
	returnValueCallback = TTObject("callback");
    
	baton = TTValue(TTPtr(obj), TTPtr(aCallbackMethod), deferlow);
	returnValueCallback.set(kTTSym_baton, baton);
	returnValueCallback.set(kTTSym_function, TTPtr(&jamoma_callback_return_value));
	args.append(returnValueCallback);
	
	returnedReceiver = TTObject(kTTSym_Receiver, args);
	
	// edit address
    if (appendNameAsAttribute)
        adrs = address.appendAttribute(name);
    else
        adrs = address.appendAddress(TTAddress(name.c_str()));
    
    // store receiver
	obj->hash_receivers->append(name, returnedReceiver);
    
    // set address attribute (after storing the receiver as the value can be updated in the same time)
	returnedReceiver.set(kTTSym_address, adrs);
}

void ui_receiver_destroy_all(t_ui *obj)
{
	TTValue		hk, v, none;
	TTSymbol	key, receiverAddress;
	TTUInt8		i;
	
	// delete all receivers
	if (obj->hash_receivers) {
		
		if (!obj->hash_receivers->isEmpty()) {
			
			obj->hash_receivers->getKeys(hk);
			
			for (i=0; i<obj->hash_receivers->getSize(); i++) {
				
				key = hk[i];
				if (!obj->hash_receivers->lookup(key, v)) {
                    
                    TTObject receiver = v[0];
                    receiver.set(kTTSym_address, kTTAdrsEmpty);
                }
			}
		}
		obj->hash_receivers->clear();
	}
}

void ui_viewer_create(t_ui *obj, TTObject& returnedViewer, t_symbol *aCallbackMethod, TTSymbol name, TTAddress address, TTBoolean subscribe, TTBoolean deferlow)
{
	TTValue		v, baton, args, none;
	TTAddress   viewAddress, viewerAddress, adrs;
	
	returnedViewer = TTObject(kTTSym_Viewer);
    
	baton = TTValue(TTPtr(obj), TTPtr(aCallbackMethod), deferlow);
	returnedViewer.set(kTTSym_baton, baton);
	returnedViewer.set(kTTSym_function, TTPtr(&jamoma_callback_return_value));
	
	if (subscribe) {
		// Register viewer
		obj->uiSubscriber.get("contextAddress", v);
		viewAddress = v[0];
        
		viewerAddress = viewAddress.appendAddress(TTAddress(name.c_str()));
		args = TTValue(viewerAddress, returnedViewer, (TTPtr)obj->patcherPtr);
		JamomaApplication.send("ObjectRegister", args, none);
	}
	else
		viewerAddress = kTTAdrsEmpty;
	
	// edit address to bind
	adrs = address.appendAddress(TTAddress(name.c_str()));
	
	// store viewer
	args = TTValue(returnedViewer);
	args.append(viewerAddress);
	obj->hash_viewers->append(name, args);
    
    // set address attribute (after storing the receiver as the value can be updated in the same time)
	returnedViewer.set(kTTSym_address, adrs);
}

void ui_viewer_destroy(t_ui *obj, TTSymbol name)
{
	TTValue     v, none;
	TTAddress   viewerAddress;
	
	if (obj->hash_viewers)
		if (!obj->hash_viewers->lookup(name, v)) {
            
            TTObject viewer = v[0];
            viewer.set(kTTSym_address, kTTAdrsEmpty);
			
			// Unregister viewer
			viewerAddress = v[1];
            JamomaApplication.send("ObjectUnregister", viewerAddress, none);
			obj->hash_viewers->remove(name);
		}
}

void ui_viewer_destroy_all(t_ui *obj)
{
	TTValue		hk, v, none;
	TTSymbol	key, viewerAddress;
	TTUInt8		i;
	
	// delete all viewers
	if (obj->hash_viewers) {
		
		if (!obj->hash_viewers->isEmpty()) {
			
			obj->hash_viewers->getKeys(hk);
			
			for (i=0; i<obj->hash_viewers->getSize(); i++) {
				
				key = hk[i];
				if (!obj->hash_viewers->lookup(key, v)) {
                    
                    TTObject viewer = v[0];
                    viewer.set(kTTSym_address, kTTAdrsEmpty);
                    
                    // Unregister viewer
                    viewerAddress = v[1];
                    JamomaApplication.send("ObjectUnregister", viewerAddress, none);
                }
			}
		}
		delete obj->hash_viewers;
        obj->hash_viewers = NULL;
	}
}

void ui_viewer_send(t_ui *obj, TTSymbol name, TTValue v)
{
	TTValue		storedObject, none;
	TTObject	anObject;
	TTErr		err;
	
	if (obj->hash_viewers) {
		err = obj->hash_viewers->lookup(name, storedObject);
		
		if (!err) {
			anObject = storedObject[0];
			if (anObject.valid())
				anObject.send(kTTSym_Send, v, none);
		}
	}
}

void ui_viewer_highlight(t_ui *obj, TTSymbol name, TTBoolean s)
{
	TTValue		storedObject;
	TTObject	anObject;
	TTErr		err;
    
	if (obj->hash_viewers) {
		err = obj->hash_viewers->lookup(name, storedObject);
		
		if (!err) {
			anObject = storedObject[0];
			if (anObject.valid())
				anObject.set(kTTSym_highlight, s);
		}
	}
}

void ui_viewer_freeze(t_ui *obj, TTSymbol name, TTBoolean f)
{
	TTValue		storedObject;
	TTObject	anObject;
	TTErr		err;
    
	if (obj->hash_viewers) {
		err = obj->hash_viewers->lookup(name, storedObject);
		
		if (!err) {
			anObject = storedObject[0];
			if (anObject.valid())
				anObject.set(kTTSym_freeze, f);
		}
	}
}

#if 0
#pragma mark -
#pragma mark message handlers
#endif

void ui_explorer_create(t_object *x, TTObject&  returnedExplorer, t_symbol *method)
{
	TTValue		args, baton, none;
	TTObject	returnValueCallback;
	
	// prepare arguments
	returnValueCallback = TTObject("callback");
	baton = TTValue(TTPtr(x), TTPtr(method));
	returnValueCallback.set(kTTSym_baton, baton);
	returnValueCallback.set(kTTSym_function, TTPtr(&jamoma_callback_return_value));
	args.append(returnValueCallback);
	
	args.append((TTPtr)jamoma_explorer_default_filter_bank());
	
	returnedExplorer = TTObject(kTTSym_Explorer, args);
}

void ui_modelParamExplorer_callback(TTPtr self, t_symbol *msg, long argc, t_atom* argv)
{
	t_ui* obj = (t_ui*)self;
	t_symobject	*item = NULL;
	
	// model's message namespace observation
	if (obj->modelAddress != kTTAdrsEmpty) {
		
		// fill item list
		for (long i=0; i<argc; i++) {
			item = (t_symobject *)symobject_new(atom_getsym(argv+i));
			linklist_append(obj->refmenu_items, item);
		}
	}
}

void ui_modelMessExplorer_callback(TTPtr self, t_symbol *msg, long argc, t_atom* argv)
{
	t_ui* obj = (t_ui*)self;
	t_symobject	*item = NULL;
	
	// model's message namespace observation
	if (obj->modelAddress != kTTAdrsEmpty) {
		
		// fill item list
		for (long i=0; i<argc; i++) {
			item = (t_symobject *)symobject_new(atom_getsym(argv+i));
			linklist_append(obj->refmenu_items, item);
		}
	}
}

void ui_modelRetExplorer_callback(TTPtr self, t_symbol *msg, long argc, t_atom* argv)
{
	t_ui* obj = (t_ui*)self;
	t_symobject	*item = NULL;
	
	// model's message namespace observation
	if (obj->modelAddress != kTTAdrsEmpty) {
		
		// fill item list
		for (long i=0; i<argc; i++) {
			item = (t_symobject *)symobject_new(atom_getsym(argv+i));
			linklist_append(obj->refmenu_items, item);
		}
	}
}

void ui_view_panel_attach(TTPtr self, t_symbol *msg, long argc, t_atom *argv)
{
	t_ui        *obj = (t_ui*)self;
	t_object    *box;
	t_outlet    *myoutlet = NULL;
	t_dll       *connecteds = NULL;
	t_object    *o;
	t_symbol	*name;
	TTValue		v;
	
	// search through all connected objects for a patcher object
	object_obex_lookup(obj, _sym_pound_B, &box);
	myoutlet = (t_outlet*)jbox_getoutlet((t_jbox*)box, panel_out);
	if (myoutlet)
		connecteds = (t_dll*)myoutlet->o_dll;
	
	while (connecteds) {
		o = (t_object*)connecteds->d_x1;
		name = object_classname(o);
		if (name == _sym_inlet) {
			o = ((t_inlet *)connecteds->d_x1)->i_owner;
			name = object_classname(o);
			if (name == _sym_jpatcher) {
				
				obj->patcher_panel = o;
				obj->has_panel = true;
				
				jbox_redraw(&obj->box);
				return;
			}
		}
		o = NULL;
		name = NULL;
		connecteds = connecteds->d_next;
	}
}

void ui_return_mute(TTPtr self, t_symbol *msg, long argc, t_atom* argv)
{
	t_ui* obj = (t_ui*)self;
	
	obj->is_muted = atom_getlong(argv);
	jbox_redraw(&obj->box);
}

void ui_return_bypass(TTPtr self, t_symbol *msg, long argc, t_atom* argv)
{
	t_ui* obj = (t_ui*)self;
	
	obj->is_bypassed = atom_getlong(argv);
	jbox_redraw(&obj->box);
}

void ui_return_mix(TTPtr self, t_symbol *msg, long argc, t_atom* argv)
{
	t_ui* obj = (t_ui*)self;
	
	obj->mix = atom_getlong(argv);
	jbox_redraw(&obj->box);
}

void ui_return_gain(TTPtr self, t_symbol *msg, long argc, t_atom* argv)
{
	t_ui* obj = (t_ui*)self;
	
	obj->gain = atom_getlong(argv);
	jbox_redraw(&obj->box);
}

void ui_return_freeze(TTPtr self, t_symbol *msg, long argc, t_atom* argv)
{
	t_ui* obj = (t_ui*)self;
	
	obj->is_frozen = atom_getlong(argv);
	jbox_redraw(&obj->box);
}

void ui_return_active(TTPtr self, t_symbol *msg, long argc, t_atom* argv)
{
    t_ui* obj = (t_ui*)self;
    
    obj->is_active = atom_getlong(argv);
	jbox_redraw(&obj->box);
}

void ui_return_model_address(TTPtr self, t_symbol *msg, long argc, t_atom* argv)
{
    t_object *obj = (t_object*)self;
    
    // The following must be deferred because we have to interrogate our box,
	// and our box is not yet valid until we have finished instantiating the object.
	// Trying to use a loadbang method instead is also not fully successful (as of Max 5.0.6)
	defer_low(obj, (method)ui_subscribe, atom_getsym(argv), 0, 0);
}

void ui_return_model_init(TTPtr self, t_symbol *msg, long argc, t_atom* argv)
{
	t_ui*       obj = (t_ui*)self;
	long        init = atom_getlong(argv);
	TTValue     v;
    TTObject    aReceiver;
	
    // if the model is initialized and no content observer have been created
	if (init) {
		
        if (obj->hash_receivers->lookup(kTTSym_content, v))
            
            // observe the content of the model
            // by this way, the creation of any widgets depends on the existence of the data
            ui_receiver_create(obj, aReceiver, gensym("return_model_content"), kTTSym_content, obj->modelAddress, NO, YES);
        
        else {
            
            // update address to get the content of the model
            aReceiver = v[0];
            aReceiver.set(kTTSym_address, obj->modelAddress.appendAttribute(kTTSym_content));
        }
	}
}

void ui_return_model_content(TTPtr self, t_symbol *msg, long argc, t_atom* argv)
{
    t_ui* obj = (t_ui*)self;
	TTObject    anObject;
	TTBoolean	gain = NO;
	TTBoolean	mix = NO;
	TTBoolean	bypass = NO;
	TTBoolean	freeze = NO;
	TTBoolean	active = NO;
    TTBoolean	mute = NO;
	TTBoolean	preset = NO;		// is there a preset node in the model ?
	TTBoolean	model = NO;			// is there a model node in the model ?
	TTBoolean	change = NO;
	TTAddress   relativeAddress;
    TTBoolean   dataInput = NO;
    TTBoolean   dataOutput = NO;
    TTBoolean   audioInput = NO;
    TTBoolean   audioOutput = NO;
    
    // the viewers table must be still available
    if (!obj->hash_viewers)
        return;
    
	// model namespace observation
	if (obj->modelAddress != kTTAdrsEmpty) {
        
		// look the namelist to know which data exist
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
			else if (relativeAddress.getName() == TTSymbol("preset"))
				preset = true;
            
            else if (relativeAddress.getName() == TTSymbol("model"))
				model = true;
		}
        
        if (dataInput || dataOutput)
            active = true;
        
        if (dataInput && dataOutput)
            bypass = true;
        
        if (audioInput || audioOutput)
            mute = true;
        
        if (audioInput && audioOutput) {
            bypass = true;
            mix = true;
        }
        
        if (audioOutput)
            gain = true;
		
		// if a data appears or disappears : create or remove the viewer
		
		// gain
		if (gain != obj->has_gain) {
			obj->has_gain = gain;
			if (gain)
				ui_viewer_create(obj, anObject, gensym("return_gain"), TTSymbol("audio/gain"), obj->modelAddress, NO); // don't subscribe this viewer
			else
				ui_viewer_destroy(obj, TTSymbol("audio/gain"));
		}
		
		// mix
		if (mix != obj->has_mix) {
			obj->has_mix = mix;
			if (mix)
				ui_viewer_create(obj, anObject, gensym("return_mix"), TTSymbol("audio/mix"), obj->modelAddress, NO); // don't subscribe this viewer
			else
				ui_viewer_destroy(obj, TTSymbol("audio/mix"));
			
			change = true;
		}
		
		// bypass
		if (bypass != obj->has_bypass) {
			obj->has_bypass = bypass;
			if (bypass)
				ui_viewer_create(obj, anObject, gensym("return_bypass"), TTSymbol("*.*/bypass"), obj->modelAddress, NO); // don't subscribe this viewer
			else
				ui_viewer_destroy(obj, TTSymbol("*.*/bypass"));
			
			change = true;
		}
		
		// freeze
		if (freeze != obj->has_freeze) {
			obj->has_freeze = freeze;
			if (freeze)
				ui_viewer_create(obj, anObject, gensym("return_freeze"), TTSymbol("data/freeze"), obj->modelAddress, NO); // don't subscribe this viewer
			else
				ui_viewer_destroy(obj, TTSymbol("data/freeze"));
			
			change = true;
		}
		
		// active
		if (active != obj->has_active) {
			obj->has_active = active;
			if (active)
				ui_viewer_create(obj, anObject, gensym("return_active"), TTSymbol("data/active"), obj->modelAddress, NO); // don't subscribe this viewer
			else {
				ui_viewer_destroy(obj, TTSymbol("data/active"));
				obj->hash_viewers->remove(TTSymbol("data/active"));
			}
			
			change = true;
		}
		
		// mute
		if (mute != obj->has_mute) {
			obj->has_mute = mute;
			if (mute)
				ui_viewer_create(obj, anObject, gensym("return_mute"), TTSymbol("*.*/mute"), obj->modelAddress, NO); // don't subscribe this viewer
			else
				ui_viewer_destroy(obj, TTSymbol("*.*/mute"));
			
			change = true;
		}
		
		// preset
		if (preset != obj->has_preset) {
			obj->has_preset = preset;
			if (preset) {
				ui_viewer_create(obj, anObject, gensym("return_preset_names"), TTSymbol("preset:names"), obj->modelAddress, NO); // don't subscribe this viewer
			}
			else {
				ui_viewer_destroy(obj, TTSymbol("preset:names"));
			}
			
			change = true;
		}
		
		// model
		if (model != obj->has_model)
			obj->has_model = model;
		
		if (change)
			jbox_redraw(&obj->box);
		
	}
}
