cmake_minimum_required(VERSION 3.0)
project(JamomaMax)

add_definitions(-DJAMOMA_EXPORTS)

if ( APPLE )
	#FIND_LIBRARY(CARBON_LIBRARY CarbonCore)
	#MESSAGE(STATUS "  Found CarbonCore ${CARBON_LIBRARY}")
	#MARK_AS_ADVANCED (CARBON_LIBRARY)
	#SET(EXTRA_LIBS ${EXTRA_LIBS} ${CARBON_LIBRARY})
	FIND_PATH(FILE_H_DIR Files.h
            HINTS
            /System/Library/Frameworks/
            /System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/CarbonCore.framework/Versions/A/Headers/
            /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.10.sdk/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/CarbonCore.framework/Versions/A/Headers
            /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/CarbonCore.framework/Versions/A/Headers)
	message( STATUS " Files.h have been found here : ${FILE_H_DIR}")
	IF( ${FILE_H_DIR} EQUAL "FILE_H_DIR-NOT_FOUND")
		message( STATUS "  Files.h NOT FOUND !!" )
	ELSE( ${FILE_H_DIR} EQUAL "FILE_H_DIR-NOT_FOUND")
		include_directories("${FILE_H_DIR}")
	ENDIF( ${FILE_H_DIR} EQUAL "FILE_H_DIR-NOT_FOUND")

endif ( APPLE )

set(PROJECT_SRCS
${CMAKE_CURRENT_SOURCE_DIR}/source/JamomaForMax.cpp
${CMAKE_CURRENT_SOURCE_DIR}/source/JamomaModularForMax.cpp
${CMAKE_CURRENT_SOURCE_DIR}/source/JamomaObject.cpp
${CMAKE_CURRENT_SOURCE_DIR}/source/JamomaSymbols.cpp
${CMAKE_CURRENT_SOURCE_DIR}/../source/c74support/max-includes/common/commonsyms.cpp
)

