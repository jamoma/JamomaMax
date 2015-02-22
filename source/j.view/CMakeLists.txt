cmake_minimum_required(VERSION 3.0)
project(j.view)

add_definitions(-DJCOM_VIEW)

set(PROJECT_SRCS
	${CMAKE_CURRENT_SOURCE_DIR}/../j.model/j.model.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/../j.model/j.model_preset.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/../j.model/j.model_signal.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/../j.model/TTModelInfo.cpp
)

set(PROJECT_SRCS ${PROJECT_SRCS} $<TARGET_OBJECTS:TTModularClassWrapperMax>)
include(${CMAKE_CURRENT_SOURCE_DIR}/../../Shared/Cmake/MaxExternalCommon.cmake)
