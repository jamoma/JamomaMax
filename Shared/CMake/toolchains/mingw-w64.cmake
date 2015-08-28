#
# CMake defines to cross-compile to Windows
#

# the name of the target operating system
SET(CMAKE_SYSTEM_NAME Windows)
SET(MINGW-W64 1)
# which compilers to use for C and C++
SET(CMAKE_C_COMPILER   ${CROSS_COMPILER_PATH}/bin/x86_64-w64-mingw32-gcc -m32)
SET(CMAKE_CXX_COMPILER ${CROSS_COMPILER_PATH}/bin/x86_64-w64-mingw32-g++ -m32)
SET(CMAKE_RC_COMPILER  ${CROSS_COMPILER_PATH}/bin/x86_64-w64-mingw32-windres)

# here is the target environment located
SET(CMAKE_FIND_ROOT_PATH ${CROSS_COMPILER_PATH}/x86_64-w64-mingw32
                         ${CROSS_COMPILER_PATH}/local32 )

# adjust the default behaviour of the FIND_XXX() commands:
# search headers and libraries in the target environment, search
# programs in the host environment
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

add_definitions(-DTT_PLATFORM_WIN)
add_definitions(-DTTSTATIC)

install(FILES
${CROSS_COMPILER_PATH}/x86_64-w64-mingw32/lib32/libstdc++-6.dll
${CROSS_COMPILER_PATH}/x86_64-w64-mingw32/lib32/libgcc_s_sjlj-1.dll
${CROSS_COMPILER_PATH}/local32/bin/libxml2-2.dll
        DESTINATION ${JAMOMAPD_INSTALL_FOLDER}/Jamoma)
