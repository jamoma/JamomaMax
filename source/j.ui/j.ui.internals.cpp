/* 
 * j.ui
 * External for Jamoma: provide standard user interface component for modules
 * By Tim Place, Copyright © 2007
 * 
 * License: This code is licensed under the terms of the "New BSD License"
 * http://creativecommons.org/licenses/BSD/
 */

#include "j.ui.h"

void ui_data_create_all(t_ui* obj)
{
	TTObjectBasePtr	anObject;
    TTAddress       returnedAddress;
    TTNodePtr       returnedNode = NULL;
    TTNodePtr       returnedContextNode = NULL;
	TTString		uiStr, parentStr, dataStr;
	TTValue			v;
	
	// create a ui node with our patcher as context
	anObject = NULL;
	TTObjectBaseInstantiate(kTTSym_Container, &anObject, kTTValNONE);
	if (!jamoma_subscriber_create((ObjectPtr)obj, anObject, TTAddress("ui"), &obj->uiSubscriber, returnedAddress, &returnedNode, &returnedContextNode)) {
		
		// get info relative to our patcher
		jamoma_patcher_get_info((ObjectPtr)obj, &obj->patcherPtr, obj->patcherContext, obj->patcherClass, obj->patcherName);
		
		// get the view address
		obj->uiSubscriber->getAttributeValue(TTSymbol("contextAddress"), v);
		obj->viewAddress = v[0];
		
		// make a receiver on contextAddress/model/address data
		ui_receiver_create(obj, &anObject, gensym("return_model_address"), TTSymbol("model/address"), obj->viewAddress, YES); // YES : we want to deferlow this method
		
		// Then create all internal datas concerning the j.ui
		// ui/color/contentBackground
		ui_data_create(obj, &anObject, gensym("return_color_contentBackground"), kTTSym_message, TTSymbol("color/contentBackground"));
		anObject->setAttributeValue(kTTSym_type, kTTSym_array);
		anObject->setAttributeValue(kTTSym_tag, kTTSym_generic);
		anObject->setAttributeValue(kTTSym_rampDrive, kTTSym_none);
		anObject->setAttributeValue(kTTSym_description, TTSymbol("The background color of the module in the format RGBA where values range [0.0, 1.0]."));
		
		// ui/color/toolbarBackground
		ui_data_create(obj, &anObject, gensym("return_color_toolbarBackground"), kTTSym_message, TTSymbol("color/toolbarBackground"));
		anObject->setAttributeValue(kTTSym_type, kTTSym_array);
		anObject->setAttributeValue(kTTSym_tag, kTTSym_generic);
		anObject->setAttributeValue(kTTSym_rampDrive, kTTSym_none);
		anObject->setAttributeValue(kTTSym_description, TTSymbol("The background color of the module's toolbar in the format RGBA where values range [0.0, 1.0]."));
		
		// ui/color/toolbarText
		ui_data_create(obj, &anObject, gensym("return_color_toolbarText"), kTTSym_message, TTSymbol("color/toolbarText"));
		anObject->setAttributeValue(kTTSym_type, kTTSym_array);
		anObject->setAttributeValue(kTTSym_tag, kTTSym_generic);
		anObject->setAttributeValue(kTTSym_rampDrive, kTTSym_none);
		anObject->setAttributeValue(kTTSym_description, TTSymbol("The color of the module's toolbar text in the format RGBA where values range [0.0, 1.0]."));
		
		// ui/color/border
		ui_data_create(obj, &anObject, gensym("return_color_border"), kTTSym_message, TTSymbol("color/border"));
		anObject->setAttributeValue(kTTSym_type, kTTSym_array);
		anObject->setAttributeValue(kTTSym_tag, kTTSym_generic);
		anObject->setAttributeValue(kTTSym_rampDrive, kTTSym_none);
		anObject->setAttributeValue(kTTSym_description, TTSymbol("The border color of the module in the format RGBA where values range [0.0, 1.0]."));
		
		obj->memo_bordercolor = obj->bordercolor;
		
		// ui/size
		ui_data_create(obj, &anObject, gensym("return_ui_size"), kTTSym_parameter, TTSymbol("size"));
		anObject->setAttributeValue(kTTSym_type, kTTSym_array);
		anObject->setAttributeValue(kTTSym_tag, kTTSym_generic);
		anObject->setAttributeValue(kTTSym_rampDrive, kTTSym_none);
		anObject->setAttributeValue(kTTSym_description, TTSymbol("The size of the view's UI."));
		
		v = TTValue(obj->box.b_presentation_rect.width);
		v.append(obj->box.b_presentation_rect.height);
		anObject->setAttributeValue(kTTSym_value, v);
		
		// ui/freeze
		ui_data_create(obj, &anObject, gensym("return_ui_freeze"), kTTSym_parameter, TTSymbol("freeze"));
		anObject->setAttributeValue(kTTSym_type, kTTSym_boolean);
		anObject->setAttributeValue(kTTSym_tag, kTTSym_generic);
		anObject->setAttributeValue(kTTSym_rampDrive, kTTSym_none);
		anObject->setAttributeValue(kTTSym_description, TTSymbol("Freeze each j.remote in the patch"));
	}
}

