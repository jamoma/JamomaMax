#!/usr/bin/env ruby -wKU
# encoding: utf-8 -wKU

###################################################################
# Build Jamoma
#
# Use the <help> option to get an overview of available arguments
#
###################################################################

# First include the functions in the jamoma lib
glibdir = "../Modules"
Dir.chdir glibdir             # change to libdir so that requires work
glibdir = Dir.pwd

$main_repository = true
require "#{glibdir}/Support/jamomalib"


###################################################################
# Check Args
###################################################################

# Default values for arguments:

configuration = "Development"
clean = false
compiler = false
postLog = false
runTests = false

# If no arguments are provided we post a help message

ARGV.each do |arg|
  if(arg=="help")
    puts
    puts "The build.rb script takes the following arguments:"
    puts
    puts "- <Deployment> or <Release> ensures a deployment build."
    puts "  The default is a Development build"
    puts
    puts "- <clean> ensures a clean build."
    puts "  The default is a non-clean build."
    puts
    puts "- <log> causes build logs to be posted to Terminal"
    puts "  The default is that build logs are not posted to Terminal"
    puts 
    puts "- <test> causes Ruby unit tests to be run at the end of the build process"
    puts "  The default is that unit tests are not run at the end of the build process"
    puts
    puts "- Additionally on Mac you can enforce the use of a certain compiler"
    puts "  Possible options are <icc>, <gcc47> or <clang>"
    puts "  By default the build script will look for available compilers with the following priority:"
    puts "  (1) icc, (2) clang, (3) gcc47"
    puts
    puts "The order of arguments is optional"
    puts
    exit 0
  end
end

ARGV.each do |arg|

  # Build Debug or Release?
  if(arg=="Deployment" || arg=="Release" )
    configuration = "Debug"
  end
  
  # Do a clean build?
  if(arg == "clean")
    clean = true
  end
  
  # On the Mac you can force the use of a certain compiler
  if mac?
    if(arg=="icc")
      compiler = "icc"
    elsif (arg=="gcc47")
      compiler = "gcc47"
    elsif (arg=="clang")
      compiler = "clang"
    end
  end
  
  # Do we want to post the log to Terminal?
  if (arg=="log")
    postLog = true
  end
  
  # Do we want to run the tests at the ewnd of the building process?
  if (arg=="test")
    runTests = true
  end
  
end

# Having initially set all options we need to make some further Windows-specific precautions:

if win32?
 	 if(configuration == "Development" || configuration == "Debug" )
    		configuration = "Debug"
  	else
		  if(configuration == "Deployment" || configuration == "Release" )
		    configuration = "Release"
	    end
 	 end
end

###################################################################
# Clean the Build folder
###################################################################
if(clean)
  
  if win32?
    #windows specific loc. Where ?
  else
    if (File.exists? "/usr/local/jamoma/lib")
      puts "  Cleaning dylib folder "    
      Dir.chdir "/usr/local/jamoma/lib"
      `rm -rf *.*`
    end
    
    if (File.exists? "/usr/local/jamoma/extensions")
      puts "  Cleaning Extensions folder "    
      Dir.chdir "/usr/local/jamoma/extensions"
      `rm -rf *.*`
    end
    
    if (File.exists? "/usr/local/jamoma/includes")
      puts "  Cleaning Include Header folder "
      Dir.chdir "/usr/local/jamoma/includes"
      `rm -rf *.*`
    end
  end
  
  if (File.exists? "#{glibdir}/../Builds/MaxMSP")
    
    puts " "
    puts "  Cleaning Builds folder "
    puts " "
    
    Dir.chdir "#{glibdir}/../Builds/MaxMSP"
  
    `rm -rf *.maxhelp`
  
    # Windows
    if win32?

      `rm -f *.ttdll`
      `rm -f *.dll`
      `rm -f *.mxe`

    # Mac
    else
      `rm -rf *.mxo`
      `rm -rf *.txt`
    end
  else
    `mkdir -p "#{glibdir}/../Builds/MaxMSP"`
    Dir.chdir "#{glibdir}/../Builds/MaxMSP"
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

