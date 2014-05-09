/** @file
 *
 * @ingroup maxLibrary
 *
 * @brief A base class for Jamoma models
 *
 * @details
 *
 * @authors Théo de la Hogue
 *
 * @copyright © 2013, Théo de la Hogue @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */

#ifndef __TT_MODEL_INFO_H__
#define __TT_MODEL_INFO_H__

#include "TTModularClassWrapperMax.h"

/** A base class for Jamoma models
 */
class TTMODULAR_EXPORT TTModelInfo : public TTObjectBase
{
	TTCLASS_SETUP(TTModelInfo)
    
    TTAddress           mAddress;               ///< ATTRIBUTE : the address of the model (for j.model) or the address of the model to bind (j.view)
    TTSymbol            mClass;                 ///< ATTRIBUTE : the class name of the model
    
    (t_object*)           mObject;                ///< cache the max object
    
    TTAttributePtr      addressAttribute;       ///< cache address attribute for observer notification
    
public:
    
    /** Atribute accessor. Send a filepath to the object and attempt to interface with the file.
     @param     newValue    an absolute address
     @return	TTErr		kTTErrNone
     */
    TTErr setAddress(const TTValue& newValue);
    
    void setAddressReadOnly(TTBoolean readOnly);
    
    /** Open the internal patcher
     @return    TTErr       kTTErrNone
     */
	TTErr InternalOpen();
    
    /** Open the help page
     @return    TTErr       kTTErrNone
     */
	TTErr HelpOpen();
    
    /** Open the reference file
     @return    TTErr       kTTErrNone
     */
    TTErr ReferenceOpen();
    
    /** Write the reference file
     @return    TTErr       kTTErrNone
     */
    TTErr ReferenceWrite();
    
    /** Mute the patcher
     @return    TTErr       kTTErrNone
     */
    TTErr Mute();
	
};

typedef TTModelInfo* TTModelInfoPtr;


#endif // __TT_MODEL_INFO_H__
