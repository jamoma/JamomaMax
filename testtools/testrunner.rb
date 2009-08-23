#!/usr/bin/env ruby -wKU

###################################################################
# Run automated tests for Jamoma
###################################################################

# First include the functions in the jamoma lib
libdir = "."
Dir.chdir libdir        # change to libdir so that requires work
require "jamomalib"   # C74 build library


puts "Jamoma Automated Test Runner"


###################################################################
# argument processing
###################################################################

@svnroot = ""
if (ARGV.length < 1)
  Dir.chdir ".."
  @svnroot = Dir.pwd
else
  @svnroot = ARGV[0]
end
puts "  svn root: " + @svnroot


@maxfolder = ""
if (ARGV.length < 2)
  if win32?
    @maxfolder = "C:\\Program Files\\Cycling '74\\Max 5.0"
  else
    @maxfolder = "/Applications/Max5"
  end
else
  @maxfolder = ARGV[1]
end
puts "  max folder: " + @maxfolder


@testroots = ARGV.slice(2, ARGV.length - 2)
@testroots = [] if(@testroots == nil)
if (@testroots.length == 0)
  @testroots << @svnroot
  puts "  No testroot args, so the default testing root will be: " + @svnroot
end
  

###################################################################
# initialization
###################################################################

@host = 'localhost'
@receivePort = 7474
@sendPort = 7575

@passes = 0
@failures = 0
@startTime = Time.now

@testDone = 0

puts "  Starting the OSC Server..."
@oscReceiver = OSC::UDPServer.new
@oscReceiver.bind @host, @receivePort
@oscSender = OSC::UDPSocket.new


###################################################################
# sub routines
###################################################################


def path_separator
  # Because we run from cygwin, we can just use the forward slash for both platforms
  "/"
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


# Setup OSC Methods that we respond to from the tests we are about to run
def setupOscCallbacks
  @oscReceiver.add_method('/test/finished', '') do |msg|
    @testDone = 1
  end
  
  @oscReceiver.add_method('/test/result', nil) do |msg|
    if(msg.args[0] == "PASS")
      if msg.args.size == 2
        puts "    PASSED: #{msg.args[1]}"
      elsif msg.args.size == 3
        puts "    PASSED: #{msg.args[1]} #{msg.args[2]}"
      else
        puts "    PASSED: #{msg.args[1]} #{msg.args[2]} (#{msg.args[3]})"
      end
      @passes = @passes + 1
    else
      if msg.args.size == 2
        puts "    FAILED: #{msg.args[1]}     ********************"
      elsif msg.args.size == 3
        puts "    FAILED: #{msg.args[1]} #{msg.args[2]}     ********************"
      else
        puts "    FAILED: #{msg.args[1]} #{msg.args[2]} (#{msg.args[3]})    ********************"
      end
      @failures = @failures + 1
    end
  end
  
  @oscReceiver.add_method('/test/log', nil) do |msg|
    puts "    #{msg.args.to_s}"
  end
end


def processAllTestFiles(directory, suffix)
  @testDone = 0  
  count = 0
  
  # Now we actually go through the directories and open the test
  Dir.foreach(directory) do |x| 
    filepath = directory + path_separator + x
    if File.directory?(filepath) && iteratable_directory_name?(x)
      count = count + processAllTestFiles(filepath, suffix)
    elsif valid_test_file_name?(x, suffix)
      formatted_filepath = filepath
      start_test_time = Time.now
      count = count + 1

      # The path we get back on Windows will need to be massaged so that Max can use it...

	if win32?
		# This is works but i suppose there are other ways to do that ...
		formatted_filepath = "#{@maxfolder}/../jamoma/Tools/#{filepath}"
	else
     		if formatted_filepath =~ /\/cygdrive\/(.)\/(.*)/
      			formatted_filepath.sub!(/\/cygdrive\/(.)\/(.*)/, '\1:\/\2')
     			formatted_filepath.gsub!(/\\/, '')
     		end
	end
      puts "  #{formatted_filepath}:" 

      @testDone = 0
      
      m = OSC::Message.new("/test/open #{formatted_filepath}");
      @oscSender.send(m, 0, @host, @sendPort)
 
      while @testDone == 0
        sleep 1
      end

      time_taken = Time.now - start_test_time
      puts("    (#{x} completed in #{time_taken} seconds)")
      puts("")
    end
  end
  count
end


def establishCommunication
  @pingReturned = 0

  @oscReceiver.add_method('/ping/return', '') do |msg|
    puts "    Ping successfully returned."
    puts ""
    @pingReturned = 1
    # from here we can call a test start method
  end


  Thread.new do
    @oscReceiver.serve
  end
  sleep 5

  ping = OSC::Message.new('/ping');
  while @pingReturned == 0
    puts "    Sending ping to Max."
    @oscSender.send(ping, 0, @host, @sendPort)
    sleep 1
  end
end


def launchMax
  if win32?
    # We have input like "C:\\Program Files\\Cycling '74\\Max 5.0"
    # We want output like "/cygdrive/c/Program Files/Cycling '74/Max 5.0"
   cygwinPathForMaxFolder = @maxfolder.gsub(/\\/, '/')
   cygwinPathForMaxFolder.sub!(/(.):\//, '/cygdrive/\1/')
    `cygstart "#{@maxfolder}/Max.exe"`
  else
    `open "#{@maxfolder}/MaxMSP.app/Contents/MacOS/MaxMSP"`
  end
end


###################################################################
# here is where we actually run the tests
###################################################################

puts "  Copying jcom.test.manager.maxpat to the Max Startup folder"
`cp "#{@svnroot}/Tools/jcom.test.manager.maxpat" "#{@maxfolder}/Cycling '74/max-startup"`


puts "  Launching Max..."
launchMax()


puts "  Establishing Communication with Max..."
establishCommunication()
setupOscCallbacks()


@totaltests = 0
@testroots.each do |testroot|
  @totaltests += processAllTestFiles(testroot, ".test.maxpat")
end
puts "  #{@totaltests} tests completed."


puts "  Quitting Max..."
quit = OSC::Message.new('/kill');
@oscSender.send(quit, 0, @host, @sendPort)
sleep 5

puts "  Clean up: removing jcom.testmanager.maxpat from the Max Startup folder"
`rm "#{@maxfolder}/Cycling '74/max-startup/jcom.test.manager.maxpat"`

puts ""
puts "  RESULTS:"
puts "    assertions failed:    #{@failures}"
#puts "    unusual terminations: #{@potential_crashes}"
puts "    assertions passed:    #{@passes}"
puts "    number of files:      #{@totaltests}"
puts "    total test time:      #{Time.now - @startTime} seconds"


puts ""
exit 0