void ui_data_destroy_all(t_ui *obj)
{
	TTValue			hk, v;
	TTSymbol		key;
	TTUInt8			i;
	
	// delete all datas
	if (obj->hash_datas) {
		
		if (!obj->hash_datas->isEmpty()) {
			
			obj->hash_datas->getKeys(hk);
			for (i=0; i<obj->hash_datas->getSize(); i++) {
				
				hk.get(i, key);
				ui_data_destroy(obj, key);
			}
		}
		delete obj->hash_datas;
	}
}

void ui_data_create(t_ui *obj, TTObjectBasePtr *returnedData, SymbolPtr aCallbackMethod, TTSymbol service, TTSymbol name, TTBoolean deferlow)
{
	TTValue			args, v;
	TTObjectBasePtr		returnValueCallback;
	TTValuePtr		returnValueBaton;
	TTAddress       uiAddress, dataAddress;
	TTNodePtr		aNode;
	TTBoolean		nodeCreated;
	
	// Prepare arguments to create a TTData object
	returnValueCallback = NULL;			// without this, TTObjectBaseInstantiate try to release an oldObject that doesn't exist ... Is it good ?
	TTObjectBaseInstantiate(TTSymbol("callback"), &returnValueCallback, kTTValNONE);
    
	returnValueBaton = new TTValue(TTPtr(obj));
	returnValueBaton->append(TTPtr(aCallbackMethod));
    returnValueBaton->append(deferlow);
    
	returnValueCallback->setAttributeValue(kTTSym_baton, TTPtr(returnValueBaton));
	returnValueCallback->setAttributeValue(kTTSym_function, TTPtr(&jamoma_callback_return_value));
	args.append(returnValueCallback);
	
	args.append(service);
	
	*returnedData = NULL;
	TTObjectBaseInstantiate(kTTSym_Data, TTObjectBaseHandle(returnedData), args);
	
	// Register data
	obj->uiSubscriber->getAttributeValue(TTSymbol("nodeAddress"), v);
	v.get(0, uiAddress);
	dataAddress = uiAddress.appendAddress(TTAddress(name.c_str()));
	JamomaDirectory->TTNodeCreate(dataAddress, *returnedData, obj->patcherPtr, &aNode, &nodeCreated);
	
	// Store data
	args = TTValue(*returnedData);
	args.append(dataAddress);
	obj->hash_datas->append(name, args);
	
	JamomaDebug object_post((ObjectPtr)obj, "Make internal ui/%s object at : %s", name.c_str(), dataAddress.c_str());
}								   

