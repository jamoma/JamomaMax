#!/usr/bin/env ruby -wKU

###################################################################
# make an installer for Jamoma
# note: you must have already done a build
# note: all zips should be unzipped (3rd-party externs) too
###################################################################

# First include the functions in the jamoma lib
libdir = "."
Dir.chdir libdir        # change to libdir so that requires work
require "../library/jamomalib"   # C74 build library


@git_root = "../.."	# this is the root of the Jamoma project repository
if win32?
  Dir.chdir @git_root
  @git_root = Dir.pwd
  Dir.chdir "#{@git_root}/Tools/installertools"
  @temp = "#{@git_root}/Tools/installertools/Windows"
  @max = "#{@temp}/root"
else
  @installers = "#{@git_root}/Installers"
  @temp = "#{@installers}/temp"
  @max = "#{@temp}/Applications/Max5"
end
@c74 = "#{@max}/Cycling '74"

@path_modular    = "#{@git_root}/Modules/Modular"
@path_foundation = "#{@git_root}/Modules/Foundation"
@path_dsp        = "#{@git_root}/Modules/DSP"
@path_multicore  = "#{@git_root}/Modules/Multicore"
@path_graphics   = "#{@git_root}/Modules/Graphics"



###################################################################
# Get Revision Info -- BAD FORM, BUT THIS COPY/PASTED FROM build.rb
###################################################################

git_desc = `git describe --tags --abbrev=4 --long`.split('-')
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

if version_mod == '' || version_mod.match(/rc(.*)/)
  @version = "#{version_maj}.#{version_min}#{'.' + version_sub if version_sub.to_i > 0}"
else
  @version = "#{version_maj}.#{version_min}#{'.' + version_sub if version_sub.to_i > 0}-#{version_mod}"
end


###################################################################
# sub routines
###################################################################

def create_logs
  @build_log = File.new("#{@git_root}/Installers/installer.log", "w")
  @build_log.write("JAMOMA INSTALLER LOG: #{`date`}\n\n")
  @build_log.flush
  @error_log = File.new("#{@git_root}/Installers/error.log", "w")
  @error_log.write("JAMOMA INSTALLER ERROR LOG: #{`date`}\n\n")
  @error_log.flush
  trap("SIGINT") { die }
end
  
def die
  close_logs
  exit 0
end

def close_logs
  @build_log.close
  @error_log.close
end

def log_build(str)
  @build_log.write(str)
  @build_log.write("\n\n")
  @build_log.flush
end

def log_error(str)
  @error_log.write(str)
  @error_log.write("\n\n")
  @error_log.flush
end


# This defines a wrapper that we use to call shell commands
def cmd(commandString)
  out = ""
  err = ""
  
  Open3.popen3(commandString) do |stdin, stdout, stderr|
    out = stdout.read
    err = stderr.read
  end
  log_error(out)
  log_error(err)
end


###################################################################
# here is where we actually build the installer
###################################################################
  puts " "  
  puts "  Version string is set to Version #{@version}"
  puts " "


  # ReadMe
  puts "Updating ReadMe..."
  `cp #{@git_root}/Tools/installertools/ReadMe.Template.rtf #{@git_root}/Tools/installertools/ReadMe.rtf`
  file_path = "#{@git_root}/Tools/installertools/ReadMe.rtf"
  if FileTest.exist?(file_path)
    f = File.open("#{file_path}", "r+")
    str = f.read

    if (version_mod != '')
      str.sub!(/\\cf2 Version (.*)\n/, "\\cf2 Version #{version_maj}.#{version_min}.#{version_sub} #{version_mod} (#{git_rev})\n")
    else
      str.sub!(/\\cf2 Version (.*)\n/, "\\cf2 Version #{version_maj}.#{version_min}.#{version_sub} (#{git_rev})\n")
    end

    date = Date.today
    str.sub!(/\\u8232 (.*)\\/, "\\u8232 #{date.strftime("%d %B %Y")}\\")  

    f.rewind
    f.write(str)
    f.truncate(f.pos)
    f.close
  end




