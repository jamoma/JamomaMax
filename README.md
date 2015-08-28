
JamomaMax
=========
Jamoma implementation for Max.

[![Stories in Ready](https://badge.waffle.io/jamoma/jamomamax.png?label=ready&title=Ready)](https://waffle.io/jamoma/jamomamax)

OS X build status : [![Build Status](https://travis-ci.org/jamoma/JamomaMax.svg?branch=dev)](https://travis-ci.org/jamoma/JamomaMax)

Windows build status : [![Build status](https://ci.appveyor.com/api/projects/status/yqv0mv6yrcd41jej?svg=true)](https://ci.appveyor.com/project/avilleret/jamomamax)

###Set up 

Here are the steps to clone and build JamomaMax :
    
    git clone https://github.com/Jamoma/JamomaMax
    cd JamomaMax
    git submodule update --init --recursive 
    ./build.sh --multi

You should add some options to the build.sh command such as : 

    --clean
    Removes the build folder and the executables prior to building.
    --install
    Install in /usr/local/jamoma
    --package
    Creates a ready-for-distribution package 
    --uninstall
    Removes /usr/local/jamoma
  
###QuickStart

To use in Max7 from the repository, create a symbolic link from the Jamoma folder (in this folder) into /Users/yourName/Documents/Max 7/Packages    
    
You can do this in the Terminal:    
1. cd to “/Users/[yourName]/Documents/Max 7/Packages"    
2. make symlink, e.g. "ln -s /[replaceWithThePathTo]/Jamoma/Implementations/Max/Jamoma"    
3. start Max    

You will find nighlty builds of this code [here](https://github.com/jamoma/nightly-builds) for both OS X and Windows (32 and 64bit).

