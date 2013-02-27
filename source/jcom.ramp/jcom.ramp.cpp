/** 
 * \file /Modular/implementations/MaxMSP/jcom.ramp.cpp
 * External for Jamoma: ramp values using Jamoma's RampLib library
 * By Tim Place, Copyright � 2006
 * 
 * License: This code is licensed under the terms of the "New BSD License"
 * http://creativecommons.org/licenses/BSD/
 */

#include "Jamoma.h"

enum outlets {
	k_outlet_value = 0,
	k_outlet_dumpout,
	num_outlets
};


/** The Ramp. jcom.ramp can be considered an extended object comapred to of a line object.
  * It use the RampLib to drive values in different ways, as well as the Function Lib to
  * do the ramp to new values according to an extendable set of functions.  */
typedef struct _ramp {
	t_object	 ob;					///< Data Structure for this object
	void		*outlets[num_outlets];	///< Outlet array
	t_symbol	*attr_rampunit;			///< Attribute: Name of the current rampunit
	t_symbol	*attr_function;			///< Attribute: Name of the current function
	TTObjectBasePtr rampUnit;				///< Instance of the current rampunit
	TTHashPtr	parameterNames;			// cache of parameter names, mapped from lowercase (Max) to uppercase (TT)
} t_ramp;


// Prototypes

/** The jcom.ramp constructor */
void*		ramp_new(t_symbol *s, long argc, t_atom *argv);

/** The ramp deconstructor, free's any memory used by the object */
void		ramp_free(t_ramp *x);

/** Method for Assistance Messages */
void		ramp_assist(t_ramp *x, void *b, long msg, long arg, char *dst);

/** Set what mechanism (RampUnit) is used to drive the ramp. */
t_max_err 	ramp_setrampunit(t_ramp *x, void *attr, long argc, t_atom *argv);

/** Defered method making the actual connection to RampUnit */
t_max_err	ramp_rampSetup(t_ramp *x);

/** Set the function to use when ramping. */
void		ramp_setFunction(t_ramp *x, void *attr, long argc, t_atom *argv);

/** Get the function currently used when ramping. */
void		ramp_getFunction(t_ramp *x);

/** Get value of an additional parameter used for the function. */
void		ramp_getFunctionParameter(t_ramp *obj, t_symbol *msg, long argc, t_atom *argv);

/** Set additional parameters for the function currently used. */
void		ramp_setFunctionParameter(t_ramp *obj, t_symbol *msg, long argc, t_atom *argv);

/** Connect to a setclock object. */
void		ramp_clock(t_ramp *x, t_symbol *clockName);

/** Get a new value now. */
void		ramp_bang(t_ramp *x);

/** Method for int input, instantly updates current value of the object. */
void		ramp_int(t_ramp *x, long n);

/** Method for float input, instantly updates current value of the object. */ 
void		ramp_float(t_ramp *x, double f);

/** Set current value while surpressing new value(s from being output. */
void		ramp_set(t_ramp *x, t_symbol *msg, long argc, t_atom *argv);

/** Stop ongoing ramp */
void ramp_stop(t_ramp *x);

/** Method for list input <value(s), "ramp", ramptime> */
void		ramp_list(t_ramp *x, t_symbol *msg, long argc, t_atom *argv);

/** Method for getting all available ramp units */
void		ramp_getDrives(t_ramp *x);

/** Method for getting all available functions */
void		ramp_getFunctions(t_ramp *x);


/** Triggered by our Ramp Unit's tick function */
void		ramp_callback(void *v, TTUInt32 numvalues, TTFloat64 *values);

/** Set attribute value. */
void 		ramp_attrset(t_ramp *x, t_symbol *msg, long argc, t_atom *argv);

/** Get attribute value. */
void 		ramp_attrget(t_ramp *x, t_symbol *msg, long argc, t_atom *argv);


// Globals
t_class		*ramp_class;				// Required: Global pointer for our class


#pragma mark -
#pragma mark main
/************************************************************************************/
// Class Definition

