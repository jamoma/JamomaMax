/* 
 * jcom.paramui
 * External for Jamoma: provide standard user interface component for parameters
 * By Tim Place, Copyright © 2007
 * 
 * License: This code is licensed under the terms of the "New BSD License"
 * http://creativecommons.org/licenses/BSD/
 */

#include "jcom.paramui.h"


t_max_err paramui_getName(t_paramui *x, void *attr, long *argc, t_atom **argv)
{
	t_symbol	*attrName = (t_symbol*)object_method(attr, _sym_getname);		
	return object_attr_getvalueof(x->obj_parameter, attrName, argc, argv);
}

t_max_err paramui_setName(t_paramui *x, void *attr, long argc, t_atom *argv)
{
	if (argc)
		x->attr_name = atom_getsym(argv);
	
	object_attr_setvalueof(x->obj_parameter, gensym("name"), argc, argv);
	return MAX_ERR_NONE;
}


t_max_err paramui_getType(t_paramui *x, void *attr, long *argc, t_atom **argv)
{
	t_symbol	*attrName = (t_symbol*)object_method(attr, _sym_getname);		
	return object_attr_getvalueof(x->obj_parameter, attrName, argc, argv);
}

t_max_err paramui_setType(t_paramui *x, void *attr, long argc, t_atom *argv)
{
	if (argc)
		x->attr_type = atom_getsym(argv);
	
	object_attr_setvalueof(x->obj_parameter, gensym("type"), argc, argv);
	return MAX_ERR_NONE;
}


t_max_err paramui_getDefault(t_paramui *x, void *attr, long *argc, t_atom **argv)
{
	t_symbol	*attrName = (t_symbol*)object_method(attr, _sym_getname);		
	return object_attr_getvalueof(x->obj_parameter, attrName, argc, argv);
}

t_max_err paramui_setDefault(t_paramui *x, void *attr, long argc, t_atom *argv)
{
	x->attr_defaultSize = argc;
	if (argc)
		sysmem_copyptr(argv, x->attr_default, sizeof(t_atom) * argc);
	object_attr_setvalueof(x->obj_parameter, gensym("default"), argc, argv);
	return MAX_ERR_NONE;
}


t_max_err paramui_getRampDrive(t_paramui *x, void *attr, long *argc, t_atom **argv)
{
	t_symbol	*attrName = (t_symbol*)object_method(attr, _sym_getname);		
	return object_attr_getvalueof(x->obj_parameter, attrName, argc, argv);
}

t_max_err paramui_setRampDrive(t_paramui *x, void *attr, long argc, t_atom *argv)
{
	if (argc)
		x->attr_rampDrive = atom_getsym(argv);
	
	object_attr_setvalueof(x->obj_parameter, gensym("ramp/drive"), argc, argv);
	return MAX_ERR_NONE;
}


t_max_err paramui_getRampFunction(t_paramui *x, void *attr, long *argc, t_atom **argv)
{
	t_symbol	*attrName = (t_symbol*)object_method(attr, _sym_getname);		
	return object_attr_getvalueof(x->obj_parameter, attrName, argc, argv);
}

t_max_err paramui_setRampFunction(t_paramui *x, void *attr, long argc, t_atom *argv)
{
	if (argc)
		x->attr_rampFunction = atom_getsym(argv);
	
	object_attr_setvalueof(x->obj_parameter, gensym("ramp/function"), argc, argv);
	return MAX_ERR_NONE;
}


t_max_err paramui_getUIFreeze(t_paramui *x, void *attr, long *argc, t_atom **argv)
{
	t_symbol	*attrName = (t_symbol*)object_method(attr, _sym_getname);
    
    // to - this have to be removed because it is not an attribute of TTData class
	return object_attr_getvalueof(x->obj_parameter, attrName, argc, argv);
}

t_max_err paramui_setUIFreeze(t_paramui *x, void *attr, long argc, t_atom *argv)
{
	if (argc)
		x->attr_uiFreeze = atom_getlong(argv);
	
    // to - this have to be removed because it is not an attribute of TTData class
	//object_attr_setvalueof(x->obj_parameter, gensym("view/freeze"), argc, argv);
	return MAX_ERR_NONE;
}


t_max_err paramui_getStepsize(t_paramui *x, void *attr, long *argc, t_atom **argv)
{
	t_symbol	*attrName = (t_symbol*)object_method(attr, _sym_getname);		
	return object_attr_getvalueof(x->obj_parameter, attrName, argc, argv);
}

t_max_err paramui_setStepsize(t_paramui *x, void *attr, long argc, t_atom *argv)
{
	if (argc)
		x->attr_stepsize = atom_getfloat(argv);
	
	object_attr_setvalueof(x->obj_parameter, gensym("value/stepsize"), argc, argv);
	return MAX_ERR_NONE;
}


