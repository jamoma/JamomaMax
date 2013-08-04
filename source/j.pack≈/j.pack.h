/* 
 *	in≈
 *	External object for Max/MSP to Provide a source for TTAudioSignals usable by a Jamoma AudioGraph dsp chain.
 *	Copyright © 2008 by Timothy Place
 * 
 * License: This code is licensed under the terms of the "New BSD License"
 * http://creativecommons.org/licenses/BSD/
 */

#include "maxAudioGraph.h"

/** Data Structure for the j.in≈ Max object.
 */
struct Pack {
    t_pxobject				obj;					///< Pointer to Max object struct, this alwasy needs to be the first member of the struct.
	TTAudioGraphObjectPtr	audioGraphObject;		///< Pointer to an embedded Jamoma AudioGraph object serving as a generator for the downstream AudioGraph.
	TTPtr					audioGraphObjectOutlet; ///< Pointer to an embedded Jamoma AudioGraph outlet used to interface sith downstream AudioGraph objects.
	TTUInt32				maxNumChannels;			///< The maximum number of MSP audio channels this object can pack onto an AudioGraph signal, set by an argument at object instantiation time.
	TTUInt32				numChannels;			///< The actual number of channels to use. This is set by the #PackDsp64 method when the MSP processing chain is being compiled, based on what inlets of j.pack≈ that have incoming MSP audio signals connected.
	TTUInt32				vectorSize;				///< The size of audio vectors to process, cached by the DSP method.
};
typedef Pack* PackPtr;


// Prototypes for methods

/** Set up this class as a Max external the first time an object of this kind is instantiated.
 @return				Error message if the object fails to load.
 */
int TTCLASSWRAPPERMAX_EXPORT main(void);


/** Create a new instance of the j.in≈ object.
 @param msg					Message to the new instance at creation time.
 @param argc				The number of arguments to the object at instantiation.
 @param argv				Pointer to an array of atoms containing instantiation arguments.
 @return					Pointer to this instance if successfully instantiated.
 */
PackPtr	PackNew(SymbolPtr msg, AtomCount argc, AtomPtr argv);


/** Called when the object is freed (destroyed), ensuring that memory is properly freed up.
 @param self				Pointer to this instance of j.in≈.
 */
void	PackFree(PackPtr self);


/** Provides assist strings in Max for object inlets and outlets.
 @param self				Pointer to this instance of j.in≈.
 @b							Not used
 @msg						Is this a request for assistance regarding an inlet or outlet?
 @arg						Which inlet or outlet number is the request relating to?
 @dst						Destination that the assistance string is to be copied to.
 */
void	PackAssist(PackPtr self, void* b, long msg, long arg, char* dst);


/** Reset audio for this object.
 @param self				Pointer to this instance of j.in≈.
 */
TTErr	PackReset(PackPtr self, long vectorSize);


/**
 @param self				Pointer to this instance of j.in≈.
 */
TTErr	PackSetup(PackPtr self);


/**
 @param self				Pointer to this instance of j.in≈.
 */
TTErr	PackObject(PackPtr self, TTAudioGraphObjectPtr audioSourceObject);


/**
 @param self				Pointer to this instance of j.in≈.
 */
t_int*	PackPerform(t_int* w);


/** Process audio vectors as 64-bit floating point values.
 @param self				Pointer to this instance of j.in≈.
 */
void	PackDsp64(PackPtr self, ObjectPtr dsp64, short *count, double samplerate, long maxvectorsize, long flags);
//MaxErr	PackSetGain(PackPtr self, void* attr, AtomCount argc, AtomPtr argv);


// Globals
static ClassPtr sInClass;




