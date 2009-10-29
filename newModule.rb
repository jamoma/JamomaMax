#!/usr/bin/env ruby -wKU

# First include the functions in the jamoma lib
glibdir = "."
Dir.chdir glibdir             # change to libdir so that requires work
glibdir = Dir.pwd
require "supports/jamomalib"


###################################################################
# Check Args
###################################################################

if(ARGV.length < 1)
  puts "usage: "
  puts "newModule.rb <required:newModuleName(no jmod. prefix)> <optional:moduleType{control(default), audio, spatialization, video, openGL}> <optional:path/to/newModuleParentFolder> "
  puts "examples:"
  puts "  ./newModule.rb tap.specialEffect~ audio /Users/tim/code/Jamoma/UserLib/Tap.Tools"
  puts "  ./newModule.rb foo~ audio"
  puts "  ./newModule.rb randomThing"
  exit 0;
end

moduleName = ARGV[0]
moduleType = "control"
parentFolderPath = "#{glibdir}/../Modules/Modular/Jamoma/modules"

moduleType = ARGV[1] if ARGV.length>1
parentFolderPath = ARGV[2] if ARGV.length>2

moduleFolder = "#{parentFolderPath}/#{moduleType}/#{moduleName}"

templateName = "_template"
templateName = "_template~"     if moduleType == "audio"
templateName = "_sur.template~" if moduleType == "spatialization"
templateName = "_template%"     if moduleType == "video"
templateName = "_gl.template%"  if moduleType == "openGL"
templateFolder = "#{glibdir}/../Modules/Modular/Jamoma/modules/#{moduleType}/#{templateName}"


###################################################################
# COPY

`mkdir -pv "#{moduleFolder}"`
`cp -v "#{templateFolder}"/* "#{moduleFolder}"`

`mv "#{moduleFolder}"/jalg.#{templateName}.maxpat        "#{moduleFolder}"/jalg.#{moduleName}.maxpat`
`mv "#{moduleFolder}"/jmod.#{templateName}.maxpat        "#{moduleFolder}"/jmod.#{moduleName}.maxpat`
`mv "#{moduleFolder}"/jmod.#{templateName}.test.maxpat   "#{moduleFolder}"/jmod.#{moduleName}.test.maxpat`
`mv "#{moduleFolder}"/jmod.#{templateName}.maxhelp       "#{moduleFolder}"/jmod.#{moduleName}.maxhelp`
`mv "#{moduleFolder}"/jmod.#{templateName}.xml           "#{moduleFolder}"/jmod.#{moduleName}.xml`
`mv "#{moduleFolder}"/jmod.#{templateName}.html          "#{moduleFolder}"/jmod.#{moduleName}.html`


###################################################################
# SUBSTITUTIONS

def substituteStringsOnFile (filepath, oldString, newString)
  if FileTest.exist?(filepath)
    f = File.open("#{filepath}", "r+")
    str = f.read

    str.gsub!(oldString, newString)

    f.rewind
    f.write(str)
    f.truncate(f.pos)
    f.close
  end
end

substituteStringsOnFile("#{moduleFolder}/jalg.#{moduleName}.maxpat",  "#{templateName}", "#{moduleName}")
substituteStringsOnFile("#{moduleFolder}/jmod.#{moduleName}.maxpat",  "#{templateName}", "#{moduleName}")
substituteStringsOnFile("#{moduleFolder}/jmod.#{moduleName}.test.maxpat",  "#{templateName}", "#{moduleName}")
substituteStringsOnFile("#{moduleFolder}/jmod.#{moduleName}.maxhelp", "#{templateName}", "#{moduleName}")
substituteStringsOnFile("#{moduleFolder}/jmod.#{moduleName}.xml",     "#{templateName}", "#{moduleName}")
substituteStringsOnFile("#{moduleFolder}/jmod.#{moduleName}.html",    "#{templateName}", "#{moduleName}")

