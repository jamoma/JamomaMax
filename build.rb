#!/usr/bin/env ruby -wKU
# encoding: utf-8

# move to Max directory
glibdir = "."
Dir.chdir glibdir
glibdir = Dir.pwd


# edit JamomaMax project name
projectNameParts = glibdir.split('/')
projectName = projectNameParts.last;
projectName.gsub!(/Jamoma/, "")
ENV['JAMOMAPROJECT'] = projectName

# define build variables and function
@projectName = projectName
@log_root = "./logs-#{@projectName}"
@svn_root = "../#{@projectName}"
@fail_array = Array.new
@zerolink = false

def cleanAndBuildExternal(glibdir, external)
    puts "Clean and build: #{external}"
    Dir.chdir "#{glibdir}/source/#{external}"
    `xcodebuild clean`
    `xcodebuild build`
end

# move to Core/Shared directory to include jamomalib.rb
Dir.chdir "#{glibdir}/../../Core/Shared"
require "#{glibdir}/../../Core/Shared/jamomalib.rb"

# prepare logs and folders
create_logs(@projectName)
zero_count

`mkdir -p "#{glibdir}"/Jamoma/externals`
`mkdir -p "#{glibdir}"/Jamoma/extensions`
`mkdir -p "#{glibdir}"/Jamoma/support`
`rm -rf "#{glibdir}"/Jamoma/externals/*`
`rm -rf "#{glibdir}"/Jamoma/extensions/*`
`rm -rf "#{glibdir}"/Jamoma/support/*`

# build Max project
load "build.rb"

# copy build results into the Max Package
`cp -r "#{glibdir}"/../../Core/*/library/build/*.dylib "#{glibdir}"/Jamoma/support` if mac?
`cp -r "#{glibdir}"/../../Core/*/library/build/*.dll "#{glibdir}"/Jamoma/support` if win?
`rm "#{glibdir}"/Jamoma/support/*-i386.dylib` if mac?
`rm "#{glibdir}"/Jamoma/support/*-x86_64.dylib` if mac?
`cp -r "#{glibdir}"/../../Core/*/extensions/*/build/*.ttdylib "#{glibdir}"/Jamoma/support` if mac?
`cp -r "#{glibdir}"/../../Core/*/extensions/*/build/*.ttdll "#{glibdir}"/Jamoma/support` if win?
`rm "#{glibdir}"/Jamoma/support/*-i386.ttdylib` if mac?
`rm "#{glibdir}"/Jamoma/support/*-x86_64.ttdylib` if mac?

`cp -r "#{glibdir}"/source/*/build/*.mxe "#{glibdir}"/Jamoma/externals/` if win?

`mv "#{glibdir}"/Jamoma/externals/j.loader.mxo "#{glibdir}"/Jamoma/extensions/` if mac?
`mv "#{glibdir}"/Jamoma/externals/j.loader.mxe "#{glibdir}"/Jamoma/extensions/` if win?

# dlls needed at running on windows, should be in support folder ?
`cp -r "#{glibdir}"/../../Core/Foundation/library/libxml2/win32/bin/libxml2.dll "#{glibdir}"/Jamoma/support` if win?
`cp -r "#{glibdir}"/../../Core/Foundation/library/libiconv/bin/iconv.dll "#{glibdir}"/Jamoma/support` if win?
`cp -r "#{glibdir}"/../../Core/DSP/library/portaudio/Debug/PortAudio.dll "#{glibdir}"/Jamoma/support` if win?

# Making sure that twin projects build on Mac
if win?
else
    
    puts "Making sure that twin projects build on Mac"
    
    cleanAndBuildExternal glibdir, "j.in"
    cleanAndBuildExternal glibdir, "j.in~"
    
    cleanAndBuildExternal glibdir, "j.message"
    cleanAndBuildExternal glibdir, "j.parameter"
    
    cleanAndBuildExternal glibdir, "j.out"
    cleanAndBuildExternal glibdir, "j.out~"
    
    cleanAndBuildExternal glibdir, "j.messageArray"
    cleanAndBuildExternal glibdir, "j.parameterArray"
    cleanAndBuildExternal glibdir, "j.remoteArray"
    cleanAndBuildExternal glibdir, "j.returnArray"
    
    cleanAndBuildExternal glibdir, "j.receive"
    cleanAndBuildExternal glibdir, "j.receive~"
    
    cleanAndBuildExternal glibdir, "j.send"
    cleanAndBuildExternal glibdir, "j.send~"
    
end


# post build
puts "post-build..."
Dir.chdir "#{glibdir}"

if  win?
else
  puts
  puts "We no longer copy files to Max 5 or Max 6 folders, as we now use the Max 6.1 Packages structure"
  puts