int JAMOMA_EXPORT_MAXOBJ main(void)
{
	t_class *c;
	
	jamoma_init();
	common_symbols_init();

	// Define our class
	c = class_new("jcom.ramp",(method)ramp_new, (method)ramp_free, sizeof(t_ramp), (method)0L, A_GIMME, 0);
	
	// Make methods accessible for our class:
	class_addmethod(c, (method)ramp_bang,					"bang",						0);
	class_addmethod(c, (method)ramp_int,					"int",						A_DEFLONG,	0);
	class_addmethod(c, (method)ramp_float,					"float",					A_DEFFLOAT,	0);
 	class_addmethod(c, (method)ramp_list,					"list",						A_GIMME,	0);
	class_addmethod(c, (method)ramp_set,					"set",						A_GIMME,	0);
	class_addmethod(c, (method)ramp_stop,					"stop",						0);
	class_addmethod(c, (method)ramp_attrset,				"attrset",					A_GIMME, 	0);
	class_addmethod(c, (method)ramp_attrget,				"attrget",					A_GIMME,	0);
	class_addmethod(c, (method)ramp_getFunctionParameter,	"function.parameter.get",	A_GIMME,	0);
	class_addmethod(c, (method)ramp_setFunctionParameter,	"function.parameter",		A_GIMME,	0);
	class_addmethod(c, (method)ramp_getDrives,				"drives.get",				0);
	class_addmethod(c, (method)ramp_getFunctions,			"functions.get",			0);
	class_addmethod(c, (method)ramp_clock,					"clock",					A_SYM,		0);
	class_addmethod(c, (method)ramp_assist,					"assist",					A_CANT,		0); 
    class_addmethod(c, (method)object_obex_dumpout,			"dumpout",					A_CANT,		0);

	// ATTRIBUTE: rampunit
	class_addattr(c, 
		attr_offset_new("drive", _sym_symbol, 0,
		(method)0, (method)ramp_setrampunit, calcoffset(t_ramp, attr_rampunit)));
	
	// ATTRIBUTE: function
	class_addattr(c, 
		attr_offset_new("function", _sym_symbol, 0,
		(method)0, (method)ramp_setFunction, calcoffset(t_ramp, attr_function)));	

	// Finalize our class
	class_register(CLASS_BOX, c);
	ramp_class = c;
	
	return 0;
}


#pragma mark -
#pragma mark life cycle
/************************************************************************************/
// Object Life

void *ramp_new(t_symbol *s, long argc, t_atom *argv)
{
	t_ramp	*x = (t_ramp *)object_alloc(ramp_class);

	if (x) {
		x->outlets[k_outlet_dumpout] = outlet_new(x, 0L);
		x->outlets[k_outlet_value]   = outlet_new(x, 0L);
		object_obex_store((void *)x, _sym_dumpout, (t_object *)x->outlets[k_outlet_dumpout]);
		x->parameterNames = new TTHash;

		x->rampUnit = NULL;

		// Set default attributes
		// @drive
		Atom a;
		atom_setsym(&a, gensym("scheduler"));
		object_attr_setvalueof(x, gensym("drive"), 1, &a);
		// @function
		object_attr_setsym(x, gensym("function"), jps_linear);

		// Now set specified attributes, if any
		attr_args_process(x, argc, argv);

	}
	return (x);		// return the pointer to our new instantiation
}


void ramp_free(t_ramp *x)
{
	TTObjectBaseRelease((TTObjectBasePtr*)&x->rampUnit);
	delete x->parameterNames;
}


#pragma mark -
#pragma mark methods
/************************************************************************************/
// Methods bound to input/inlets

// Method for Assistance Messages
void ramp_assist(t_ramp *x, void *b, long msg, long arg, char *dst)
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


void ramp_clock(t_ramp *x, t_symbol *clockName)
{
	x->rampUnit->setAttributeValue(TTSymbol("clock"), TTSymbol(clockName->s_name));
}


// Triggered by our Ramp Unit's tick function
void ramp_callback(void *v, TTUInt32 numvalues, TTFloat64 *values)
{	
	t_ramp	*x = (t_ramp *)v;
	t_atom	*a = (t_atom *)malloc(numvalues * sizeof(t_atom));
	short	i;
	
	for (i=0; i<numvalues; i++)
		atom_setfloat(a+i, values[i]);
		
	if (numvalues == 1)
		outlet_float(x->outlets[k_outlet_value], values[0]);
	else
		outlet_anything(x->outlets[k_outlet_value], _sym_list, numvalues, a);
		
	free(a);
}


// BANG -- fire an output -- useful for the async unit
void ramp_bang(t_ramp *x)
{
	x->rampUnit->tick();
}


// INT INPUT
void ramp_int(t_ramp *x, long value)
{
	double dval = value;
	
	x->rampUnit->set(1, &dval);
	outlet_float(x->outlets[k_outlet_value], value);
}


// FLOAT INPUT
void ramp_float(t_ramp *x, double value)
{
	x->rampUnit->set(1, &value);
	outlet_float(x->outlets[k_outlet_value], value);
}


// SET FLOAT INPUT
void ramp_set(t_ramp *x, t_symbol *msg, long argc, t_atom *argv)
{
	double	*values;
	short	i;
	
	values = (double *)malloc(argc * sizeof(double));

	for (i=0; i<argc; i++)
		values[i] = atom_getfloat(argv+i);

	x->rampUnit->set(argc, values);
	free(values);
}


// STOP RAMP
void ramp_stop(t_ramp *x)
{
	x->rampUnit->stop();

}


