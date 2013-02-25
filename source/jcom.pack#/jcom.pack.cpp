/* 
 *	pack#
 *	External object for Max/MSP to bring Max values into a Jamoma Graph.
 *	Copyright © 2010 by Timothy Place
 * 
 * License: This code is licensed under the terms of the "New BSD License"
 * http://creativecommons.org/licenses/BSD/
 */

#include "maxGraph.h"
#include "TTGraphInput.h"


// Data Structure for this object
struct Pack {
   	Object				obj;
	TTGraphObjectPtr	graphObject;		// this _must_ be second
	TTPtr				graphOutlets[16];	// this _must_ be third (for the setup call)
	TTDictionaryPtr		graphDictionary;
	ObjectPtr			patcher;
	ObjectPtr			patcherview;
	TTPtr				qelem;				// for clumping dirty events together
};
typedef Pack* PackPtr;


// Prototypes for methods
PackPtr	PackNew			(SymbolPtr msg, AtomCount argc, AtomPtr argv);
void   	PackFree		(PackPtr self);
void	PackStartTracking(PackPtr self);
MaxErr	PackNotify		(PackPtr self, SymbolPtr s, SymbolPtr msg, ObjectPtr sender, TTPtr data);
void	PackQFn			(PackPtr self);
void   	PackAssist		(PackPtr self, void* b, long msg, long arg, char* dst);
void	PackInt			(PackPtr self, long value);
void	PackFloat		(PackPtr self, double value);
void	PackList		(PackPtr self, SymbolPtr s, AtomCount ac, AtomPtr ap);
void	PackAnything	(PackPtr self, SymbolPtr s, AtomCount ac, AtomPtr ap);
void	PackMessage		(PackPtr self, SymbolPtr s, AtomCount ac, AtomPtr ap);
void	PackAttribute	(PackPtr self, SymbolPtr s, AtomCount ac, AtomPtr ap);
TTErr  	PackReset		(PackPtr self, long vectorSize);
TTErr  	PackSetup		(PackPtr self);


// Globals
static ClassPtr sPackClass;


/************************************************************************************/
// Main() Function

int TTGRAPH_EXTERNAL_EXPORT main(void)
{
	ClassPtr c;
	
	TTGraphInit();	
	common_symbols_init();
	
	c = class_new("jcom.pack#", (method)PackNew, (method)PackFree, sizeof(Pack), (method)0L, A_GIMME, 0);
	
	class_addmethod(c, (method)PackInt,				"int",				A_LONG, 0);
	class_addmethod(c, (method)PackFloat,			"float",			A_LONG, 0);
	class_addmethod(c, (method)PackList,			"list",				A_GIMME, 0);
	class_addmethod(c, (method)PackAnything,		"anything",			A_GIMME, 0);
	class_addmethod(c, (method)PackMessage,			"message",			A_GIMME, 0);
	class_addmethod(c, (method)PackAttribute,		"attribute",		A_GIMME, 0);
	
	class_addmethod(c, (method)MaxGraphReset,		"graph.reset",		A_CANT, 0);
	class_addmethod(c, (method)MaxGraphSetup,		"graph.setup",		A_CANT, 0);
	class_addmethod(c, (method)MaxGraphDrop,		"graph.drop",		A_CANT, 0);
	class_addmethod(c, (method)MaxGraphObject,		"graph.object",		A_CANT, 0);

 	class_addmethod(c, (method)PackNotify,			"notify",			A_CANT, 0); 
 	class_addmethod(c, (method)PackAssist,			"assist",			A_CANT, 0); 
    class_addmethod(c, (method)object_obex_dumpout,	"dumpout",			A_CANT, 0);  
		
	class_register(_sym_box, c);
	sPackClass = c;
	return 0;
}


/************************************************************************************/
// Object Creation Method

PackPtr PackNew(SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
    PackPtr	self;
	TTValue	v;
	TTErr	err;
	
    self = PackPtr(object_alloc(sPackClass));
    if (self) {
    	object_obex_store((void*)self, _sym_dumpout, (ObjectPtr)outlet_new(self, NULL));
		self->graphOutlets[0] = outlet_new(self, "graph.connect");
		
		v.setSize(2);
		v.set(0, TT("graph.input"));
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
		
		attr_args_process(self, argc, argv);
		
		self->qelem = qelem_new(self, (method)PackQFn);

		// PackStartTracking(self);
		defer_low(self, (method)PackStartTracking, NULL, 0, NULL);
	}
	return self;
}


