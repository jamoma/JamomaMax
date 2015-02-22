cmake_minimum_required(VERSION 3.0)
cmake_policy(SET CMP0037 OLD)

project(j.in_tilda)

set(PROJECT_SRCS
  ${CMAKE_CURRENT_SOURCE_DIR}/../j.in/j.in.cpp
)

set(PROJECT_SRCS ${PROJECT_SRCS} $<TARGET_OBJECTS:TTModularClassWrapperMax>)
include(${CMAKE_CURRENT_SOURCE_DIR}/../../Shared/Cmake/MaxExternalCommon.cmake)
