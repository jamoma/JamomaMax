/* 
 *	j.plug.parameter!
 *	Plugtastic parameter definition
 *	Copyright © 2010 by Timothy Place
 * 
 *	License: This code is licensed under the terms of the "New BSD License"
 *	http://creativecommons.org/licenses/BSD/
 */

#include "MaxGraph.h"
#include "TTGraphInput.h"
#include "TTAudioGraphAPI.h"

// Data Structure for this object
typedef struct _plugParameter {
   	t_object				obj;
	TTGraphObjectBasePtr	graphObject;		// this _must_ be second
	TTPtr				    graphOutlets[16];	// this _must_ be third (for the setup call)
	TTDictionaryPtr		    graphDictionary;
	t_object*			    patcher;
	t_object*			    patcherview;
	TTPtr				    qelem;				// for clumping dirty events together
	
	t_symbol			    *name;
	double				    range[2];
    t_symbol				*style;
	double				    defaultValue;
} PlugParameter;

typedef PlugParameter* PlugParameterPtr;


// Prototypes for methods
PlugParameterPtr PlugParameterNew		(t_symbol *msg, long argc, t_atom* argv);
void		PlugParameterFree			(PlugParameterPtr self);
void		PlugParameterStartTracking	(PlugParameterPtr self);
t_max_err	PlugParameterNotify			(PlugParameterPtr self, t_symbol *s, t_symbol *msg, t_object* sender, TTPtr data);
void		PlugParameterQFn			(PlugParameterPtr self);
void		PlugParameterAssist			(PlugParameterPtr self, void* b, long msg, long arg, char* dst);
void		PlugParameterInt			(PlugParameterPtr self, long value);
void		PlugParameterFloat			(PlugParameterPtr self, double value);
t_max_err	PlugParameterSetName(PlugParameterPtr self, void* attr, long argc, t_atom* argv);
t_max_err	PlugParameterSetRange(PlugParameterPtr self, void* attr, long argc, t_atom* argv);
t_max_err	PlugParameterSetStyle(PlugParameterPtr self, void* attr, long argc, t_atom* argv);
t_max_err	PlugParameterSetDefault(PlugParameterPtr self, void* attr, long argc, t_atom* argv);


// Globals
static t_class* sPlugParameterClass;


/************************************************************************************/
// Main() Function
int TTGRAPH_EXTERNAL_EXPORT main(void)
{
	t_class *c;

	TTAudioGraphInit();	
	common_symbols_init();

	c = class_new((char*)"j.plug.parameter-", (method)PlugParameterNew, (method)PlugParameterFree, sizeof(PlugParameter), (method)0L, A_GIMME, 0);
	
	class_addmethod(c, (method)PlugParameterInt,		"int",			A_LONG, 0);
	class_addmethod(c, (method)PlugParameterFloat,		"float",		A_LONG, 0);
	//class_addmethod(c, (method)PlugParameterList,		"list",			A_GIMME, 0);
	//class_addmethod(c, (method)PlugParameterAnything,	"anything",		A_GIMME, 0);
	
	class_addmethod(c, (method)MaxGraphReset,			"graph.reset",	A_CANT, 0);
	class_addmethod(c, (method)MaxGraphSetup,			"graph.setup",	A_CANT, 0);
	class_addmethod(c, (method)MaxGraphDrop,			"graph.drop",	A_CANT, 0);
	class_addmethod(c, (method)MaxGraphObject,			"graph.object",	A_CANT, 0);
	
 	class_addmethod(c, (method)PlugParameterNotify,		"notify",		A_CANT, 0); 
 	class_addmethod(c, (method)PlugParameterAssist,		"assist",		A_CANT, 0); 
    class_addmethod(c, (method)object_obex_dumpout,		"dumpout",		A_CANT, 0);  
	
	CLASS_ATTR_SYM(c,			"name",		0,	PlugParameter,	name);
	CLASS_ATTR_ACCESSORS(c,		"name",		NULL, PlugParameterSetName);
	
	CLASS_ATTR_DOUBLE_ARRAY(c,	"range",	0,	PlugParameter,	range, 2);
	CLASS_ATTR_ACCESSORS(c,		"range",	NULL, PlugParameterSetRange);

	CLASS_ATTR_SYM(c,			"style",	0,	PlugParameter,	style);
	CLASS_ATTR_ACCESSORS(c,		"style",	NULL, PlugParameterSetStyle);
	
	CLASS_ATTR_DOUBLE(c,		"default",	0,	PlugParameter,	defaultValue);
	CLASS_ATTR_ACCESSORS(c,		"default",	NULL, PlugParameterSetDefault);

	class_register(_sym_box, c);
	sPlugParameterClass = c;
	return 0;
}
 


/************************************************************************************/
// Object Creation Method

