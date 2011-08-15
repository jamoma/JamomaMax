#!/usr/bin/ruby -wKU

# First include the functions in the jamoma lib
libdir = "."
Dir.chdir libdir             # change to libdir so that requires work
libdir = Dir.pwd

$main_repository = true

require "supports/jamomalib"

# Get a list of submodules that need to be built
submodules = Dir.entries("#{libdir}/../Modules")

submodules.each do |m|
  Dir.chdir("#{libdir}/../Modules/#{m}")
  load "#{libdir}/../Modules/#{m}/test.rb" if File.exist? "#{libdir}/../Modules/#{m}/test.rb"
end