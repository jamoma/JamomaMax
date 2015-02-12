cmake_minimum_required(VERSION 2.6)
project(j.send)

set(PROJECT_SRCS
${CMAKE_CURRENT_SOURCE_DIR}/j.send.cpp
${CMAKE_CURRENT_SOURCE_DIR}/../classwrapper/TTModularClassWrapperMax.cpp
)

include(${CMAKE_CURRENT_SOURCE_DIR}/../../Shared/Cmake/MaxExternalCommon.cmake)