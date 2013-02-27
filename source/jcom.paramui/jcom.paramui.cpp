/* 
 * jcom.paramui
 * External for Jamoma: provide standard user interface component for parameters
 * By Tim Place, Copyright © 2007
 * 
 * License: This code is licensed under the terms of the "New BSD License"
 * http://creativecommons.org/licenses/BSD/
 */

#include "jcom.paramui.h"


// class variables
static t_class		*s_ui_class = NULL;
static t_jrgba		s_light_gray = { 0.65, 0.65, 0.65, 1.0};


#pragma mark -
#pragma mark life cycle

int JAMOMA_EXPORT_MAXOBJ main(void)
{
	long		flags;
	t_class*	c;
	TTValue		dataspaceNames;
	TTValue		functionNames;
	TTSymbol	functionName;
	char		dataspaces[2048];
	char		functions[2048];
	char		tempstr[64];
	short		i;

	jamoma_init();
	common_symbols_init();

	TTGetRegisteredClassNamesForTags(dataspaceNames, TTSymbol("dataspace"));	
	dataspaces[0] = 0;
	for (int i=0; i < dataspaceNames.getSize(); i++) {
		TTSymbol	name;
		
		dataspaceNames.get(i, name);
		strcat(dataspaces, name);
		strcat(dataspaces, " ");
	}

    TTGetRegisteredClassNamesForTags(functionNames, TTSymbol("function"));
	functions[0] = 0;
	for (i=0; i<functionNames.getSize(); i++) {
		functionNames.get(i, functionName);
		strcat(functions, functionName);	
		strcat(functions, " ");
	}

	c = class_new("jcom.paramui",
				  (method)paramui_new,
				  (method)paramui_free,
				  sizeof(t_paramui),
				  (method)NULL,
				  A_GIMME,
				  0L);

	flags = JBOX_TEXTFIELD | JBOX_COLOR;
	jbox_initclass(c, flags);
	c->c_flags |= CLASS_FLAG_NEWDICTIONARY; // to specify dictionary constructor

	class_addmethod(c, (method)paramui_notify,			"notify",			A_CANT, 0);
	class_addmethod(c, (method)paramui_paint,			"paint",			A_CANT, 0);
	class_addmethod(c, (method)paramui_mousedown,		"mousedown",		A_CANT, 0);
	class_addmethod(c, (method)paramui_mousedragdelta,	"mousedragdelta",	A_CANT, 0);
	class_addmethod(c, (method)paramui_mouseup,			"mouseup",			A_CANT, 0);
	class_addmethod(c, (method)paramui_oksize,			"oksize",			A_CANT, 0);

	CLASS_ATTR_DEFAULT(c,		"patching_rect",	0, "0. 0. 144. 20.");
	CLASS_ATTR_DEFAULT(c,		"fontname",			0, JAMOMA_DEFAULT_FONT);
	snprintf(tempstr, 64, "%f", JAMOMA_DEFAULT_FONTSIZE);
	CLASS_ATTR_DEFAULT(c,		"fontsize",			0, tempstr);

	CLASS_STICKY_ATTR(c,		"category",			0, "Jamoma");
	
	CLASS_ATTR_SYM(c,			"name",				0, t_paramui, attr_name);
	CLASS_ATTR_LABEL(c,			"name",				0, "Parameter Name");
	CLASS_ATTR_DEFAULT(c,		"name",				0, "my/parameter");
	CLASS_ATTR_SAVE(c,			"name",				0);
	CLASS_ATTR_ACCESSORS(c,		"name",				paramui_getName, paramui_setName);

	CLASS_ATTR_SYM(c,			"label",			0, t_paramui, attr_label);
	CLASS_ATTR_LABEL(c,			"label",			0, "Parameter Label");
	CLASS_ATTR_STYLE(c,			"label",			0, "text_onesymbol");
	CLASS_ATTR_DEFAULT(c,		"label",			0, "");
	CLASS_ATTR_SAVE(c,			"label",			0);

	CLASS_ATTR_SYM(c,			"type",				0, t_paramui, attr_type);
	CLASS_ATTR_LABEL(c,			"type",				0, "Data Type");
	CLASS_ATTR_ENUM(c,			"type",				0, "decimal integer string boolean");
	CLASS_ATTR_DEFAULT(c,		"type",				0, "decimal");
	CLASS_ATTR_SAVE(c,			"type",				0);
	CLASS_ATTR_ACCESSORS(c,		"type",				paramui_getType, paramui_setType);

	CLASS_ATTR_FLOAT_VARSIZE(c,	"value/default",	0, t_paramui, attr_default, attr_defaultSize, LISTSIZE);
	CLASS_ATTR_LABEL(c,			"value/default",	0, "Default Value");
	CLASS_ATTR_DEFAULT(c,		"value/default",	0, "0.");
	CLASS_ATTR_SAVE(c,			"value/default",	0);
	CLASS_ATTR_ACCESSORS(c,		"value/default",	paramui_getDefault, paramui_setDefault);

	CLASS_ATTR_SYM(c,			"ramp/drive",		0, t_paramui, attr_rampDrive);
	CLASS_ATTR_LABEL(c,			"ramp/drive",		0, "Ramp Drive");
	CLASS_ATTR_DEFAULT(c,		"ramp/drive",		0, "none");
	CLASS_ATTR_SAVE(c,			"ramp/drive",		0);
	CLASS_ATTR_ACCESSORS(c,		"ramp/drive",		paramui_getRampDrive, paramui_setRampDrive);

	CLASS_ATTR_SYM(c,			"ramp/function",	0, t_paramui, attr_rampFunction);
	CLASS_ATTR_LABEL(c,			"ramp/function",	0, "Ramp Function/Shape");
	CLASS_ATTR_ENUM(c,			"ramp/function",	0, functions);
	CLASS_ATTR_DEFAULT(c,		"ramp/function",	0, "linear");
	CLASS_ATTR_SAVE(c,			"ramp/function",	0);
	CLASS_ATTR_ACCESSORS(c,		"ramp/function",	paramui_getRampFunction, paramui_setRampFunction);

	CLASS_ATTR_LONG(c,			"view/freeze",		0, t_paramui, attr_uiFreeze);
	CLASS_ATTR_LABEL(c,			"view/freeze",		0, "Freeze the UI");
	CLASS_ATTR_STYLE(c,			"view/freeze",		0, "onoff");
	CLASS_ATTR_DEFAULT(c,		"view/freeze",		0, "0");
	CLASS_ATTR_SAVE(c,			"view/freeze",		0);
	CLASS_ATTR_ACCESSORS(c,		"view/freeze",		paramui_getUIFreeze, paramui_setUIFreeze);

	CLASS_ATTR_FLOAT(c,			"value/stepsize",	0, t_paramui, attr_stepsize);
	CLASS_ATTR_LABEL(c,			"value/stepsize",	0, "Step Size for inc/dec");
	CLASS_ATTR_DEFAULT(c,		"value/stepsize",	0, "1.0");
	CLASS_ATTR_SAVE(c,			"value/stepsize",	0);
	CLASS_ATTR_ACCESSORS(c,		"value/stepsize",	paramui_getStepsize, paramui_setStepsize);

	CLASS_ATTR_LONG(c,			"priority",			0, t_paramui, attr_priority);
	CLASS_ATTR_LABEL(c,			"priority",			0, "Priority when Recalled from Presets");
	CLASS_ATTR_DEFAULT(c,		"priority",			0, "0");
	CLASS_ATTR_SAVE(c,			"priority",			0);
	CLASS_ATTR_ACCESSORS(c,		"priority",			paramui_getPriority, paramui_setPriority);

	CLASS_ATTR_FLOAT_ARRAY(c,	"range/bounds",		0, t_paramui, attr_range, 2);
	CLASS_ATTR_LABEL(c,			"range/bounds",		0, "Range");
	CLASS_ATTR_DEFAULT(c,		"range/bounds",		0, "0.0 1.0");
	CLASS_ATTR_SAVE(c,			"range/bounds",		0);
	CLASS_ATTR_ACCESSORS(c,		"range/bounds",		paramui_getRange, paramui_setRange);

	CLASS_ATTR_LONG(c,			"repetitions/allow",		0, t_paramui, attr_repetitions);
	CLASS_ATTR_LABEL(c,			"repetitions/allow",		0, "Allow Repeated Values");
	CLASS_ATTR_STYLE(c,			"repetitions/allow",		0, "onoff");
	CLASS_ATTR_DEFAULT(c,		"repetitions/allow",		0, "0");
	CLASS_ATTR_SAVE(c,			"repetitions/allow",		0);
	CLASS_ATTR_ACCESSORS(c,		"repetitions/allow",		paramui_getRepetitions, paramui_setRepetitions);

	CLASS_ATTR_SYM(c,			"range/clipmode",	0, t_paramui, attr_clipmode);
	CLASS_ATTR_LABEL(c,			"range/clipmode",	0, "Mode for Clipping to Range");
	CLASS_ATTR_ENUM(c,			"range/clipmode",	0, "none low high both");
	CLASS_ATTR_DEFAULT(c,		"range/clipmode",	0, "none");
	CLASS_ATTR_SAVE(c,			"range/clipmode",	0);
	CLASS_ATTR_ACCESSORS(c,		"range/clipmode",	paramui_getClipmode, paramui_setClipmode);

	CLASS_ATTR_SYM(c,			"description",		0, t_paramui, attr_description);
	CLASS_ATTR_LABEL(c,			"description",		0, "Parameter Description");
	//CLASS_ATTR_STYLE(c,			"description",		0, "text_large");
	CLASS_ATTR_STYLE(c,			"description",		0, "text_onesymbol");
	CLASS_ATTR_DEFAULT(c,		"description",		0, "This parameter should do something.");
	CLASS_ATTR_SAVE(c,			"description",		0);
	CLASS_ATTR_ACCESSORS(c,		"description",		paramui_getDescription, paramui_setDescription);

	CLASS_ATTR_SYM(c,			"dataspace",		0, t_paramui, attr_dataspace);
	CLASS_ATTR_LABEL(c,			"dataspace",		0, "Dataspace");
	CLASS_ATTR_ENUM(c,			"dataspace",		0, dataspaces);
	CLASS_ATTR_DEFAULT(c,		"dataspace",		0, "none");
	CLASS_ATTR_SAVE(c,			"dataspace",		0);
	CLASS_ATTR_ACCESSORS(c,		"dataspace",		paramui_getDataspace, paramui_setDataspace);

	CLASS_ATTR_SYM(c,			"dataspace/unit",		0, t_paramui, attr_unitActive);
	CLASS_ATTR_LABEL(c,			"dataspace/unit",		0, "Active Unit within the Dataspace");
	CLASS_ATTR_DEFAULT(c,		"dataspace/unit",		0, "none");
	CLASS_ATTR_SAVE(c,			"dataspace/unit",		0);
	CLASS_ATTR_ACCESSORS(c,		"dataspace/unit",		paramui_getUnitActive, paramui_setUnitActive);

	CLASS_STICKY_ATTR_CLEAR(c,	"category");

	class_register(CLASS_BOX, c);
	s_ui_class = c;
	
	sysmem_freeptr(dataspaceNames);
	return 0;
}


