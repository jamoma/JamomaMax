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
  result.each { |line| 
    if line.match(/\*.*/)
      line.gsub!(/\*/, " ")
      @branch = line.strip
    end
  }
end

puts "JAMOMA UPDATING TO branch: #{@branch}  FROM remote: #{@remote}"  


#################################################################

def doUpdate name
  puts "UPDATING: #{name}"
  Dir.chdir "#{@glibdir}/../Modules/#{name}"
  
  result = `git checkout #{@branch}`
  if result.match(/error.*/)
    result = `git checkout --track remotes/#{@remote}/#{@branch}`
  end

  puts `git pull #{@remote} #{@branch}`
  puts `git submodule update --init;`
  puts `ruby update.rb`
end


#################################################################

puts "UPDATING MAIN REPOSITORY..."
Dir.chdir "#{@glibdir}/.." 

result = `git checkout #{@branch}`
if result.match(/error.*/)
  result = `git checkout --track remotes/#{@remote}/#{@branch}`
end

puts "PULLING..."
puts `git pull #{@remote} #{@branch}`
puts "SUBMODULE INIT/UPDATE"
puts `git submodule update --init;`


#################################################################

doUpdate "Foundation"
doUpdate "DSP"
doUpdate "Graphics" 
doUpdate "Multicore"
doUpdate "Modular"
doUpdate "Test"
