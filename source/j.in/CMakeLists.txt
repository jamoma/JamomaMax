cmake_minimum_required(VERSION 2.6)
project(j.in)

add_definitions(-DJMOD_MESSAGE)

set(PROJECT_SRCS
${CMAKE_CURRENT_SOURCE_DIR}/j.in.cpp
${CMAKE_CURRENT_SOURCE_DIR}/../classwrapper/TTModularClassWrapperMax.cpp
${CMAKE_CURRENT_SOURCE_DIR}/../c74support/max-includes/common/commonsyms.cpp
)

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

target_link_libraries(${PROJECT_NAME} Foundation)
target_link_libraries(${PROJECT_NAME} Modular)
target_link_libraries(${PROJECT_NAME} JamomaMax)
target_link_libraries(${PROJECT_NAME} DSP)

if(APPLE)
	addAppleFramework(CoreServices)
	addAppleFramework(Carbon)
	target_link_libraries(${PROJECT_NAME} ${OSX_FRAMEWORKS})
endif()

### Output ###
setOutput()

### Tests ###
addTestTarget()
