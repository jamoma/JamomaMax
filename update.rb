#!/usr/bin/env ruby -wKU

`cd ..; git submodule init;`
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
