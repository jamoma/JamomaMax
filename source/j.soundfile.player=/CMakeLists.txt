cmake_policy(SET CMP0037 OLD)
project(j.soundfile.player=)

set(PROJECT_SRCS
	${CMAKE_CURRENT_SOURCE_DIR}/j.soundfile.player.cpp
 	${CMAKE_CURRENT_SOURCE_DIR}/../classwrapper/MaxAudioGraph.cpp
  	${CMAKE_CURRENT_SOURCE_DIR}/../classwrapper/MaxGraph.cpp
)

include(${CMAKE_CURRENT_SOURCE_DIR}/../../Shared/Cmake/MaxExternalCommon.cmake)

