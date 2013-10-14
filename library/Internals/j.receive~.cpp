/** 
 * \file j.receive~.cpp
 * External for Jamoma: Remote audio signal communication
 * By Tim Place, Copyright © 2007
 * 
 * License: This code is licensed under the terms of the "New BSD License"
 * http://creativecommons.org/licenses/BSD/
 */

#include "Jamoma.h"


/** Object receiving remote audio signals within a module.
 */
typedef struct _audioreceive{	
	t_pxobject		obj;
	void			*dumpout;						///< dumpout outlet

	t_symbol		*attr_target;					///< name of the module we are sending to
	t_object		*obj_target;					///< the hub of the module we are sending to
	t_object		*obj_direct_target;				///< the j.in~ object in the module we are sending to
	
	long			num_outputs;					///< spec'd as an argument
	float			*audio_out[MAX_NUM_CHANNELS];	///< pointers to the audio vectors
	void			*outlets[MAX_NUM_CHANNELS];
	int				vs;								///< cached vector-size for audio
} t_audioreceive;


// Prototypes

/** Object instantiation.
 @param s			Pointer to symbol bassed as message argument to the object.
 @param argc		The number of arguments passed to the object.
 @param argv		Pointer to arguments as an array of atoms.
 @return			Pointer to the newly created object.
 */
void	*audioreceive_new(t_symbol *s, long argc, t_atom *argv);


/** This method is called when the object is free (deleted).
 @param x			Pointer to the object.
 */
void	audioreceive_free(t_audioreceive *x);


/** Method for displaying assist strings for inlets and outlets.
 @param x			Pointer to this object.
 @param b
 @param msg
 @param argc
 @param argv
 */
void	audioreceive_assist(t_audioreceive *x, void *b, long msg, long arg, char *dst);


/** When banged, fill a menu with potential targets.
 @param x			Pointer to this class.
 */
void	audioreceive_bang(t_audioreceive *x);


/** Audio perform method for the object.
 */
t_int*	audioreceive_perform(t_int *w);


/** The DSP method for the object, called when compiling the audio chain.
 @param x
 @param sp
 @param count
 */
void	audioreceive_dsp(t_audioreceive *x, t_signal **sp, short *count);


/** Set the name of the module we are part of as an attribute.
 */
t_max_err	audioreceive_attr_settarget(t_audioreceive *x, void *attr, long argc, t_atom *argv);


// Globals
static t_class		*s_audioreceive_class;		///< Required: Global pointer for our class


/************************************************************************************/

void receive_tilde_initclass(void)
{
	long attrflags = 0;
	t_class *c;
	t_object *attr;

	// Define our class
	c = class_new("j.receive~", (method)audioreceive_new, (method)audioreceive_free, 
		sizeof(t_audioreceive), (method)NULL, A_GIMME, 0);

	// Make methods accessible for our class:
	class_addmethod(c, (method)audioreceive_bang,		"bang",			0);
	class_addmethod(c, (method)audioreceive_dsp,		"dsp", 			A_CANT, 0);
    class_addmethod(c, (method)audioreceive_assist,		"assist", 		A_CANT, 0);
    class_addmethod(c, (method)object_obex_dumpout, 	"dumpout", 		A_CANT,0);  
	
	// ATTRIBUTE: name
	attr = attr_offset_new("target", _sym_symbol, attrflags,
		(method)0, (method)audioreceive_attr_settarget, calcoffset(t_audioreceive, attr_target));
	class_addattr(c, attr);


	// Setup our class to work with MSP
	class_dspinit(c);
	
	// Finalize our class
	class_register(CLASS_BOX, c);
	s_audioreceive_class = c;
}


/************************************************************************************/
// Object Life

