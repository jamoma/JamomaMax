/** @file
 *
 * @ingroup implementationMaxExternals
 *
 * @brief j.ui : Provide standard user interface component for modules
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
#include "TTUiInfo.h"

// class variables
static t_class		*s_ui_class = NULL;

static t_jrgba		s_color_background_button	= {0.2,			0.2,		0.2,		1.0};
static t_jrgba		s_color_border_button		= {0.4,			0.4,		0.4,		1.0};
static t_jrgba		s_color_text_button_on		= {0.7,			0.7,		0.7,		1.0};
static t_jrgba		s_color_text_button_off		= {0.6,			0.6,		0.6,		1.0};

static t_jrgba		s_color_blue_button			= {0.2,			0.2,		0.7,		1.0};
static t_jrgba		s_color_blue_ring			= {0.45,		0.45,		1.0,		1.0};
static t_jrgba		s_color_darkblue			= {0.1,			0.1,		0.5,		1.0};

static t_jrgba		s_color_orange_button		= {0.8,			0.6,		0.2,		1.0};
static t_jrgba		s_color_red_button			= {0.6,			0.2,		0.2,		1.0};

static t_jrgba		s_color_green_button		= {0.2,			0.7,		0.2,		1.0};
static t_jrgba		s_color_green_ring			= {0.25,		0.75,		0.25,		1.0};
static t_jrgba		s_color_darkgreen			= {0.05,		0.4,		0.05,		1.0};

static t_jrgba		s_color_selected			= {0.62,		0.,			0.36,		0.70};


#pragma mark -
#pragma mark life cycle

int JAMOMA_EXPORT_MAXOBJ main(void)
{
	long	flags;
	t_class *c;
	
	jamoma_init();
	common_symbols_init();
    
    TTUiInfo::registerClass();
	
	c = class_new("j.ui",
				  (method)ui_new,
				  (method)ui_free,
				  sizeof(t_ui),
				  (method)NULL,
				  A_GIMME,
				  0L);
	
	//flags = JBOX_TEXTFIELD | JBOX_COLOR;
	flags = JBOX_TEXTFIELD;
	jbox_initclass(c, flags);
	c->c_flags |= CLASS_FLAG_NEWDICTIONARY; // to specify dictionary constructor
	
	class_addmethod(c, (method)ui_notify,							"notify",							A_CANT, 0);
	class_addmethod(c, (method)ui_paint,							"paint",							A_CANT, 0);
	class_addmethod(c, (method)ui_mousedown,						"mousedown",						A_CANT, 0);
	class_addmethod(c, (method)ui_mousedragdelta,					"mousedragdelta",					A_CANT, 0);
	class_addmethod(c, (method)ui_mouseup,							"mouseup",							A_CANT, 0);
	class_addmethod(c, (method)ui_mousemove,						"mousemove",						A_CANT, 0);
	class_addmethod(c, (method)ui_mouseleave,						"mouseleave",						A_CANT, 0);
	class_addmethod(c, (method)ui_oksize,							"oksize",							A_CANT, 0);
    
    class_addmethod(c, (method)ui_edit_state,                       "dblclick",                         A_CANT, 0);
    class_addmethod(c, (method)ui_edclose,                          "edclose",                          A_CANT, 0);
	
	class_addmethod(c, (method)ui_modelParamExplorer_callback,		"return_modelParamExploration",		A_CANT, 0);
	class_addmethod(c, (method)ui_modelMessExplorer_callback,		"return_modelMessExploration",		A_CANT, 0);
	class_addmethod(c, (method)ui_modelRetExplorer_callback,		"return_modelRetExploration",		A_CANT, 0);
	
	class_addmethod(c, (method)ui_return_model_address,				"return_model_address",				A_CANT, 0);
	
	class_addmethod(c, (method)ui_return_model_init,				"return_model_init",				A_CANT, 0);
    
    class_addmethod(c, (method)ui_return_model_content,             "return_model_content",             A_CANT, 0);
	
	class_addmethod(c, (method)ui_return_mute,						"return_mute",						A_CANT, 0);
	class_addmethod(c, (method)ui_return_bypass,					"return_bypass",					A_CANT, 0);
	class_addmethod(c, (method)ui_return_mix,						"return_mix",						A_CANT, 0);
	class_addmethod(c, (method)ui_return_gain,						"return_gain",						A_CANT, 0);
	class_addmethod(c, (method)ui_return_freeze,					"return_freeze",					A_CANT, 0);
	class_addmethod(c, (method)ui_return_active,					"return_active",					A_CANT, 0);
	class_addmethod(c, (method)ui_return_preset_names,				"return_preset_names",				A_CANT, 0);
	
	CLASS_ATTR_DEFAULT(c,                                           "patching_rect",            0,      "0. 0. 300. 70.");
	CLASS_ATTR_DEFAULT(c,					                        "fontname",                 0,      JAMOMA_DEFAULT_FONT);
	CLASS_ATTR_DEFAULT(c,					                        "fontsize",                 0,      "11");
	
	CLASS_STICKY_ATTR(c,					                        "category",                 0,      "Color");
	
	CLASS_ATTR_RGBA(c,						                        "bgcolor",                  0,      t_ui,	bgcolor);
	CLASS_ATTR_DEFAULTNAME_SAVE_PAINT(c,	                        "bgcolor",                  0,      "0.93 0.93 0.93 1.0");
	CLASS_ATTR_STYLE(c,						                        "bgcolor",                  0,      "rgba");
	
	CLASS_ATTR_RGBA(c,						                        "bordercolor",              0,      t_ui,	bordercolor);
	CLASS_ATTR_DEFAULTNAME_SAVE_PAINT(c,	                        "bordercolor",              0,      "0.6 0.6 0.6 1.0");
	CLASS_ATTR_STYLE(c,						                        "bordercolor",              0,      "rgba");
	
	CLASS_ATTR_RGBA(c,						                        "headercolor",              0,      t_ui,	headercolor);
	CLASS_ATTR_DEFAULTNAME_SAVE_PAINT(c,	                        "headercolor",              0,      "0.82 0.82 0.82 1.0");
	CLASS_ATTR_STYLE(c,						                        "headercolor",              0,      "rgba");
	
	CLASS_ATTR_RGBA(c,						                        "textcolor",                0,      t_ui,	textcolor);
	CLASS_ATTR_DEFAULTNAME_SAVE_PAINT(c,	                        "textcolor",                0,      "0. 0. 0. 1.0");
	CLASS_ATTR_STYLE(c,						                        "textcolor",                0,      "rgba");
    
    CLASS_ATTR_RGBA(c,						                        "highlightcolor",           0,      t_ui,	highlightcolor);
	CLASS_ATTR_DEFAULTNAME_SAVE_PAINT(c,	                        "highlightcolor",           0,      "0. 0. 0. 1.0");
	CLASS_ATTR_STYLE(c,						                        "highlightcolor",           0,      "rgba");
	
	CLASS_STICKY_ATTR_CLEAR(c,				                        "category");
	CLASS_STICKY_ATTR(c,					                        "category",                 0,      "Jamoma");
	
	CLASS_STICKY_ATTR_CLEAR(c,				                        "category");
	
	class_register(CLASS_BOX, c);
	s_ui_class = c;
	return 0;
}

t_ui* ui_new(t_symbol *s, long argc, t_atom *argv)
{
	t_ui			*x = NULL;
	t_dictionary 	*d = NULL;
	long 			flags;
	TTValue			f, out, filters;
	
	if (!(d=object_dictionaryarg(argc, argv)))
		return NULL;	
	
    x = (t_ui*)object_alloc(s_ui_class);
	if (x) {
		flags = 0 
		| JBOX_DRAWFIRSTIN
		| JBOX_NODRAWBOX
		| JBOX_TRANSPARENT	
		| JBOX_GROWBOTH
		| JBOX_HILITE
		| JBOX_BACKGROUND
		| JBOX_MOUSEDRAGDELTA
		| JBOX_TEXTFIELD
		;
		
		jbox_new(&x->box, flags, argc, argv);
		x->box.b_firstin = (t_object *)x;
		
		// Make two outlets
		x->outlets = (TTHandle)sysmem_newptr(sizeof(TTPtr) * 1);
		x->outlets[panel_out] = outlet_new(x, NULL);						// outlet to open panel

        x->uiInfo = NULL;
		
		x->menu_items = NULL;
		x->refmenu_items = NULL;
		x->hash_datas = new TTHash();
		x->hash_viewers = new TTHash();
		x->hash_receivers = new TTHash();
		x->preset_names = NULL;
		x->preset_num = 0;
		
		jbox_ready(&x->box);
		
		x->menu_items = (t_linklist *)linklist_new();
		x->menu_qelem = qelem_new(x, (method)ui_menu_qfn);
		
		x->refmenu_items = (t_linklist *)linklist_new();
		x->refmenu_qelem = qelem_new(x, (method)ui_refmenu_qfn);
		
		x->viewAddress = kTTAdrsEmpty;
		x->modelAddress = kTTAdrsEmpty;
        x->patcherPtr = NULL;
        x->patcherContext = kTTSymEmpty;
        x->patcherClass = kTTSymEmpty;
        x->patcherName = kTTSymEmpty;
		
        x->highlight = false;
		x->hover = false;
		
		x->has_preset = false;
		x->has_model = false;
		x->has_panel = false;
		x->has_mute = false;
		x->has_gain = false;
		x->has_bypass = false;
		x->has_mix = false;
		x->has_active = false;
		x->has_freeze = false;
		
		x->highlight_mute = false;
		x->highlight_gain = false;
		x->highlight_bypass = false;
		x->highlight_mix = false;
		x->highlight_active = false;
		x->highlight_freeze = false;
        
        x->text = NULL;
        x->textEditor = NULL;
        x->textHandler = NULL;
        x->state = NULL;
        
        x->patcher_panel = NULL;
        
		attr_dictionary_process(x, d); 	// handle attribute args
		
		// The following must be deferred because we have to interrogate our box,
		// and our box is not yet valid until we have finished instantiating the object.
		// Trying to use a loadbang method instead is also not fully successful (as of Max 5.0.6)
		defer_low((t_object*)x, (method)ui_register_info, NULL, 0, 0);
		
		// The following must be deferred because we have to interrogate our box,
		// and our box is not yet valid until we have finished instantiating the object.
		// Trying to use a loadbang method instead is also not fully successful (as of Max 5.0.6)
		defer_low((t_object*)x, (method)ui_build, NULL, 0, 0);
        
        // The following must be deferred because we have to interrogate our box,
		// and our box is not yet valid until we have finished instantiating the object.
		// Trying to use a loadbang method instead is also not fully successful (as of Max 5.0.6)
		defer_low((t_object*)x, (method)ui_view_panel_attach, NULL, 0, 0);
	}
	return x;
}

void ui_free(t_ui *x)
{
	jbox_free(&x->box);
	
	qelem_free(x->menu_qelem);
	x->menu_qelem = NULL;
	object_free(x->menu_items);
	
	qelem_free(x->refmenu_qelem);
	x->refmenu_qelem = NULL;
	object_free(x->refmenu_items);
	
    if (x->preset_names)
		sysmem_freeptr(x->preset_names);
	
    ui_receiver_destroy_all(x);
    
	ui_unregister_info(x);
	ui_viewer_destroy_all(x);
}


#pragma mark -
#pragma mark methods

t_max_err ui_notify(t_ui *x, t_symbol *s, t_symbol *msg, void *sender, void *data)
{
	t_object	*textfield;
	t_symbol	*attrname;
	
	if ((msg == _sym_attr_modified) && (sender == x)) {
		attrname = (t_symbol *)object_method((t_object *)data, gensym("getname"));
		textfield = jbox_get_textfield((t_object*) x);
		if (textfield)
			textfield_set_textcolor(textfield, &x->textcolor);
		
		if (attrname == gensym("address"))
			object_method(textfield, gensym("settext"), x->modelAddress.c_str());
		
		jbox_redraw(&x->box);
	}
	return jbox_notify((t_jbox*)x, s, msg, sender, data);
}

void ui_subscribe(t_ui *x, t_symbol *address)
{
	TTAddress       adrs = TTAddress(address->s_name);
	TTValue			v, args;
	TTAttributePtr	anAttribute;
	TTObject        aReceiver;
	TTErr			err;
    
	if ((x->modelAddress == kTTAdrsEmpty && adrs != kTTAdrsEmpty) || adrs != x->modelAddress) {
		
		x->modelAddress = adrs;
		
		// Clear all viewers
		ui_viewer_destroy_all(x);
		x->hash_viewers = new TTHash();
		
		x->has_preset = false;
		x->has_model = false;
		x->has_mute = false;
		x->has_gain = false;
		x->has_bypass = false;
		x->has_mix = false;
		x->has_active = false;
		x->has_freeze = false;
        
        if (x->preset_names) {
            sysmem_freeptr(x->preset_names);
            x->preset_names = NULL;
        }
		
        if (x->hash_receivers->lookup(kTTSym_initialized, v))
            
            // observe model initialisation to explore (the method also get the value)
            ui_receiver_create(x, aReceiver, gensym("return_model_init"), kTTSym_initialized, x->modelAddress, NO, YES);
        
        else {
            
            // update the model address and get the initialized state
            aReceiver = v[0];
            aReceiver.set(kTTSym_address, x->modelAddress.appendAttribute(kTTSym_initialized));
        }
        
        // create internal TTPreset to handle model's state
        if (!x->state.valid()) {
            x->state = TTObject(kTTSym_Preset);
            x->state.set(kTTSym_Flatten, YES);
        }
        
        // create internal TTTextHandler to edit model's state via the Max text editor
        if (!x->textHandler.valid()) {
            x->textHandler = TTObject(kTTSym_TextHandler);
            x->textHandler.set(kTTSym_object, x->state);
        }
        
        // set the model address
        x->state.set(kTTSym_address, x->modelAddress);
	}
	
	// The following must be deferred because 
	// we have to wait each component of the model are registered
	defer_low((t_object*)x, (method)ui_build, NULL, 0, 0);
}

void ui_build(t_ui *x)
{
	TTValue			v, n, p, args;
	t_symbol		*hierarchy, *moduleHierarchy;
	t_object        *box, *textfield;
    t_object        *modulePatcher, *moduleBox;
	t_rect			boxRect;
	t_rect			uiRect;
	
	// Examine the context to resize the view, set textfield, ...
    
    x->patcherPtr = jamoma_patcher_get((t_object*)x);
	hierarchy = jamoma_patcher_get_hierarchy(x->patcherPtr);
	
	box = object_attr_getobj(x->patcherPtr, gensym("box"));
	object_attr_get_rect((t_object*)x, _sym_presentation_rect, &uiRect);
	
	if (hierarchy == _sym_bpatcher) {
        
        // resize the bpatcher
		object_attr_get_rect(box, _sym_patching_rect, &boxRect);
		boxRect.width = uiRect.width;
		boxRect.height = uiRect.height;
		object_attr_set_rect(box, _sym_patching_rect, &boxRect);
		object_attr_get_rect(box, _sym_presentation_rect, &boxRect);
		boxRect.width = uiRect.width;
		boxRect.height = uiRect.height;
		object_attr_set_rect(box, _sym_presentation_rect, &boxRect);
        
        // Module CASE : is this bpatcher inside another bpatcher ?
        modulePatcher = jamoma_patcher_get(x->patcherPtr);
        moduleHierarchy = jamoma_patcher_get_hierarchy(modulePatcher);
        
        moduleBox = object_attr_getobj(modulePatcher, gensym("box"));
        
        if (moduleHierarchy == _sym_bpatcher) {
            
            // is there no j.ui object inside the module bpatcher
            if (!jamoma_patcher_get_ui(modulePatcher)) {
                
                // resize the module bpatcher
                object_attr_get_rect(moduleBox, _sym_patching_rect, &boxRect);
                boxRect.width = uiRect.width;
                boxRect.height = uiRect.height;
                object_attr_set_rect(moduleBox, _sym_patching_rect, &boxRect);
                object_attr_get_rect(moduleBox, _sym_presentation_rect, &boxRect);
                boxRect.width = uiRect.width;
                boxRect.height = uiRect.height;
                object_attr_set_rect(moduleBox, _sym_presentation_rect, &boxRect);
            }
        }
	}
	else if (hierarchy == _sym_subpatcher) {
		object_attr_get_rect(x->patcherPtr, _sym_defrect, &boxRect);
		boxRect.width = uiRect.width;
		boxRect.height = uiRect.height;				
		object_attr_set_rect(x->patcherPtr, _sym_defrect, &boxRect);				
		object_attr_setchar(x->patcherPtr, _sym_toolbarvisible, 0);	
		object_method_parse(x->patcherPtr, _sym_window, "flags nogrow", NULL);		// get rid of the grow thingies
		object_method_parse(x->patcherPtr, _sym_window, "flags nozoom", NULL);		// disable maximize button 
		object_method_parse(x->patcherPtr, _sym_window, "exec", NULL);
		
		// set the window title to the module class, j.ui shows osc_name already 
		if (x->patcherClass != kTTSymEmpty)
			object_attr_setsym(x->patcherPtr, _sym_title, gensym((char*)x->patcherClass.c_str()));
		else
			object_attr_setsym(x->patcherPtr, _sym_title, gensym("No class"));
		
		object_attr_setchar(x->patcherPtr, _sym_enablehscroll, 0);					// turn off scroll bars
		object_attr_setchar(x->patcherPtr, _sym_enablevscroll, 0);				
	}
	
	// Set the textfield to display the address
	textfield = jbox_get_textfield((t_object*) x);
	if (textfield)
        ui_paint_address(x, textfield);
    
	// Redraw
	jbox_redraw(&x->box);
}

t_object *ui_get_model_object(t_ui *x)
{
    TTNodePtr   patcherNode;
    t_object    *obj;
    t_object    *modelObject = NULL;
	t_symbol    *_sym_jclass, *_sym_jmodel = gensym("j.model");

    // get model patcher
	if (!accessApplicationLocalDirectory->getTTNode(x->modelAddress, &patcherNode)) {
	
        if (patcherNode->getContext()) {
    
            // find the j.model object inside the model patcher
            obj = object_attr_getobj((t_object*)patcherNode->getContext(), _sym_firstobject);
    
            while (obj) {
                
                _sym_jclass = object_attr_getsym(obj, _sym_maxclass);
                if (_sym_jclass == _sym_jmodel) {
                    
                    modelObject = object_attr_getobj(obj, _sym_object);
                    break;
                }
                obj = object_attr_getobj(obj, _sym_nextobject);
            }
        }
    }
    
    return modelObject;
}

#pragma mark -
#pragma mark drawing and appearance

void ui_paint(t_ui *x, t_object *view)
{
    TTSymbol    highlight = kTTSym_none;
    TTValue     v;
	t_rect 		rect;
	t_jgraphics *g;
	double 		border_thickness = 0.5;
	double 		cornersize = 12.0;
	double		middle;
    t_jrgba		headercolor;
    t_jrgba		bgcolor;
	t_jrgba		bordercolor;
	
	g = (t_jgraphics*) patcherview_get_jgraphics(view);
	jbox_get_rect_for_view((t_object*) &x->box, view, &rect);
    
    // process highlight
    if (x->uiInfo.valid()) {
        x->uiInfo.get("highlight", v);
        highlight = v[0];
    }

    if (highlight == kTTSym_none) {
		headercolor = x->headercolor;
		bgcolor		= x->bgcolor;
		bordercolor = x->bordercolor;
	}
	else {
		headercolor.red = 0.8*x->headercolor.red + 0.2*x->highlightcolor.red;
		headercolor.green = 0.8*x->headercolor.green + 0.2*x->highlightcolor.green;
		headercolor.blue = 0.8*x->headercolor.blue + 0.2*x->highlightcolor.blue;
		headercolor.alpha = x->headercolor.alpha;
		
		bgcolor.red = 0.8*x->bgcolor.red + 0.2*x->highlightcolor.red;
		bgcolor.green = 0.8*x->bgcolor.green + 0.2*x->highlightcolor.green;
		bgcolor.blue = 0.8*x->bgcolor.blue + 0.2*x->highlightcolor.blue;
		bgcolor.alpha = x->bgcolor.alpha;
		
		bordercolor.red = 0.8*x->bordercolor.red + 0.2*x->highlightcolor.red;
		bordercolor.green = 0.8*x->bordercolor.green + 0.2*x->highlightcolor.green;
		bordercolor.blue = 0.8*x->bordercolor.blue + 0.2*x->highlightcolor.blue;
		bordercolor.alpha = x->bordercolor.alpha;
	}
	
	// clear the background
	jgraphics_rectangle_rounded(g,  border_thickness, 
								border_thickness, 
								rect.width - ((border_thickness) * 2.0), 
								rect.height - ((border_thickness) * 2.0), 
								cornersize, cornersize); 
	jgraphics_set_source_jrgba(g, &bgcolor);
	jgraphics_fill(g);
	
	// draw the titlebar
	jgraphics_rectangle_rounded(g,  border_thickness, 
								border_thickness, 
								rect.width - (border_thickness * 2.0 + 1.0), 
								18.0, 
								cornersize, cornersize); 
	jgraphics_set_source_jrgba(g, &headercolor);
	jgraphics_fill(g);
	
	jgraphics_rectangle_fill_fast(g, border_thickness, 
								  9.0, 
								  rect.width - (border_thickness * 2.0 + 1.0), 
								  10.0);
	
	// draw borders
	jgraphics_rectangle_rounded(g,  border_thickness, 
								border_thickness, 
								rect.width - (border_thickness * 2.0), 
								rect.height - (border_thickness * 2.0), 
								cornersize, cornersize); 
	jgraphics_set_source_jrgba(g, &bordercolor);
	jgraphics_set_line_width(g, 1.0);
	jgraphics_stroke(g);
	
	jgraphics_set_line_width(g, 1.0);
	jgraphics_move_to(g, border_thickness, 19.5);
	jgraphics_line_to(g, rect.width - (border_thickness * 1.0), 19.5);
	jgraphics_stroke(g);
	
	// draw the menu icon
	jgraphics_set_line_width(g, 1.5);
	jgraphics_arc(g, 9.5, 9.5, 6.5, 0., JGRAPHICS_2PI);
	jgraphics_fill(g);
	
	jgraphics_set_source_jrgba(g, &s_color_border_button);
	jgraphics_arc(g, 9.5, 9.5, 6.5, 0., JGRAPHICS_2PI);
	jgraphics_stroke(g);
	
	middle = 9.0;
	jgraphics_move_to(g, 9.5, middle + 4.0);
	jgraphics_line_to(g, 13.5, middle);
	jgraphics_line_to(g, 5.5, middle);
	jgraphics_close_path(g);
	jgraphics_fill(g);
	
	// draw the gain knob
	if (x->has_gain) {
		long right_side = rect.width - 16.0;
		float gain = x->gain;
		TTLimit(gain, -96.0f, 6.0f);
		
		if (x->has_mix)
			right_side -= 16.0;
		if (x->has_mute)
			right_side -= 16.0;
		if (x->has_bypass)
			right_side -= 16.0;
		if (x->has_freeze)
			right_side -= 16.0;
		if (x->has_active)
			right_side -= 16.0;
		if (x->has_panel)
			right_side -= 16.0;
		
		jgraphics_set_source_jrgba(g, &s_color_background_button);
		
		x->rect_gain.x = right_side;
		x->rect_gain.width = 13.0;
		
		jgraphics_set_line_width(g, 1.5);
		jgraphics_arc(g, right_side+6.5, 9.5, 6.5, 0., JGRAPHICS_2PI);
		jgraphics_fill(g);
		
		if (x->highlight && x->highlight_gain)
			jgraphics_set_source_jrgba(g, &s_color_selected);
		else
			jgraphics_set_source_jrgba(g, &s_color_border_button);
        
		jgraphics_arc(g, right_side+6.5, 9.5, 6.5, 0., JGRAPHICS_2PI);
		jgraphics_stroke(g);
		
        // interior arc
		jgraphics_set_source_jrgba(g, &s_color_darkgreen);
		jgraphics_arc(g, right_side+6.5, 3.0+6.5, 6.5, PI / 2, (PI/2) + TWOPI * (1.0 + (gain - 6.0) / 102.0)); // angles are in radians
		jgraphics_line_to(g, right_side+6.5, 3.0+6.5);
		jgraphics_close_path(g);
		jgraphics_fill(g);	
		
        // border arc
		jgraphics_set_source_jrgba(g, &s_color_green_ring);
		jgraphics_arc(g, right_side+6.5, 3.0+6.5, 6.5, PI / 2, (PI/2) + TWOPI * (1.0 + (gain - 6.0) / 102.0));
		jgraphics_line_to(g, right_side+6.5, 3.0+6.5);
		jgraphics_stroke(g);
		
		jgraphics_arc(g, right_side+6.5, 3.0+6.5, 1.5, 0, TWOPI); // angles are in radians
		jgraphics_fill(g);	
	}
	
	// draw the mix knob
	if (x->has_mix) {
		long right_side = rect.width - 16.0;
		float mix = x->mix;
		TTLimit(mix, 0.0f, 100.0f);
		
		if (x->has_mute)
			right_side -= 16.0;
		if (x->has_bypass)
			right_side -= 16.0;
		if (x->has_freeze)
			right_side -= 16.0;
		if (x->has_active)
			right_side -= 16.0;
		if (x->has_panel)
			right_side -= 16.0;
		
		jgraphics_set_source_jrgba(g, &s_color_background_button);
		
		x->rect_mix.x = right_side;
		x->rect_mix.width = 13.0;
		
		jgraphics_set_line_width(g, 1.5);
		jgraphics_arc(g, right_side+6.5, 9.5, 6.5, 0., JGRAPHICS_2PI);
		jgraphics_fill(g);
		
		if (x->highlight && x->highlight_mix)
			jgraphics_set_source_jrgba(g, &s_color_selected);
		else
			jgraphics_set_source_jrgba(g, &s_color_border_button);
		jgraphics_arc(g, right_side+6.5, 9.5, 6.5, 0., JGRAPHICS_2PI);
		jgraphics_stroke(g);
		
		jgraphics_set_source_jrgba(g, &s_color_darkblue);
		
		jgraphics_arc(g, right_side+6.5, 3.0+6.5, 6.5, PI / 2, ((mix / 100.0) * TWOPI) + (PI/2)); // angles are in radians
		jgraphics_line_to(g, right_side+6.5, 3.0+6.5);
		jgraphics_close_path(g);
		jgraphics_fill(g);	
		
		jgraphics_set_source_jrgba(g, &s_color_blue_ring);
		jgraphics_arc(g, right_side+6.5, 3.0+6.5, 6.5, PI / 2, ((mix / 100.0) * TWOPI) + (PI/2));
		jgraphics_line_to(g, right_side+6.5, 3.0+6.5);
		jgraphics_stroke(g);
		
		jgraphics_arc(g, right_side+6.5, 3.0+6.5, 1.5, 0, TWOPI); // angles are in radians
		jgraphics_fill(g);	
	}
	
	// draw the mute button
	if (x->has_mute) {
		long right_side = rect.width - 16.0;
		
		if (x->has_bypass)
			right_side -= 16.0;
		if (x->has_freeze)
			right_side -= 16.0;
		if (x->has_active)
			right_side -= 16.0;
		if (x->has_panel)
			right_side -= 16.0;
		
		if (x->is_muted)
			jgraphics_set_source_jrgba(g, &s_color_red_button);
		else
			jgraphics_set_source_jrgba(g, &s_color_background_button);
		
		x->rect_mute.x = right_side;
		x->rect_mute.width = 13.0;
		
		jgraphics_set_line_width(g, 1.5);
		jgraphics_arc(g, right_side+6.5, 9.5, 6.5, 0., JGRAPHICS_2PI);
		jgraphics_fill(g);
		
		if (x->highlight && x->highlight_mute)
			jgraphics_set_source_jrgba(g, &s_color_selected);
		else
			jgraphics_set_source_jrgba(g, &s_color_border_button);
		jgraphics_arc(g, right_side+6.5, 9.5, 6.5, 0., JGRAPHICS_2PI);
		jgraphics_stroke(g);
		
		// m
		if (x->is_muted)
			jgraphics_set_source_jrgba(g, &s_color_text_button_on);
		else
			jgraphics_set_source_jrgba(g, &s_color_text_button_off);
		
		jgraphics_set_line_width(g, 2.0);
		jgraphics_move_to(g, right_side + 2.5, 13.0);
		jgraphics_select_font_face(g, JAMOMA_BUTTON_FONT, JGRAPHICS_FONT_SLANT_NORMAL, JGRAPHICS_FONT_WEIGHT_BOLD);
		jgraphics_set_font_size(g, 7.0);
		jgraphics_show_text(g, "m");
	}
	
	// draw the bypass button
	if (x->has_bypass) {
		long right_side = rect.width - 16.0;
		
		if (x->has_freeze)
			right_side -= 16.0;
		if (x->has_active)
			right_side -= 16.0;
		if (x->has_panel)
			right_side -= 16.0;
		
		if (x->is_bypassed)
			jgraphics_set_source_jrgba(g, &s_color_blue_button);
		else
			jgraphics_set_source_jrgba(g, &s_color_background_button);
		
		x->rect_bypass.x = right_side;
		x->rect_bypass.width = 13.0;
		
		jgraphics_set_line_width(g, 1.5);
		jgraphics_arc(g, right_side+6.5, 9.5, 6.5, 0., JGRAPHICS_2PI);
		jgraphics_fill(g);
		
		if (x->highlight && x->highlight_bypass)
			jgraphics_set_source_jrgba(g, &s_color_selected);
		else
			jgraphics_set_source_jrgba(g, &s_color_border_button);
		jgraphics_arc(g, right_side+6.5, 9.5, 6.5, 0., JGRAPHICS_2PI);
		jgraphics_stroke(g);
		
		// b
		if (x->is_bypassed)
			jgraphics_set_source_jrgba(g, &s_color_text_button_on);
		else
			jgraphics_set_source_jrgba(g, &s_color_text_button_off);
		jgraphics_set_line_width(g, 2.0);
		jgraphics_move_to(g, right_side + 4.0, 13.0);
		jgraphics_select_font_face(g, JAMOMA_BUTTON_FONT, JGRAPHICS_FONT_SLANT_NORMAL, JGRAPHICS_FONT_WEIGHT_BOLD);
		jgraphics_set_font_size(g, 7.0);
		jgraphics_show_text(g, "b");
	}
	
	// draw the freeze button
	if (x->has_freeze) {
		long right_side = rect.width - 16.0;
		
		if (x->has_active)
			right_side -= 16.0;
		if (x->has_panel)
			right_side -= 16.0;
		
		if (x->is_frozen)
			jgraphics_set_source_jrgba(g, &s_color_orange_button);
		else
			jgraphics_set_source_jrgba(g, &s_color_background_button);
		
		x->rect_freeze.x = right_side;
		x->rect_freeze.width = 13.0;
		
		jgraphics_set_line_width(g, 1.5);
		jgraphics_arc(g, right_side+6.5, 9.5, 6.5, 0., JGRAPHICS_2PI);
		jgraphics_fill(g);
		
		if (x->highlight && x->highlight_freeze)
			jgraphics_set_source_jrgba(g, &s_color_selected);
		else
			jgraphics_set_source_jrgba(g, &s_color_border_button);
		jgraphics_arc(g, right_side+6.5, 9.5, 6.5, 0., JGRAPHICS_2PI);
		jgraphics_stroke(g);
		
		// f
		if (x->is_frozen)
			jgraphics_set_source_jrgba(g, &s_color_text_button_on);
		else
			jgraphics_set_source_jrgba(g, &s_color_text_button_off);
		jgraphics_set_line_width(g, 2.0);
		jgraphics_move_to(g, right_side + 5.0, 13.0);
		jgraphics_select_font_face(g, JAMOMA_BUTTON_FONT, JGRAPHICS_FONT_SLANT_NORMAL, JGRAPHICS_FONT_WEIGHT_BOLD);
		jgraphics_set_font_size(g, 7.0);
		jgraphics_show_text(g, "f");
	}
	
	// draw the active button
	if (x->has_active) {
		long right_side = rect.width - 16.0;
		
		if (x->has_panel)
			right_side -= 16.0;
		
		if (x->is_active)
			jgraphics_set_source_jrgba(g, &s_color_green_button);
		else
			jgraphics_set_source_jrgba(g, &s_color_background_button);
		
		x->rect_active.x = right_side;
		x->rect_active.width = 13.0;
		
		jgraphics_set_line_width(g, 1.5);
		jgraphics_arc(g, right_side+6.5, 9.5, 6.5, 0., JGRAPHICS_2PI);
		jgraphics_fill(g);
		
		if (x->highlight && x->highlight_active)
			jgraphics_set_source_jrgba(g, &s_color_selected);
		else
			jgraphics_set_source_jrgba(g, &s_color_border_button);
		jgraphics_arc(g, right_side+6.5, 9.5, 6.5, 0., JGRAPHICS_2PI);
		jgraphics_stroke(g);
		
		// p
		if (x->is_active)
			jgraphics_set_source_jrgba(g, &s_color_text_button_on);
		else
			jgraphics_set_source_jrgba(g, &s_color_text_button_off);
		jgraphics_set_line_width(g, 2.0);
		jgraphics_move_to(g, right_side + 4.0, 12.0);
		jgraphics_select_font_face(g, JAMOMA_BUTTON_FONT, JGRAPHICS_FONT_SLANT_NORMAL, JGRAPHICS_FONT_WEIGHT_BOLD);
		jgraphics_set_font_size(g, 7.0);
		jgraphics_show_text(g, "a");
	}
	
	// draw the panel button
	if (x->has_panel) {
		long right_side = rect.width - 16.0;
		
		x->rect_panel.x = right_side;
		x->rect_panel.width = 13.0;
		
		jgraphics_set_source_jrgba(g, &s_color_background_button);
		jgraphics_set_line_width(g, 1.5);
		jgraphics_arc(g, right_side+6.5, 9.5, 6.5, 0., JGRAPHICS_2PI);
		jgraphics_fill(g);
		
		jgraphics_set_source_jrgba(g, &s_color_border_button);
		jgraphics_arc(g, right_side+6.5, 9.5, 6.5, 0., JGRAPHICS_2PI);
		jgraphics_stroke(g);
		
		// i
		jgraphics_set_source_jrgba(g, &s_color_text_button_off);
		jgraphics_set_line_width(g, 2.0);
		jgraphics_move_to(g, right_side + 2.0, 13.0);
		jgraphics_select_font_face(g, JAMOMA_BUTTON_FONT, JGRAPHICS_FONT_SLANT_NORMAL, JGRAPHICS_FONT_WEIGHT_BOLD);
		jgraphics_set_font_size(g, 10.0);
		jgraphics_show_text(g, "+");
	}
}

void ui_paint_address(t_ui *x, t_object *textfield)
{
    // if there is still no address
    if (x->modelAddress == kTTAdrsEmpty) {
        
        object_method(textfield, gensym("settext"), NO_MODEL_STRING);
    }
    else {
        
        double r,t,l,b;
        t_rect uiRect;
        
        object_attr_get_rect((t_object*)x, _sym_presentation_rect, &uiRect);
        textfield_get_textmargins(textfield, &r, &t, &l, &b);
        
        TTUInt32 maxLetter = (uiRect.width - l - r) / 6; // assuming a letter is 6 pixels max
        
        if (strlen(x->modelAddress.c_str()) >= maxLetter) {
            
            TTString        croppedAddress;
            TTString        modelAddress = x->modelAddress.string();
            TTStringIter    begin = modelAddress.begin();
            TTStringIter    end = modelAddress.end();
            
            croppedAddress = TTString(begin, begin+(maxLetter/2)-1);
            croppedAddress += "..";
            croppedAddress += TTString(end-(maxLetter/2)+1, end);
            object_method(textfield, gensym("settext"), croppedAddress.c_str());
        }
        else
            object_method(textfield, gensym("settext"), x->modelAddress.c_str());
        
    }
}

void ui_mousedown(t_ui *x, t_object *patcherview, t_pt px, long modifiers)
{
	t_object	*obj;
	t_symbol	*objclass;
	t_rect		rect;
	TTValue		none;
	
	// usually we don't want mousedragdelta -- we turn it on below as necessary
	jbox_set_mousedragdelta((t_object *)x, 0);
	
	jbox_get_rect_for_view((t_object *)x, patcherview, &rect); 
	
	// a click on j.ui panel will select/unselect all j.remote
	if (px.y > 20.0) {
		
		// if the control key is pressed
		if (modifiers & eShiftKey) {

			obj = object_attr_getobj(jamoma_patcher_get((t_object*)x), _sym_firstobject);
			while (obj) {
				objclass = object_attr_getsym(obj, _sym_maxclass);
				if (objclass == gensym("j.remote")) {
					
                    // we should not pass it a t_pt any longer.
                    // instead we should pass two doubles (one for the x coordinate and one for the y coordinate)
                    // so in j.remote : that function should change its prototype,
                    // and then the arguments to object_method should change too object_method() is much more picky now
                    object_method(object_attr_getobj(obj, _sym_object), gensym("mousedown"), patcherview, px.x, px.y, modifiers);
					
				}
				obj = object_attr_getobj(obj, _sym_nextobject);
			}
			
			// update the mouse position to display
			ui_mousemove(x, patcherview, px, modifiers);
		}
		
		return;
	}
	
	if (px.x > 18 && px.y < 20.0) {//(rect.width - 112)) {
		// we check the gain and mix knobs first because they are continuous datas and should run as fast as possible
		if (x->has_gain && px.x >= x->rect_gain.x && px.x <= (x->rect_gain.x + x->rect_gain.width)) {
			if (x->highlight) {
				x->highlight_gain = !x->highlight_gain;
				ui_viewer_highlight(x, TTSymbol("audio/gain"), x->highlight_gain);
			}
			else {
				x->gainDragging = true;
				x->anchor.x = x->anchor.y = 0.0;
				x->anchorValue = x->gain;			
				jbox_set_mousedragdelta((t_object *)x, 1);
			}
		}
		else if (x->has_mix && px.x >= x->rect_mix.x && px.x <= (x->rect_mix.x + x->rect_mix.width)) {
			if (x->highlight) {
				x->highlight_mix = !x->highlight_mix;
				ui_viewer_highlight(x, TTSymbol("audio/mix"), x->highlight_mix);
			}
			else {
				x->mixDragging = true;
				x->anchor.x = x->anchor.y = 0.0;
				x->anchorValue = x->mix;			
				jbox_set_mousedragdelta((t_object *)x, 1);
			}
		}
		else if (x->has_panel && px.x >= x->rect_panel.x && px.x <= (x->rect_panel.x + x->rect_panel.width))
			x->uiInfo.send("Panel");
		
		else if (x->has_active && px.x >= x->rect_active.x && px.x <= (x->rect_active.x + x->rect_active.width)) {
			if (x->highlight) {
				x->highlight_active = !x->highlight_active;
				ui_viewer_highlight(x, TTSymbol("data/active"), x->highlight_active);
			}
			else
				ui_viewer_send(x, TTSymbol("data/active"), TTValue(!x->is_active));
		}
		else if (x->has_freeze && px.x >= x->rect_freeze.x && px.x <= (x->rect_freeze.x + x->rect_freeze.width)) {
			if (x->highlight) {
				x->highlight_freeze = !x->highlight_freeze;
				ui_viewer_highlight(x, TTSymbol("data/freeze"), x->highlight_freeze);
			}
			else
				ui_viewer_send(x, TTSymbol("data/freeze"), TTValue(!x->is_frozen));
		}
		else if (x->has_bypass && px.x >= x->rect_bypass.x && px.x <= (x->rect_bypass.x + x->rect_bypass.width)) {
			if (x->highlight) {
				x->highlight_bypass = !x->highlight_bypass;
				ui_viewer_highlight(x, TTSymbol("*.*/bypass"), x->highlight_bypass);
			}
			else
				ui_viewer_send(x, TTSymbol("*.*/bypass"), TTValue(!x->is_bypassed));
		}
		else if (x->has_mute && px.x >= x->rect_mute.x && px.x <= (x->rect_mute.x + x->rect_mute.width)) {
			if (x->highlight) {
				x->highlight_mute = !x->highlight_mute;
				ui_viewer_highlight(x, TTSymbol("*.*/mute"), x->highlight_mute);
			}
			else
				ui_viewer_send(x, TTSymbol("*.*/mute"), TTValue(!x->is_muted));
		}
		
		else if (px.x < 100)
			ui_refmenu_do(x, patcherview, px, modifiers);
	}
	else //if (px.x < 18)
		ui_menu_do(x, patcherview, px, modifiers);
}

