on run argv
	
	global desiredStatus
	
	tell application "System Preferences" to set current pane to pane "com.apple.preferences.sharing"
	tell application "System Events" to tell process "System Preferences"
		set webSharingStatus to the value of checkbox 1 of row 6 of table 1 of scroll area 1 of group 1 of window "Sharing"
		return webSharingStatus
	end tell
	
	ignoring application responses
		tell application "System Preferences" to quit
	end ignoring
	
	(* How to log to console for debugging purposes: *)
	(* do shell script "logger Log some message." *)
	
end run

