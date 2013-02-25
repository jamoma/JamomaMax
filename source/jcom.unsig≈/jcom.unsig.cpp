/** @file
 *
 * @ingroup audioGraphMax
 *
 * @brief jcom.unsig≈ - converts Jamoma AudioGraph signal to a Max message list.
 *
 * @details 
 *
 * @authors Nils Peters, Tim Place
 *
 * @copyright Copyright © 2011, Nils Peters, Tim Place @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */

#include "maxAudioGraph.h"
#include "jpatcher_api.h"
//#define DEBUG_NOTIFICATIONS

// Data Structure for this object
struct Out {
    t_pxobject					obj;
	TTAudioGraphObjectPtr		audioGraphObject;
	TTAudioSignalPtr			audioSignal;
	TTUInt16					maxNumChannels;	// the number of inlets or outlets, which is an argument at instantiation
	TTUInt16					numChannels;	// the actual number of channels to use, set by the dsp method
	TTUInt16					vectorSize;		// cached by the DSP method
	//TTFloat32					gain;			// gain multiplier
	TTBoolean					hasReset;		// flag indicating that reset has been called already, so we don't need to reset again
	TTBoolean					hasConnections;	// flag indicating that we have connections so we can mute MSP output
	ObjectPtr					patcher;		// the patcher -- cached for iterating to make connections
	ObjectPtr					patcherview;	// first view of the top-level patcher (for dirty notifications)
	void						*s_out;          // for the list outlet
	TTPtr						qelem;			// for clumping patcher dirty notifications
	TTAudioGraphPreprocessData	initData;		// for the preprocess method
	t_atom						*output_buffer;    // allocating list for output samples
	void*						clock;			///< clock for pushing the data onto the scheduler from the audio thread
	TTUInt64					sampleCount;
};
typedef Out* OutPtr;


// Prototypes for methods
OutPtr	OutNew(SymbolPtr msg, AtomCount argc, AtomPtr argv);
void	OutFree(OutPtr self);
MaxErr	OutNotify(OutPtr self, SymbolPtr s, SymbolPtr msg, ObjectPtr sender, TTPtr data);
void	OutQFn(OutPtr self);
void	OutAssist(OutPtr self, void* b, long msg, long arg, char* dst);
TTErr	OutReset(OutPtr self, long vectorSize);
TTErr	OutConnect(OutPtr self, TTAudioGraphObjectPtr audioSourceObject, long sourceOutletNumber);
void	OutIterateResetCallback(OutPtr self, ObjectPtr obj);
void	OutIterateSetupCallback(OutPtr self, ObjectPtr obj);
void	OutAttachToPatchlinesForPatcher(OutPtr self, ObjectPtr patcher);
t_int*	OutPerform(t_int* w);
void	OutTick(OutPtr self);
void	OutDsp(OutPtr self, t_signal** sp, short* count);
//MaxErr	OutSetGain(OutPtr self, void* attr, AtomCount argc, AtomPtr argv);


// Globals
static ClassPtr sOutClass;


/************************************************************************************/
// Main() Function

int TTCLASSWRAPPERMAX_EXPORT main(void)
{
	ClassPtr c;

	TTAudioGraphInit();	
	common_symbols_init();

	c = class_new("jcom.unsig≈", (method)OutNew, (method)OutFree, sizeof(Out), (method)0L, A_GIMME, 0);
	
	class_addmethod(c, (method)OutNotify,			"notify",				A_CANT, 0);
	class_addmethod(c, (method)OutReset,			"audio.reset",		A_CANT, 0);
	class_addmethod(c, (method)OutConnect,			"audio.connect",	A_OBJ, A_LONG, 0);
	class_addmethod(c, (method)MaxAudioGraphDrop,	"audio.drop",		A_CANT, 0);
	class_addmethod(c, (method)MaxAudioGraphObject,	"audio.object",		A_CANT, 0);
 	class_addmethod(c, (method)OutDsp,				"dsp",					A_CANT, 0);		
	class_addmethod(c, (method)OutAssist,			"assist",				A_CANT, 0); 
    class_addmethod(c, (method)object_obex_dumpout,	"dumpout",				A_CANT, 0);  
	
	//CLASS_ATTR_FLOAT(c,		"gain", 0,		Out,	gain);
	//CLASS_ATTR_ACCESSORS(c,	"gain",	NULL,	OutSetGain);

	class_dspinit(c);
	class_register(_sym_box, c);
	sOutClass = c;
	return 0;
}


/************************************************************************************/
// Object Creation Method