// Memory Deallocation
void PackFree(PackPtr self)
{
	TTObjectBaseRelease((TTObjectBasePtr*)&self->graphObject);
	qelem_free(self->qelem);
}


/************************************************************************************/

MaxErr PackNotify(PackPtr self, SymbolPtr s, SymbolPtr msg, ObjectPtr sender, TTPtr data)
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


void PackIterateResetCallback(PackPtr self, ObjectPtr obj)
{
	MaxErr err = MAX_ERR_NONE;
	method graphResetMethod = zgetfn(obj, gensym("graph.reset"));
	
	if (graphResetMethod)
		err = (MaxErr)graphResetMethod(obj);
}


void PackIterateSetupCallback(PackPtr self, ObjectPtr obj)
{
	MaxErr err = MAX_ERR_NONE;
	method graphSetupMethod = zgetfn(obj, gensym("graph.setup"));
	
	if (graphSetupMethod)
		err = (MaxErr)graphSetupMethod(obj);
}


void PackAttachToPatchlinesForPatcher(PackPtr self, ObjectPtr patcher)
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
			
			PackAttachToPatchlinesForPatcher(self, subpatcher);
		}
		box = jbox_get_nextobject(box);
	}
}


// Qelem function, which clumps together dirty notifications before making the new connections
void PackQFn(PackPtr self)
{
	t_atom result;
	
	#ifdef DEBUG_NOTIFICATIONS
	object_post(SELF, "patcher dirtied");
	#endif // DEBUG_NOTIFICATIONS
	
	object_method(self->patcher, gensym("iterate"), (method)PackIterateSetupCallback, self, PI_DEEP, &result);
	
	// attach to all of the patch cords so we will know if one is deleted
	// we are not trying to detach first -- hopefully this is okay and multiple attachments will be filtered (?)
	PackAttachToPatchlinesForPatcher(self, self->patcher);
}


// Start keeping track of edits and connections in the patcher
void PackStartTracking(PackPtr self)
{
	ObjectPtr	patcher = NULL;
	ObjectPtr	parent = NULL;
	ObjectPtr	patcherview = NULL;
	MaxErr		err;
	Atom		result;
	
	// first find the top-level patcher
	err = object_obex_lookup(self, gensym("#P"), &patcher);
	parent = patcher;
	while (parent) {
		patcher = parent;
		parent = object_attr_getobj(patcher, _sym_parentpatcher);
	}
	
	// now iterate recursively from the top-level patcher down through all of the subpatchers
	object_method(patcher, gensym("iterate"), (method)PackIterateResetCallback, self, PI_DEEP, &result);
	object_method(patcher, gensym("iterate"), (method)PackIterateSetupCallback, self, PI_DEEP, &result);
	
	
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
	PackAttachToPatchlinesForPatcher(self, self->patcher);
}


/************************************************************************************/
// Methods bound to input/inlets

// Method for Assistance Messages
void PackAssist(PackPtr self, void* b, long msg, long arg, char* dst)
{
	if (msg==1)			// Inlets
		strcpy (dst, "multichannel input and control messages");		
	else if (msg==2){	// Outlets
		if (arg == 0)
			strcpy(dst, "multichannel output");
		else
			strcpy(dst, "dumpout");
	}
}


void PackInt(PackPtr self, long value)
{
	TTValue v = int(value);

	self->graphDictionary->setSchema(TT("number"));
	self->graphDictionary->setValue(v);
	((TTGraphInput*)self->graphObject->mKernel)->push(*self->graphDictionary);
}


void PackFloat(PackPtr self, double value)
{
	TTValue v = value;
	
	self->graphDictionary->setSchema(TT("number"));
	self->graphDictionary->setValue(v);
	((TTGraphInput*)self->graphObject->mKernel)->push(*self->graphDictionary);
}


