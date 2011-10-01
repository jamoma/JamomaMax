#!/usr/bin/env ruby -wKU

# Usage:
# "update.rb -> update all modules and submodules to their current branch"
# "update.rb <branch> -> update main Jamoma module to <branch> and all submodules to their current branch"
# "update.rb <branch> all -> update main Jamoma repository + submodules to <branch>"


@glibdir = "."
Dir.chdir @glibdir             # change to libdir so that requires work
@glibdir = Dir.pwd

@branch = ""
@remote = `git remote`
@remote.strip!

# argument specifies branch (or meta-branch), otherwise default as below
if ARGV.length == 0
  @all = false
  result = `git branch`
  result.each_line { |line|
    if line.match(/\*.*/)
      line.gsub!(/\*/, " ")
      @branch = line.strip
    end
  }
  puts "JAMOMA UPDATING MODULES & SUBMODULES TO THEIR CURRENT BRANCH FROM remote: #{@remote}"

elsif  ARGV.length == 1
  @all = false
  @branch = ARGV[0]
  puts "JAMOMA UPDATING TO branch: #{@branch} FROM remote: #{@remote}"
  puts "MY BRANCH IS #{@branch}"


elsif ARGV.length == 2
  @all = true
  @branch = ARGV[0]
  puts "JAMOMA UPDATING MODULES & SUBMODULES TO branch: #{@branch} FROM remote: #{@remote}"
else
  puts "\nTOO MANY ARGUMENTS. USAGE IS AS FOLLOW"
  puts "update.rb -> update all modules and submodules to their current branch\n"
  puts "update.rb <bnameOfBranch> -> update main Jamoma module to <nameOfBranch> and all submodules to their current branch\n"
  puts "update.rb <nameOfBranch> all -> update main Jamoma repository + submodules to <nameOfBranch>\n\n"
  exit 0;
end



#################################################################

def divider
  puts
  puts "*************************************************************"
  puts
end

#################################################################

def doUpdateSimple name
  if @all == true
    brch = @branch
  else
    brch = @allBranches["#{name}"]
  end

  puts "UPDATING: #{name}"
  Dir.chdir "#{@glibdir}/../#{name}"

  result = `git checkout #{brch}`
  if result.match(/error.*/)
    puts "NOTE: checking out tracking branch..."
    result = `git checkout --track remotes/#{@remote}/#{brch}`
  end

  puts `git pull #{@remote} #{brch}`
  puts `git submodule update --init;`
end

#################################################################

def doUpdateUserLib name
  doUpdateSimple("#{name}")
end

#################################################################

def doUpdate name
  doUpdateSimple("#{name}")
  Dir.chdir "#{@glibdir}/../#{name}"
  puts `ruby update.rb`
  divider
end

#################################################################

Dir.chdir "#{@glibdir}/.."

# TODO probably smarter way to do this : git submodule foreach 'echo $path;git branch|grep \*.*'

# We build a hash of all module + their current branch beforehand
if @all == false
  divider
  puts "CACHING SUBMODULES ACTIVE BRANCH"
  divider

  @allBranches = {}
subModList = `git submodule foreach 'echo $path'`.split("\n")
subModList.delete_if {|x| x =~ /^Entering/} # Here we filter out useless stuff printed by Git
subModList.each do |jamomaModule|
  Dir.chdir "#{@glibdir}/../#{jamomaModule}"
  b = `git branch`
  b.each_line do |line|
    if line.match(/\*.*/)
      line.gsub!(/\*/, " ")
      b = line.strip
      if b == "(no branch)"
        b = "master"
      end
      puts "#{jamomaModule} is on branch #{b}"
      @allBranches["#{jamomaModule}"] = "#{b}"
    end
  end
end
end

Dir.chdir "#{@glibdir}/.."

divider

puts "UPDATING MAIN REPOSITORY..."

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
puts `git submodule foreach checkout master`

divider

#################################################################

doUpdateSimple "Tools/supports"

divider

doUpdate "Modules/Foundation"
doUpdate "Modules/DSP"
doUpdate "Modules/Graphics"
doUpdate "Modules/Graph"
doUpdate "Modules/AudioGraph"
doUpdate "Modules/Modular"
doUpdate "Modules/Test"
doUpdate "Modules/Plugtastic"

doUpdateSimple "Modules/Documentation"
doUpdateSimple "Modules/Dependencies"
doUpdateSimple "Modules/Ruby"

divider

# doUpdateUserLib "ag.granular"
# doUpdateUserLib "GDIF"
# doUpdateUserLib "Holophon"
# doUpdateUserLib "Jamoma.Ircam.FTM"
# doUpdateUserLib "Jamoma.Ircam.IMTR"
# doUpdateUserLib "Jamoma.Ircam.Spat"
# doUpdateUserLib "MusicSpace"
# doUpdateUserLib "NavNav"
# doUpdateUserLib "Schumacher"
# doUpdateUserLib "SoundhackWrappers"
# doUpdateUserLib "support"
# doUpdateUserLib "Tap.Tools"
# doUpdateUserLib "ViMiC"
# doUpdateUserLib "Z"

ulDirContent = `ls "#{@glibdir}/../UserLib"`
ulModules = Array::new
ulModules = ulDirContent.split("\n")

ulModules.each do | ulGitDir |
  doUpdateUserLib("UserLib/#{ulGitDir}") unless ulGitDir == "Orphans"
end

divider
