/** @file
 *
 * @ingroup implementationMaxExternalsGraph
 *
 * @brief j.midi.in# - Jamoma Graph external object for Max
 *
 * @details
 *
 * @authors Tim Place, Trond Lossius
 *
 * @copyright Copyright © 2011 by Timothy Place @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */


#include "MaxGraph.h"


// Data Structure for this object
struct MidiIn {
    t_object				    obj;
	TTGraphObjectBasePtr	graphObject;		// this _must_ be second
	TTPtr				    graphOutlets[2];	// this _must_ be third (for the setup call) : null-terminated array
	TTDictionaryPtr		    graphDictionary;
	t_object*			    patcher;			// the patcher -- cached for iterating to make connections
    t_object*			    patcherview;		// first view of the top-level patcher (for dirty notifications)
    TTPtr				    qelem;				// for clumping patcher dirty notifications
};
typedef MidiIn* MidiInPtr;


// Prototypes for methods
MidiInPtr	MidiInNew				(t_symbol* msg, long argc, t_atom* argv);
void		MidiInFree				(MidiInPtr self);
void		PackStartTracking		(MidiInPtr self);
t_max_err	PackNotify				(MidiInPtr self, t_symbol* s, t_symbol* msg, t_object* sender, TTPtr data);
void		PackQFn					(MidiInPtr self);
void		MidiInAssist			(MidiInPtr self, void* b, long msg, long arg, char* dst);
void		MidiInGetDeviceNames	(MidiInPtr self);
// Prototypes for attribute accessors
t_max_err		MidiInSetDevice			(MidiInPtr self, void* attr, long argc, t_atom* argv);
t_max_err		MidiInGetDevice			(MidiInPtr self, void* attr, long* argc, t_atom** argv);


// Globals
static t_class* sMidiInClass;


/************************************************************************************/
// Main() Function

int C74_EXPORT main(void)
{
	t_class* c;

	TTGraphInit();
	common_symbols_init();

	c = class_new("j.midi.in-", (method)MidiInNew, (method)MidiInFree, sizeof(MidiIn), (method)0L, A_GIMME, 0);

	class_addmethod(c, (method)MidiInGetDeviceNames,	"getAvailableDeviceNames",	0);
	class_addmethod(c, (method)MaxGraphReset,			"graph.reset",				A_CANT, 0);
	class_addmethod(c, (method)MaxGraphSetup,			"graph.setup",				A_CANT, 0);
	class_addmethod(c, (method)MaxGraphDrop,			"graph.drop",				A_CANT, 0);
	class_addmethod(c, (method)MaxGraphObject,			"graph.object",				A_CANT, 0);
 	class_addmethod(c, (method)PackNotify,				"notify",					A_CANT, 0);
	class_addmethod(c, (method)MidiInAssist,			"assist",					A_CANT, 0);
	class_addmethod(c, (method)object_obex_dumpout,		"dumpout",					A_CANT, 0);

	CLASS_ATTR_SYM(c,		"device",		0,		MidiIn,	obj);
	CLASS_ATTR_ACCESSORS(c,	"device",		MidiInGetDevice,		MidiInSetDevice);

	class_register(_sym_box, c);
	sMidiInClass = c;
	return 0;
}


/************************************************************************************/
// Life Cycle

MidiInPtr MidiInNew(t_symbol* msg, long argc, t_atom* argv)
{
    MidiInPtr	self = MidiInPtr(object_alloc(sMidiInClass));
	TTValue		v;
	TTErr		err;

    if (self) {
		object_obex_store((void*)self, _sym_dumpout, (t_object*)outlet_new(self, NULL));
		self->graphOutlets[0] = outlet_new(self, "graph.connect");

		v.resize(2);
		v[0] = "midi.in";
		v[1] = 1;
		err = TTObjectBaseInstantiate(TT("graph.object"), (TTObjectBasePtr*)&self->graphObject, v);
		self->graphObject->mKernel.set(TT("owner"), TTPtr(self->graphObject));

		if (!self->graphObject->mKernel.valid()) {
			object_error(SELF, "cannot load Jamoma object");
			return NULL;
		}

		self->graphDictionary = new TTDictionary;
		self->graphDictionary->setSchema(TT("none"));
		self->graphDictionary->append(TT("outlet"), 0);

		attr_args_process(self, argc, argv);

		self->qelem = qelem_new(self, (method)PackQFn);
		defer_low(self, (method)PackStartTracking, NULL, 0, NULL);
	}
	return self;
}


