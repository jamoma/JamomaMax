/** 
	\file jcom.meter~.cpp
	External for Jamoma: signal level meter
	By Tim Place, Copyright � 2005
	Modifications for Compiling on Windows by Thomas Grill, 2005
	Re-write for Max 5 by Tim Place, 2008
	
	License: This code is licensed under the terms of the GNU LGPL
	http://www.gnu.org/licenses/lgpl.html 
  */

#include "ext.h"
#include "ext_obex.h"
#include "ext_user.h"
#include "ext_common.h"
#include "jpatcher_api.h"	// jpatcher_api.h must come before z_dsp.h (in Jamoma.h)
#include "jgraphics.h"
#include "Jamoma.h"
#include "TTDSP.h"


// Constants
const double kPollIntervalDefault = 150;
const double kPollIntervalMinimum = 50;
const double kPollIntervalMaximum = 5000;
const double kHeightDefault = 13;
const double kHeightMinimum = 1;
const double kHeightMaximum = 400;
const double kWidthDefault = 80;
const double kWidthMinimum = 1;
const double kWidthMaximum = 1200;
const double kOrientationVertical = 1;
const double kOrientationHorizontal = 0;
const double kMinimumChangeForRedraw = 0.00001;


// Enumerations
enum {
	ORIENTATION_AUTOMATIC = 0,
	ORIENTATION_HORIZONTAL = 1,
	ORIENTATION_VERTICAL = 2
};


// Instance definition
typedef struct _meter{
	t_pxjbox	obj;
	t_symbol*	attrMode;			// TODO: options are 'fast' and 'pretty' -- fast mode doesn't scale properly when zooming a patcher, etc. but it's faster
	long		attrDefeat;			// disable the meter
	char		attrNumChannels;	// TODO: number of audio channels to display
	float		attrInterval;		// TODO: make the polling interval dynamic
	t_jrgba		attrBgColor;		///< Background color
	t_jrgba		attrBorderColor;
	long		attrOrientation;	// the orientation mode
	
	long		effectOrientation;	// the effective orientation of the object (0: vertical, 1: horizontal)
	TTFloat32	envelope;			// the result of the amplitude analysis [0.0, 1.0]
	TTFloat64	newEnvelope;
	TTFloat32	peak;				// the loudest sample since the last reset
	t_jsurface*	gradientSurface;	///< precalculated and drawn gradient for the size of this instance
	t_rect		gradientRect;
	void*		clock;	
	void		*outlet;			///< Outlet
} t_meter;


// prototypes
void*		meter_new(t_symbol *s, long argc, t_atom *argv);
void		meter_free(t_meter *x);
t_max_err	meter_notify(t_meter *x, t_symbol *s, t_symbol *msg, void *sender, void *data);
void		meter_assist(t_meter *x, void *b, long m, long a, char *s);
void		meter_bang(t_meter *x);
void		meter_int(t_meter *x, long value);
void		meter_float(t_meter *x, double value);
void		meter_set(t_meter *x, double value);
void		meter_clock(t_meter *x);
t_int*		meter_perform(t_int *w);
void		meter_perform64(t_meter *x, t_object *dsp64, double **ins, long numins, double **outs, long numouts, long sampleframes, long flags, void *userparam);
void		meter_dsp(t_meter *x, t_signal **sp, short *count);
void		meter_dsp64(t_meter *x, t_object *dsp64, short *count, double samplerate, long maxvectorsize, long flags);
void		meter_paint(t_meter *x, t_object *view);
void		meter_dopaint_horizontal(t_meter *x, t_object *view);
void		meter_dopaint_vertical(t_meter *x, t_object *view);
void*		meter_oksize(t_meter *x, t_rect *newrect);
void		meterEffectOrientation(t_meter* x);
void		meterCacheSurface(t_meter* x);

// globals
static t_class*	s_meter_class;


// implementation
#if 0
#pragma mark -
#pragma mark Class Definition
#endif 0

