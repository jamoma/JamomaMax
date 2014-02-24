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
	
	TTContainer*		model;
	
	TTData*				parameter_coefficient;
	TTCallback*			callback_coefficient;
	TTData*				parameter_delay;
	TTCallback*			callback_delay;
	TTData*				message_clear;
	TTCallback*			callback_clear;
	
	TTInputAudioPtr		in_left;
	TTInputAudioPtr		in_right;
	TTOutputAudioPtr	out_left;
	TTOutputAudioPtr	out_right;
	TTPreset*			preset;

	TTAudioObjectBase*	allpass;	
	TTAudioSignal*		signalIn;
	TTAudioSignal*		signalOut;
	
	TTAddress name;
} t_allpassmod;


// Prototypes for methods
void*	allpassmod_new(t_symbol *s, long argc, t_atom *argv);
void	allpassmod_free(t_allpassmod *x);
void	allpassmod_dsp64(t_allpassmod *x, t_object *dsp64, short *count, double samplerate, long maxvectorsize, long flags);
void	allpassmod_assist(t_allpassmod *x, void *b, long m, long a, char *s);
void 	allpassmod_parameter_coefficient_callback(TTValuePtr baton, TTValue& v);
void 	allpassmod_parameter_delay_callback(TTValuePtr baton, TTValue& v);
void 	allpassmod_parameter_clear_callback(TTValuePtr baton, TTValue& v);


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
	TTApplicationPtr	mApplication		= (TTApplicationPtr)TTApplicationManagerGetApplication("Jamoma");
	TTNodeDirectoryPtr	directory			= TTApplicationGetDirectory(TTObjectBasePtr(mApplication));
	TTNodePtr			returnedNode		= NULL;
	TTBoolean			newInstanceCreated	= NO;
	t_allpassmod*		x					= (t_allpassmod*)object_alloc(s_allpassmod_class);
	long				attrstart 			= attr_args_offset(argc, argv);		// support normal arguments
	TTString			name 				= "/";
	TTPtr				context;
	TTValue				none;
	
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
	
	// 1. Create the actual DSP object
	TTObjectBaseInstantiate(TT("allpass.1"), &x->allpass, 2);
	assert(x->allpass);
	TTObjectBaseInstantiate(kTTSym_audiosignal, &x->signalOut, 2);
	TTObjectBaseInstantiate(kTTSym_audiosignal, &x->signalIn, 2);

	// 2. Create the "model" container
	{
		TTValue container_args; // TODO: (optional) pass address callback and value callback (these are both for the activity return mechanism)
		
		TTObjectBaseInstantiate(TTSymbol("Container"), TTObjectBaseHandle(&x->model), container_args);
		x->model->setAttributeValue(kTTSym_tag, kTTSym_model);
		
		directory->TTNodeCreate(x->name, x->model, context, &returnedNode, &newInstanceCreated);	
		x->model->setAttributeValue("address", TTAddress(name));
	}
	
	// 3. Create the "clear" message
	{
		TTValue		message_args;

		TTObjectBaseInstantiate(TTSymbol("callback"), TTObjectBaseHandle(&x->callback_clear), none);
		x->callback_clear->setAttributeValue(TTSymbol("baton"),	TTPtr(x));
		x->callback_clear->setAttributeValue(TTSymbol("function"),	TTPtr(allpassmod_parameter_clear_callback));
		message_args.append(x->callback_clear);
		message_args.append(kTTSym_message);
		
		TTObjectBaseInstantiate(TTSymbol("Data"), TTObjectBaseHandle(&x->message_clear), message_args);
		x->message_clear->setAttributeValue(kTTSym_type, kTTSym_none);
		x->message_clear->setAttributeValue(kTTSym_description, TTSymbol("Clear the filter history"));
		
		TTAddress address(name + "/clear");
		directory->TTNodeCreate(address, x->message_clear, context, &returnedNode, &newInstanceCreated);
	}

	// 4. Create the "gain" parameter (linear)
	{
		TTValue 		parameter_args;
		
		TTObjectBaseInstantiate(TTSymbol("callback"), TTObjectBaseHandle(&x->callback_coefficient), none);
		x->callback_coefficient->setAttributeValue(TTSymbol("baton"), TTPtr(x));
		x->callback_coefficient->setAttributeValue(TTSymbol("function"),	TTPtr(allpassmod_parameter_coefficient_callback));
		parameter_args.append(x->callback_coefficient);
		parameter_args.append(kTTSym_parameter);
		
		TTObjectBaseInstantiate(TTSymbol("Data"), TTObjectBaseHandle(&x->parameter_coefficient), parameter_args);
		x->parameter_coefficient->setAttributeValue(kTTSym_type, kTTSym_decimal);
		x->parameter_coefficient->setAttributeValue(kTTSym_valueDefault, 0.7);
		x->parameter_coefficient->setAttributeValue(kTTSym_description, TTSymbol("Gain coefficient"));
		
		TTAddress address(name + "/coefficient");
		directory->TTNodeCreate(address, x->parameter_coefficient, context, &returnedNode, &newInstanceCreated);
	}
	
	// 5. Create the "delay" parameter (milliseconds)
	{
		TTValue 		parameter_args;
		
		TTObjectBaseInstantiate(TTSymbol("callback"), TTObjectBaseHandle(&x->callback_delay), none);
		x->callback_delay->setAttributeValue(TTSymbol("baton"),	TTPtr(x));
		x->callback_delay->setAttributeValue(TTSymbol("function"),	TTPtr(allpassmod_parameter_delay_callback));
		parameter_args.append(x->callback_delay);
		parameter_args.append(kTTSym_parameter);
		
		TTObjectBaseInstantiate(TTSymbol("Data"), TTObjectBaseHandle(&x->parameter_delay), parameter_args);
		x->parameter_delay->setAttributeValue(kTTSym_type, kTTSym_decimal);
		x->parameter_delay->setAttributeValue(kTTSym_valueDefault, 0.2);
		x->parameter_delay->setAttributeValue(kTTSym_description, TTSymbol("Delay time"));
		
		TTAddress address(name + "/delay");
		directory->TTNodeCreate(address, x->parameter_delay, context, &returnedNode, &newInstanceCreated);
	}
	
	// 6. Create the Input access point
	{
		TTValue in_args;
		
		in_args.append(TT("audio"));
			
		TTObjectBaseInstantiate(TTSymbol("Input.audio"), TTObjectBaseHandle(&x->in_left), in_args);
		TTAddress address(name + "/in.left");
		directory->TTNodeCreate(address, x->in_left, NULL, &returnedNode, &newInstanceCreated);
		{
			TTObjectBaseInstantiate(TTSymbol("Input.audio"), TTObjectBaseHandle(&x->in_right), in_args);
			TTAddress address(name + "/in.right");
			directory->TTNodeCreate(address, x->in_right, NULL, &returnedNode, &newInstanceCreated);
		}
	}
	
	// 7. Create the Output access point
	{
		TTValue out_args;
		
		out_args.append(TT("audio"));
	
		TTObjectBaseInstantiate(TTSymbol("Output.audio"), TTObjectBaseHandle(&x->out_left), out_args);
		TTAddress address(name + "/out.left");
		directory->TTNodeCreate(address, x->out_left, NULL, &returnedNode, &newInstanceCreated);
		{
			TTObjectBaseInstantiate(TTSymbol("Output.audio"), TTObjectBaseHandle(&x->out_right), out_args);
			TTAddress address(name + "/out.right");
			directory->TTNodeCreate(address, x->out_right, NULL, &returnedNode, &newInstanceCreated);
		}
	}

	// 8. Add the preset functions
	{
		TTValue preset_args; // no args needed
		
		TTObjectBaseInstantiate(kTTSym_PresetManager, TTObjectBaseHandle(&x->preset), preset_args);
		TTAddress address(name + "/preset");
		directory->TTNodeCreate(address, x->preset, context, &returnedNode, &newInstanceCreated);

		x->preset->setAttributeValue("address", TTAddress(name));

		// TODO: tell it to load a preset
		// 1. create TTXMLHandler object 
		// 2. set the object attr of the above object to be the PresetManager
		// 3. send read message to the TTXMLHandler w/ the filepath as an argument
		// 4. send recall message on the PresetManager
		// 5. free the TTXMLHandler
	}
	
	// 9. Initialize the module (set default values, etc)
	x->model->sendMessage("Init");
	
	// 10. Do some final Max-specific stuff
	dsp_setup((t_pxobject*)x, 2);
	x->obj.z_misc = Z_NO_INPLACE;
	for (int i=0; i < 2; i++)
		outlet_new((t_pxobject*)x, "signal");

	attr_args_process(x, argc, argv);
	return x;
}


