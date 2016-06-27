JamomaMax
=========

[![Join the chat at https://gitter.im/jamoma/JamomaMax](https://badges.gitter.im/jamoma/JamomaMax.svg)](https://gitter.im/jamoma/JamomaMax?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
Jamoma implementation for Max.

| MacOS X build status | Windows build status | Waffle Stories |
| ------------- | ----------- | ----------- |
| [![Build Status](https://travis-ci.org/jamoma/JamomaMax.svg?branch=master)](https://travis-ci.org/jamoma/JamomaMax)      | [![Build status](https://ci.appveyor.com/api/projects/status/yqv0mv6yrcd41jej?svg=true)](https://ci.appveyor.com/project/avilleret/jamomamax) | [![Stories in Ready](https://badge.waffle.io/jamoma/jamomamax.png?label=ready&title=Ready)](https://waffle.io/jamoma/jamomamax) |

### Set up 

Here are the steps to clone and build JamomaMax :   
(You need Cmake > 3.3 installed)
    
    git clone --recursive https://github.com/jamoma/JamomaMax.git
    cd JamomaMax
    ./build.sh --multi

There are additional options to the `build.sh` command, including : 

    --help
    List all available options and what they do.
    --multi
    Builds using all your cores.
    --universal
    Builds an universal binary for OS X. Warning: does not work well with brew; portmidi and gecode have to be built by hand
    --win64
    Creates projects for 64-bits on Windows.
    --optimize
    Builds with optimizations enabled. More speed, but is not suitable for distribution on older computers or different processors.
    --clean
    Removes the build folder and the executables prior to building.
    --install
    Install into /usr/local/jamoma
    --package
    Create a ready-for-distribution package 
    --uninstall
    Remove /usr/local/jamoma
    --nocmake
    Don't run CMake (speed up following build)
  
### QuickStart

To use in Max7 from the repository, create a symbolic link from the Jamoma folder (in this folder) into /Users/yourName/Documents/Max 7/Packages    

You can do this in the Terminal : 

    cd ~/Documents/Max\ 7/Packages    
    ln -s /[replaceWithThePathTo]/JamomaMax/Jamoma    

Now you can start Max 7 and the Max Console will print a message 

    Jamoma  v1.0-beta.1  |  build 8eb688d

### Pre-built Packages

You will find nighlty builds of this code [here](http://www.jamoma.org/download/JamomaMax/nightly-builds/) for both OS X and Windows (32 and 64bit).