// mousedragdelta sends the amount the mouse moved in t_pt
void ui_mousedragdelta(t_ui *x, t_object *patcherview, t_pt pt, long modifiers)
{
	t_object*	textfield = jbox_get_textfield((t_object*) x);
	t_rect		rect;
	char		str[5];
	double		factor = 1.0;	// factor determines how much precision (vs. immediacy) you have when dragging the knob
	
	jbox_get_rect_for_view((t_object *)x, patcherview, &rect);
	
	if (modifiers & eShiftKey)
		factor = 0.02;
	
	if (textfield)
		textfield_set_textcolor(textfield, &x->textcolor);
	
	if (x->mixDragging) {
		x->anchorValue = x->anchorValue - (pt.y * factor);
		TTLimit(x->anchorValue, 0.0f, 100.0f);
		ui_viewer_send(x, TTSymbol("audio/mix"), TTValue(x->anchorValue));
		
		snprintf(str, sizeof(str), "%f", x->mix);
		object_method(textfield, gensym("settext"), str);
	}
	else if (x->gainDragging) {
		x->anchorValue = x->anchorValue - (pt.y * factor);
		TTLimit(x->anchorValue, -96.0f, 6.0f);
		ui_viewer_send(x, TTSymbol("audio/gain"), TTValue(x->anchorValue));
		
		snprintf(str, sizeof(str), "%f", x->gain);
		object_method(textfield, gensym("settext"), str);
	}
}

