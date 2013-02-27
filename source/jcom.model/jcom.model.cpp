/* 
 * jcom.model | view
 * External for Jamoma : the main control center of a model | view patcher
 * By Tim Place and Théo de la Hogue, Copyright � 2010
 * 
 * License: This code is licensed under the terms of the "New BSD License"
 * http://creativecommons.org/licenses/BSD/
 */

#include "TTModularClassWrapperMax.h"

// This is used to store extra data
typedef struct extra {
	ObjectPtr			modelInternal;		// store an internal model patcher
	TTAddress           modelAddress;		// store the /model/address parameter
	TTBoolean			component;			// is the model a simple component ?
    
    TTString            *text;				// the text of the editor to read after edclose
	ObjectPtr           textEditor;			// the text editor window
} t_extra;
#define EXTRA ((t_extra*)x->extra)

#define data_out 0
#define dump_out 1

// Definitions
void		WrapTTContainerClass(WrappedClassPtr c);
void		WrappedContainerClass_new(TTPtr self, AtomCount argc, AtomPtr argv);
void		WrappedContainerClass_free(TTPtr self);
void		WrappedContainerClass_anything(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);

void		model_assist(TTPtr self, void *b, long msg, long arg, char *dst);

void		model_share_patcher_info(TTPtr self, TTValuePtr patcherInfo);
void		model_share_patcher_node(TTPtr self, TTNodePtr *patcherNode);

void		model_return_address(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);
void		model_return_value(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);

void		model_subscribe(TTPtr self);

void		model_init(TTPtr self);

void		model_list(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);

void		model_help(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);
void		model_reference(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);
void		model_open(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);
//void		model_mute(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);
void		model_address(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);		// only in view patch

void		model_autodoc(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);
void		model_doautodoc(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);

void		model_edit(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);
void		model_edclose(TTPtr self, char **text, long size);
void		model_doedit(TTPtr self);

int TTCLASSWRAPPERMAX_EXPORT main(void)
{
	ModularSpec *spec = new ModularSpec;
	spec->_wrap = &WrapTTContainerClass;
	spec->_new = &WrappedContainerClass_new;
	spec->_free = &WrappedContainerClass_free;
	spec->_any = &WrappedContainerClass_anything;

#ifndef JCOM_VIEW
	return wrapTTModularClassAsMaxClass(kTTSym_Container, "jcom.model", NULL, spec);
#else
	return wrapTTModularClassAsMaxClass(kTTSym_Container, "jcom.view", NULL, spec);
#endif
}

void WrapTTContainerClass(WrappedClassPtr c)
{
	class_addmethod(c->maxClass, (method)model_assist,					"assist",				A_CANT, 0L);
	
	class_addmethod(c->maxClass, (method)model_share_patcher_info,		"share_patcher_info",	A_CANT, 0);
	class_addmethod(c->maxClass, (method)model_share_patcher_node,		"share_patcher_node",	A_CANT, 0);
	
	class_addmethod(c->maxClass, (method)model_return_address,			"return_address",		A_CANT, 0);
	class_addmethod(c->maxClass, (method)model_return_value,			"return_value",			A_CANT, 0);
	
	class_addmethod(c->maxClass, (method)model_help,					"model_help",			A_CANT, 0);
	class_addmethod(c->maxClass, (method)model_reference,				"model_reference",		A_CANT, 0);
	class_addmethod(c->maxClass, (method)model_open,                    "model_open",		A_CANT, 0);
//	class_addmethod(c->maxClass, (method)model_mute,					"model_mute",			A_CANT, 0);
	class_addmethod(c->maxClass, (method)model_address,					"model_address",		A_CANT, 0);
	class_addmethod(c->maxClass, (method)model_autodoc,					"doc_generate",			A_CANT, 0);
    class_addmethod(c->maxClass, (method)model_edit,					"model_edit",			A_CANT, 0);
    
    class_addmethod(c->maxClass, (method)model_edit,					"dblclick",				A_CANT, 0);
    class_addmethod(c->maxClass, (method)model_edclose,                 "edclose",				A_CANT, 0);
}

