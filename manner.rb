###################################################################
# Manner: Simple script creating PDF files for man pages
#
# Inspired by the Manner app, but without donation annoyances:
# http://www.1802.it/manner.php
#
# One argument: name of command to generate pdf man page for
#
# Try e.g.
# $ ruby manner git
# $ ruby manner git-pull (use hyphen for various GIT comands)
#
# License: This code is licensed under the terms of the GNU LGPL
# http://www.gnu.org/licenses/lgpl.html
# (c) Trond Lossius, 2010
#
###################################################################

# Check Args
if(ARGV.length == 0)
  puts "usage: "
  puts "manner.rb <required:terminalCommand>"
  exit 0;
end
getMan = ARGV[0];

# Generate temp postscript file from man page
%x[groff -mandoc >tmpManner.ps `man -w #{getMan}`]

# On Mac: convert to PDF and open in Preview
%x[open tmpManner.ps]

# Remove temp file
%x[rm tmpManner.ps]