// Create
void *audioreceive_new(t_symbol *s, long argc, t_atom *argv)
{
	long			attrstart = attr_args_offset(argc, argv);		// support normal arguments
	t_audioreceive 	*x = (t_audioreceive *)object_alloc(s_audioreceive_class);
	short			i;
	
	if (x) {
		x->dumpout = outlet_new(x, NULL);
		object_obex_store(x, _sym_dumpout, (t_object *)x->dumpout);

		x->attr_target = _sym_nothing;
		x->num_outputs = 2;		// TODO: make this dynamic from args

		for (i=0; i<attrstart; i++) {
			if (argv[i].a_type == A_LONG)
				x->num_outputs = atom_getlong(argv+i);
			else if (argv[i].a_type == A_SYM)
				x->attr_target = atom_getsym(argv+i);
		}
		
		dsp_setup((t_pxobject *)x, 1);
		for (i=0; i < x->num_outputs; i++)
			x->outlets[i] = outlet_new(x, "signal");
		
		x->obj.z_misc = Z_NO_INPLACE;
		attr_args_process(x, argc, argv);					// handle attribute args
	}
	return x;
}


void audioreceive_free(t_audioreceive *x)
{
	dsp_free((t_pxobject *)x);
}


/************************************************************************************/
// Methods bound to input/inlets

// Method for Assistance Messages
void audioreceive_assist(t_audioreceive *x, void *b, long msg, long arg, char *dst)
{
	if (msg==1) 			// Inlets
		strcpy(dst, "input to send to a named module");
	else if (msg==2)		// Outlets
		strcpy(dst, "dumpout");
}


// fill a menu with potential targets
void audioreceive_bang(t_audioreceive *x)
{
	t_atom		a[2];
	t_symbol	**moduleNames = NULL;
	long		numModules = 0;
	long		i;

	jamoma_get_all_module_names(&numModules, &moduleNames);

	atom_setsym(a+0, SymbolGen("clear"));
	outlet_anything(x->dumpout, SymbolGen("menu"), 1, a);
	
	atom_setsym(a+0, SymbolGen("append"));
	for (i=0; i<numModules; i++) {
		atom_setsym(a+1, moduleNames[i]);
		outlet_anything(x->dumpout, SymbolGen("menu"), 2, a);
	}
	if (moduleNames)
		sysmem_freeptr(moduleNames);
}



t_int* audioreceive_perform(t_int *w)
{
	t_audioreceive	*x = (t_audioreceive*)(w[1]);
	int				channel;
	int				n;
	float			*vector = NULL;
	float			*out;
	
	//object_method(x->obj_direct_target, SymbolGen("remoteaudio"), x->audio_out, (long)(w[2]));
	for (channel = 0; channel < x->num_outputs; channel++) {
		n = x->vs;
		object_method(x->obj_direct_target, SymbolGen("getAudioForChannel"), channel, &vector);
		out = x->audio_out[channel];
		if (vector) {
			while (n--)
				*out++ = *vector++;
		}
	}
	
	return(w+3);
}


void audioreceive_dsp(t_audioreceive *x, t_signal **sp, short *count)
{
	long		numOutputs = x->num_outputs;
	short		i, j;
	t_object	*hub;
	
	if (x->attr_target && x->attr_target != _sym_nothing) {
		hub = jamoma_get_hub_for_module_named(x->attr_target);
		if (hub != x->obj_target) {
			if (hub) {
				x->obj_target = hub;
				// we could attach to the hub here to listen for free notifications
				// but freeing it will restart the dsp anyway, so I don't think there is any need [tap]
				x->obj_direct_target = (t_object*)object_method(hub, SymbolGen("getobj_audioout"));
			}
		}
		if (x->obj_target) {
			for (i=0, j=0; i<numOutputs; i++) {
				if (count[i+1])		// the +1 is to account for the inlet in this object
					j=i;
				x->audio_out[i] = (t_float*)sp[i+1]->s_vec;
			}
			numOutputs = j+1;
			
			x->vs = sp[0]->s_n;
			dsp_add(audioreceive_perform, 2, x, numOutputs);
		}
	}
}


/************************************************************************************/

t_max_err audioreceive_attr_settarget(t_audioreceive *x, void *attr, long argc, t_atom *argv)
{
	t_object	*hub;

	x->attr_target = atom_getsym(argv);
	hub = jamoma_get_hub_for_module_named(x->attr_target);
	if (hub) {
		x->obj_target = hub;
		x->obj_direct_target = (t_object*)object_method(hub, SymbolGen("getobj_audioout"));
	}
	return MAX_ERR_NONE;
}

