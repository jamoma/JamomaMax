cmake_policy(SET CMP0037 OLD)
project(j.stats)

set(PROJECT_SRCS
	${CMAKE_CURRENT_SOURCE_DIR}/j.stats.cpp
)

include(${CMAKE_CURRENT_SOURCE_DIR}/../../Shared/CMake/MaxExternalCommon.cmake)

