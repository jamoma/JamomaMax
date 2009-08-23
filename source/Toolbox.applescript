-- Toolbox.applescript
-- Toolbox
-- 
-- Created by Tim Place on 2009/01/16.
-- Copyright 2009 jamoma.org.  All rights reserved.

property dsp_active : true
property dsp_branch : "active"
property dsp_developer : false
property dsp_update : true
property dsp_compile : true
property dsp_test : true

property modular_active : true
property modular_branch : "active"
property modular_developer : false
property modular_update : true
property modular_compile : true
property modular_test : true

property multicore_active : true
property multicore_branch : "active"
property multicore_developer : false
property multicore_update : true
property multicore_compile : true
property multicore_test : true

property toolbox_active : true
property toolbox_branch : "active"
property toolbox_developer : false
property toolbox_update : true
property toolbox_compile : true
property toolbox_test : true

property jamoma_folder_path : "file://localhost/Jamoma"

property compiler_configuration : "Development"
property compiler_clean : true





on launched theObject
	set myPath to (path to me)
	--isplay dialog (myPath as string)
	-- result, if inserted in on opened handler in Drawer sample application:
	-- MacOSX:Developer:Examples:AppleScript Studio:Drawer:build:Drawer.app
	
	-- set contents of control "jamoma_folder_path" of window "main" to myPath
	--set string value of control "jamoma_folder_path" of window "main" to jamoma_folder_path
	--set newPath to string value of control "jamoma_folder_path" of window "main"
	
	
	set state of button "dsp_active" of window "main" to dsp_active
	set current row of matrix "dsp_branch" of box "dsp" of window "main" to 1
	set state of button "dsp_developer" of window "main" to dsp_developer
	set state of button "dsp_update" of window "main" to dsp_update
	set state of button "dsp_compile" of window "main" to dsp_compile
	set state of button "dsp_test" of window "main" to dsp_test
	
	set state of button "modular_active" of window "main" to modular_active
	--set state of button "modular_branch" of window "main" to modular_branch
	--set state of button "modular_developer" of window "main" to modular_developer
	set state of button "modular_update" of window "main" to modular_update
	set state of button "modular_compile" of window "main" to modular_compile
	set state of button "modular_test" of window "main" to modular_test
	
	set state of button "multicore_active" of window "main" to multicore_active
	--set state of button "multicore_branch" of window "main" to multicore_branch
	set state of button "multicore_developer" of window "main" to multicore_developer
	set state of button "multicore_update" of window "main" to multicore_update
	set state of button "multicore_compile" of window "main" to multicore_compile
	set state of button "multicore_test" of window "main" to multicore_test
	
	set state of button "toolbox_active" of window "main" to toolbox_active
	--set state of button "toolbox_branch" of window "main" to toolbox_branch
	set state of button "toolbox_developer" of window "main" to toolbox_developer
	set state of button "toolbox_update" of window "main" to toolbox_update
	set state of button "toolbox_compile" of window "main" to toolbox_compile
	set state of button "toolbox_test" of window "main" to toolbox_test
	
	--set state of button "jamoma_folder_path" of window "main" to jamoma_folder_path
	
	--set state of button "compiler_configuration" of window "main" to compiler_configuration
	set state of button "compiler_clean" of window "main" to compiler_clean
	
end launched


--on clicked dspactive
--set dsp_active to something
--end clicked



