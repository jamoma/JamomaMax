project(j.route)

set(PROJECT_SRCS
	${CMAKE_CURRENT_SOURCE_DIR}/j.route.cpp
)

# For some reason, this one won't link with maxcrt / maxcrt_p and complain about symbols defined twice.
# TODO this need more investigation.
if(NOT WIN32)
	include(${CMAKE_CURRENT_SOURCE_DIR}/../../Shared/Cmake/MaxExternalCommon.cmake)
else()	
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
	
	target_link_libraries(${PROJECT_NAME} Foundation)
	target_link_libraries(${PROJECT_NAME} Modular)
	
	target_link_libraries(${PROJECT_NAME} ${MaxAPI_LIB})
	target_link_libraries(${PROJECT_NAME} ${MaxAudio_LIB})
	target_link_libraries(${PROJECT_NAME} ${Jitter_LIB})
	
	### Output ###
	setOutput()
	
	### Tests ###
	addTestTarget()

endif()

