project(j.dbap)

set(PROJECT_SRCS
  ${CMAKE_CURRENT_SOURCE_DIR}/j.dbap.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/j.dbap.h
  ${CMAKE_CURRENT_SOURCE_DIR}/hull2D.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/hull2D.h
)

include(${CMAKE_CURRENT_SOURCE_DIR}/../../Shared/CMake/MaxExternalCommon.cmake)
