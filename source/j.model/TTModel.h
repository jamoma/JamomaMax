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

#ifndef __TT_MODEL_H__
#define __TT_MODEL_H__

#include "TTModularClassWrapperMax.h"

/** A base class for Jamoma models
 */
class TTMODULAR_EXPORT TTModel : public TTDataObjectBase
{
	TTCLASS_SETUP(TTModel)

    TTSymbol            mClass;                 ///< ATTRIBUTE : the class name of the model
    
public:
    
    /** Open the help page */
	TTErr HelpOpen();
	
};

typedef TTModel* TTModelPtr;


#endif // __TT_MODEL_H__
