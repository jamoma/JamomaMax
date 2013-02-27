/** 
 * \file jcom.ui.h
 * External for Jamoma: provide standard user interface component for modules
 * By Tim Place, Copyright © 2007
 * 
 * License: This code is licensed under the terms of the "New BSD License"
 * http://creativecommons.org/licenses/BSD/
 */

#include "ext.h"
#include "ext_obex.h"
#include "ext_user.h"
#include "ext_common.h"
#include "jpatcher_api.h"			// jpatcher_api.h must come before z_dsp.h (in Jamoma.h)
#include "jgraphics.h"
#include "TTModular.h"				// Jamoma Modular API
#include "ModularForMax.h"			// Jamoma Modular for Max
#include "MaxObjectTypes.h"
#include "ext_symobject.h"

#define NO_MODEL_STRING "waiting for a model/address"

#define preview_out 0
#define panel_out 1

// those stuffes are needed for handling patchers without using the pcontrol object
#include "jpatcher_api.h"
typedef struct dll {
	t_object d_ob;
	struct dll *d_next;
	struct dll *d_prev;
	void *d_x1;
} t_dll;

typedef struct outlet {
	struct tinyobject o_ob;
	struct dll *o_dll;
} t_outlet;

typedef struct inlet {
	struct tinyobject i_ob;
	void *i_who;
	struct object *i_owner;
} t_inlet;

// members
typedef struct _ui{
	t_jbox				box;
	TTHandle			outlets;
	TTHashPtr			hash_datas;				///< hash table of TTData
	TTHashPtr			hash_viewers;			///< hash table of TTViewer
	TTHashPtr			hash_receivers;			///< hash table of TTReceiver
	TTObjectBasePtr			nmspcExplorer;			///< internal TTExplorer object to observe the entire namespace
	TTObjectBasePtr			modelExplorer;			///< internal TTExplorer object to observe the model namespace
	TTObjectBasePtr			modelMessExplorer;		///< internal TTExplorer object to observe messages
	TTObjectBasePtr			modelParamExplorer;		///< internal TTExplorer object to observe parameters
	TTObjectBasePtr			modelRetExplorer;		///< internal TTExplorer object to observe returns
	TTSubscriberPtr		uiSubscriber;			///< internal TTSubscriber object to create a /ui node
	TTCallbackPtr		previewSignal;			///< internal TTCallback to get back preview signal
	TTOutputPtr			modelOutput;			///< a pointer to TTOutput object of the binded model
	
	TTAddress	viewAddress;
	TTAddress	modelAddress;
	ObjectPtr			patcherPtr;				///< the patcher in which the external is (ignoring subpatcher)
	TTSymbol			patcherContext;			///< the patcher context in which the external is (model, view)
	TTSymbol			patcherClass;			///< the patcher class in which the external is
	TTSymbol			patcherName;
	
	TTBoolean			hover;					// is the mouse hover the jcom.ui panel ?
	TTBoolean			selection;				// is the user selecting things ?
	TTBoolean			selectAll;				// to select/unselect all jcom.remote
	t_jrgba				memo_bordercolor;		// to keep the choosen border color during selection

	t_jrgba				bgcolor;
	t_jrgba				bordercolor;
	t_jrgba				headercolor;
	t_jrgba				textcolor;
	t_jrgba				selectcolor;
	
	long				ui_freeze;				// freeze all viewers of the view (TODO)
	
	t_jpopupmenu		*menu;					// model menu
	void				*menu_qelem;			// ...
	long				menu_selection;			// ...
	t_linklist			*menu_items;			// ...
	AtomPtr				preset_order;
	AtomCount			preset_num;

	t_jpopupmenu		*refmenu;				// reference menu
	void				*refmenu_qelem;			// ...
	long				refmenu_selection;		// ...
	t_linklist			*refmenu_items;			// ...

	long				has_preset;				// is the binded model have preset features ?
	long				has_model;				// is the binded model have model features ?
	
	long				has_panel;				// is the binded model have a panel ?
	t_rect				rect_panel;
	ObjectPtr			patcher_panel;

	long				has_meters;				// is the binded model have meters ? (set number of meters, not just a toggle)
	long				is_metersdefeated;
	t_rect				rect_meters;

	long				has_mute;				// is the binded model have a mute ?
	long				is_muted;
	long				sel_mute;				// selection state of mute
	t_rect				rect_mute;

	long				has_bypass;				// is the binded model have a bypass ?
	long				is_bypassed;
	long				sel_bypass;				// selection state of bypass
	t_rect				rect_bypass;

	long				has_freeze;				// is the binded model have a freeze ?
	long				is_frozen;
	long				sel_freeze;				// selection state of freeze
	t_rect				rect_freeze;

	long				has_preview;			// is the binded model have a preview ?
	long				is_previewing;
	long				sel_preview;			// selection state of preview
	t_rect				rect_preview;

	long				has_gain;				// is the binded model have a gain ?
	float				gain;
	long				sel_gain;				// selection state of gain
	t_rect				rect_gain;
	bool				gainDragging;
	
	long				has_mix;				// is the binded model have a mix ?
	float				mix;
	long				sel_mix;				// selection state of mix
	t_rect				rect_mix;
	bool				mixDragging;
	
	t_pt				anchor;				// used for dragging the dials
	float				anchorValue;		//	...
} t_ui;


