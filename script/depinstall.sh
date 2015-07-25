#!/bin/sh

set -v

mkdir -p /tmp/cmake
case "$TRAVIS_OS_NAME" in
  linux)
      wget http://www.cmake.org/files/v3.2/cmake-3.2.2-Linux-x86_64.tar.gz
      tar -xzf cmake-3.2.2-Linux-x86_64.tar.gz -C /tmp/cmake --strip-components=1
	 ;;
	osx)
			wget http://www.cmake.org/files/v3.2/cmake-3.2.2-Darwin-x86_64.tar.gz
			tar -xf cmake-3.2.2-Darwin-x86_64.tar.gz -C /tmp/cmake --strip-components=1
			ln -s /tmp/cmake/CMake.app/Contents/bin /tmp/cmake/bin

      brew install coreutils
	;;
esac
