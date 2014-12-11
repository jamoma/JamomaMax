cmake_policy(SET CMP0037 OLD)
project(j.window_equal)

set(PROJECT_SRCS
	${CMAKE_CURRENT_SOURCE_DIR}/j.window.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/../classwrapper/MaxAudioGraph.cpp
  	${CMAKE_CURRENT_SOURCE_DIR}/../classwrapper/MaxGraph.cpp
)

include(${CMAKE_CURRENT_SOURCE_DIR}/../../Shared/Cmake/MaxExternalCommon.cmake)

set_target_properties(${PROJECT_NAME} PROPERTIES OUTPUT_NAME j.window=)
