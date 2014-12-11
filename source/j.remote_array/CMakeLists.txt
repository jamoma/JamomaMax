cmake_minimum_required(VERSION 2.6)
project(j.remote_array)

add_definitions(-DARRAY_EXTERNAL)

set(PROJECT_SRCS
${CMAKE_CURRENT_SOURCE_DIR}/j.remote_array.cpp
${CMAKE_CURRENT_SOURCE_DIR}/../classwrapper/TTModularClassWrapperMax.cpp
${CMAKE_CURRENT_SOURCE_DIR}/../c74support/max-includes/common/commonsyms.cpp
)

include(${CMAKE_CURRENT_SOURCE_DIR}/../../Shared/Cmake/MaxExternalCommon.cmake)

