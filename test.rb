#!/usr/bin/env ruby -wKU
# encoding: utf-8 -wKU

# First include the functions in the jamoma lib
glibdir = "."
Dir.chdir glibdir             # change to libdir so that requires work
glibdir = Dir.pwd

$main_repository = true

require "supports/jamomalib"

# Get a list of submodules that need to be built
submodules = Dir.entries("#{glibdir}/../Modules")
submodules.delete_if {|x| x =~ /^\.DS*/}
submodules.each do |m|
  Dir.chdir("#{glibdir}/../Modules/#{m}")
  load "#{glibdir}/../Modules/#{m}/test.rb" if File.exist? "#{glibdir}/../Modules/#{m}/test.rb"
end