void WrappedContainerClass_new(TTPtr self, AtomCount argc, AtomPtr argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
 	long						attrstart = attr_args_offset(argc, argv);			// support normal arguments
		
	// create a container
	jamoma_container_create((ObjectPtr)x, &x->wrappedObject);
	
#ifndef JCOM_VIEW
	x->patcherContext = kTTSym_model;
	x->wrappedObject->setAttributeValue(kTTSym_tag, kTTSym_model);
#else
	x->patcherContext = kTTSym_view;
	x->wrappedObject->setAttributeValue(kTTSym_tag, kTTSym_view);
#endif
	
	// handle attribute args
	attr_args_process(x, argc, argv);
		
	// Make two outlets
	x->outlets = (TTHandle)sysmem_newptr(sizeof(TTPtr) * 1);
	x->outlets[data_out] = outlet_new(x, NULL);						// anything outlet to output data
	
	// Prepare memory to store internal datas
	x->internals = new TTHash();
	
	// Prepare extra data
	x->extra = (t_extra*)malloc(sizeof(t_extra));
	EXTRA->modelAddress = kTTAdrsEmpty;
    EXTRA->text = NULL;
	EXTRA->textEditor = NULL;
	
	// read first argument to know if the model is a component
	if (attrstart && argv) {
		if (atom_getsym(argv) == gensym("component"))
			EXTRA->component = YES;
		else
			object_error((ObjectPtr)x, "%s is not expected as argument", atom_getsym(argv)->s_name);
	}
	
	// The following must be deferred because we have to interrogate our box,
	// and our box is not yet valid until we have finished instantiating the object.
	// Trying to use a loadbang method instead is also not fully successful (as of Max 5.0.6)
	defer_low((ObjectPtr)x, (method)model_subscribe, NULL, 0, 0);
}

void WrappedContainerClass_free(TTPtr self)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	free(EXTRA);
}