void ui_mouseup(t_ui *x, t_object *patcherview)
{
	x->mixDragging = false;
	x->gainDragging = false;
    
    // Set the textfield to display the address after dragging widget
	t_object *textfield = jbox_get_textfield((t_object*) x);
	if (textfield)
        ui_paint_address(x, textfield);
	
	jbox_redraw(&x->box);
}

void ui_mousemove(t_ui *x, t_object *patcherview, t_pt pt, long modifiers)
{
	t_symbol    *objclass;
	t_object    *obj = object_attr_getobj(jamoma_patcher_get((t_object*)x), _sym_firstobject);

	// théo - we decide to mute this feature in june 2014 Albi workshop
    return;
	
	// if the control key is pressed
	if (modifiers & eShiftKey) {
		
		x->highlight = true;
		
		// Is the mouse wasn't hover the j.ui panel
		if (!x->hover) {
			x->hover = true;
            x->uiInfo.set("highlight", TTSymbol("jamoma"));
		}
	}
	else {
		
		x->highlight = false;
		
		if (x->hover) {
			x->hover = false;
			x->uiInfo.set("highlight", kTTSym_none);
		}
	}
	
	while (obj) {
		objclass = object_attr_getsym(obj, _sym_maxclass);
		if (objclass == gensym("j.remote")) {
			
            // we should not pass it a t_pt any longer.
            // instead we should pass two doubles (one for the x coordinate and one for the y coordinate)
            // so in j.remote : that function should change its prototype,
            // and then the arguments to object_method should change too object_method() is much more picky now
			object_method(object_attr_getobj(obj, _sym_object), gensym("mousemove"), patcherview, pt.x, pt.y, modifiers);

		}
		obj = object_attr_getobj(obj, _sym_nextobject);
	}
}

