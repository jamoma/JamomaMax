set(PROJECT_SRCS
	${PROJECT_SRCS}
	${CMAKE_CURRENT_SOURCE_DIR}/../c74support/max-includes/common/commonsyms.cpp
)

include_directories("${PROJECT_SOURCE_DIR}/../../../../Core/Foundation/library/includes")
include_directories("${PROJECT_SOURCE_DIR}/../../../../Core/Modular/library/includes")
include_directories("${PROJECT_SOURCE_DIR}/../../../../Core/Modular/library/PeerObject")
include_directories("${PROJECT_SOURCE_DIR}/../../../../Core/Modular/library/ModularForMax")
include_directories("${PROJECT_SOURCE_DIR}/../../../../Core/Modular/library/SchedulerLib")
include_directories("${PROJECT_SOURCE_DIR}/../../../../Core/Modular/library/ProtocolLib")
include_directories("${PROJECT_SOURCE_DIR}/../../../../Core/DSP/library/includes")
include_directories("${PROJECT_SOURCE_DIR}/../classwrapper")

if(APPLE)
	include_directories("${FILE_H_DIR}")
endif()

addMaxsupport()

add_executable(${PROJECT_NAME} MACOSX_BUNDLE ${PROJECT_SRCS})

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

if(APPLE)
		SET_TARGET_PROPERTIES(${PROJECT_NAME} PROPERTIES XCODE_ATTRIBUTE_MACH_O_TYPE "mh_bundle")
		SET_TARGET_PROPERTIES(${PROJECT_NAME} PROPERTIES XCODE_ATTRIBUTE_WRAPPER_EXTENSION "mxo")
		SET_TARGET_PROPERTIES(${PROJECT_NAME} PROPERTIES XCODE_ATTRIBUTE_GCC_PREFIX_HEADER "${CMAKE_CURRENT_SOURCE_DIR}/../c74support/max-includes/macho-prefix.pch")
		#SET_TARGET_PROPERTIES(${PROJECT_NAME} PROPERTIES XCODE_ATTRIBUTE_INFOPLIST_FILE "${CMAKE_CURRENT_SOURCE_DIR}/../c74support/max-includes/Info.plist")
		SET_TARGET_PROPERTIES(${PROJECT_NAME} PROPERTIES XCODE_ATTRIBUTE_WARNING_CFLAGS "-Wmost -Wno-four-char-constants -Wno-unknown-pragmas")
		SET_TARGET_PROPERTIES(${PROJECT_NAME} PROPERTIES XCODE_ATTRIBUTE_DEPLOYMENT_LOCATION "YES")
		SET_TARGET_PROPERTIES(${PROJECT_NAME} PROPERTIES XCODE_ATTRIBUTE_GENERATE_PKGINFO_FILE "YES")
		SET_TARGET_PROPERTIES(${PROJECT_NAME} PROPERTIES XCODE_ATTRIBUTE_DSTROOT "${EXECUTABLE_OUTPUT_PATH}")
		SET_TARGET_PROPERTIES(${PROJECT_NAME} PROPERTIES XCODE_ATTRIBUTE_INSTALL_PATH "${CMAKE_BINARY_DIR}/${CMAKE_BUILD_TYPE}/externals")
		SET_TARGET_PROPERTIES(${PROJECT_NAME} PROPERTIES XCODE_ATTRIBUTE_GCC_DYNAMIC_NO_PIC "NO")
endif()

### Output ###
setOutput()

### Tests ###
addTestTarget()
