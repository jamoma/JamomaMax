project(j.append-)

set(PROJECT_SRCS
${CMAKE_CURRENT_SOURCE_DIR}/j.append.cpp
)

set(PROJECT_SRCS ${PROJECT_SRCS} $<TARGET_OBJECTS:MaxAudioGraph>)
include(${CMAKE_CURRENT_SOURCE_DIR}/../../Shared/CMake/MaxExternalCommon.cmake)

