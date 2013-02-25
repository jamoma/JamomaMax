/* 
 *	jcom.plug.parameter!
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
typedef struct PlugParameter {
   	Object				obj;
	TTGraphObjectPtr	graphObject;		// this _must_ be second
	TTPtr				graphOutlets[16];	// this _must_ be third (for the setup call)
	TTDictionaryPtr		graphDictionary;
	ObjectPtr			patcher;
	ObjectPtr			patcherview;
	TTPtr				qelem;				// for clumping dirty events together
	
	SymbolPtr			name;
	double				range[2];
	SymbolPtr			style;
	double				defaultValue;
};
typedef PlugParameter* PlugParameterPtr;


// Prototypes for methods
PlugParameterPtr PlugParameterNew	(SymbolPtr msg, AtomCount argc, AtomPtr argv);
void   	PlugParameterFree			(PlugParameterPtr self);
void	PlugParameterStartTracking	(PlugParameterPtr self);
MaxErr	PlugParameterNotify			(PlugParameterPtr self, SymbolPtr s, SymbolPtr msg, ObjectPtr sender, TTPtr data);
void	PlugParameterQFn			(PlugParameterPtr self);
void   	PlugParameterAssist			(PlugParameterPtr self, void* b, long msg, long arg, char* dst);
void	PlugParameterInt			(PlugParameterPtr self, long value);
void	PlugParameterFloat			(PlugParameterPtr self, double value);
MaxErr	PlugParameterSetName(PlugParameterPtr self, void* attr, AtomCount argc, AtomPtr argv);
MaxErr	PlugParameterSetRange(PlugParameterPtr self, void* attr, AtomCount argc, AtomPtr argv);
MaxErr	PlugParameterSetStyle(PlugParameterPtr self, void* attr, AtomCount argc, AtomPtr argv);
MaxErr	PlugParameterSetDefault(PlugParameterPtr self, void* attr, AtomCount argc, AtomPtr argv);


// Globals
static ClassPtr sPlugParameterClass;


/************************************************************************************/
// Main() Function