file(GLOB_RECURSE PROJECT_HDRS
    ${CMAKE_CURRENT_SOURCE_DIR}/includes/*.h
	${JAMOMA_CORE_SRC_PATH}/Foundation/library/includes/*.h
	${JAMOMA_CORE_SRC_PATH}/Modular/library/includes/*.h
    ${JAMOMA_CORE_SRC_PATH}/Modular/library/PeerObject/*.h
    ${JAMOMA_CORE_SRC_PATH}/Modular/library/ProtocolLib/*.h
    ${JAMOMA_CORE_SRC_PATH}/Modular/library/SchedulerLib/*.h
    ${JAMOMA_CORE_SRC_PATH}/Graph/library/includes/*.h
    ${FILE_H_DIR}/Files.h
)

include_directories("${PROJECT_SOURCE_DIR}/includes")
include_directories("${JAMOMA_CORE_SRC_PATH}/Foundation/library/includes")
include_directories("${JAMOMA_CORE_SRC_PATH}/Modular/library/includes")
include_directories("${JAMOMA_CORE_SRC_PATH}/Modular/library/PeerObject")
include_directories("${JAMOMA_CORE_SRC_PATH}/Modular/library/ProtocolLib")
include_directories("${JAMOMA_CORE_SRC_PATH}/Modular/library/SchedulerLib")
include_directories("${JAMOMA_CORE_SRC_PATH}/DSP/library/includes")
include_directories("${JAMOMA_CORE_SRC_PATH}/Graph/library/includes")

if(APPLE)
	include_directories("${FILE_H_DIR}")
endif()

## Setup of the library ##

# Dynamic
add_library(${PROJECT_NAME}
			SHARED
			${PROJECT_SRCS} ${PROJECT_HDRS})

set_property(TARGET ${PROJECT_NAME}
			 PROPERTY INSTALL_RPATH "@loader_path/../../../../support/${SUPPORT_FOLDER};@loader_path")

set_property(TARGET ${PROJECT_NAME}
			 PROPERTY BUILD_WITH_INSTALL_RPATH TRUE)

# Version
set_property(TARGET ${PROJECT_NAME}
			 PROPERTY VERSION ${Jamoma_VERSION})
set_property(TARGET ${PROJECT_NAME}
			 PROPERTY SOVERSION ${Jamoma_SOVERSION})
set_property(TARGET ${PROJECT_NAME} APPEND
			 PROPERTY COMPATIBLE_INTERFACE_STRING Jamoma_MAJOR_VERSION)

# TODO replace with target_include_directories
if(APPLE)
	set_property(TARGET ${PROJECT_NAME} APPEND
				 PROPERTY INTERFACE_INCLUDE_DIRECTORIES
					$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/includes>
					$<INSTALL_INTERFACE:include>)
else()
	set_property(TARGET ${PROJECT_NAME} APPEND
				 PROPERTY INTERFACE_INCLUDE_DIRECTORIES
					$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/includes>
					$<INSTALL_INTERFACE:include/jamoma>)
endif()

install(TARGETS ${PROJECT_NAME}
		EXPORT ${PROJECT_NAME}Targets
		LIBRARY DESTINATION lib
		ARCHIVE DESTINATION lib
		RUNTIME DESTINATION bin
		COMPONENT Devel)

# TODO make a single variable for the include folder.
if(APPLE)
	install(FILES ${PROJECT_HDRS} DESTINATION "include" COMPONENT Devel)
else()
	install(FILES ${PROJECT_HDRS} DESTINATION "include/jamoma" COMPONENT Devel)
endif()

export(EXPORT ${PROJECT_NAME}Targets
	   FILE "${CMAKE_CURRENT_BINARY_DIR}/Jamoma/${PROJECT_NAME}Targets.cmake"
	   NAMESPACE Jamoma::)

install(EXPORT ${PROJECT_NAME}Targets
		FILE Jamoma${PROJECT_NAME}Targets.cmake
		NAMESPACE Jamoma::
		DESTINATION ${ConfigPackageLocation}
		COMPONENT Devel)

# Static
if(APPLE AND STATIC_TESTING)
	# i386
	add_library(${PROJECT_NAME}-i386-static
				STATIC
				${PROJECT_SRCS} ${PROJECT_HDRS})
	set_property(TARGET ${PROJECT_NAME}-i386-static
				 PROPERTY OSX_ARCHITECTURES i386)
	setupJamomaLibraryProperties(${PROJECT_NAME}-i386-static)

	# x86_64
	add_library(${PROJECT_NAME}-x86_64-static
				STATIC
				${PROJECT_SRCS} ${PROJECT_HDRS})

	set_property(TARGET ${PROJECT_NAME}-x86_64-static
				 PROPERTY OSX_ARCHITECTURES x86_64)
	setupJamomaLibraryProperties(${PROJECT_NAME}-x86_64-static)
endif()

install(TARGETS ${PROJECT_NAME}
		DESTINATION "${JAMOMAMAX_INSTALL_FOLDER}/Jamoma/support/${SUPPORT_FOLDER}"
		COMPONENT JamomaMax)


##

if(APPLE)
	message("Linking with: ${OSX_FRAMEWORKS}")
	target_link_libraries(${PROJECT_NAME} ${OSX_FRAMEWORKS})

	FIND_LIBRARY(CARBON_LIB Carbon)
#	FIND_LIBRARY(CARBON_LIB CarbonCore)
	SET(CARBON_LIB ${CARBON_LIB})
	target_link_libraries(${PROJECT_NAME} ${CARBON_LIB})
endif()

message("MaxAPI_LIB ${MaxAPI_LIB}")
message("MaxAudio_LIB ${MaxAudio_LIB}")
message("Jitter_LIB ${Jitter_LIB}")

target_link_libraries(${PROJECT_NAME} ${MaxAPI_LIB})
target_link_libraries(${PROJECT_NAME} ${MaxAudio_LIB})
target_link_libraries(${PROJECT_NAME} ${Jitter_LIB})

target_link_libraries(${PROJECT_NAME} Foundation)
target_link_libraries(${PROJECT_NAME} Modular)

### Tests ###
addTestTarget()
