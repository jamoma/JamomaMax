/** @file
 *
 * @ingroup audioGraphMax
 *
 * @brief A thin wrapper of Jamoma AudioGraph for use in the Cycling '74 Max/MSP environment.
 *
 * @details Includes an automated class wrapper to make Jamoma DSP object's available as objects for Max/MSP.
 *
 * @authors Timothy Place, Trond Lossius
 *
 * @copyright Copyright © 2008, Timothy Place @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */


#ifndef __TT_MAX_AUDIOGRAPH_H__
#define __TT_MAX_AUDIOGRAPH_H__

#include "ext.h"					// Max Header
#include "ext_obex.h"				// Max Object Extensions (attributes) Header
#include "ext_strings.h"			// String Functions
#include "commonsyms.h"				// Common symbols used by the Max 4.5 API
#include "z_dsp.h"					// MSP Header
#include "jpatcher_api.h"			// Required for patcher traversal code

#include "TTAudioGraphAPI.h"		// Definitions for Jamoma AudioGraph
#include "maxGraph.h"				// Max wrapper for Jamoma Graph. Located in Support/max

// TYPE DEFINITIONS

#ifndef SELF
#define SELF t_object*(self)
#endif

typedef TTErr (*TTValidityCheckFunction)(const TTPtr data);         ///< A type that can be used to store a pointer to a validity checking function.

class MaxAudioGraphWrappedClassOptions;

/**
 Type definition for an AudioGraph class wrapped as a Max external.
 @ingroup typedefs
 */
typedef struct _MaxAudioGraphWrappedClass {
	t_class*							maxClass;					///< The Max class pointer.
	t_symbol*							maxClassName;				///< The name to give the Max class.
	TTSymbol							ttClassName;				///< The name of the class as registered with the Jamoma framework.
	TTValidityCheckFunction				validityCheck;				///< A function to call to validate the context for an object before it is instantiated.
	TTPtr								validityCheckArgument;		///< An argument to pass to the validityCheck function when it is called.
	MaxAudioGraphWrappedClassOptions*	options;					///< Additional configuration options specified for the class.
} MaxAudioGraphWrappedClass;


/** A class representing the options of a #MaxAudioGraphWrappedClass.
 */
class MaxAudioGraphWrappedClassOptions {
protected:
	TTHash*	options;

public:
	
	/** Constructor.
	 */
	MaxAudioGraphWrappedClassOptions()
	{
		options = new TTHash;
	}
	
	
	/** Destructor.
	 */
	virtual ~MaxAudioGraphWrappedClassOptions()
	{
		delete options;
	}
	
	
	/** Append a new option to this class.
	 @param optionName			The name of the option.
	 @param optionValue			The value of the option.
	 * @return					#TTErr error code if the method fails to execute, else #kTTErrNone.
	 */
	TTErr append(const TTSymbol& optionName, const TTValue& optionValue)
	{
		return options->append(optionName, optionValue);
	}
	
	
	/**	Loopup the value of an option. Returns an error if the requested option doesn't exist.
     * @param optionName        Name of the option.
     * @param optionValue       Used to pass back the current value of the option.
	 * @return					Returns an #TTErr error code if the requested option doesn't exist, else it returns #kTTErrNone.
     */
	TTErr lookup(const TTSymbol& optionName, TTValue& optionValue)
	{
		return options->lookup(optionName, optionValue);
	}
	
};
	

/** A pointer to a #MaxAudioGraphWrappedClass.
 @ingroup typedefs
 */
typedef MaxAudioGraphWrappedClass* MaxAudioGraphWrappedClassPtr;


/** A pointer to #MaxAudioGraphWrappedClassOptions.
 @ingroup typedefs
 */
typedef MaxAudioGraphWrappedClassOptions* MaxAudioGraphWrappedClassOptionsPtr;


// FUNCTIONS

/**
 Wrap an AudioGraph class as a Max class. 
 * @param ttClassName           Name of the Jamoma Audio Graph class that will be wrapped.
 * @param maxClassName          Name of the resulting Max external
 * @param c                     Address to a variable to hold the wrapped Max class upon return.
 * @return						#TTErr error code if the method fails to execute, else #kTTErrNone.
 */
TTErr wrapAsMaxAudioGraph(TTSymbol ttClassName, char* maxClassName, MaxAudioGraphWrappedClassPtr* c);


/** 
 This version can be passed a method that is called to make sure it is okay to instantiate the class. 
 This is useful, for example, if you need to have copy-protection for your external.
 * @param ttClassName           Name of the Jamoma Audio Graph class that will be wrapped.
 * @param maxClassName          Name of the resulting Max external.
 * @param c                     Address to a variable to hold the wrapped Max class upon return.
 * @param validityCheck			Pointer to a function that will return a true or false regarding whether or not it is okay to instantiate the object.
 * @return						#TTErr error code if the method fails to execute, else #kTTErrNone.
 */
TTErr wrapAsMaxAudioGraph(TTSymbol ttClassName, char* maxClassName, MaxAudioGraphWrappedClassPtr* c, TTValidityCheckFunction validityCheck);