void PackList(PackPtr self, SymbolPtr s, AtomCount ac, AtomPtr ap)
{
	TTValue v;
	
	v.setSize(ac);
	for (int i=0; i<ac; i++) {
		switch (atom_gettype(ap+i)) {
			case A_LONG:
				v.set(i, (int)atom_getlong(ap+i));
				break;
			case A_FLOAT:
				v.set(i, atom_getfloat(ap+i));
				break;
			case A_SYM:
				v.set(i, TT(atom_getsym(ap+i)->s_name));
				break;
			default:
				break;
		}
	}
	self->graphDictionary->setSchema(TT("array"));
	self->graphDictionary->setValue(v);
	((TTGraphInput*)self->graphObject->mKernel)->push(*self->graphDictionary);
}


void PackAnything(PackPtr self, SymbolPtr s, AtomCount ac, AtomPtr ap)
{
	TTValue v;
	
	v.setSize(ac+1);
	if (ac > 0) {
		self->graphDictionary->setSchema(TT("array"));
		v.set(0, TT(s->s_name));
		for (int i=0; i<ac; i++) {
			switch (atom_gettype(ap+i)) {
				case A_LONG:
					v.set(i+1, (int)atom_getlong(ap+i));
					break;
				case A_FLOAT:
					v.set(i+1, atom_getfloat(ap+i));
					break;
				case A_SYM:
					v.set(i+1, TT(atom_getsym(ap+i)->s_name));
					break;
				default:
					break;
			}
		}
	}
	else {
		self->graphDictionary->setSchema(TT("symbol"));
		v.set(0, TT(s->s_name));
	}
	
	self->graphDictionary->setValue(v);
	((TTGraphInput*)self->graphObject->mKernel)->push(*self->graphDictionary);
}


void PackMessage(PackPtr self, SymbolPtr s, AtomCount ac, AtomPtr ap)
{
	TTValue v;
	
	if (ac < 1)
		return;
	
	self->graphDictionary->setSchema(TT("message"));
	self->graphDictionary->append(TT("name"), TT(atom_getsym(ap)->s_name));
	
	v.setSize(ac-1);
	if (ac > 2) {
		
		for (int i=0; i < ac-1; i++) {
			switch (atom_gettype(ap+i)) {
				case A_LONG:
					v.set(i+1, (int)atom_getlong(ap+i));
					break;
				case A_FLOAT:
					v.set(i+1, atom_getfloat(ap+i));
					break;
				case A_SYM:
					v.set(i+1, TT(atom_getsym(ap+i)->s_name));
					break;
				default:
					break;
			}
		}
	}
	else if (ac > 1) {
		if (atom_gettype(ap+1) == A_SYM)
			v.set(0, TT(s->s_name));
		else if (atom_gettype(ap+1) == A_LONG || atom_gettype(ap+1) == A_FLOAT)
			v.set(0, atom_getfloat(ap+1));
	}
	
	self->graphDictionary->setValue(v);
	((TTGraphInput*)self->graphObject->mKernel)->push(*self->graphDictionary);
}


void PackAttribute(PackPtr self, SymbolPtr s, AtomCount ac, AtomPtr ap)
{
	TTValue v;
	
	if (ac < 1)
		return;
	
	self->graphDictionary->setSchema(TT("attribute"));
	self->graphDictionary->append(TT("name"), TT(atom_getsym(ap)->s_name));
	
	v.setSize(ac-1);
	if (ac > 2) {
		
		for (int i=0; i < ac-1; i++) {
			switch (atom_gettype(ap+i)) {
				case A_LONG:
					v.set(i+1, (int)atom_getlong(ap+i));
					break;
				case A_FLOAT:
					v.set(i+1, atom_getfloat(ap+i));
					break;
				case A_SYM:
					v.set(i+1, TT(atom_getsym(ap+i)->s_name));
					break;
				default:
					break;
			}
		}
	}
	else if (ac > 1) {
		if (atom_gettype(ap+1) == A_SYM)
			v.set(0, TT(s->s_name));
		else if (atom_gettype(ap+1) == A_LONG || atom_gettype(ap+1) == A_FLOAT)
			v.set(0, atom_getfloat(ap+1));
	}
	
	self->graphDictionary->setValue(v);
	((TTGraphInput*)self->graphObject->mKernel)->push(*self->graphDictionary);
}