void allpassmod_free_thing(TTNodeDirectoryPtr aDirectory, TTObjectBaseHandle aThing)
{
	TTValue vAddress;
	TTSymbol symAddress;
	
	(*aThing)->getAttributeValue(kTTSym_address, vAddress);
	symAddress = vAddress;
	TTAddress address(symAddress);
	aDirectory->TTNodeRemove(address);
	TTObjectBaseRelease(TTObjectBaseHandle(aThing));
}

// Destroy
void allpassmod_free(t_allpassmod *x)
{
	dsp_free((t_pxobject *)x);
	TTObjectBaseRelease(&x->allpass);
	TTObjectBaseRelease(&x->signalOut);
	TTObjectBaseRelease(&x->signalIn);
	
	TTApplicationPtr	mApplication		= (TTApplicationPtr)TTApplicationManagerGetApplication("Jamoma");
	TTNodeDirectoryPtr	directory			= TTApplicationGetDirectory(TTObjectBasePtr(mApplication));

	allpassmod_free_thing(directory, TTObjectBaseHandle(&x->model));
	
	allpassmod_free_thing(directory, TTObjectBaseHandle(&x->parameter_coefficient));
	TTObjectBaseRelease(TTObjectBaseHandle(&x->callback_coefficient));
	
	allpassmod_free_thing(directory, TTObjectBaseHandle(&x->parameter_delay));
	TTObjectBaseRelease(TTObjectBaseHandle(&x->callback_delay));
	
	allpassmod_free_thing(directory, TTObjectBaseHandle(&x->message_clear));
	TTObjectBaseRelease(TTObjectBaseHandle(&x->callback_clear));
	
	allpassmod_free_thing(directory, TTObjectBaseHandle(&x->in_left));	
	allpassmod_free_thing(directory, TTObjectBaseHandle(&x->in_right));
	
	allpassmod_free_thing(directory, TTObjectBaseHandle(&x->out_left));
	allpassmod_free_thing(directory, TTObjectBaseHandle(&x->out_right));

	allpassmod_free_thing(directory, TTObjectBaseHandle(&x->preset));
}


