# A script to create Jamoma modules maxpat clippings and browser entry

require "FileUtils"

glibdir = "."
Dir.chdir glibdir             # change to libdir so that requires work
glibdir = Dir.pwd

# $main_repository = true
# require "supports/jamomalib"

# TODO now that it works, the script should be re-done from scratch in a sexier way...

modulesPath = "#{glibdir}/../Implementations/Max/Jamoma/patches/modules"
clippingsPath = "#{glibdir}/../Implementations/Max/Jamoma/patches/clippings"
initPath = "#{glibdir}/../Implementations/Max/Jamoma/patches/init"
# userLibModulesPath = "#{glibdir}/../UserLib"


def writePatch(myModule, clippingsPath, moduleType)
  moduleName = myModule.sub(/.+\/(.*).module.maxpat/,'\1')
  
  puts "======== #{moduleType} modules ========"
  puts "#{moduleName}"
  FileUtils.mkdir_p("#{clippingsPath}/#{moduleType}\ modules") unless File.exist?("#{clippingsPath}/#{moduleType}\ modules")
  FileUtils.rm("#{clippingsPath}/#{moduleType}\ modules/jmod.clip.#{moduleName}.maxpat") if File.exist?("#{clippingsPath}/#{moduleType}\ modules/jmod.clip.#{moduleName}.maxpat")
  
    
  clp = File.open("#{clippingsPath}/#{moduleType}\ modules/clip.#{moduleName}.module.maxpat", "w+")
  clp.write("{
     \"patcher\" :   {
       \"fileversion\" : 1,
       \"rect\" : [ 84.0, 59.0, 640.0, 480.0 ],
       \"bglocked\" : 0,
       \"defrect\" : [ 84.0, 59.0, 640.0, 480.0 ],
       \"openrect\" : [ 0.0, 0.0, 0.0, 0.0 ],
       \"openinpresentation\" : 1,
       \"default_fontsize\" : 12.0,
       \"default_fontface\" : 0,
       \"default_fontname\" : \"Arial\",
       \"gridonopen\" : 0,
       \"gridsize\" : [ 15.0, 15.0 ],
       \"gridsnaponopen\" : 0,
       \"toolbarvisible\" : 1,
       \"boxanimatetime\" : 200,
       \"imprint\" : 0,
       \"enablehscroll\" : 1,
       \"enablevscroll\" : 1,
       \"devicewidth\" : 0.0,
       \"boxes\" : [       {
           \"box\" :         {
             \"args\" : [  ],
             \"bgmode\" : 1,
             \"id\" : \"obj-1\",
             \"maxclass\" : \"bpatcher\",
             \"name\" : \"jmod.#{moduleName}.maxpat\",
             \"numinlets\" : 10,
             \"numoutlets\" : 10,
             \"outlettype\" : [ \"\", \"\", \"\" ],
             \"patching_rect\" : [ 5.0, 3.0, 300.0, 70.0 ],
             \"presentation_rect\" : [ 0.0, 0.0, 300.0, 70.0 ]
           }

         }
    ],
       \"lines\" : [  ]
     }
  }")
  clp.close
end

def buildIndex (myModule)
# build module index
end

def writeMaxDataBase (myModule, initPath, moduleType)
  moduleName = myModule.sub(/.+\/jmod.(.*).maxpat/,'\1')
  
  FileUtils.mkdir_p("#{initPath}") unless File.exist?("#{initPath}")
  
  jamomaInitFile = File.new("#{initPath}/jamoma-init.txt", "a+")
  jamomaInitFile.write("max db.addmetadata jmod.clip.#{moduleName} clipping tag Jamoma;\nmax db.addmetadata jmod.clip.#{moduleName} clipping tag \"#{moduleType} module\";\n\n" )
  jamomaInitFile.close

end

########################
# Here things start
########################

FileUtils.rm("#{initPath}/jamoma-init.txt") if File.exist?("#{initPath}/jamoma-init.txt")
# FileUtils.rmdir("#{clippingsPath}") 

search = `find #{modulesPath} -name jmod.*maxpat -and \! -name *template*` #Does this only work on OSX ?

#let's build an array of modules so the list can be used later (i.e. to build modules index)
modules = Array::new
modules = search.split("\n")

modules.each do |jmod|
  puts jmod
  moduleType = jmod.sub(/.+\/(audio|control|data|openGL|spatialization|video)\/.*maxpat/, '\1')
  writePatch(jmod, clippingsPath, moduleType)
  writeMaxDataBase(jmod, initPath, moduleType)
end

# search = `find #{userLibModulesPath} -name jmod.*maxpat` #Does this only work on OSX ?
# 
# modules.clear
# modules = search.split("\n")
# 
# modules.each do |jmod|
#   moduleAuthor = jmod.sub(/.*\/UserLib\/(.*)\/.*maxpat/, 'UserLib/\1')
#   writePatch(jmod, clippingsPath, moduleAuthor)
#   writeMaxDataBase(jmod, initPath, moduleAuthor)
# end