cmake_minimum_required(VERSION 2.6)
project(j.message_array)

add_definitions(-DJMOD_MESSAGE)
add_definitions(-DARRAY_EXTERNAL)

set(PROJECT_SRCS
	${CMAKE_CURRENT_SOURCE_DIR}/../j.parameter_array/j.parameter_array.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/../classwrapper/TTModularClassWrapperMax.cpp
)

include(${CMAKE_CURRENT_SOURCE_DIR}/../../Shared/Cmake/MaxExternalCommon.cmake)