-- FUNCTION THAT IS TRIGGERED BY THE BUTTON IN THE UI
on clicked theObject
	
	if (name of theObject is "dsp_active") then
		set dsp_active to state of theObject as boolean
		set enabled of matrix "dsp_branch" of box "dsp" of window "main" to dsp_active
		set enabled of button "dsp_developer" of window "main" to dsp_active
		set enabled of button "dsp_update" of window "main" to dsp_active
		set enabled of button "dsp_compile" of window "main" to dsp_active
		set enabled of button "dsp_test" of window "main" to dsp_active
	end if
	if (name of theObject is "modular_active") then
		set modular_active to state of theObject as boolean
		set enabled of matrix "modular_branch" of window "main" to modular_active
		--set enabled of button "modular_developer" of window "main" to modular_active
		set enabled of button "modular_update" of window "main" to modular_active
		set enabled of button "modular_compile" of window "main" to modular_active
		set enabled of button "modular_test" of window "main" to modular_active
	end if
	if (name of theObject is "multicore_active") then
		set multicore_active to state of theObject as boolean
		set enabled of matrix "multicore_branch" of window "main" to multicore_active
		set enabled of button "multicore_developer" of window "main" to multicore_active
		set enabled of button "multicore_update" of window "main" to multicore_active
		set enabled of button "multicore_compile" of window "main" to multicore_active
		set enabled of button "multicore_test" of window "main" to multicore_active
	end if
	if (name of theObject is "toolbox_active") then
		set toolbox_active to state of theObject as boolean
		set enabled of matrix "toolbox_branch" of window "main" to toolbox_active
		set enabled of button "toolbox_developer" of window "main" to toolbox_active
		set enabled of button "toolbox_update" of window "main" to toolbox_active
		set enabled of button "toolbox_compile" of window "main" to toolbox_active
		set enabled of button "toolbox_test" of window "main" to toolbox_active
	end if
	
	if (name of theObject is "dsp_active_branch") then
		set dsp_branch to "active"
	end if
	if (name of theObject is "dsp_trunk") then
		set dsp_branch to "trunk"
	end if
	if (name of theObject is "dsp_developer") then
		set dsp_developer to state of theObject
	end if
	if (name of theObject is "dsp_update") then
		set dsp_update to state of theObject
	end if
	if (name of theObject is "dsp_compile") then
		set dsp_compile to state of theObject
	end if
	if (name of theObject is "dsp_test") then
		set dsp_test to state of theObject
	end if
	
	if (name of theObject is "modular_active_branch") then
		set modular_active_branch to "active"
	end if
	if (name of theObject is "modular_trunk") then
		set modular_trunk to "trunk"
	end if
	if (name of theObject is "modular_developer") then
		set modular_developer to state of theObject
	end if
	if (name of theObject is "modular_update") then
		set modular_update to state of theObject
	end if
	if (name of theObject is "modular_compile") then
		set modular_compile to state of theObject
	end if
	if (name of theObject is "modular_test") then
		set modular_test to state of theObject
	end if
	
	if (name of theObject is "multicore_active_branch") then
		set multicore_active_branch to "active"
	end if
	if (name of theObject is "multicore_trunk") then
		set multicore_trunk to "trunk"
	end if
	if (name of theObject is "multicore_developer") then
		set multicore_developer to state of theObject
	end if
	if (name of theObject is "multicore_update") then
		set multicore_update to state of theObject
	end if
	if (name of theObject is "multicore_compile") then
		set multicore_compile to state of theObject
	end if
	if (name of theObject is "multicore_test") then
		set multicore_test to state of theObject
	end if
	
	if (name of theObject is "toolbox_active_branch") then
		set toolbox_active_branch to "active"
	end if
	if (name of theObject is "toolbox_trunk") then
		set toolbox_trunk to "trunk"
	end if
	if (name of theObject is "toolbox_developer") then
		set toolbox_developer to state of theObject
	end if
	if (name of theObject is "toolbox_update") then
		set toolbox_update to state of theObject
	end if
	if (name of theObject is "toolbox_compile") then
		set toolbox_compile to state of theObject
	end if
	if (name of theObject is "toolbox_test") then
		set toolbox_test to state of theObject
	end if
	
	if (name of theObject is "compiler_development") then
		set compiler_configuration to "Development"
	end if
	if (name of theObject is "compiler_deployment") then
		set compiler_configuration to "Deployment"
	end if
	if (name of theObject is "compiler_clean") then
		set compiler_clean to state of theObject
	end if
	
	
	
	if (name of theObject is "dorun") then
		if (dsp_active) then
			display dialog "dsp_active! -- " + jamoma_folder_path
		end if
		
		if (multicore_active) then
			display dialog "multicore_active!"
		end if
		
		if (modular_active) then
			display dialog "modular_active!"
		end if
		
		if (toolbox_active) then
			display dialog "toolbox_active!"
		end if
		
		
	end if
	
	
	--tell application "MaxMSP"
	--	activate
	--end tell
	
	
	
end clicked



on conclude drop theObject drag info dragInfo
	--(*Add your script here.*)
	-- set jamoma_folder_path to contents of control "jamoma_folder_path" of window "main" as string
	--	set jamoma_folder_path to text of control "jamoma_folder_path" of window "main" as string
	--set foo to items of control "jamoma_folder_path" of window "main"
	--display dialog "this many items: " + (size of foo)
	
	--	set foo to source of dragInfo
	
	--	set contents of control "jamoma_folder_path" of window "main" to myPath
	--	set newPath to contents of control "jamoma_folder_path" of window "main"
	
	set newPath to string value of control "jamoma_folder_path" of window "main"
	
	--log (call method "pathFromURL:" of class "SomeClass" with parameter (get string value of control "jamoma_folder_path" of window "main"))
	--	log (call method "pathFromURL:" of class "SomeClass" with parameter (get string value of control "pathControl" of whatever))
	
	display dialog (newPath as string)
	
	
	
	
end conclude drop

on prepare drop theObject drag info dragInfo
	(*Add your script here.*)
end prepare drop

on drop theObject drag info dragInfo
	(*Add your script here.*)
end drop

on drag entered theObject drag info dragInfo
	(*Add your script here.*)
end drag entered

on drag exited theObject drag info dragInfo
	(*Add your script here.*)
end drag exited

on drag updated theObject drag info dragInfo
	(*Add your script here.*)
end drag updated

on drag theObject drag info dragInfo
	(*Add your script here.*)
end drag

