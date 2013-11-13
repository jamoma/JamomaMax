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
    TTSymbol            mHighlight;             ///< ATTRIBUTE : highlight the j.ui using a template color : none, red, orange, yellow, chartreuseGreen, green, springGreen, cyan, azure, blue, violet, magenta, rose, black, white, jamoma)
   
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
    
    /** Set highlight color
     @param     newValue    a new highlight color
     @return	TTErr		kTTErrNone
     */
    TTErr setHighlight(const TTValue& inputValue);
    
    /** Open the ui panel
     @return	TTErr		kTTErrNone
     */
    TTErr Panel();
};

typedef TTUiInfo* TTUiInfoPtr;


#endif // __TT_UI_INFO_H__
