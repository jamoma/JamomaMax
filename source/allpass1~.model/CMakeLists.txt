cmake_minimum_required(VERSION 3.0)
cmake_policy(SET CMP0037 OLD)

project(allpass1_tilda.model)

set(PROJECT_SRCS
  ${CMAKE_CURRENT_SOURCE_DIR}/allpass1~.model.cpp
)

set(PROJECT_SRCS ${PROJECT_SRCS} $<TARGET_OBJECTS:TTClassWrapperMax>)
include(${CMAKE_CURRENT_SOURCE_DIR}/../../Shared/CMake/MaxExternalCommon.cmake)