t_paramui* paramui_new(t_symbol *s, long argc, t_atom *argv)
{
	t_paramui		*x = NULL;
	t_dictionary 	*d = NULL;
	long 			flags;
	t_atom			a[LISTSIZE+34];
	long			argLen;
	//t_max_err		err = MAX_ERR_NONE;

	if (!(d=object_dictionaryarg(argc, argv)))
		return NULL;	

	if (x = (t_paramui*)object_alloc(s_ui_class)) {
		flags = 0 
				| JBOX_DRAWFIRSTIN
				| JBOX_NODRAWBOX
		//		| JBOX_DRAWINLAST
				| JBOX_TRANSPARENT	
		//		| JBOX_NOGROW
		//		| JBOX_GROWY
		//		| JBOX_GROWBOTH
		//		| JBOX_IGNORELOCKCLICK
				| JBOX_HILITE
		//		| JBOX_BACKGROUND
		//		| JBOX_NOFLOATINSPECTOR
				| JBOX_TEXTFIELD
				;

		jbox_new(&x->box, flags, argc, argv);
		x->box.b_firstin = (t_object *)x;
		x->outlet = outlet_new(x, 0L);
		x->menu_items = NULL;
				
		attr_dictionary_process(x, d); 					// handle attribute args
		
		// a textlayout is used for the displaying the value and the unit
		x->layout_value = jtextlayout_create();
		x->layout_unit = jtextlayout_create();

		jbox_ready(&x->box);

		x = (t_paramui *)object_register(CLASS_BOX, symbol_unique(), x);

		x->menu_items = (t_linklist *)linklist_new();
		paramui_menu_build(x);
		x->menu_qelem = qelem_new(x, (method)paramui_menu_qfn);
		
		// here we create our internal instance of jcom.parameter
		atom_setsym(a+0, x->attr_name);
		atom_setsym(a+1, gensym("@type"));
		atom_setsym(a+2, x->attr_type);
		atom_setsym(a+3, gensym("@ramp/drive"));
		atom_setsym(a+4, x->attr_rampDrive);
		atom_setsym(a+5, gensym("@ramp/function"));
		atom_setsym(a+6, x->attr_rampFunction);
		atom_setlong(a+7, x->attr_uiFreeze);
		atom_setsym(a+8, gensym("@value/stepsize"));
		atom_setfloat(a+9, x->attr_stepsize);
		atom_setsym(a+10, gensym("@priority"));
		atom_setlong(a+11, x->attr_priority);
		atom_setsym(a+12, gensym("@range/bounds"));
		atom_setfloat(a+13, x->attr_range[0]);
		atom_setfloat(a+14, x->attr_range[1]);
		atom_setsym(a+15, gensym("@repetitions/allow"));
		atom_setlong(a+16, x->attr_repetitions);
		atom_setsym(a+17, gensym("@range/clipmode"));
		atom_setsym(a+18, x->attr_clipmode);
		atom_setsym(a+19, gensym("@description"));
		atom_setsym(a+20, x->attr_description);
		atom_setsym(a+21, gensym("@dataspace"));
		atom_setsym(a+22, x->attr_dataspace);
		atom_setsym(a+23, gensym("@dataspace/unit"));
		atom_setsym(a+24, x->attr_unitActive);
		if (x->attr_defaultSize) {
			atom_setsym(a+25, gensym("@value/default"));
			sysmem_copyptr(x->attr_default, a+28, sizeof(t_atom) * x->attr_defaultSize);
			argLen = 26 + x->attr_defaultSize;
		}
		else
			argLen = 25;

		jamoma_extern_load(gensym("jcom.parameter"), argLen, a, &x->obj_parameter);
	}
	return x;
}


