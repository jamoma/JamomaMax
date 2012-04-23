#!/usr/bin/env ruby -wKU
# encoding: utf-8 -wKU

libdir = ".."
Dir.chdir libdir
libdir = Dir.pwd

if(ARGV.length == 0)
  puts "Usage is:"
  puts "BACKUP: versions.rb <required:backup> <optional:archiveName.tar.gz"
  puts "RESTORE: versions.rb <required:restore> <required:archiveName.tar.gz"

end

if(ARGV[0] == "backup" || ARGV[0] == "b")
  if(ARGV[1])
    filename = ARGV[1]
  else
    time = Time.new
    filename = "Builds-" + "#{time.year}" + "#{time.month}" + "#{time.day}" + ".tar.gz"
  end
`tar -Pczf ./#{filename} ./Builds/MaxMSP /usr/local/jamoma`

elsif(ARGV[0] == "restore" || ARGV[0] == "r")
  filename = ARGV[1]
  puts "Need Password to create directories for Jamoma in /usr/local/jamoma and usr/local/lib"
  `sudo tar -Ppxzf #{filename}`
end

