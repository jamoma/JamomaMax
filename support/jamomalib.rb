###################################################################
# Library of Ruby stuff for Jamoma
###################################################################

require 'open3'
require 'fileutils'
require 'pathname'
require "support/platform"
require 'rexml/document'
include REXML

def win32?
  (Platform::OS == :unix && Platform::IMPL == :cygwin) || Platform::OS == :win32
end

require 'support/wininit' if win32?


#######
## SUB ROUTINES
#######

if (defined? quietly) == nil
  def quietly
    v = $VERBOSE
    $VERBOSE = nil
    yield
    ensure
    $VERBOSE = v
  end
end

def create_logs
  # set up log files and ensure that the build_root is there
  `mkdir -p #{@log_root}` if !FileTest.exist?(@log_root)
  @build_log = File.new("#{@log_root}/DSP_build.log", "w")
  @build_log.write("MAX BUILD LOG: #{`date`}\n\n")
  @build_log.flush
  @error_log = File.new("#{@log_root}/DSP_error.log", "w")
  @error_log.write("MAX BUILD ERROR LOG: #{`date`}\n\n")
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

def zero_count
  @cur_total = 0
  @cur_count = 0
end

def get_count
  return @cur_total, @cur_count
end


def copydir(sourcepath, dstpath)
  out = ""
  err = ""

  puts "copy -v #{sourcepath}  -->  #{dstpath}"

  Open3.popen3("rm -rf #{dstpath}") do |stdin, stdout, stderr|
    out = stdout.read
    err = stderr.read
  end
  log_build(out)
  log_error(err)

  Open3.popen3("cp -R #{sourcepath} #{dstpath}") do |stdin, stdout, stderr|
    out = stdout.read
    err = stderr.read
  end
  log_build(out)
  log_error(err)

  return 0  
end


def build_xcode_project(projectdir, projectname, configuration, clean)
  out = ""
  err = ""

  Open3.popen3("nice xcodebuild -project #{projectname} -configuration #{configuration} ZERO_LINK=\"NO\" #{"clean" if clean == true} build") do |stdin, stdout, stderr|
    if(@debug)
      puts "nice xcodebuild -project #{projectname} -configuration #{configuration} ZERO_LINK=\"NO\" #{"clean" if clean == true} build"
    end
    out = stdout.read
    err = stderr.read
  end

  if /BUILD SUCCEEDED/.match(out)
    @cur_count+=1
    puts "#{projectname}: BUILD SUCCEEDED"
    log_build(out)
    return 1
  else
    @fail_array.push("#{projectdir}/#{projectname}")
    puts "#{projectname}: BUILD FAILED **************************************"
    log_error(out)
    log_error(err)
  end
  return 0
end


def build_vs_project(projectdir, projectname, configuration, clean)
  out = ""
  err = ""

  Open3.popen3("nice vcbuild.exe #{"/rebuild" if clean == true} \"#{projectname}\" \"#{configuration}\"") do |stdin, stdout, stderr|
    out = stdout.read
    err = stderr.read
  end

  if /(0 error|up\-to\-date|0 erreur)/.match(out)
    @cur_count+=1
    puts "#{projectname}: BUILD SUCCEEDED"
    log_build(out)
    return 1
  else
    @fail_array.push("#{projectdir}/#{projectname}")
    puts "#{projectname}: BUILD FAILED **************************************"
    log_error(out)
    log_error(err)
  end
  return 0
end


def build_project(projectdir, projectname, configuration, clean)
  if FileTest.exist?("#{projectdir}/#{projectname}")
    @cur_total+=1
    olddir = Dir.getwd
    Dir.chdir(projectdir)
    
    if win32?
      @cur_count += build_vs_project(projectdir, projectname, configuration, clean)
    else
      @cur_count += build_xcode_project(projectdir, projectname, configuration, clean)
    end

    Dir.chdir(olddir)
  else
    puts"File Does not exist: #{projectdir}/#{projectname}"
  end
end


def find_and_build_project(projectdir, configuration, clean)

if win32?
 	rgx = /.vcproj$/
else
  	rgx = /.xcodeproj$/
end

  Dir.foreach(projectdir) do |file|
    if rgx.match(file)
        build_project(projectdir, file, configuration, clean)
    end
  end
end


def build_dir(dir, configuration, clean)
  dir = "#{@svn_root}/#{dir}"
  return if !FileTest.exist?(dir) || !FileTest.directory?(dir)

  Dir.foreach(dir) do |subf|
    next if /^\./.match(subf)
    next if /common/.match(subf)
    next if !FileTest.directory?("#{dir}/#{subf}")
    find_and_build_project("#{dir}/#{subf}", configuration, clean)
  end
end


