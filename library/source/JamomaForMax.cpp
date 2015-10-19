/** @file
 *
 * @ingroup implementationMaxLibrary
 *
 * @brief Jamoma For Max Shared Library
 *
 * @details Functions and resources used by Max objects.
 *
 * @authors Tim Place, Théo de la Hogue, Trond Lossius
 *
 * @copyright Copyright © 2013, Tim Place & Théo de la Hogue @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */

#include "JamomaForMax.h"

// statics and globals
static long                 initialized = false;			///< Global variabel indicating whether Jamoma has been initiated or not.
static t_hashtab            *hash_modules = NULL;			///< A hashtab of all modules (j.hubs) currently instantiated

bool                        max5 = false;					///< Is Jamoma currently running in Max 5 or newer?
bool                        max6 = false;					///< Is Jamoma currently running in Max 6 or newer?

TTSymbol					kTTSym_Max;
TTObject                    MaxApplicationManager;
TTObject                    MaxApplication;

TTRegex*					ttRegexForJmod = NULL;
TTRegex*					ttRegexForJcom = NULL;
TTRegex*					ttRegexForModel = NULL;
TTRegex*					ttRegexForModule = NULL;
TTRegex*					ttRegexForView = NULL;
TTRegex*					ttRegexForMaxpat = NULL;
TTRegex*					ttRegexForMaxhelp = NULL;
TTRegex*					ttRegexForBracket = NULL;

TTString*					ModelPatcherFormat = NULL;
TTString*					ModelPresetFormat = NULL;
TTString*					ViewPresetFormat = NULL;
TTString*					HelpPatcherFormat = NULL;
TTString*					RefpageFormat = NULL;
TTString*					DocumentationFormat = NULL;

/************************************************************************************/
// Init the framework

void jamoma_init(void)
{
    short		outvol = 0;
    t_fourcc	outtype, filetype = 'TEXT';
    char        name[MAX_PATH_CHARS];
    
	if (!initialized) {
        
		t_object	*max = SymbolGen("max")->s_thing;
        TTString    JamomaConfigurationFilePath;
		t_atom		a[4];
		TTValue		v, out;
        TTErr       err;
 
		if (maxversion() >= 0x0519)
			max5 = true;
        
		if (maxversion() >= 0x0600)
			max6 = true;
        
		// Initialize the Modular library
        TTModularInit();
        
#ifdef TTSCORE_IMPORT
        // Initialize the Score framework
        TTScoreInit();
#endif
        
        // Prepare a symbol for Max application
        kTTSym_Max = TTSymbol("Max");
        
        // Create an application manager
        MaxApplicationManager = TTObject("ApplicationManager");
        
        // Create a local application called "Max" and get it back
        err = MaxApplicationManager.send("ApplicationInstantiateLocal", kTTSym_Max, out);
        
        if (err) {
            TTLogError("Error : can't create Jamoma application \n");
            return;
        }
        else
            MaxApplication = out[0];

        if (locatefile_extended("JamomaConfiguration.xml", &outvol, &outtype, &filetype, 1))
            return error("Jamoma not loaded : can't find %s", JamomaConfigurationFilePath.data());

        // MaxApplication have to read JamomaConfiguration.xml
        TTObject anXmlHandler(kTTSym_XmlHandler);
        anXmlHandler.set(kTTSym_object, MaxApplication);
        v = TTSymbol(name);
        anXmlHandler.send(kTTSym_Read, v, out);

		// Initialize common symbols
		common_symbols_init();
		jamomaSymbolsInit();
		
		// Initialize common regex
		ttRegexForJmod = new TTRegex("(jmod.)");
		ttRegexForJcom = new TTRegex("(j\\.)");
		ttRegexForModel = new TTRegex("(.model)");
		ttRegexForModule = new TTRegex("(.module)");
		ttRegexForView = new TTRegex("(.view)");
		ttRegexForMaxpat = new TTRegex("(.maxpat)");
		ttRegexForMaxhelp = new TTRegex("(.maxhelp)");
		ttRegexForBracket = new TTRegex("\\[(\\d|\\d\\d|\\d\\d\\d)\\]");	// parse until 999
		
		ModelPatcherFormat = new TTString("%s.model.maxpat");
		ModelPresetFormat = new TTString("%s.model.presets.txt");
		ViewPresetFormat = new TTString("%s.view.presets.txt");
		HelpPatcherFormat = new TTString("%s.model");
		RefpageFormat = new TTString("%s.model");
		DocumentationFormat = new TTString("%s.model.html");
		
		// Create Required Global Instances
		hash_modules = (t_hashtab*)hashtab_new(0);
		// TODO: Use quittask_install() to set up a destructor for this to free it before Max exits

		// Add Jamoma Key Commands
		
		// J -- Jamoma: a new object box with "j." in it
		atom_setsym(a+0, SymbolGen("k"));
		atom_setsym(a+1, SymbolGen("patcher"));
		atom_setsym(a+2, SymbolGen("inserttextobj"));
		atom_setsym(a+3, SymbolGen("j."));
		object_method_typed(max, SymbolGen("definecommand"), 4, a, NULL);
				
//		// M -- Module: a new object box with ".model" in it
//		atom_setsym(a+0, SymbolGen("M"));
//		atom_setsym(a+1, SymbolGen("patcher"));
//		atom_setsym(a+2, SymbolGen("inserttextobj"));
//		atom_setsym(a+3, SymbolGen(".model"));
//		object_method_typed(max, SymbolGen("definecommand"), 4, a, NULL);
//        
		
//		// B -- BPatcher: a new module in a bpatcher
//		object_method_parse(max, SymbolGen("definecommand"), (char*)"B patcher inserttextobj \"bpatcher @name .module @args myModule\"", NULL);		

//		// D -- Demo: a new module in a bpatcher, but with the args reverse which is handy for super-fast demos when you don't care about the OSC name
//		object_method_parse(max, SymbolGen("definecommand"), (char*)"D patcher inserttextobj \"bpatcher @name .module\"", NULL);		

//		// X -- Continuous Mapper module
//		object_method_parse(max, SymbolGen("definecommand"), (char*)"X patcher insertobj bpatcher @name mapper.module.maxpat @args mapper", NULL);
				
		// now the jamoma object
		{
			t_symbol *jamomaSymbol = SymbolGen("jamoma");
		
			jamoma_object_initclass();
			jamomaSymbol->s_thing = jamoma_object_new();
		}
		
		post("Jamoma  %s  |  build %s", JAMOMA_MAX_VERSION, JAMOMA_MAX_REV );

		initialized = true;
	}
}

