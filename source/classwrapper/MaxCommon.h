/* 
	MaxCommon
	Header used by all Max externals in Jamoma
	Copyright © 2015 by Timothy Place
	
	License: This code is licensed under the terms of the "New BSD License"
	http://creativecommons.org/licenses/BSD/
 */

#pragma once

extern "C" void fileusage_addpackage(void *w, C74_CONST char *name, t_object *subfoldernames);

inline void jamoma_fileusage(void* self, void* w)
{       
       fileusage_addpackage(w, "Jamoma", nullptr);
}