void ui_mouseleave(t_ui *x, t_object *patcherview, t_pt pt, long modifiers)
{	
	t_symbol *objclass;
	t_object *obj = object_attr_getobj(jamoma_patcher_get((t_object*)x), _sym_firstobject);

	// théo - we decide to mute this feature in june 2014 Albi workshop
    return;
	
	// Is the mouse leave outside the j.ui (not hover an ui object)
	if (	pt.x <= x->box.b_presentation_rect.x || pt.x >= (x->box.b_presentation_rect.x + x->box.b_presentation_rect.width)
		||	pt.y <= x->box.b_presentation_rect.y || pt.y >= (x->box.b_presentation_rect.y + x->box.b_presentation_rect.height)) {
        
        x->highlight = false;
		x->hover = false;
        
        if (x->uiInfo.valid())
            x->uiInfo.set("highlight", kTTSym_none);
	}

	while (obj) {
		objclass = object_attr_getsym(obj, _sym_maxclass);
		if (objclass == gensym("j.remote")) {
			
			// we should not pass it a t_pt any longer.
            // instead we should pass two doubles (one for the x coordinate and one for the y coordinate)
            // so in j.remote : that function should change its prototype,
            // and then the arguments to object_method should change too object_method() is much more picky now
			object_method(object_attr_getobj(obj, _sym_object), gensym("mouseleave"), patcherview, pt.x, pt.y, modifiers*x->hover); // * hover allows to return to a normal display
			
		}
		obj = object_attr_getobj(obj, _sym_nextobject);
	}
}

