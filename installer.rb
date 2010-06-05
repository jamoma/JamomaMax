#!/usr/bin/env ruby -wKU

###################################################################
# make an installer for Jamoma
# note: you must have already done a build
# note: all zips should be unzipped (3rd-party externs) too
###################################################################

# First include the functions in the jamoma lib
libdir = "."
Dir.chdir libdir        # change to libdir so that requires work
libdir = Dir.pwd

$main_repository = true
require "supports/jamomalib"   # C74 build library
require 'date'

@git_root = ".."	# this is the root of the Jamoma project repository
@installers = "#{@git_root}/Installers"
if win32?
  Dir.chdir @git_root
  @git_root = Dir.pwd
  Dir.chdir "#{@git_root}/Tools/installertools"
  @tempDistro = "#{@git_root}/Tools/installertools/Windows"
  @max = "#{@tempDistro}/root"
else
  @tempDistro = "#{@installers}/temp/distro"
  @max = "#{@tempDistro}/Applications/Max5"
  @tempDepend = "#{@installers}/temp/dependencies/Applications/Max5/Cycling '74"
  
end
@c74 = "#{@max}/Cycling '74"
@log_root        = "#{@installers}/logs"
@path_modular    = "#{@git_root}/Modules/Modular"
@path_foundation = "#{@git_root}/Modules/Foundation"
@path_dsp        = "#{@git_root}/Modules/DSP"
@path_audiograph  = "#{@git_root}/Modules/AudioGraph"
@path_graphics   = "#{@git_root}/Modules/Graphics"
@path_graph      = "#{@git_root}/Modules/Graph"
@path_ruby        = "#{@git_root}/Modules/Ruby"
@path_dependencies = "#{@git_root}/Modules/Dependencies" 

###################################################################
# Get Revision Info -- BAD FORM, BUT THIS COPY/PASTED FROM build.rb
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

if version_mod == '' || version_mod.match(/rc(.*)/)
  @version = "#{version_maj}.#{version_min}#{'.' + version_sub if version_sub.to_i > 0}"
else
  @version = "#{version_maj}.#{version_min}#{'.' + version_sub if version_sub.to_i > 0}-#{version_mod}"
end

if version_mod != ''
  longVersion = "#{version_maj}.#{version_min}.#{version_sub}-#{version_mod}"
else
  longVersion = "#{version_maj}.#{version_min}.#{version_sub}"
end

###################################################################
# sub routines
###################################################################

#def create_logs
#  @build_log = File.new("#{@git_root}/Installers/installer.log", "w")
#  @build_log.write("JAMOMA INSTALLER LOG: #{`date`}\n\n")
#  @build_log.flush
#  @error_log = File.new("#{@git_root}/Installers/error.log", "w")
#  @error_log.write("JAMOMA INSTALLER ERROR LOG: #{`date`}\n\n")
#  @error_log.flush
#  trap("SIGINT") { die }
#end
#  
#def die
#  close_logs
#  exit 0
#end
#
#def close_logs
#  @build_log.close
#  @error_log.close
#end
#
#def log_build(str)
#  @build_log.write(str)
#  @build_log.write("\n\n")
#  @build_log.flush
#end
#
#def log_error(str)
#  @error_log.write(str)
#  @error_log.write("\n\n")
#  @error_log.flush
#end




