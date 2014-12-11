cmake_minimum_required(VERSION 2.6)
cmake_policy(SET CMP0037 OLD)

add_definitions( -DAUDIO_EXTERNAL -DJCOM_SEND_TILDE)

project(j.send~)

set(PROJECT_SRCS
  ${CMAKE_CURRENT_SOURCE_DIR}/../j.send/j.send.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/../c74support/max-includes/common/commonsyms.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/../classwrapper/TTModularClassWrapperMax.cpp
)

include(${CMAKE_CURRENT_SOURCE_DIR}/../../Shared/Cmake/MaxExternalCommon.cmake)