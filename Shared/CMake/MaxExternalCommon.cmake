set(PROJECT_SRCS
	${PROJECT_SRCS}
	${CMAKE_CURRENT_SOURCE_DIR}/../c74support/max-includes/common/commonsyms.cpp
)

include_directories("${PROJECT_SOURCE_DIR}/../../../../Core/Modular/library/PeerObject")
include_directories("${PROJECT_SOURCE_DIR}/../../../../Core/Modular/library/ModularForMax")
include_directories("${PROJECT_SOURCE_DIR}/../../../../Core/Modular/library/SchedulerLib")
include_directories("${PROJECT_SOURCE_DIR}/../../../../Core/Modular/library/ProtocolLib")
include_directories("${PROJECT_SOURCE_DIR}/../classwrapper")
if(APPLE)
	include_directories("${FILE_H_DIR}")
endif()
addMaxsupport()

add_library(${PROJECT_NAME} SHARED ${PROJECT_SRCS})

# Since XCode does not like tildas in project names, if
# a project_name ends by _tilda, we replace it with '~' in the
# Max object.
if("${PROJECT_NAME}" MATCHES ".*_tilda")
	string(REGEX REPLACE "_tilda" "~" JAMOMAMAX_EXTERNAL_OUTPUT_NAME "${PROJECT_NAME}")
	set_target_properties(${PROJECT_NAME}
						  PROPERTIES OUTPUT_NAME "${JAMOMAMAX_EXTERNAL_OUTPUT_NAME}")
endif()


target_link_libraries(${PROJECT_NAME} Foundation)
target_link_libraries(${PROJECT_NAME} Modular)
target_link_libraries(${PROJECT_NAME} JamomaMax)
target_link_libraries(${PROJECT_NAME} DSP)
target_link_libraries(${PROJECT_NAME} Graph)
target_link_libraries(${PROJECT_NAME} AudioGraph)

### Output ###
setOutput()

### Tests ###
addTestTarget()