void model_subscribe(TTPtr self)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTValue						v, args;
	TTAddress                   returnedAddress, argAdrs;
    TTNodePtr                   returnedNode = NULL;
    TTNodePtr                   returnedContextNode = NULL;
	TTSymbol					classAdrs, helpAdrs, refAdrs, openAdrs, documentationAdrs, editAdrs, muteAdrs;
	TTObjectBasePtr				aData;
	TTTextHandlerPtr			aTextHandler;
    TTPresetPtr                 aPreset;
	TTPtr						context;
	TTList						whereToSearch;
	TTBoolean					isThere, isSubModel;
	TTNodePtr					firstTTNode;
	TTAddress                   containerAdrs;
	AtomCount					ac;
	AtomPtr						av;
	ObjectPtr					aPatcher = jamoma_patcher_get((ObjectPtr)x);

	// if the subscription is successful
	if (!jamoma_subscriber_create((ObjectPtr)x, x->wrappedObject, kTTAdrsEmpty, &x->subscriberObject, returnedAddress, &returnedNode, &returnedContextNode)) {
		
		// get all info relative to our patcher
		jamoma_patcher_get_info((ObjectPtr)x, &x->patcherPtr, x->patcherContext, x->patcherClass, x->patcherName);
		
		// set the address attribute of the Container 
		x->wrappedObject->setAttributeValue(kTTSym_address, returnedAddress);
		
		// if the jcom.model is well subscribed
		if (aPatcher == x->patcherPtr && x->patcherContext != kTTSymEmpty) {
			
			// no internal parameter for component
			if (!EXTRA->component) {
				
				if (x->patcherContext == kTTSym_model) {
					classAdrs = TTSymbol("model/class");
					helpAdrs =  TTSymbol("model/help");
					refAdrs = TTSymbol("model/reference");
					openAdrs = TTSymbol("model/open");
					documentationAdrs = TTSymbol("model/documentation/generate");
                    editAdrs = TTSymbol("model/edit");
					//muteAdrs = TTSymbol("model/mute");
				}
				else if (x->patcherContext == kTTSym_view) {
					classAdrs = TTSymbol("view/class");
					helpAdrs =  TTSymbol("view/help");
					refAdrs = TTSymbol("view/reference");
					openAdrs = TTSymbol("view/open");
					documentationAdrs = TTSymbol("view/documentation/generate");
					//muteAdrs = TTSymbol("view/mute");
				}
				
				// Add a /class data
				makeInternals_data(x, returnedAddress, classAdrs, gensym("model_class"), context, kTTSym_return, &aData);
				aData->setAttributeValue(kTTSym_type, kTTSym_string);
				aData->setAttributeValue(kTTSym_tag, kTTSym_generic);
				aData->setAttributeValue(kTTSym_description, TTSymbol("The patcher class"));
				aData->setAttributeValue(kTTSym_value, x->patcherClass);
				
				// Add a /help data
				makeInternals_data(x, returnedAddress, helpAdrs, gensym("model_help"), context, kTTSym_message, &aData);
				aData->setAttributeValue(kTTSym_type, kTTSym_none);
				aData->setAttributeValue(kTTSym_tag, kTTSym_generic);
				aData->setAttributeValue(kTTSym_description, TTSymbol("Open the maxhelp patch"));
				
				// Add a /reference data
				makeInternals_data(x, returnedAddress, refAdrs, gensym("model_reference"), context, kTTSym_message, &aData);
				aData->setAttributeValue(kTTSym_type, kTTSym_none);
				aData->setAttributeValue(kTTSym_tag, kTTSym_generic);
				aData->setAttributeValue(kTTSym_description, TTSymbol("Open the reference page"));
				
				// Add a /open data
				makeInternals_data(x, returnedAddress, openAdrs, gensym("model_open"), context, kTTSym_message, &aData);
				aData->setAttributeValue(kTTSym_type, kTTSym_none);
				aData->setAttributeValue(kTTSym_tag, kTTSym_generic);
				aData->setAttributeValue(kTTSym_description, TTSymbol("Open the patcher"));
				
				/* Add a /model/mute data
				makeInternals_data(x, nodeAdrs, muteAdrs, gensym("model_mute"), context, kTTSym_parameter, &aData);
				aData->setAttributeValue(kTTSym_type, kTTSym_boolean);
				aData->setAttributeValue(kTTSym_tag, kTTSym_generic);
				aData->setAttributeValue(kTTSym_priority, -1); // very high priority flag
				aData->setAttributeValue(kTTSym_description, TTSymbol("Mute all parameters in the patcher"));
                 */
                
                // for model auto documentation :
                if (x->patcherContext == kTTSym_model) {
                    
                    // Add a /documentation/generate data
                    makeInternals_data(x, returnedAddress, documentationAdrs, gensym("doc_generate"), context, kTTSym_message, &aData);
                    aData->setAttributeValue(kTTSym_type, kTTSym_none);
                    aData->setAttributeValue(kTTSym_tag, kTTSym_generic);
                    aData->setAttributeValue(kTTSym_description, TTSymbol("Make a html page description"));
                    
                    // create internal TTTextHandler
                    aTextHandler = NULL;
                    TTObjectBaseInstantiate(kTTSym_TextHandler, TTObjectBaseHandle(&aTextHandler), args);
                    v = TTValue(aTextHandler);
                    x->internals->append(kTTSym_TextHandler, v);
                    v = TTValue(x->wrappedObject);
                    aTextHandler->setAttributeValue(kTTSym_object, v);
                }
                
                // for model state management :
                if (x->patcherContext == kTTSym_model) {
                    
                    // Add a /model/edit data
                    makeInternals_data(x, returnedAddress, editAdrs, gensym("model_edit"), context, kTTSym_message, &aData);
                    aData->setAttributeValue(kTTSym_type, kTTSym_none);
                    aData->setAttributeValue(kTTSym_tag, kTTSym_generic);
                    aData->setAttributeValue(kTTSym_description, TTSymbol("Edit the state of the model"));
                    
                    // create internal TTPreset
                    aPreset = NULL;
                    TTObjectBaseInstantiate(kTTSym_Preset, TTObjectBaseHandle(&aPreset), args);
                    v = TTValue(aPreset);
                    x->internals->append(kTTSym_Preset, v);
                    v = TTValue(returnedAddress);
                    aPreset->setAttributeValue(kTTSym_address, v);
                    v = TTValue(TTSymbol("state"));
                    aPreset->setAttributeValue(kTTSym_name, v);
                }
			}
			
			// In model *and* view patcher : Add /model/address data
			if (x->patcherContext == kTTSym_model) // as return
				makeInternals_data(x, returnedAddress,  TTSymbol("model/address"), gensym("model_address"), context, kTTSym_return, &aData);
			
			if (x->patcherContext == kTTSym_view) // as parameter
				makeInternals_data(x, returnedAddress,  TTSymbol("model/address"), gensym("model_address"), context, kTTSym_parameter, &aData);
			
			aData->setAttributeValue(kTTSym_type, kTTSym_string);
			aData->setAttributeValue(kTTSym_tag, kTTSym_generic);
			aData->setAttributeValue(kTTSym_description, TTSymbol("The model address to bind for the view. A model patcher bind on himself"));
			aData->setAttributeValue(kTTSym_priority, -1); // very high priority flag
			
			// Get patcher arguments
			ac = 0;
			av = NULL;
			
			// If x is in a bpatcher, the patcher is NULL
			if (!aPatcher)
				aPatcher = object_attr_getobj(x, _sym_parentpatcher);
			
			jamoma_patcher_get_args(aPatcher, &ac, &av);
			
			// check if it's a sub model
			isSubModel = atom_getsym(av) == _sym_p;
			
			// in subpatcher the name of the patcher is part of the argument
			if (jamoma_patcher_get_hierarchy(aPatcher) == _sym_subpatcher) {
				ac--;
				av++;
			}
			
			// In model patcher : set /model/address with his address
			if (x->patcherContext == kTTSym_model) {
				aData->setAttributeValue(kTTSym_value, returnedAddress);
				
				// use aPatcher args to setup the model attributes (like @priority)
				if (ac && av)
					attr_args_process(x, ac, av);
			}
			
			// In view patcher :
			if (x->patcherContext == kTTSym_view) {
					
				// look for a model of the same class into the patcher to get his model/address
				jamoma_patcher_get_model_patcher(x->patcherPtr, x->patcherClass, &aPatcher);
				
				// if a model exists
				if (aPatcher) {
					
					// is there a container (e.g. a jcom.model) registered with the same context in this model patcher ?
					whereToSearch.append(JamomaDirectory->getRoot());
					JamomaDirectory->IsThere(&whereToSearch, &testNodeContext, (TTPtr)aPatcher, &isThere, &firstTTNode);
					
					if (isThere) {
						firstTTNode->getAddress(containerAdrs);
						EXTRA->modelAddress = containerAdrs;
					}
				}

				// else, if args exists, the first argument of the patcher is the model/address value
				else if (ac > 0) {
					
					argAdrs = TTAddress(atom_getsym(av)->s_name);
					
					// the model/address have to be absolute
					if (argAdrs.getType() == kAddressAbsolute)
						EXTRA->modelAddress = argAdrs;
					else
						EXTRA->modelAddress = kTTAdrsRoot.appendAddress(argAdrs);
				}
                // else the view is not binding a model for instant
                else
                    EXTRA->modelAddress = TTAddress("/noModelAddress");
				
                // set the model/address data value to notify all observers
                aData->setAttributeValue(kTTSym_value, EXTRA->modelAddress);
			}
			
			// output ContextNode address
			Atom a;
			x->subscriberObject->getAttributeValue(TTSymbol("contextNodeAddress"), v);
            
            if (v.size() == 1) {
                returnedAddress = v[0];
                atom_setsym(&a, gensym((char*)returnedAddress.c_str()));
                object_obex_dumpout(self, gensym("address"), 1, &a);
            }
			
			// init the model (but not subModel)
			if (!isSubModel)
				defer_low(x, (method)model_init, 0, 0, 0L);
		}
	}
}

