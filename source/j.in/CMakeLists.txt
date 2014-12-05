cmake_minimum_required(VERSION 2.6)
project(j.in)

add_definitions(-DJMOD_MESSAGE)

set(PROJECT_SRCS
	${CMAKE_CURRENT_SOURCE_DIR}/j.in.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/../classwrapper/TTModularClassWrapperMax.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/../c74support/max-includes/common/commonsyms.cpp
)

include(${CMAKE_CURRENT_SOURCE_DIR}/../../Shared/Cmake/MaxExternalCommon.cmake)
