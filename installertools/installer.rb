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


@svn_root = "../.."	# this is the root of the Jamoma project repository
if win32?
  Dir.chdir @svn_root
  @svn_root = Dir.pwd
  Dir.chdir "#{@svn_root}/Tools/installertools"
  @temp = "#{@svn_root}/Tools/installertools/Windows"
  @max = "#{@temp}/root"
else
  @installers = "#{@svn_root}/../Installers"
  @temp = "#{@installers}/temp"
  @max = "#{@temp}/Applications/Max5"
end
@c74 = "#{@max}/Cycling '74"

@version = "0.5"


###################################################################
# sub routines
###################################################################

def create_logs
  @build_log = File.new("#{@svn_root}/Tools/installertools/_installer.log", "w")
  @build_log.write("JAMOMA INSTALLER LOG: #{`date`}\n\n")
  @build_log.flush
  @error_log = File.new("#{@svn_root}/Tools/installertools/_error.log", "w")
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

if win32?
  
  Dir.chdir("#{@svn_root}/Tools/installertools/Windows")

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
  `cp -r "#{@svn_root}/Modules/Modular/Jamoma" 						"root/Cycling '74"`

  puts " Copying Jamoma Extensions"
  `cp "#{@svn_root}/Builds"/*.ttdll  							"root/Common Files/Jamoma/Extensions"`

  puts " Copying frameworks into the support folder"
  `cp "#{@svn_root}/Builds/JamomaFoundation.dll"  					root/support`
  `cp "#{@svn_root}/Builds/JamomaDSP.dll"  						root/support`
  `cp "#{@svn_root}/Builds/JamomaModular.dll"  						root/support`

  puts " Copying externals "
  `mkdir "#{@c74}/Jamoma/library/externals"`
  `cp "#{@svn_root}/Builds"/*.mxe 							"#{@c74}/Jamoma/library/externals/"`
	
  puts " Moving things around : loader, templates, etc..."
  `mv "#{@c74}/Jamoma/library/third-party/WinXP/support"/*.dll				root/support`
  `mv "#{@c74}/Jamoma/library/externals/jcom.loader.mxe" 				"#{@c74}/extensions/jcom.loader.mxe"`
  `cp "#{@c74}/Jamoma/support"/*.maxdefaults   						"#{@c74}/default-settings"`
  `cp "#{@c74}/Jamoma/support"/*.maxdefines    						"#{@c74}/default-definitions"`
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
  `cp "#{@c74}/Jamoma/GNU-LGPL.rtf" 							root/License.rtf`
  `cp "#{@c74}/Jamoma/ReadMe.rtf"   							root/ReadMe.rtf`

  puts " Removing files that are not needed (.zips, mac, externs, etc)..."
  `rm -rf  "#{@c74}/Jamoma/library/third-party/Mac"`
  `rm -rf  "#{@c74}/Jamoma/library/third-party/WinXP"/*.zip`
  `rm -rf  "#{@c74}/Jamoma/library/third-party/WinXP/support"`
  `rm -rf  "#{@c74}/Jamoma/support"`

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
  `../wix/candle.exe -dvar.ProductVersion="0.5" -dvar.ProductName="Jamoma 0.5" /nologo JamomaC74.wxs`
  `../wix/candle.exe -dvar.ProductVersion="0.5" -dvar.ProductName="Jamoma 0.5" /nologo JamomaPatches.wxs`
  `../wix/candle.exe -dvar.ProductVersion="0.5" -dvar.ProductName="Jamoma 0.5" /nologo JamomaSupport.wxs`
  `../wix/candle.exe -dvar.ProductVersion="0.5" -dvar.ProductName="Jamoma 0.5" /nologo JamomaExtensions.wxs`
  `../wix/candle.exe -dvar.ProductVersion="0.5" -dvar.ProductName="Jamoma 0.5" /nologo main.wxs`
  `../wix/candle.exe -dvar.ProductVersion="0.5" -dvar.ProductName="Jamoma 0.5" /nologo ui.wxs` 
  
  puts " Now making the installer" 
  puts `../wix/light.exe /nologo /out Jamoma.msi main.wixobj JamomaC74.wixobj JamomaPatches.wixobj JamomaSupport.wixobj JamomaExtensions.wixobj ui.wixobj ../wix/wixui.wixlib -loc ../wix/WixUI_en-us.wxl`