#pragma mark -
#pragma mark Menus

void ui_menu_do(t_ui *x, t_object *patcherview, t_pt px, long modifiers)
{
	t_jpopupmenu 		*p;
	t_symobject			*item;
	long				size, i;
	int 				selectedId;
	t_jfont 			*font;
	int					coord_x=0, coord_y=0;
	t_pt				pt;
	
	ui_menu_build(x);	// would be better to not rebuild the menu every single time?  or not?  this uses less memory...
	
	jbox_set_mousedragdelta((t_object *)x, 0);
	p = jpopupmenu_create();
	
	font = jfont_create(JAMOMA_MENU_FONT,
						JGRAPHICS_FONT_SLANT_NORMAL,
						JGRAPHICS_FONT_WEIGHT_NORMAL,
						JAMOMA_MENU_FONTSIZE);
	jpopupmenu_setfont(p, font);
	jfont_destroy(font);
	size = linklist_getsize(x->menu_items);
	for (i=0; i<size; i++) {
		item = (t_symobject *)linklist_getindex(x->menu_items, i);
		if (!item->sym || (item->sym->s_name[0] == '\0') || item->sym->s_name[0] == '-')
			jpopupmenu_addseperator(p);
		else {
			if (item->sym == gensym("Defeat Signal Meters")) {
				if (x->is_metersdefeated)
					jpopupmenu_additem(p, i+1, item->sym->s_name, NULL, 1, 0, NULL);
				else
					jpopupmenu_additem(p, i+1, item->sym->s_name, NULL, 0, item->flags, NULL);
			}
			else if (item->sym == gensym("Disable UI Updates")) {
				if (x->ui_freeze)
					jpopupmenu_additem(p, i+1, item->sym->s_name, NULL, 1, 0, NULL);
				else
					jpopupmenu_additem(p, i+1, item->sym->s_name, NULL, 0, item->flags, NULL);
			}
			else
				jpopupmenu_additem(p, i+1, item->sym->s_name, NULL, 0, item->flags, NULL);
		}
	}
	
	object_method(patcherview, gensym("canvastoscreen"), 0.0, 0.0, &coord_x, &coord_y);	
	coord_x += x->box.b_presentation_rect.x;
	coord_y += x->box.b_presentation_rect.y;
	pt.x = coord_x;
	pt.y = coord_y;
	selectedId = jpopupmenu_popup(p, pt, x->menu_selection+1);
	if (selectedId) {
		x->menu_selection = selectedId -1;
		qelem_set(x->menu_qelem);
	}	
	jpopupmenu_destroy(p);
}

