/* 
 *	j.plug.out=
 *	Plugtastic Output External
 *	Copyright © 2010 by Timothy Place
 * 
 *	License: This code is licensed under the terms of the "New BSD License"
 *	http://creativecommons.org/licenses/BSD/
 */

#include "j.plug.out.h"


// Prototypes for methods
PlugOutPtr	PlugOutNew(t_symbol* msg, long argc, t_atom* argv);
void	PlugOutFree(PlugOutPtr self);
t_max_err	PlugOutNotify(PlugOutPtr self, t_symbol* s, t_symbol* msg, t_object* sender, TTPtr data);
void	PlugOutQFn(PlugOutPtr self);
void	PlugOutAttachToPatchlinesForPatcher(PlugOutPtr self, t_object* patcher);
void	PlugOutAssist(PlugOutPtr self, void* b, long msg, long arg, char* dst);
TTErr	PlugOutSetup(PlugOutPtr self);
void	PlugOutIterateResetCallback(PlugOutPtr self, t_object* obj);
void	PlugOutIterateSetupCallback(PlugOutPtr self, t_object* obj);
t_max_err	PlugOutBuildAudioUnit(PlugOutPtr self, t_symbol* s, long argc, t_atom* argv);
t_max_err	PlugOutSetVersion(PlugOutPtr self, void* attr, long argc, t_atom* argv);


// Globals
static t_class* sPlugOutClass;


/************************************************************************************/
// Main() Function

int TTCLASSWRAPPERMAX_EXPORT main(void)
{
	t_class* c;

	TTAudioGraphInit();	
	common_symbols_init();

	c = class_new((char*)"j.plug.out=", (method)PlugOutNew, (method)PlugOutFree, sizeof(PlugOut), (method)0L, A_GIMME, 0);

	class_addmethod(c, (method)PlugOutNotify,			"notify",			A_CANT, 0);
	class_addmethod(c, (method)MaxAudioGraphReset,		"audio.reset",		A_CANT, 0);
	class_addmethod(c, (method)PlugOutSetup,			"audio.setup",		A_CANT, 0);
	class_addmethod(c, (method)MaxAudioGraphConnect,	"audio.connect",	A_OBJ, A_LONG, 0);
	class_addmethod(c, (method)MaxAudioGraphDrop,		"audio.drop",		A_CANT, 0);
	class_addmethod(c, (method)MaxAudioGraphObject,		"audio.object",		A_CANT, 0);
	class_addmethod(c, (method)PlugOutBuildAudioUnit,	"build.au",			A_GIMME, 0);
	class_addmethod(c, (method)PlugOutAssist,			"assist",			A_CANT, 0); 
	class_addmethod(c, (method)object_obex_dumpout,		"dumpout",			A_CANT, 0);  

	CLASS_ATTR_SYM(c,			"manufacturer",		0,		PlugOut,	pluginManufacturer);
	CLASS_ATTR_SYM(c,			"manufacturerCode",	0,		PlugOut,	pluginManufacturerCode);
	CLASS_ATTR_SYM(c,			"pluginIdCode",		0,		PlugOut,	pluginID);
	CLASS_ATTR_SYM(c,			"pluginName",		0,		PlugOut,	pluginName);
	CLASS_ATTR_SYM(c,			"pluginVersion",	0,		PlugOut,	pluginVersion);
	CLASS_ATTR_ACCESSORS(c,		"pluginVersion",	NULL,	PlugOutSetVersion);

	class_register(_sym_box, c);
	sPlugOutClass = c;
	return 0;
}


/************************************************************************************/
// Life Cycle

PlugOutPtr PlugOutNew(t_symbol* msg, long argc, t_atom* argv)
{
    PlugOutPtr	self = PlugOutPtr(object_alloc(sPlugOutClass));
	TTValue		v;
	TTErr		err;

    if (self) {
		v.resize(2);
		v[0] = "plugtastic.output";
		v[1] = 2;
		err = TTObjectBaseInstantiate(TT("audio.object"), (TTObjectBasePtr*)&self->audioGraphObject, v);

		v = TTPtr(self->audioGraphObject);

		object_obex_store((void*)self, _sym_dumpout, (object*)outlet_new(self, NULL));
		self->audioGraphOutlet = outlet_new(self, "audio.connect");
		self->qelem = qelem_new(self, (method)PlugOutQFn);
		
		object_obex_lookup(self, gensym("#P"), &self->patcher);
		self->pluginName = object_attr_getsym(self->patcher, _sym_name);
		self->pluginVersion = gensym("1.0");
		self->pluginVersionHex = gensym("0x00010000");
		self->pluginManufacturer = gensym("Plugtastic");
		self->pluginManufacturerCode = gensym("74Ob");
		self->pluginID = gensym("ftmp");
		
		attr_args_process(self, argc, argv);
	}
	return self;
}


void PlugOutFree(PlugOutPtr self)
{
	if (self->patcherview) {
		object_detach_byptr(self, self->patcherview);
		self->patcherview = NULL;
	}
	TTObjectBaseRelease((TTObjectBasePtr*)&self->audioGraphObject);
	qelem_free(self->qelem);
	delete self->buildThread;
}


