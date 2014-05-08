/** @file
 * @ingroup implementationMaxModels
 *
 * @brief allpass~.model: Wraps the #TTAllpass1 class as a Jamoma model in the form of a C++ external
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


// Data Structure for this object
typedef struct _allpassmod {
	t_pxobject 			obj;
	
	TTObject            model;
	
	TTObject			parameter_coefficient;
	TTObject			parameter_delay;
	TTObject			message_clear;
	
	TTObject            in_left;
	TTObject            in_right;
	TTObject            out_left;
	TTObject            out_right;
	TTObject			preset;

	TTAudioObject       allpass;
	TTObject            signalIn;
	TTObject            signalOut;
	
	TTAddress           name;
} t_allpassmod;


// Prototypes for methods
void*	allpassmod_new(t_symbol *s, long argc, t_atom *argv);
void	allpassmod_free(t_allpassmod *x);
void	allpassmod_dsp64(t_allpassmod *x, t_object *dsp64, short *count, double samplerate, long maxvectorsize, long flags);
void	allpassmod_assist(t_allpassmod *x, void *b, long m, long a, char *s);
void 	allpassmod_parameter_coefficient_callback(const TTValue& baton, const TTValue& v);
void 	allpassmod_parameter_delay_callback(const TTValue& baton, const TTValue& v);
void 	allpassmod_parameter_clear_callback(const TTValue& baton, const TTValue& v);


// Globals
static t_class*	s_allpassmod_class;


/************************************************************************************/
// Define our class

int TTCLASSWRAPPERMAX_EXPORT main(void)
{
	t_class *c = class_new("allpass1~.model", (method)allpassmod_new, (method)allpassmod_free, sizeof(t_allpassmod), (method)0L, A_GIMME, 0);
	
	TTDSPInit();

	class_addmethod(c, (method)allpassmod_dsp64,		"dsp64", A_CANT, 0);
    class_addmethod(c, (method)object_obex_dumpout, 	"dumpout", A_CANT,0);
    class_addmethod(c, (method)allpassmod_assist, 		"assist", A_CANT, 0L);			
	class_dspinit(c);

	class_register(CLASS_BOX, c);
	s_allpassmod_class = c;
	return 0;
}


/************************************************************************************/
// Object Life