void MidiInFree(MidiInPtr self)
{
	TTObjectBaseRelease((TTObjectBasePtr*)&self->graphObject);
	qelem_free(self->qelem);

	// TODO: do we need to detach from the patcher view?  Or is that automatic when we free?
}


/************************************************************************************/

// TODO: This section has lots of ugly duplication from the pack# object because this object is the source for a graph

t_max_err PackNotify(MidiInPtr self, t_symbol* s, t_symbol* msg, t_object* sender, TTPtr data)
{
	if (sender == self->patcherview) {
		if (msg == _sym_attr_modified) {
			t_symbol* name = (t_symbol*)object_method((t_object*)data, _sym_getname);
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


void PackIterateResetCallback(MidiInPtr self, t_object* obj)
{
	t_max_err err = MAX_ERR_NONE;
	method graphResetMethod = zgetfn(obj, gensym("graph.reset"));

	if (graphResetMethod)
		err = (t_max_err)graphResetMethod(obj);
}


void PackIterateSetupCallback(MidiInPtr self, t_object* obj)
{
	t_max_err err = MAX_ERR_NONE;
	method graphSetupMethod = zgetfn(obj, gensym("graph.setup"));

	if (graphSetupMethod)
		err = (t_max_err)graphSetupMethod(obj);
}


void PackAttachToPatchlinesForPatcher(MidiInPtr self, t_object* patcher)
{
	t_object*	patchline = object_attr_getobj(patcher, _sym_firstline);
	t_object*	box = jpatcher_get_firstobject(patcher);

	while (patchline) {
		object_attach_byptr_register(self, patchline, _sym_nobox);
		patchline = object_attr_getobj(patchline, _sym_nextline);
	}

	while (box) {
		t_symbol*	classname = jbox_get_maxclass(box);

		if (classname == _sym_jpatcher) {
			t_object*	subpatcher = jbox_get_object(box);

			PackAttachToPatchlinesForPatcher(self, subpatcher);
		}
		box = jbox_get_nextobject(box);
	}
}


// Qelem function, which clumps together dirty notifications before making the new connections
void PackQFn(MidiInPtr self)
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
void PackStartTracking(MidiInPtr self)
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

void MidiInAssist(MidiInPtr self, void* b, long msg, long arg, char* dst)
{
	if (msg==1)				// Inlets
		strcpy(dst, "multichannel audio connection and control messages");
	else if (msg==2) {		// Outlets
		if (arg == 0)
			strcpy(dst, "stats on DSP graph");
		else
			strcpy(dst, "dumpout");

	}
}


void MidiInGetDeviceNames(MidiInPtr self)
{
	TTValue		v, none;
	TTErr		err;
	long	ac;
	t_atom*		ap;
	TTSymbol	name;

	err = self->graphObject->mKernel.send(TT("getAvailableDeviceNames"), none, v);
	if (!err) {
		ac = v.size();
		ap = new t_atom[ac];

		for (long i=0; i<ac; i++) {
			name = v[i];
			atom_setsym(ap+i, gensym((char*)name.c_str()));
		}
		object_obex_dumpout(self, gensym("getAvailableDeviceNames"), ac, ap);
		delete ap;
	}
}


t_max_err MidiInSetDevice(MidiInPtr self, void* attr, long argc, t_atom* argv)
{
	if (argc) {
		t_symbol* s = atom_getsym(argv);
		self->graphObject->mKernel.set(TT("device"), TT(s->s_name));
	}
	return MAX_ERR_NONE;
}


t_max_err MidiInGetDevice(MidiInPtr self, void* attr, long* argc, t_atom** argv)
{
	TTValue		v;
	TTSymbol	s;

	self->graphObject->mKernel.get(TT("device"), v);
	s = v[0];
	if (!s)
		return MAX_ERR_GENERIC;

	*argc = 1;
	if (!(*argv)) // otherwise use memory passed in
		*argv = (t_atom *)sysmem_newptr(sizeof(t_atom));
	atom_setsym(*argv, gensym((char*)s.c_str()));
	return MAX_ERR_NONE;
}
