cmake_policy(SET CMP0037 OLD)
project(j.in_equal)

set(PROJECT_SRCS
	${CMAKE_CURRENT_SOURCE_DIR}/../j.in/j.in.cpp
)

set(PROJECT_SRCS ${PROJECT_SRCS} $<TARGET_OBJECTS:TTModularClassWrapperMax>)

add_definitions(-DAUDIO_GRAPH_EXTERNAL -DJ_IN_MULTI)
include(${CMAKE_CURRENT_SOURCE_DIR}/../../Shared/CMake/MaxExternalCommon.cmake)