/************************************************************************************/
// Methods bound to input/inlets

t_max_err PlugOutNotify(PlugOutPtr self, t_symbol* s, t_symbol* msg, t_object* sender, TTPtr data)
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

			if (self->patcherview)
				goto out; // if there is no patcherview, then we are freeing the whole thing and can skip this

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

			// if both boxes are audio graph objects 
			if ( zgetfn(sourceObject, gensym("audio.object")) && zgetfn(destObject, gensym("audio.object")) ) {
				#ifdef DEBUG_NOTIFICATIONS
				object_post(SELF, "deleting audio graph patchline!");
				#endif // DEBUG_NOTIFICATIONS

				object_method(destObject, gensym("audio.drop"), destInlet, sourceObject, sourceOutlet);
			}
		out:		
			;
		}
	}
	return MAX_ERR_NONE;
}


// Qelem function, which clumps together dirty notifications before making the new connections
void PlugOutQFn(PlugOutPtr self)
{
	t_atom result;

	#ifdef DEBUG_NOTIFICATIONS
	object_post(SELF, "patcher dirtied");
	#endif // DEBUG_NOTIFICATIONS

	object_method(self->patcher, gensym("iterate"), (method)PlugOutIterateSetupCallback, self, PI_DEEP, &result);

	// attach to all of the patch cords so we will know if one is deleted
	// we are not trying to detach first -- hopefully this is okay and multiple attachments will be filtered (?)
	PlugOutAttachToPatchlinesForPatcher(self, self->patcher);
}


void PlugOutAttachToPatchlinesForPatcher(PlugOutPtr self, t_object* patcher)
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

			PlugOutAttachToPatchlinesForPatcher(self, subpatcher);
		}
		box = jbox_get_nextobject(box);
	}
}


// Method for Assistance Messages
void PlugOutAssist(PlugOutPtr self, void* b, long msg, long arg, char* dst)
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


TTErr PlugOutSetup(PlugOutPtr self)
{
	t_atom a[2];
	
	atom_setobj(a+0, (t_object*)(self->audioGraphObject));
	atom_setlong(a+1, 0);
	outlet_anything(self->audioGraphOutlet, gensym("audio.connect"), 2, a);
	return kTTErrNone;
}


void PlugOutIterateResetCallback(PlugOutPtr self, t_object* obj)
{
	TTUInt32	vectorSize;
	method		audioResetMethod = zgetfn(obj, gensym("audio.reset"));

	if (audioResetMethod) {
		self->audioGraphObject->getUnitGenerator().get(TT("vectorSize"), vectorSize);
		audioResetMethod(obj, vectorSize);
	}
}


void PlugOutIterateSetupCallback(PlugOutPtr self, t_object* obj)
{
	method audioSetupMethod = zgetfn(obj, gensym("audio.setup"));

	if (audioSetupMethod)
		audioSetupMethod(obj);
}


TTErr PlugOutBuildGraph(PlugOutPtr self)
{
	t_max_err					err;
	t_object*				patcher = NULL;
	t_object*				parent = NULL;
	long					result = 0;
	
	err = object_obex_lookup(self, gensym("#P"), &patcher);
	
	// first find the top-level patcher
	err = object_obex_lookup(self, gensym("#P"), &patcher);
	parent = patcher;
	while (parent) {
		patcher = parent;
		parent = object_attr_getobj(patcher, _sym_parentpatcher);
	}
	
	//object_method(patcher, gensym("iterate"), (method)PlugOutIterateResetCallback, self, PI_DEEP, &result);
	object_method(patcher, gensym("iterate"), (method)PlugOutIterateSetupCallback, self, PI_DEEP, &result);
	
	return kTTErrNone;
}


t_max_err PlugOutDoBuildAudioUnit(PlugOutPtr self, t_symbol* s, long argc, t_atom* argv)
{
	if (self->progressWindow) {
		object_error(SELF, "Already building a plug-in.  Please wait until the process is complete and try again.");
		return MAX_ERR_GENERIC;
	}

	open_progress_window(self);
	PlugOutBuildGraph(self);	
	self->buildThread = new TTThread((TTThreadCallbackType)PlugOutDoBuildAudioUnit_Export, self);
	return MAX_ERR_NONE;
}


t_max_err PlugOutBuildAudioUnit(PlugOutPtr self, t_symbol* s, long argc, t_atom* argv)
{
	defer(self, (method)PlugOutDoBuildAudioUnit, s, argc, argv);
	return MAX_ERR_NONE;
}


t_max_err PlugOutSetVersion(PlugOutPtr self, void* attr, long argc, t_atom* argv)
{
	if (argc) {
		char	str[16];
		int		major = 0;
		int		minor = 0;
		int		revision = 0;
		
		self->pluginVersion = atom_getsym(argv);
		sscanf(self->pluginVersion->s_name, "%i.%i.%i", &major, &minor, &revision);
		snprintf(str, 16, "0x00%02i%02i%02i", major, minor, revision);
		self->pluginVersionHex = gensym(str);
	}
	return MAX_ERR_NONE;
}
