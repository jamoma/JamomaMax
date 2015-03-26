cmake_minimum_required(VERSION 3.0)
cmake_policy(SET CMP0037 OLD)

add_definitions( -DAUDIO_EXTERNAL -DJCOM_SEND_TILDE)

project(j.send_tilda)

set(PROJECT_SRCS
  ${CMAKE_CURRENT_SOURCE_DIR}/../j.send/j.send.cpp
)

set(PROJECT_SRCS ${PROJECT_SRCS} $<TARGET_OBJECTS:TTModularClassWrapperMaxAudio>)
include(${CMAKE_CURRENT_SOURCE_DIR}/../../Shared/CMake/MaxExternalCommon.cmake)
