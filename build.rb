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

`mkdir -p "#{glibdir}"/max/externals`
`mkdir -p "#{glibdir}"/max/extensions`
`mkdir -p "#{glibdir}"/max/support`
`rm -rf "#{glibdir}"/max/externals/*`
`rm -rf "#{glibdir}"/max/extensions/*`
`rm -rf "#{glibdir}"/max/support/*`

# build Max project
load "build.rb"

# copy build results into the Max Package
`cp -r "#{glibdir}"/../../Core/*/library/build/*.dylib "#{glibdir}"/max/support`
`rm "#{glibdir}"/max/support/*-i386.dylib`
`rm "#{glibdir}"/max/support/*-x86_64.dylib`
`cp -r "#{glibdir}"/../../Core/*/extensions/*/build/*.ttdylib "#{glibdir}"/max/support`
`rm "#{glibdir}"/max/support/*-i386.ttdylib`
`rm "#{glibdir}"/max/support/*-x86_64.ttdylib`
`cp -r "#{glibdir}"/../../Core/*/extensions/*/build/*.ttdll "#{glibdir}"/max/support`
`mv "#{glibdir}"/max/externals/jcom.loader.mxo "#{glibdir}"/max/extensions/`

# Making sure that twin projects build on Mac
if win?
else
    
    puts "Making sure that twin projects build on Mac"
    
    cleanAndBuildExternal glibdir, "jcom.in"
    cleanAndBuildExternal glibdir, "jcom.in~"
    cleanAndBuildExternal glibdir, "jcom.message"
    cleanAndBuildExternal glibdir, "jcom.parameter"
    cleanAndBuildExternal glibdir, "jcom.out"
    cleanAndBuildExternal glibdir, "jcom.out~"
    
end


# post build
puts "post-build..."
Dir.chdir "#{glibdir}"

if  win?
else
    
    # Copy into Max 5 - comment this out if you don't want it
    
    puts "Copying various files to Max5 folder"
    
    `rm -rf "/Applications/Max5/Cycling '74/extensions/jcom.loader.mxo"`
    `cp -r "max/extensions/jcom.loader.mxo" "/Applications/Max5/Cycling '74/extensions/jcom.loader.mxo"`
    `cp -r "max/init/JamomaConfiguration.xml" "/Applications/Max5/Cycling '74/init/JamomaConfiguration.xml"`
    
    # Copy default files into Max 5 - comment this out if you don't want it
    `cp -r "max/default-definitions/jcom.textslider.maxdefines" "/Applications/Max5/Cycling '74/default-definitions/jcom.textslider.maxdefines"`
    `cp -r "max/default-definitions/jcom.ui.maxdefines" "/Applications/Max5/Cycling '74/default-definitions/jcom.ui.maxdefines"`
    
    `cp -r "max/default-settings/JamomaArarat.maxdefaults" "/Applications/Max5/Cycling '74/default-settings/JamomaArarat.maxdefaults"`
    `cp -r "max/default-settings/JamomaDark.maxdefaults" "/Applications/Max5/Cycling '74/default-settings/JamomaDark.maxdefaults"`
    `cp -r "max/default-settings/JamomaGraphite.maxdefaults" "/Applications/Max5/Cycling '74/default-settings/JamomaGraphite.maxdefaults"`
    `cp -r "max/default-settings/JamomaKulerBologna.maxdefaults" "/Applications/Max5/Cycling '74/default-settings/JamomaKulerBologna.maxdefaults"`
    `cp -r "max/default-settings/JamomaKulerQuietCry.maxdefaults" "/Applications/Max5/Cycling '74/default-settings/JamomaKulerQuietCry.maxdefaults"`
    `cp -r "max/default-settings/JamomaLight.maxdefaults" "/Applications/Max5/Cycling '74/default-settings/JamomaLight.maxdefaults"`
    `cp -r "max/default-settings/JamomaMax.maxdefaults" "/Applications/Max5/Cycling '74/default-settings/JamomaMax.maxdefaults"`
    `cp -r "max/default-settings/JamomaNoir.maxdefaults" "/Applications/Max5/Cycling '74/default-settings/JamomaNoir.maxdefaults"`
	
	# Copy into Max 6 - comment this out if you don't want it
    
	puts "Copying various files to Max6 folder (this is no longer needed in Max 6.1)"
	
    `rm -rf "/Applications/Max6/Cycling '74/extensions/jcom.loader.mxo"`
    `cp -r "max/extensions/jcom.loader.mxo" "/Applications/Max6/Cycling '74/extensions/jcom.loader.mxo"`
    `cp -r "max/init/JamomaConfiguration.xml" "/Applications/Max6/Cycling '74/init/JamomaConfiguration.xml"`
	
	# Copy default files into Max 6  - comment this out if you don't want it
    `cp -r "max/default-definitions/jcom.textslider.maxdefines" "/Applications/Max6/Cycling '74/default-definitions/jcom.textslider.maxdefines"`
    `cp -r "max/default-definitions/jcom.ui.maxdefines" "/Applications/Max6/Cycling '74/default-definitions/jcom.ui.maxdefines"`
	
    `cp -r "max/default-settings/JamomaArarat.maxdefaults" "/Applications/Max6/Cycling '74/default-settings/JamomaArarat.maxdefaults"`
    `cp -r "max/default-settings/JamomaDark.maxdefaults" "/Applications/Max6/Cycling '74/default-settings/JamomaDark.maxdefaults"`
    `cp -r "max/default-settings/JamomaGraphite.maxdefaults" "/Applications/Max6/Cycling '74/default-settings/JamomaGraphite.maxdefaults"`
    `cp -r "max/default-settings/JamomaKulerBologna.maxdefaults" "/Applications/Max6/Cycling '74/default-settings/JamomaKulerBologna.maxdefaults"`
    `cp -r "max/default-settings/JamomaKulerQuietCry.maxdefaults" "/Applications/Max6/Cycling '74/default-settings/JamomaKulerQuietCry.maxdefaults"`
    `cp -r "max/default-settings/JamomaLight.maxdefaults" "/Applications/Max6/Cycling '74/default-settings/JamomaLight.maxdefaults"`
    `cp -r "max/default-settings/JamomaMax.maxdefaults" "/Applications/Max6/Cycling '74/default-settings/JamomaMax.maxdefaults"`
    `cp -r "max/default-settings/JamomaNoir.maxdefaults" "/Applications/Max6/Cycling '74/default-settings/JamomaNoir.maxdefaults"`
    
end