###################################################################
# here is where we actually build the installer
###################################################################
  puts " "  
  puts "  Version string is set to Version #{@version}"
  puts " "


  # ReadMe
  puts " Updating ReadMe..."
  `cp #{@git_root}/Tools/installertools/ReadMe.Template.rtf #{@git_root}/Tools/installertools/ReadMe.rtf`
  file_path = "#{@git_root}/Tools/installertools/ReadMe.rtf"
  if FileTest.exist?(file_path)
    f = File.open("#{file_path}", "r+")
    str = f.read

    if (version_mod == '' || version_mod.match(/rc(.*)/))
      str.sub!(/\\cf2 Version (.*)\n/, "\\cf2 Version #{version_maj}.#{version_min}.#{version_sub} (#{git_rev})\n")
    else
      str.sub!(/\\cf2 Version (.*)\n/, "\\cf2 Version #{version_maj}.#{version_min}.#{version_sub} #{version_mod} (#{git_rev})\n")
    end

    @date = Date.today
    str.sub!(/\\u8232 (.*)\\/, "\\u8232 #{@date.strftime("%d %B %Y")}\\")

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
  `cp -r "#{@git_root}/Modules/Modular/Max" 						"root/Cycling '74/Jamoma"`

  puts " Copying Jamoma Extensions"
  `cp "#{@git_root}/Builds"/*.ttdll  							"root/Common Files/Jamoma/Extensions"`

  puts " Copying frameworks into the support folder"
  `cp "#{@git_root}/Builds/JamomaFoundation.dll"  					root/support`
  `cp "#{@git_root}/Builds/JamomaDSP.dll"  						root/support`
  `cp "#{@git_root}/Builds/JamomaGraph.dll"  						root/support`
  `cp "#{@git_root}/Builds/JamomaAudioGraph.dll"  						root/support`
  `cp "#{@git_root}/Builds/JamomaModular.dll"  						root/support`
  `cp "#{@git_root}/Modules/DSP/library/portaudio/Release/PortAudio.dll"		root/support`
  `cp "#{@git_root}/Modules/Graphics/library/cairo-lib/libcairo-2.dll"		root/support`
  `cp "#{@git_root}/Modules/Graphics/library/cairo-lib/libpng12-0.dll"		root/support`
  `cp "#{@git_root}/Modules/Graphics/library/cairo-lib/libfontconfig-1.dll"		root/support`
#  `cp "#{@git_root}/Modules/Graphics/library/cairo-lib/zlib1.dll"		root/support`
  `cp "#{@git_root}/Modules/Graphics/library/cairo-lib/libexpat-1.dll"		root/support`
  `cp "#{@git_root}/Modules/Graphics/library/cairo-lib/freetype6.dll"		root/support`

  puts " Copying externals "
  `mkdir "#{@c74}/Jamoma/library/externals"`
  `cp "#{@git_root}/Builds/MaxMSP"/*.mxe 							"#{@c74}/Jamoma/library/externals/"`
	
  puts " Moving things around : loader, templates, etc..."
	#`mv "#{@c74}/Jamoma/library/third-party/WinXP/support"/*.dll				            root/support`
	`cp "#{@git_root}/Modules/Dependencies/Max/WinXP/support"/* root/support `
  `mv "#{@c74}/Jamoma/library/externals/jcom.loader.mxe"                   				"#{@c74}/extensions/jcom.loader.mxe"`
  `cp "#{@c74}/Jamoma/support"/*.maxdefaults   						                        "#{@c74}/default-settings"`
  `cp "#{@c74}/Jamoma/support"/*.maxdefines                           						"#{@c74}/default-definitions"`  
  `cp "#{@path_graphics}/implementations/MaxMSP/jcom.label"/*.maxdefines          "#{@c74}/default-definitions"`
  `cp "#{@c74}/Jamoma/documentation/jamoma-overview.maxpat" 				                root/patches/extras/jamoma-overview.maxpat`
  `cp "#{@c74}/Jamoma/documentation/jamoma-templates/_Jamoma_Patcher_.maxpat"      	root/patches/templates/_Jamoma_Patcher_.maxpat`
  `cp "#{@c74}/Jamoma/documentation/jamoma-templates/jalg.template.audio~.maxpat"  	root/patches/templates/jalg.template.audio~.maxpat`
  `cp "#{@c74}/Jamoma/documentation/jamoma-templates/jalg.template.video%.maxpat"  	root/patches/templates/jalg.template.video%.maxpat`
  `cp "#{@c74}/Jamoma/documentation/jamoma-templates/jmod.template.audio~.maxpat"  	root/patches/templates/jmod.template.audio~.maxpat`
  `cp "#{@c74}/Jamoma/documentation/jamoma-templates/jmod.template.control.maxpat" 	root/patches/templates/jmod.template.control.maxpat`
  `cp "#{@c74}/Jamoma/documentation/jamoma-templates/jmod.template.maxhelp"        	root/patches/templates/jmod.template.maxhelp`
  `cp "#{@c74}/Jamoma/documentation/jamoma-templates/jmod.template.video%.maxpat"  	root/patches/templates/jmod.template.video%.maxpat`
  `cp "#{@c74}/Jamoma/documentation/jamoma-templates/layout.xml"                   	root/patches/templates/layout.xml`

  puts " Copying readme, license, etc...."
  `cp "#{@git_root}/Tools/installertools/GNU-LGPL.rtf" 					root/License.rtf`
  `cp "#{@git_root}/Tools/installertools/ReadMe.template.rtf"   			root/ReadMe.rtf`

  puts " Removing files that are not needed (.zips, mac, externs, etc)..."
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
  f = File.open("#{@tempDistro}/JamomaExtensions.wxs", "r+")
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

  # Make Zip Archive
  `rm -rf Jamoma-#{@version}`
  `mkdir Jamoma-#{@version}`
  `cp Jamoma.msi Jamoma-#{@version}`
  `cp ../ReadMe.rtf Jamoma-#{@version}`
  `cp ../GNU-LGPL.rtf Jamoma-#{@version}/License.rtf`
  `rm -f Jamoma-#{longVersion}.zip`
  `zip -r Jamoma-#{longVersion}.zip Jamoma-#{@version}`

