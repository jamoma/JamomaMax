project(j.route)

set(PROJECT_SRCS
	${CMAKE_CURRENT_SOURCE_DIR}/j.route.cpp
)

# For some reason, this one won't link with maxcrt / maxcrt_p and complain about symbols defined twice.
# TODO this need more investigation.

include(${CMAKE_CURRENT_SOURCE_DIR}/../../Shared/CMake/MaxExternalCommon.cmake)

	

