/** @file
 *
 * @ingroup modularMax
 *
 * @brief External for Jamoma: jcom.folder - Perform operations on folders in the filesystem.
 *
 * @details
 *
 * @authors Tim Place, Trond Lossius
 *
 * @copyright Copyright © 2009 by Tim Place @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */

 
#include "Jamoma.h"

typedef struct _folder {
	t_object	obj;
} t_folder;

// Prototypes
void	 *folder_new(t_symbol *msg, short argc, t_atom *argv);
void	folder_assist(t_folder *x, void *b, long msg, long arg, char *dst);
void	folder_makedir(t_folder *x, t_symbol *path);
void	folder_copy(t_folder *x, t_symbol *srcpath, t_symbol *dstpath);



// Class Globals
t_class *folder_class;


/************************************************************************************/
// Main() Function
int JAMOMA_EXPORT_MAXOBJ main(void)

{	
	jamoma_init();
	common_symbols_init();
	
	t_class *c = class_new("jcom.folder",(method)folder_new, (method)0L, sizeof(t_folder), (method)0L, A_GIMME, 0);
	
	class_addmethod(c, (method)folder_makedir,		"make",		A_SYM, 0);
	class_addmethod(c, (method)folder_assist, 		"assist",	A_CANT, 0);
	class_addmethod(c, (method)stdinletinfo,		"inletinfo",A_CANT, 0);
	class_addmethod(c, (method)folder_copy,			"copy",		A_SYM, A_SYM, 0); 

	// Finalize our class
	class_register(CLASS_BOX, c);
	folder_class = c;
	
	return 0;
}


/************************************************************************************/
// Object Creation Method

void *folder_new(t_symbol *msg, short argc, t_atom *argv)
{
	t_folder *x;
		
	x = (t_folder *)object_alloc(folder_class);
	if (x) {
		object_obex_store((void *)x, _sym_dumpout, (object *)outlet_new(x,NULL));

    	attr_args_process(x,argc,argv);
    }
 	return (x);
}



/************************************************************************************/
// Methods bound to input/inlets

// Method for Assistance Messages
void folder_assist(t_folder *x, void *b, long msg, long arg, char *dst)
{
	if (msg==1) 		// Inlets
		strcpy(dst, "(int/symbol/list) Input");
	else if (msg==2) { 	// Outlets
		switch(arg) {
			case 0: strcpy(dst, "dumpout"); break;
		}
	}
}



void folder_domakedir(t_folder *x, t_symbol *s, long argc, t_atom *argv)
{
	short	path = 0;				// parent folder, which we supply
	short	createdPath = 0;		// the new folder after it is created
	char	*folderName;			// the name of the new folder
	char	fullpath[4096];
	short	err = 0;
	char	temp[256];
	
	path_nameconform(s->s_name, fullpath, PATH_STYLE_MAX, PATH_TYPE_ABSOLUTE);
	folderName = strrchr(fullpath, '/');
	
	if (folderName) {
		*folderName = 0;
		folderName++;
		
		err = path_frompathname(fullpath, &path, temp);
		if (!err)
			err = path_createfolder(path, folderName, &createdPath);
		if (err)
			object_error((t_object*)x, "error %hd trying to create folder", err);
	}
	object_obex_dumpout(x, _sym_bang, 0, NULL);
}

void folder_makedir(t_folder *x, t_symbol *path)
{
	defer(x, (method)folder_domakedir, path, 0, 0);
}


void folder_docopy(t_folder *x, t_symbol *srcin, long argc, t_atom *argv)
{
	t_symbol*	dstin = atom_getsym(argv);
	char		srcname[MAX_PATH_CHARS];
	short		srcpath = 0;
	char		srcfilename[MAX_FILENAME_CHARS];
	char		dstname[MAX_PATH_CHARS];
	short		dstpath = 0;
	char		dstfilename[MAX_FILENAME_CHARS];
	short		newpath = 0;
	char*		tempstr = NULL;
	
	strncpy_zero(srcname, srcin->s_name, MAX_PATH_CHARS);
	path_frompathname(srcname, &srcpath, srcfilename);

	strncpy_zero(dstname, dstin->s_name, MAX_PATH_CHARS);
	tempstr = strrchr(dstname, '/');
	*tempstr = 0;
	tempstr++;
	path_frompathname(dstname, &dstpath, dstfilename);
	if (tempstr)
		strncpy_zero(dstfilename, tempstr, MAX_FILENAME_CHARS);

	if (!srcfilename[0])
		path_copyfolder(srcpath, dstpath, dstfilename, true, &newpath);
	else
		path_copyfile(srcpath, srcfilename, dstpath, dstfilename);
	object_obex_dumpout(x, _sym_bang, 0, NULL);
}

void folder_copy(t_folder *x, t_symbol *srcpath, t_symbol *dstpath)
{
	t_atom a;
	
	atom_setsym(&a, dstpath);
	defer(x, (method)folder_docopy, srcpath, 1, &a);
}