void ui_data_destroy(t_ui *obj, TTSymbol name)
{
	TTValue			storedObject;
	TTObjectBasePtr	aData;
	TTAddress       dataAddress;
	
	if (obj->hash_datas)
		if (!obj->hash_datas->lookup(name, storedObject)) {
			
			// Unregister data
			storedObject.get(1, dataAddress);
			JamomaDirectory->TTNodeRemove(dataAddress);
			
			// Delete data
			aData = storedObject[0];
			if (aData)
				if (aData->valid)	// to -- should be better to understand why the data is not valid
					TTObjectBaseRelease(&aData);
			
			// don't remove from the hash_table here !
		}
}

void ui_data_send(t_ui *obj, TTSymbol name, TTValue v)
{
	TTValue			storedObject;
	TTObjectBasePtr		anObject;
	
	obj->hash_datas->lookup(name, storedObject);
    anObject = storedObject[0];
	
	anObject->setAttributeValue(kTTSym_value, v);
}

void ui_data_interface(t_ui *x, TTSymbol name)
{
	char			filename[MAX_FILENAME_CHARS];
	short			path;
	t_fourcc		type, filetype = 'JSON';
	t_dictionary*	d;
	ObjectPtr		p;
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

void ui_receiver_create(t_ui *obj, TTObjectBasePtr *returnedReceiver, SymbolPtr aCallbackMethod, TTSymbol name, TTAddress address, TTBoolean deferlow, TTBoolean appendNameAsAttribute)
{
	TTValue			v, args;
	TTObjectBasePtr	returnValueCallback;
	TTValuePtr		returnValueBaton;
	TTAddress adrs;
	
	// prepare arguments
	args.append(NULL);
	
	returnValueCallback = NULL;			// without this, TTObjectBaseInstantiate try to release an oldObject that doesn't exist ... Is it good ?
	TTObjectBaseInstantiate(TTSymbol("callback"), &returnValueCallback, kTTValNONE);
    
	returnValueBaton = new TTValue(TTPtr(obj));
	returnValueBaton->append(TTPtr(aCallbackMethod));
    returnValueBaton->append(deferlow);  
    
	returnValueCallback->setAttributeValue(kTTSym_baton, TTPtr(returnValueBaton));
	returnValueCallback->setAttributeValue(kTTSym_function, TTPtr(&jamoma_callback_return_value));
	args.append(returnValueCallback);
	
	*returnedReceiver = NULL;
	TTObjectBaseInstantiate(kTTSym_Receiver, TTObjectBaseHandle(returnedReceiver), args);
	
	// Set address to bind
    if (appendNameAsAttribute)
        adrs = address.appendAttribute(name);
    else
        adrs = address.appendAddress(TTAddress(name.c_str()));
        
	(*returnedReceiver)->setAttributeValue(kTTSym_address, adrs);
    
    // refresh receiver
	(*returnedReceiver)->sendMessage(kTTSym_Get);
	
	// Store receiver
	args = TTValue(*returnedReceiver);
	obj->hash_receivers->append(name, args);
}

void ui_receiver_destroy(t_ui *obj, TTSymbol name)
{
	TTValue			storedObject;
	TTObjectBasePtr	aReceiver;
	
	if (obj->hash_receivers)
		if (!obj->hash_receivers->lookup(name, storedObject)) {
			
			// delete
            aReceiver = storedObject[0];
			if (aReceiver)
				if (aReceiver->valid)	// to -- should be better to understand why the receiver is not valid
					TTObjectBaseRelease(&aReceiver);
			
			// don't remove from the hash_table here !
		}
}

void ui_receiver_destroy_all(t_ui *obj)
{
	TTValue			hk, v;
	TTSymbol		key;
	TTUInt8			i;
	
	// delete all viewers
	if (obj->hash_receivers) {
		
		if (!obj->hash_receivers->isEmpty()) {
			
			obj->hash_receivers->getKeys(hk);
			
			for (i=0; i<obj->hash_receivers->getSize(); i++) {
				
				hk.get(i, key);
				ui_receiver_destroy(obj, key);
			}
		}
		delete obj->hash_receivers;
	}
}

void ui_viewer_create(t_ui *obj, TTObjectBasePtr *returnedViewer, SymbolPtr aCallbackMethod, TTSymbol name, TTAddress address, TTBoolean subscribe, TTBoolean deferlow)
{
	TTValue			v, args;
	TTObjectBasePtr		returnValueCallback;
	TTValuePtr		returnValueBaton;
	TTAddress uiAddress, viewerAddress, adrs;
	TTNodePtr		aNode;
	TTBoolean		nodeCreated;
	
	// prepare arguments
	returnValueCallback = NULL;			// without this, TTObjectBaseInstantiate try to release an oldObject that doesn't exist ... Is it good ?
	TTObjectBaseInstantiate(TTSymbol("callback"), &returnValueCallback, kTTValNONE);
    
	returnValueBaton = new TTValue(TTPtr(obj));
	returnValueBaton->append(TTPtr(aCallbackMethod));
    returnValueBaton->append(deferlow);
    
	returnValueCallback->setAttributeValue(kTTSym_baton, TTPtr(returnValueBaton));
	returnValueCallback->setAttributeValue(kTTSym_function, TTPtr(&jamoma_callback_return_value));
	args.append(returnValueCallback);
	
	*returnedViewer = NULL;
	TTObjectBaseInstantiate(kTTSym_Viewer, TTObjectBaseHandle(returnedViewer), args);
	
	if (subscribe) {
		// Register viewer
		obj->uiSubscriber->getAttributeValue(TTSymbol("nodeAddress"), v);
		v.get(0, uiAddress);
		
		viewerAddress = uiAddress.appendAddress(TTAddress(name.c_str()));
		
		JamomaDirectory->TTNodeCreate(viewerAddress, *returnedViewer, obj->patcherPtr, &aNode, &nodeCreated);
	}
	else
		viewerAddress = kTTAdrsEmpty;
	
	// Set address to bind
	adrs = address.appendAddress(TTAddress(name.c_str()));
	(*returnedViewer)->setAttributeValue(kTTSym_address, adrs);
	
	// Store viewer
	args = TTValue(*returnedViewer);
	args.append(viewerAddress);
	obj->hash_viewers->append(name, args);
}

void ui_viewer_destroy(t_ui *obj, TTSymbol name)
{
	TTValue			storedObject;
	TTObjectBasePtr		aViewer;
	TTAddress viewerAddress;
	
	if (obj->hash_viewers)
		if (!obj->hash_viewers->lookup(name, storedObject)) {
			
			// Unregister data
			storedObject.get(1, viewerAddress);
			if (viewerAddress != kTTAdrsEmpty)
				JamomaDirectory->TTNodeRemove(viewerAddress);
			
			// delete
			aViewer = storedObject[0];
			if (aViewer)
				if (aViewer->valid)	// to -- should be better to understand why the viewer is not valid
					TTObjectBaseRelease(&aViewer);
			
			// don't remove from the hash_table here !
		}
}

void ui_viewer_destroy_all(t_ui *obj)
{
	TTValue			hk, v;
	TTSymbol		key;
	TTUInt8			i;
	
	// delete all viewers
	if (obj->hash_viewers) {
		
		if (!obj->hash_viewers->isEmpty()) {
			
			obj->hash_viewers->getKeys(hk);
			
			for (i=0; i<obj->hash_viewers->getSize(); i++) {
				
				hk.get(i, key);
				ui_viewer_destroy(obj, key);
			}
		}
		delete obj->hash_viewers;
	}
}

void ui_viewer_send(t_ui *obj, TTSymbol name, TTValue v)
{
	TTValue			storedObject;
	TTObjectBasePtr		anObject;
	TTErr			err;
	if (obj->hash_viewers) {
		err = obj->hash_viewers->lookup(name, storedObject);
		
		if (!err) {
			anObject = storedObject[0];
			if (anObject)
				anObject->sendMessage(kTTSym_Send, v, kTTValNONE);
		}
	}
}

void ui_viewer_highlight(t_ui *obj, TTSymbol name, TTBoolean s)
{
	TTValue			storedObject;
	TTObjectBasePtr		anObject;
	TTErr			err;
	if (obj->hash_viewers) {
		err = obj->hash_viewers->lookup(name, storedObject);
		
		if (!err) {
			anObject = storedObject[0];
			if (anObject)
				anObject->setAttributeValue(kTTSym_highlight, s);
		}
	}
}

void ui_viewer_freeze(t_ui *obj, TTSymbol name, TTBoolean f)
{
	TTValue			storedObject;
	TTObjectBasePtr		anObject;
	TTErr			err;
	if (obj->hash_viewers) {
		err = obj->hash_viewers->lookup(name, storedObject);
		
		if (!err) {
			anObject = storedObject[0];
			if (anObject)
				anObject->setAttributeValue(kTTSym_freeze, f);
		}
	}
}

#if 0
#pragma mark -
#pragma mark message handlers
#endif

void ui_explorer_create(ObjectPtr x, TTObjectBasePtr *returnedExplorer, SymbolPtr method)
{
	TTValue			args;
	TTObjectBasePtr		returnValueCallback;
	TTValuePtr		returnValueBaton;
	
	// prepare arguments
	returnValueCallback = NULL;			// without this, TTObjectBaseInstantiate try to release an oldObject that doesn't exist ... Is it good ?
	TTObjectBaseInstantiate(TTSymbol("callback"), &returnValueCallback, kTTValNONE);
	returnValueBaton = new TTValue(TTPtr(x));
	returnValueBaton->append(TTPtr(method));
	returnValueCallback->setAttributeValue(kTTSym_baton, TTPtr(returnValueBaton));
	returnValueCallback->setAttributeValue(kTTSym_function, TTPtr(&jamoma_callback_return_value));
	args.append(returnValueCallback);
	
	args.append((TTPtr)jamoma_explorer_default_filter_bank());
	
	*returnedExplorer = NULL;
	TTObjectBaseInstantiate(kTTSym_Explorer, TTObjectBaseHandle(returnedExplorer), args);
}

void ui_modelParamExplorer_callback(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
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

void ui_modelMessExplorer_callback(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
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

void ui_modelRetExplorer_callback(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
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
	t_ui* obj = (t_ui*)self;
	ObjectPtr	box;
	t_outlet*	myoutlet = NULL;
	t_dll*		connecteds = NULL;
	ObjectPtr	o;
	SymbolPtr	name;
	TTObjectBasePtr aData;
	TTValue		v;
	
	// search through all connected objects for a patcher object
	object_obex_lookup(obj, _sym_pound_B, &box);
	myoutlet = (t_outlet*)jbox_getoutlet((t_jbox*)box, 1);
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
				
				// view/panel
				ui_data_create(obj, &aData, gensym("return_view_panel"), kTTSym_message, TTSymbol("panel"));
				
				// Set attribute of the data
				aData->setAttributeValue(kTTSym_type, kTTSym_none);
				aData->setAttributeValue(kTTSym_tag, kTTSym_generic);
				aData->setAttributeValue(kTTSym_description, TTSymbol("Open a control panel if one is present."));
				aData->setAttributeValue(kTTSym_rampDrive, kTTSym_none);
				
				jbox_redraw(&obj->box);
				return;
			}
		}
		o = NULL;
		name = NULL;
		connecteds = connecteds->d_next;
	}
}

