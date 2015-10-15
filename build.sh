#!/bin/bash
set -euf -o pipefail
########################################
###### Intro & Parameter handling ######
########################################

JAMOMA_CMAKE_TOOLCHAIN=""
JAMOMA_CMAKE_BUILD_TYPE="-DCMAKE_BUILD_TYPE=Debug"

JAMOMA_CMAKE_GENERATOR=""
JAMOMA_CMAKE_UNIVERSAL_FLAGS=""
JAMOMA_BUILD_FOLDER_SUFFIX=""
JAMOMA_ENABLE_MULTICORE=False

JAMOMA_CMAKE_MAX_FLAGS="-DBUILD_JAMOMAMAX:bool=True"
JAMOMA_CMAKE_PD_FLAGS="-DBUILD_JAMOMAPD:bool=False"

JAMOMA_INSTALL_JAMOMA=""
JAMOMA_INSTALL_JAMOMAPD=No
JAMOMA_INSTALL_JAMOMAMAX=Yes
JAMOMA_UNINSTALL_JAMOMA=False


HELP_MESSAGE="Usage : $(basename "$0") [options]
Builds Jamoma

Options :
--multi
  Builds using all your cores.
--universal
  Builds an universal binary for OS X. Warning: does not work well with brew; portmidi and gecode have to be built by hand
--win64
  Creates projects for 64-bits on Windows.
--xcode
  Creates Xcode projects on the Mac.
--optimize
  Builds with optimizations enabled. More speed, but is not suitable for distribution on older computers or different processors.

--clean
  Removes the build folder and the executables prior to building.
--install
  Install in /usr/local/jamoma
--package
  Creates a ready-for-distribution package
--uninstall
  Removes /usr/local/jamoma

--help
  Shows this message
"

while test $# -gt 0
do
	case "$1" in
	--help) echo "$HELP_MESSAGE"
		exit
		;;
	--multi) echo "Will build using every logical core on the computer (faster)"
		JAMOMA_ENABLE_MULTICORE=True
		;;
	--optimize) echo "Optimized build"
		JAMOMA_CMAKE_BUILD_TYPE="-DCMAKE_BUILD_TYPE=Release"
		CFLAGS="-Ofast -march=native"
		CXXFLAGS="$CFLAGS"
		;;
	--universal) echo "Universal build (i386; x86_64)"
		JAMOMA_BREW_UNIVERSAL_FLAGS="--universal"
		JAMOMA_CMAKE_UNIVERSAL_FLAGS="-DCMAKE_OSX_ARCHITECTURES=x86_64;i386"
		;;
	--win64) echo "64-bit build on Windows"
		JAMOMA_CMAKE_UNIVERSAL_FLAGS="-DWIN64:Bool=True"
		JAMOMA_CMAKE_GENERATOR="Visual Studio 12 2013 Win64"
		JAMOMA_BUILD_FOLDER_SUFFIX="64"
		;;
	--xcode) echo "Use Xcode to build on Mac"
		JAMOMA_CMAKE_GENERATOR="Xcode"
        JAMOMA_BUILD_FOLDER_SUFFIX="-xcode"
		;;
	--install) echo "Will install Jamoma"
		JAMOMA_INSTALL_JAMOMA="install"
		;;

	--package) echo "Will package Jamoma"
		JAMOMA_INSTALL_JAMOMA="package"
		;;

	--uninstall) echo "Will uninstall Jamoma"
		sudo rm -rf /usr/local/jamoma
		;;

	--clean) echo "Removal of the build folder"
		rm -rf build
		rm -rf build64
        rm -rf build-xcode
		;;
	*) echo "Wrong option : $1"
		echo "$HELP_MESSAGE"
		exit 1
		;;
	esac
	shift
done

if [[ "$JAMOMA_ENABLE_MULTICORE" == "True" ]]; then
	JAMOMA_NUM_THREADS=`sysctl -n hw.ncpu`
else
	JAMOMA_NUM_THREADS=1
fi



mkdir -p build"$JAMOMA_BUILD_FOLDER_SUFFIX"
(
	cd build"$JAMOMA_BUILD_FOLDER_SUFFIX"

	if [[ "$JAMOMA_CMAKE_GENERATOR" == "" ]]; then
		echo 	cmake                             .. -DCMAKE_INSTALL_PREFIX="$PWD/JamomaInstall" $JAMOMA_CMAKE_BUILD_TYPE $JAMOMA_CMAKE_UNIVERSAL_FLAGS $JAMOMA_CMAKE_MAX_FLAGS $JAMOMA_CMAKE_PD_FLAGS $JAMOMA_CMAKE_TOOLCHAIN
		        cmake                             .. -DCMAKE_INSTALL_PREFIX="$PWD/JamomaInstall" $JAMOMA_CMAKE_BUILD_TYPE $JAMOMA_CMAKE_UNIVERSAL_FLAGS $JAMOMA_CMAKE_MAX_FLAGS $JAMOMA_CMAKE_PD_FLAGS $JAMOMA_CMAKE_TOOLCHAIN
	else
		echo    cmake -G"$JAMOMA_CMAKE_GENERATOR" .. -DCMAKE_INSTALL_PREFIX="$PWD/JamomaInstall" $JAMOMA_CMAKE_BUILD_TYPE $JAMOMA_CMAKE_UNIVERSAL_FLAGS $JAMOMA_CMAKE_MAX_FLAGS $JAMOMA_CMAKE_PD_FLAGS $JAMOMA_CMAKE_TOOLCHAIN
		        cmake -G"$JAMOMA_CMAKE_GENERATOR" .. -DCMAKE_INSTALL_PREFIX="$PWD/JamomaInstall" $JAMOMA_CMAKE_BUILD_TYPE $JAMOMA_CMAKE_UNIVERSAL_FLAGS $JAMOMA_CMAKE_MAX_FLAGS $JAMOMA_CMAKE_PD_FLAGS $JAMOMA_CMAKE_TOOLCHAIN
	fi

	if [[ "$JAMOMA_CMAKE_GENERATOR" == "Xcode" ]]; then
		echo xcodebuild
		xcodebuild

		#sudo make $JAMOMA_INSTALL_JAMOMA
		#make install
	else
		echo make -j$JAMOMA_NUM_THREADS
		make -j$JAMOMA_NUM_THREADS

		#sudo make $JAMOMA_INSTALL_JAMOMA
		make install
	fi

	if [ "x${JAMOMA_INSTALL_JAMOMAMAX}" = "xYes" ]; then
		rm -rf ../Jamoma/support
		rm -rf ../Jamoma/externals
		rm -rf ../Jamoma/extensions
		cp -rf "$PWD/JamomaInstall/jamoma/JamomaMax/Jamoma/support" ../Jamoma
		cp -rf "$PWD/JamomaInstall/jamoma/JamomaMax/Jamoma/externals" ../Jamoma
		cp -rf "$PWD/JamomaInstall/jamoma/JamomaMax/Jamoma/extensions" ../Jamoma
	fi

)