t_max_err paramui_getPriority(t_paramui *x, void *attr, long *argc, t_atom **argv)
{
	t_symbol	*attrName = (t_symbol*)object_method(attr, _sym_getname);		
	return object_attr_getvalueof(x->obj_parameter, attrName, argc, argv);
}

t_max_err paramui_setPriority(t_paramui *x, void *attr, long argc, t_atom *argv)
{
	if (argc)
		x->attr_priority = atom_getlong(argv);
	
	object_attr_setvalueof(x->obj_parameter, gensym("priority"), argc, argv);
	return MAX_ERR_NONE;
}


t_max_err paramui_getRange(t_paramui *x, void *attr, long *argc, t_atom **argv)
{
	t_symbol	*attrName = (t_symbol*)object_method(attr, _sym_getname);		
	return object_attr_getvalueof(x->obj_parameter, attrName, argc, argv);
}

t_max_err paramui_setRange(t_paramui *x, void *attr, long argc, t_atom *argv)
{
	if (argc)
		x->attr_range[0] = atom_getfloat(argv+0);
	if (argc > 1)
		x->attr_range[1] = atom_getfloat(argv+1);
	
	object_attr_setvalueof(x->obj_parameter, gensym("range/bounds"), argc, argv);
	return MAX_ERR_NONE;
}


t_max_err paramui_getRepetitions(t_paramui *x, void *attr, long *argc, t_atom **argv)
{
	t_symbol	*attrName = (t_symbol*)object_method(attr, _sym_getname);		
	return object_attr_getvalueof(x->obj_parameter, attrName, argc, argv);
}

t_max_err paramui_setRepetitions(t_paramui *x, void *attr, long argc, t_atom *argv)
{
	if (argc)
		x->attr_repetitions = atom_getfloat(argv);
	
	object_attr_setvalueof(x->obj_parameter, gensym("repetitions/allow"), argc, argv);
	return MAX_ERR_NONE;
}


t_max_err paramui_getClipmode(t_paramui *x, void *attr, long *argc, t_atom **argv)
{
	t_symbol	*attrName = (t_symbol*)object_method(attr, _sym_getname);		
	return object_attr_getvalueof(x->obj_parameter, attrName, argc, argv);
}

t_max_err paramui_setClipmode(t_paramui *x, void *attr, long argc, t_atom *argv)
{
	if (argc)
		x->attr_clipmode = atom_getsym(argv);
	
	object_attr_setvalueof(x->obj_parameter, gensym("range/clipmode"), argc, argv);
	return MAX_ERR_NONE;
}


t_max_err paramui_getDescription(t_paramui *x, void *attr, long *argc, t_atom **argv)
{
	t_symbol	*attrName = (t_symbol*)object_method(attr, _sym_getname);		
	return object_attr_getvalueof(x->obj_parameter, attrName, argc, argv);
}

t_max_err paramui_setDescription(t_paramui *x, void *attr, long argc, t_atom *argv)
{
	long	textsize = 0;
	char	*text = NULL;

	if (argc) {
		atom_gettext(argc, argv, &textsize, &text, 0);
		x->attr_description = gensym(text);
		sysmem_freeptr(text);
	}
	object_attr_setsym(x->obj_parameter, jps_description, x->attr_description);
	return MAX_ERR_NONE;
}


t_max_err paramui_getDataspace(t_paramui *x, void *attr, long *argc, t_atom **argv)
{
	t_symbol	*attrName = (t_symbol*)object_method(attr, _sym_getname);		
	return object_attr_getvalueof(x->obj_parameter, attrName, argc, argv);
}

t_max_err paramui_setDataspace(t_paramui *x, void *attr, long argc, t_atom *argv)
{
	if (argc)
		x->attr_dataspace = atom_getsym(argv);
	
	object_attr_setvalueof(x->obj_parameter, gensym("dataspace"), argc, argv);
	return MAX_ERR_NONE;
}


t_max_err paramui_getUnitActive(t_paramui *x, void *attr, long *argc, t_atom **argv)
{
	t_symbol	*attrName = (t_symbol*)object_method(attr, _sym_getname);		
	return object_attr_getvalueof(x->obj_parameter, attrName, argc, argv);
}

t_max_err paramui_setUnitActive(t_paramui *x, void *attr, long argc, t_atom *argv)
{
	if (argc)
		x->attr_unitActive = atom_getsym(argv);
	
	object_attr_setvalueof(x->obj_parameter, gensym("dataspace/unit"), argc, argv);
	return MAX_ERR_NONE;
}
