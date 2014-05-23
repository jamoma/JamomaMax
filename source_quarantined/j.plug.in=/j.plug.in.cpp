/* 
 *	j.plug.in=
 *	Plugtastic Input External
 *	Copyright © 2010 by Timothy Place
 * 
 *	License: This code is licensed under the terms of the "New BSD License"
 *	http://creativecommons.org/licenses/BSD/
 */


#include "MaxAudioGraph.h"
#include "TTAudioGraphAPI.h"


// Data Structure for this object
typedef struct PlugIn {
    t_object					obj;
	TTAudioGraphObjectBasePtr	audioGraphObject;
	TTPtr					audioGraphOutlet;
	long					attrSidechain;
};
typedef PlugIn* PlugInPtr;


// Prototypes for methods
PlugInPtr	PlugInNew(t_symbol* msg, long argc, t_atom* argv);
void		PlugInFree(PlugInPtr self);
void		PlugInAssist(PlugInPtr self, void* b, long msg, long arg, char* dst);
TTErr		PlugInSetup(PlugInPtr self);
t_max_err		PlugInSetSidechain(PlugInPtr self, TTPtr attr, long ac, t_atom* ap);


// Globals
static t_class* sPlugInClass;


/************************************************************************************/
// Main() Function

int TTCLASSWRAPPERMAX_EXPORT main(void)
{
	t_class* c;

	TTAudioGraphInit();	
	common_symbols_init();

	c = class_new((char*)"j.plug.in=", (method)PlugInNew, (method)PlugInFree, sizeof(PlugIn), (method)0L, A_GIMME, 0);
	
	class_addmethod(c, (method)PlugInSetup,				"audio.setup",		A_CANT,	0);
	class_addmethod(c, (method)MaxAudioGraphReset,		"audio.reset",		A_CANT, 0);
	class_addmethod(c, (method)MaxAudioGraphConnect,	"audio.connect",	A_OBJ, A_LONG, 0);
	class_addmethod(c, (method)MaxAudioGraphDrop,		"audio.drop",		A_CANT, 0);
	class_addmethod(c, (method)MaxAudioGraphObject,		"audio.object",		A_CANT, 0);
	class_addmethod(c, (method)PlugInAssist,			"assist",			A_CANT, 0); 
    class_addmethod(c, (method)object_obex_dumpout,		"dumpout",			A_CANT, 0);  

	CLASS_ATTR_LONG(c,		"sidechain", 0, PlugIn, attrSidechain);
	CLASS_ATTR_STYLE(c,		"sidechain", 0, "onoff");
	CLASS_ATTR_ACCESSORS(c,	"sidechain", NULL, PlugInSetSidechain);
	
	class_register(_sym_box, c);
	sPlugInClass = c;
	return 0;
}


/************************************************************************************/
// Object Creation Method

PlugInPtr PlugInNew(t_symbol* msg, long argc, t_atom* argv)
{
    PlugInPtr self = PlugInPtr(object_alloc(sPlugInClass));
	TTValue		v;
	TTErr		err;

    if (self) {
		v.resize(2);
		v[0] = "plugtastic.input";
		v[1] = 1;
		err = TTObjectBaseInstantiate(TT("audio.object"), (TTObjectBasePtr*)&self->audioGraphObject, v);

		attr_args_process(self, argc, argv);
    	object_obex_store((void*)self, _sym_dumpout, (object*)outlet_new(self, NULL));
		self->audioGraphOutlet = outlet_new((t_pxobject*)self, "audio.connect");
	}
	return self;
}

// Memory Deallocation
void PlugInFree(PlugInPtr self)
{
	TTObjectBaseRelease((TTObjectBasePtr*)&self->audioGraphObject);
}


/************************************************************************************/
// Methods bound to input/inlets

// Method for Assistance Messages
void PlugInAssist(PlugInPtr self, void* b, long msg, long arg, char* dst)
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


TTErr PlugInSetup(PlugInPtr self)
{
	t_atom a[2];
	
	atom_setobj(a+0, (t_object*)(self->audioGraphObject));
	atom_setlong(a+1, 0);
	outlet_anything(self->audioGraphOutlet, gensym("audio.connect"), 2, a);
	return kTTErrNone;
}


t_max_err PlugInSetSidechain(PlugInPtr self, TTPtr attr, long ac, t_atom* ap)
{
	self->attrSidechain = atom_getlong(ap);
	self->audioGraphObject->mKernel.set(TT("sidechain"), TTBoolean(self->attrSidechain));
	return MAX_ERR_NONE;
}