#pragma mark -
#pragma mark Utilities

// Copying all of the elements should be faster than branching and copying one element
//	(that's the theory anyway...)
void jamoma_atom_copy(t_atom *dst, t_atom *src)
{
	//	memcpy(dst, src, sizeof(t_atom));
	sysmem_copyptr(src, dst, sizeof(t_atom));
}

bool jamoma_atom_compare(t_symbol *type, t_atom *a1, t_atom *a2)
{
	if (!a1 || !a2)
		return 0;
    
	if (type == jps_decimal) {				// float is first so that it gets process the most quickly
		if (atom_getfloat(a1) == atom_getfloat(a2))
			return 1;
	}
	else if ((type == jps_integer) || (type == jps_boolean)) {
		if (atom_getlong(a1) == atom_getlong(a2))
			return 1;
	}
	else if (type == jps_string) {
		if (atom_getsym(a1) == atom_getsym(a2))
			return 1;
	}
	// type array should be checked here as well.  If type == array and this function is called
	// it means we are dealing with a list of length 1, so we only need to compare one atom anyway.
	else if ((type == jps_decimalArray) || (type == jps_array)) {
		if (a1->a_w.w_float == a2->a_w.w_float)
			return 1;
	}
	else if (type == jps_integerArray) {
		if (a1->a_w.w_long == a2->a_w.w_long)
			return 1;
	}
	else if (type == jps_generic){
		// note that if the two are of different types, then they are obviously not the same
		if ((a1->a_type == A_LONG) && (a2->a_type == A_LONG)) {
			if (a1->a_w.w_long == a2->a_w.w_long)
				return 1;
		}
		else if ((a1->a_type == A_FLOAT) && (a2->a_type == A_FLOAT)) {
			if (a1->a_w.w_float == a2->a_w.w_float)
				return 1;
		}
		else if ((a1->a_type == A_SYM) && (a2->a_type == A_SYM)) {
			if (a1->a_w.w_sym == a2->a_w.w_sym)
				return 1;
		}
	}
	else
		error("atom_compare: cannot do comparison on this data type");
	return 0;
}

// Compare Strings: Is s2 after s1 in alphabetical order?
bool jamoma_string_compare(char *s1, char *s2)
{
	short i;
	short len1 = strlen(s1);
	short len2 = strlen(s2);
	bool result = false;
	bool keepgoing = true;
	
	if (len2 < len1)
		len1 = len2;	// only compare the characters of the short string
    
	for (i =0 ; i < len1 && keepgoing; i++) {
		if (s1[i] < s2[i]) {
			result = true;
			keepgoing = false;
		}
		else if (s1[i] > s2[i])
			keepgoing = false;
	}
	return result;
}

// Load an external for internal use
// returns true if successful
bool jamoma_loadextern(t_symbol *objectname, long argc, t_atom *argv, t_object **object)
{
	t_class 	*c = NULL;
	t_object	*p = NULL;
    
	c = class_findbyname(jps_box, objectname);
	if (!c) {
		p = (t_object *)newinstance(objectname, 0, NULL);
		if (p) {
			c = class_findbyname(jps_box, objectname);
			freeobject(p);
			p = NULL;
		}
		else {
			error("jamoma: could not load extern (%s) within the core", objectname->s_name);
			return false;
		}
	}
    
	if (*object != NULL) {			// if there was an object set previously, free it first...
		object_free(*object);
		*object = NULL;
	}
    
	*object = (t_object *)object_new_typed(CLASS_BOX, objectname, argc, argv);
	return true;
}


