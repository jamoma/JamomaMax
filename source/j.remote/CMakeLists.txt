cmake_minimum_required(VERSION 3.0)
project(j.remote)

set(PROJECT_SRCS
${CMAKE_CURRENT_SOURCE_DIR}/j.remote.cpp
${CMAKE_CURRENT_SOURCE_DIR}/../classwrapper/TTModularClassWrapperMax.cpp
)

include(${CMAKE_CURRENT_SOURCE_DIR}/../../Shared/Cmake/MaxExternalCommon.cmake)