void paramui_free(t_paramui *x)
{
	jbox_free(&x->box);

	qelem_free(x->menu_qelem);
	x->menu_qelem = NULL;
	object_free(x->menu_items);
	object_detach_byptr(x, x->obj_parameter);
	if (x->layout_value)
		jtextlayout_destroy(x->layout_value);
	if (x->layout_unit)
		jtextlayout_destroy(x->layout_unit);
	object_free(x->obj_parameter);
}


#pragma mark -
#pragma mark methods

t_max_err paramui_notify(t_paramui *x, t_symbol *s, t_symbol *msg, void *sender, void *data)
{
	if (msg == _sym_modified)
		jbox_redraw(&x->box);	
	else if ((msg == _sym_attr_modified) && (sender == x)) {
		t_object	*textfield;
		t_symbol	*attrname;

		attrname = (t_symbol *)object_method((t_object *)data, gensym("getname"));
		
		if (attrname == _sym_name) {
			if (!x->attr_label || x->attr_label == _sym_nothing) {
				textfield = jbox_get_textfield((t_object*) x); 
				object_method(textfield, gensym("settext"), x->attr_name->s_name);
			}
		}
		else if (attrname == gensym("label")) {
			if (x->attr_label && x->attr_label != _sym_nothing) {
				textfield = jbox_get_textfield((t_object*) x); 
				object_method(textfield, gensym("settext"), x->attr_label->s_name);
			}
		}
		else
			paramui_menu_build(x);		// we don't really want this everytime -- make this conditional...

		jbox_redraw(&x->box);
	}
	return MAX_ERR_NONE;
}


