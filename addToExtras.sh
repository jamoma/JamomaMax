#!/bin/sh

ME=`whoami`

cd ..
JAMOMA_PATH=`pwd`

cd $JAMOMA_PATH/Tools
sudo cp "JamomaGitter.maxpat" "/Applications/Max5/patches/extras/JamomaGitter.maxpat"
sudo chown $ME "/Applications/Max5/patches/extras/JamomaGitter.maxpat"

sudo cp "$JAMOMA_PATH/Modules/Modular/Jamoma/documentation/jamoma-overview.maxpat" "/Applications/Max5/patches/extras/jamoma-overview.maxpat"
sudo chown $ME "/Applications/Max5/patches/extras/jamoma-overview.maxpat"