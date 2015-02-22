cmake_minimum_required(VERSION 3.0)
project(j.parameter_array)

add_definitions(-DARRAY_EXTERNAL)

set(PROJECT_SRCS
	${CMAKE_CURRENT_SOURCE_DIR}/j.parameter_array.cpp
)

set(PROJECT_SRCS ${PROJECT_SRCS} $<TARGET_OBJECTS:TTModularClassWrapperMaxArray>)
include(${CMAKE_CURRENT_SOURCE_DIR}/../../Shared/Cmake/MaxExternalCommon.cmake)
