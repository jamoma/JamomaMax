project(j.append-)

set(PROJECT_SRCS
${CMAKE_CURRENT_SOURCE_DIR}/j.append.cpp
${CMAKE_CURRENT_SOURCE_DIR}/../c74support/max-includes/common/commonsyms.cpp
${CMAKE_CURRENT_SOURCE_DIR}/../classwrapper/MaxAudioGraph.cpp
${CMAKE_CURRENT_SOURCE_DIR}/../classwrapper/MaxGraph.cpp
)

include(${CMAKE_CURRENT_SOURCE_DIR}/../../Shared/Cmake/MaxExternalCommon.cmake)

