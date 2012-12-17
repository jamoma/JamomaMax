#!/usr/bin/env ruby -wKU
# encoding: utf-8

# First include the functions in the jamoma lib
glibdir = "../Modules"
Dir.chdir glibdir             # change to libdir so that requires work
glibdir = Dir.pwd

$main_repository = true
require "#{glibdir}/../Core/Shared/jamomalib"


###################################################################
# Check Args
###################################################################

if(ARGV.length == 0)
  puts "usage: "
  puts "ruby tag.rb <required:tag-name>"
  exit 0;
end

$tag = ARGV[0];

def tagCore

  puts "tagging Core"
  `cd ../Core; git remote prune origin`
  `cd ../Core; git tag #{$tag}`
  `cd ../Core; git push origin --tags`

end

def tagOne name

  puts "tagging #{name}"
  `cd ../Modules/#{name}; git remote prune origin`
  `cd ../Modules/#{name}; git tag #{$tag}`
  `cd ../Modules/#{name}; git push origin --tags`

end

`git remote prune origin`
`git tag #{$tag}`
`git push origin --tags`

tagCore
tagOne "Dependencies"
tagOne "Documentation"
tagOne "Modular"
tagOne "Test"


#{}`git submodule foreach git remote prune origin`
#{}`git submodule foreach git tag #{tag}`
#{}`git submodule foreach git push origin --tags`
