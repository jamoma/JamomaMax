cmake_policy(SET CMP0037 OLD)

project(j.vimic~)

set(PROJECT_SRCS
  ${CMAKE_CURRENT_SOURCE_DIR}/Angle.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/Coordinate.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/CrossFade.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/CrossFadeQueue.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/Filter.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/HiMidLow.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/j.vimic~.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/LowPass.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/Mic.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/MicArray.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/Mirror.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/Moveable.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/Room.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/Source.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/ViMic_Engine.cpp
)

set(PROJECT_SRCS ${PROJECT_SRCS} $<TARGET_OBJECTS:TTClassWrapperMax>)
include(${CMAKE_CURRENT_SOURCE_DIR}/../../Shared/CMake/MaxExternalCommon.cmake)