void ui_view_panel_return(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	t_ui* obj = (t_ui*)self;
	Atom		a;
	
	// open view panel and set title
	atom_setsym(&a, gensym((char*)obj->viewAddress.c_str()));
	object_attr_setvalueof(obj->patcher_panel, _sym_title, 1, &a);
	object_method(obj->patcher_panel, _sym_vis);
}

void ui_return_metersdefeated(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	t_ui* obj = (t_ui*)self;
	
	obj->is_metersdefeated = atom_getlong(argv);
	jbox_redraw(&obj->box);
}

void ui_return_mute(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	t_ui* obj = (t_ui*)self;
	
	obj->is_muted = atom_getlong(argv);
	jbox_redraw(&obj->box);
}

void ui_return_bypass(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	t_ui* obj = (t_ui*)self;
	
	obj->is_bypassed = atom_getlong(argv);
	jbox_redraw(&obj->box);
}

void ui_return_mix(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	t_ui* obj = (t_ui*)self;
	
	obj->mix = atom_getlong(argv);
	jbox_redraw(&obj->box);
}

void ui_return_gain(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	t_ui* obj = (t_ui*)self;
	
	obj->gain = atom_getlong(argv);
	jbox_redraw(&obj->box);
}

void ui_return_freeze(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	t_ui* obj = (t_ui*)self;
	
	obj->is_frozen = atom_getlong(argv);
	jbox_redraw(&obj->box);
}