// Create
void* allpassmod_new(t_symbol* s, long argc, t_atom* argv)
{
	t_allpassmod*		x					= (t_allpassmod*)object_alloc(s_allpassmod_class);
	long				attrstart 			= attr_args_offset(argc, argv);		// support normal arguments
	TTString			name 				= "/";
	TTPtr				context             = TTPtr(x);
    TTValue             none;
	
	object_obex_lookup(x, gensym("#P"), (t_object**)&context);
	
	if (attrstart) {
		if (atom_getsym(argv)->s_name[0] == '/')
			name += atom_getsym(argv)->s_name + 1;
		else
			name += atom_getsym(argv)->s_name;
	}
	else
		name += s->s_name;

	x->name = TTAddress(name); // need to cache so we can free
	
	// 1. Create the DSP objects
	x->allpass = TTAudioObject("allpass.1", 2);
	x->signalOut = TTObject(kTTSym_audiosignal, 2);
	x->signalIn = TTObject(kTTSym_audiosignal, 2);

	// 2. Create the "model" container
	{
		TTValue container_args; // TODO: (optional) pass address callback and value callback (these are both for the activity return mechanism)
		
		x->model = TTObject(kTTSym_Container, container_args);
		x->model.set(kTTSym_tag, kTTSym_model);
		
        TTValue registration_args(x->name, x->model, context);
        JamomaApplication.send("ObjectRegister", registration_args, none);
		
		x->model.set("address", x->name);
	}
	
	// 3. Create the "clear" message
	{
		x->message_clear = TTObject(kTTSym_Data, kTTSym_message);
        x->message_clear.set(kTTSym_baton, TTPtr(x));
		x->message_clear.set(kTTSym_function, TTPtr(allpassmod_parameter_clear_callback));
		x->message_clear.set(kTTSym_type, kTTSym_none);
		x->message_clear.set(kTTSym_description, TTSymbol("Clear the filter history"));
		
		TTAddress   address = x->name.appendAddress("/clear");
		TTValue     registration_args(address, x->message_clear, context);
        JamomaApplication.send("ObjectRegister", registration_args, none);
	}

	// 4. Create the "gain" parameter (linear)
	{
		x->parameter_coefficient = TTObject(kTTSym_Data, kTTSym_parameter);
        x->parameter_coefficient.set(kTTSym_baton, TTPtr(x));
		x->parameter_coefficient.set(kTTSym_function, TTPtr(allpassmod_parameter_coefficient_callback));
		x->parameter_coefficient.set(kTTSym_type, kTTSym_decimal);
		x->parameter_coefficient.set(kTTSym_valueDefault, 0.7);
		x->parameter_coefficient.set(kTTSym_description, TTSymbol("Gain coefficient"));
		
		TTAddress   address = x->name.appendAddress("/coefficient");
        TTValue     registration_args(address, x->parameter_coefficient, context);
		JamomaApplication.send("ObjectRegister", registration_args, none);
	}
	
	// 5. Create the "delay" parameter (milliseconds)
	{
        x->parameter_delay = TTObject(kTTSym_Data, kTTSym_parameter);
        x->parameter_delay.set(kTTSym_baton, TTPtr(x));
		x->parameter_delay.set(kTTSym_function, TTPtr(allpassmod_parameter_delay_callback));
		x->parameter_delay.set(kTTSym_type, kTTSym_decimal);
		x->parameter_delay.set(kTTSym_valueDefault, 0.2);
		x->parameter_delay.set(kTTSym_description, TTSymbol("Delay time"));
		
		TTAddress   address = x->name.appendAddress("/delay");
        TTValue     registration_args(address, x->parameter_delay, context);
		JamomaApplication.send("ObjectRegister", registration_args, none);
	}
	
	// 6. Create the Input access points
	{
        // left input
        {
            x->in_left = TTObject("Input.audio");
            
            TTAddress   address = x->name.appendAddress("/in.left");
            TTValue     registration_args(address, x->in_left, context);
            JamomaApplication.send("ObjectRegister", registration_args, none);
        }
        
        // right input
        {
            x->in_right = TTObject("Input.audio");
            
            TTAddress   address = x->name.appendAddress("/in.right");
            TTValue     registration_args(address, x->in_right, context);
            JamomaApplication.send("ObjectRegister", registration_args, none);
        }
	}
	
	// 7. Create the Output access points
	{
        // left output
        {
            x->out_left = TTObject("Output.audio");
            
            TTAddress   address = x->name.appendAddress("/out.left");
            TTValue     registration_args(address, x->out_left, context);
            JamomaApplication.send("ObjectRegister", registration_args, none);
        }
        
        // right output
        {
            x->out_right = TTObject("Output.audio");
            
            TTAddress   address = x->name.appendAddress("/out.right");
            TTValue     registration_args(address, x->out_right, context);
            JamomaApplication.send("ObjectRegister", registration_args, none);
        }
	}

	// 8. Add the preset functions
	{
		x->preset = TTObject(kTTSym_PresetManager);
        x->preset.set("address", x->name);
        
		TTAddress   address = x->name.appendAddress("/preset");
		TTValue     registration_args(address, x->preset, context);
        JamomaApplication.send("ObjectRegister", registration_args, none);
        
        // load a preset file and recall the first preset
        {
            TTValue     out;
            TTObject    xmlHandler("XmlHandler");
            
            // set the object attr of the above object to be the PresetManager
            xmlHandler.set("object", x->preset);
            
            // TODO : get the filepath as an argument
            TTSymbol path;
            xmlHandler.send("Read", path, out);
            
            // recall the first preset
            x->preset.send("Recall", 1, none);
        }
	}
	
	// 9. Initialize the module (set default values, etc)
	x->model.send("Init");
	
	// 10. Do some final Max-specific stuff
	dsp_setup((t_pxobject*)x, 2);
	x->obj.z_misc = Z_NO_INPLACE;
	for (int i=0; i < 2; i++)
		outlet_new((t_pxobject*)x, "signal");

	attr_args_process(x, argc, argv);
	return x;
}

// Destroy
void allpassmod_free(t_allpassmod *x)
{
	dsp_free((t_pxobject *)x);
    
    TTValue     none;
    TTAddress   address;
    
    address = x->name.appendAddress("/model");
    JamomaApplication.send("ObjectUnregister", address, none);

	address = x->name.appendAddress("/coefficient");
    JamomaApplication.send("ObjectUnregister", address, none);
	
	address = x->name.appendAddress("/delay");
    JamomaApplication.send("ObjectUnregister", address, none);
	
	address = x->name.appendAddress("/clear");
    JamomaApplication.send("ObjectUnregister", address, none);
	
	address = x->name.appendAddress("/in.left");
    JamomaApplication.send("ObjectUnregister", address, none);
    
    address = x->name.appendAddress("/in.right");
    JamomaApplication.send("ObjectUnregister", address, none);
	
	address = x->name.appendAddress("/out.left");
    JamomaApplication.send("ObjectUnregister", address, none);
    
	address = x->name.appendAddress("/out.right");
    JamomaApplication.send("ObjectUnregister", address, none);

	address = x->name.appendAddress("/preset");
    JamomaApplication.send("ObjectUnregister", address, none);
}


