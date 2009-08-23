#!/usr/bin/env ruby
# not using the version with warnings because rosc posts a lot of annoying warnings...
#/usr/bin/env ruby -wKU

###################################################################
# Library of Ruby stuff for Jamoma
###################################################################

require 'open3'
require 'fileutils'
require 'pathname'
require 'osc'
#require "platform"
require "../library/platform"
require 'rexml/document'
include REXML

def win32?
  (Platform::OS == :unix && Platform::IMPL == :cygwin) || Platform::OS == :win32
end

require '../library/wininit' if win32?