#    # Copy into Max 5 - comment this out if you don't want it
#    
#    puts "Copying various files to Max5 folder"
#    
#    `rm -rf "/Applications/Max5/Cycling '74/extensions/j.loader.mxo"`
#    `cp -r "Jamoma/extensions/j.loader.mxo" "/Applications/Max5/Cycling '74/extensions/j.loader.mxo"`
#    `cp -r "Jamoma/init/JamomaConfiguration.xml" "/Applications/Max5/Cycling '74/init/JamomaConfiguration.xml"`
#    
#    # Copy default files into Max 5 - comment this out if you don't want it
#    `cp -r "Jamoma/default-definitions/j.textslider.maxdefines" "/Applications/Max5/Cycling '74/default-definitions/j.textslider.maxdefines"`
#    `cp -r "Jamoma/default-definitions/j.ui.maxdefines" "/Applications/Max5/Cycling '74/default-definitions/j.ui.maxdefines"`
#    
#    `cp -r "Jamoma/default-settings/JamomaArarat.maxdefaults" "/Applications/Max5/Cycling '74/default-settings/JamomaArarat.maxdefaults"`
#    `cp -r "Jamoma/default-settings/JamomaDark.maxdefaults" "/Applications/Max5/Cycling '74/default-settings/JamomaDark.maxdefaults"`
#    `cp -r "Jamoma/default-settings/JamomaGraphite.maxdefaults" "/Applications/Max5/Cycling '74/default-settings/JamomaGraphite.maxdefaults"`
#    `cp -r "Jamoma/default-settings/JamomaKulerBologna.maxdefaults" "/Applications/Max5/Cycling '74/default-settings/JamomaKulerBologna.maxdefaults"`
#    `cp -r "Jamoma/default-settings/JamomaKulerQuietCry.maxdefaults" "/Applications/Max5/Cycling '74/default-settings/JamomaKulerQuietCry.maxdefaults"`
#    `cp -r "Jamoma/default-settings/JamomaLight.maxdefaults" "/Applications/Max5/Cycling '74/default-settings/JamomaLight.maxdefaults"`
#    `cp -r "Jamoma/default-settings/JamomaMax.maxdefaults" "/Applications/Max5/Cycling '74/default-settings/JamomaMax.maxdefaults"`
#    `cp -r "Jamoma/default-settings/JamomaNoir.maxdefaults" "/Applications/Max5/Cycling '74/default-settings/JamomaNoir.maxdefaults"`
#	
#	# Copy into Max 6 - comment this out if you don't want it
#    
#	puts "Copying various files to Max6 folder (this is no longer needed in Max 6.1)"
#	
#    `rm -rf "/Applications/Max6/Cycling '74/extensions/j.loader.mxo"`
#    `cp -r "Jamoma/extensions/j.loader.mxo" "/Applications/Max6/Cycling '74/extensions/j.loader.mxo"`
#    `cp -r "Jamoma/init/JamomaConfiguration.xml" "/Applications/Max6/Cycling '74/init/JamomaConfiguration.xml"`
	
	# Copy default files into Max 6  - comment this out if you don't want it
#    `cp -r "Jamoma/default-definitions/j.textslider.maxdefines" "/Applications/Max6/Cycling '74/default-definitions/j.textslider.maxdefines"`
#    `cp -r "Jamoma/default-definitions/j.ui.maxdefines" "/Applications/Max6/Cycling '74/default-definitions/j.ui.maxdefines"`
#	
#    `cp -r "Jamoma/default-settings/JamomaArarat.maxdefaults" "/Applications/Max6/Cycling '74/default-settings/JamomaArarat.maxdefaults"`
#    `cp -r "Jamoma/default-settings/JamomaDark.maxdefaults" "/Applications/Max6/Cycling '74/default-settings/JamomaDark.maxdefaults"`
#    `cp -r "Jamoma/default-settings/JamomaGraphite.maxdefaults" "/Applications/Max6/Cycling '74/default-settings/JamomaGraphite.maxdefaults"`
#    `cp -r "Jamoma/default-settings/JamomaKulerBologna.maxdefaults" "/Applications/Max6/Cycling '74/default-settings/JamomaKulerBologna.maxdefaults"`
#    `cp -r "Jamoma/default-settings/JamomaKulerQuietCry.maxdefaults" "/Applications/Max6/Cycling '74/default-settings/JamomaKulerQuietCry.maxdefaults"`
#    `cp -r "Jamoma/default-settings/JamomaLight.maxdefaults" "/Applications/Max6/Cycling '74/default-settings/JamomaLight.maxdefaults"`
#    `cp -r "Jamoma/default-settings/JamomaMax.maxdefaults" "/Applications/Max6/Cycling '74/default-settings/JamomaMax.maxdefaults"`
#    `cp -r "Jamoma/default-settings/JamomaNoir.maxdefaults" "/Applications/Max6/Cycling '74/default-settings/JamomaNoir.maxdefaults"`
    
end

