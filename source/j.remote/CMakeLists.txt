cmake_minimum_required(VERSION 3.0)
project(j.remote)

set(PROJECT_SRCS
${CMAKE_CURRENT_SOURCE_DIR}/j.remote.cpp
)

set(PROJECT_SRCS ${PROJECT_SRCS} $<TARGET_OBJECTS:TTModularClassWrapperMax>)
include(${CMAKE_CURRENT_SOURCE_DIR}/../../Shared/CMake/MaxExternalCommon.cmake)

install(TARGETS ${PROJECT_NAME}
           DESTINATION "${JAMOMAMAX_MODULAR_INSTALL_FOLDER}/Jamoma/externals"
           COMPONENT JamomaMaxModularOnly)