int JAMOMA_EXPORT_MAXOBJ main(void)
{
	t_class *c = class_new("jcom.meter~", (method)meter_new, (method)meter_free, sizeof(t_meter), (method)NULL, A_GIMME, 0L);
	
	c->c_flags |= CLASS_FLAG_NEWDICTIONARY; // use dictionary constructor
	jbox_initclass(c, 0);
	class_dspinitjbox(c);

	jamoma_init();
	common_symbols_init();
	
	class_addmethod(c, (method)meter_bang,		"bang",			0);
	class_addmethod(c, (method)meter_int,		"int",			A_LONG, 0);
	class_addmethod(c, (method)meter_float,		"float",		A_FLOAT, 0);
	class_addmethod(c, (method)meter_set,    	"set",			A_FLOAT, 0);
	class_addmethod(c, (method)meter_dsp,		"dsp",			A_CANT, 0);
	class_addmethod(c, (method)meter_dsp64,		"dsp64",		A_CANT, 0);
	class_addmethod(c, (method)meter_paint,		"paint",		A_CANT, 0);
	class_addmethod(c, (method)meter_oksize,	"oksize",		A_CANT, 0);
	class_addmethod(c, (method)meter_bang,		"mousedown",	A_CANT, 0);
	class_addmethod(c, (method)meter_notify,	"notify",		A_CANT, 0);
	class_addmethod(c, (method)meter_assist,	"assist",		A_CANT, 0);
	
//	CLASS_ATTR_FLOAT(c,					"interval",			0,	t_meter, attrInterval);
//	CLASS_ATTR_FILTER_CLIP(c,			"interval",			kPollIntervalMinimum, kPollIntervalMaximum);
//	CLASS_ATTR_DEFAULT_SAVE(c,			"interval",			0,	"150");
//	CLASS_ATTR_LABEL(c,					"interval",			0,	"Refresh Interval in Milliseconds");
		
//	CLASS_ATTR_RGBA(c,					"bordercolor",		0,	t_meter, attrBorderColor);
//	CLASS_ATTR_STYLE_LABEL(c,			"bordercolor",		0,	"rgba",	"Border Color");
//	CLASS_ATTR_DEFAULT_SAVE_PAINT(c,	"bordercolor",		0,	"0.2 0.2 0.2 1.");

	CLASS_ATTR_LONG(c,						"orientation",	0, t_meter, attrOrientation);
	CLASS_ATTR_LABEL(c,						"orientation",	0, "Orientation");
	CLASS_ATTR_CATEGORY(c,					"orientation",	0,"Appearance");
	CLASS_ATTR_ENUMINDEX(c,					"orientation",	0, "Automatic Horizontal Vertical");
	CLASS_ATTR_DEFAULT_SAVE_PAINT(c,		"orientation",	0,"0");
	
	CLASS_ATTR_RGBA(c,						"bgcolor",		0,	t_meter,	attrBgColor);
	CLASS_ATTR_DEFAULTNAME_SAVE_PAINT(c,	"bgcolor",		0,	"0.1 0.1 0.1 1.0");
	CLASS_ATTR_STYLE(c,						"bgcolor",		0,	"rgba");
	CLASS_ATTR_LABEL(c,						"bgcolor",		0,	"Background Color");
	
	CLASS_ATTR_LONG(c,						"defeat",	0, t_meter, attrDefeat);
	CLASS_ATTR_LABEL(c,						"defeat",	0, "defeat");	
	CLASS_ATTR_DEFAULT(c,					"defeat",	0,	"0");
	CLASS_ATTR_SAVE(c,						"defeat",	0);
	CLASS_ATTR_STYLE(c,						"defeat",	0,	"onoff");	
	CLASS_ATTR_CATEGORY(c,					"defeat",	0,"Behavior");
	
	CLASS_ATTR_DEFAULT(c,				"patching_rect",	0,	"0. 0. 100. 12.");
	CLASS_ATTR_MIN(c,					"patching_size",	0,	"1. 1.");

//	CLASS_ATTR_DEFAULT_SAVE_PAINT(c,	"bgcolor",			0,	"0.1 0.1 0.1 1.0");
	
	class_register(CLASS_BOX, c);
	s_meter_class = c;		
	return 0;
}




#if 0
#pragma mark -
#pragma mark Life Cycle
#endif 0

