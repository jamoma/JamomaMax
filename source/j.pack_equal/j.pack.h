/** @file
 *
 * @ingroup implementationMaxExternalsAudioGraph
 *
 * @brief pack= : Max external packing several MSP audio signals onto one AudioGraph multichannel audio signal.
 *
 * @details This object functions as a source (generator) for #TTAudioSignal usable by a Jamoma AudioGraph dsp chain.
 *
 * @authors Tim Place, Trond Lossius, Nils Peters
 *
 * @copyright Copyright © 2008 by Timothy Place @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */


#include "MaxAudioGraph.h"

/** Data Structure for the j.pack= Max object.
 */
struct Pack {
    t_pxobject				obj;					///< Pointer to Max object struct, this alwasy needs to be the first member of the struct.
	TTAudioGraphObjectBasePtr	audioGraphObject;		///< Pointer to an embedded Jamoma AudioGraph object serving as a generator for the downstream AudioGraph.
	TTPtr					audioGraphObjectOutlet; ///< Pointer to an embedded Jamoma AudioGraph outlet used to interface sith downstream AudioGraph objects.
	TTUInt32				maxNumChannels;			///< The maximum number of MSP audio channels this object can pack onto an AudioGraph signal, set as an argument at object instantiation time.
	TTUInt32				numChannels;			///< The actual number of channels to use. This is set by the #PackDsp64 method when the MSP processing chain is being compiled, based on what inlets of j.pack= that have incoming MSP audio signals connected.
	TTUInt32				vectorSize;				///< The size of audio vectors to process, cached by the DSP method.
};

typedef Pack* PackPtr;								///< Pointer to a j.pack= instance.


// Prototypes for methods

/** Set up this class as a Max external the first time an object of this kind is instantiated.
 @return				Error message if the object fails to load.
 */
int C74_EXPORT main(void);


/** Create a new instance of the j.in= object.
 @param msg					Message to the new instance at creation time.
 @param argc				The number of arguments to the object at instantiation.
 @param argv				Pointer to an array of atoms containing instantiation arguments.
 @return					Pointer to this instance if successfully instantiated.
 */
PackPtr	PackNew(t_symbol* msg, long argc, t_atom* argv);


/** Called when the object is freed (destroyed), ensuring that memory is properly freed up.
 @param self				Pointer to this instance of j.in=.
 */
void	PackFree(PackPtr self);


/** Provides assist strings in Max for object inlets and outlets.
 @param self				Pointer to this instance of j.in=.
 @b							Not used
 @msg						Is this a request for assistance regarding an inlet or outlet?
 @arg						Which inlet or outlet number is the request relating to?
 @dst						Destination that the assistance string is to be copied to.
 */
void	PackAssist(PackPtr self, void* b, long msg, long arg, char* dst);


/** Reset audio for this object.
 @param self				Pointer to this instance of j.in=.
 @param vectorSize			Not used currently.
 */
TTErr	PackReset(PackPtr self, long vectorSize);


/** This method is used internally by AudioGraph when configuring itself.
 @param self				Pointer to this instance of j.in=.
 */
TTErr	PackSetup(PackPtr self);


/** TODO: Do this method exist at all? It is lacking from j.pack.cpp...
 @param self				Pointer to this instance of j.in=.
 */
TTErr	PackObject(PackPtr self, TTAudioGraphObjectBasePtr audioSourceObject);


/** Performs the actual DSP processing on incomming MSP audio signals, packing them into a multichannel source for AudioGraph.
 @param self				Pointer to this instance of j.in=.
 */
t_int*	PackPerform(t_int* w);


/** Called when MSP is compiling the DSP chain, used to set up audio processing.
 @param self				Pointer to this instance of j.in=.
 @param dsp64
 @param count
 @param samplerate
 @param maxvectorsize
 @param flags
 */
void	PackDsp64(PackPtr self, t_object* dsp64, short *count, double samplerate, long maxvectorsize, long flags);
//t_max_err	PackSetGain(PackPtr self, void* attr, long argc, t_atom* argv);


// Globals
static t_class* sInClass;




