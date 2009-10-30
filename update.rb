#!/usr/bin/env ruby -wKU

`git checkout master`
`cd ..; git submodule init;`
`cd ..; git submodule foreach git checkout master`
`cd ..; git submodule foreach git pull`

`cd supports; git co master; git pull`

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