/************************************************************************************/

void allpassmod_assist(t_allpassmod *x, void *b, long msg, long arg, char *dst)
{   	
}


// Callback we receive when the parameter value changes
void allpassmod_parameter_coefficient_callback(const TTValue& baton, const TTValue& v)
{
	t_allpassmod *x = (t_allpassmod*)TTPtr(baton->at(0));
	x->allpass->setAttributeValue(TT("linearGain"), v);
}


// Callback we receive when the parameter value changes
void allpassmod_parameter_delay_callback(const TTValue& baton, const TTValue& v)
{
	t_allpassmod *x = (t_allpassmod*)TTPtr(baton->at(0));
	x->allpass->setAttributeValue(TT("delay"), v);
}


void allpassmod_parameter_clear_callback(const TTValue& baton, const TTValue& v)
{
	t_allpassmod *x = (t_allpassmod*)TTPtr(baton->at(0));
	x->allpass->sendMessage(TT("clear"));
}


void allpassmod_perform64(t_allpassmod *x, t_object *dsp64, double **ins, long numins, double **outs, long numouts, long sampleframes, long flags, void *userparam)
{
	x->in_left->process(ins[0], NULL, sampleframes);
	x->in_right->process(ins[1], NULL, sampleframes);

	// need to compile a stereo signal out of the multiple mono signals
	x->signalIn->setVector(0, sampleframes, x->in_left->getVector());
	x->signalIn->setVector(1, sampleframes, x->in_right->getVector());

	// actually process the audio
	x->allpass->process(x->signalIn, x->signalOut);
	
	// we re-use the memory from ins[], which is safe because we set Z_NO_INPLACE in the object constructor
	x->signalOut->getVectorCopy(0, sampleframes, ins[0]);
	x->signalOut->getVectorCopy(1, sampleframes, ins[1]);
	
	x->out_left->process(ins[0], outs[0], sampleframes);
	x->out_right->process(ins[1], outs[1], sampleframes);
}


void allpassmod_dsp64(t_allpassmod *x, t_object *dsp64, short *count, double samplerate, long maxvectorsize, long flags)
{
	x->signalIn->setNumChannels(2);
	x->signalOut->setNumChannels(2);
	
	x->signalIn->setVectorSizeWithInt((TTUInt16)maxvectorsize);
	x->signalOut->setVectorSizeWithInt((TTUInt16)maxvectorsize);
	
	x->signalOut->alloc();
	
	x->allpass->setAttributeValue(kTTSym_sampleRate, samplerate);
	object_method(dsp64, gensym("dsp_add64"), x, allpassmod_perform64, 0, NULL);
		
	x->in_left->setupAudioSignals(maxvectorsize);
	x->in_right->setupAudioSignals(maxvectorsize);
	x->out_left->setupAudioSignals(maxvectorsize, samplerate);
	x->out_right->setupAudioSignals(maxvectorsize, samplerate);
}
