#!/usr/bin/env ruby -wKU

# First include the functions in the jamoma lib
@libdir = "."
Dir.chdir @libdir             # change to libdir so that requires work
@libdir = Dir.pwd

$main_repository = true
require "supports/jamomalib"


###################################################################
# Check Args
###################################################################

if(ARGV.length < 2)
  puts "usage: "
  puts "  all.rb <required:branch> <required:configuration> <optional:clean> <optional:install> <optional:upload>"
  puts "  examples:"
  puts "    ruby all.rb master Development clean"
  puts "    ruby all.rb 0.5-maintenance Deployment clean install"
  puts "  notes:"
  puts "    uploading requires that you be previously authenticated with the BEK server using SSH keys"
  puts
  exit 0;
end

@branch = ARGV[0];
@configuration = ARGV[1];
if win32?
 	 if(configuration == "Development" || configuration == "Debug" )
    		configuration = "Debug"
  	else
		if(configuration == "Deployment" || configuration == "Release" )
    			configuration = "Release"
		end
 	 end
end

@clean = false;
@install = false;
@upload = false;

ARGV.each_index { |i| 
  if i > 1
    @clean = true if ARGV[i] == "clean"
    @install = true if ARGV[i] == "install"
    @upload = true if ARGV[i] == "upload"
  end
}
  



###################################################################
# Do it all
###################################################################

quietly do
  ARGV = [@branch]
end
Dir.chdir @libdir 
load "update.rb"

quietly do
  ARGV = [@configuration, @clean]
end
Dir.chdir @libdir 
load "build.rb"

quietly do
  ARGV = []
end
Dir.chdir @libdir 
load "installer.rb"

if @install
  puts "Sorry, I don't know how to install yet."
  Dir.chdir @libdir 
  if win32?
    # what do we do here?
  else
    puts `installer -pkg ../Installers/Jamoma/*.pkg`
  end
end

Dir.chdir "#{@libdir}/testlib"
load "testrunner.rb"

if @upload
  puts "Sorry, I don't know how to upload yet."
  # `scp ... `
  #`curl` # to test the download
  # TODO: I guess we should automatically update (or generate) the webpage too -- maybe this is done by a rails app?
end

