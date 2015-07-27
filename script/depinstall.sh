#!/bin/sh

set -v

cd ${HOME}
case "$TRAVIS_OS_NAME" in
  linux)
      wget http://www.cmake.org/files/v3.2/cmake-3.2.2-Linux-x86_64.tar.gz
      tar -xzf cmake-3.2.2-Linux-x86_64.tar.gz
      mv cmake-3.2.2-Linux-x86_64 cmake

      git clone https://github.com/avilleret/mingw-w64-build ${HOME}/mingw-w64-install
   ;;
  osx)
      wget http://www.cmake.org/files/v3.2/cmake-3.2.2-Darwin-x86_64.tar.gz
      tar -xf cmake-3.2.2-Darwin-x86_64.tar.gz
      mkdir -p cmake
      ln -s ${HOME}/cmake-3.2.2-Darwin-x86_64/CMake.app/Contents/bin ${HOME}/cmake/

      brew install coreutils
  ;;
esac
cd -