void model_init(TTPtr self)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTBoolean	initialized;
	TTValue		v;
	
	// Check if the model has not been initialized by a upper model
	x->wrappedObject->getAttributeValue(kTTSym_initialized, v);
	initialized = v[0];
	if (!initialized)
		x->wrappedObject->sendMessage(kTTSym_Init);
}

// Method for Assistance Messages
void model_assist(TTPtr self, void *b, long msg, long arg, char *dst)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	
	if (msg==1)			// Inlets
		strcpy(dst, "");		
	else {							// Outlets
		switch(arg) {
			case data_out:
				if (x->patcherContext == kTTSym_model)
					strcpy(dst, "model feeback");
				else if (x->patcherContext == kTTSym_view)
					strcpy(dst, "view feeback");
				else 
					strcpy(dst, "feeback");
				break;
			case dump_out:
				strcpy(dst, "dumpout");
				break;
		}
 	}
}

void model_share_patcher_info(TTPtr self, TTValuePtr patcherInfo)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	patcherInfo->clear();
	
	if (x->patcherPtr && x->patcherContext != kTTSymEmpty && x->patcherClass != kTTSymEmpty && x->patcherName != kTTSymEmpty) {
		patcherInfo->append((TTPtr)x->patcherPtr);
		patcherInfo->append(x->patcherContext);
		patcherInfo->append(x->patcherClass);
		patcherInfo->append(x->patcherName);
	}
}

