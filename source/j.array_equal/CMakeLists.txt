cmake_policy(SET CMP0037 OLD)
project("j.array_equal")

set(PROJECT_SRCS
${CMAKE_CURRENT_SOURCE_DIR}/j.array.cpp
)

set(PROJECT_SRCS ${PROJECT_SRCS} $<TARGET_OBJECTS:MaxAudioGraph>)
include(${CMAKE_CURRENT_SOURCE_DIR}/../../Shared/CMake/MaxExternalCommon.cmake)
