/** @file
 *
 * @ingroup maxLibrary
 *
 * @brief A base class for j.ui info
 *
 * @details
 *
 * @authors Théo de la Hogue
 *
 * @copyright © 2013, Théo de la Hogue @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */

#ifndef __TT_UI_INFO_H__
#define __TT_UI_INFO_H__

#include "TTModularClassWrapperMax.h"
#include "j.ui.h"

/** A base class for j.ui info
 */
class TTMODULAR_EXPORT TTUiInfo : public TTDataObjectBase
{
	TTCLASS_SETUP(TTUiInfo)
    
    TTValue             mSize;                  ///< ATTRIBUTE : the size of the j.ui
    TTBoolean           mFreeze;                ///< ATTRIBUTE : freeze all j.remote
   
    t_ui*               mObject;                ///< cache the j.ui object
    
public:
    
    /** Attribute accessor.
     @param     newValue    a new horizontal and a vertical size value
     @return	TTErr		kTTErrNone
     */
    TTErr setSize(const TTValue& newValue);
    
    /** Attribute accessor.
     @param     value       current horizontal and a vertical size value
     @return	TTErr		kTTErrNone
     */
    TTErr getSize(TTValue& value);
    
    /** Attribute accessor.
     @param     newValue    a new freeze state
     @return	TTErr		kTTErrNone
     */
    TTErr setFreeze(const TTValue& newValue);
    
    /** Set content background color
     @param     inputValue  a new color
     @param     outputValue nothing
     @return	TTErr		kTTErrNone
     */
    TTErr ColorContentBackground(const TTValue& inputValue, TTValue& outputValue);
    
    /** Set toolbar background color
     @param     inputValue  a new color
     @param     outputValue nothing
     @return	TTErr		kTTErrNone
     */
    TTErr ColorToolbarBackground(const TTValue& inputValue, TTValue& outputValue);
    
    /** Set toolbar text color
     @param     inputValue  a new color
     @param     outputValue nothing
     @return	TTErr		kTTErrNone
     */
    TTErr ColorToolbarText(const TTValue& inputValue, TTValue& outputValue);
    
    /** Set border color
     @param     inputValue  a new color
     @param     outputValue nothing
     @return	TTErr		kTTErrNone
     */
    TTErr ColorBorder(const TTValue& inputValue, TTValue& outputValue);
    
    /** Open the ui panel
     @param     inputValue  a new color
     @param     outputValue nothing
     @return	TTErr		kTTErrNone
     */
    TTErr Panel();
};

typedef TTUiInfo* TTUiInfoPtr;


#endif // __TT_UI_INFO_H__