else 
# mac
  create_logs  
  puts " "  
  puts "  Version string is set to Version #{@version}"
  puts " "
  puts "  Creating installer directory structure @ #{@temp} ..."
  cmd("rm -rfv \"#{@temp}\"")                                            # remove an old temp dir if it exists
  cmd("mkdir -pv \"#{@temp}\"")                                         # now make a clean one, and build dir structure in it
  cmd("mkdir -pv \"#{@temp}/Library/Frameworks\"")
  cmd("mkdir -pv \"#{@temp}/Library/Application Support/TTBlue/Extensions\"")
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
  cmd("cp -rpv \"#{@svn_root}/../Modular/Jamoma\" \"#{@c74}/Jamoma\"")

  puts "  Copying Shared Libraries"
  cmd("cp -rpv \"#{@svn_root}/../Modular/SourceCode/Framework/build/UninstalledProducts/Jamoma.framework\" \"#{@temp}/Library/Frameworks/Jamoma.framework\"") 
  cmd("cp -rpv \"#{@svn_root}/../DSP/library/build/UninstalledProducts/JamomaDSP.framework\" \"#{@temp}/Library/Frameworks/JamomaDSP.framework\"") 

  puts "  Copying TTBlue Extensions"
  cmd("cp -rpv \"/Library/Application Support/TTBlue/Extensions\"/* \"#{@temp}/Library/Application Support/TTBlue/Extensions\"") 

  puts "  Stripping .svn folders..."
  cmd("rm -rfv \"#{@c74}/Jamoma/\"*/.svn")                               # and remove all .svn folders by brute force (someone can make this better)
  cmd("rm -rfv \"#{@c74}/Jamoma/\"*/*/.svn")
  cmd("rm -rfv \"#{@c74}/Jamoma/\"*/*/*/.svn")
  cmd("rm -rfv \"#{@c74}/Jamoma/\"*/*/*/*/.svn")
  cmd("rm -rfv \"#{@c74}/Jamoma/\"*/*/*/*/*/.svn")
  cmd("rm -rfv \"#{@c74}/Jamoma/\"*/*/*/*/*/*/.svn")
  cmd("rm -rfv \"#{@c74}/Jamoma/\"*/*/*/*/*/*/*/.svn")
  cmd("rm -rfv \"#{@c74}/Jamoma/\"*/*/*/*/*/*/*/*/.svn")

  puts "  Removing files that are not needed (.zips, windows externs, etc)..."
  cmd("rm -fv \"#{@c74}/Jamoma/library/externals/\"*.zip")
  cmd("rm -fv \"#{@c74}/Jamoma/library/externals/\"*.log")  
  cmd("rm -fv \"#{@c74}/Jamoma/library/externals/JamomaFramework.dll\"")
  cmd("rm -fv \"#{@c74}/Jamoma/library/externals/JamomaDSP.dll\"") 
  cmd("rm -rfv \"#{@c74}/Jamoma/library/externals/TTBlueExtensions\"")
  cmd("rm -rfv \"#{@c74}/Jamoma/library/externals/windows\"")
  cmd("rm -rfv \"#{@c74}/Jamoma/library/externals/ramplib_windows\"")
  cmd("rm -fv \"#{@c74}/Jamoma/library/third-party/Mac/\"*.zip")
  cmd("rm -fv \"#{@c74}/Jamoma/library/third-party/Mac\"*.dmg")
  cmd("rm -rfv \"#{@c74}/Jamoma/library/third-party/WinXP\"") 
  

  puts "  Moving things around (loader, templates, etc)..."
  cmd("cp \"#{@c74}/Jamoma/documentation/jamoma-templates/\"* \"#{@max}/patches/templates\"")
  cmd("cp \"#{@c74}/Jamoma/documentation/jamoma-overview.maxpat\" \"#{@max}/patches/extras\"")
  cmd("mv \"#{@c74}/Jamoma/library/externals/Jamoma.framework\" \"#{@temp}/Library/Frameworks\"")
  cmd("mv \"#{@c74}/Jamoma/library/externals/TTBlue.framework\" \"#{@temp}/Library/Frameworks\"")
  cmd("mv \"#{@c74}/Jamoma/library/externals/mac/jcom.loader.mxo\" \"#{@c74}/extensions/\"")
  cmd("mv \"#{@c74}/Jamoma/support\"/*.maxdefaults \"#{@c74}/default-settings\"")
  cmd("mv \"#{@c74}/Jamoma/support\"/*.maxdefines \"#{@c74}/default-definitions\"")   
  cmd("rm -rfv \"#{@c74}/Jamoma/support\"")  
  
  # cmd("mv \"#{@c74}/Jamoma/support/jcom.ui.maxdefines\" \"#{@c74}/default-definitions/jcom.ui.maxdefines\"")
  # now we have several maxdefines
