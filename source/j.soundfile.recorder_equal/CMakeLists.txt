cmake_policy(SET CMP0037 OLD)
project(j.soundfile.recorder_equal)

set(PROJECT_SRCS
	${CMAKE_CURRENT_SOURCE_DIR}/j.soundfile.recorder.cpp
)

set(PROJECT_SRCS ${PROJECT_SRCS} $<TARGET_OBJECTS:MaxAudioGraph>)
include(${CMAKE_CURRENT_SOURCE_DIR}/../../Shared/Cmake/MaxExternalCommon.cmake)

set_target_properties(${PROJECT_NAME} PROPERTIES OUTPUT_NAME j.soundfile.recorder=)