void ui_return_preview(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	t_ui*			obj = (t_ui*)self;
	TTAddress outAdrs;
	TTValue			v;
	TTNodePtr		aNode;
	TTValuePtr		newBaton;
	TTAttributePtr	anAttribute = NULL;
	TTErr			err;
	
	obj->is_previewing = atom_getlong(argv);
	
	// get the TTOutput object
	if (!obj->modelOutput) {
		outAdrs = obj->modelAddress.appendAddress(TTAddress("out"));
		
		JamomaDirectory->getTTNode(outAdrs, &aNode);
		obj->modelOutput = (TTOutputPtr)aNode->getObject();
	}
	
	if (obj->modelOutput) {
		
		err = obj->modelOutput->findAttribute(TTSymbol("signal"), &anAttribute);
		if (!err) {
			
			if (obj->is_previewing) {
				
				// reset preview signal
				if (obj->previewSignal) {
					anAttribute->unregisterObserverForNotifications(*(obj->previewSignal));
					TTObjectBaseRelease(TTObjectBaseHandle(&obj->previewSignal));
					obj->previewSignal = NULL;
				}
				
				TTObjectBaseInstantiate(TTSymbol("callback"), TTObjectBaseHandle(&obj->previewSignal), kTTValNONE);
				
				newBaton = new TTValue(TTPtr(self));
				obj->previewSignal->setAttributeValue(kTTSym_baton, TTPtr(newBaton));
				obj->previewSignal->setAttributeValue(kTTSym_function, TTPtr(&jamoma_callback_return_signal));
				obj->previewSignal->setAttributeValue(TTSymbol("owner"), TTSymbol("j.ui"));					// this is usefull only to debug
				
				anAttribute->registerObserverForNotifications(*(obj->previewSignal));
			}
			else {
				
				if (obj->previewSignal) {
					anAttribute->unregisterObserverForNotifications(*(obj->previewSignal));
					TTObjectBaseRelease(TTObjectBaseHandle(&obj->previewSignal));
					obj->previewSignal = NULL;
				}
			}
		}
	}
	
	jbox_redraw(&obj->box);
}

