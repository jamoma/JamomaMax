cmake_minimum_required(VERSION 2.6)
project(JamomaMax)

add_definitions(-DJAMOMA_EXPORTS)

find_package(MaxSDK REQUIRED)
 # if(NOT MaxSDK_FOUND)
   # message(FATAL_ERROR "Package MaxSDK required, but not found!")
 # endif()

addMaxsupport()

IF(APPLE)
	FIND_LIBRARY(CARBON_LIB CarbonCore)
	FIND_LIBRARY(MaxAPI_LIB MaxAPI
				 PATH ${CMAKE_CURRENT_SOURCE_DIR}/../source/c74support/max-includes/)
	MARK_AS_ADVANCED (MaxAPI_LIB)
	SET(OSX_LIBS ${MaxAPI_LIB} ${CARBON_LIB})
ENDIF (APPLE)

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
)

include_directories("${PROJECT_SOURCE_DIR}/includes")
include_directories("${PROJECT_SOURCE_DIR}/../../../Core/Foundation/library/includes")
include_directories("${PROJECT_SOURCE_DIR}/../../../Core/Modular/library/includes")
include_directories("${PROJECT_SOURCE_DIR}/../../../Core/Modular/library/PeerObject")
include_directories("${PROJECT_SOURCE_DIR}/../../../Core/Modular/library/ProtocolLib")
include_directories("${PROJECT_SOURCE_DIR}/../../../Core/Modular/library/SchedulerLib")
include_directories("${PROJECT_SOURCE_DIR}/../../../Core/DSP/library/includes")


add_library(${PROJECT_NAME} SHARED ${PROJECT_SRCS})

addAppleFramework(Carbon)
if(APPLE)
	message("Linking with: ${OSX_FRAMEWORKS}")
	target_link_libraries(${PROJECT_NAME} ${OSX_FRAMEWORKS})
endif()

target_link_libraries(${PROJECT_NAME} JamomaFoundation)
target_link_libraries(${PROJECT_NAME} JamomaModular)
target_link_libraries(${PROJECT_NAME} ${OSX_LIBS})


### Output ###
setOutput()

### Tests ###
addTestTarget()
