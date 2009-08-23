#!/bin/sh

cd ..
JAMOMA_PATH=`pwd`

cd $JAMOMA_PATH/Modules/Foundation
ruby build.rb $1 $2

cd $JAMOMA_PATH/Modules/DSP
ruby build.rb $1 $2

cd $JAMOMA_PATH/Modules/Graphics
ruby build.rb $1 $2

cd $JAMOMA_PATH/Modules/Multicore
ruby build.rb $1 $2

cd $JAMOMA_PATH/Modules/Modular
ruby build.rb $1 $2
