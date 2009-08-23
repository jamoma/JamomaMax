# window initialization crap, should only be called from another ruby script

require 'Win32API'
#require 'ZLib'

if (Platform::OS == :unix && Platform::IMPL == :cygwin) || Platform::OS == :win32
	installed = `regtool list '/machine/Software/Microsoft/VisualStudio/SxS/VS7/'`
	
	if /9\.0/.match(installed)
		vsver = 9
	elsif /7\.1/.match(installed)
		vsver = 7
	else
		vsver = 0
	end
	
	if vsver != 9
		puts "unsupported version of Visual Studio installed -- you need Visual C++ 9.0"
		exit 0
	end
	
	vcinstalldir = `regtool get '\\machine\\Software\\Microsoft\\VisualStudio\\SxS\\VS7\\9.0'`.chomp
	scriptdir = `cygpath -au '#{vcinstalldir + 'Common7\\Tools\\'}'`.chomp
	scriptfile = scriptdir + "vsvars32.bat"
	
	FileUtils.cp(scriptfile, scriptdir + "tmp.bat")
	f = File.new(scriptdir + "tmp.bat", "a")
	f.write("@echo PATH=%PATH%\n")
	f.write("@echo INCLUDE=%INCLUDE%\n")
	f.write("@echo LIB=%LIB%\n")
	f.close
	
	output = `'#{scriptdir + "tmp.bat"}'`
	
	File.delete(scriptdir + "tmp.bat")

	if /PATH=(.*?)$/.match(output)
		wpath = $1.split(';')
		upath = Array.new
		wpath.each do |p|
			upath.push `cygpath -u '#{p}'`.chomp
		end
		ENV['PATH'] = upath.join(':')
	end
	if /INCLUDE=(.*?)$/.match(output)
		winc = $1.split(';')
		uinc = Array.new
		winc.each do |i|
			uinc.push `cygpath -u '#{i}'`.chomp
		end
		ENV['INCLUDE'] = uinc.join(':')
	end
	if /LIB=(.*?)$/.match(output)
		wlib = $1.split(';')
		ulib = Array.new
		wlib.each do |l|
			ulib.push `cygpath -u '#{l}'`.chomp
		end
		ENV['LIB'] = ulib.join(':')
	end		
	puts "Windows environment initialized"
end

# below is unused, but it was a neat way to figure out
# how visual studio projects are put together. anyway...
class SLNProject
  def initialize(name, path, id, target, *depends)
    @name = name
    @path = path
    @id = id
    @target = target
    @depends = depends.to_s if depends && depends.length
    @depends = nil if @depends == ""
    @index = -1
  end

  attr_reader :name, :path, :target, :depends, :index, :id
  attr_writer :index

  def <=>(other)
#    puts
#    puts "#{name}: #{id} (#{depends})"
#    puts "#{other.name}: #{other.id} (#{other.depends})"
#    puts
    if id == other.depends
#      puts "#{other.name} depends on #{name}"
      return -1
    elsif depends == other.id
#      puts "#{name} depends on #{other.name}"
      return 1
    elsif depends.nil? && !other.depends.nil?
#      puts "#{name} has no dependencies, but #{other.name} does"
      return -1
    elsif !depends.nil? && other.depends.nil?
#      puts "#{name} has dependencies, but #{other.name} does not"
      return 1
    elsif depends.nil? && other.depends.nil?
#      puts "neither #{name} nor #{other.name} have dependencies"
      return name.downcase <=> other.name.downcase
    else
#      puts "inconclusive"
      return name.downcase <=> other.name.downcase
#      return index <=> other.index
    end
  end
  
  def to_s
    "#{name}: #{path} (#{id})\n"
  end
end

class SLNParser
  def SLNParser.new(file, target)
    begin
      verstr = /^Microsoft Visual Studio Solution File, Format Version 8.00/
      sln = IO.read(file) # error checking!
      if !verstr.match(sln)
        puts "Bad sln file format"
        return nil
      end
      super # calls allocate & initialize
    rescue
      puts "SLNParser failed: " + $!
      return nil
    end
  end
      
  def initialize(file, target)
     sln = IO.read(file) # error checking!
 
     slnarr = sln.split("\n")
    prj = nil
    prjarray = Array.new

    slnarr.each do |line|
      if /^Project\(/.match(line)
        prjarray.push(prj) if prj != nil
        prj = Array.new
      end
      prj.push(line + "\n") if prj != nil
      if /EndProject\s*$/.match(line)
        prjarray.push(prj) if prj != nil
        prj = nil
      end
    end
    @projects = Array.new
    prjarray.each do |elem|
      elstr = elem.to_s
      if /Project\(.*\) = "(.*?)", "(.*?)", "\{(.*?)\}"/ =~ elstr
        name = $1.chomp
        path = $2.chomp
        id = $3.chomp
      end
      if /ProjectSection.*?\n.*\{(.*?)\} = \{.*?\}/ =~ elstr
        depends = $1
      end
      if /\{#{id}\}\.#{target}\.ActiveCfg = (.*?)\|Win32/ =~ sln
        target = $1
#        puts target + "!!!"
      end
      slnobj = SLNProject.new(name, path, id, target, depends ? depends : nil)
      @projects.push(slnobj)
      slnobj.index = @projects.index(slnobj)
      @projects.sort!
    end
  end
  
  attr_reader :projects
end