if win32?
  
  Dir.chdir("#{@git_root}/Tools/installertools/Windows")

  puts " Removing old temporary folder"
  `rm -rf root`
  `rm -f *.wixobj`
  `rm -f Jamoma*.wxs`
  `rm -f Jamoma.msi`

  puts  " Creating installer directory structure..."
  `mkdir root`
  `mkdir "root/Cycling '74"`
  `mkdir "root/Cycling '74/max-startup"`
#  `mkdir "root/Cycling '74/java"`
#  `mkdir "root/Cycling '74/java/classes"`
  `mkdir root/patches`
  `mkdir root/patches/extras`
  `mkdir root/patches/templates`
  `mkdir root/support`
  `mkdir "root/Cycling '74/default-definitions"`
  `mkdir "root/Cycling '74/default-settings"`
  `mkdir "root/Cycling '74/extensions"`
  `mkdir "root/Common Files"`
  `mkdir "root/Common Files/Jamoma"`
  `mkdir "root/Common Files/Jamoma/Extensions"`

  puts " Copying the Jamoma folder --  this could take a while..."
  `cp -r "#{@git_root}/Modules/Modular/Jamoma" 								"root/Cycling '74"`

  puts " Copying Jamoma Extensions"
  `cp "#{@git_root}/Builds"/*.ttdll  										"root/Common Files/Jamoma/Extensions"`

  puts " Copying frameworks into the support folder"
  `cp "#{@git_root}/Builds/JamomaFoundation.dll"  							root/support`
  `cp "#{@git_root}/Builds/JamomaDSP.dll"  									root/support`
  `cp "#{@git_root}/Builds/JamomaModular.dll"  								root/support`
  `cp "#{@git_root}/Modules/DSP/library/portaudio/Release/PortAudio.dll"	root/support`

  puts " Copying externals "
  `mkdir "#{@c74}/Jamoma/library/externals"`
  `cp "#{@git_root}/Builds"/*.mxe 							"#{@c74}/Jamoma/library/externals/"`
	
  puts " Moving things around : loader, templates, etc..."
  `mv "#{@c74}/Jamoma/library/third-party/WinXP/support"/*.dll				root/support`
  `mv "#{@c74}/Jamoma/library/externals/jcom.loader.mxe" 					"#{@c74}/extensions/jcom.loader.mxe"`
  `cp "#{@c74}/Jamoma/support"/*.maxdefaults   								"#{@c74}/default-settings"`
  `cp "#{@c74}/Jamoma/support"/*.maxdefines    								"#{@c74}/default-definitions"`
  `cp "#{@c74}/Jamoma/documentation/jamoma-overview.maxpat" 				root/patches/extras/jamoma-overview.maxpat`
  `cp "#{@c74}/Jamoma/documentation/jamoma-templates/_Jamoma_Patcher_.maxpat"      	root/patches/templates/_Jamoma_Patcher_.maxpat`
  `cp "#{@c74}/Jamoma/documentation/jamoma-templates/jalg.template.audio~.maxpat"  	root/patches/templates/jalg.template.audio~.maxpat`
  `cp "#{@c74}/Jamoma/documentation/jamoma-templates/jalg.template.video%.maxpat"  	root/patches/templates/jalg.template.video%.maxpat`
  `cp "#{@c74}/Jamoma/documentation/jamoma-templates/jmod.template.audio~.maxpat"  	root/patches/templates/jmod.template.audio~.maxpat`
  `cp "#{@c74}/Jamoma/documentation/jamoma-templates/jmod.template.control.maxpat" 	root/patches/templates/jmod.template.control.maxpat`
  `cp "#{@c74}/Jamoma/documentation/jamoma-templates/jmod.template.maxhelp"        	root/patches/templates/jmod.template.maxhelp`
  `cp "#{@c74}/Jamoma/documentation/jamoma-templates/jmod.template.video%.maxpat"  	root/patches/templates/jmod.template.video%.maxpat`
  `cp "#{@c74}/Jamoma/documentation/jamoma-templates/layout.xml"                   	root/patches/templates/layout.xml`

  puts " Copying readme, license, etc...."
  `cp "#{@git_root}/Tools/installertools/GNU-LGPL.rtf" 							root/License.rtf`
  `cp "#{@git_root}/Tools/installertools/ReadMe.rtf"   							root/ReadMe.rtf`

  puts " Removing files that are not needed (.zips, mac, externs, etc)..."
  `rm -rf  "#{@c74}/Jamoma/library/third-party/Mac"`
  `rm -rf  "#{@c74}/Jamoma/library/third-party/WinXP"/*.zip`
  `rm -rf  "#{@c74}/Jamoma/library/third-party/WinXP/support"`
  `rm -rf  "#{@c74}/Jamoma/support"`

 puts " Setting Version Number in Wix Source"
  f = File.open("main.wxs", "r+")
  str = f.read
  str.gsub!(/Version="(.*)"/, "Version=\"#{@version}\"")
  f.rewind
  f.write(str)
  f.close

  puts " Building Package -- this could take a while..."

  puts " Making candle with paraffin"
  puts `../wix/Paraffin.exe -dir "root/Cycling '74"                     -custom JamomaC74        -g -direXclude .svn -ext .WXS JamomaC74.wxs`
  puts `../wix/Paraffin.exe -dir root/patches/                          -custom JamomaPatches    -g -direXclude .svn -ext .WXS JamomaPatches.wxs`
  puts `../wix/Paraffin.exe -dir root/support/                          -custom JamomaSupport    -g -direXclude .svn -ext .WXS JamomaSupport.wxs`
  puts `../wix/Paraffin.exe -dir "root/Common Files/Jamoma/Extensions/" -custom JamomaExtensions -g -direXclude .svn -ext .WXS JamomaExtensions.wxs`

  puts " Fixing JamomaExtensions Source"
  # Here we need to perform a substitution on the JamomaExtensions Wix module, because want this to go into a different directory
  f = File.open("#{@temp}/JamomaExtensions.wxs", "r+")
  str = f.read
  str.gsub!(/TARGETDIR/, 'EXTENSIONSDIR')
  f.rewind
  f.write(str)
  f.close
 
  puts " Compiling Wix Sources..."
  `../wix/candle.exe -dvar.ProductVersion="#{@version}" -dvar.ProductName="Jamoma #{@version}" /nologo JamomaC74.wxs`
  `../wix/candle.exe -dvar.ProductVersion="#{@version}" -dvar.ProductName="Jamoma #{@version}" /nologo JamomaPatches.wxs`
  `../wix/candle.exe -dvar.ProductVersion="#{@version}" -dvar.ProductName="Jamoma #{@version}" /nologo JamomaSupport.wxs`
  `../wix/candle.exe -dvar.ProductVersion="#{@version}" -dvar.ProductName="Jamoma #{@version}" /nologo JamomaExtensions.wxs`
  `../wix/candle.exe -dvar.ProductVersion="#{@version}" -dvar.ProductName="Jamoma #{@version}" /nologo main.wxs`
  `../wix/candle.exe -dvar.ProductVersion="#{@version}" -dvar.ProductName="Jamoma #{@version}" /nologo ui.wxs` 
  
  puts " Now making the installer" 
  puts `../wix/light.exe /nologo /out Jamoma.msi main.wixobj JamomaC74.wixobj JamomaPatches.wixobj JamomaSupport.wixobj JamomaExtensions.wixobj ui.wixobj ../wix/wixui.wixlib -loc ../wix/WixUI_en-us.wxl`


