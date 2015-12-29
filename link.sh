#!/bin/bash

# run this script from the root of the JamomaMax repository after running build.sh with the --xcode option
# this will make symlinks to the build inside of the package itself to make it easier to interactively debug with xcode

PWD=`pwd`
SUPPORT="$PWD/Jamoma/support"

FOUNDATION="$PWD/build-xcode/JamomaCore/Foundation"
DSP="$PWD/build-xcode/JamomaCore/DSP"
GRAPH="$PWD/build-xcode/JamomaCore/Graph"
AUDIOGRAPH="$PWD/build-xcode/JamomaCore/AudioGraph"
MODULAR="$PWD/build-xcode/JamomaCore/Modular"
SCORE="$PWD/build-xcode/JamomaCore/Score"

rm -rf $PWD/Jamoma/externals
ln -s $PWD/build-xcode/Debug/externals $PWD/Jamoma/externals

rm -rf $PWD/Jamoma/extensions
mkdir $PWD/Jamoma/extensions
cp -r $PWD/Jamoma/externals/j.loader.mxo $PWD/Jamoma/extensions/j.loader.mxo

rm -rf $SUPPORT
ln -s $PWD/build-xcode/Debug/support $PWD/Jamoma/support
