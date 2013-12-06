/** @file
 * @ingroup implementationMaxModels
 *
 * @brief Jamoma model for synthesising audio noise, Implmented in C++ rather than in Max.
 *
 * @details
 *
 * @authors Tim Place, Trond Lossius
 *
 * @copyright Copyright © 2013, Tim Place @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */

#include "TTModularClassWrapperMax.h"
#include "ext.h"						// Max Header
#include "z_dsp.h"						// MSP Header
#include "ext_obex.h"					// Max Object Extensions (attributes) Header

#include "TTModel.h"

// Data Structure for this object
typedef struct _noisemod {
	t_pxobject 			obj;
	TTModel*			model;
	TTOutputAudioPtr	out;	
	TTAudioObjectBase*	noise;
	TTAudioSignal*		signalIn;
	TTAudioSignal*		signalOut;
} t_noisemod;


// Prototypes for methods
void*	noisemod_new(t_symbol *s, long argc, t_atom *argv);
void	noisemod_free(t_noisemod *x);
void	noisemod_dsp64(t_noisemod *x, t_object *dsp64, short *count, double samplerate, long maxvectorsize, long flags);
void	noisemod_assist(t_noisemod *x, void *b, long m, long a, char *s);
void	noisemod_parameter_mode_callback(TTValuePtr baton, TTValue& v);


// Globals
static t_class*	s_noisemod_class;


/************************************************************************************/
// Define our class

int TTCLASSWRAPPERMAX_EXPORT main(void)
{
	t_class *c = class_new("noise~.model", (method)noisemod_new, (method)noisemod_free, sizeof(t_noisemod), (method)0L, A_GIMME, 0);
	
	TTDSPInit();

	class_addmethod(c, (method)noisemod_dsp64,		"dsp64", A_CANT, 0);
    class_addmethod(c, (method)object_obex_dumpout, "dumpout", A_CANT,0);
    class_addmethod(c, (method)noisemod_assist, 	"assist", A_CANT, 0L);			
	class_dspinit(c);

	class_register(CLASS_BOX, c);
	s_noisemod_class = c;
	return 0;
}


/************************************************************************************/
// Object Life

// Create
void* noisemod_new(t_symbol* s, long argc, t_atom* argv)
{
	t_noisemod*	x			= (t_noisemod*)object_alloc(s_noisemod_class);
	long		attrstart	= attr_args_offset(argc, argv);
	TTString	name 		= "/";
	TTPtr		context;
	
	object_obex_lookup(x, gensym("#P"), (t_object**)&context);
	
	if (attrstart) {
		if (atom_getsym(argv)->s_name[0] == '/')
			name += atom_getsym(argv)->s_name + 1;
		else
			name += atom_getsym(argv)->s_name;
	}
	else
		name += s->s_name;
	
	// Create the actual DSP object
	TTObjectBaseInstantiate(TT("noise"), &x->noise, 2);
	assert(x->noise);
	TTObjectBaseInstantiate(kTTSym_audiosignal, &x->signalOut, 2);
	TTObjectBaseInstantiate(kTTSym_audiosignal, &x->signalIn, 2);

	// Create the "model" container
	x->model = new TTModel(context, name);
	
	// Add things to our model
	x->model->createParameter("mode", "string", TT("white"), (TTFunctionWithBatonAndValue)noisemod_parameter_mode_callback, x, "");
	x->out = x->model->createOutput("out");
	x->model->createPresetManager();
		
	// Initialize the module (set default values, etc)
	x->model->init();
	
	// 10. Do some final Max-specific stuff
	dsp_setup((t_pxobject*)x, 1);
	x->obj.z_misc = Z_NO_INPLACE;
	outlet_new((t_pxobject*)x, "signal");
	attr_args_process(x, argc, argv);
	return x;
}


// Destroy
void noisemod_free(t_noisemod *x)
{
	dsp_free((t_pxobject *)x);
	
	delete x->model;
	
	TTObjectBaseRelease(&x->noise);
	TTObjectBaseRelease(&x->signalOut);
	TTObjectBaseRelease(&x->signalIn);
}


/************************************************************************************/

void noisemod_assist(t_noisemod *x, void *b, long msg, long arg, char *dst)
{
}


// Callback we receive when the parameter value changes
void noisemod_parameter_mode_callback(TTValuePtr baton, TTValue& v)
{
	t_noisemod *x = (t_noisemod*)TTPtr(baton->at(0));
	x->noise->setAttributeValue("mode", v);
}


void noisemod_perform64(t_noisemod *x, t_object *dsp64, double **ins, long numins, double **outs, long numouts, long sampleframes, long flags, void *userparam)
{
	// actually process the audio
	x->noise->process(x->signalOut);
	
	// we re-use the memory from ins[], which is safe because we set Z_NO_INPLACE in the object constructor
	x->signalOut->getVectorCopy(0, sampleframes, ins[0]);
	
	x->out->process(ins[0], outs[0], sampleframes);
}


void noisemod_dsp64(t_noisemod *x, t_object *dsp64, short *count, double samplerate, long maxvectorsize, long flags)
{
	x->signalOut->setNumChannels(1);
	x->signalOut->setVectorSizeWithInt((TTUInt16)maxvectorsize);
	x->signalOut->alloc();
	
	x->noise->setAttributeValue(kTTSym_sampleRate, samplerate);
	object_method(dsp64, gensym("dsp_add64"), x, noisemod_perform64, 0, NULL);

	x->out->setupAudioSignals(maxvectorsize, samplerate);
}