else 
# mac
  `mkdir -pv \"#{@installers}\"`  # need to make directory before the logs are created, and thus before cmd() is ready to be used
  create_logs  
  
  puts "  Creating installer directory structure @ #{@temp} ..."
  cmd("rm -rfv \"#{@temp}\"")                                            # remove an old temp dir if it exists
  cmd("mkdir -pv \"#{@temp}\"")                                         # now make a clean one, and build dir structure in it
  cmd("mkdir -pv \"#{@temp}/Library/Frameworks\"")
  cmd("mkdir -pv \"#{@temp}/Library/Application Support/Jamoma/Extensions\"")
  cmd("mkdir -pv \"#{@max}\"")
  cmd("mkdir -pv \"#{@max}/patches/templates\"")
  cmd("mkdir -pv \"#{@max}/patches/extras\"")
  cmd("mkdir -pv \"#{@c74}\"")
#  cmd("mkdir -pv \"#{@c74}/java\"")
#  cmd("mkdir -pv \"#{@c74}/java/classes\"")
#  cmd("mkdir -pv \"#{@c74}/java/classes/cueManager\"")
  cmd("mkdir -pv \"#{@c74}/extensions\"")
  cmd("mkdir -pv \"#{@c74}/default-definitions\"")
  cmd("mkdir -pv \"#{@c74}/default-settings\"")
  cmd("mkdir -pv \"#{@installers}/resources\"")
  cmd("mkdir -pv \"#{@installers}/Jamoma\"")

  puts "  Copying the Jamoma folder..."
  cmd("cp -rpv \"#{@git_root}/Modules/Modular/Jamoma\" \"#{@c74}/Jamoma\"")

  puts "  Copying Shared Libraries"
  cmd("cp -rpv \"#{@path_foundation}/library/build/UninstalledProducts/JamomaFoundation.framework\"          \"#{@temp}/Library/Frameworks/JamomaFoundation.framework\" ")
  cmd("cp -rpv \"#{@path_dsp}/library/build/UninstalledProducts/JamomaDSP.framework\"                        \"#{@temp}/Library/Frameworks/JamomaDSP.framework\" ")
  cmd("cp -rpv \"#{@path_graphics}/library/build/UninstalledProducts/JamomaGraphics.framework\"              \"#{@temp}/Library/Frameworks/JamomaGraphics.framework\" ")
  cmd("cp -rpv \"#{@path_multicore}/library/build/UninstalledProducts/JamomaMulticore.framework\"            \"#{@temp}/Library/Frameworks/JamomaMulticore.framework\" ")
  cmd("cp -rpv \"#{@path_modular}/SourceCode/Framework/build/UninstalledProducts/JamomaModular.framework\"   \"#{@temp}/Library/Frameworks/JamomaModular.framework\" ")

  puts "  Copying Extensions"
  cmd("cp -rpv \"/Library/Application Support/Jamoma/Extensions\"/*                                          \"#{@temp}/Library/Application Support/Jamoma/Extensions\"") 

  puts "  Copying Externals"
  cmd("cp -rpv \"#{@git_root}/Builds\"                                                                       \"#{@c74}/Jamoma/externals\" ")
  puts "  Removing ≈-Externals" 
  cmd("rm -rfv \"#{@c74}/Jamoma/externals/\"*≈.mxo")
  
  puts "  Removing files that are not needed (.zips, windows externs, etc)..."  
  cmd("rm -rfv \"#{@c74}/Jamoma/externals/\"readme.txt")