// prototypes: general
t_ui*		ui_new(t_symbol *s, long argc, t_atom *argv);
void 		ui_free(t_ui *x);
t_max_err	ui_notify(t_ui *x, t_symbol *s, t_symbol *msg, void *sender, void *data);
t_max_err	ui_address_set(t_ui *x, t_object *attr, long argc, t_atom *argv);
t_max_err	ui_address_get(t_ui *x, t_object *attr, long *argc, t_atom **argv);
void		ui_subscribe(t_ui *x, SymbolPtr address);
void		ui_build(t_ui *x);
void 		ui_bang(t_ui *x);

// prototypes: drawing/ui
void 		ui_paint(t_ui *x, t_object *view);
void 		ui_mousedown(t_ui *x, t_object *patcherview, t_pt pt, long modifiers);
void		ui_mousedragdelta(t_ui *x, t_object *patcherview, t_pt pt, long modifiers);
void		ui_mouseup(t_ui *x, t_object *patcherview);
void 		ui_mousemove(t_ui *x, t_object *patcherview, t_pt pt, long modifiers);
void 		ui_mouseleave(t_ui *x, t_object *patcherview, t_pt pt, long modifiers);
void*		ui_oksize(t_ui *x, t_rect *rect);
void		ui_preset_interface(t_ui *x);

// prototypes: menus
void		ui_menu_do(t_ui *x, t_object *patcherview, t_pt px, long modifiers);
void 		ui_menu_qfn(t_ui *x);
void 		ui_menu_build(t_ui *x);
void		ui_refmenu_do(t_ui *x, t_object *patcherview, t_pt px, long modifiers);
void 		ui_refmenu_qfn(t_ui *x);
void 		ui_refmenu_build(t_ui *x);

// prototypes: internal TTData and TTViewer
void		ui_data_create(t_ui *obj, TTObjectBasePtr *returnedData, SymbolPtr aCallbackMethod, TTSymbol service, TTSymbol name, TTBoolean deferlow = NO);
void		ui_data_create_all(t_ui* obj);
void		ui_data_destroy(t_ui *obj, TTSymbol name);
void		ui_data_destroy_all(t_ui* obj);
void		ui_data_send(t_ui *obj, TTSymbol name, TTValue v);
void		ui_data_interface(t_ui *x, TTSymbol name);

void		ui_receiver_create(t_ui *obj, TTObjectBasePtr *returnedReceiver, SymbolPtr aCallbackMethod, TTSymbol name, TTAddress address, TTBoolean deferlow = NO);
void		ui_receiver_destroy(t_ui *obj, TTSymbol name);
void		ui_receiver_destroy_all(t_ui *obj);

void		ui_viewer_create(t_ui *obj, TTObjectBasePtr *returnedViewer, SymbolPtr aCallbackMethod, TTSymbol name, TTAddress address, TTBoolean subscribe, TTBoolean deferlow = NO);
void		ui_viewer_destroy(t_ui *obj, TTSymbol name);
void		ui_viewer_destroy_all(t_ui *obj);
void		ui_viewer_send(t_ui *obj, TTSymbol name, TTValue v);
void		ui_viewer_highlight(t_ui *obj, TTSymbol name, TTBoolean s);
void		ui_viewer_freeze(t_ui *obj, TTSymbol name, TTBoolean f);

void		ui_explorer_create(ObjectPtr x, TTObjectBasePtr *returnedExplorer, SymbolPtr method);
void		ui_modelExplorer_callback(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);
void		ui_modelMessExplorer_callback(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);
void		ui_modelParamExplorer_callback(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);
void		ui_modelRetExplorer_callback(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);

void		ui_view_panel_attach(TTPtr self, t_symbol *msg, long argc, t_atom *argv);
void		ui_view_panel_return(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);

void		ui_return_color_contentBackground(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);
void		ui_return_color_toolbarBackground(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);
void		ui_return_color_toolbarText(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);
void		ui_return_color_border(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);
void		ui_return_ui_size(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);
void		ui_return_ui_freeze(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);

void		ui_return_model_address(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);
void		ui_return_model_init(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);

void		ui_return_metersdefeated(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);
void		ui_return_mute(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);
void		ui_return_bypass(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);
void		ui_return_mix(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);
void		ui_return_gain(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);
void		ui_return_freeze(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);
void		ui_return_preview(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);

void		ui_return_signal(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);

// prototype: ui handling for preset features
void		ui_preset_store_next(t_ui *x);
void		ui_preset_doread(t_ui *x);
void		ui_preset_dowrite(t_ui *x);
void		ui_return_preset_order(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);
