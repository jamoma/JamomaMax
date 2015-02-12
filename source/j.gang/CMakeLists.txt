project(j.gang)

set(PROJECT_SRCS
	${CMAKE_CURRENT_SOURCE_DIR}/j.gang.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/../c74support/max-includes/common/commonsyms.cpp
)

include(${CMAKE_CURRENT_SOURCE_DIR}/../../Shared/Cmake/MaxExternalCommon.cmake)

