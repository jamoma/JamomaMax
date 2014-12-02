cmake_minimum_required(VERSION 2.6)
project(j.loader)

set(PROJECT_SRCS
${CMAKE_CURRENT_SOURCE_DIR}/j.loader.cpp
${CMAKE_CURRENT_SOURCE_DIR}/../c74support/max-includes/common/commonsyms.cpp
)

IF(APPLE)
	FIND_LIBRARY(MaxAPI_LIB MaxAPI
				 PATH ${CMAKE_CURRENT_SOURCE_DIR}/../source/c74support/max-includes/)
	MARK_AS_ADVANCED (MaxAPI_LIB)
	SET(OSX_LIBS ${MaxAPI_LIB} ${CARBON_LIB})
ENDIF (APPLE)

include_directories("${PROJECT_SOURCE_DIR}/../../../../Core/Foundation/library/includes")
include_directories("${PROJECT_SOURCE_DIR}/../../../../Core/DSP/library/includes")
include_directories("${PROJECT_SOURCE_DIR}/../../../../Core/Modular/library/includes")
include_directories("${PROJECT_SOURCE_DIR}/../../../../Core/Modular/library/PeerObject")
include_directories("${PROJECT_SOURCE_DIR}/../../../../Core/Modular/library/ModularForMax")
include_directories("${PROJECT_SOURCE_DIR}/../../../../Core/Modular/library/SchedulerLib")
include_directories("${PROJECT_SOURCE_DIR}/../../../../Core/Modular/library/ProtocolLib")
include_directories("${PROJECT_SOURCE_DIR}/../classwrapper")

addMaxsupport()

add_library(${PROJECT_NAME} SHARED ${PROJECT_SRCS})

target_link_libraries(${PROJECT_NAME} JamomaFoundation)
target_link_libraries(${PROJECT_NAME} JamomaModular)
target_link_libraries(${PROJECT_NAME} JamomaMax)
target_link_libraries(${PROJECT_NAME} ${OSX_LIBS})

### Output ###
setOutput()

### Tests ###
addTestTarget()