void ui_return_ui_size(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	t_ui* obj = (t_ui*)self;
	t_rect* rect;
	
	rect = (t_rect*)malloc(sizeof(t_rect));
	rect->x = 0;
	rect->y = 0;
	rect->width = atom_getlong(argv);
	rect->height = atom_getlong(argv+1);

	object_attr_set_rect((t_object*)obj, _sym_presentation_rect, rect);
	
	jbox_redraw(&obj->box);
	free(rect);
}

void ui_return_ui_freeze(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	t_ui* obj = (t_ui*)self;
    TTNodePtr   modelNode;
    TTErr       err;
	
	if (argc == 1)
		obj->ui_freeze = atom_getlong(argv);
	
	// get the TTContainer object of the view patch
    err = JamomaDirectory->getTTNode(obj->viewAddress, &modelNode);
    
    if (!err) {
        
        if (modelNode->getObject()) {
            
            // set freeze attribute to all j.remote (on 3 levels only as we don't have the // operator)
            jamoma_container_send(TTContainerPtr(modelNode->getObject()), gensym("*.*:freeze"), argc, argv);
            jamoma_container_send(TTContainerPtr(modelNode->getObject()), gensym("*.*/*.*:freeze"), argc, argv);
            jamoma_container_send(TTContainerPtr(modelNode->getObject()), gensym("*.*/*.*/*.*:freeze"), argc, argv);
        }
    }
}