#pragma mark -
#pragma mark drawing and appearance

void paramui_paint(t_paramui *x, t_object *view)
{
	t_rect 		rect;
	t_jgraphics *g;
	double		middle;
	double 		border_thickness = 1.5;
	double 		cornersize = 13.0;

	g = (t_jgraphics*) patcherview_get_jgraphics(view);
	jbox_get_rect_for_view((t_object*) &x->box, view, &rect);

	// clear the background
	jgraphics_rectangle_rounded(g,  border_thickness, 
									border_thickness, 
									rect.width - (border_thickness * 2.0), 
									rect.height - (border_thickness * 2.0), 
									cornersize, cornersize); 
	jgraphics_set_source_rgba(g, 0.1, 0.1, 0.1, 1.0);
	jgraphics_fill(g);
		
	// draw the inspector icon

	jgraphics_set_source_rgb(g, 0.2, 0.2, 0.2);
	jgraphics_set_line_width(g, 1.5);
	jgraphics_oval(g,	border_thickness,
						border_thickness, 
						rect.height - (border_thickness * 2.0),
						rect.height - (border_thickness * 2.0));
	jgraphics_fill(g);
	
	jgraphics_rectangle_fill_fast(g,	border_thickness + rect.height / 2 - (border_thickness), 
										border_thickness,
										border_thickness + rect.height / 2, 
										rect.height - (border_thickness * 2.0));

	jgraphics_set_source_rgb(g, 0.4, 0.4, 0.4);
	middle = 6.0;
	jgraphics_move_to(g, 9.5, middle + 4.0);
	jgraphics_line_to(g, 13.0, middle);
	jgraphics_line_to(g, 6.0, middle);
	jgraphics_close_path(g);
	jgraphics_fill(g);


	if (x->attr_dataspace != jps_none) {
		char data[64];	
	
		strncpy(data, x->attr_unitActive->s_name, 64);

		// draw the unit display
		jgraphics_set_source_rgb(g, 0.2, 0.2, 0.2);
		jgraphics_set_line_width(g, 1.5);
		jgraphics_oval(g,	rect.width - (rect.height - (border_thickness * 2.0)) - 2.0, 
							border_thickness, 
							rect.height - (border_thickness * 2.0), 
							rect.height - (border_thickness * 2.0));
		jgraphics_fill(g);
		
		jgraphics_rectangle_fill_fast(g,	rect.width - ((border_thickness + rect.height / 2 - (border_thickness)) * 3.0) - 2.0, 
											border_thickness, 
											border_thickness + rect.height / 1, 
											rect.height - (border_thickness * 2.0));


		jtextlayout_settextcolor(x->layout_unit, &s_light_gray);
		jtextlayout_set(x->layout_unit,
						data,
						jfont_create(JAMOMA_DEFAULT_FONT, JGRAPHICS_FONT_SLANT_NORMAL, JGRAPHICS_FONT_WEIGHT_NORMAL, JAMOMA_DEFAULT_FONTSIZE),
						rect.width - 28.0, 0.0, 28.0, rect.height - 1.0,
						JGRAPHICS_TEXT_JUSTIFICATION_CENTERED,
						JGRAPHICS_TEXTLAYOUT_USEELLIPSIS);
		jtextlayout_draw(x->layout_unit, g);
	}
	
	{
		char	data[256];
		t_atom	*av = NULL;
		long	ac = 0;

		if (x->obj_parameter) {
			object_attr_getvalueof(x->obj_parameter, gensym("value"), &ac, &av);
			if (ac) {
				if (x->attr_type == jps_decimal)
					snprintf(data, 256, "%.4f", atom_getfloat(av));
				else if (x->attr_type == jps_integer || x->attr_type == jps_boolean)
					snprintf(data, 256, "%ld", atom_getlong(av));
				else if (x->attr_type == jps_string)
					strcpy(data, atom_getsym(av)->s_name);
				
				jtextlayout_settextcolor(x->layout_value, &s_light_gray);
				jtextlayout_set(x->layout_value,
								data,
								jfont_create(JAMOMA_DEFAULT_FONT, JGRAPHICS_FONT_SLANT_NORMAL, JGRAPHICS_FONT_WEIGHT_NORMAL, JAMOMA_DEFAULT_FONTSIZE),
								84.0, 2.0, rect.width - 84.0 - 20.0, rect.height - 1.0,
								JGRAPHICS_TEXT_JUSTIFICATION_LEFT,
								JGRAPHICS_TEXTLAYOUT_USEELLIPSIS);
				jtextlayout_draw(x->layout_value, g);
				sysmem_freeptr(av);
			}
		}
	}

	// draw borders
	jgraphics_rectangle_rounded(g,  border_thickness, 
									border_thickness, 
									rect.width - (border_thickness * 2.0), 
									rect.height - (border_thickness * 2.0), 
									cornersize, cornersize); 
	jgraphics_set_source_rgb(g, 0.3, 0.3, 0.3);
	jgraphics_set_line_width(g, 1.5);
	jgraphics_stroke(g);

	jgraphics_set_line_width(g, 1.0);
	jgraphics_move_to(g, border_thickness, 19.5);
	jgraphics_line_to(g, rect.width - (border_thickness * 1.0), 19.5);
	jgraphics_stroke(g);
}


