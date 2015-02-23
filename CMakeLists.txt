cmake_minimum_required(VERSION 3.0)
project(JamomaMax)

if((APPLE AND NOT IOS) OR WIN32)

	if(WIN32 AND CMAKE_BUILD_TYPE STREQUAL "Release")
		add_definitions(-DMAXAPI_USE_MSCRT)
	endif()
	add_subdirectory(library)
	add_subdirectory(source)
endif()
