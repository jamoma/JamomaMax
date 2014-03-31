/** @file
 *
 * @ingroup implementationMaxLibrary
 *
 * @brief Various utilities for interfacing with Max that are not specific to JamomaModular as such.
 *
 * @details Functions and resources used by Max objects.
 *
 * @authors Tim Place, Théo de la Hogue, Trond Lossius
 *
 * @copyright Copyright © 2013, Tim Place & Théo de la Hogue @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */

#ifndef __JAMOMA_FOR_MAX_H__
#define __JAMOMA_FOR_MAX_H__

#ifdef WIN_VERSION
#pragma warning(disable:4083) //warning C4083: expected 'newline'; found identifier 's'
#endif // WIN_VERSION

#ifndef WIN_VERSION
#include <Carbon/Carbon.h>
#endif

#ifdef TT_PLATFORM_WIN

    #include "windows.h"
    #define JAMOMA_EXPORT_MAXOBJ __declspec(dllexport)

    #ifdef JAMOMA_EXPORTS
        #define JAMOMA_EXPORT __declspec(dllexport)

    #else
    #ifdef JAMOMA_STATIC
        #define JAMOMA_EXPORT

    #else
        #define JAMOMA_EXPORT __declspec(dllimport)

    #endif
    #endif

#else // TT_PLATFORM_MAC

    #define JAMOMA_EXPORT_MAXOBJ __attribute__((visibility("default")))

    #ifdef JAMOMA_EXPORTS
        #define JAMOMA_EXPORT __attribute__((visibility("default")))
    #else
        #define JAMOMA_EXPORT
    #endif

#endif

// Jamoma Core includes
#include "TTFoundationAPI.h"
#include "TTModular.h"

// Max includes
#include "ext.h"
#include "ext_common.h"
#include "ext_obex.h"				// Max Object Extensions (attributes) Header
#include "ext_strings.h"            // String Functions
#include "ext_critical.h"
#include "jpatcher_api.h"
#include "z_dsp.h"
#include "commonsyms.h"             // Common symbols used by the Max 4.5 API

// standard includes
#include <math.h>
#include <stdlib.h>

// Jamoma Max includes
#include "JamomaMaxVersion.h"
#include "JamomaObject.h"
#include "JamomaMaxObjectTypes.h"
#include "JamomaSymbols.h"
#include "JamomaModularForMax.h"


#define JAMOMA "Jamoma"
#define JAMOMA_UNIT_HEIGHT 35.0
#define JAMOMA_UNIT_WIDTH 150.0
#define JAMOMA_MENU_FONT "Arial"
#define JAMOMA_MENU_FONTSIZE 11.0
#define JAMOMA_DEFAULT_FONT "Verdana"
#define JAMOMA_DEFAULT_FONTSIZE 9.0
#define JAMOMA_BUTTON_FONT JAMOMA_DEFAULT_FONT

void JAMOMA_EXPORT jamoma_init(void);


/** Utility function to perform an atom copy.
 @param dst				The destination t_atom.
 @param src				The t_atom to be copied.
 */
void JAMOMA_EXPORT jamoma_atom_copy(t_atom *dst, t_atom *src);


/** Utility function to compare two t_atoms.
 @param type			The	atom type of a1.
 @param a1				A t_atom.
 @param a2				The t_atom to compare against.
 @return				true if the t_atom's are the same.
 */
bool JAMOMA_EXPORT jamoma_atom_compare(t_symbol *type, t_atom *a1, t_atom *a2);


/** Utility for writing newline terminated text to a file with the Max API.
 @param fh				Pointer to the file handler.
 @param the_eof			Pointer to the end of the file.
 @param the _text		Pointer to the text line that we want to write.
 */
void JAMOMA_EXPORT jamoma_file_writeline(t_filehandle *fh, long *the_eof, char *the_text);


/** Compare two strings.
 @param s1				Pointer to the first of the two strings to compare-
 @param s2				Pointer to the second of the two strings to compare.
 @return				true if the strings are the same.
 */
bool JAMOMA_EXPORT jamoma_string_compare(char *s1, char *s2);


/** Load obex externals for use within other externals.
 @param objectname		The object name (i.e. SymbolGen("j.send")).
 @param argc			Number of arguments to the external to be loaded.
 @param argv			Pointer to the first of an array of atom arguments to the external that is to be loaded.
 @param object			If the object is loaded successfully, this will be a pointer to the object pointer.
 @return				true if successfully loaded, otherwise false.
 */
bool JAMOMA_EXPORT jamoma_loadextern(t_symbol *objectname, long argc, t_atom *argv, t_object **object);


/** Translates a Max path+filename combo into a correct absolutepath.
 @param in_path			The path of the file.
 @param in_filename		The name of the file.
 @param out_filepath	The resulting combined path and file
 */
void JAMOMA_EXPORT jamoma_getfilepath(short in_path, char *in_filename, char *out_filepath);

#endif //__JAMOMA_FOR_MAX_H__

