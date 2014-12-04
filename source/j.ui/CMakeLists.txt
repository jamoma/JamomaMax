cmake_minimum_required(VERSION 2.6)
project(j.ui)

set(PROJECT_SRCS
${CMAKE_CURRENT_SOURCE_DIR}/j.ui.cpp
${CMAKE_CURRENT_SOURCE_DIR}/j.ui.internals.cpp
${CMAKE_CURRENT_SOURCE_DIR}/j.ui.presets.cpp
${CMAKE_CURRENT_SOURCE_DIR}/TTUiInfo.cpp
)

include(${CMAKE_CURRENT_SOURCE_DIR}/../../Shared/Cmake/MaxExternalCommon.cmake)