int main(void)
{
	ClassPtr c;

	TTAudioGraphInit();	
	common_symbols_init();

	c = class_new((char*)"jcom.plug.parameter#", (method)PlugParameterNew, (method)PlugParameterFree, sizeof(PlugParameter), (method)0L, A_GIMME, 0);
	
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

PlugParameterPtr PlugParameterNew(SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
    PlugParameterPtr self = PlugParameterPtr(object_alloc(sPlugParameterClass));
	TTValue	v;
	TTErr	err;
	long	attrStart = attr_args_offset(argc, argv);
	
    if (self) {
    	object_obex_store((void*)self, _sym_dumpout, (ObjectPtr)outlet_new(self, NULL));
		self->graphOutlets[0] = outlet_new(self, "graph.connect");
		
		v.setSize(2);
		v.set(0, TT("parameter"));
		v.set(1, TTUInt32(1));
		err = TTObjectBaseInstantiate(TT("graph.object"), (TTObjectBasePtr*)&self->graphObject, v);
		((TTGraphInput*)self->graphObject->mKernel)->setOwner(self->graphObject);
		
		if (!self->graphObject->mKernel) {
			object_error(SELF, "cannot load Jamoma object");
			return NULL;
		}
		
		self->graphDictionary = new TTDictionary;
		self->graphDictionary->setSchema(TT("none"));
		self->graphDictionary->append(TT("outlet"), 0);
		
		self->range[0] = 0.0;
		self->range[1] = 1.0;
		self->style = GENSYM("generic");
		attr_args_process(self, argc, argv);

		if (!self->name) {
			if (attrStart)
				object_attr_setsym(self, _sym_name, atom_getsym(argv));
			else
				object_attr_setsym(self, _sym_name, GENSYM("A parameter"));		
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

MaxErr PlugParameterNotify(PlugParameterPtr self, SymbolPtr s, SymbolPtr msg, ObjectPtr sender, TTPtr data)
{
	if (sender == self->patcherview) {
		if (msg == _sym_attr_modified) {
			SymbolPtr name = (SymbolPtr)object_method((ObjectPtr)data, _sym_getname);
			if (name == _sym_dirty) {
				qelem_set(self->qelem);
			}
		}
		else if (msg == _sym_free)
			self->patcherview = NULL;
	}
	else {
		if (msg == _sym_free) {
			ObjectPtr	sourceBox;  
			ObjectPtr	sourceObject;
			long		sourceOutlet;
			ObjectPtr	destBox;     
			ObjectPtr	destObject;  
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
			if ( zgetfn(sourceObject, GENSYM("graph.object")) && zgetfn(destObject, GENSYM("graph.object")) ) {
#ifdef DEBUG_NOTIFICATIONS
				object_post(SELF, "deleting graph patchline!");
#endif // DEBUG_NOTIFICATIONS
				
				object_method(destObject, GENSYM("graph.drop"), destInlet, sourceObject, sourceOutlet);
			}
		out:
			;
		}
	}
	return MAX_ERR_NONE;
}


void PlugParameterIterateResetCallback(PlugParameterPtr self, ObjectPtr obj)
{
	MaxErr err = MAX_ERR_NONE;
	method graphResetMethod = zgetfn(obj, GENSYM("graph.reset"));
	
	if (graphResetMethod)
		err = (MaxErr)graphResetMethod(obj);
}


void PlugParameterIterateSetupCallback(PlugParameterPtr self, ObjectPtr obj)
{
	MaxErr err = MAX_ERR_NONE;
	method graphSetupMethod = zgetfn(obj, GENSYM("graph.setup"));
	
	if (graphSetupMethod)
		err = (MaxErr)graphSetupMethod(obj);
}


void PlugParameterAttachToPatchlinesForPatcher(PlugParameterPtr self, ObjectPtr patcher)
{
	ObjectPtr	patchline = object_attr_getobj(patcher, _sym_firstline);
	ObjectPtr	box = jpatcher_get_firstobject(patcher);
	
	while (patchline) {
		object_attach_byptr_register(self, patchline, _sym_nobox);
		patchline = object_attr_getobj(patchline, _sym_nextline);
	}
	
	while (box) {
		SymbolPtr	classname = jbox_get_maxclass(box);
		
		if (classname == _sym_jpatcher) {
			ObjectPtr	subpatcher = jbox_get_object(box);
			
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
	
	object_method(self->patcher, GENSYM("iterate"), (method)PlugParameterIterateSetupCallback, self, PI_DEEP, &result);
	
	// attach to all of the patch cords so we will know if one is deleted
	// we are not trying to detach first -- hopefully this is okay and multiple attachments will be filtered (?)
	PlugParameterAttachToPatchlinesForPatcher(self, self->patcher);
}


// Start keeping track of edits and connections in the patcher
void PlugParameterStartTracking(PlugParameterPtr self)
{
	ObjectPtr	patcher = NULL;
	ObjectPtr	parent = NULL;
	ObjectPtr	patcherview = NULL;
	MaxErr		err;
	Atom		result;
	
	// first find the top-level patcher
	err = object_obex_lookup(self, GENSYM("#P"), &patcher);
	parent = patcher;
	while (parent) {
		patcher = parent;
		parent = object_attr_getobj(patcher, _sym_parentpatcher);
	}
	
	// now iterate recursively from the top-level patcher down through all of the subpatchers
	object_method(patcher, GENSYM("iterate"), (method)PlugParameterIterateResetCallback, self, PI_DEEP, &result);
	object_method(patcher, GENSYM("iterate"), (method)PlugParameterIterateSetupCallback, self, PI_DEEP, &result);
	
	
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


MaxErr PlugParameterSetName(PlugParameterPtr self, void* attr, AtomCount argc, AtomPtr argv)
{
	if (argc) {
		self->name = atom_getsym(argv);
		self->graphObject->mKernel->setAttributeValue(TT("name"), TT(self->name->s_name));
	}
	return MAX_ERR_NONE;
}


MaxErr PlugParameterSetRange(PlugParameterPtr self, void* attr, AtomCount argc, AtomPtr argv)
{
	if (argc == 2) {
		self->range[0] = atom_getfloat(argv+0);
		self->range[1] = atom_getfloat(argv+1);
		self->graphObject->mKernel->setAttributeValue(TT("rangeBottom"), self->range[0]);
		self->graphObject->mKernel->setAttributeValue(TT("rangeTop"), self->range[1]);
	}
	return MAX_ERR_NONE;
}


MaxErr PlugParameterSetStyle(PlugParameterPtr self, void* attr, AtomCount argc, AtomPtr argv)
{
	if (argc) {
		self->style = atom_getsym(argv);
		self->graphObject->mKernel->setAttributeValue(TT("style"), TT(self->style->s_name));
	}
	return MAX_ERR_NONE;
}


MaxErr PlugParameterSetDefault(PlugParameterPtr self, void* attr, AtomCount argc, AtomPtr argv)
{
	if (argc) {
		self->defaultValue = atom_getfloat(argv);
		self->graphObject->mKernel->setAttributeValue(TT("default"), self->defaultValue);
	}
	return MAX_ERR_NONE;
}


