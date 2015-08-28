cmake_minimum_required(VERSION 3.0)
project(j.message_array)

add_definitions(-DJMOD_MESSAGE)
add_definitions(-DARRAY_EXTERNAL)

set(PROJECT_SRCS
	${CMAKE_CURRENT_SOURCE_DIR}/../j.parameter_array/j.parameter_array.cpp
)

set(PROJECT_SRCS ${PROJECT_SRCS} $<TARGET_OBJECTS:TTModularClassWrapperMaxArray>)
include(${CMAKE_CURRENT_SOURCE_DIR}/../../Shared/CMake/MaxExternalCommon.cmake)

install(TARGETS ${PROJECT_NAME}
           DESTINATION "${JAMOMAMAX_MODULAR_INSTALL_FOLDER}/Jamoma/externals"
           COMPONENT JamomaMaxModularOnly)