PlugParameterPtr PlugParameterNew(t_symbol *msg, long argc, t_atom* argv)
{
    PlugParameterPtr self = PlugParameterPtr(object_alloc(sPlugParameterClass));
	TTValue	v;
	TTErr	err;
	long	attrStart = attr_args_offset(argc, argv);
	
    if (self) {
    	object_obex_store((void*)self, _sym_dumpout, (t_object*)outlet_new(self, NULL));
		self->graphOutlets[0] = outlet_new(self, "graph.connect");
		
		v.resize(2);
		v[0] = "parameter";
		v[1] = 1;
		err = TTObjectBaseInstantiate(TT("graph.object"), (TTObjectBasePtr*)&self->graphObject, v);
		((TTGraphInput*)self->graphObject->mKernel)->setOwner(self->graphObject);
		
		if (!self->graphObject->mKernel.valid()) {
			object_error(SELF, "cannot load Jamoma object");
			return NULL;
		}
		
		self->graphDictionary = new TTDictionary;
		self->graphDictionary->setSchema(TT("none"));
		self->graphDictionary->append(TT("outlet"), 0);
		
		self->range[0] = 0.0;
		self->range[1] = 1.0;
		self->style = gensym("generic");
		attr_args_process(self, argc, argv);

		if (!self->name) {
			if (attrStart)
				object_attr_setsym(self, _sym_name, atom_getsym(argv));
			else
				object_attr_setsym(self, _sym_name, gensym("A parameter"));
		}
		
		self->qelem = qelem_new(self, (method)PlugParameterQFn);
		
		// PackStartTracking(self);
		defer_low(self, (method)PlugParameterStartTracking, NULL, 0, NULL);
	}
	return self;
}

// Memory Deallocation
void PlugParameterFree(PlugParameterPtr self)
{
	TTObjectBaseRelease((TTObjectBasePtr*)&self->graphObject);
	qelem_free(self->qelem);
}


/************************************************************************************/

t_max_err PlugParameterNotify(PlugParameterPtr self, t_symbol *s, t_symbol *msg, t_object* sender, TTPtr data)
{
	if (sender == self->patcherview) {
		if (msg == _sym_attr_modified) {
			t_symbol *name = (t_symbol*)object_method((t_object*)data, _sym_getname);
			if (name == _sym_dirty) {
				qelem_set(self->qelem);
			}
		}
		else if (msg == _sym_free)
			self->patcherview = NULL;
	}
	else {
		if (msg == _sym_free) {
			t_object*	sourceBox;  
			t_object*	sourceObject;
			long		sourceOutlet;
			t_object*	destBox;     
			t_object*	destObject;  
			long		destInlet;		
			
#ifdef DEBUG_NOTIFICATIONS
			object_post(SELF, "patch line deleted");
#endif // DEBUG_NOTIFICATIONS
			
			// get boxes and inlets
			sourceBox = jpatchline_get_box1(sender);
			if (!sourceBox)
				goto out;
			
			sourceObject = jbox_get_object(sourceBox);
			sourceOutlet = jpatchline_get_outletnum(sender);
			destBox = jpatchline_get_box2(sender);
			if (!destBox)
				goto out;
			destObject = jbox_get_object(destBox);
			destInlet = jpatchline_get_inletnum(sender);
			
			// if both boxes are graph objects 
			if ( zgetfn(sourceObject, gensym("graph.object")) && zgetfn(destObject, gensym("graph.object")) ) {
#ifdef DEBUG_NOTIFICATIONS
				object_post(SELF, "deleting graph patchline!");
#endif // DEBUG_NOTIFICATIONS
				
				object_method(destObject, gensym("graph.drop"), destInlet, sourceObject, sourceOutlet);
			}
		out:
			;
		}
	}
	return MAX_ERR_NONE;
}


void PlugParameterIterateResetCallback(PlugParameterPtr self, t_object* obj)
{
	t_max_err err = MAX_ERR_NONE;
	method graphResetMethod = zgetfn(obj, gensym("graph.reset"));
	
	if (graphResetMethod)
		err = (t_max_err)graphResetMethod(obj);
}


void PlugParameterIterateSetupCallback(PlugParameterPtr self, t_object* obj)
{
	t_max_err err = MAX_ERR_NONE;
	method graphSetupMethod = zgetfn(obj, gensym("graph.setup"));
	
	if (graphSetupMethod)
		err = (t_max_err)graphSetupMethod(obj);
}


void PlugParameterAttachToPatchlinesForPatcher(PlugParameterPtr self, t_object* patcher)
{
	t_object*	patchline = object_attr_getobj(patcher, _sym_firstline);
	t_object*	box = jpatcher_get_firstobject(patcher);
	
	while (patchline) {
		object_attach_byptr_register(self, patchline, _sym_nobox);
		patchline = object_attr_getobj(patchline, _sym_nextline);
	}
	
	while (box) {
		t_symbol *classname = jbox_get_maxclass(box);
		
		if (classname == _sym_jpatcher) {
			t_object*	subpatcher = jbox_get_object(box);
			
			PlugParameterAttachToPatchlinesForPatcher(self, subpatcher);
		}
		box = jbox_get_nextobject(box);
	}
}


