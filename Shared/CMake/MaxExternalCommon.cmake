set(PROJECT_SRCS ${PROJECT_SRCS} $<TARGET_OBJECTS:MaxCommonSyms>)

if(APPLE)
	include_directories("${FILE_H_DIR}")
endif()

addMaxsupport()

add_library(${PROJECT_NAME} MODULE ${PROJECT_SRCS})
set_property(TARGET ${PROJECT_NAME}
			 PROPERTY BUNDLE True)
set_property(TARGET ${PROJECT_NAME}
			 PROPERTY MACOSX_BUNDLE_INFO_PLIST "${CMAKE_CURRENT_LIST_DIR}/MaxExternal-Info.plist")

set_property(TARGET ${PROJECT_NAME}
			 PROPERTY BUNDLE_EXTENSION "mxo")


set_property(TARGET ${PROJECT_NAME}
			 PROPERTY INSTALL_RPATH "@loader_path/../../../../support;@loader_path")


# Since XCode does not like tildas in project names, if
# a project_name ends by _tilda, we replace it with '~' in the
# Max object.
if("${PROJECT_NAME}" MATCHES ".*_tilda")
	string(REGEX REPLACE "_tilda" "~" JAMOMAMAX_EXTERNAL_OUTPUT_NAME "${PROJECT_NAME}")
	set_target_properties(${PROJECT_NAME}
						  PROPERTIES OUTPUT_NAME "${JAMOMAMAX_EXTERNAL_OUTPUT_NAME}")
endif()

# TODO same of _equal

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
if(APPLE)
	set_target_properties(${PROJECT_NAME} PROPERTIES PREFIX "")
	set_target_properties(${PROJECT_NAME} PROPERTIES SUFFIX "")
elseif(WIN32)
	set_target_properties(${PROJECT_NAME} PROPERTIES SUFFIX ".mxe")
endif()

if("${PROJECT_NAME}" STREQUAL "j.loader")
	install(TARGETS ${PROJECT_NAME} 
			DESTINATION "${JAMOMAMAX_INSTALL_FOLDER}/Jamoma/extensions"
			COMPONENT JamomaMax)
else()
	install(TARGETS ${PROJECT_NAME} 
			DESTINATION "${JAMOMAMAX_INSTALL_FOLDER}/Jamoma/externals"
			COMPONENT JamomaMax)
endif()


### Tests ###
addTestTarget()
