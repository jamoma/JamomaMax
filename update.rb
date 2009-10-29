#!/usr/bin/env ruby -wKU


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