/** 
 This version can be passed a method that is called to make sure it is okay to instantiate the class. 
 This is useful, for example, if you need to have copy-protection for your external.
 * @param ttClassName           Name of the Jamoma Audio Graph class that will be wrapped.
 * @param maxClassName          Name of the resulting Max external.
 * @param c                     Address to a variable to hold the wrapped Max class upon return.
 * @param validityCheck			Pointer to a function that will return a true or false regarding whether or not it is okay to instantiate the object.
 * @param validityCheckArgument	An argument that will be passed to the validity check function, or NULL if you don't wish to pass an argument.
 * @return						#TTErr error code if the method fails to execute, else #kTTErrNone.
 */
TTErr wrapAsMaxAudioGraph(TTSymbol ttClassName, char* maxClassName, MaxAudioGraphWrappedClassPtr* c, TTValidityCheckFunction validityCheck, TTPtr validityCheckArgument);


// These are versions of the above, but for which additional options can be specified.

/** 
 This version can be passed a method that is called to make sure it is okay to instantiate the class. 
 This is useful, for example, if you need to have copy-protection for your external.
 * @param ttClassName           Name of the Jamoma Audio Graph class that will be wrapped.
 * @param maxClassName          Name of the resulting Max external.
 * @param c                     Address to a variable to hold the wrapped Max class upon return.
 * @param options               Pointer to additional options that will be forwarded to the wrapped object when instantiated.
 * @return						#TTErr error code if the method fails to execute, else #kTTErrNone.
 */
TTErr wrapAsMaxAudioGraph(TTSymbol ttblueClassName, char* maxClassName, MaxAudioGraphWrappedClassPtr* c, MaxAudioGraphWrappedClassOptionsPtr options);


/** 
 This version can be passed a method that is called to make sure it is okay to instantiate the class. 
 This is useful, for example, if you need to have copy-protection for your external.
 * @param ttClassName           Name of the Jamoma Audio Graph class that will be wrapped.
 * @param maxClassName          Name of the resulting Max external.
 * @param c                     Address to a variable to hold the wrapped Max class upon return.
 * @param validityCheck			Pointer to a function that will return a true or false regarding whether or not it is okay to instantiate the object.
 * @param options               Pointer to additional options that will be forwarded to the wrapped object when instantiated.
 * @return						#TTErr error code if the method fails to execute, else #kTTErrNone.
 */
TTErr wrapAsMaxAudioGraph(TTSymbol ttblueClassName, char* maxClassName, MaxAudioGraphWrappedClassPtr* c, TTValidityCheckFunction validityCheck, MaxAudioGraphWrappedClassOptionsPtr options);

/** 
 This version can be passed a method that is called to make sure it is okay to instantiate the class. 
 This is useful, for example, if you need to have copy-protection for your external.
 * @param ttClassName           Name of the Jamoma Audio Graph class that will be wrapped.
 * @param maxClassName          Name of the resulting Max external.
 * @param c                     Address to a variable to hold the wrapped Max class upon return.
 * @param validityCheck			Pointer to a function that will return a true or false regarding whether or not it is okay to instantiate the object.
 * @param validityCheckArgument	An argument that will be passed to the validity check function, or NULL if you don't wish to pass an argument.
 * @param options               Pointer to additional options that will be forwarded to the wrapped object when instantiated.
 */
TTErr wrapAsMaxAudioGraph(TTSymbol ttblueClassName, char* maxClassName, MaxAudioGraphWrappedClassPtr* c, TTValidityCheckFunction validityCheck, TTPtr validityCheckArgument, MaxAudioGraphWrappedClassOptionsPtr options);


/** 
 Method called when a connection from an upstream node is dropped.
 * @param self                  This Max object.
 * @param inletNumber           The inlet of this object who is now loosing a connection.
 * @param sourceMaxObject       The upstream (source) object who is now disconnecting.
 * @param sourceOutletNumber    The outlet of the source object that is now being disconnected.
 * @return						#TTErr error code if the method fails to execute, else #kTTErrNone.
 */
TTErr MaxAudioGraphDrop(t_object* self, long inletNumber, t_object* sourceMaxObject, long sourceOutletNumber);


/**
 Returns a pointer to the Jamoma Audio Graph object that is wrapped by this Max object.
 * @param self                      This Max object.
 * @param returnedAudioGraphObject	Pointer to the wrapped Jamoma Audio Graph object.
 * @return						#TTErr error code if the method fails to execute, else #kTTErrNone.
 */
TTErr MaxAudioGraphObject(t_object* self, TTAudioGraphObjectBasePtr* returnedAudioGraphObject);


/** 
 Method called when an upstream node is connected to this node.
 * @param x						This Max object.
 * @param audioSourceObject     The upstream object/node that is now connecting.
 * @param sourceOutletNumber    What outlet of the upstream object that is now connecting to this object.
 * @return						#TTErr error code if the method fails to execute, else #kTTErrNone.
 */
TTErr MaxAudioGraphConnect(t_object* x, TTAudioGraphObjectBasePtr audioSourceObject, TTUInt16 sourceOutletNumber);


/** 
 Clear the list of source objects from which this object will try to pull audio
 * @param x				This Max object.
 * @param vectorSize    Initial vector size, might be overruled by subsequent process calls.
 * @return						#TTErr error code if the method fails to execute, else #kTTErrNone.
 */
TTErr MaxAudioGraphReset(t_object* x, long vectorSize);


/** 
 Set up fresh connections from this object to nodes that are connected downstream.
 * @param self          This Max object.
 * @return						#TTErr error code if the method fails to execute, else #kTTErrNone.
 */
TTErr MaxAudioGraphSetup(t_object* self);


#endif // __TT_MAX_AUDIOGRAPH_H__