void paramui_mousedown(t_paramui *x, t_object *patcherview, t_pt px, long modifiers)
{
	t_rect rect;
	
	jbox_get_rect_for_view((t_object *)x, patcherview, &rect); 
	if (px.x < 14)
		paramui_menu_do(x, patcherview, px, modifiers);
}



// mousedragdelta sends the amount the mouse moved in t_pt
void paramui_mousedragdelta(t_paramui *x, t_object *patcherview, t_pt pt, long modifiers)
{
	;
}


void paramui_mouseup(t_paramui *x, t_object *patcherview)
{
	;
}


#pragma mark -
#pragma mark Menus

void paramui_menu_do(t_paramui *x, t_object *patcherview, t_pt px, long modifiers)
{
	t_jpopupmenu 		*p;
	t_symobject			*item;
	long				size, i;
	int 				selectedId;
	t_jfont 			*font;
	int					coord_x=0, coord_y=0;
	t_pt				pt;

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
		if (!item->sym || (item->sym->s_name[0] == '\0') || item->sym->s_name[0] == '-')//{
			jpopupmenu_addseperator(p);
		else
			jpopupmenu_additem(p, i+1, item->sym->s_name, NULL, 0, item->flags, NULL);
	}

	object_method(patcherview, gensym("canvastoscreen"), 0.0, 0.0, &coord_x, &coord_y);	
	coord_x += x->box.b_patching_rect.x;
	coord_y += x->box.b_patching_rect.y;
	pt.x = coord_x;
	pt.y = coord_y;
	selectedId = jpopupmenu_popup_nearbox(p, (t_object*)x, patcherview, x->menu_selection+1); 
	if (selectedId) {
		x->menu_selection = selectedId -1;
		qelem_set(x->menu_qelem);
	}

	jpopupmenu_destroy(p);
}


