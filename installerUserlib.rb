#!/usr/bin/env ruby -wKU
# encoding: utf-8

###################################################################
# make an installer of the Jamoma UserLib
###################################################################
@name = "JamomaUserLib"
###################################################################

# First include the functions in the jamoma lib
glibdir = "../Modules"
Dir.chdir glibdir             # change to libdir so that requires work
glibdir = Dir.pwd

$main_repository = true
require "#{glibdir}/Support/jamomalib"
require 'date'
@version = Date.today.to_s  
# paths
if win32?

  @temp = "../InstallerUserlib/Windows"
  @root = "#{@temp}/root"
  @c74 = "#{@root}/Cycling '74/#{@name}"

else

  @temp = "../InstallerUserlib/Mac"
  @userlib = "../UserLib"
  @root = "#{@temp}/root"
  @c74 = "#{@root}/Applications/Max5/Cycling '74/#{@name}"
  @dmgroot = "#{@temp}/#{@name}"

end

###################################################################

if win32?
  
  # someone needs to make an installer for windows
  
else
  # mac 
  
  # commands
  @cp = "/Developer/usr/bin/CpMac"

  # cleanup
  puts "  preparing files..."
  `rm -rfv #{@root}`
  `rm -rfv #{@dmgroot}`

  # dir structure
  `mkdir -pv "#{@c74}"`
  `mkdir -pv "#{@dmgroot}"`

  # copying
  `#{@cp} -r "#{@userlib}"/* "#{@c74}"` 
    
  # garbage poubelle     
    puts "  removing .git folders and other things..."
   `rm -rf "#{@c74}/support/UserLibInstaller.rb"`
   `rm -rf "#{@c74}/support/wix"`
   `rm -rf "#{@c74}/support/platform.rb"`
   `rm -rf "#{@c74}/support/jamomalib.rb"`  
   `rm -rf "#{@c74}/support/wininit.rb"`  
   `rm -rf "#{@c74}/support/GenerateHTML.maxpat"`    
   `find "#{@c74}" -type d  -name ".git" -exec rm -rf '{}' ";" -print`
   `find "#{@c74}" -type d  -name ".svn" -exec rm -rf '{}' ";"`
   `find "#{@c74}" -type f  -name ".gitignore" -exec rm -rf '{}' ";"` 
   `find "#{@c74}" -type f  -name "*.msi" -exec rm -rf '{}' ";"` 
  # `find "#{@c74}" -type f  -name "*.mxo" -exec rm -rf '{}' ";"` 
    puts "  removing old Qmanager from Z folder"
    `rm -rfv "#{@c74}/Z/Qmanager"`
    puts "  removing DOT folder"
    `rm -rfv "#{@c74}/Orphans/DOT"`         
    puts "  removing platooned Modules folder"
    `rm -rfv "#{@c74}/Orphans/PlatoonedModules"`
    puts "  removing Holo-edit non-Jamoma stuff"
    `rm -rfv "#{@c74}/Holophon/Holo-Edit-4.5-UB"` 
    `rm -rfv "#{@c74}/Holophon/HololiveEditor"` 
    `rm -rfv "#{@c74}/Holophon/hololive.player-0.4.1"`    
    #`rm -rfv "#{@c74}/Holophon/lib"`
    `rm -rfv "#{@c74}/Holophon/Max-HoloPlayer_4.2.1"`
    `rm -rfv "#{@c74}/Holophon/toC\'74-java-lib"`
  
  puts "  creating clippings"
  `ruby buildUserLibMaxClippings.rb`
               
  # pkg building
  puts " "
  puts "  building installer pkg for Max5 ... this takes a while"
  configuration = "Max5"
  `/Developer/usr/bin/packagemaker --verbose --root \"#{@root}\" --id org.jamoma.#{@name}-#{configuration} --out \"#{@dmgroot}/#{@name}-#{configuration}.pkg\" --version #{configuration}-#{@version} --title #{@name}-#{@version} --target 10.5 --no-relocate --root-volume-only`
  # Note: we can add the following when there is a ReadMe/License/etc in the Git repository
  # --resources \"#{@installers}/resources\" 

  # distribution
  puts "  assembling dmg for Max5"
  `rm -rfv \"../InstallerUserlib/#{@name}-#{@version}.dmg\"`
  `hdiutil create -srcfolder \"#{@dmgroot}\" \"../InstallerUserlib/#{@name}-#{configuration}-#{@version}.dmg\"`
  
  `rm -rfv #{@root}/../#{@name}/*.*`
  ## creating package with Max6 file path  
  puts " "
  puts "  setting path to Max6"
  configuration = "Max6"  
  `mv #{@root}/Applications/Max5 #{@root}/Applications/Max6`
  `rm -rfv #{@root}/Applications/Max5`
                    
  # pkg building
  puts "  building installer pkg for Max6 ... this takes a while"
  `/Developer/usr/bin/packagemaker --verbose --root \"#{@root}\" --id org.jamoma.#{@name}-#{configuration} --out \"#{@dmgroot}/#{@name}-#{configuration}.pkg\" --version #{configuration}-#{@version} --title #{@name}-#{@version} --target 10.5 --no-relocate --root-volume-only`
  # Note: we can add the following when there is a ReadMe/License/etc in the Git repository
  # --resources \"#{@installers}/resources\" 

  # distribution
  puts "  assembling dmg for Max6"
  `rm -rfv \"../InstallerUserlib/#{@name}-#{@version}.dmg\"`
  `hdiutil create -srcfolder \"#{@dmgroot}\" \"../InstallerUserlib/#{@name}-#{configuration}-#{@version}.dmg\"`
  # cleaning pkg
  `rm -rfv #{@root}/../#{@name}/*.*` 
  
  puts " "
  puts "  all done"
  puts " "
  
end