void ui_menu_qfn(t_ui *x)
{
	t_symobject *item = (t_symobject *)linklist_getindex(x->menu_items, x->menu_selection);
    t_atom      a;
    
    // get model object
    t_object *modelObject = ui_get_model_object(x);
    if (!modelObject)
        return;
    
    if (item->sym == gensym("Open Model Reference Page"))
        object_method(modelObject, _sym_anything, gensym("model:reference/open"), 0, NULL);
	
	else if (item->sym == gensym("Open Model Help Patch"))
        object_method(modelObject, _sym_anything, gensym("model:help/open"), 0, NULL);
	
	else if (item->sym == gensym("Open Model Internal"))
        object_method(modelObject, _sym_anything, gensym("model:internal/open"), 0, NULL);
    
    else if (item->sym == gensym("Edit Current State"))
		ui_edit_state(x);
    
	else if (item->sym == gensym("Load Presets File"))
		object_method(modelObject, gensym("preset:read"), 0, NULL);
    
    else if (item->sym == gensym("Save Presets File"))
		object_method(modelObject, gensym("preset:write/again"), 0, NULL);
    
	else if (item->sym == gensym("Save Presets File As"))
		object_method(modelObject, gensym("preset:write"), 0, NULL);

	else if (item->sym == gensym("Edit Presets File"))
		object_method(modelObject, gensym("preset:edit"), 0, NULL);
	
	else if (item->sym == gensym("Create New Preset")) {
    
		long    result;
        char    *text;
        char    buf[512];
        
        strcpy(buf, "Château de Preset");
        
        result = jdialog_showtext("Provide a name for this Preset", buf, 0, &text);
        if (result != 1)
            return;
        
        atom_setsym(&a, gensym(text));
        object_method(modelObject, _sym_anything, gensym("preset:new"), 1, &a);
    }
    
    else if (item->sym == gensym("Update Current Preset"))
		object_method(modelObject, _sym_anything, gensym("preset:update"), 0, NULL);
    
    else if (item->sym == gensym("Delete Current Preset"))
		object_method(modelObject, _sym_anything, gensym("preset:delete"), 0, NULL);
	
	else if (item->sym == gensym("Open Preset Interface"))
		ui_preset_interface(x);

	else {  // assume the menu item is a preset name
        
        atom_setsym(&a, item->sym);
        object_method(modelObject, _sym_anything, gensym("preset:recall"), 1, &a);
    }
}

