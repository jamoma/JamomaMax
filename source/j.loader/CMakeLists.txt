cmake_minimum_required(VERSION 3.0)
project(j.loader)

set(PROJECT_SRCS
${CMAKE_CURRENT_SOURCE_DIR}/j.loader.cpp
)

include(${CMAKE_CURRENT_SOURCE_DIR}/../../Shared/CMake/MaxExternalCommon.cmake)

install(TARGETS ${PROJECT_NAME}
           DESTINATION "${JAMOMAMAX_MODULAR_INSTALL_FOLDER}/Jamoma/extensions"
           COMPONENT JamomaMaxModularOnly)
