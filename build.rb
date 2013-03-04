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
`rm -rf "#{glibdir}"/max/externals/*`
`rm -rf "#{glibdir}"/max/extensions/*`

# build Max project
load "build.rb"

# copy build results into Max folders
`cp -r "#{glibdir}"/../../Builds/MaxMSP/jcom.*.mxo "#{glibdir}"/max/externals`
`cp -r "#{glibdir}"/../../Builds/MaxMSP/jcom.*.maxhelp "#{glibdir}"/max/help`
`cp -r "#{glibdir}"/max/externals/jcom.loader.* "#{glibdir}"/max/extensions`

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
    `cp -r "max/support/JamomaConfiguration.xml" "/Applications/Max5/Cycling '74/init/JamomaConfiguration.xml"`
    
    # Copy default files into Max 5 - comment this out if you don't want it
    `cp -r "max/support/jcom.textslider.maxdefines" "/Applications/Max5/Cycling '74/default-definitions/jcom.textslider.maxdefines"`
    `cp -r "max/support/jcom.ui.maxdefines" "/Applications/Max5/Cycling '74/default-definitions/jcom.ui.maxdefines"`
    
    `cp -r "max/support/JamomaArarat.maxdefaults" "/Applications/Max5/Cycling '74/default-settings/JamomaArarat.maxdefaults"`
    `cp -r "max/support/JamomaDark.maxdefaults" "/Applications/Max5/Cycling '74/default-settings/JamomaDark.maxdefaults"`
    `cp -r "max/support/JamomaGraphite.maxdefaults" "/Applications/Max5/Cycling '74/default-settings/JamomaGraphite.maxdefaults"`
    `cp -r "max/support/JamomaKulerBologna.maxdefaults" "/Applications/Max5/Cycling '74/default-settings/JamomaKulerBologna.maxdefaults"`
    `cp -r "max/support/JamomaKulerQuietCry.maxdefaults" "/Applications/Max5/Cycling '74/default-settings/JamomaKulerQuietCry.maxdefaults"`
    `cp -r "max/support/JamomaLight.maxdefaults" "/Applications/Max5/Cycling '74/default-settings/JamomaLight.maxdefaults"`
    `cp -r "max/support/JamomaMax.maxdefaults" "/Applications/Max5/Cycling '74/default-settings/JamomaMax.maxdefaults"`
    `cp -r "max/support/JamomaNoir.maxdefaults" "/Applications/Max5/Cycling '74/default-settings/JamomaNoir.maxdefaults"`
	
	# Copy into Max 6 - comment this out if you don't want it
    
	puts "Copying various files to Max6 folder"
	
    `rm -rf "/Applications/Max6/Cycling '74/extensions/jcom.loader.mxo"`
    `cp -r "max/extensions/jcom.loader.mxo" "/Applications/Max6/Cycling '74/extensions/jcom.loader.mxo"`
    `cp -r "max/support/JamomaConfiguration.xml" "/Applications/Max6/Cycling '74/init/JamomaConfiguration.xml"`
	
	# Copy default files into Max 6  - comment this out if you don't want it
    `cp -r "max/support/jcom.textslider.maxdefines" "/Applications/Max6/Cycling '74/default-definitions/jcom.textslider.maxdefines"`
    `cp -r "max/support/jcom.ui.maxdefines" "/Applications/Max6/Cycling '74/default-definitions/jcom.ui.maxdefines"`
	
    `cp -r "max/support/JamomaArarat.maxdefaults" "/Applications/Max6/Cycling '74/default-settings/JamomaArarat.maxdefaults"`
    `cp -r "max/support/JamomaDark.maxdefaults" "/Applications/Max6/Cycling '74/default-settings/JamomaDark.maxdefaults"`
    `cp -r "max/support/JamomaGraphite.maxdefaults" "/Applications/Max6/Cycling '74/default-settings/JamomaGraphite.maxdefaults"`
    `cp -r "max/support/JamomaKulerBologna.maxdefaults" "/Applications/Max6/Cycling '74/default-settings/JamomaKulerBologna.maxdefaults"`
    `cp -r "max/support/JamomaKulerQuietCry.maxdefaults" "/Applications/Max6/Cycling '74/default-settings/JamomaKulerQuietCry.maxdefaults"`
    `cp -r "max/support/JamomaLight.maxdefaults" "/Applications/Max6/Cycling '74/default-settings/JamomaLight.maxdefaults"`
    `cp -r "max/support/JamomaMax.maxdefaults" "/Applications/Max6/Cycling '74/default-settings/JamomaMax.maxdefaults"`
    `cp -r "max/support/JamomaNoir.maxdefaults" "/Applications/Max6/Cycling '74/default-settings/JamomaNoir.maxdefaults"`
    
end

