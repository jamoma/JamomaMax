/** 
 * \file jcom.paramui.h
 * External for Jamoma: provide standard user interface component for parameters
 * By Tim Place, Copyright © 2007
 * 
 * License: This code is licensed under the terms of the "New BSD License"
 * http://creativecommons.org/licenses/BSD/
 */

#ifdef WIN_VERSION
 #pragma warning(disable:4083) //warning C4083: expected 'newline'; found identifier 's'
#endif // WIN_VERSION

#include "ext.h"
#include "ext_obex.h"
#include "ext_user.h"
#include "ext_common.h"
#include "jpatcher_api.h"			// jpatcher_api.h must come before z_dsp.h (in Jamoma.h)
#include "jgraphics.h"
#include "Jamoma.h"
#include "ext_symobject.h"

#define LISTSIZE 512	// TODO: Discuss longer list support for Max 5

// members
typedef struct _paramui{
	t_jbox				box;
	t_object			*obj_parameter;			///< embedded jcom.parameter object
	void				*outlet;				// outlet -- used for sending preview to jit.pwindow

	t_jpopupmenu		*menu;					// menu
	void				*menu_qelem;			// ...
	long				menu_selection;			// ...
	t_linklist			*menu_items;			// ...

	t_rect				rect_inspector;
	
	t_symbol			*attr_name;				///< parameter name
	t_symbol			*attr_label;			///< optional label to display instead of the parameter name
	t_symbol			*attr_type;				///< parameter type -- used to determine what kind of value editor we present
	t_atom				attr_default[LISTSIZE];
	long				attr_defaultSize;
	t_symbol			*attr_rampDrive;
	t_symbol			*attr_rampFunction;
	long				attr_uiFreeze;
	float				attr_stepsize;
	long				attr_priority;
	float				attr_range[2];
	long				attr_repetitions;
	t_symbol			*attr_clipmode;
	t_symbol			*attr_description;
	t_symbol			*attr_dataspace;
	t_symbol			*attr_unitActive;
	
	t_jtextlayout		*layout_value;			///< used to display the parameter value
	t_jtextlayout		*layout_unit;			///< used to display the current unit for the parameter's dataspace
} t_paramui;


// prototypes: general
t_paramui*	paramui_new(t_symbol *s, long argc, t_atom *argv);
void 		paramui_free(t_paramui *x);
t_max_err	paramui_notify(t_paramui *x, t_symbol *s, t_symbol *msg, void *sender, void *data);
// prototypes: drawing/ui
void 		paramui_paint(t_paramui *x, t_object *view);
void 		paramui_mousedown(t_paramui *x, t_object *patcherview, t_pt pt, long modifiers);
void		paramui_mousedragdelta(t_paramui *x, t_object *patcherview, t_pt pt, long modifiers);
void		paramui_mouseup(t_paramui *x, t_object *patcherview);
// prototypes: menus
void		paramui_menu_do(t_paramui *x, t_object *patcherview, t_pt px, long modifiers);
void 		paramui_menu_qfn(t_paramui *x);
void 		paramui_menu_build(t_paramui *x);
void		paramui_refmenu_do(t_paramui *x, t_object *patcherview, t_pt px, long modifiers);
void 		paramui_refmenu_qfn(t_paramui *x);
void 		paramui_refmenu_build(t_paramui *x);
void*		paramui_oksize(t_paramui *x, t_rect *rect);
// prototypes: attr accessors
t_max_err	paramui_getName(t_paramui *x, void *attr, long *argc, t_atom **argv);
t_max_err	paramui_setName(t_paramui *x, void *attr, long argc, t_atom *argv);
t_max_err	paramui_getType(t_paramui *x, void *attr, long *argc, t_atom **argv);
t_max_err	paramui_setType(t_paramui *x, void *attr, long argc, t_atom *argv);
t_max_err	paramui_getDefault(t_paramui *x, void *attr, long *argc, t_atom **argv);
t_max_err	paramui_setDefault(t_paramui *x, void *attr, long argc, t_atom *argv);
t_max_err	paramui_getRampDrive(t_paramui *x, void *attr, long *argc, t_atom **argv);
t_max_err	paramui_setRampDrive(t_paramui *x, void *attr, long argc, t_atom *argv);
t_max_err	paramui_getRampFunction(t_paramui *x, void *attr, long *argc, t_atom **argv);
t_max_err	paramui_setRampFunction(t_paramui *x, void *attr, long argc, t_atom *argv);
t_max_err	paramui_getUIFreeze(t_paramui *x, void *attr, long *argc, t_atom **argv);
t_max_err	paramui_setUIFreeze(t_paramui *x, void *attr, long argc, t_atom *argv);
t_max_err	paramui_getStepsize(t_paramui *x, void *attr, long *argc, t_atom **argv);
t_max_err	paramui_setStepsize(t_paramui *x, void *attr, long argc, t_atom *argv);
t_max_err	paramui_getPriority(t_paramui *x, void *attr, long *argc, t_atom **argv);
t_max_err	paramui_setPriority(t_paramui *x, void *attr, long argc, t_atom *argv);
t_max_err	paramui_getRange(t_paramui *x, void *attr, long *argc, t_atom **argv);
t_max_err	paramui_setRange(t_paramui *x, void *attr, long argc, t_atom *argv);
t_max_err	paramui_getRepetitions(t_paramui *x, void *attr, long *argc, t_atom **argv);
t_max_err	paramui_setRepetitions(t_paramui *x, void *attr, long argc, t_atom *argv);
t_max_err	paramui_getClipmode(t_paramui *x, void *attr, long *argc, t_atom **argv);
t_max_err	paramui_setClipmode(t_paramui *x, void *attr, long argc, t_atom *argv);
t_max_err	paramui_getDescription(t_paramui *x, void *attr, long *argc, t_atom **argv);
t_max_err	paramui_setDescription(t_paramui *x, void *attr, long argc, t_atom *argv);
t_max_err	paramui_getDataspace(t_paramui *x, void *attr, long *argc, t_atom **argv);
t_max_err	paramui_setDataspace(t_paramui *x, void *attr, long argc, t_atom *argv);
t_max_err	paramui_getUnitActive(t_paramui *x, void *attr, long *argc, t_atom **argv);
t_max_err	paramui_setUnitActive(t_paramui *x, void *attr, long argc, t_atom *argv);
