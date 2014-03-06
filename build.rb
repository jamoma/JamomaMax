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

if mac?
`mkdir -p "#{glibdir}"/Jamoma/externals`
`mkdir -p "#{glibdir}"/Jamoma/extensions`
`mkdir -p "#{glibdir}"/Jamoma/support`
`rm -rf "#{glibdir}"/Jamoma/externals/*`
`rm -rf "#{glibdir}"/Jamoma/extensions/*`
`rm -rf "#{glibdir}"/Jamoma/support/*`
else
    winglibdir = glibdir
    winglibdir.gsub!(/\//, '\\')

    mydir = "#{winglibdir}\\Jamoma\\externals"
    `mkdir #{mydir}` if !FileTest.exist?(mydir)
    `del #{mydir}/*`

    mydir = "#{winglibdir}\\Jamoma\\extensions"
    `mkdir #{mydir}` if !FileTest.exist?(mydir)
    `del #{mydir}/*`

    mydir = "#{winglibdir}\\Jamoma\\support"
    `mkdir #{mydir}` if !FileTest.exist?(mydir)
    `del #{mydir}/*`
end

# build Max project
load "build.rb"

# copy build results into the Max Package
`cp -r "#{glibdir}"/../../Core/*/library/build/*.dylib "#{glibdir}"/Jamoma/support` if mac?
`copy -r "#{glibdir}"/../../Core/*/library/build/*.dll "#{glibdir}"/Jamoma/support` if win?
`rm "#{glibdir}"/Jamoma/support/*-i386.dylib` if mac?
`rm "#{glibdir}"/Jamoma/support/*-x86_64.dylib` if mac?
`cp -r "#{glibdir}"/../../Core/*/extensions/*/build/*.ttdylib "#{glibdir}"/Jamoma/support` if mac?
`copy -r "#{glibdir}"/../../Core/*/extensions/*/build/*.ttdll "#{glibdir}"/Jamoma/support` if win?
`rm "#{glibdir}"/Jamoma/support/*-i386.ttdylib` if mac?
`rm "#{glibdir}"/Jamoma/support/*-x86_64.ttdylib` if mac?

if win?
    Dir.foreach("#{glibdir}\\source") do |item|
        if (item.match(/.*\.mxe/)) 
            puts "ITEM #{item}"
            FileUtils.cp "#{glibdir}\\source\\#{item}\\build\\#{item}.mxe", "#{glibdir}\\Jamoma\\externals"
        end
    end
end

`mv "#{glibdir}"/Jamoma/externals/j.loader.mxo "#{glibdir}"/Jamoma/extensions/` if mac?
FileUtils.move("#{glibdir}\\Jamoma\\externals\\j.loader.mxe", "#{glibdir}\\Jamoma\\extensions") if win? && File.exists?("#{glibdir}\\Jamoma\\externals\\j.loader.mxe")

# dlls needed at running on windows, should be in support folder ?
begin
    FileUtils.cp "#{glibdir}/../../Core/Foundation/library/libxml2/win32/bin/libxml2.dll", "#{glibdir}/Jamoma/support" if win?
    FileUtils.cp "#{glibdir}/../../Core/Foundation/library/libiconv/bin/iconv.dll", "#{glibdir}/Jamoma/support" if win?
    FileUtils.cp "#{glibdir}/../../Core/DSP/extensions/AudioEngine/portaudio/Debug/PortAudio.dll", "#{glibdir}/Jamoma/support" if win?
rescue
    puts "there were problems copying DLLs for dependencies (libxml, iconv, and/or portaudio)"
end

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
