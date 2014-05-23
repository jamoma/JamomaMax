/** @file
 *
 * @ingroup implementationMaxExternals
 *
 * @brief j.ramp : Ramp values using Jamoma's RampLib library
 *
 * @details
 *
 * @authors Tim Place, Trond Lossius
 *
 * @copyright © 2006 by Tim Place @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */


#include "TTModularClassWrapperMax.h"

enum outlets {
	k_outlet_value = 0,
	k_outlet_dumpout,
	num_outlets
};

// This is used to store extra data
typedef struct extra {
	TTValuePtr         currentValue;
} t_extra;
#define EXTRA ((t_extra*)x->extra)

// Prototypes

/** Wrap the TTRamp class as a Max object.
 @param c			The class to be wrapped
 @see				WrappedInputClass_new, WrappedInputClass_free
 */
void		WrapTTRampClass(WrappedClassPtr c);

/** Wrapper for the j.ramp constructor class, called when an instance is created.
 @param self		Pointer to this object.
 @param argc		The number of arguments passed to the object.
 @param argv		Pointer to an array of atoms passed to the object.
 @see				WrappedInputClass_free
 */
void		WrappedRampClass_new(TTPtr self, long argc, t_atom* argv);

/** Wrapper for the j.ramp destructor class, called when an instance is deleted.
 @param self		Pointer to this object.
 @see				WrappedInputClass_new
 */
void		WrappedRampClass_free(TTPtr self);

/** Method for Assistance Messages */
void		ramp_assist(TTPtr self, void *b, long msg, long arg, char *dst);

/** Get a new value now. */
void		ramp_bang(TTPtr self);

/** Method for int input, instantly updates current value of the object. */
void		ramp_int(TTPtr self, long n);

/** Method for float input, instantly updates current value of the object. */
void		ramp_float(TTPtr self, double f);

/** Set current value while surpressing new value(s from being output. */
void		ramp_set(TTPtr self, t_symbol *msg, long argc, t_atom *argv);

/** Stop ongoing ramp */
void        ramp_stop(TTPtr self);

/** Method for list input <value(s), "ramp", ramptime> */
void		ramp_list(TTPtr self, t_symbol *msg, long argc, t_atom *argv);

/** Return the ramped values out */
void		ramp_return_value(TTPtr self, t_symbol *msg, long argc, t_atom *argv);

/** Get or set value of scheduler parameter */
void		ramp_schedulerParameter(TTPtr self, t_symbol *msg, long argc, t_atom *argv);

/** Get or set value of function parameter */
void		ramp_functionParameter(TTPtr self, t_symbol *msg, long argc, t_atom *argv);


#pragma mark -
#pragma mark main
/************************************************************************************/
// Class Definition

int C74_EXPORT main(void)
{
	ModularSpec *spec = new ModularSpec;
	spec->_wrap = &WrapTTRampClass;
	spec->_new = &WrappedRampClass_new;
	spec->_free = &WrappedRampClass_free;
    spec->_any = NULL;
    
	return wrapTTModularClassAsMaxClass(kTTSym_Ramp, "j.ramp", NULL, spec);
}

void WrapTTRampClass(WrappedClassPtr c)
{
    class_addmethod(c->maxClass, (method)ramp_assist,				"assist",					A_CANT,		0);
    
    class_addmethod(c->maxClass, (method)ramp_return_value,			"return_value",             A_CANT, 0);
    
	class_addmethod(c->maxClass, (method)ramp_bang,					"bang",						0);
	class_addmethod(c->maxClass, (method)ramp_int,					"int",						A_DEFLONG,	0);
	class_addmethod(c->maxClass, (method)ramp_float,				"float",					A_DEFFLOAT,	0);
 	class_addmethod(c->maxClass, (method)ramp_list,					"list",						A_GIMME,	0);
    
	class_addmethod(c->maxClass, (method)ramp_set,					"set",						A_GIMME,	0);
	class_addmethod(c->maxClass, (method)ramp_stop,					"stop",						0);

    class_addmethod(c->maxClass, (method)ramp_schedulerParameter,	"scheduler/parameter/value",A_GIMME,	0);
	class_addmethod(c->maxClass, (method)ramp_functionParameter,	"function/parameter/value",	A_GIMME,	0);
}


#pragma mark -
#pragma mark life cycle
/************************************************************************************/
// Object Life

void WrappedRampClass_new(TTPtr self, long argc, t_atom* argv)
{
	WrappedModularInstancePtr   x = (WrappedModularInstancePtr)self;
    
    // create the wrapped TTRamp instance
    jamoma_ramp_create((t_object*)x, x->wrappedObject);
    
    // create an outlet for ramped value
	x->outlets = (TTHandle)sysmem_newptr(sizeof(TTPtr));
    x->outlets[k_outlet_value] = outlet_new(x, 0L);
    
    // Set default scheduler
    x->wrappedObject.set("scheduler", TTSymbol("Max"));
    
    // Prepare extra data
	x->extra = (t_extra*)malloc(sizeof(t_extra));
	EXTRA->currentValue = new TTValue(0.);
    
    // Now set specified attributes, if any
    attr_args_process(x, argc, argv);
}

void WrappedRampClass_free(TTPtr self)
{
    WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
    
    delete EXTRA->currentValue;
    EXTRA->currentValue = NULL;
    
    free(EXTRA);
}

