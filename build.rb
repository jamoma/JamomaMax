#!/usr/bin/env ruby -wKU

# First include the functions in the jamoma lib
glibdir = "."
Dir.chdir glibdir             # change to libdir so that requires work
glibdir = Dir.pwd
require "support/jamomalib"


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
# Build Jamoma
###################################################################

git_desc = `git describe --tags --abbrev=4 --long`.split('-')
#git_tag = git_desc.match(/(.*)-.*-.*/)
#git_dirty_commits = git_desc.match(/.*-(.*)-.*/)
#git_rev = git_desc.match(/.*-.*-(.*)/)
git_tag = git_desc[0]
git_dirty_commits = git_desc[git_desc.size()-2]
git_rev = git_desc[git_desc.size()-1]
git_rev.sub!('g', '')
git_rev.chop!

puts ""
puts "  Building Jamoma #{git_tag} (rev. #{git_rev})"
puts ""
if git_dirty_commits != '0'
	puts "  !!! WARNING !!!"
	puts "	THIS BUILD IS COMING FROM A DIRTY REVISION   "
	puts "	PLEASE USE THIS BUILD FOR PERSONAL USE ONLY  "
	puts "	DO NOT DISTRIBUTE THIS BUILD TO OTHERS       "
	puts ""
end
puts ""



#
#puts "  Updating ReadMe for JamomaModular"
#
#file_path = "../Modules/Modular/Jamoma/ReadMe.rtf"
#if FileTest.exist?(file_path)    
#  f = File.open("#{file_path}", "r+")
#  str = f.read
#
#  if(str.match(/PRODUCT_VERSION = #{version}/))
#    #puts "version number is the same"
#  else
#    str.gsub!(/(PRODUCT_VERSION = \d?\.\d?.\d?)/, "PRODUCT_VERSION = #{version}")
#    # we provide the build number as an argument to xcodebuild rather than modifying this file under version control
#    #str.gsub!(/(PRODUCT_BUILD = \d*)/, "PRODUCT_BUILD = #{@buildnum}")
#  end
#  f.rewind
#  f.write(str)
#  f.truncate(f.pos)
#  f.close
#end


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


#cd ..
#JAMOMA_PATH=`pwd`
#
#cd $JAMOMA_PATH/Modules/Foundation
#ruby build.rb $1 $2
#
#cd $JAMOMA_PATH/Modules/DSP
#ruby build.rb $1 $2
#
#cd $JAMOMA_PATH/Modules/Graphics
#ruby build.rb $1 $2
#
#cd $JAMOMA_PATH/Modules/Multicore
#ruby build.rb $1 $2
#
#cd $JAMOMA_PATH/Modules/Modular
#ruby build.rb $1 $2
