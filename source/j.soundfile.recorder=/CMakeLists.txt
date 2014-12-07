cmake_policy(SET CMP0037 OLD)
project(j.soundfile.recorder=)

set(PROJECT_SRCS
	${CMAKE_CURRENT_SOURCE_DIR}/j.soundfile.recorder.cpp
 	${CMAKE_CURRENT_SOURCE_DIR}/../classwrapper/MaxAudioGraph.cpp
  	${CMAKE_CURRENT_SOURCE_DIR}/../classwrapper/MaxGraph.cpp
)

include(${CMAKE_CURRENT_SOURCE_DIR}/../../Shared/Cmake/MaxExternalCommon.cmake)

