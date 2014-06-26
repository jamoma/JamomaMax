on run argv
	
	global desiredStatus
	set desiredStatus to item 1 of argv as integer
	
	tell application "System Preferences" to set current pane to pane "com.apple.preferences.sharing"
	tell application "System Events" to tell process "System Preferences"
		set webSharingStatus to the value of checkbox 1 of row 6 of table 1 of scroll area 1 of group 1 of window "Sharing"
		if (webSharingStatus is not equal to desiredStatus) then
			click checkbox 1 of row 6 of table 1 of scroll area 1 of group 1 of window "Sharing"
			delay 1
			if (exists sheet 1 of window "Sharing") then
				click button "Start" of sheet 1 of window "Sharing"
			end if
		end if
		
		(* Evaluate outcome and report *)
		set webSharingStatus to the value of checkbox 1 of row 6 of table 1 of scroll area 1 of group 1 of window "Sharing"
		if (webSharingStatus is equal to desiredStatus) then
			if (webSharingStatus is equal to 1) then
				return "web running 1"
			else
				return "web stopped 0"
			end if
		else
			return "web failed"
		end if
	end tell
	
	ignoring application responses
		tell application "System Preferences" to quit
	end ignoring
	(* How to log to console for debugging purposes: *)
	(* do shell script "logger Log some message." *)
	
end run