void model_share_patcher_node(TTPtr self, TTNodePtr *patcherNode)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTValue v;
	
	if (x->subscriberObject) {
		x->subscriberObject->getAttributeValue(TTSymbol("contextNode"), v);
		*patcherNode = TTNodePtr((TTPtr)v[0]);
	}
}

void model_list(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	
	// the msg have to contains a relative address
	jamoma_container_send((TTContainerPtr)x->wrappedObject, msg, argc, argv);
}

void WrappedContainerClass_anything(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	
	// the msg have to contains a relative address
	jamoma_container_send((TTContainerPtr)x->wrappedObject, msg, argc, argv);
}

void model_return_address(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	x->msg = msg;
}

void model_return_value(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	
	outlet_anything(x->outlets[data_out], x->msg, argc, argv);
}

void model_help(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	
	// opening the module helpfile (no help file dedicated for model or view)
	if (x->patcherClass != kTTSymEmpty) {
		
		SymbolPtr helpfileName;
		jamoma_edit_filename(*HelpPatcherFormat, x->patcherClass, &helpfileName);
		classname_openhelp((char*)helpfileName->s_name);
	}
}

void model_reference(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	
	if (x->patcherContext != kTTSymEmpty && x->patcherClass != kTTSymEmpty) {
		
		SymbolPtr refpagefileName;
		jamoma_edit_filename(*RefpageFormat, x->patcherClass, &refpagefileName);
		classname_openrefpage((char*)refpagefileName->s_name);
	}
}

void model_open(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	
	ObjectPtr p = jamoma_patcher_get((ObjectPtr)x);
	
	object_method(p, _sym_vis);
}

void model_autodoc(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	defer(self, (method)model_doautodoc, msg, argc, argv);
}

void model_doautodoc(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	char				filename[MAX_FILENAME_CHARS];
	TTSymbol			fullpath;
	TTValue				o, v;
	TTTextHandlerPtr	aTextHandler;
	TTErr				tterr;
	
	if (x->wrappedObject) {
		
		// Default HTML file name
		snprintf(filename, MAX_FILENAME_CHARS, DocumentationFormat->data(), x->patcherClass.c_str());
		fullpath = jamoma_file_write((ObjectPtr)x, argc, argv, filename);
		v.append(fullpath);
		
		tterr = x->internals->lookup(TTSymbol("TextHandler"), o);
		
		if (!tterr) {
			aTextHandler = TTTextHandlerPtr((TTObjectBasePtr)o[0]);
			
			critical_enter(0);
			aTextHandler->sendMessage(TTSymbol("Write"), v, kTTValNONE);
			critical_exit(0);
		}
	}
}

/*
void model_mute(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	ObjectPtr					patcher = jamoma_patcher_get((ObjectPtr)x);
	long						mute;
	t_atom						a[2];
	
	// 'setrock' is the message that is used by pcontrol to enable patcher
	// it was inside former jcom.in or out. Not sure for what it was used (audio mute maybe...)
	
	if (argc && argv)
		if (atom_gettype(argv) == A_LONG) {
			mute = atom_getlong(argv);
			atom_setlong(a+0, !mute);
			atom_setlong(a+1, 1);
			object_method(patcher, gensym("setrock"), 2, a);
		}
}
*/