#  cmd("rm -fv \"#{@c74}/Jamoma/library/externals/\"*.zip")
#  cmd("rm -fv \"#{@c74}/Jamoma/library/externals/\"*.log")  
#  cmd("rm -fv \"#{@c74}/Jamoma/library/externals/JamomaFramework.dll\"")
#  cmd("rm -fv \"#{@c74}/Jamoma/library/externals/JamomaDSP.dll\"") 
#  cmd("rm -rfv \"#{@c74}/Jamoma/library/externals/TTBlueExtensions\"")
#  cmd("rm -rfv \"#{@c74}/Jamoma/library/externals/windows\"")
#  cmd("rm -rfv \"#{@c74}/Jamoma/library/externals/ramplib_windows\"")
#  cmd("rm -fv \"#{@c74}/Jamoma/library/third-party/Mac/\"*.zip")
#  cmd("rm -fv \"#{@c74}/Jamoma/library/third-party/Mac\"*.dmg")
  cmd("rm -rfv \"#{@c74}/Jamoma/library/third-party/WinXP\"") 
  

  puts "  Moving things around (loader, templates, etc)..."
  cmd("cp \"#{@c74}/Jamoma/documentation/jamoma-templates/\"*       \"#{@max}/patches/templates\"")
  cmd("cp \"#{@c74}/Jamoma/documentation/jamoma-overview.maxpat\"   \"#{@max}/patches/extras\"")
  cmd("mv \"#{@c74}/Jamoma/externals/jcom.loader.mxo\"              \"#{@c74}/extensions/\"")
  cmd("mv \"#{@c74}/Jamoma/support\"/*.maxdefaults                  \"#{@c74}/default-settings\"")
  cmd("mv \"#{@c74}/Jamoma/support\"/*.maxdefines                   \"#{@c74}/default-definitions\"")   
  cmd("rm -rfv \"#{@c74}/Jamoma/support\"")  
  
  # cmd("mv \"#{@c74}/Jamoma/support/jcom.ui.maxdefines\" \"#{@c74}/default-definitions/jcom.ui.maxdefines\"")
  # now we have several maxdefines