void paramui_menu_qfn(t_paramui *x)
{
	t_symobject *item = (t_symobject *)linklist_getindex(x->menu_items, x->menu_selection);
	
	if (item->sym == gensym("Set Parameter to Default Value"))
		object_method(x->obj_parameter, gensym("reset"));
}


void paramui_menu_build(t_paramui *x)
{
	t_symobject	*item = NULL;
	
	if (!x->menu_items)
		return;

	linklist_clear(x->menu_items);
	item = (t_symobject *)symobject_new(x->attr_name);
	item->flags = 1;
	linklist_append(x->menu_items, item);
	item = (t_symobject *)symobject_new(gensym("-"));
	linklist_append(x->menu_items, item);
	item = (t_symobject *)symobject_new(gensym("Refresh Display of This Parameter"));
	linklist_append(x->menu_items, item);
	item = (t_symobject *)symobject_new(gensym("Set Parameter to Default Value"));
	linklist_append(x->menu_items, item);
	item = (t_symobject *)symobject_new(gensym("Edit Parameter Attributes"));
	linklist_append(x->menu_items, item);
}


void* paramui_oksize(t_paramui *x, t_rect *rect)
{
	t_object 	*textfield = NULL;
		
	// We do textfield configuration here because the margins are dependent upon the dimensions
	// textfield is used for displaying the parameter name
	textfield = jbox_get_textfield((t_object*) x); 
	textfield_set_noactivate(textfield, 1);
	textfield_set_readonly(textfield, 1);
	textfield_set_editonclick(textfield, 0);
	textfield_set_wordwrap(textfield, 0);
	textfield_set_useellipsis(textfield, 1); 
	textfield_set_textcolor(textfield, &s_light_gray);
	textfield_set_textmargins(textfield, 18.0, 2.0, rect->width - 80.0, 2.0);
	
	return (void *)1;
}