puts
puts "  Building Jamoma #{git_tag} (rev. #{git_rev})"
puts
puts "  configuration = #{configuration}"
puts "  clean         = #{clean}"
puts "  compiler      = #{compiler}"
puts "  postLog       = #{postLog}"
puts "  runTests      = #{runTests}"
puts
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
#  ARGV = [configuration, clean, compiler, git_tag, git_rev]
  ARGV = [configuration, clean, compiler]
end



# Get a list of submodules that need to be built
submodules = Dir.entries("#{glibdir}/../Modules")

# We don't want to build the Support folder itself
submodules.delete "Support"

# Build the essentials first, since the order in which they are built is important
Dir.chdir "#{glibdir}/../Modules/Foundation"
load "build.rb"
submodules.delete "Foundation"
                     
Dir.chdir "#{glibdir}/../Modules/DSP"
load "build.rb"      
submodules.delete "DSP"
                     
Dir.chdir "#{glibdir}/../Modules/Graph"
load "build.rb"
submodules.delete "Graph"
                     
Dir.chdir "#{glibdir}/../Modules/AudioGraph"
load "build.rb"      
submodules.delete "AudioGraph"  

Dir.chdir "#{glibdir}/../Modules/Graphics"
load "build.rb"      
submodules.delete "Graphics"

if win32?
  # TODO: as long as Plugtastic only compiles AU plugins, compiling for windows isn't useful  
  # If someone is interested in doing that, please feel free!
  submodules.delete "Plugtastic"  
else
  Dir.chdir "#{glibdir}/../Modules/Plugtastic"
  load "build.rb"
  submodules.delete "Plugtastic"
end

# Build everything else in the 'Modules' folder
submodules.each {|submodule| 
  if submodule[0] != '.' && File.exists?("#{glibdir}/../Modules/#{submodule}/build.rb")
    Dir.chdir "#{glibdir}/../Modules/#{submodule}"
    load "build.rb"
  end
}

# Install Ruby Support
if win32?
  # At the moment we don't build TTRuby for Windows
  # If someone is interested in doing that, please feel free!
else
  puts
  puts "Installing Jamoma Ruby support -- this may require your password"
  puts "If you just press enter without entering your password, then the updated Jamoma Ruby support will not be installed for your use."
  Dir.chdir "#{glibdir}/../Modules/Ruby"
  load "install.rb"
end



# Get a list of UserLib submodules that need to be built
userlib_submodules = Dir.entries("#{glibdir}/../UserLib")

# If a UserLib has a 'build.rb' script in it, then we run it (otherwise do nothing)
userlib_submodules.each {|submodule| 
  if submodule[0] != '.' && File.exists?("#{glibdir}/../UserLib/#{submodule}/build.rb")
    Dir.chdir "#{glibdir}/../UserLib/#{submodule}"
    load "build.rb"
  end
}



if (runTests)
  puts
  puts "Running Unit Tests for all subprojects"
  puts
  submodules = Dir.entries("#{glibdir}/../Modules")
  # We don't want to build the Support folder itself
  submodules.delete "Support"
  submodules.each {|submodule| 
    if submodule[0] != '.' && File.exists?("#{glibdir}/../Modules/#{submodule}/test.rb") && File.directory?("#{glibdir}/../Modules/#{submodule}/Tests/unit")
      Dir.chdir "#{glibdir}/../Modules/#{submodule}"
      load "test.rb"
    end
  }
else
  puts "Not running unit tests"
end

if (postLog)
  puts
  puts "==================== SUMMARY ===================="
  puts "Combined Error log of all subprojects:"
  puts
  Dir.chdir "#{glibdir}/../Modules/Support"
  puts `cat logs-*/error*`
else
  puts "Not posting error logs"
end

puts