// LIST INPUT <value, ramptime>
void ramp_list(t_ramp *x, t_symbol *msg, long argc, t_atom *argv)
{
	short 	i;
	short	ramp_keyword_index = -1;
	double	*values;
	
	/*if (argc < 3) {
		error("invalid syntax -- not enough args to ramp");
		return;
	}*/

	values = (double *)malloc((argc) * sizeof(double));
	
	for (i=0; i<argc; i++) {
		if (argv[i].a_type == A_SYM) {
			if (atom_getsym(argv+i) == gensym("ramp")) {
				ramp_keyword_index = i;
				break;
			}
		}
		values[i] = atom_getfloat(argv+i);
	}
	
	if (ramp_keyword_index == -1) { // just a list w/o ramp information
		x->rampUnit->set(argc, values);
		outlet_anything(x->outlets[k_outlet_value], _sym_list, argc, argv);
	}
	else {
		if (argc != (ramp_keyword_index + 2)) { // "ramp" is not the second last list member
			error("invalid syntax -- wrong number of args following the 'ramp' keyword");
			free(values);
			return;
		}
	else { // "ramp" is the second last list member, so we start ramping
		x->rampUnit->go(argc-2, values, atom_getfloat(argv+argc-1));
		}
	}
	free(values);
}



void ramp_getDrives(t_ramp *x)
{
	t_atom		a[2];
	long		numRampUnits = 0;
	long		i;
	TTValue		rampUnitNames;
	TTSymbol	aName;
	
	atom_setsym(a+0, gensym("clear"));
	object_obex_dumpout(x, gensym("drives"), 1, a);
	
	SchedulerLib::getSchedulerNames(rampUnitNames);
	numRampUnits = rampUnitNames.size();
	
	atom_setsym(a+0, gensym("append"));
	for (i=0; i<numRampUnits; i++) {
		rampUnitNames.get(i, aName);
		atom_setsym(a+1, gensym((char*)aName.c_str()));
		object_obex_dumpout(x, gensym("drives"), 2, a);
	}
}


void ramp_getFunctions(t_ramp *x)
{
	t_atom		a[2];
	long		numFunctions = 0;
	long		i;
	TTValue		functionNames;
	TTSymbol	aName;
	
	atom_setsym(a+0, gensym("clear"));
	object_obex_dumpout(x, gensym("functions"), 1, a);
	
    TTGetRegisteredClassNamesForTags(functionNames, kTTSym_function);
	numFunctions = functionNames.size();
	
	atom_setsym(a+0, gensym("append"));
	for (i=0; i<numFunctions; i++) {
		functionNames.get(i, aName);
		atom_setsym(a+1, gensym((char*)aName.c_str()));
		object_obex_dumpout(x, gensym("functions"), 2, a);
	}
}


#pragma mark -
#pragma mark attributes
/************************************************************************************/
// Attributes
t_max_err ramp_setrampunit(t_ramp *x, void *attr, long argc, t_atom *argv)
{
	x->attr_rampunit = atom_getsym(argv);
	// Setting up the ramp have to be defered, as the function attribute might not yet have been set in the new method
	defer(x, (method)ramp_rampSetup, NULL, 0, NULL);
	return MAX_ERR_NONE;
}


// TODO: This function can be hit multiple times when the object is first created, because it is triggered by changes to several different attributes
// We should eliminate the multiple firing since it is not very efficient at load time.
t_max_err ramp_rampSetup(t_ramp *x)
{
	SchedulerLib::createScheduler(TTSymbol(x->attr_rampunit->s_name), &x->rampUnit, ramp_callback, (void *)x);
	return MAX_ERR_NONE;
}	


void ramp_setFunction(t_ramp *x, void *attr, long argc, t_atom *argv)
{
	long		n;
	TTValue		names;
	TTSymbol	aName;
	TTString	nameString;
	
	// set the function
	x->attr_function = atom_getsym(argv);
	x->rampUnit->setAttributeValue(TTSymbol("function"), TTSymbol(x->attr_function->s_name));
	
	// cache the function's attribute names
	x->parameterNames->clear();
	x->rampUnit->getFunctionParameterNames(names);
	n = names.getSize();
	for (int i=0; i<n; i++) {
		names.get(i, aName);
		nameString = aName.c_str();
		
		if (aName == TTSymbol("bypass") || aName == TTSymbol("mute") || aName == TTSymbol("maxNumChannels") || aName == TTSymbol("sampleRate"))
			continue;										// don't publish these parameters
		
		if (nameString[0] > 64 && nameString[0] < 91) {		// ignore all params not starting with upper-case
			nameString[0] += 32;							// convert first letter to lower-case for Max
			
			TTValuePtr v = new TTValue(aName);
			x->parameterNames->append(TTSymbol(nameString.c_str()), *v);
		}
	}	
}