void ui_menu_build(t_ui *x)
{
	t_symobject*	item = NULL;
	int				i;
	
	if (!x->menu_items)
		return;
	
	linklist_clear(x->menu_items);
    
    // append model operations
    if (x->has_model) {
        
		item = (t_symobject *)symobject_new(gensym("Open Model Reference Page"));
		linklist_append(x->menu_items, item);
		item = (t_symobject *)symobject_new(gensym("Open Model Help Patch"));
		linklist_append(x->menu_items, item);
		item = (t_symobject *)symobject_new(gensym("Open Model Internal"));
        linklist_append(x->menu_items, item);
        item = (t_symobject *)symobject_new(gensym("Edit Current State"));
        linklist_append(x->menu_items, item);
	}
	
    // append preset operations
	if (x->has_preset) {
        
        item = (t_symobject *)symobject_new(gensym("-"));
        linklist_append(x->menu_items, item);
        
		item = (t_symobject *)symobject_new(gensym("Load Presets File"));
		linklist_append(x->menu_items, item);
        item = (t_symobject *)symobject_new(gensym("Save Presets File"));
        linklist_append(x->menu_items, item);
		item = (t_symobject *)symobject_new(gensym("Save Presets File As"));
		linklist_append(x->menu_items, item);
		item = (t_symobject *)symobject_new(gensym("Edit Presets File"));
		linklist_append(x->menu_items, item);
		item = (t_symobject *)symobject_new(gensym("Create New Preset"));
        linklist_append(x->menu_items, item);
        item = (t_symobject *)symobject_new(gensym("Update Current Preset"));
		linklist_append(x->menu_items, item);
		item = (t_symobject *)symobject_new(gensym("Delete Current Preset"));
		linklist_append(x->menu_items, item);
		item = (t_symobject *)symobject_new(gensym("Open Preset Interface"));
	}
	
	// append preset name list
	if (x->preset_names) {
        
		item = (t_symobject *)symobject_new(gensym("-"));
		linklist_append(x->menu_items, item);
		
		for (i=0; i<x->preset_num; i++) {
			item = (t_symobject *)symobject_new(atom_getsym(&x->preset_names[i]));
			linklist_append(x->menu_items, item);
		}
	}
}

void ui_refmenu_do(t_ui *x, t_object *patcherview, t_pt px, long modifiers)
{
	t_jpopupmenu 		*p;
	t_symobject			*item;
	long				size, i;
	int 				selectedId;
	t_jfont 			*font;
	int					coord_x=0, coord_y=0;
	t_pt				pt;
	
	ui_refmenu_build(x);	// TODO: would be better to not rebuild the menu every single time?  or not?  this uses less memory...
	
	jbox_set_mousedragdelta((t_object *)x, 0);
	p = jpopupmenu_create();
	
	font = jfont_create(JAMOMA_MENU_FONT,
						JGRAPHICS_FONT_SLANT_NORMAL,
						JGRAPHICS_FONT_WEIGHT_NORMAL,
						JAMOMA_MENU_FONTSIZE);
	jpopupmenu_setfont(p, font);
	jfont_destroy(font);
	size = linklist_getsize(x->refmenu_items);
	for (i=0; i<size; i++) {
		item = (t_symobject *)linklist_getindex(x->refmenu_items, i);
		if (!item->sym || (item->sym->s_name[0] == '\0') || item->sym->s_name[0] == '-')//{
			jpopupmenu_addseperator(p);
		else {
			//TODO: Instead of passing NULL for the 4th data, we can pass a custom color for "header" items			
			jpopupmenu_additem(p, i+1, item->sym->s_name, NULL, 0, item->flags, NULL);
			// TODO: use jpopupmenu_addheader instead -- requires that Max export this function though (which it currently doesn't)
			//	if (item->flags)
			//		jpopupmenu_addheader(p, item->sym->s_name);
			//	else
			//		jpopupmenu_additem(p, i+1, item->sym->s_name, NULL, 0, item->flags, NULL);
		}
	}
	
	object_method(patcherview, gensym("canvastoscreen"), 0.0, 0.0, &coord_x, &coord_y);	
	coord_x += x->box.b_presentation_rect.x;
	coord_y += x->box.b_presentation_rect.y;
	pt.x = coord_x + 20.0;
	pt.y = coord_y;
	
	selectedId = jpopupmenu_popup(p, pt, x->refmenu_selection+1);
	if (selectedId) {
		x->refmenu_selection = selectedId -1;
		qelem_set(x->refmenu_qelem);
	}
	jpopupmenu_destroy(p);
}

void ui_refmenu_qfn(t_ui *x)
{
	t_symobject *item = (t_symobject *)linklist_getindex(x->refmenu_items, x->refmenu_selection);
	
	ui_data_interface(x, TTSymbol(item->sym->s_name));
}

