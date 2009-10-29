#!/usr/bin/env ruby -wKU

# First include the functions in the jamoma lib
glibdir = "."
Dir.chdir glibdir             # change to libdir so that requires work
glibdir = Dir.pwd
require "supports/jamomalib"


###################################################################
# Check Args
###################################################################

if(ARGV.length == 0)
  puts "usage: "
  puts "build.rb <required:configuration> <optional:clean>"
  exit 0;
end

configuration = ARGV[0];
if win32?
 	 if(configuration == "Development" || configuration == "Debug" )
    		configuration = "Debug"
  	else
		if(configuration == "Deployment" || configuration == "Release" )
    			configuration = "Release"
		end
 	 end
end

clean = false;
debug = false;

if(ARGV.length > 1)
  if(ARGV[1] != "0" || ARGV[1] != "false")
    clean = true;
  end
end

if(ARGV.length > 2)
  if(ARGV[2] != "0" || ARGV[2] != "false")
    debug = true;
  end
end


###################################################################
# Get Revision Info
###################################################################

git_desc = `git describe --tags --abbrev=5 --long`.split('-')
git_tag = git_desc[0]
git_dirty_commits = git_desc[git_desc.size()-2]
git_rev = git_desc[git_desc.size()-1]
git_rev.sub!('g', '')
git_rev.chop!

version_digits = git_tag.split(/\./)
version_maj = 0
version_min = 0
version_sub = 0
version_mod = ''
version_mod = version_digits[3] if version_digits.size() > 3
version_sub = version_digits[2] if version_digits.size() > 2
version_min = version_digits[1] if version_digits.size() > 1
version_maj = version_digits[0] if version_digits.size() > 0

puts ""
puts "  Building Jamoma #{git_tag} (rev. #{git_rev})"
puts ""
if git_dirty_commits != '0'
	puts "  !!! WARNING !!!"
	puts "	THIS BUILD IS COMING FROM A DIRTY REVISION   "
	puts "	THIS BUILD IS FOR PERSONAL USE ONLY  "
	puts "	DO NOT DISTRIBUTE THIS BUILD TO OTHERS       "
	puts ""
end
puts ""


###################################################################
# Build Jamoma
###################################################################

quietly do
  ARGV = [configuration, clean, debug, git_tag, git_rev]
end

Dir.chdir "#{glibdir}/../Modules/Foundation"
load "build.rb"

Dir.chdir "#{glibdir}/../Modules/DSP"
load "build.rb"

Dir.chdir "#{glibdir}/../Modules/Graphics"
load "build.rb"

Dir.chdir "#{glibdir}/../Modules/Multicore"
load "build.rb"

Dir.chdir "#{glibdir}/../Modules/Modular"
load "build.rb"
