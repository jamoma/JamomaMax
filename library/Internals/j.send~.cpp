/** 
 * \file j.send~.cpp
 * External for Jamoma: Remote audio signal communication
 * By Tim Place, Copyright © 2007
 * 
 * License: This code is licensed under the terms of the "New BSD License"
 * http://creativecommons.org/licenses/BSD/
 */

#include "Jamoma.h"

/*
	The way this should work is that we have a j.send object with N inlets and one outlet (dumpout)
	When the object receives a 'gettargets' message then it fills a menu via dumpout with all of the targets.
	The target is the OSC name of the target module.
	
	There is then an @target attribute, which is the j.in~ that this sends to.  
	
	The number of inlets are defined by an argument.  We need to check at the time that dsp is started to 
	make sure the target actually has the number of audio signals we are sending though...
	
	QUESTION:
	What about Jitter or other 'signals'?  Should they be implemented via a special mode or additions to 
	the plain vanilla j.send?
	
	Argument in that case will need to be type-checked: int = number of inputs, symbol = OSCname
*/

typedef struct _audiosend{	
	t_pxobject		obj;
	void			*dumpout;						///< dumpout outlet

	t_symbol		*attr_target;					///< name of the module we are sending to
	t_object		*obj_target;					///< the hub of the module we are sending to
	t_object		*obj_direct_target;				///< the j.in~ object in the module we are sending to
	
	long			num_inputs;						///< spec'd as an argument
	float			*audio_in[MAX_NUM_CHANNELS];	///< pointers to the audio vectors
} t_audiosend;


// Prototypes

/** Called at object instantiation.
 @param s			Pointer to symbol bassed as message argument to the object.
 @param argc		The number of arguments passed to the object.
 @param argv		Pointer to arguments as an array of atoms.
 @return			Pointer to the newly created object.
 */
void	*audiosend_new(t_symbol *s, long argc, t_atom *argv);


/** Free up and dispose of the object.
 @param x			Pointer to this object.
 */
void	audiosend_free(t_audiosend *x);


/** Method for displaying assist strings for inlets and outlets.
 @param x			Pointer to this object.
 @param b
 @param msg
 @param argc
 @param argv
 */
void	audiosend_assist(t_audiosend *x, void *b, long msg, long arg, char *dst);


/** When banged, fill a menu with potential targets.
 @param x			Pointer to this class.
 */
void	audiosend_bang(t_audiosend *x);


/** Audio perform method for the object.
 */
t_int*	audiosend_perform(t_int *w);


/** The DSP method for the object, called when compiling the audio chain.
 @param x
 @param sp
 @param count
 */
void	audiosend_dsp(t_audiosend *x, t_signal **sp, short *count);


/** Set the hub of the module we are sending to as an attribute.
 @param x			Pointer to this object
 @param attr		Pointer to the attribute
 @param argc
 @param argv
*/
t_max_err	audiosend_attr_settarget(t_audiosend *x, void *attr, long argc, t_atom *argv);


// Globals
static t_class		*s_audiosend_class;					///< Required: Global pointer for our class


/************************************************************************************/

void send_tilde_initclass(void)
{
	long attrflags = 0;
	t_class *c;
	t_object *attr;
	
	// Define our class
	c = class_new("j.send~", (method)audiosend_new, (method)audiosend_free, 
		sizeof(t_audiosend), (method)NULL, A_GIMME, 0);

	// Make methods accessible for our class:
	class_addmethod(c, (method)audiosend_bang,			"bang",			0);
	class_addmethod(c, (method)audiosend_dsp,			"dsp", 			A_CANT, 0);
    class_addmethod(c, (method)audiosend_assist,		"assist", 		A_CANT, 0);
    class_addmethod(c, (method)object_obex_dumpout, 	"dumpout", 		A_CANT,0);  
	
	// ATTRIBUTE: name
	attr = attr_offset_new("target", _sym_symbol, attrflags,
		(method)0, (method)audiosend_attr_settarget, calcoffset(t_audiosend, attr_target));
	class_addattr(c, attr);

	// Setup our class to work with MSP
	class_dspinit(c);
	
	// Finalize our class
	class_register(CLASS_BOX, c);
	s_audiosend_class = c;
}


/************************************************************************************/
// Object Life

// Create
void *audiosend_new(t_symbol *s, long argc, t_atom *argv)
{
	long			attrstart = attr_args_offset(argc, argv);		// support normal arguments
	t_audiosend 	*x = (t_audiosend *)object_alloc(s_audiosend_class);
	short			i;
	
	if (x) {
		x->dumpout = outlet_new(x, NULL);
		object_obex_store(x, _sym_dumpout, (t_object *)x->dumpout);

		x->attr_target = _sym_nothing;
		x->num_inputs = 2;		// TODO: make this dynamic from args

		for (i=0; i<attrstart; i++) {
			if (argv[i].a_type == A_LONG)
				x->num_inputs = atom_getlong(argv+i);
			else if (argv[i].a_type == A_SYM)
				x->attr_target = atom_getsym(argv+i);
		}
		
		dsp_setup((t_pxobject *)x, x->num_inputs);
		x->obj.z_misc = Z_NO_INPLACE;
		attr_args_process(x, argc, argv);					// handle attribute args
	}
	return x;
}


void audiosend_free(t_audiosend *x)
{
	dsp_free((t_pxobject *)x);
}


/************************************************************************************/
// Methods bound to input/inlets

// Method for Assistance Messages
void audiosend_assist(t_audiosend *x, void *b, long msg, long arg, char *dst)
{
	if (msg==1) 			// Inlets
		strcpy(dst, "input to send to a named module");
	else if (msg==2)		// Outlets
		strcpy(dst, "dumpout");
}


void audiosend_bang(t_audiosend *x)
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


t_int* audiosend_perform(t_int *w)
{
	t_audiosend	*x = (t_audiosend*)(w[1]);
	
	object_method(x->obj_direct_target, SymbolGen("remoteaudio"), x->audio_in, (long)(w[2]));
	return(w+3);
}


void audiosend_dsp(t_audiosend *x, t_signal **sp, short *count)
{
	long		numInputs = x->num_inputs;
	short		i, j;
	t_object	*hub;
	
	if (x->attr_target && x->attr_target != _sym_nothing) {
		hub = jamoma_get_hub_for_module_named(x->attr_target);
		if (hub != x->obj_target) {
			if (hub) {
				x->obj_target = hub;
				// we could attach to the hub here to listen for free notifications
				// but freeing it will restart the dsp anyway, so I don't think there is any need [tap]
				x->obj_direct_target = (t_object*)object_method(hub, SymbolGen("getobj_audioin"));
			}
		}
		if (x->obj_target) {
			for (i=0, j=0; i<numInputs; i++) {
				if (count[i])
					j=i;
				x->audio_in[i] = (t_float*)sp[i]->s_vec;
			}
			numInputs = j+1;

			dsp_add(audiosend_perform, 2, x, numInputs);
		}
	}
}


/************************************************************************************/

t_max_err audiosend_attr_settarget(t_audiosend *x, void *attr, long argc, t_atom *argv)
{
	t_object	*hub;

	x->attr_target = atom_getsym(argv);
	hub = jamoma_get_hub_for_module_named(x->attr_target);
	if (hub) {
		x->obj_target = hub;
		x->obj_direct_target = (t_object*)object_method(hub, SymbolGen("getobj_audioin"));
	}
	return MAX_ERR_NONE;
}
