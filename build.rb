#!/usr/bin/env ruby -wKU
# encoding: utf-8

glibdir = "."
Dir.chdir glibdir
glibdir = Dir.pwd

projectNameParts = glibdir.split('/')
projectName = projectNameParts.last;
projectName.gsub!(/Jamoma/, "")
ENV['JAMOMAPROJECT'] = projectName

@projectName = projectName
@log_root = "./logs-#{@projectName}"
@svn_root = "../#{@projectName}"
@fail_array = Array.new
@zerolink = false

Dir.chdir "#{glibdir}/../../Core/Shared"

require "#{glibdir}/../../Core/Shared/jamomalib.rb"

create_logs(@projectName)
zero_count

load "build.rb"

`mkdir -p "#{glibdir}"/max/externals`
`mkdir -p "#{glibdir}"/max/extensions`
`rm -rf "#{glibdir}"/max/externals/*`
`rm -rf "#{glibdir}"/max/extensions/*`
`cp -r "#{glibdir}"/../../Builds/MaxMSP/jcom.*.mxo "#{glibdir}"/max/externals`
`cp -r "#{glibdir}"/max/externals/jcom.loader.* "#{glibdir}"/max/extensions`
`cp -r "#{glibdir}"/../../Builds/MaxMSP/jcom.*.maxhelp "#{glibdir}"/max/help`