#pragma mark -
#pragma mark attributes of attributes
/************************************************************************************/
// Attributes of attributes
void ramp_getFunctionParameter(t_ramp *obj, t_symbol *msg, long argc, t_atom *argv)
{
	t_atom*		a;
	TTSymbol	parameterName;
	TTValue		parameterValue;
	int			numValues;
	int			i;
	TTSymbol	tempSymbol;
	double		tempValue;
	TTValue		v;
	
	if (!argc) {
		error("jcom.ramp: not enough arguments to function.parameter.get");
		return;
	}
	
	// get the correct TT name for the parameter given the Max name
	parameterName = TTSymbol(atom_getsym(argv)->s_name);
	obj->parameterNames->lookup(parameterName, v);
	v.get(0, parameterName);
	
	obj->rampUnit->getFunctionParameterValue(parameterName, parameterValue);
	numValues = parameterValue.getSize();
	if (numValues) {
		a = (t_atom *)sysmem_newptr(sizeof(t_atom) * (numValues+1));
		// First list item is name of parameter
		atom_setsym(a, gensym((char*)parameterName.c_str()));
		// Next the whole shebang is copied
		for (i=0; i<numValues; i++) {
			if (parameterValue.getType(i) == kTypeSymbol) {
				parameterValue.get(i, tempSymbol);
				atom_setsym(a+i+1, gensym((char*)tempSymbol.c_str()));
			}
			else {
				parameterValue.get(i, tempValue);
				atom_setfloat(a+i+1, tempValue);
			}
		}
		object_obex_dumpout(obj, gensym("function.parameter.get"), numValues+1, a);
		
		// The pointer to an atom assign in the getParameter method needs to be freed.
		sysmem_freeptr(a);
	}
}


void ramp_setFunctionParameter(t_ramp *obj, t_symbol *msg, long argc, t_atom *argv)
{
	TTSymbol	parameterName;
	TTValue		newValue;
	int			i;
	TTValue		v;
	
	if (argc < 2) {
		error("jcom.map: not enough arguments to setParameter");
		return;
	}
	
	// get the correct TT name for the parameter given the Max name
	parameterName = TTSymbol(atom_getsym(argv)->s_name);
	obj->parameterNames->lookup(parameterName, v);
	v.get(0, parameterName);
	
	for (i=1; i<=(argc-1); i++) {
		if (argv[i].a_type == A_SYM)
			newValue.append(TTSymbol(atom_getsym(argv+1)->s_name));
		else
			newValue.append(atom_getfloat(argv+i));
	}
	obj->rampUnit->setFunctionParameterValue(parameterName, newValue);
}


void ramp_attrset(t_ramp *x, t_symbol *msg, long argc, t_atom *argv)
{
	TTSymbol	parameterName;
	TTValue		newValue;
	int			i;
	
	if (argc < 2) {
		error("jcom.ramp: not enough arguments to setParameter");
		return;
	}
	
	parameterName = TTSymbol(atom_getsym(argv)->s_name);
	for (i=1; i<=(argc-1); i++) {
		if (argv[i].a_type == A_SYM)
			newValue.append(TTSymbol(atom_getsym(argv+1)->s_name));
		else
			newValue.append(atom_getfloat(argv+i));
	}
	x->rampUnit->setAttributeValue(parameterName, newValue);
}


void ramp_attrget(t_ramp *x, t_symbol *msg, long argc, t_atom *argv)
{
	t_atom*		a;
	TTSymbol	parameterName;
	TTValue		parameterValue;
	int			numValues;
	int			i;
	TTSymbol	tempSymbol;
	double		tempValue;
	
	if (!argc) {
		error("jcom.ramp: not enough arguments to parameter.get");
		return;
	}
	
	parameterName = TTSymbol(atom_getsym(argv)->s_name);
	x->rampUnit->getAttributeValue(parameterName, parameterValue);
	numValues = parameterValue.getSize();

	if (numValues) {
		a = (t_atom *)sysmem_newptr(sizeof(t_atom) * (numValues+1));
		// First list item is name of parameter
		atom_setsym(a, gensym((char*)parameterName.c_str()));
		// Next the whole shebang is copied
		for (i=0; i<numValues; i++) {
			if (parameterValue.getType(i) == kTypeSymbol) {
				parameterValue.get(i, tempSymbol);
				atom_setsym(a+i+1, gensym((char*)tempSymbol.c_str()));
			}
			else {
				parameterValue.get(i, tempValue);
				atom_setfloat(a+i+1, tempValue);
			}
		}
		object_obex_dumpout(x, gensym("current.parameter"), numValues+1, a);
	
		// The pointer to an atom assign in the getParameter method needs to be freed.
		sysmem_freeptr(a);
	}
}