#  cmd("cp \"#{@c74}/Jamoma/modules/control/cueManager/java-classes/Cue.class\" \"#{@c74}/java/classes/cueManager\"") 
#  cmd("cp \"#{@c74}/Jamoma/modules/control/cueManager/java-classes/CueList.class\" \"#{@c74}/java/classes/cueManager\"") 
#  cmd("cp \"#{@c74}/Jamoma/modules/control/cueManager/java-classes/Data.class\" \"#{@c74}/java/classes/cueManager\"") 
#  cmd("cp \"#{@c74}/Jamoma/modules/control/cueManager/java-classes/CueManager.class\" \"#{@c74}/java/classes/cueManager\"") 

  puts "  Copying readme, license, etc...."
  cmd("cp \"#{@c74}/Jamoma/ReadMe.rtf\" \"#{@installers}/resources\"")
  cmd("cp \"#{@c74}/Jamoma/ReadMe.rtf\" \"#{@installers}/Jamoma\"")
  cmd("cp \"#{@c74}/Jamoma/GNU-LGPL.rtf\" \"#{@installers}/resources/License.rtf\"")
  cmd("cp \"#{@c74}/Jamoma/GNU-LGPL.rtf\" \"#{@installers}/Jamoma/License.rtf\"")
  cmd("cp \"Uninstall.command\" \"#{@installers}/Jamoma/Uninstall.command\"")

  puts "  Building Package -- this could take a while..."
  cmd("rm -rfv \"#{@installers}/MacInstaller/Jamoma.pkg\"")
  cmd("/Developer/usr/bin/packagemaker --verbose --root \"#{@temp}\" --id org.jamoma.modular --out \"#{@installers}/Jamoma/Jamoma-#{@version}.pkg\" --version #{@version} --title Jamoma-#{@version} --resources \"#{@installers}/resources\" --target 10.4 --domain system --root-volume-only")

  # Warning: the zip thing seems to be a real problem on the Mac using OS 10.5 at least...  Renaming the zip ends up causing the install to fail
  #puts "  Zipping the Installer..."
  #cmd("rm -rfv \"#{@svn_root}/Installers/Jamoma-0.4.6.zip\"")
  #cmd("zip -rj \"#{@svn_root}/Installers/Jamoma.pkg.zip\" \"#{@svn_root}/Installers/Jamoma.pkg\"")
  #cmd("mv \"#{@svn_root}/Installers/Jamoma.pkg.zip\" \"#{@svn_root}/Installers/Jamoma-0.4.6-Mac.pkg.zip\"")

  puts "  Creating Disk Image..."
  cmd("rm -rfv \"#{@installers}/Jamoma-#{@version}-Mac.dmg\"")
  cmd("hdiutil create -srcfolder \"#{@installers}/Jamoma\" \"#{@installers}/Jamoma-#{@version}-Mac.dmg\"")

  puts "  All done!"

  close_logs
  puts ""


end

exit 0
