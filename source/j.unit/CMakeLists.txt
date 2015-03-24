cmake_policy(SET CMP0037 OLD)
project(j.unit)

set(PROJECT_SRCS
	${CMAKE_CURRENT_SOURCE_DIR}/j.unit.cpp
)

set(PROJECT_SRCS ${PROJECT_SRCS} $<TARGET_OBJECTS:TTClassWrapperMax>)
include(${CMAKE_CURRENT_SOURCE_DIR}/../../Shared/CMake/MaxExternalCommon.cmake)
