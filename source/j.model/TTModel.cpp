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

#include "TTModel.h"

#define thisTTClass			TTModel
#define thisTTClassName		"Model"
#define thisTTClassTags		"model"

TT_MODULAR_CONSTRUCTOR,
mClass(kTTSymEmpty)
{
    TT_ASSERT("Correct number of args to create TTModel", arguments.size() == 0);
    
    addAttribute(Class, kTypeSymbol);
    
    addMessage(HelpOpen);
}


TTModel::~TTModel()
{
    ;
}

TTErr TTModel::HelpOpen()
{
	// opening the module helpfile (no help file dedicated for model or view)
	if (mClass != kTTSymEmpty) {
		
		SymbolPtr helpfileName;
		jamoma_edit_filename(*HelpPatcherFormat, gensym((char*)mClass.c_str()), &helpfileName);
		classname_openhelp((char*)helpfileName->s_name);
	}
}