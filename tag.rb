#!/usr/bin/env ruby -wKU
# encoding: utf-8

# Go to Jamoma root folder
rootfolder = "../"
Dir.chdir rootfolder
rootfolder = Dir.pwd

# Include the functions in the jamoma lib
require "#{rootfolder}/Core/Shared/jamomalib"

# Check Args
if(ARGV.length == 0)
  puts "usage: "
  puts "ruby tag.rb <required:tag-name> <optional:branch-to-tag>"
  exit 0;
end

$tag = ARGV[0];

if(ARGV.length == 2)
  $branch = ARGV[1];
else
  $branch = "default";
end

# Define function to easily tag each sub modules
def tagModule relativePathFromJamomaFolder

  if ($branch != "default")
    puts "switching #{relativePathFromJamomaFolder} to #{$branch}"
    `cd ./#{relativePathFromJamomaFolder}; git checkout #{$branch}`
  end
    
  puts "tagging #{relativePathFromJamomaFolder}"
  `cd ./#{relativePathFromJamomaFolder}; git remote prune origin`
  `cd ./#{relativePathFromJamomaFolder}; git tag #{$tag}`
  `cd ./#{relativePathFromJamomaFolder}; git push origin --tags`
end

# Tag the Jamoma repository
`git remote prune origin`
`git tag #{$tag}`
`git push origin --tags`

# Tag each sub modules
tagModule "Core"
tagModule "Documentation"
tagModule "Implementations/AudioUnits"
tagModule "Implementations/iOS"
tagModule "Implementations/Max"
tagModule "Implementations/MaxDependencies"
tagModule "Implementations/MaxTest"
tagModule "Implementations/PureData"
tagModule "Implementations/Ruby"
tagModule "Implementations/VST"