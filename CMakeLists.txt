cmake_minimum_required(VERSION 3.0)
project(JamomaMax)

if((APPLE AND NOT IOS) OR WIN32)
	add_subdirectory(library)
	add_subdirectory(source)
endif()
