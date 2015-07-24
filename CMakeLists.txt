cmake_minimum_required(VERSION 3.0)
project(JamomaMax)

### GetGitDescription ###
include(${CMAKE_CURRENT_SOURCE_DIR}/Shared/CMake/modules/GetGitRevisionDescription.cmake)
get_jamoma_version()
message("git sha : " ${GIT_SHA_SHORT})
configure_file("${CMAKE_CURRENT_SOURCE_DIR}/library/includes/JamomaMaxVersion.h.in" "${CMAKE_CURRENT_SOURCE_DIR}/library/includes/JamomaMaxVersion.h" @ONLY)

if(NOT JAMOMA_UMBRELLA)

    if (APPLE)
        option(FAT_BINARY "Build a fat binary (32bit and 64bit)" ON)
    endif(APPLE)
    set(JAMOMA_CORE_SRC_PATH "${PROJECT_SOURCE_DIR}/JamomaCore" CACHE STRING "Path to JamomaCore source folder")

    include(${JAMOMA_CORE_SRC_PATH}/Shared/CMake/JamomaConfiguration.cmake NO_POLICY_SCOPE)
    include(${JAMOMA_CORE_SRC_PATH}/Shared/CMake/JamomaPlatformSpecific.cmake NO_POLICY_SCOPE)
    # include(${JAMOMA_CORE_SRC_PATH}/Shared/CMake/JamomaPack.cmake NO_POLICY_SCOPE)
	# include(${JAMOMA_CORE_SRC_PATH}/Shared/CMake/JamomaExports.cmake NO_POLICY_SCOPE)

    if(FAT_BINARY)
        set(CMAKE_OSX_ARCHITECTURES "i386;x86_64")
    endif(FAT_BINARY)

    set(JAMOMAMAX_INSTALL_FOLDER "JamomaMax" CACHE STRING "Max Package Install folder")
    set(JAMOMAMAX_MODULAR_INSTALL_FOLDER "JamomaMaxModularOnly" CACHE STRING "Modular Only Max Package Install folder")

    install(DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/Jamoma"
        DESTINATION ${JAMOMAMAX_INSTALL_FOLDER}
            COMPONENT JamomaMax)
    add_subdirectory(${JAMOMA_CORE_SRC_PATH})
else()
	set(JAMOMA_CORE_SRC_PATH "${PROJECT_SOURCE_DIR}/../../Core/")
endif()

if((APPLE AND NOT IOS) OR WIN32)

	if(WIN32 AND CMAKE_BUILD_TYPE STREQUAL "Release")
		add_definitions(-DMAXAPI_USE_MSCRT)
	endif()
	add_subdirectory(library)
	add_subdirectory(source)
endif()
