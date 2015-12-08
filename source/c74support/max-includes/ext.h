#ifndef _EXT_H_
#define _EXT_H_

#define C74_MAX_SDK_VERSION 0x0610

#include <stdarg.h>

#if !defined(WIN_VERSION) && !defined(MAC_VERSION)
#define MAC_VERSION 1 // we'll assume that if we aren't requesting the windows version, that we build the mac version(s) of the product
#endif  // WIN_VERSION

#include "ext_common.h"

#ifdef WIN_VERSION
#define C74_EXPORT __declspec(dllexport) 
#else // MAC_VERSION
#define C74_EXPORT __attribute__((visibility("default")))
#endif

// include max_types before ext_prefix to get C74_X64 definition
#include "max_types.h"		// core type definitions
#include "ext_prefix.h"	

#include "ext_mess.h"

#define clock_free freeobject
#define binbuf_free freeobject
#define wind_free freeobject

#define ASSIST_INLET 1
#define ASSIST_OUTLET 2

/**
	This macro being defined means that getbytes and sysmem APIs for memory management are unified.
	This is correct for Max 5, but should be commented out when compiling for old max targets.
	@ingroup memory
*/
#define MM_UNIFIED

#include "ext_maxtypes.h"
#include "ext_byteorder.h"

#include "ext_sysmem.h"
#include "ext_sysfile.h"
#include "ext_systime.h"
#include "ext_expr.h"
#include "ext_path.h"

#include "ext_wind.h"

#include "ext_proto.h"

#include "ext_atomarray.h"
#include "ext_atombuf.h"
#include "ext_obstring.h"
#include "ext_hashtab.h"
#include "ext_dictionary.h"
#include "ext_obex_util.h"
#include "commonsyms.h"
#include "ext_strings.h"
#include "ext_obex.h"
#include "ext_systhread.h"
#include "ext_drag.h"
#include "jpatcher_api.h"
#include "ext_charset.h"

// the old post() and error() functions should be avoided since their names are generic and
// could be overloaded by earlier-loading frameworks/dlls in the plugin context.
// for now, we simply redefine post() and error() usage to the object_ variation. See #4779.
#define post(...)	object_post(NULL, __VA_ARGS__)
#define error(...)	object_error(NULL, __VA_ARGS__)

#endif /* _EXT_H_ */
