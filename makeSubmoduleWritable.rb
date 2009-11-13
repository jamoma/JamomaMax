#!/usr/bin/env ruby -wKU

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
f.close
