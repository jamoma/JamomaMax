cmake_policy(SET CMP0037 OLD)
project(j.out_equal)

set(PROJECT_SRCS
	${CMAKE_CURRENT_SOURCE_DIR}/../j.out/j.out.cpp
 	${CMAKE_CURRENT_SOURCE_DIR}/../classwrapper/TTModularClassWrapperMax.cpp
)

include(${CMAKE_CURRENT_SOURCE_DIR}/../../Shared/Cmake/MaxExternalCommon.cmake)

set_target_properties(${PROJECT_NAME} PROPERTIES OUTPUT_NAME j.out=)
