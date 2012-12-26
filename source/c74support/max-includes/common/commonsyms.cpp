// This wraps commonsyms.c as a C++ file to avoid dumb warnings in Xcode

#ifndef WIN_VERSION
#include <Carbon/Carbon.h>
#endif

#include "commonsyms.c"
