##########################################################################
#
# This script makes the repository of a submodule writeable.
#
# It might not work with newer versions of git, as git now seem to be storing
# the .git folder for submodules in a .git/modules folder embedded in the 
# .git folder of the top level repository rather than creating .git folders
# inside the folders of each of the submodules.
#
##########################################################################
#!/usr/bin/env ruby -wKU
# encoding: utf-8

if ARGV.length < 1
  puts "  required arg: the name of the submodule"
  puts "  for example: ruby makeSubmoduleWritable.rb Multicore"
  exit
end
  
@name = ARGV[0]

f = File.open("../Modules/#{@name}/.git/config", "r+")
str = f.read
str.gsub!(/git:\/\/github\.com\//, "git@github.com:")
f.rewind
f.write(str)
f.write("                    ") #this is some extra whitspace to prevent having leftovers from original file
f.close
