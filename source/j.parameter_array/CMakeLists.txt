cmake_minimum_required(VERSION 2.6)
project(j.parameter_array)

add_definitions(-DARRAY_EXTERNAL)

set(PROJECT_SRCS
${CMAKE_CURRENT_SOURCE_DIR}/j.parameter_array.cpp
)

include(${CMAKE_CURRENT_SOURCE_DIR}/../../Shared/Cmake/MaxExternalCommon.cmake)