OutPtr OutNew(SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
    OutPtr		self;
	TTValue		sr(sys_getsr());
 	long		attrstart = attr_args_offset(argc, argv);		// support normal arguments
	//short		i;
	TTValue		v;
	TTErr		err;
   
    self = OutPtr(object_alloc(sOutClass));
    if (self) {
		self->maxNumChannels = 2;		// An initial argument to this object will set the maximum number of channels
		if(attrstart && argv)
			self->maxNumChannels = atom_getlong(argv);

		ttEnvironment->setAttributeValue(kTTSym_sampleRate, sr);
		// setup the output_buffer according to channnel number 
		self->output_buffer = (t_atom *)malloc(self->maxNumChannels * sizeof(t_atom));
		
		v.setSize(2);
		v.set(0, TT("thru"));
		v.set(1, 1); // arg is the number of inlets
		err = TTObjectBaseInstantiate(TT("audio.object"), (TTObjectBasePtr*)&self->audioGraphObject, v);
		//self->audioGraphObject->getUnitGenerator()->setAttributeValue(TT("linearGain"), 1.0);
		
		attr_args_process(self, argc, argv);
		
    	object_obex_store((void*)self, _sym_dumpout, (object*)outlet_new(self, NULL));	// dumpout	
		self->s_out = listout((t_pxobject *)self); // the list outlet
	    dsp_setup((t_pxobject*)self, 1);
		self->clock = clock_new(self, (method)OutTick);
				
		self->qelem = qelem_new(self, (method)OutQFn);
		self->obj.z_misc = Z_NO_INPLACE | Z_PUT_LAST;
	}
	return self;
}

// Memory Deallocation
void OutFree(OutPtr self)
{
	dsp_free((t_pxobject*)self);
	object_free(self->clock);
	if (self->patcherview) {
		object_detach_byptr(self, self->patcherview);
		self->patcherview = NULL;
	}
	if (self->output_buffer)
		free(self->output_buffer);
	
	TTObjectBaseRelease((TTObjectBasePtr*)&self->audioGraphObject);
	qelem_free(self->qelem);
}


/************************************************************************************/
// Methods bound to input/inlets

MaxErr OutNotify(OutPtr self, SymbolPtr s, SymbolPtr msg, ObjectPtr sender, TTPtr data)
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
void OutQFn(OutPtr self)
{
	t_atom result;

	#ifdef DEBUG_NOTIFICATIONS
	object_post(SELF, "patcher dirtied");
	#endif // DEBUG_NOTIFICATIONS
	
	object_method(self->patcher, gensym("iterate"), (method)OutIterateSetupCallback, self, PI_DEEP, &result);

	// attach to all of the patch cords so we will know if one is deleted
	// we are not trying to detach first -- hopefully this is okay and multiple attachments will be filtered (?)
	OutAttachToPatchlinesForPatcher(self, self->patcher);
}


// Method for Assistance Messages
void OutAssist(OutPtr self, void* b, long msg, long arg, char* dst)
{
	if (msg==1)			// Inlets
		strcpy(dst, "multichannel audio connection");		
	else if (msg==2){	// Outlets
		if (arg == 1)
			strcpy(dst, "dumpout");
		else if (arg == 0)
			strcpy(dst, "unsig list");
		//else 
		//	snprintf(dst, 256, "(signal) single-channel output Nr. %ld", arg + 1); 
	}
}

TTErr OutReset(OutPtr self, long vectorSize)
{
	self->hasReset = true;
	self->hasConnections = false;
	return self->audioGraphObject->resetAudio();
}


TTErr OutConnect(OutPtr self, TTAudioGraphObjectPtr audioSourceObject, long sourceOutletNumber)
{
	self->hasConnections = true;
	return self->audioGraphObject->connectAudio(audioSourceObject, sourceOutletNumber);
}


void OutIterateResetCallback(OutPtr self, ObjectPtr obj)
{
	MaxErr err = MAX_ERR_NONE;
	method audioResetMethod = zgetfn(obj, gensym("audio.reset"));
	
	if (audioResetMethod)
		err = (MaxErr)audioResetMethod(obj, self->vectorSize);
}


void OutIterateSetupCallback(OutPtr self, ObjectPtr obj)
{
	MaxErr err = MAX_ERR_NONE;
	method audioSetupMethod = zgetfn(obj, gensym("audio.setup"));
	
	if (audioSetupMethod)
		err = (MaxErr)audioSetupMethod(obj);
}


void OutAttachToPatchlinesForPatcher(OutPtr self, ObjectPtr patcher)
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
			
			OutAttachToPatchlinesForPatcher(self, subpatcher);
		}
		box = jbox_get_nextobject(box);
	}
}


