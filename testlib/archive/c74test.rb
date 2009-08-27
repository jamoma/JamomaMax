# dependencies: java, buildtool/

require 'socket'
MAXTEST_VERSION = "2007.02.13"
DEFAULT_TEST_PATCH_SUFFIX = ".test.maxpat"
RECVPORT = 7474
SENDPORT = 7475
TEST_FINISHED_STRING = "/test/finished"
TERMINATE_MAX_STRING = "/max/kill"
RESULT_STRING = "/test/result"

def Kernel.is_windows?
  processor, platform, *rest = RUBY_PLATFORM.split("-")
  platform == 'mswin32'
end

def path_separator
  if Kernel.is_windows?
    "\\"
  else
    "/"
  end
end

def iteratable_directory_name?(name)
  name != "." && name != ".." && name != ".svn"
end

def valid_test_file_name?(name, suffix)
  name.chomp(suffix).length != name.length
end

def filepath_escape(pathstring)
  '"' + pathstring + '"'
end

def directory_of(pathstring)
  dir = ""
  elems = pathstring.split(path_separator)
  elems.each_index do |i|
    dir << elems[i] + path_separator unless i == elems.length - 1 
  end
  dir
end

def progress_indicator(filename)
  print filename
  back = ""
  filename.each_byte { |c| back << "\b \b" }
  print back
end

@potential_crashes = 0
def launch_app(svnroot, apppath, filepath)
  @test_finished_string_received = false
  if Kernel.is_windows?
    result = Kernel.system(filepath_escape(apppath) + " " + filepath)
  else
    result = Kernel.system(svnroot+"/buildtool/pacesupport/openandwait "+ 
                    filepath_escape(apppath) + " " + filepath)
  end
  if !@test_finished_string_received
    puts "   FAIL test not terminated normally.  A crash?"
    @potential_crashes = @potential_crashes + 1
  end
end

def process_all_testfiles(directory, suffix)
  count = 0
  Dir.foreach(directory) do |x| 
    filepath = directory + path_separator + x
    progress_indicator(x)
    if File.directory?(filepath) && iteratable_directory_name?(x)
      count = count + process_all_testfiles(filepath, suffix)
    elsif valid_test_file_name?(x, suffix)
      start_test_time = Time.now
      count = count + 1
      puts "#{filepath}:" 
      launch_app(@svnroot, @apppath, filepath)
      time_taken = Time.now - start_test_time
      puts("   (#{x} completed in #{time_taken} seconds)\n\n")
    end
  end
  count
end

@passes = 0
@failures = 0
def start_udp_server
  puts "+++ starting UDP server..."
  server_thread = Thread.start do
    server = UDPSocket.open
    server.bind(nil, RECVPORT)
    while true
      result = server.recvfrom(128)
      if result[0] =~ /\/test\/finished.*/
        @test_finished_string_received = true
        server.send("\/max\/kill", 0, "127.0.0.1", SENDPORT)
      elsif result[0] =~ /\/test\/result.*/
        puts "   " + result[0]
        result_s = result[0][13..16]
        @passes = @passes + 1 if result_s.include?("pass")
        @failures = @failures + 1 if result_s.include?("FAIL")
      else  # result[0] =~ /\/log\/message.*/
        puts "   " + result[0]
        result_s = result[0][13..16]
        @passes = @passes + 1 if result_s.include?("pass")
        @failures = @failures + 1 if result_s.include?("FAIL")
      end
    end
  end
end


########################## yo yo yo yo yo yo yo yo

puts "\n+++ Max/MSP/Jitter testing app, script version "+MAXTEST_VERSION
@script_start_time = Time.now
puts "+++ now: " + @script_start_time.to_s

if ARGV.length < 2
  puts "\n\n!!! usage: ruby c74test.rb svnroot app_path [suffix1] [suffix2] [suffix3] ...\n\n"
  Kernel.exit
end

@svnroot = ARGV[0]
puts "+++ svn root: " + @svnroot

@apppath = ARGV[1]
puts "+++ application path: " + @apppath
component_location = directory_of(@apppath) + "Cycling '74" + path_separator + "testing_components"
puts "+++ copying testing components to " + component_location
knox_component_location = @svnroot + path_separator + "testing" + 
                                     path_separator + "components" 
copy_s =                                      "cp "+filepath_escape(knox_component_location)+
                                                         "/* "+filepath_escape(component_location)
puts copy_s
Kernel.system(copy_s)

suffixes = ARGV.slice(2, ARGV.length - 2)
if suffixes.length == 0
  puts "+++ no suffix arguments, so finding default suffix of " + DEFAULT_TEST_PATCH_SUFFIX
  suffixes << DEFAULT_TEST_PATCH_SUFFIX
end

start_udp_server

@totaltests = 0
suffixes.each do |suffix|
  puts "\n\n+ looking for " + suffix + " files...\n\n"
  numtests = process_all_testfiles(@svnroot, suffix)
  puts "\n+ #{numtests} tests completed.\n"
  @totaltests = @totaltests + numtests
end
 
puts "\n\n"
puts "+++ assertions failed:    #{@failures}"
puts "+++ unusual terminations: #{@potential_crashes}"
puts "+++ assertions passed:    #{@passes}"
puts "+++ number of files:      #{@totaltests}"
puts "+++ total test time:      #{Time.now - @script_start_time} seconds"
puts "\n"