else
# mac
  `mkdir -pv \"#{@installers}\"`  # need to make directory before the logs are created, and thus before cmd() is ready to be used
  create_logs

  puts "  Creating installer directory structure @ #{@tempDistro} ..."
  `rm -rfv \"#{@installers}/temp\"`     # remove an old temp dir if it exists  
  `mkdir -pv \"#{@tempDistro}\"                                               ` # now make a clean one, and build dir structure in it
  `mkdir -pv \"#{@tempDistro}/Library/Frameworks\"                            `
  `mkdir -pv \"#{@tempDistro}/Library/Application Support/Jamoma/Extensions\" `     
  `mkdir -pv \"#{@tempDepend}/Jamoma/Dependencies\" `
  `mkdir -pv \"#{@max}\"                                                `
  `mkdir -pv \"#{@max}/patches/templates\"                              `
  `mkdir -pv \"#{@max}/patches/extras\"                                 `
  `mkdir -pv \"#{@c74}\"                                                `
  `mkdir -pv \"#{@c74}/extensions\"                                     `
  `mkdir -pv \"#{@c74}/default-definitions\"                            `
  `mkdir -pv \"#{@c74}/default-settings\"                               `
  `mkdir -pv \"#{@installers}/resources\"                               `
  `mkdir -pv \"#{@installers}/Jamoma\"                                  `
  `mkdir -pv \"#{@tempDistro}/Library/Ruby/Site/1.8/universal-darwin10.0\"    `

  puts "  Copying the Jamoma folder..."
  `cp -rpv \"#{@git_root}/Modules/Modular/Max\" \"#{@c74}/Jamoma\"`

  puts "  Copying Shared Libraries"
  `cp -rpv \"#{@path_foundation}/library/build/UninstalledProducts/JamomaFoundation.framework\"   \"#{@tempDistro}/Library/Frameworks/JamomaFoundation.framework\" `
  `cp -rpv \"#{@path_dsp}/library/build/UninstalledProducts/JamomaDSP.framework\"                 \"#{@tempDistro}/Library/Frameworks/JamomaDSP.framework\" `   
  `cp -rpv \"#{@path_graph}/library/build/UninstalledProducts/JamomaGraph.framework\"             \"#{@tempDistro}/Library/Frameworks/JamomaGraph.framework\" ` 
  `cp -rpv \"#{@path_graphics}/library/build/UninstalledProducts/JamomaGraphics.framework\"       \"#{@tempDistro}/Library/Frameworks/JamomaGraphics.framework\" `
  `cp -rpv \"#{@path_audiograph}/library/build/UninstalledProducts/JamomaAudioGraph.framework\"     \"#{@tempDistro}/Library/Frameworks/JamomaAudioGraph.framework\" `
  `cp -rpv \"#{@path_modular}/library/build/UninstalledProducts/JamomaModular.framework\"         \"#{@tempDistro}/Library/Frameworks/JamomaModular.framework\" `

  puts "  Copying Extensions"
  `cp -rpv \"/Library/Application Support/Jamoma/Extensions\"/*                                   \"#{@tempDistro}/Library/Application Support/Jamoma/Extensions\"`

  puts "  Copying Externals"
  `cp -rpv \"#{@git_root}/Builds/MaxMSP\"                                                                \"#{@c74}/Jamoma/externals\"`