void *meter_new(t_symbol *s, long argc, t_atom *argv)
{
	t_meter*	x;
	t_jbox*		box;
	long		flags;
	
	t_dictionary *d=NULL;
	
	if (!(d=object_dictionaryarg(argc,argv)))
		return NULL;
	
	x = (t_meter *)object_alloc(s_meter_class);
	
	flags = 0 
		| JBOX_DRAWFIRSTIN 
		| JBOX_NODRAWBOX
		| JBOX_DRAWINLAST
	//	| JBOX_TRANSPARENT	
	//	| JBOX_NOGROW
	//	| JBOX_GROWY
		| JBOX_GROWBOTH
	//	| JBOX_HILITE
	//	| JBOX_BACKGROUND
	//	| JBOX_DRAWBACKGROUND
	//	| JBOX_NOFLOATINSPECTOR
	//	| JBOX_TEXTFIELD
	//	| JBOX_MOUSEDRAGDELTA
	//	| JBOX_TEXTFIELD
	;
	
	box = (t_jbox *)x;
	jbox_new(box, flags, argc, argv);
	x->obj.z_box.b_firstin = (t_object*)x;
	dsp_setupjbox((t_pxjbox *)x, 1);
	x->clock = clock_new(x, (method)meter_clock);
	meterEffectOrientation(x);
	x->outlet = outlet_new(x, 0); //adding a outlet 		
	attr_dictionary_process(x,d);
	jbox_ready((t_jbox *)x);
	return x;
}


void meter_free(t_meter *x)
{	
	notify_free((t_object *)x);
	dsp_freejbox((t_pxjbox *)x);
	jgraphics_surface_destroy(x->gradientSurface);
	object_free((t_object *)x->clock);
	jbox_free((t_jbox *)x);
}


#if 0
#pragma mark -
#pragma mark Methods
#endif 0

t_max_err meter_notify(t_meter *x, t_symbol *s, t_symbol *msg, void *sender, void *data)
{
	t_symbol*	name;
	
	if (msg == _sym_attr_modified) {
		
		name = (t_symbol *)object_method((t_object *)data, _sym_getname);

		if (name == _sym_bgcolor)
			jbox_redraw((t_jbox*)x);
		if (name == _sym_patching_rect || name == gensym("orientation"))
			meterEffectOrientation(x);
		if (name == gensym("defeat")) {
			if (sys_getdspstate())		{							// if dsp is on & defeat is off then we schedule another tick
				if (x->attrDefeat == 0)
					clock_delay(x->clock, kPollIntervalDefault);
										}
									 }
	}
	return jbox_notify((t_jbox*)x, s, msg, sender, data);
}


// Method for Assistance Messages
void meter_assist(t_meter *x, void *b, long msg, long arg, char *dst)
{
	if (msg==1) 						// Inlet
		strcpy(dst, "Input");
	else if (msg==2) { 				// Outlets
		switch(arg) {
			case 0: strcpy(dst, "Output"); break;
				//case 1: strcpy(dst, "Attribute Stuff"); break;
 		}
 	}		
}


// Method: bang - clear the peak hold and redraw
void meter_bang(t_meter *x)
{
	x->peak = 0;
	jbox_redraw((t_jbox*)x);
}


void meter_int(t_meter *x, long value)
{
	meter_float(x,(double)value);
}

void meter_float(t_meter *x, double value)
{
	x->envelope = value;
	outlet_float(x->outlet, x->envelope);
	jbox_redraw((t_jbox*)x);
}


// Method: set - update and redraw, but no output
void meter_set(t_meter *x, double value)
{   
	x->envelope = value;
	jbox_redraw((t_jbox*)x);
	
}



void meter_clock(t_meter *x)
{	
	double delta = fabs(x->newEnvelope - x->envelope);
	x->envelope = x->newEnvelope;
	x->newEnvelope = 0;
	// Only re-draw if there was a change of some significance
	if (delta > kMinimumChangeForRedraw) 	
		jbox_redraw((t_jbox *)x);
	   	
    outlet_float(x->outlet, x->envelope); 
	if (sys_getdspstate()) {							// if dsp is on then we schedule another tick
		if (x->attrDefeat == 0)
			clock_delay(x->clock, kPollIntervalDefault);
	}
}


#if 0
#pragma mark -
#pragma mark Signal Processing
#endif 0

t_int *meter_perform(t_int *w)
{
	t_meter		*x = (t_meter *)(w[1]);
	t_float		*input = (float *)(w[2]);
	long 		n = (long)(w[3]);
	float 		currentvalue;
	
	if (x->obj.z_disabled)
		goto out;

	while (n--) {
		currentvalue = ((*input) < 0)?-(*input):*input; // get the current sample's absolute value
		if (currentvalue > x->newEnvelope) 				// if it's a new peak amplitude...
			x->newEnvelope = currentvalue;
		input++; 										// increment pointer in the vector
	}
out:
	return w+4;
}



