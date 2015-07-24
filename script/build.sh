#!/bin/sh

set -e

## coverity does a double build: 1x for coverity, 1x the ordinary build
## let's suppress the 2nd one
if [ "x${COVERITY_SCAN_BRANCH}" = "x1" ]; then
  echo "looks like we are running a coverity-scan build: stopping"
  exit 0
fi

if [ "x${TRAVIS_BRANCH}" = "xfeature/mingw-w64" -a "x${ARCH}" != "xmingw-w64" ]; then
  echo "We are on feature/mingw-w64 branch, don't build for other arch"
  exit 0
fi

mkdir -p build
cd build

# common options to all jobs
CMAKE_OPTIONS="-DCMAKE_INSTALL_PREFIX=${TRAVIS_BUILD_DIR}/JamomaInstall"

if [ "x$TRAVIS_OS_NAME" = "xosx" ]; then
  CMAKE_OPTIONS="$CMAKE_OPTIONS -DFAT_BINARY=ON"
fi

echo "Configuring with CMAKE_OPTIONS=$CMAKE_OPTIONS"
/tmp/cmake/bin/cmake .. $CMAKE_OPTIONS
echo "Now make"
make -j 4
