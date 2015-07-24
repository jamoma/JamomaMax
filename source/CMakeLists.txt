project(MaxExternals)
if(APPLE)
	include_directories("/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.10.sdk/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/CarbonCore.framework/Versions/A/Headers/")
	include_directories("/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/CarbonCore.framework/Versions/A/Headers/")
	include_directories("/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/CarbonCore.framework/Versions/A/Headers/")
endif()

include_directories("${JAMOMA_CORE_SRC_PATH}/Foundation/library/includes")
include_directories("${JAMOMA_CORE_SRC_PATH}/Modular/library/includes")
include_directories("${JAMOMA_CORE_SRC_PATH}/Modular/library/PeerObject")
include_directories("${JAMOMA_CORE_SRC_PATH}/Modular/library/ModularForMax")
include_directories("${JAMOMA_CORE_SRC_PATH}/Modular/library/SchedulerLib")
include_directories("${JAMOMA_CORE_SRC_PATH}/Modular/library/ProtocolLib")
include_directories("${JAMOMA_CORE_SRC_PATH}/DSP/library/includes")
include_directories("${JAMOMA_CORE_SRC_PATH}/Score/library/includes")
include_directories("${PROJECT_SOURCE_DIR}/classwrapper")

include_directories("c74support/max-includes")
include_directories("c74support/msp-includes")
include_directories("c74support/jit-includes")
include_directories("../library/includes")

add_library(MaxCommonSyms OBJECT  
			${CMAKE_CURRENT_SOURCE_DIR}/c74support/max-includes/common/commonsyms.cpp)

add_library(TTClassWrapperMax OBJECT
 			${CMAKE_CURRENT_SOURCE_DIR}/classwrapper/TTClassWrapperMax.cpp)

add_library(TTModularClassWrapperMax OBJECT
 			${CMAKE_CURRENT_SOURCE_DIR}/classwrapper/TTModularClassWrapperMax.cpp)

add_library(TTModularClassWrapperMaxAudio OBJECT
			${CMAKE_CURRENT_SOURCE_DIR}/classwrapper/TTModularClassWrapperMax.cpp)
set_property(TARGET TTModularClassWrapperMaxAudio
			 PROPERTY COMPILE_DEFINITIONS AUDIO_EXTERNAL)

add_library(TTModularClassWrapperMaxArray OBJECT
 			${CMAKE_CURRENT_SOURCE_DIR}/classwrapper/TTModularClassWrapperMax.cpp)
set_property(TARGET TTModularClassWrapperMaxArray
			 PROPERTY COMPILE_DEFINITIONS ARRAY_EXTERNAL)

include_directories("${JAMOMA_CORE_SRC_PATH}/Graph/library/includes")
include_directories("${JAMOMA_CORE_SRC_PATH}/AudioGraph/library/includes")
add_library(MaxAudioGraph OBJECT 
		 	${CMAKE_CURRENT_SOURCE_DIR}/classwrapper/MaxAudioGraph.cpp
  			${CMAKE_CURRENT_SOURCE_DIR}/classwrapper/MaxGraph.cpp)


cmake_policy(SET CMP0014 OLD) # don't warn if folder doesn't contain a CMakeLists.txt file
SUBDIRLIST(SUBDIRS ${CMAKE_CURRENT_SOURCE_DIR})
SET(IS_EXTERNAL 1)
FOREACH(subdir ${SUBDIRS})
    ADD_SUBDIRECTORY(${subdir})
ENDFOREACH()
