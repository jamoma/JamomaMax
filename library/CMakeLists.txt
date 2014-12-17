cmake_minimum_required(VERSION 2.6)
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

### GetGitDescription ###
include(${CMAKE_CURRENT_SOURCE_DIR}/../Shared/CMake/modules/GetGitRevisionDescription.cmake	)
git_describe(GIT_SHA_SHORT --always)
git_describe(GIT_TAG --always --tags)
string(REPLACE "." ";" GIT_TAG_LIST ${GIT_TAG})
list(LENGTH GIT_TAG_LIST len)
if (len GREATER 0)
	list(GET GIT_TAG_LIST 0 GIT_VERSION_MAJ)
endif (len GREATER 0)
if (len GREATER 1)
	list(GET GIT_TAG_LIST 1 GIT_VERSION_MIN)
endif (len GREATER 1)
if (len GREATER 2)
	list(GET GIT_TAG_LIST 2 GIT_VERSION_SUB)
endif (len GREATER 2)
if (len GREATER 3)
	list(GET GIT_TAG_LIST 3 GIT_VERSION_MOD_LONG)
endif (len GREATER 3)
list(LENGTH GIT_VERSION_MOD_LONG len2)
if (len2 GREATER 0)
	string(REPLACE "-" ";" GIT_VERSION_MOD_LIST ${GIT_VERSION_MOD_LONG})
	list(GET GIT_VERSION_MOD_LIST 0 GIT_VERSION_MOD)
endif (len2 GREATER 0)
configure_file("${CMAKE_CURRENT_SOURCE_DIR}/includes/JamomaMaxVersion.h.in" "${CMAKE_CURRENT_SOURCE_DIR}/includes/JamomaMaxVersion.h" @ONLY)

set(PROJECT_SRCS
${CMAKE_CURRENT_SOURCE_DIR}/source/JamomaForMax.cpp
${CMAKE_CURRENT_SOURCE_DIR}/source/JamomaModularForMax.cpp
${CMAKE_CURRENT_SOURCE_DIR}/source/JamomaObject.cpp
${CMAKE_CURRENT_SOURCE_DIR}/source/JamomaSymbols.cpp
${CMAKE_CURRENT_SOURCE_DIR}/../source/c74support/max-includes/common/commonsyms.cpp
)

file(GLOB_RECURSE PROJECT_HDRS
    ${CMAKE_CURRENT_SOURCE_DIR}/includes/*.h
	${CMAKE_CURRENT_SOURCE_DIR}../../../Core/Foundation/library/includes/*.h
	${CMAKE_CURRENT_SOURCE_DIR}../../../Core/Modular/library/includes/*.h
    ${CMAKE_CURRENT_SOURCE_DIR}../../../Core/Modular/library/PeerObject/*.h
    ${CMAKE_CURRENT_SOURCE_DIR}../../../Core/Modular/library/ProtocolLib/*.h
    ${CMAKE_CURRENT_SOURCE_DIR}../../../Core/Modular/library/SchedulerLib/*.h
    ${CMAKE_CURRENT_SOURCE_DIR}/../../../Core/Graph/library/includes/*.h
    ${FILE_H_DIR}/Files.h
)

include_directories("${PROJECT_SOURCE_DIR}/includes")
include_directories("${PROJECT_SOURCE_DIR}/../../../Core/Foundation/library/includes")
include_directories("${PROJECT_SOURCE_DIR}/../../../Core/Modular/library/includes")
include_directories("${PROJECT_SOURCE_DIR}/../../../Core/Modular/library/PeerObject")
include_directories("${PROJECT_SOURCE_DIR}/../../../Core/Modular/library/ProtocolLib")
include_directories("${PROJECT_SOURCE_DIR}/../../../Core/Modular/library/SchedulerLib")
include_directories("${PROJECT_SOURCE_DIR}/../../../Core/DSP/library/includes")
include_directories("${PROJECT_SOURCE_DIR}/../../../Core/Graph/library/includes")

if(APPLE)
	include_directories("${FILE_H_DIR}")
endif()
add_library(${PROJECT_NAME} SHARED ${PROJECT_SRCS})

addAppleFramework(Carbon)
if(APPLE)
	message("Linking with: ${OSX_FRAMEWORKS}")
	target_link_libraries(${PROJECT_NAME} ${OSX_FRAMEWORKS})
	
	FIND_LIBRARY(CARBON_LIB Carbon)
#	FIND_LIBRARY(CARBON_LIB CarbonCore)
	SET(CARBON_LIB ${CARBON_LIB})
	target_link_libraries(${PROJECT_NAME} ${CARBON_LIB})
endif()

addMaxsupport()
target_link_libraries(${PROJECT_NAME} ${MaxAPI_LIB})

target_link_libraries(${PROJECT_NAME} Foundation)
target_link_libraries(${PROJECT_NAME} Modular)

### Output ###
setOutput()

### Tests ###
addTestTarget()
