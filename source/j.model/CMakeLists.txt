cmake_minimum_required(VERSION 3.0)
project(j.model)

add_definitions(-DJCOM_MODEL)

set(PROJECT_SRCS
${CMAKE_CURRENT_SOURCE_DIR}/j.model.cpp
${CMAKE_CURRENT_SOURCE_DIR}/j.model_preset.cpp
${CMAKE_CURRENT_SOURCE_DIR}/j.model_signal.cpp
${CMAKE_CURRENT_SOURCE_DIR}/TTModelInfo.cpp
${CMAKE_CURRENT_SOURCE_DIR}/../classwrapper/TTModularClassWrapperMax.cpp
)

include(${CMAKE_CURRENT_SOURCE_DIR}/../../Shared/Cmake/MaxExternalCommon.cmake)
