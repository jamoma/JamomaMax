#!/usr/bin/env ruby

glibdir = "."
Dir.chdir glibdir             # change to libdir so that requires work
glibdir = Dir.pwd

$main_repository = true

require "supports/jamomalib"


def doOne submoduleName
  quietly do
    ARGV[0] = "#{submoduleName}"
  end
  load "makeSubmoduleWritable.rb"      
end
                     
doOne "AudioGraph"            
doOne "Dependencies"          
doOne "DSP"          
doOne "Foundation" 
doOne "Graph"          
doOne "Graphics"          
doOne "Modular"                    
doOne "Ruby"          
doOne "Test"                    