#  puts "  Removing ≈-Externals"
#  `rm -rfv \"#{@c74}/Jamoma/externals/\"*≈.mxo`
#  `rm -rfv \"#{@c74}/Jamoma/externals/\"*≈.maxhelp` 

  puts "  Copying TTRuby"
  `cp -rpv \"#{@path_ruby}/library/TTRuby.bundle\"     \"#{@tempDistro}/Library/Ruby/Site/1.8/universal-darwin10.0/TTRuby.bundle\"`
  
  puts "  Copying Dependencies folder"
   `cp -rpv \"#{@path_dependencies}/Max/Mac\"/*                                                                \"#{@tempDepend}/Jamoma/Dependencies\"`
  #

  puts "  Removing files that are not needed (.zips, windows externs, etc)..."
  `rm -rfv \"#{@c74}/Jamoma/externals/\"readme.txt`
  `rm -rfv \"#{@c74}/Jamoma/library/third-party/WinXP\"`

  puts "  Moving things around (loader, templates, etc)..."
  `cp \"#{@c74}/Jamoma/documentation/jamoma-templates/\"*       \"#{@max}/patches/templates\"   `
  `cp \"#{@c74}/Jamoma/documentation/jamoma-overview.maxpat\"   \"#{@max}/patches/extras\"      `
  `mv \"#{@c74}/Jamoma/externals/jcom.loader.mxo\"              \"#{@c74}/extensions/\"         `
  `mv \"#{@c74}/Jamoma/externals\"/*.maxhelp                    \"#{@c74}/Jamoma/documentation/jamoma-help/\"         `
  `mv \"#{@c74}/Jamoma/support\"/*.maxdefaults                  \"#{@c74}/default-settings\"    `
  `mv \"#{@c74}/Jamoma/support\"/*.maxdefines                   \"#{@c74}/default-definitions\" `    
  `cp \"#{@path_graphics}/implementations/MaxMSP/jcom.label\"/*.maxdefines                   \"#{@c74}/default-definitions\" `    
  `rm -rfv \"#{@c74}/Jamoma/support\"                                                           `

  puts "  Copying readme, license, etc...."
  `cp \"#{@git_root}/Tools/installertools/ReadMe.rtf\"          \"#{@installers}/resources\"             `
  `cp \"#{@git_root}/Tools/installertools/ReadMe.rtf\"          \"#{@installers}/Jamoma\"                `
  `cp \"#{@git_root}/Tools/installertools/GNU-LGPL.rtf\"        \"#{@installers}/resources/License.rtf\" `
  `cp \"#{@git_root}/Tools/installertools/GNU-LGPL.rtf\"        \"#{@installers}/Jamoma/License.rtf\"    `
  `cp \"#{@git_root}/Tools/installertools/Uninstall.command\"   \"#{@installers}/Jamoma/Uninstall.command\"                 `

  puts "  Building Package -- this could take a while..."
  `rm -rfv \"#{@installers}/MacInstaller/Jamoma.pkg\"`

  puts
  puts "OUTPUT FROM packagemaker COMMAND:"
  puts `/Developer/usr/bin/packagemaker --verbose  --doc \"#{@git_root}/Tools/installertools/packageMakerScript.pmdoc\" --out \"#{@installers}/Jamoma/Jamoma-#{@version}.pkg\" --version #{longVersion} --title Jamoma-#{@version} --target 10.5 --domain system --root-volume-only`
  puts "COMPLETED packagemaker COMMAND"
  puts
  
  # Warning: the zip thing seems to be a real problem on the Mac using OS 10.5 at least...  Renaming the zip ends up causing the install to fail
  #puts "  Zipping the Installer..."
  #cmd("rm -rfv \"#{@git_root}/Installers/Jamoma-0.4.6.zip\"")
  #cmd("zip -rj \"#{@git_root}/Installers/Jamoma.pkg.zip\" \"#{@git_root}/Installers/Jamoma.pkg\"")
  #cmd("mv \"#{@git_root}/Installers/Jamoma.pkg.zip\" \"#{@git_root}/Installers/Jamoma-0.4.6-Mac.pkg.zip\"")

  puts "  Creating Disk Image..."
  if version_mod.match(/rc(.*)/)
    `rm -rfv \"#{@installers}/Jamoma-#{@version}#{version_mod}-Mac.dmg\"`
    `hdiutil create -srcfolder \"#{@installers}/Jamoma\" \"#{@installers}/Jamoma-#{@version}-#{version_mod}-Mac.dmg\"`
  else
    `rm -rfv \"#{@installers}/Jamoma-#{@version}-Mac.dmg\"`
    `hdiutil create -srcfolder \"#{@installers}/Jamoma\" \"#{@installers}/Jamoma-#{@version}-Mac.dmg\"`
  end


  puts "  All done!"

  close_logs
  puts ""


end
