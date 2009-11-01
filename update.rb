#!/usr/bin/env ruby -wKU

`git checkout master`
`cd ..; git submodule update --init;`
`cd ..; git submodule foreach git checkout master`
`cd ..; git submodule foreach git pull origin master`

# duplicates the stuff above:
#`cd supports; git checkout master; git pull origin master`

def doUpdate name
  puts "UPDATING: #{name}"
  puts `cd ../Modules/#{name}; ruby update.rb`
end



#TODO: checkout the correct branch here, based on an arg!
doUpdate "Foundation"
doUpdate "DSP"
doUpdate "Graphics" 
doUpdate "Multicore"
doUpdate "Modular"