#  cmd("cp \"#{@c74}/Jamoma/modules/control/cueManager/java-classes/Cue.class\" \"#{@c74}/java/classes/cueManager\"") 
#  cmd("cp \"#{@c74}/Jamoma/modules/control/cueManager/java-classes/CueList.class\" \"#{@c74}/java/classes/cueManager\"") 
#  cmd("cp \"#{@c74}/Jamoma/modules/control/cueManager/java-classes/Data.class\" \"#{@c74}/java/classes/cueManager\"") 
#  cmd("cp \"#{@c74}/Jamoma/modules/control/cueManager/java-classes/CueManager.class\" \"#{@c74}/java/classes/cueManager\"") 

  puts "  Copying readme, license, etc...."
  cmd("cp \"#{@git_root}/Tools/installertools/ReadMe.rtf\"   \"#{@installers}/resources\"")
  cmd("cp \"#{@git_root}/Tools/installertools/ReadMe.rtf\"   \"#{@installers}/Jamoma\"")
  cmd("cp \"#{@git_root}/Tools/installertools/GNU-LGPL.rtf\" \"#{@installers}/resources/License.rtf\"")
  cmd("cp \"#{@git_root}/Tools/installertools/GNU-LGPL.rtf\" \"#{@installers}/Jamoma/License.rtf\"")
  cmd("cp \"Uninstall.command\"           \"#{@installers}/Jamoma/Uninstall.command\"")

  puts "  Building Package -- this could take a while..."
  cmd("rm -rfv \"#{@installers}/MacInstaller/Jamoma.pkg\"")
  cmd("/Developer/usr/bin/packagemaker --verbose --root \"#{@temp}\" --id org.jamoma.modular --out \"#{@installers}/Jamoma/Jamoma-#{@version}.pkg\" --version #{@version} --title Jamoma-#{@version} --resources \"#{@installers}/resources\" --target 10.4 --domain system --root-volume-only")

  # Warning: the zip thing seems to be a real problem on the Mac using OS 10.5 at least...  Renaming the zip ends up causing the install to fail
  #puts "  Zipping the Installer..."
  #cmd("rm -rfv \"#{@git_root}/Installers/Jamoma-0.4.6.zip\"")
  #cmd("zip -rj \"#{@git_root}/Installers/Jamoma.pkg.zip\" \"#{@git_root}/Installers/Jamoma.pkg\"")
  #cmd("mv \"#{@git_root}/Installers/Jamoma.pkg.zip\" \"#{@git_root}/Installers/Jamoma-0.4.6-Mac.pkg.zip\"")

  puts "  Creating Disk Image..."
  if version_mod.match(/rc(.*)/)
    cmd("rm -rfv \"#{@installers}/Jamoma-#{@version}#{version_mod}-Mac.dmg\"")
    cmd("hdiutil create -srcfolder \"#{@installers}/Jamoma\" \"#{@installers}/Jamoma-#{@version}-#{version_mod}-Mac.dmg\"")
  else
    cmd("rm -rfv \"#{@installers}/Jamoma-#{@version}-Mac.dmg\"")
    cmd("hdiutil create -srcfolder \"#{@installers}/Jamoma\" \"#{@installers}/Jamoma-#{@version}-Mac.dmg\"")
  end
  

  puts "  All done!"

  close_logs
  puts ""


end

exit 0