void meter_perform64(t_meter *x, t_object *dsp64, double **ins, long numins, double **outs, long numouts, long sampleframes, long flags, void *userparam)
{
	TTFloat64 *in = ins[0];		// we get audio for each inlet of the object from the **ins argument
	int n = sampleframes;
	double currentvalue;
	
	while (n--) {
		currentvalue = ((*in) < 0)?-(*in):*in; // get the current sample's absolute value
		if (currentvalue > x->newEnvelope) 				// if it's a new peak amplitude...
			x->newEnvelope = currentvalue;
		in++; 										// increment pointer in the vector
	}
}


void meter_dsp(t_meter *x, t_signal **sp, short *count)
{
	if (count[0]) {
		dsp_add(meter_perform, 3, x, sp[0]->s_vec, sp[0]->s_n);
		clock_delay(x->clock, kPollIntervalDefault); 			// start the clock
		x->peak = 0;
	}
}


void meter_dsp64(t_meter *x, t_object *dsp64, short *count, double samplerate, long maxvectorsize, long flags)
{
	if (count[0]) {
		object_method(dsp64, gensym("dsp_add64"), x, meter_perform64, 0, NULL);
		//dsp_add64(dsp64, (t_object*)x, (t_perfroutine64)meter_perform64, 0, NULL);
		clock_delay(x->clock, kPollIntervalDefault); 			// start the clock
		x->peak = 0;
	}	
}


#if 0
#pragma mark -
#pragma mark User Interface
#endif 0

void *meter_oksize(t_meter *x, t_rect *newrect)
{
	TTLimit(newrect->width, kWidthMinimum, kWidthMaximum);
	TTLimit(newrect->height, kHeightMinimum, kHeightMaximum);
	meterCacheSurface(x);	// Now draw the gradient and cache it in our surface
	return (void*)1;
}

// To set the effective orientation
void meterEffectOrientation(t_meter* x) {

	t_jbox*	box = (t_jbox*)x;
	long lastEffectOrientation = x->effectOrientation;
	
	switch(x->attrOrientation) {
		case 0 :	// automatic mode
			x->effectOrientation = box->b_patching_rect.width > box->b_patching_rect.height;
			break;

		case 1 :	// horizontal mode
			x->effectOrientation = 1;
			break;

		case 2 :	// vertical mode
			x->effectOrientation = 0;
			break;

		default :
			break;
	}
	if (x->effectOrientation != lastEffectOrientation)
		jbox_redraw((t_jbox*)x);
}


void meterCacheSurface(t_meter* x)
{
	t_jrgba	color;
	t_jbox*	box = (t_jbox*)x;
	int		i, j;
	
	x->gradientRect.x = 0;
	x->gradientRect.y = 0;
	// horizontal mode
	if (x->effectOrientation) {
		x->gradientRect.width = box->b_patching_rect.width * 0.96;
		x->gradientRect.height = box->b_patching_rect.height;
	}
	// vertical mode
	else {
		x->gradientRect.width = box->b_patching_rect.width;
		x->gradientRect.height = box->b_patching_rect.height * 0.96;
	}

	if (x->gradientSurface)
		jgraphics_surface_destroy(x->gradientSurface);
	
	x->gradientSurface = jgraphics_image_surface_create(JGRAPHICS_FORMAT_ARGB32, x->gradientRect.width, x->gradientRect.height);
	
	color.red = 0.0;
	color.green = 1.0;
	color.blue = 0.0;
	color.alpha = 1.0;

	// horizontal mode
	if (x->effectOrientation) {
		for (i=0; i < x->gradientRect.width; i++) {
			color.red = i / x->gradientRect.width;	
			for (j=0; j < x->gradientRect.height; j++)
				jgraphics_image_surface_set_pixel(x->gradientSurface, i, j, color);
		}
	}else {
		for (j=0; j < x->gradientRect.height; j++) {
			color.red = 1. - (j / x->gradientRect.height);	
			for (i=0; i < x->gradientRect.width; i++)
				jgraphics_image_surface_set_pixel(x->gradientSurface, i, j, color);
		}
	}
}


void meter_paint(t_meter *x, t_object *view)
{
	if (x->effectOrientation)
		meter_dopaint_horizontal(x,view);
	else
		meter_dopaint_vertical(x,view);
}


