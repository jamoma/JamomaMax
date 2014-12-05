cmake_minimum_required(VERSION 2.6)
project(j.out)

add_definitions(-DJMOD_MESSAGE)

set(PROJECT_SRCS
	${CMAKE_CURRENT_SOURCE_DIR}/j.out.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/../classwrapper/TTModularClassWrapperMax.cpp
)

include(${CMAKE_CURRENT_SOURCE_DIR}/../../Shared/Cmake/MaxExternalCommon.cmake)
