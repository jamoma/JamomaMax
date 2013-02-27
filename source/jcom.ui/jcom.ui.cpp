/* 
 * jcom.ui
 * External for Jamoma: provide standard user interface component for modules
 * By Tim Place, Copyright © 2007
 * 
 * License: This code is licensed under the terms of the "New BSD License"
 * http://creativecommons.org/licenses/BSD/
 */

#include "jcom.ui.h"

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
	
	c = class_new("jcom.ui",
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
	
	class_addmethod(c, (method)ui_modelExplorer_callback,			"return_modelExploration",			A_CANT, 0);
	class_addmethod(c, (method)ui_modelParamExplorer_callback,		"return_modelParamExploration",		A_CANT, 0);
	class_addmethod(c, (method)ui_modelMessExplorer_callback,		"return_modelMessExploration",		A_CANT, 0);
	class_addmethod(c, (method)ui_modelRetExplorer_callback,		"return_modelRetExploration",		A_CANT, 0);
	
	class_addmethod(c, (method)ui_view_panel_return,				"return_view_panel",				A_CANT, 0);
	
	class_addmethod(c, (method)ui_return_color_contentBackground,	"return_color_contentBackground",	A_CANT, 0);
	class_addmethod(c, (method)ui_return_color_toolbarBackground,	"return_color_toolbarBackground",	A_CANT, 0);
	class_addmethod(c, (method)ui_return_color_toolbarText,			"return_color_toolbarText",			A_CANT, 0);
	class_addmethod(c, (method)ui_return_color_border,				"return_color_border",				A_CANT, 0);
	class_addmethod(c, (method)ui_return_ui_size,					"return_ui_size",					A_CANT, 0);
	class_addmethod(c, (method)ui_return_ui_freeze,					"return_ui_freeze",					A_CANT, 0);
	
	class_addmethod(c, (method)ui_return_model_address,				"return_model_address",				A_CANT, 0);
	
	class_addmethod(c, (method)ui_return_model_init,				"return_model_init",				A_CANT, 0);
	
	class_addmethod(c, (method)ui_return_metersdefeated,			"return_metersdefeated",			A_CANT, 0);
	class_addmethod(c, (method)ui_return_mute,						"return_mute",						A_CANT, 0);
	class_addmethod(c, (method)ui_return_bypass,					"return_bypass",					A_CANT, 0);
	class_addmethod(c, (method)ui_return_mix,						"return_mix",						A_CANT, 0);
	class_addmethod(c, (method)ui_return_gain,						"return_gain",						A_CANT, 0);
	class_addmethod(c, (method)ui_return_freeze,					"return_freeze",					A_CANT, 0);
	class_addmethod(c, (method)ui_return_preview,					"return_preview",					A_CANT, 0);
	class_addmethod(c, (method)ui_return_preset_order,				"return_preset_order",				A_CANT, 0);
	
	class_addmethod(c, (method)ui_return_signal,					"return_signal",					A_CANT, 0);
	
	CLASS_ATTR_DEFAULT(c,					"patching_rect",	0, "0. 0. 300. 70.");
	CLASS_ATTR_DEFAULT(c,					"fontname",			0, JAMOMA_DEFAULT_FONT);
	CLASS_ATTR_DEFAULT(c,					"fontsize",			0, "11");
	
	CLASS_STICKY_ATTR(c,					"category",			0, "Color");
	
	CLASS_ATTR_RGBA(c,						"bgcolor",			0,	t_ui,	bgcolor);
	CLASS_ATTR_DEFAULTNAME_SAVE_PAINT(c,	"bgcolor",			0,	"0.93 0.93 0.93 1.0");
	CLASS_ATTR_STYLE(c,						"bgcolor",			0,	"rgba");
	
	CLASS_ATTR_RGBA(c,						"bordercolor",		0,	t_ui,	bordercolor);
	CLASS_ATTR_DEFAULTNAME_SAVE_PAINT(c,	"bordercolor",		0,	"0.6 0.6 0.6 1.0");
	CLASS_ATTR_STYLE(c,						"bordercolor",		0,	"rgba");
	
	CLASS_ATTR_RGBA(c,						"headercolor",		0,	t_ui,	headercolor);
	CLASS_ATTR_DEFAULTNAME_SAVE_PAINT(c,	"headercolor",		0,	"0.82 0.82 0.82 1.0");
	CLASS_ATTR_STYLE(c,						"headercolor",		0,	"rgba");
	
	CLASS_ATTR_RGBA(c,						"textcolor",		0,	t_ui,	textcolor);
	CLASS_ATTR_DEFAULTNAME_SAVE_PAINT(c,	"textcolor",		0,	"0. 0. 0. 1.0");
	CLASS_ATTR_STYLE(c,						"textcolor",		0,	"rgba");
	
	CLASS_STICKY_ATTR_CLEAR(c,				"category");
	CLASS_STICKY_ATTR(c,					"category",			0, "Jamoma");
	
	CLASS_ATTR_SYM(c,						"address",			0, t_ui,	modelAddress);
	CLASS_ATTR_STYLE(c,						"address",			0, "text");
	CLASS_ATTR_DEFAULT(c,					"address",			0, "");
	CLASS_ATTR_ACCESSORS(c,					"address",			ui_address_get, ui_address_set);
	
	CLASS_ATTR_LONG(c,						"ui_is_frozen",		0, t_ui, ui_freeze);
	CLASS_ATTR_STYLE(c,						"ui_is_frozen",		0, "onoff");
	CLASS_ATTR_DEFAULT(c,					"ui_is_frozen",		0, "0");
	
	CLASS_STICKY_ATTR_CLEAR(c,				"category");
	
	class_register(CLASS_BOX, c);
	s_ui_class = c;
	return 0;
}