void ui_refmenu_build(t_ui *x)
{
	t_symobject	*item = NULL;
	char		tempStr[512];
	TTValue		filters;
	
	if (!x->refmenu_items)
		return;
	
	// Prepare a new refmenu
	linklist_clear(x->refmenu_items);
	
	// Edit refmenu title
	if (x->modelAddress != kTTSymEmpty)
		snprintf(tempStr, 512, "Model: %s", x->modelAddress.c_str());
	else
		strncpy_zero(tempStr, "Model: ?", 512);
	
	item = (t_symobject *)symobject_new(gensym(tempStr));
	linklist_append(x->refmenu_items, item);
	item->flags = 1;	// mark to disable this item (we use it as a label)
	
	// Look for User-Defined Parameters into the model
	item = (t_symobject *)symobject_new(gensym("-"));
	linklist_append(x->refmenu_items, item);
	item = (t_symobject *)symobject_new(gensym("User-Defined Parameters"));
	linklist_append(x->refmenu_items, item);
	item->flags = 1;	// mark to disable this item (we use it as a label)
	
	ui_explorer_create((t_object*)x, x->modelParamExplorer, gensym("return_modelParamExploration"));
	
	filters = TTValue(kTTSym_parameter);
	filters.append(TTSymbol("noGenericTag"));
	x->modelParamExplorer.set("filterList", filters);
	
	x->modelParamExplorer.set(kTTSym_address, x->modelAddress);
	x->modelParamExplorer.send("Explore");
	
	// Look for User-Defined Messages into the model
	item = (t_symobject *)symobject_new(gensym("-"));
	linklist_append(x->refmenu_items, item);
	item = (t_symobject *)symobject_new(gensym("User-Defined Messages"));
	linklist_append(x->refmenu_items, item);
	item->flags = 1;	// mark to disable this item (we use it as a label)
	
	ui_explorer_create((t_object*)x, x->modelMessExplorer, gensym("return_modelMessExploration"));
	
	filters = TTValue(kTTSym_message);
	filters.append(TTSymbol("noGenericTag"));
	x->modelMessExplorer.set("filterList", filters);
	
	x->modelMessExplorer.set(kTTSym_address, x->modelAddress);
	x->modelMessExplorer.send("Explore");
	
	// Look for User-Defined Returns into the model
	item = (t_symobject *)symobject_new(gensym("-"));
	linklist_append(x->refmenu_items, item);
	item = (t_symobject *)symobject_new(gensym("User-Defined Returns"));
	linklist_append(x->refmenu_items, item);
	item->flags = 1;	// mark to disable this item (we use it as a label)
	
	ui_explorer_create((t_object*)x, x->modelRetExplorer, gensym("return_modelRetExploration"));
	
	filters = TTValue(kTTSym_return);
	filters.append(TTSymbol("noGenericTag"));
	x->modelRetExplorer.set("filterList", filters);
	
	x->modelRetExplorer.set(kTTSym_address, x->modelAddress);
	x->modelRetExplorer.send("Explore");

	// Look for Generic Parameters into the model
	item = (t_symobject *)symobject_new(gensym("-"));
	linklist_append(x->refmenu_items, item);
	item = (t_symobject *)symobject_new(gensym("Generic Parameters"));
	linklist_append(x->refmenu_items, item);
	item->flags = 1;	// mark to disable this item (we use it as a label)
	
	filters = TTValue(kTTSym_parameter);
	filters.append(TTSymbol("genericTag"));
	x->modelParamExplorer.set("filterList", filters);
	
	x->modelParamExplorer.set(kTTSym_address, x->modelAddress);
	x->modelParamExplorer.send("Explore");
	
	// Look for Generic Messages into the model
	item = (t_symobject *)symobject_new(gensym("-"));
	linklist_append(x->refmenu_items, item);
	item = (t_symobject *)symobject_new(gensym("Generic Messages"));
	linklist_append(x->refmenu_items, item);
	item->flags = 1;	// mark to disable this item (we use it as a label)
	
	filters = TTValue(kTTSym_message);
	filters.append(TTSymbol("genericTag"));
	x->modelMessExplorer.set("filterList", filters);
	
	x->modelMessExplorer.set(kTTSym_address, x->modelAddress);
	x->modelMessExplorer.send("Explore");
	
	// Look for Generic Returns into the model
	item = (t_symobject *)symobject_new(gensym("-"));
	linklist_append(x->refmenu_items, item);
	item = (t_symobject *)symobject_new(gensym("Generic Returns"));
	linklist_append(x->refmenu_items, item);
	item->flags = 1;	// mark to disable this item (we use it as a label)
	
	filters = TTValue(kTTSym_return);
	filters.append(TTSymbol("genericTag"));
	x->modelRetExplorer.set("filterList", filters);
	
	x->modelRetExplorer.set(kTTSym_address, x->modelAddress);
	x->modelRetExplorer.send("Explore");
	
	x->modelParamExplorer = TTObject();
    x->modelMessExplorer = TTObject();
    x->modelRetExplorer = TTObject();
}

void* ui_oksize(t_ui *x, t_rect *rect)
{
	long		unitHeight = 0;
	long		unitWidth = 0;
	double		unitFrac= 0.0;
	t_object 	*textfield = NULL;
	
	unitHeight = rect->height / JAMOMA_UNIT_HEIGHT;
	unitFrac = rect->height - (unitHeight * JAMOMA_UNIT_HEIGHT);
	if (unitFrac > (JAMOMA_UNIT_HEIGHT/2))
		unitHeight += 1;	
	if (unitHeight < 1)
		unitHeight = 1;
	rect->height = unitHeight * JAMOMA_UNIT_HEIGHT;
	
	unitWidth = rect->width / JAMOMA_UNIT_WIDTH;
	unitFrac = rect->width - (unitWidth * JAMOMA_UNIT_WIDTH);
	if (unitFrac > (JAMOMA_UNIT_WIDTH/2))
		unitWidth += 1;
	if (unitWidth < 1)
		unitWidth = 1;
	rect->width = unitWidth * JAMOMA_UNIT_WIDTH;
	
	// We do textfield configuration here because the margins are dependent upon the dimensions
	textfield = jbox_get_textfield((t_object*) x); 
	textfield_set_noactivate(textfield, 1);
	textfield_set_readonly(textfield, 1);
	textfield_set_editonclick(textfield, 0);
	textfield_set_wordwrap(textfield, 0);
	textfield_set_useellipsis(textfield, 0);
	textfield_set_textcolor(textfield, &x->textcolor);
	textfield_set_textmargins(textfield, 20.0, 2.0, 60.0, rect->height - 19.0);
	
	return (void *)1;
}

void ui_edit_state(t_ui *x)
{
    TTString    *buffer;
    char        title[MAX_FILENAME_CHARS];
    TTValue     none;
    TTSymbol    name;
    
    // only one editor can be open in the same time
    if (!x->textEditor) {
        
        x->textEditor = (t_object*)object_new(_sym_nobox, _sym_jed, x, 0);
        buffer = new TTString();
        
        // Store the preset
        x->state.send("Store");
        
        critical_enter(0);
        x->textHandler.send(kTTSym_Write, (TTPtr)buffer, none);
        critical_exit(0);
        
        // pass the buffer to the editor
        object_method(x->textEditor, _sym_settext, buffer->c_str(), _sym_utf_8);
        object_attr_setchar(x->textEditor, gensym("scratch"), 1);
        
        snprintf(title, MAX_FILENAME_CHARS, "%s state editor", x->patcherClass.c_str());
        object_attr_setsym(x->textEditor, _sym_title, gensym(title));
        
        buffer->clear();
        delete buffer;
        buffer = NULL;
    }
}

void ui_edclose(t_ui *x, char **text, long size)
{
    x->text = new TTString(*text);
    x->textEditor = NULL;
    
    defer_low((t_object*)x, (method)ui_doedit, NULL, 0, NULL);
}

void ui_doedit(t_ui *x)
{
    TTValue none;
    
    critical_enter(0);
    x->textHandler.send(kTTSym_Read, (TTPtr)x->text, none);
    critical_exit(0);
    
    // recall the preset
    x->state.send(kTTSym_Recall);
    
    delete x->text;
    x->text = NULL;
    x->textEditor = NULL;
}