// Perform (signal) Method for generating list outlet
t_int* OutPerform(t_int* w)
{
   	OutPtr		self = (OutPtr)(w[1]);
	TTUInt16	numChannels;
	
	if (!self->obj.z_disabled) {
		if (self->hasConnections) {
			self->audioGraphObject->lockProcessing();
			self->audioGraphObject->preprocess(self->initData);
			self->audioGraphObject->process(self->audioSignal, self->sampleCount);
			self->sampleCount += self->vectorSize;
			self->audioGraphObject->unlockProcessing();
			
			numChannels = TTClip<TTUInt16>(self->maxNumChannels, 0, self->audioSignal->getNumChannelsAsInt());	
			
			for(TTUInt16 channel=0; channel<numChannels; channel++) {
			    atom_setfloat(self->output_buffer+channel, self->audioSignal->getSample(channel, 0));
			}
			self->numChannels = numChannels;
			clock_delay(self->clock, 0);			
			//outlet_list(self->s_out, NULL, numChannels, self->output_buffer); //list output
		}
	}
	
	self->hasReset = false;
	return (w + 2);
	
}

void OutTick(OutPtr self)
{	
	outlet_list(self->s_out, NULL, self->numChannels, self->output_buffer); //list output
}

// DSP Method
void OutDsp(OutPtr self, t_signal** sp, short* count)
{
	//TTUInt16	i; 
	TTUInt16	k=0;
	void		**audioVectors = NULL;
	MaxErr		err;
	long		result = 0;
	
	self->vectorSize = sp[0]->s_n;
	
	#ifdef DEBUG_NOTIFICATIONS
	object_post(SELF, "dsp method called");
	#endif // DEBUG_NOTIFICATIONS
	
	/*	We need to figure out what objects are connected to what inlets to build the graph:
		
		1. Broadcast 'audio.reset' to every object in the patcher, to remove all existing connections.
		2. Broadcast 'audio.setup' to every object in the patcher, to tell objects to then send
			'audio.connect' messages to any objects below them.
		3. When an object received 'audio.connect', then it makes the connection.
		
		At this point, the graph is configured and we just need to execute it.
		We execute the graph from our perform method, which MSP calls once per signal vector.
	 
		5. Crawl the graph from bottom to top, calling the audio graph preprocess method (prepare for process)
		6. Crawl the graph from bottom to top, calling the audio graph process method (calculate the samples)
		7. (Maybe) crawl the graph from bottom to top, calling a audio graph postprocess method
	 
		For steps 1 & 2, we have to traverse thge patcher twice, 
		because we have to clear all connections first, then add connections.
		It won't work to do them both during the same traversal because situations arise
		Where we setup the chain and then it gets reset again by another object 
		(since the order in which we traverse objects is undefined).
	 */ 

	if (!self->hasReset) {
		ObjectPtr	patcher = NULL;
		ObjectPtr	parent = NULL;
		ObjectPtr	patcherview = NULL;

		// first find the top-level patcher
		err = object_obex_lookup(self, gensym("#P"), &patcher);
		parent = patcher;
		while (parent) {
			patcher = parent;
			parent = object_attr_getobj(patcher, _sym_parentpatcher);
		}

		// now iterate recursively from the top-level patcher down through all of the subpatchers
		object_method(patcher, gensym("iterate"), (method)OutIterateResetCallback, self, PI_DEEP, &result);
		object_method(patcher, gensym("iterate"), (method)OutIterateSetupCallback, self, PI_DEEP, &result);
		
		// now let's attach to the patcherview to get notifications about any further changes to the patch cords
		// the patcher 'dirty' attribute is not modified for each change, but the patcherview 'dirty' attribute is
		if (!self->patcherview) {
			patcherview = jpatcher_get_firstview(patcher);
			self->patcherview = patcherview;
			self->patcher = patcher;
			object_attach_byptr_register(self, patcherview, _sym_nobox);			
		}
	}
	
	// now we want to go a step further and attach to all of the patch cords 
	// this is how we will know if one is deleted
	OutAttachToPatchlinesForPatcher(self, self->patcher);

	// Setup the perform method
	//audioVectors = (void**)sysmem_newptr(sizeof(void*) * (self->maxNumChannels + 1));
	audioVectors = (void**)sysmem_newptr(sizeof(void*) * (1));

	audioVectors[k] = self;
	k++;
	
	//self->numChannels = 0;
	/*for (i=1; i <= self->maxNumChannels; i++) {
		self->numChannels++;				
		audioVectors[k] = sp[i]->s_vec;
		k++;
	}*/
	self->numChannels = self->maxNumChannels; //[np]
	self->audioGraphObject->getUnitGenerator()->setAttributeValue(kTTSym_sampleRate, sp[0]->s_sr);
	self->audioGraphObject->resetSampleStamp();
	self->sampleCount = 0;
	
	dsp_addv(OutPerform, k, audioVectors);
	sysmem_freeptr(audioVectors);
	
	self->initData.vectorSize = self->vectorSize;
}