t_ui* ui_new(t_symbol *s, long argc, t_atom *argv)
{
	t_ui			*x = NULL;
	t_dictionary 	*d = NULL;
	long 			flags;
	TTValue			filters;
	
	if (!(d=object_dictionaryarg(argc, argv)))
		return NULL;	
	
	if (x = (t_ui*)object_alloc(s_ui_class)) {
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
		x->outlets = (TTHandle)sysmem_newptr(sizeof(TTPtr) * 2);
		x->outlets[panel_out] = outlet_new(x, NULL);						// outlet to open panel
		x->outlets[preview_out] = outlet_new(x, NULL);						// outlet to output preview signal
		
		x->menu_items = NULL;
		x->refmenu_items = NULL;
		x->hash_datas = new TTHash();
		x->hash_viewers = new TTHash();
		x->hash_receivers = new TTHash();
		x->preset_order = NULL;
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
		
		x->hover = false;
		x->selectAll = false;
		
		x->has_preset = false;
		x->has_model = false;
		x->has_panel = false;
		x->has_mute = false;
		x->has_gain = false;
		x->has_bypass = false;
		x->has_mix = false;
		x->has_preview = false;
		x->has_freeze = false;
		
		x->sel_mute = true;
		x->sel_gain = true;
		x->sel_bypass = true;
		x->sel_mix = true;
		x->sel_preview = true;
		x->sel_freeze = true;
		
		x->modelOutput = NULL;
		x->previewSignal = NULL;
		
		ui_explorer_create((ObjectPtr)x, &x->modelExplorer, gensym("return_modelExploration"));
		
		filters.append(TTSymbol("data"));
		filters.append(TTSymbol("genericTag"));
		
		x->modelExplorer->setAttributeValue(TTSymbol("filterList"), filters);
		
		attr_dictionary_process(x, d); 	// handle attribute args
		
		// The following must be deferred because we have to interrogate our box,
		// and our box is not yet valid until we have finished instantiating the object.
		// Trying to use a loadbang method instead is also not fully successful (as of Max 5.0.6)
		defer_low((ObjectPtr)x, (method)ui_data_create_all, NULL, 0, 0);
		
		// The following must be deferred because we have to interrogate our box,
		// and our box is not yet valid until we have finished instantiating the object.
		// Trying to use a loadbang method instead is also not fully successful (as of Max 5.0.6)
		defer_low((ObjectPtr)x, (method)ui_build, NULL, 0, 0);
		
		// The following must be deferred because we have to interrogate our box,
		// and our box is not yet valid until we have finished instantiating the object.
		// Trying to use a loadbang method instead is also not fully successful (as of Max 5.0.6)
		defer_low((ObjectPtr)x, (method)ui_view_panel_attach, NULL, 0, 0);
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
	
	if (x->nmspcExplorer)
		TTObjectBaseRelease(&x->nmspcExplorer);
	
	if (x->modelExplorer)
		TTObjectBaseRelease(&x->modelExplorer);
	
	TTObjectBaseRelease(TTObjectBaseHandle(&x->uiSubscriber));
	
	if (x->previewSignal && x->modelOutput) {
		if (x->modelOutput->valid) {
			TTAttributePtr	anAttribute = NULL;
			x->modelOutput->findAttribute(TTSymbol("signal"), &anAttribute);
			anAttribute->unregisterObserverForNotifications(*(x->previewSignal));
			TTObjectBaseRelease(TTObjectBaseHandle(&x->previewSignal));
		}
	}
	
	ui_data_destroy_all(x);
	ui_viewer_destroy_all(x);
	ui_receiver_destroy_all(x);
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

t_max_err ui_address_set(t_ui *x, t_object *attr, long argc, t_atom *argv)
{
	// The following must be deferred because we have to interrogate our box,
	// and our box is not yet valid until we have finished instantiating the object.
	// Trying to use a loadbang method instead is also not fully successful (as of Max 5.0.6)
	defer_low((ObjectPtr)x, (method)ui_subscribe, atom_getsym(argv), 0, 0);
	
	return 0;
}

void ui_subscribe(t_ui *x, SymbolPtr address)
{
	TTAddress adrs = TTAddress(address->s_name);
	TTValue			v;
	TTAttributePtr	anAttribute;
	TTObjectBasePtr		aReceiver;
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
		x->has_preview = false;
		x->has_freeze = false;
		
		// reset output object and preview signal
		if (x->previewSignal && x->modelOutput) {
			if (x->modelOutput->valid) {
				err = x->modelOutput->findAttribute(kTTSym_signal, &anAttribute);
				if (!err) {
					anAttribute->unregisterObserverForNotifications(*(x->previewSignal));
					TTObjectBaseRelease(TTObjectBaseHandle(&x->previewSignal));
					x->previewSignal = NULL;
				}
			}
		}
		x->modelOutput = NULL;
		
		// observe model initialisation to explore
		ui_receiver_create(x, &aReceiver, gensym("return_model_init"), kTTSymEmpty, x->modelAddress.appendAttribute(kTTSym_initialized));
		aReceiver->sendMessage(kTTSym_Get);
	}
	
	// The following must be deferred because 
	// we have to wait each component of the model are registered
	defer_low((ObjectPtr)x, (method)ui_build, NULL, 0, 0);
}

t_max_err ui_address_get(t_ui *x, t_object *attr, long *argc, t_atom **argv)
{
	char alloc;
	atom_alloc(argc, argv, &alloc);     // allocate return atom
	atom_setsym(*argv, gensym((char*)x->modelAddress.c_str()));
	return 0;
}

void ui_build(t_ui *x)
{
	TTValue			v, n, p, args;
	SymbolPtr		hierarchy;
	ObjectPtr		box, textfield;
	t_rect			boxRect;
	t_rect			uiRect;
	
	// Examine the context to resize the view, set textfield, ...
	x->patcherPtr = jamoma_patcher_get((ObjectPtr)x);
	hierarchy = jamoma_patcher_get_hierarchy(x->patcherPtr);
	
	box = object_attr_getobj(x->patcherPtr, jps_box);
	object_attr_get_rect((ObjectPtr)x, _sym_presentation_rect, &uiRect);
	
	if (hierarchy == _sym_bpatcher) {
		object_attr_get_rect(box, _sym_patching_rect, &boxRect);
		boxRect.width = uiRect.width;
		boxRect.height = uiRect.height;
		object_attr_set_rect(box, _sym_patching_rect, &boxRect);
		object_attr_get_rect(box, _sym_presentation_rect, &boxRect);
		boxRect.width = uiRect.width;
		boxRect.height = uiRect.height;
		object_attr_set_rect(box, _sym_presentation_rect, &boxRect);
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
		
		// set the window title to the module class, jcom.ui shows osc_name already 
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
			
		// if there is still no address
		if (x->modelAddress == kTTAdrsEmpty)
			object_method(textfield, gensym("settext"), NO_MODEL_STRING);
		else
			object_method(textfield, gensym("settext"), x->modelAddress.c_str());
			
	// Redraw
	jbox_redraw(&x->box);
}

#pragma mark -
#pragma mark drawing and appearance

void ui_paint(t_ui *x, t_object *view)
{
	t_rect 		rect;
	t_jgraphics *g;
	double 		border_thickness = 0.5;
	double 		cornersize = 12.0;
	double		middle;
	
	g = (t_jgraphics*) patcherview_get_jgraphics(view);
	jbox_get_rect_for_view((t_object*) &x->box, view, &rect);
	
	// clear the background
	jgraphics_rectangle_rounded(g,  border_thickness, 
								border_thickness, 
								rect.width - ((border_thickness) * 2.0), 
								rect.height - ((border_thickness) * 2.0), 
								cornersize, cornersize); 
	jgraphics_set_source_jrgba(g,	&x->bgcolor);
	jgraphics_fill(g);
	
	// draw the titlebar
	jgraphics_rectangle_rounded(g,  border_thickness, 
								border_thickness, 
								rect.width - (border_thickness * 2.0 + 1.0), 
								18.0, 
								cornersize, cornersize); 
	jgraphics_set_source_jrgba(g,	&x->headercolor);
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
	jgraphics_set_source_jrgba(g,	&x->bordercolor);
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
		TTLimit(gain, 0.0f, 127.0f);
		
		if (x->has_mix)
			right_side -= 16.0;
		if (x->has_mute)
			right_side -= 16.0;
		if (x->has_bypass)
			right_side -= 16.0;
		if (x->has_freeze)
			right_side -= 16.0;
		if (x->has_preview)
			right_side -= 16.0;
		if (x->has_panel)
			right_side -= 16.0;
		
		jgraphics_set_source_jrgba(g, &s_color_background_button);
		
		x->rect_gain.x = right_side;
		x->rect_gain.width = 13.0;
		
		jgraphics_set_line_width(g, 1.5);
		jgraphics_arc(g, right_side+6.5, 9.5, 6.5, 0., JGRAPHICS_2PI);
		jgraphics_fill(g);
		
		if (x->selection && x->sel_gain)
			jgraphics_set_source_jrgba(g, &s_color_selected);
		else
			jgraphics_set_source_jrgba(g, &s_color_border_button);
		jgraphics_arc(g, right_side+6.5, 9.5, 6.5, 0., JGRAPHICS_2PI);
		jgraphics_stroke(g);
		
		jgraphics_set_source_jrgba(g, &s_color_darkgreen);
		
		jgraphics_arc(g, right_side+6.5, 3.0+6.5, 6.5, PI / 2, ((gain / 127.0) * TWOPI) + (PI/2)); // angles are in radians
		jgraphics_line_to(g, right_side+6.5, 3.0+6.5);
		jgraphics_close_path(g);
		jgraphics_fill(g);	
		
		jgraphics_set_source_jrgba(g, &s_color_green_ring);
		jgraphics_arc(g, right_side+6.5, 3.0+6.5, 6.5, PI / 2, ((gain / 127.0) * TWOPI) + (PI/2));
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
		if (x->has_preview)
			right_side -= 16.0;
		if (x->has_panel)
			right_side -= 16.0;
		
		jgraphics_set_source_jrgba(g, &s_color_background_button);
		
		x->rect_mix.x = right_side;
		x->rect_mix.width = 13.0;
		
		jgraphics_set_line_width(g, 1.5);
		jgraphics_arc(g, right_side+6.5, 9.5, 6.5, 0., JGRAPHICS_2PI);
		jgraphics_fill(g);
		
		if (x->selection && x->sel_mix)
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
		if (x->has_preview)
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
		
		if (x->selection && x->sel_mute)
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
		if (x->has_preview)
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
		
		if (x->selection && x->sel_bypass)
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
		
		if (x->has_preview)
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
		
		if (x->selection && x->sel_freeze)
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
	
	// draw the preview button
	if (x->has_preview) {
		long right_side = rect.width - 16.0;
		
		if (x->has_panel)
			right_side -= 16.0;
		
		if (x->is_previewing)
			jgraphics_set_source_jrgba(g, &s_color_green_button);
		else
			jgraphics_set_source_jrgba(g, &s_color_background_button);
		
		x->rect_preview.x = right_side;
		x->rect_preview.width = 13.0;
		
		jgraphics_set_line_width(g, 1.5);
		jgraphics_arc(g, right_side+6.5, 9.5, 6.5, 0., JGRAPHICS_2PI);
		jgraphics_fill(g);
		
		if (x->selection && x->sel_preview)
			jgraphics_set_source_jrgba(g, &s_color_selected);
		else
			jgraphics_set_source_jrgba(g, &s_color_border_button);
		jgraphics_arc(g, right_side+6.5, 9.5, 6.5, 0., JGRAPHICS_2PI);
		jgraphics_stroke(g);
		
		// p
		if (x->is_previewing)
			jgraphics_set_source_jrgba(g, &s_color_text_button_on);
		else
			jgraphics_set_source_jrgba(g, &s_color_text_button_off);
		jgraphics_set_line_width(g, 2.0);
		jgraphics_move_to(g, right_side + 4.0, 12.0);
		jgraphics_select_font_face(g, JAMOMA_BUTTON_FONT, JGRAPHICS_FONT_SLANT_NORMAL, JGRAPHICS_FONT_WEIGHT_BOLD);
		jgraphics_set_font_size(g, 7.0);
		jgraphics_show_text(g, "p");
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

void ui_mousedown(t_ui *x, t_object *patcherview, t_pt px, long modifiers)
{
	ObjectPtr	obj;
	SymbolPtr	objclass;
	t_rect		rect;
	
	// usually we don't want mousedragdelta -- we turn it on below as necessary
	jbox_set_mousedragdelta((t_object *)x, 0);
	
	jbox_get_rect_for_view((t_object *)x, patcherview, &rect); 
	
	// a click on jcom.ui panel will select/unselect all jcom.remote
	if (px.y > 20.0) {
		
		// if the control key is pressed
		if (modifiers & eShiftKey) {

			obj = object_attr_getobj(jamoma_patcher_get((ObjectPtr)x), _sym_firstobject);
			while (obj) {
				objclass = object_attr_getsym(obj, _sym_maxclass);
				if (objclass == gensym("jcom.remote")) {
					
					object_method(object_attr_getobj(obj, _sym_object), gensym("mousedown"), patcherview, px, modifiers);
					
				}
				obj = object_attr_getobj(obj, _sym_nextobject);
			}
			
			// update the mouse position to display
			//ui_mousemove(x, patcherview, px, modifiers);
		}
		
		return;
	}
	
	if (px.x > 18 && px.y < 20.0) {//(rect.width - 112)) {
		// we check the gain and mix knobs first because they are continuous datas and should run as fast as possible
		if (x->has_gain && px.x >= x->rect_gain.x && px.x <= (x->rect_gain.x + x->rect_gain.width)) {
			if (x->selection) {
				x->sel_gain = !x->sel_gain;
				ui_viewer_highlight(x, TTSymbol("out.*/gain"), x->sel_gain);
			}
			else {
				x->gainDragging = true;
				x->anchor.x = x->anchor.y = 0.0;
				x->anchorValue = x->gain;			
				jbox_set_mousedragdelta((t_object *)x, 1);
			}
		}
		else if (x->has_mix && px.x >= x->rect_mix.x && px.x <= (x->rect_mix.x + x->rect_mix.width)) {
			if (x->selection) {
				x->sel_mix = !x->sel_mix;
				ui_viewer_highlight(x, TTSymbol("out.*/mix"), x->sel_mix);
			}
			else {
				x->mixDragging = true;
				x->anchor.x = x->anchor.y = 0.0;
				x->anchorValue = x->mix;			
				jbox_set_mousedragdelta((t_object *)x, 1);
			}
		}
		else if (x->has_panel && px.x >= x->rect_panel.x && px.x <= (x->rect_panel.x + x->rect_panel.width))
			ui_data_send(x, TTSymbol("panel"), kTTValNONE);
		
		else if (x->has_preview && px.x >= x->rect_preview.x && px.x <= (x->rect_preview.x + x->rect_preview.width)) {
			if (x->selection) {
				x->sel_preview = !x->sel_preview;
				ui_viewer_highlight(x, TTSymbol("out.*/preview"), x->sel_preview);
			}
			else
				ui_viewer_send(x, TTSymbol("out.*/preview"), TTValue(!x->is_previewing));
		}
		else if (x->has_freeze && px.x >= x->rect_freeze.x && px.x <= (x->rect_freeze.x + x->rect_freeze.width)) {
			if (x->selection) {
				x->sel_freeze = !x->sel_freeze;
				ui_viewer_highlight(x, TTSymbol("out.*/freeze"), x->sel_freeze);
			}
			else
				ui_viewer_send(x, TTSymbol("out.*/freeze"), TTValue(!x->is_frozen));
		}
		else if (x->has_bypass && px.x >= x->rect_bypass.x && px.x <= (x->rect_bypass.x + x->rect_bypass.width)) {
			if (x->selection) {
				x->sel_bypass = !x->sel_bypass;
				ui_viewer_highlight(x, TTSymbol("in.*/bypass"), x->sel_bypass);
			}
			else
				ui_viewer_send(x, TTSymbol("in.*/bypass"), TTValue(!x->is_bypassed));
		}
		else if (x->has_mute && px.x >= x->rect_mute.x && px.x <= (x->rect_mute.x + x->rect_mute.width)) {
			if (x->selection) {
				x->sel_mute = !x->sel_mute;
				ui_viewer_highlight(x, TTSymbol("out.*/mute"), x->sel_mute);
			}
			else
				ui_viewer_send(x, TTSymbol("out.*/mute"), TTValue(!x->is_muted));
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
	ObjectPtr	textfield = jbox_get_textfield((t_object*) x);
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
		ui_viewer_send(x, TTSymbol("out.*/mix"), TTValue(x->anchorValue));
		
		snprintf(str, sizeof(str), "%f", x->mix);
		object_method(textfield, gensym("settext"), str);
	}
	else if (x->gainDragging) {
		x->anchorValue = x->anchorValue - (pt.y * factor);
		TTLimit(x->anchorValue, 0.0f, 127.0f);
		ui_viewer_send(x, TTSymbol("out.*/gain"), TTValue(x->anchorValue));
		
		snprintf(str, sizeof(str), "%f", x->gain);
		object_method(textfield, gensym("settext"), str);
	}
}

void ui_mouseup(t_ui *x, t_object *patcherview)
{
	x->mixDragging = false;
	x->gainDragging = false;
	t_object *textfield = jbox_get_textfield((t_object*) x);
	if (textfield)
		if (x->modelAddress != kTTSymEmpty)
			object_method(textfield, gensym("settext"), x->modelAddress.c_str());
		else
			object_method(textfield, gensym("settext"),NO_MODEL_STRING);
	
	jbox_redraw(&x->box);
}

void ui_mousemove(t_ui *x, t_object *patcherview, t_pt pt, long modifiers)
{
	SymbolPtr	objclass;
	ObjectPtr	obj = object_attr_getobj(jamoma_patcher_get((ObjectPtr)x), _sym_firstobject);
	Atom		selected_color[4];
	
	// if the control key is pressed
	if (modifiers & eShiftKey) {
		
		x->selection = true;
		
		// Is the mouse wasn't hover the jcom.ui panel
		if (!x->hover) {
			x->hover = true;
			atom_setfloat(&selected_color[0], 0.62);
			atom_setfloat(&selected_color[1], 0.);
			atom_setfloat(&selected_color[2], 0.36);
			atom_setfloat(&selected_color[3], 0.70);
			object_attr_setvalueof(x, gensym("bordercolor"), 4, selected_color);
		}
	}
	else {
		
		x->selection = false;
		
		if (x->hover) {
			x->hover = false;
			object_attr_setcolor((ObjectPtr)x, gensym("bordercolor"), &x->memo_bordercolor);
		}
	}
	
	while (obj) {
		objclass = object_attr_getsym(obj, _sym_maxclass);
		if (objclass == gensym("jcom.remote")) {
			
			object_method(object_attr_getobj(obj, _sym_object), gensym("mousemove"), patcherview, pt, modifiers);

		}
		obj = object_attr_getobj(obj, _sym_nextobject);
	}
}

void ui_mouseleave(t_ui *x, t_object *patcherview, t_pt pt, long modifiers)
{	
	SymbolPtr objclass;
	ObjectPtr obj = object_attr_getobj(jamoma_patcher_get((ObjectPtr)x), _sym_firstobject);
	
	// Is the mouse leave outside the jcom.ui (not hover an ui object)
	if (	pt.x <= x->box.b_presentation_rect.x || pt.x >= (x->box.b_presentation_rect.x + x->box.b_presentation_rect.width)
		||	pt.y <= x->box.b_presentation_rect.y || pt.y >= (x->box.b_presentation_rect.y + x->box.b_presentation_rect.height)) {
		x->hover = false;
		object_attr_setcolor((ObjectPtr)x, gensym("bordercolor"), &x->memo_bordercolor);
	}

	while (obj) {
		objclass = object_attr_getsym(obj, _sym_maxclass);
		if (objclass == gensym("jcom.remote")) {
			
			object_method(object_attr_getobj(obj, _sym_object), gensym("mouseleave"), patcherview, pt, modifiers*x->hover); // * hover allows to return to a normal display
			
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
	
	if (item->sym == gensym("Defeat Signal Meters")) {
		if (x->is_metersdefeated)
			ui_viewer_send(x, TTSymbol("audio/meters/freeze"), NO);
		else
			ui_viewer_send(x, TTSymbol("audio/meters/freeze"), YES);
	}
	else if (item->sym == gensym("Disable UI Updates")) {
		if (x->ui_freeze)
			ui_data_send(x, TTSymbol("freeze"), NO);
		else
			ui_data_send(x, TTSymbol("freeze"), YES);
	}
	
	else if (item->sym == gensym("Load Settings..."))
		defer(x, (method)ui_preset_doread, NULL, 0, 0L);
	
	else if (item->sym == gensym("Save Settings..."))
		defer(x, (method)ui_preset_dowrite, NULL, 0, 0L);
	
	else if (item->sym == gensym("Restore Default Settings"))
		ui_viewer_send(x, TTSymbol("preset/recall"), kTTVal1);
	
	else if (item->sym == gensym("Store Current Preset"))
		ui_viewer_send(x, TTSymbol("preset/store"), kTTValNONE);
	
	else if (item->sym == gensym("Store as Next Preset"))
		ui_preset_store_next(x);
	
	else if (item->sym == gensym("Open Preset Interface"))
		ui_preset_interface(x);
	
	else if (item->sym == gensym("Edit Current State as Text"))
		ui_viewer_send(x, TTSymbol("model/edit"), kTTValNONE);
	
	else if (item->sym == gensym("Open Model Internal"))
		ui_viewer_send(x, TTSymbol("model/open"), kTTValNONE);
	
	else if (item->sym == gensym("Open Model Help Patch"))
		ui_viewer_send(x, TTSymbol("model/help"), kTTValNONE);
	
	else if (item->sym == gensym("Open Model Reference Page"))
		ui_viewer_send(x, TTSymbol("model/reference"), kTTValNONE);
	
	else	// assume the menu item is a preset name
		ui_viewer_send(x, TTSymbol("preset/recall"), TTSymbol(item->sym->s_name));
}

void ui_menu_build(t_ui *x)
{
	t_symobject*	item = NULL;
	int				i;
	
	if (!x->menu_items)
		return;
	
	linklist_clear(x->menu_items);
	item = (t_symobject *)symobject_new(gensym("Disable UI Updates"));
	linklist_append(x->menu_items, item);	
	item = (t_symobject *)symobject_new(gensym("-"));
	linklist_append(x->menu_items, item);
	
	if (x->has_meters) {
		item = (t_symobject *)symobject_new(gensym("Defeat Signal Meters"));
		linklist_append(x->menu_items, item);
		item = (t_symobject *)symobject_new(gensym("Clear Signal Meters"));
		linklist_append(x->menu_items, item);
		item = (t_symobject *)symobject_new(gensym("-"));
		linklist_append(x->menu_items, item);
	}
	
	if (x->has_preset) {
		item = (t_symobject *)symobject_new(gensym("Load Settings..."));
		linklist_append(x->menu_items, item);
		item = (t_symobject *)symobject_new(gensym("Save Settings..."));
		linklist_append(x->menu_items, item);
		item = (t_symobject *)symobject_new(gensym("Restore Default Settings"));
		linklist_append(x->menu_items, item);
		item = (t_symobject *)symobject_new(gensym("Store Current Preset"));
		linklist_append(x->menu_items, item);
		item = (t_symobject *)symobject_new(gensym("Store as Next Preset"));
		linklist_append(x->menu_items, item);
		item = (t_symobject *)symobject_new(gensym("Open Preset Interface"));
	}
	
	linklist_append(x->menu_items, item);
	
	item = (t_symobject *)symobject_new(gensym("-"));
	if (x->has_model) {
        
        linklist_append(x->menu_items, item);
        item = (t_symobject *)symobject_new(gensym("Edit Current State as Text"));
		linklist_append(x->menu_items, item);
		item = (t_symobject *)symobject_new(gensym("Open Model Reference Page"));
		linklist_append(x->menu_items, item);
		item = (t_symobject *)symobject_new(gensym("Open Model Help Patch"));
		linklist_append(x->menu_items, item);
		item = (t_symobject *)symobject_new(gensym("Open Model Internal"));
	}
	
	linklist_append(x->menu_items, item);	
	
	// append preset name list
	if (x->preset_order) {
		item = (t_symobject *)symobject_new(gensym("-"));
		linklist_append(x->menu_items, item);
		
		for (i=0; i<x->preset_num; i++) {
			item = (t_symobject *)symobject_new(atom_getsym(&x->preset_order[i]));
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
	
	ui_explorer_create((ObjectPtr)x, &x->modelParamExplorer, gensym("return_modelParamExploration"));
	
	filters = TTValue(kTTSym_parameter);
	filters.append(TTSymbol("noGenericTag"));
	x->modelParamExplorer->setAttributeValue(TTSymbol("filterList"), filters);
	
	x->modelParamExplorer->setAttributeValue(kTTSym_address, x->modelAddress);
	x->modelParamExplorer->sendMessage(TTSymbol("Explore"));
	
	// Look for User-Defined Messages into the model
	item = (t_symobject *)symobject_new(gensym("-"));
	linklist_append(x->refmenu_items, item);
	item = (t_symobject *)symobject_new(gensym("User-Defined Messages"));
	linklist_append(x->refmenu_items, item);
	item->flags = 1;	// mark to disable this item (we use it as a label)
	
	ui_explorer_create((ObjectPtr)x, &x->modelMessExplorer, gensym("return_modelMessExploration"));
	
	filters = TTValue(kTTSym_message);
	filters.append(TTSymbol("noGenericTag"));
	x->modelMessExplorer->setAttributeValue(TTSymbol("filterList"), filters);
	
	x->modelMessExplorer->setAttributeValue(kTTSym_address, x->modelAddress);
	x->modelMessExplorer->sendMessage(TTSymbol("Explore"));
	
	// Look for User-Defined Returns into the model
	item = (t_symobject *)symobject_new(gensym("-"));
	linklist_append(x->refmenu_items, item);
	item = (t_symobject *)symobject_new(gensym("User-Defined Returns"));
	linklist_append(x->refmenu_items, item);
	item->flags = 1;	// mark to disable this item (we use it as a label)
	
	ui_explorer_create((ObjectPtr)x, &x->modelRetExplorer, gensym("return_modelRetExploration"));
	
	filters = TTValue(kTTSym_return);
	filters.append(TTSymbol("noGenericTag"));
	x->modelRetExplorer->setAttributeValue(TTSymbol("filterList"), filters);
	
	x->modelRetExplorer->setAttributeValue(kTTSym_address, x->modelAddress);
	x->modelRetExplorer->sendMessage(TTSymbol("Explore"));

	// Look for Generic Parameters into the model
	item = (t_symobject *)symobject_new(gensym("-"));
	linklist_append(x->refmenu_items, item);
	item = (t_symobject *)symobject_new(gensym("Generic Parameters"));
	linklist_append(x->refmenu_items, item);
	item->flags = 1;	// mark to disable this item (we use it as a label)
	
	filters = TTValue(kTTSym_parameter);
	filters.append(TTSymbol("genericTag"));
	x->modelParamExplorer->setAttributeValue(TTSymbol("filterList"), filters);
	
	x->modelParamExplorer->setAttributeValue(kTTSym_address, x->modelAddress);
	x->modelParamExplorer->sendMessage(TTSymbol("Explore"));
	
	// Look for Generic Messages into the model
	item = (t_symobject *)symobject_new(gensym("-"));
	linklist_append(x->refmenu_items, item);
	item = (t_symobject *)symobject_new(gensym("Generic Messages"));
	linklist_append(x->refmenu_items, item);
	item->flags = 1;	// mark to disable this item (we use it as a label)
	
	filters = TTValue(kTTSym_message);
	filters.append(TTSymbol("genericTag"));
	x->modelMessExplorer->setAttributeValue(TTSymbol("filterList"), filters);
	
	x->modelMessExplorer->setAttributeValue(kTTSym_address, x->modelAddress);
	x->modelMessExplorer->sendMessage(TTSymbol("Explore"));
	
	// Look for Generic Returns into the model
	item = (t_symobject *)symobject_new(gensym("-"));
	linklist_append(x->refmenu_items, item);
	item = (t_symobject *)symobject_new(gensym("Generic Returns"));
	linklist_append(x->refmenu_items, item);
	item->flags = 1;	// mark to disable this item (we use it as a label)
	
	filters = TTValue(kTTSym_return);
	filters.append(TTSymbol("genericTag"));
	x->modelRetExplorer->setAttributeValue(TTSymbol("filterList"), filters);
	
	x->modelRetExplorer->setAttributeValue(kTTSym_address, x->modelAddress);
	x->modelRetExplorer->sendMessage(TTSymbol("Explore"));
	
	TTObjectBaseRelease(TTObjectBaseHandle(&x->modelParamExplorer));
	TTObjectBaseRelease(TTObjectBaseHandle(&x->modelMessExplorer));
	TTObjectBaseRelease(TTObjectBaseHandle(&x->modelRetExplorer));
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
	textfield_set_useellipsis(textfield, 1); 
	textfield_set_textcolor(textfield, &x->textcolor);
	textfield_set_textmargins(textfield, 20.0, 2.0, 60.0, rect->height - 19.0);
	
	return (void *)1;
}

