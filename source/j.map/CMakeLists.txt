cmake_minimum_required(VERSION 3.0)
project(j.map)

set(PROJECT_SRCS
	${CMAKE_CURRENT_SOURCE_DIR}/j.map.cpp
)

set(PROJECT_SRCS ${PROJECT_SRCS} $<TARGET_OBJECTS:TTModularClassWrapperMax>)
include(${CMAKE_CURRENT_SOURCE_DIR}/../../Shared/CMake/MaxExternalCommon.cmake)
