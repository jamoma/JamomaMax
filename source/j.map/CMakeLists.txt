cmake_minimum_required(VERSION 2.6)
project(j.map)

add_definitions(-DJMOD_MESSAGE)

set(PROJECT_SRCS
${CMAKE_CURRENT_SOURCE_DIR}/j.map.cpp
)

include(${CMAKE_CURRENT_SOURCE_DIR}/../../Shared/Cmake/MaxExternalCommon.cmake)
