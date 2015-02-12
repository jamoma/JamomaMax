cmake_minimum_required(VERSION 2.6)
project(j.view)

add_definitions(-DJCOM_VIEW)

set(PROJECT_SRCS
	${CMAKE_CURRENT_SOURCE_DIR}/../j.model/j.model.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/../j.model/j.model_preset.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/../j.model/j.model_signal.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/../j.model/TTModelInfo.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/../classwrapper/TTModularClassWrapperMax.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/../c74support/max-includes/common/commonsyms.cpp
)

include(${CMAKE_CURRENT_SOURCE_DIR}/../../Shared/Cmake/MaxExternalCommon.cmake)
