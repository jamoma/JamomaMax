/*
 * jamoma~
 * Multichannel gain control
 * By Tim Place, Copyright © 2005
 *
 * License: This code is licensed under the terms of the "New BSD License"
 * http://creativecommons.org/licenses/BSD/
 */

#include "TTClassWrapperMax.h"
//#include "ext_hashtab.h"
//#include "ext.h"						// Max Header
//#include "z_dsp.h"						// MSP Header
//#include "ext_strings.h"				// String Functions
//#include "commonsyms.h"					// Common symbols used by the Max 4.5 API
//#include "ext_obex.h"					// Max Object Extensions (attributes) Header

#include "TTDSP.h"
//#define MAX_NUM_CHANNELS 32

/*
// Data Structure for this object
typedef struct _jamoma {
	t_pxobject 			obj;
	TTAudioObject*	ugen;
	TTAudioSignal*	signalIn;
	TTAudioSignal*	signalOut;
	TTUInt16				numChannels;
	char						attrBypass;			// toggle 1 = bypass
} t_jamoma;
*/

// Prototypes for methods
ObjectPtr	jamoma_new(SymbolPtr s, AtomCount argc, AtomPtr argv);
ObjectPtr	wrappedClass_new(SymbolPtr name, AtomCount argc, AtomPtr argv);
void		wrappedClass_free(WrappedInstancePtr x);
//void			jamoma_free(t_jamoma *x);
//void			jamoma_dsp64(t_jamoma *x, t_object *dsp64, short *count, double samplerate, long maxvectorsize, long flags);
//void			jamoma_assist(t_jamoma *x, void *b, long m, long a, char *s);

//t_max_err	attr_set_bypass(t_jamoma *x, void *attr, long argc, t_atom *argv);


// Globals
static ClassPtr		s_jamoma_class;
static t_hashtab*	s_jamoma_class_hash = NULL;


/************************************************************************************/
// Define our class

int TTCLASSWRAPPERMAX_EXPORT main(void)
{
	ClassPtr c = class_new("jamoma~", (method)jamoma_new, (method)wrappedClass_free, sizeof(WrappedInstance), (method)0L, A_GIMME, 0);

	TTDSPInit();
	common_symbols_init();

//	class_addmethod(c, (method)jamoma_dsp64,			"dsp64", A_CANT, 0);
//	class_addmethod(c, (method)object_obex_dumpout, 	"dumpout", A_CANT,0);
//	class_addmethod(c, (method)jamoma_assist, 			"assist", A_CANT, 0L);

//	CLASS_ATTR_CHAR(c,		"bypass",	0,		t_jamoma,	attrBypass);
//	CLASS_ATTR_ACCESSORS(c,	"bypass",	NULL,	attr_set_bypass);

	// Setup our class to work with MSP
	class_dspinit(c);

	// Finalize our class
	class_register(CLASS_BOX, c);
	s_jamoma_class = c;
	return 0;
}


/************************************************************************************/
// Object Life

// Create
ObjectPtr jamoma_new(SymbolPtr s, AtomCount argc, AtomPtr argv)
{
	int				attrstart = attr_args_offset(argc, argv);
	int				i = 0;
	int				channelCount = 2;
	SymbolPtr		className = gensym("gain");
//	t_class*		maxClass = NULL;
	WrappedClassPtr	classWrapper = NULL;
	char			maxClassName[256];

	if (!attrstart) {
		error("must specify a jamoma class as the first argument");
		return NULL;
	}

	while (attrstart--) {
		if (atom_gettype(argv+i) == A_LONG)
			channelCount = atom_getlong(argv+i);
		else if (atom_gettype(argv+i) == A_SYM)
			className = atom_getsym(argv+i);
		i++;
	}
	
	snprintf(maxClassName, 256, "jamoma.%s~", className->s_name);

	if (!s_jamoma_class_hash)
		s_jamoma_class_hash = hashtab_new(0);
	hashtab_lookup(s_jamoma_class_hash, className, (t_object**)&classWrapper);

	if (!classWrapper) {
		wrapTTClassAsMaxClass(className->s_name, maxClassName, &classWrapper);
		hashtab_store(s_jamoma_class_hash, className, ObjectPtr(classWrapper));
	}

	return wrappedClass_new(gensym(maxClassName), argc-1, argv+1);
}