/************************************************************************************/

void allpassmod_assist(t_allpassmod *x, void *b, long msg, long arg, char *dst)
{   	
}


// Callback we receive when the parameter value changes
void allpassmod_parameter_coefficient_callback(const TTValue& baton, const TTValue& v)
{
	t_allpassmod *x = (t_allpassmod*)TTPtr(baton[0]);
	x->allpass.set("linearGain", v);
}


// Callback we receive when the parameter value changes
void allpassmod_parameter_delay_callback(const TTValue& baton, const TTValue& v)
{
	t_allpassmod *x = (t_allpassmod*)TTPtr(baton[0]);
	x->allpass.set("delay", v);
}


void allpassmod_parameter_clear_callback(const TTValue& baton, const TTValue& v)
{
	t_allpassmod *x = (t_allpassmod*)TTPtr(baton[0]);
	x->allpass.send("clear");
}


void allpassmod_perform64(t_allpassmod *x, t_object *dsp64, double **ins, long numins, double **outs, long numouts, long sampleframes, long flags, void *userparam)
{
    // cast objects
    TTInputAudioPtr         in_left_instance = TTInputAudioPtr(x->in_left.instance());
    TTInputAudioPtr         in_right_instance = TTInputAudioPtr(x->in_right.instance());
    TTAudioObjectBasePtr    allpass_instance = TTAudioObjectBasePtr(x->allpass.instance());
    TTAudioSignalPtr        signalIn_instance = TTAudioSignalPtr(x->signalIn.instance());
    TTAudioSignalPtr        signalOut_instance = TTAudioSignalPtr(x->signalOut.instance());
    TTOutputAudioPtr        out_left_instance = TTOutputAudioPtr(x->out_left.instance());
    TTOutputAudioPtr        out_right_instance = TTOutputAudioPtr(x->out_right.instance());
    
	in_left_instance->process(ins[0], NULL, sampleframes);
	in_right_instance->process(ins[1], NULL, sampleframes);

	// need to compile a stereo signal out of the multiple mono signals
	signalIn_instance->setVector(0, sampleframes, in_left_instance->getVector());
	signalIn_instance->setVector(1, sampleframes, in_right_instance->getVector());

	// actually process the audio
	allpass_instance->process(signalIn_instance, signalOut_instance);
	
	// we re-use the memory from ins[], which is safe because we set Z_NO_INPLACE in the object constructor
	signalOut_instance->getVectorCopy(0, sampleframes, ins[0]);
	signalOut_instance->getVectorCopy(1, sampleframes, ins[1]);
	
	out_left_instance->process(ins[0], outs[0], sampleframes);
	out_right_instance->process(ins[1], outs[1], sampleframes);
}


void allpassmod_dsp64(t_allpassmod *x, t_object *dsp64, short *count, double samplerate, long maxvectorsize, long flags)
{
    // cast objects
    TTInputAudioPtr         in_left_instance = TTInputAudioPtr(x->in_left.instance());
    TTInputAudioPtr         in_right_instance = TTInputAudioPtr(x->in_right.instance());
    TTAudioObjectBasePtr    allpass_instance = TTAudioObjectBasePtr(x->allpass.instance());
    TTAudioSignalPtr        signalIn_instance = TTAudioSignalPtr(x->signalIn.instance());
    TTAudioSignalPtr        signalOut_instance = TTAudioSignalPtr(x->signalOut.instance());
    TTOutputAudioPtr        out_left_instance = TTOutputAudioPtr(x->out_left.instance());
    TTOutputAudioPtr        out_right_instance = TTOutputAudioPtr(x->out_right.instance());
    
	signalIn_instance->setNumChannels(2);
	signalOut_instance->setNumChannels(2);
	
	signalIn_instance->setVectorSizeWithInt((TTUInt16)maxvectorsize);
	signalOut_instance->setVectorSizeWithInt((TTUInt16)maxvectorsize);
	
	signalOut_instance->alloc();
	
	allpass_instance->setAttributeValue(kTTSym_sampleRate, samplerate);
	object_method(dsp64, gensym("dsp_add64"), x, allpassmod_perform64, 0, NULL);
		
	in_left_instance->setupAudioSignals(maxvectorsize);
	in_right_instance->setupAudioSignals(maxvectorsize);
	out_left_instance->setupAudioSignals(maxvectorsize, samplerate);
	out_right_instance->setupAudioSignals(maxvectorsize, samplerate);
}