// Qelem function, which clumps together dirty notifications before making the new connections
void PlugParameterQFn(PlugParameterPtr self)
{
	t_atom result;
	
#ifdef DEBUG_NOTIFICATIONS
	object_post(SELF, "patcher dirtied");
#endif // DEBUG_NOTIFICATIONS
	
	object_method(self->patcher, gensym("iterate"), (method)PlugParameterIterateSetupCallback, self, PI_DEEP, &result);
	
	// attach to all of the patch cords so we will know if one is deleted
	// we are not trying to detach first -- hopefully this is okay and multiple attachments will be filtered (?)
	PlugParameterAttachToPatchlinesForPatcher(self, self->patcher);
}


// Start keeping track of edits and connections in the patcher
void PlugParameterStartTracking(PlugParameterPtr self)
{
	t_object*	patcher = NULL;
	t_object*	parent = NULL;
	t_object*	patcherview = NULL;
	t_max_err		err;
	t_atom		result;
	
	// first find the top-level patcher
	err = object_obex_lookup(self, gensym("#P"), &patcher);
	parent = patcher;
	while (parent) {
		patcher = parent;
		parent = object_attr_getobj(patcher, _sym_parentpatcher);
	}
	
	// now iterate recursively from the top-level patcher down through all of the subpatchers
	object_method(patcher, gensym("iterate"), (method)PlugParameterIterateResetCallback, self, PI_DEEP, &result);
	object_method(patcher, gensym("iterate"), (method)PlugParameterIterateSetupCallback, self, PI_DEEP, &result);
	
	
	// now let's attach to the patcherview to get notifications about any further changes to the patch cords
	// the patcher 'dirty' attribute is not modified for each change, but the patcherview 'dirty' attribute is
	if (!self->patcherview) {
		patcherview = jpatcher_get_firstview(patcher);
		self->patcherview = patcherview;
		self->patcher = patcher;
		object_attach_byptr_register(self, patcherview, _sym_nobox);			
	}
	
	// now we want to go a step further and attach to all of the patch cords 
	// this is how we will know if one is deleted
	PlugParameterAttachToPatchlinesForPatcher(self, self->patcher);
}


/************************************************************************************/
// Methods bound to input/inlets

// Method for Assistance Messages
void PlugParameterAssist(PlugParameterPtr self, void* b, long msg, long arg, char* dst)
{
	if (msg==1)			// Inlets
		strcpy(dst, "multichannel audio connection and control messages");		
	else if (msg==2) {	// Outlets
		if (arg == 0)
			strcpy(dst, "multichannel audio connection");
		else
			strcpy(dst, "dumpout");
	}
}


void PlugParameterInt(PlugParameterPtr self, long value)
{
	TTValue v = int(value);
	
	// self->graphDictionary->setSchema(TT("number"));
	// TODO: maybe the attribute dictionary should contain a name and the value should then
	//	be a dictionary containing the number/array/etc...
	// YES!
	
	self->graphDictionary->setSchema(TT("attribute"));
	self->graphDictionary->append(TT("name"), TT(self->name->s_name));
	self->graphDictionary->setValue(v);
	((TTGraphInput*)self->graphObject->mKernel)->push(*self->graphDictionary);
}


void PlugParameterFloat(PlugParameterPtr self, double value)
{
	TTValue v = value;
	
	self->graphDictionary->setSchema(TT("attribute"));
	self->graphDictionary->append(TT("name"), TT(self->name->s_name));
	self->graphDictionary->setValue(v);
	((TTGraphInput*)self->graphObject->mKernel)->push(*self->graphDictionary);
}


t_max_err PlugParameterSetName(PlugParameterPtr self, void* attr, long argc, t_atom* argv)
{
	if (argc) {
		self->name = atom_getsym(argv);
		self->graphObject->mKernel.set(TT("name"), TT(self->name->s_name));
	}
	return MAX_ERR_NONE;
}


t_max_err PlugParameterSetRange(PlugParameterPtr self, void* attr, long argc, t_atom* argv)
{
	if (argc == 2) {
		self->range[0] = atom_getfloat(argv+0);
		self->range[1] = atom_getfloat(argv+1);
		self->graphObject->mKernel.set(TT("rangeBottom"), self->range[0]);
		self->graphObject->mKernel.set(TT("rangeTop"), self->range[1]);
	}
	return MAX_ERR_NONE;
}


t_max_err PlugParameterSetStyle(PlugParameterPtr self, void* attr, long argc, t_atom* argv)
{
	if (argc) {
		self->style = atom_getsym(argv);
		self->graphObject->mKernel.set(TT("style"), TT(self->style->s_name));
	}
	return MAX_ERR_NONE;
}


t_max_err PlugParameterSetDefault(PlugParameterPtr self, void* attr, long argc, t_atom* argv)
{
	if (argc) {
		self->defaultValue = atom_getfloat(argv);
		self->graphObject->mKernel.set(TT("default"), self->defaultValue);
	}
	return MAX_ERR_NONE;
}


