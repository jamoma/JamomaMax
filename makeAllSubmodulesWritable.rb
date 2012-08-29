##########################################################################
#
# This script makes the repositories of all the submodules writeable.
#
# It might not work with newer versions of git, as git now seem to be storing
# the .git folder for submodules in a .git/modules folder embedded in the 
# .git folder of the top level repository rather than creating .git folders
# inside the folders of each of the submodules.
#
##########################################################################
#!/usr/bin/env ruby -wKU
# encoding: utf-8




glibdir = "../Modules"
Dir.chdir glibdir             # change to libdir so that requires work
glibdir = Dir.pwd

$main_repository = true
require "#{glibdir}/Support/jamomalib"


def doOne submoduleName
  quietly do
    ARGV[0] = "#{submoduleName}"
  end  
  puts "changing permission for #{submoduleName}"
  load "../Tools/makeSubmoduleWritable.rb"      
end
                     
doOne "AudioGraph"
doOne "Dependencies"
doOne "Documentation"
doOne "DSP"
doOne "Foundation"
doOne "Graph"
doOne "Graphics"
doOne "Modular"
doOne "Plugtastic"
doOne "Ruby"
doOne "Test"
doOne "Support"              

