#!/usr/bin/env ruby -wKU
# encoding: utf-8 -wKU

# First include the functions in the jamoma lib
glibdir = "../Modules"
Dir.chdir glibdir             # change to libdir so that requires work
glibdir = Dir.pwd

$main_repository = true
require "#{glibdir}/Support/jamomalib"


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
#  ARGV = [configuration, clean, debug, git_tag, git_rev]
  ARGV = [configuration, clean, debug]
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
submodules.delete "AudioGraph"  

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

puts
puts "==================== SUMMARY ===================="
puts "Combined Error log of all subprojects:"
puts
Dir.chdir "#{glibdir}/../Modules/Support"
puts `cat logs-*/error*`