void meter_dopaint_horizontal(t_meter *x, t_object *view) {

	t_rect			rect;
	t_jgraphics*	g;
	double			level = TTClip(x->envelope, 0.0f, 1.0f);
	double			position;
	double			peakPosition;
	t_jrgba			c;
	
	if (level > 0.0)
		level = pow(level, kTTGainMidiPowerInv);	// this is taken from the midi conversion in the Gain Dataspace
	
	g = (t_jgraphics*) patcherview_get_jgraphics(view);		// obtain graphics context
	jbox_get_rect_for_view((t_object *)x, view, &rect);		// this is the box rectangle -- but we draw relative to 0 0, and thus only care about width & height
	rect.x = 0;
	rect.y = 0;
	position = rect.width * level * 0.96;
	peakPosition = rect.width * x->peak * 0.96;	
		
	if (level > x->peak)
		x->peak = level;
						
	// TODO: Can we export this from the kernel???	
	//	jgraphics_image_surface_draw_fast(g, x->gradientSurface);
	jgraphics_image_surface_draw(g, x->gradientSurface, x->gradientRect, rect);
    
	jgraphics_set_source_jrgba(g, &x->attrBgColor);
	jgraphics_rectangle_fill_fast(g, position, 0, rect.width-position, rect.height);
    	
	if (x->envelope > 1.0 || x->peak > 1.0) {
		c.red = 1.0;
		c.green = c.blue = 0.0;
		c.alpha = 1.0;
		jgraphics_set_source_jrgba(g, &c);
		jgraphics_rectangle_fill_fast(g, rect.width - (rect.width * .04), 0, rect.width * .04, rect.height);
	}
	else {
		c.red = peakPosition / x->gradientRect.width;
		c.green = 1.0;
		c.blue = 0.0;
		c.alpha = 1.0;
		jgraphics_set_source_jrgba(g, &c);
		// TODO: Can we export this from the kernel???	
		// jgraphics_line_draw_fast(g, rect.width * level * 0.96, 0, rect.width * level * 0.96, rect.height, 1.0);
		jgraphics_move_to(g, peakPosition, 0.0);
		jgraphics_line_to(g, peakPosition, rect.height);
		jgraphics_set_line_width(g, 1.0);
		jgraphics_stroke(g);
	}
}

void meter_dopaint_vertical(t_meter *x, t_object *view) {

	t_rect			rect;
	t_jgraphics*	g;
	double			level = TTClip(x->envelope, 0.0f, 1.0f);
	double			position;
	double			peakPosition;
	t_jrgba			c;
	
	if (level > 0.0)
		level = pow(level, kTTGainMidiPowerInv);	// this is taken from the midi conversion in the Gain Dataspace
	
	g = (t_jgraphics*) patcherview_get_jgraphics(view);		// obtain graphics context
	jbox_get_rect_for_view((t_object *)x, view, &rect);		// this is the box rectangle -- but we draw relative to 0 0, and thus only care about width & height
	rect.x = 0;
	rect.y = 0;
	position = rect.height * level * 0.96;
	peakPosition = rect.height * x->peak * 0.96;

	if (level > x->peak)
		x->peak = level;
						
	// TODO: Can we export this from the kernel???	
	//	jgraphics_image_surface_draw_fast(g, x->gradientSurface);
	jgraphics_image_surface_draw(g, x->gradientSurface, x->gradientRect, rect);
	
	jgraphics_set_source_jrgba(g, &x->attrBgColor);
	jgraphics_rectangle_fill_fast(g, 0, 0, rect.width, rect.height-position);

	if (x->envelope > 1.0 || x->peak > 1.0) {
		c.red = 1.0;
		c.green = c.blue = 0.0;
		c.alpha = 1.0;
		jgraphics_set_source_jrgba(g, &c);
		jgraphics_rectangle_fill_fast(g, 0, 0, rect.width, rect.height * .04);
	}
	else {
		c.red = peakPosition / x->gradientRect.height;
		c.green = 1.0;
		c.blue = 0.0;
		c.alpha = 1.0;
		jgraphics_set_source_jrgba(g, &c);
		// TODO: Can we export this from the kernel???	
		// jgraphics_line_draw_fast(g, rect.width * level * 0.96, 0, rect.width * level * 0.96, rect.height, 1.0);
		jgraphics_move_to(g, 0.0, rect.height - peakPosition);
		jgraphics_line_to(g, rect.width, rect.height - peakPosition);
		jgraphics_set_line_width(g, 1.0);
		jgraphics_stroke(g);
	}
}