void ui_return_color_contentBackground(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	t_ui* obj = (t_ui*)self;
	
	// Colors default to "0". If default value is passed, we avoid setting the color, in order to stick to object defaults.
	if (argc>1)
		object_attr_setvalueof(obj, _sym_bgcolor, argc, argv);
}

void ui_return_color_toolbarBackground(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	t_ui* obj = (t_ui*)self;
	
	if (argc>1)
		object_attr_setvalueof(obj, gensym("headercolor"), argc, argv);
}

void ui_return_color_toolbarText(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	t_ui* obj = (t_ui*)self;
	
	if (argc>1)
		object_attr_setvalueof(obj, _sym_textcolor, argc, argv);
}

void ui_return_color_border(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	t_ui* obj = (t_ui*)self;
	
	if (argc>1) {
		object_attr_setvalueof(obj, gensym("bordercolor"), argc, argv);
		obj->memo_bordercolor = obj->bordercolor;
	}
}

void ui_return_model_address(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
    ObjectPtr obj = (ObjectPtr)self;
    
    // The following must be deferred because we have to interrogate our box,
	// and our box is not yet valid until we have finished instantiating the object.
	// Trying to use a loadbang method instead is also not fully successful (as of Max 5.0.6)
	defer_low(obj, (method)ui_subscribe, atom_getsym(argv), 0, 0);
}

void ui_return_model_init(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	t_ui*           obj = (t_ui*)self;
	long            init = atom_getlong(argv);
	TTValue         v;
    TTObjectBasePtr aReceiver;
	
    // if the model is initialized and no content observer have been created
	if (init) {
		
        if (obj->hash_receivers->lookup(kTTSym_content, v))
            
            // observe the content of the model
            // by this way, the creation of any widgets depends on the existence of the data
            ui_receiver_create(obj, &aReceiver, gensym("return_model_content"), kTTSym_content, obj->modelAddress, NO, YES);
        
        else {
            
            // get the content of the model
            aReceiver = v[0];
            aReceiver->sendMessage(kTTSym_Get);
        }
	}
}

