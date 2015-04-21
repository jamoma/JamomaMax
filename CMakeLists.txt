cmake_minimum_required(VERSION 3.0)
project(JamomaMax)

### GetGitDescription ###
include(${CMAKE_CURRENT_SOURCE_DIR}/Shared/CMake/modules/GetGitRevisionDescription.cmake)
get_jamoma_version()
message("git sha : " ${GIT_SHA_SHORT})
configure_file("${CMAKE_CURRENT_SOURCE_DIR}/library/includes/JamomaMaxVersion.h.in" "${CMAKE_CURRENT_SOURCE_DIR}/library/includes/JamomaMaxVersion.h" @ONLY)

if((APPLE AND NOT IOS) OR WIN32)

	if(WIN32 AND CMAKE_BUILD_TYPE STREQUAL "Release")
		add_definitions(-DMAXAPI_USE_MSCRT)
	endif()
	add_subdirectory(library)
	add_subdirectory(source)
endif()
