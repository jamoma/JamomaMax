#!/bin/sh

set -e

## coverity does a double build: 1x for coverity, 1x the ordinary build
## let's suppress the 2nd one
if [ "x${COVERITY_SCAN_BRANCH}" = "x1" ]; then
  echo "looks like we are running a coverity-scan build: stopping"
  exit 0
fi

mkdir -p build
cd build

# common options to all jobs
CMAKE_OPTIONS="-DCMAKE_INSTALL_PREFIX=${TRAVIS_BUILD_DIR}/JamomaInstall"

if [ "x$TRAVIS_OS_NAME" = "xosx" ]; then
  CMAKE_OPTIONS="$CMAKE_OPTIONS -DFAT_BINARY=ON"
else
  CMAKE_OPTIONS="$CMAKE_OPTIONS -DCROSS_COMPILER_PATH=${HOME}/mingw-w64-install/ -DCMAKE_TOOLCHAIN_FILE=${TRAVIS_BUILD_DIR}/Shared/CMake/toolchains/mingw-w64.cmake"
fi

echo "Configuring with CMAKE_OPTIONS=$CMAKE_OPTIONS"
${HOME}/cmake/bin/cmake .. ${CMAKE_OPTIONS}
echo "Now make"
make -j 4