void ui_return_model_content(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
    t_ui* obj = (t_ui*)self;
	TTObjectBasePtr anObject;
	TTBoolean	gain = NO;
	TTBoolean	mix = NO;
	TTBoolean	bypass = NO;
	TTBoolean	freeze = NO;
	TTBoolean	preview = NO;
    TTBoolean	mute = NO;
	TTBoolean	preset = NO;		// is there a preset node in the model ?
	TTBoolean	model = NO;			// is there a model node in the model ?
	TTBoolean	change = NO;
	TTAddress   relativeAddress;
    TTBoolean   dataInput = NO;
    TTBoolean   dataOutput = NO;
    TTBoolean   audioInput = NO;
    TTBoolean   audioOutput = NO;
    
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
            
            else if (relativeAddress.getParent() == TTSymbol("model"))
				model = true;
		}
        
        if (dataInput || dataOutput)
            mute = true;
        
        if (dataInput && dataOutput)
            bypass = true;
        
        if (dataOutput) {
            freeze = true;
            preview = true;
        }
        
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
				ui_viewer_create(obj, &anObject, gensym("return_gain"), TTSymbol("*.*/gain"), obj->modelAddress, YES);
			else {
				ui_viewer_destroy(obj, TTSymbol("*.*/gain"));
				obj->hash_viewers->remove(TTSymbol("*.*/gain"));
			}
		}
		
		// mix
		if (mix != obj->has_mix) {
			obj->has_mix = mix;
			if (mix)
				ui_viewer_create(obj, &anObject, gensym("return_mix"), TTSymbol("*.*/mix"), obj->modelAddress, YES);
			else {
				ui_viewer_destroy(obj, TTSymbol("*.*/mix"));
				obj->hash_viewers->remove(TTSymbol("*.*/mix"));
			}
			
			change = true;
		}
		
		// bypass
		if (bypass != obj->has_bypass) {
			obj->has_bypass = bypass;
			if (bypass)
				ui_viewer_create(obj, &anObject, gensym("return_bypass"), TTSymbol("*.*/bypass"), obj->modelAddress, YES);
			else {
				ui_viewer_destroy(obj, TTSymbol("*.*/bypass"));
				obj->hash_viewers->remove(TTSymbol("*.*/bypass"));
			}
			
			change = true;
		}
		
		// freeze
		if (freeze != obj->has_freeze) {
			obj->has_freeze = freeze;
			if (freeze)
				ui_viewer_create(obj, &anObject, gensym("return_freeze"), TTSymbol("*.*/freeze"), obj->modelAddress, YES);
			else {
				ui_viewer_destroy(obj, TTSymbol("*.*/freeze"));
				obj->hash_viewers->remove(TTSymbol("*.*/freeze"));
			}
			
			change = true;
		}
		
		// preview
		if (preview != obj->has_preview) {
			obj->has_preview = preview;
			if (preview)
				ui_viewer_create(obj, &anObject, gensym("return_preview"), TTSymbol("*.*/preview"), obj->modelAddress, YES);
			else {
				ui_viewer_destroy(obj, TTSymbol("*.*/preview"));
				obj->hash_viewers->remove(TTSymbol("*.*/preview"));
			}
			
			change = true;
		}
		
		// mute
		if (mute != obj->has_mute) {
			obj->has_mute = mute;
			if (mute)
				ui_viewer_create(obj, &anObject, gensym("return_mute"), TTSymbol("*.*/mute"), obj->modelAddress, YES);
			else {
				ui_viewer_destroy(obj, TTSymbol("*.*/mute"));
				obj->hash_viewers->remove(TTSymbol("*.*/mute"));
			}
			
			change = true;
		}
		
		// preset
		if (preset != obj->has_preset) {
			obj->has_preset = preset;
			if (preset) {
				ui_viewer_create(obj, &anObject, NULL, TTSymbol("preset:recall"), obj->modelAddress, NO);
				ui_viewer_create(obj, &anObject, NULL, TTSymbol("preset:store"), obj->modelAddress, NO);
				ui_viewer_create(obj, &anObject, gensym("return_preset_names"), TTSymbol("preset:names"), obj->modelAddress, NO);
			}
			else {
				ui_viewer_destroy(obj, TTSymbol("recall"));
				obj->hash_viewers->remove(TTSymbol("recall"));
				ui_viewer_destroy(obj, TTSymbol("store"));
				obj->hash_viewers->remove(TTSymbol("store"));
				ui_viewer_destroy(obj, TTSymbol("names"));
				obj->hash_viewers->remove(TTSymbol("names"));
			}
			
			change = true;
		}
		
		// model
		if (model != obj->has_model) {
			obj->has_model = model;
			if (model) {
                ui_viewer_create(obj, &anObject, NULL, TTSymbol("model/open"), obj->modelAddress, NO);
				ui_viewer_create(obj, &anObject, NULL, TTSymbol("model/help"), obj->modelAddress, NO);
                ui_viewer_create(obj, &anObject, NULL, TTSymbol("model/reference"), obj->modelAddress, NO);
            }
			else {
                ui_viewer_destroy(obj, TTSymbol("model/open"));
				obj->hash_viewers->remove(TTSymbol("model/open"));
				ui_viewer_destroy(obj, TTSymbol("model/help"));
				obj->hash_viewers->remove(TTSymbol("model/help"));
                ui_viewer_destroy(obj, TTSymbol("model/reference"));
				obj->hash_viewers->remove(TTSymbol("model/reference"));
			}
			
			change = true;
		}
		
		if (change)
			jbox_redraw(&obj->box);
		
	}
}

void ui_return_signal(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	t_ui* obj = (t_ui*)self;
	
	if (argc && argv) {
		
		if (msg == _sym_nothing)
			outlet_atoms(obj->outlets[preview_out], argc, argv);
		else
			outlet_anything(obj->outlets[preview_out], msg, argc, argv);
	}
}