#pragma mark -
#pragma mark methods
/************************************************************************************/
// Methods bound to input/inlets

// Method for Assistance Messages
void ramp_assist(TTPtr self, void *b, long msg, long arg, char *dst)
{
    if (msg==1) 						// Inlet
        strcpy(dst, "input");
    else {							// Outlets
        switch(arg) {
            case k_outlet_value:
                strcpy(dst, "ramping value");
                break;
            case k_outlet_dumpout:
                strcpy(dst, "dumpout");
                break;
        }
    }
}

// BANG -- fire an output -- useful for the async unit
void ramp_bang(TTPtr self)
{
    WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
    
    x->wrappedObject.send(kTTSym_Tick);
}


// INT INPUT
void ramp_int(TTPtr self, long value)
{
    WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
    TTValue none;
    
    x->wrappedObject.send("Set", TTFloat64(value), none);

    outlet_float(x->outlets[k_outlet_value], value);
}


// FLOAT INPUT
void ramp_float(TTPtr self, double value)
{
    WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
    TTValue none;
    
    x->wrappedObject.send("Set", TTFloat64(value), none);
    
    outlet_float(x->outlets[k_outlet_value], value);
}


// SET FLOAT INPUT
void ramp_set(TTPtr self, t_symbol *msg, long argc, t_atom *argv)
{
    WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
    TTValue v, none;
    
    jamoma_ttvalue_from_Atom(v, _sym_nothing, argc, argv);
    
    x->wrappedObject.send("Set", v, none);
}


// STOP RAMP
void ramp_stop(TTPtr self)
{
    WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
    
    x->wrappedObject.send("Stop");
}


// LIST INPUT <value, ramptime>
void ramp_list(TTPtr self, t_symbol *msg, long argc, t_atom *argv)
{
    WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
    short       i;
    short       ramp_keyword_index = -1;
    TTValue     v, none;
    
    // parse the incoming atom
    for (i = 0; i < argc; i++) {
        
        // 'ramp' key word detection
        if (argv[i].a_type == A_SYM) {
            
            if (atom_getsym(argv+i) == gensym("ramp")) {
                ramp_keyword_index = i;
                break;
            }
        }
        
        v.append(TTFloat64(atom_getfloat(argv+i)));
    }
    
    if (ramp_keyword_index == -1) { // just a list w/o ramp information
        
        x->wrappedObject.send("Set", v, none);
        
        outlet_anything(x->outlets[k_outlet_value], _sym_list, argc, argv);
    }
    else {
        
        if (argc != (ramp_keyword_index + 2)) { // "ramp" is not the second last list member
            
            error("invalid syntax -- wrong number of args following the 'ramp' keyword");
            return;
        }
        else { // "ramp" is the second last list member, so we start ramping
            
            x->wrappedObject.send("Set", *(EXTRA->currentValue), none);
            x->wrappedObject.send("Target", v, none);
            x->wrappedObject.send("Go", TTFloat64(atom_getfloat(argv+argc-1)), none);
        }
    }
}

void ramp_return_value(TTPtr self, t_symbol *msg, long argc, t_atom *argv)
{
    WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
    
    // keep current value in memory
    if (EXTRA->currentValue != NULL)
        jamoma_ttvalue_from_Atom(*(EXTRA->currentValue), msg, argc, argv);
    
    outlet_anything(x->outlets[k_outlet_value], msg, argc, argv);
}

#pragma mark -
#pragma mark attributes of attributes
/************************************************************************************/
// Attributes of attributes
void ramp_schedulerParameter(TTPtr self, t_symbol *msg, long argc, t_atom *argv)
{
    WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
    TTValue     v;
    long        ac = 0;
    t_atom		*av = NULL;
    
    if (!argc) {
        error("j.ramp: not enough arguments to get or set scheduler/parameter/value");
        return;
    }
    
    // 1 argument : get the value
    if (argc == 1) {
        
        v = TTSymbol(atom_getsym(argv)->s_name);
        x->wrappedObject.get("schedulerParameterValue", v);
        
        v.prepend(TTSymbol(atom_getsym(argv)->s_name));
        jamoma_ttvalue_to_Atom(v, &ac, &av);
        
        object_obex_dumpout(x, gensym("scheduler/parameter/value"), ac, av);
        return;
    }
    
    // 2 or more arguments : set the value
    jamoma_ttvalue_from_Atom(v, _sym_nothing, argc, argv);
    
    x->wrappedObject.set("schedulerParameterValue", v);
}

void ramp_functionParameter(TTPtr self, t_symbol *msg, long argc, t_atom *argv)
{
    WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
    TTValue     v;
    long        ac = 0;
    t_atom      *av = NULL;
    
    if (!argc) {
        error("j.ramp: not enough arguments to get or set function/parameter/value");
        return;
    }
    
    // 1 argument : get the value
    if (argc == 1) {
        
        v = TTSymbol(atom_getsym(argv)->s_name);
        x->wrappedObject.get("functionParameterValue", v);
        
        v.prepend(TTSymbol(atom_getsym(argv)->s_name));
        jamoma_ttvalue_to_Atom(v, &ac, &av);
        
        object_obex_dumpout(x, gensym("function/parameter/value"), ac, av);
        return;
    }
    
    // 2 or more arguments : set the value
    jamoma_ttvalue_from_Atom(v, _sym_nothing, argc, argv);
    
    x->wrappedObject.set("functionParameterValue", v);
}