void model_address(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	
	// In view patcher only
	if (x->patcherContext == kTTSym_view) {
		
		if (atom_gettype(argv) == A_SYM) {
			EXTRA->modelAddress = TTAddress(atom_getsym(argv)->s_name);
		}
	}
}

void model_edit(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTString			*buffer;
	char				title[MAX_FILENAME_CHARS];
	TTTextHandlerPtr	aTextHandler = NULL;
	TTPresetPtr			aPreset = NULL;
	TTValue				o1, o2, args;
	TTSymbol			name;
	TTErr				tterr1, tterr2;
	
	// only one editor can be open in the same time
	if (!EXTRA->textEditor) {
        
		EXTRA->textEditor = (t_object*)object_new(_sym_nobox, _sym_jed, x, 0);
		
		buffer = new TTString();
		
		// get the text handler
		tterr1 = x->internals->lookup(kTTSym_TextHandler, o1);
        
        // get the preset handler
		tterr2 = x->internals->lookup(kTTSym_Preset, o2);
		
		if (!tterr1 && !tterr2) {
			
			aTextHandler = TTTextHandlerPtr((TTObjectBasePtr)o1[0]);
            aPreset = TTPresetPtr((TTObjectBasePtr)o2[0]);
            
            // Store the preset
            aPreset->sendMessage(TTSymbol("Store"), kTTValNONE, kTTValNONE);
			
			critical_enter(0);
			args = TTValue(TTPtr(aPreset));
			aTextHandler->setAttributeValue(kTTSym_object, args);
			args = TTValue((TTPtr)buffer);
			tterr1 = aTextHandler->sendMessage(kTTSym_Write, args, kTTValNONE);
			critical_exit(0);
		}
		
		// pass the buffer to the editor
		object_method(EXTRA->textEditor, _sym_settext, buffer->c_str(), _sym_utf_8);
		object_attr_setchar(EXTRA->textEditor, gensym("scratch"), 1);
		
		snprintf(title, MAX_FILENAME_CHARS, "%s state editor", x->patcherClass.c_str());
		object_attr_setsym(EXTRA->textEditor, _sym_title, gensym(title));
		
		buffer->clear();
		delete buffer;
		buffer = NULL;
	}
}

void model_edclose(TTPtr self, char **text, long size)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	
	EXTRA->text = new TTString(*text);
	EXTRA->textEditor = NULL;
	
	defer_low((ObjectPtr)x, (method)model_doedit, NULL, 0, NULL);
}

void model_doedit(TTPtr self)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTTextHandlerPtr	aTextHandler = NULL;
    TTPresetPtr			aPreset = NULL;
	TTValue				o1, o2, args;
	TTErr				tterr1, tterr2;
	
	// get the text handler
	tterr1 = x->internals->lookup(kTTSym_TextHandler, o1);
    
    // get the preset handler
    tterr2 = x->internals->lookup(kTTSym_Preset, o2);
	
	if (!tterr1 && !tterr2) {
		
		aTextHandler = TTTextHandlerPtr((TTObjectBasePtr)o1[0]);
        aPreset = TTPresetPtr((TTObjectBasePtr)o2[0]);
		
		critical_enter(0);
        args = TTValue(TTPtr(aPreset));
        aTextHandler->setAttributeValue(kTTSym_object, args);
		args = TTValue((TTPtr)EXTRA->text);
		tterr1 = aTextHandler->sendMessage(kTTSym_Read, args, kTTValNONE);
		critical_exit(0);
		
		// recall the preset
        aPreset->sendMessage(kTTSym_Recall, kTTValNONE, kTTValNONE);
		
		if (!tterr1)
			object_obex_dumpout(self, _sym_read, 0, NULL);
		else
			object_obex_dumpout(self, _sym_error, 0, NULL);
	}
	
	delete EXTRA->text;
	EXTRA->text = NULL;
	EXTRA->textEditor = NULL;
}
