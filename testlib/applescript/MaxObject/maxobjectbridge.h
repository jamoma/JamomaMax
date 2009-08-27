/*
	==============================================================================

	This file is part of the ObjectiveMax Library and Framework
	An Objective-C API for writing Max external objects
	Copyright 2007 by Electrotap, LLC.

	------------------------------------------------------------------------------

	ObjectiveMax can be redistributed and/or modified under the terms of the
	GNU General Public License, as published by the Free Software Foundation;
	either version 2 of the License, or (at your option) any later version.

	ObjectiveMax is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with ObjectiveMax; if not, visit www.gnu.org/licenses or write to the
	Free Software Foundation, Inc., 59 Temple Place, Suite 330, 
	Boston, MA 02111-1307 USA

	------------------------------------------------------------------------------

	If you'd like to release a closed-source product which uses ObjectiveMax, 
	commercial licenses are also available.  Visit 
		http://electrotap.com/ObjectiveMax
	for more information.

	==============================================================================
*/

//#include "ext.h"
//#include "ext_obex.h"
//#include "z_dsp.h"
//#include "commonsyms.h"

#import "MaxObject.h"
#import "MaxAudioSignal.h"

#define MAX_NUM_AUDIO_CHANNELS 32
#define MAXOBJECTBRIDGE_ERR_NO_METHOD_FOUND -1074


/*! 
	@struct			t_maxobject_attrs 
	@abstract		Cache for information about attributes harvested when the class is created.
	@field	offset	Where in the ObjC class is the memory for this attribute value
	@field	size	How big is the memory needed to hold this attribute value
	@field	type	What is the datatype of this attribute using the standard Max symbol representation for types
	@discussion		This structure is used to store attribute information in a hashtab that keeps all of the attr information.
					The hashtab is keyed on the name of the attribute and stored inside of the relevant t_maxobject_class
					structure.
*/
typedef struct _maxobject_attrs{
	unsigned long	offset;
	unsigned long	size;
	t_symbol		*type;
} t_maxobject_attrs;


/*! 
	@struct						t_maxobject_class 
	@abstract					Cache for information about this max class.
	@field	this_max_class		This is Max's t_class pointer that provides the class definition to Max.
	@field	class_attributes	A hashtab of t_maxobject_attrs for this class keyed on the attribute name.
	@field	objcclassname		A standard c-string that is the name of the Objective-C class for this Max external.
	@field	isAudioProcessor	A boolean that indicates whether the class is an audio processing (MSP) class or not.
								This is determined by looking at the Objective-C class for processAudio... or dspMessage... 
								methods.
	@discussion					The MaxObject framework can be used to create multiple Max external classes.  For that reason, 
								we can't just have a single global t_class pointer like a traditional Max external.  
								So we create a set of class info (including the t_class pointer) and store it in this data
								structure.  
					
								This data structure is then written to the g_maxobject_classes hashtab, which is keyed on 
								the name of the max class.
*/
typedef struct _maxobject_class{
	t_class		*this_max_class;
	t_hashtab	*class_attributes;
	char		objcclassname[64];	// this, along with the t_class, should be maintained in a hashtab keyed on the maxclassname
	char		isAudioProcessor;
} t_maxobject_class;


/*! 
	@struct						t_maxobject 
	@abstract					Data structure for the Max external's object instance
	@field	obj					A t_pxobject is used for all instances.  This is because a t_pxobject contains a t_object
								as it's first member, and thus is compatible for both Max and MSP externs.  In regular
								Max externs, the rest of the t_pxobject is simply unused.
	@field	me					This is the Objective-C instance that is wrapped in the Max external.
	@field	maxobject_class		A cached pointer to the class info for doing lookups quickly on class-related information.
	@field	audio_in			If this is an MSP object, then pointers to audio vectors are cached in this array.
	@field	audio_out			If this is an MSP object, then pointers to audio vectors are cached in this array.
	@field	audioInput			Somewhat redunant with audio_in, this is the MaxAudioSignal representation which is passed to the Objective-C class
	@field	audioOutput			Somewhat redunant with audio_out, this is the MaxAudioSignal representation which is passed to the Objective-C class
	@discussion					This data structure is the instance of the Max wrapper object for the Objective-C class.
*/
typedef struct _maxobject{
	t_pxobject			obj;
	MaxObject			*me;
	t_maxobject_class	*maxobject_class;	
	float				*audio_in[MAX_NUM_AUDIO_CHANNELS];
	float				*audio_out[MAX_NUM_AUDIO_CHANNELS];
	MaxAudioSignal		*audioInput;
	MaxAudioSignal		*audioOutput;
} t_maxobject;


// Life-Cycle Prototypes
t_object*	maxobject_new(t_symbol *name, long argc, t_atom *argv);
void		maxobject_free(t_maxobject *x);

// Untyped Method Prototypes
t_max_err	maxobject_int(t_maxobject *x, long value);
t_max_err	maxobject_float(t_maxobject *x, double value);
t_max_err	maxobject_bang(t_maxobject *x);

// Typed (A_GIMME) Method Prototypes
t_max_err	maxobject_anything(t_maxobject *x, t_symbol *s, long argc, t_atom *argv);

// A_CANT Method Prototypes
t_max_err	maxobject_assist(t_maxobject *x, void *b, long msg, long arg, char *dst);
t_max_err	maxobject_dblclick(t_maxobject *x);
t_max_err maxobject_fileusage(t_maxobject *x, void *w);

// Audio Support
t_int *maxobject_perform(t_int *w);
t_max_err maxobject_dsp(t_maxobject *x, t_signal **sp, short *count);

// Attribute Accessors
t_max_err	maxobject_attrset(t_maxobject *x, void *attr, long argc, t_atom *argv);
t_max_err	maxobject_attrget(t_maxobject *x, void *attr, long *argc, t_atom **argv);

// ObjC Utilities
t_max_err	maxobject_callmethod_withnoargs(t_maxobject *x, char *cmethname);
t_max_err	maxobject_calltypedmethod(t_maxobject *x, char *cmethname, t_symbol *s, long argc, t_atom *argv);
t_max_err	maxobject_callmethod(t_maxobject *x, char *cmethname, long argc, t_atom *argv);
t_max_err	maxobject_method(t_maxobject *x, t_symbol *smethname, long argc, t_atom *argv);
t_max_err	maxobject_callmethod_withlong(t_maxobject *x, char *cmethname, long value);

// Shared Globals
extern t_hashtab	*g_maxobject_classes;
