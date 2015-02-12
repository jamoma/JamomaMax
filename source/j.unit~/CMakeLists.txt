cmake_minimum_required(VERSION 2.6)
cmake_policy(SET CMP0037 OLD)

project(j.unit_tilda)

set(PROJECT_SRCS
  ${CMAKE_CURRENT_SOURCE_DIR}/j.unit~.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/../classwrapper/TTClassWrapperMax.cpp
)

include(${CMAKE_CURRENT_SOURCE_DIR}/../../Shared/Cmake/MaxExternalCommon.cmake)
