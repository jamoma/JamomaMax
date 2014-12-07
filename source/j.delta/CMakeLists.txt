project(j.delta)

set(PROJECT_SRCS
	${CMAKE_CURRENT_SOURCE_DIR}/j.delta.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/../c74support/max-includes/common/commonsyms.cpp
)

include(${CMAKE_CURRENT_SOURCE_DIR}/../../Shared/Cmake/MaxExternalCommon.cmake)
