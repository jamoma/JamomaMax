#!/usr/bin/env ruby -wKU

@glibdir = "."
Dir.chdir @glibdir             # change to libdir so that requires work
@glibdir = Dir.pwd

@branch = ""
@remote = `git remote`
@remote.strip!

# argument specifies branch (or meta-branch), otherwise default as below
if ARGV.length > 0
  @branch = ARGV[0]
else
  result = `git branch`
  result.each_line { |line| 
    if line.match(/\*.*/)
      line.gsub!(/\*/, " ")
      @branch = line.strip
    end
  }
end

puts "JAMOMA UPDATING TO branch: #{@branch}  FROM remote: #{@remote}"  


#################################################################

def divider
  puts
  puts "*************************************************************"
  puts
end

#################################################################

def doUpdateSimple name
  puts "UPDATING: #{name}"
  Dir.chdir "#{@glibdir}/../#{name}"
  
  result = `git checkout #{@branch}`
  if result.match(/error.*/)
    puts "NOTE: checking out tracking branch..."
    result = `git checkout --track remotes/#{@remote}/#{@branch}`
  end

  puts `git pull #{@remote} #{@branch}`
  puts `git submodule update --init;`
end

#################################################################

def doUpdateUserLib name     
  doUpdateSimple("UserLib/#{name}")
end  

#################################################################

def doUpdate name     
  doUpdateSimple("Modules/#{name}")  
  Dir.chdir "#{@glibdir}/../Modules/#{name}"
  puts `ruby update.rb` 
  divider
end  

#################################################################



puts "UPDATING MAIN REPOSITORY..."
Dir.chdir "#{@glibdir}/.." 

divider

result = `git checkout #{@branch}`
if result.match(/error.*/)
  puts "NOTE: checking out tracking branch..."
  result = `git checkout --track remotes/#{@remote}/#{@branch}`
end

puts "PULLING..."
puts `git pull #{@remote} #{@branch}`

divider

puts "SUBMODULE INIT/UPDATE"
puts `git submodule update --init;`
puts `git submodule foreach co master`

divider

################################################################# 

doUpdateSimple "Tools/supports"

divider

doUpdate "Foundation"
doUpdate "DSP"
doUpdate "Graphics"
doUpdate "Graph" 
doUpdate "AudioGraph"
doUpdate "Modular"
doUpdate "Test"     

doUpdateSimple "Modules/Dependencies"
doUpdateSimple "Modules/Ruby"
doUpdateSimple "Modules/TheGitter" 

divider

doUpdateUserLib "GDIF"   
doUpdateUserLib "Holophon"  
doUpdateUserLib "Jamoma.Ircam.FTM" 
doUpdateUserLib "Jamoma.Ircam.IMTR"  
doUpdateUserLib "Jamoma.Ircam.Spat"  
doUpdateUserLib "NavNav"  
doUpdateUserLib "Schumacher"  
doUpdateUserLib "support"
doUpdateUserLib "Tap.Tools"  
doUpdateUserLib "ViMiC"  
doUpdateUserLib "Z" 
 
divider
