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
//t_object                  *obj_jamoma_clock = NULL;		// there is only one master clock for the whole system
//t_object                  *obj_jamoma_scheduler = NULL;	// a shared global instance of the scheduler class (there may be others too)
bool                        max5 = false;					///< Is Jamoma currently running in Max 5 or newer?
bool                        max6 = false;					///< Is Jamoma currently running in Max 6 or newer?

TTSymbol					kTTSym_Jamoma;
TTObject                    JamomaApplicationManager;
TTObject                    JamomaApplication;

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
    //char 		fullpath[MAX_PATH_CHARS];
    
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
        
		// Init the Modular library
        TTModularInit();
        
        // prepare a symbol for Jamoma
        kTTSym_Jamoma = TTSymbol(JAMOMA);
        
        // Create an application manager
        JamomaApplicationManager = TTObject("ApplicationManager");
        
        // Create a local application called "Jamoma" and get it back
        err = JamomaApplicationManager.send("ApplicationInstantiateLocal", kTTSym_Jamoma, out);
        
        if (err) {
            TTLogError("Error : can't create Jamoma application \n");
            return;
        }
        else
            JamomaApplication = out[0];
        
        // Edit the path to the JamomaConfiguration.xml file
        strncpy_zero(name, TTFoundationBinaryPath.data(), TTFoundationBinaryPath.size()-6);
        JamomaConfigurationFilePath = name;
        JamomaConfigurationFilePath += "misc/JamomaConfiguration.xml";
        
        // check if the JamomaConfiguration.xml file exists
        strncpy_zero(name, JamomaConfigurationFilePath.data(), MAX_PATH_CHARS);
        if (locatefile_extended(name, &outvol, &outtype, &filetype, 1))
            return error("Jamoma not loaded : can't find %s", JamomaConfigurationFilePath.data());
        
        // JamomaApplication have to read JamomaConfiguration.xml
        TTObject anXmlHandler(kTTSym_XmlHandler);
        anXmlHandler.set(kTTSym_object, JamomaApplication);
        v = TTSymbol(JamomaConfigurationFilePath);
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
		ModelPresetFormat = new TTString("%s.model.xml");
		ViewPresetFormat = new TTString("%s.view.xml");
		HelpPatcherFormat = new TTString("%s.model");
		RefpageFormat = new TTString("%s.model");
		DocumentationFormat = new TTString("%s.model.html");
		
		// Create Required Global Instances
		hash_modules = (t_hashtab*)hashtab_new(0);
		// TODO: Use quittask_install() to set up a destructor for this to free it before Max exits

		// Add Jamoma Key Commands:
		
		// J -- Jamoma: a new object box with "j." in it
		atom_setsym(a+0, SymbolGen("J"));
		atom_setsym(a+1, SymbolGen("patcher"));
		atom_setsym(a+2, SymbolGen("inserttextobj"));
		atom_setsym(a+3, SymbolGen("j."));
		object_method_typed(max, SymbolGen("definecommand"), 4, a, NULL);
				
		// M -- Module: a new object box with "jmod." in it
		atom_setsym(a+0, SymbolGen("M"));
		atom_setsym(a+1, SymbolGen("patcher"));
		atom_setsym(a+2, SymbolGen("inserttextobj"));
		atom_setsym(a+3, SymbolGen("jmod."));
		object_method_typed(max, SymbolGen("definecommand"), 4, a, NULL);
        		
		// I -- Input: a new audio input module
		object_method_parse(max, SymbolGen("definecommand"), (char*)"I patcher insertobj bpatcher @name input~.module.maxpat @args input~", NULL);
				
		// O -- Output: a new audio output module	
		object_method_parse(max, SymbolGen("definecommand"), (char*)"O patcher insertobj bpatcher @name output~.module.maxpat @args output~", NULL);
		
		// B -- BPatcher: a new module in a bpatcher
		object_method_parse(max, SymbolGen("definecommand"), (char*)"B patcher inserttextobj \"bpatcher @name .module @args myModule\"", NULL);		

		// D -- Demo: a new module in a bpatcher, but with the args reverse which is handy for super-fast demos when you don't care about the OSC name
		object_method_parse(max, SymbolGen("definecommand"), (char*)"D patcher inserttextobj \"bpatcher @name .module\"", NULL);		

		// X -- Continuous Mapper module
		object_method_parse(max, SymbolGen("definecommand"), (char*)"X patcher insertobj bpatcher @name mapperContinuous.model.maxpat @args mapper", NULL);		
		
		// !!!! --- x is defined here to work around a 'bug' in the Max Toolbox b13 ( http://code.google.com/p/maxtoolbox/downloads/list )
		object_method_parse(max, SymbolGen("definecommand"), (char*)"x patcher nothing", NULL);		
		
		//definecommandinstructions, are unspooirted in max5 and gives anoying error messages 
		if (max6){
			// J -- Jamoma: a new object box with "j." in it
			atom_setsym(a+0, SymbolGen("patcher"));
			atom_setsym(a+1, SymbolGen("J"));
			atom_setsym(a+2, SymbolGen("j. object"));
			object_method_typed(max, SymbolGen("definecommandinstructions"), 3, a, NULL);
			// M -- Module: a new object box with "jmod." in it
			atom_setsym(a+0, SymbolGen("patcher"));
			atom_setsym(a+1, SymbolGen("M"));
			atom_setsym(a+2, SymbolGen("jmod. object"));
			object_method_typed(max, SymbolGen("definecommandinstructions"), 3, a, NULL);
			// I -- Input: a new audio input module
			atom_setsym(a+0, SymbolGen("patcher"));
			atom_setsym(a+1, SymbolGen("I"));
			atom_setsym(a+2, SymbolGen("jmod.input~"));
			object_method_typed(max, SymbolGen("definecommandinstructions"), 3, a, NULL);
			// O -- Output: a new audio output module
			atom_setsym(a+0, SymbolGen("patcher"));
			atom_setsym(a+1, SymbolGen("O"));
			atom_setsym(a+2, SymbolGen("jmod.output~"));
			object_method_typed(max, SymbolGen("definecommandinstructions"), 3, a, NULL);	
			// B -- BPatcher: a new module in a bpatcher
			atom_setsym(a+0, SymbolGen("patcher"));
			atom_setsym(a+1, SymbolGen("B"));
			atom_setsym(a+2, SymbolGen("bpatcher @name jmod. @args myModule"));
			object_method_typed(max, SymbolGen("definecommandinstructions"), 3, a, NULL);		
			// D -- Demo: a new module in a bpatcher,
			atom_setsym(a+0, SymbolGen("patcher"));
			atom_setsym(a+1, SymbolGen("D"));
			atom_setsym(a+2, SymbolGen("bpatcher @name jmod."));
			object_method_typed(max, SymbolGen("definecommandinstructions"), 3, a, NULL);
			// X -- Continuous Mapper module
			atom_setsym(a+0, SymbolGen("patcher"));
			atom_setsym(a+1, SymbolGen("X"));
			atom_setsym(a+2, SymbolGen("jmod.mapperContinuous"));
			object_method_typed(max, SymbolGen("definecommandinstructions"), 3, a, NULL);	
		}
		
		// now the jamoma object
		{
			t_symbol *jamomaSymbol = SymbolGen("jamoma");
		
			jamoma_object_initclass();
			jamomaSymbol->s_thing = jamoma_object_new();
		}
		
		post("Jamoma (build %s)                        Version %s | jamoma.org", JAMOMA_MAX_REV, JAMOMA_MAX_VERSION);

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

void jamoma_file_writeline(t_filehandle *fh, long *the_eof, const char *the_text)
{
	char		tempstring[4096];
	short		err = 0;
	t_ptr_size	len = 0;
	
	strcpy(tempstring, the_text);
	strcat(tempstring, "\n");
	len = strlen(tempstring);
	err = sysfile_write(*fh, &len, &tempstring);
	if (err) {
		error("jamoma: sysfile_write error (%d)", err);
		return;
	}
	*the_eof = *the_eof + len;
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

// Function the translates a Max path+filename combo into a correct absolutepath
// TODO: remove this function once we've completed the transition to Max5, as path_topathname() is fixed for Max5
void jamoma_getfilepath(short in_path, char *in_filename, char *out_filepath)
{
	char	path[4096];
	
	path_topathname(in_path, in_filename, path);
    
#ifdef MAC_VERSION
	char *temppath;
	temppath = strchr(path, ':');
	*temppath = '\0';
	temppath += 1;
    
	// at this point temppath points to the path after the volume, and out_filepath points to the volume
	sprintf(out_filepath, "/Volumes/%s%s", path, temppath);
#else // WIN_VERSION
	strcpy(out_filepath, path);
#endif
}


