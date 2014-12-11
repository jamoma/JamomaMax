cmake_minimum_required(VERSION 2.6)
cmake_policy(SET CMP0037 OLD)

project(allpass~.model)

set(PROJECT_SRCS
  ${CMAKE_CURRENT_SOURCE_DIR}/allpass1~.model.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/../c74support/max-includes/common/commonsyms.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/../classwrapper/TTClassWrapperMax.cpp
)

include(${CMAKE_CURRENT_SOURCE_DIR}/../../Shared/Cmake/MaxExternalCommon.cmake)
