#!/bin/bash
# This file must be saved in UTF-8


################################
# Uninstallations Methodes
################################
function remove5 {
	echo "Removing Jamoma";
	doRemove;
}

function doRemove {
	echo -ne "- Jamoma Installer Receipt"
	sudo rm -Rf "/Library/Receipts/Jamoma.pkg" && echo -ne "... done.\n"
	
	if [ -e "$C74Folder" ] ; then
		echo -ne "- Jamoma Modular Folder ($C74Folder/Jamoma/)"
		sudo rm -Rf "$C74Folder/Jamoma" && echo -ne "... done.\n"
		
		echo -ne "- Default Settings Files ($C74Folder/default-settings/)"
		sudo rm -f "$C74Folder/default-settings/"Jamoma* && echo -ne "... done.\n"
		
		echo -ne "- Default Definitions Files ($C74Folder/default-definitions/)"
		sudo rm -f "$C74Folder/default-definitions/"jcom* && echo -ne "... done.\n"
		
		echo -ne "- Extension File ($C74Folder/extensions/)"
		sudo rm -Rf "$C74Folder/extensions/"jcom* && echo -ne "... done.\n"    
		
#		echo -ne "- Java Class Files ($C74Folder/java/classes/cueManager)"
#		rm -Rf "$C74Folder/java/classes/cueManager" && echo -ne "... done.\n"
	
	else
		echo -ne "Sorry, $C74Folder doen't exist. can't uninstall Jamoma files.\n"
	fi
	

	if [ -e "$maxAppFolder" ] ; then
		
		echo -ne "- Extra Files ($maxAppFolder/patches/extras/)"
		sudo rm -f "$maxAppFolder/patches/extras/"jamoma* && echo -ne "... done.\n"
		
		echo -ne "- Template Files ($maxAppFolder/patches/templates/)"
		sudo rm -f "$maxAppFolder/patches/templates/"jmod* && echo -ne "... done.\n"
		sudo rm -f "$maxAppFolder/patches/templates/"jalg* && echo -ne "... done.\n"
		sudo rm -f "$maxAppFolder/patches/templates/"_Jamoma_Patcher_.maxpat && echo -ne "... done.\n"
		sudo rm -f "$maxAppFolder/patches/templates/"layout.xml && echo -ne "... done.\n"
		
	else
		echo -ne "Sorry, $maxAppFolder doesn't exist. Extra files can't be uninstalled.\n"
	fi

   if [ -e "$FrameworkFolder" ] ; then
		echo -ne "- Modular Framework ($FrameworkFolder/JamomaModular.framework)"
		sudo rm -Rf "$FrameworkFolder/JamomaModular.framework" && echo -ne "... done.\n" 
		echo -ne "- Graphics Framework ($FrameworkFolder/JamomaGraphics.framework)"
		sudo rm -Rf "$FrameworkFolder/JamomaGraphics.framework" && echo -ne "... done.\n"      
		echo -ne "- Multicore Framework ($FrameworkFolder/JamomaMulticore.framework)"
		sudo rm -Rf "$FrameworkFolder/JamomaMulticore.framework" && echo -ne "... done.\n"
	   
		if [ -e "$TapTools" ]; then
			echo -ne "It seems that Tap.Tools is installed. Therfore the files that are shared between Jamoma and Tap.Tools will remain.\n"
		else    
	    	echo -ne "- DSP Framework ($FrameworkFolder/JamomaDSP.framework)."
			sudo rm -Rf "$FrameworkFolder/JamomaDSP.framework" && echo -ne "... done.\n" 
			echo -ne "- Foundation Framework ($FrameworkFolder/JamomaFoundation.framework)"
			sudo rm -Rf "$FrameworkFolder/JamomaFoundation.framework" && echo -ne "... done.\n"
			echo -ne "- DSP Extensions (/Library/Application Support/Jamoma)." 
			sudo rm -Rf "/Library/Application Support/Jamoma" && echo -ne "... done.\n" 
		fi
	else
		echo -ne "Sorry, $FrameworkFolder doesn't exist. Frameworks can't be uninstalled.\n"
	fi
	
 
	echo -ne "\n";

}


################################
# UnInstallation process
################################
clear

echo "--------------------------"
echo "--- Jamoma Uninstaller ---"
echo "--------------------------"
echo ""
echo ""


################################
#  Version checking
################################
whichVersion=0;



if [[ -e "/sysbuild/Development" ]]; then
	maxAppFolder="/sysbuild/Development";
	C74Folder="$maxAppFolder/Cycling '74";
	TapTools="$maxAppFolder/Cycling '74/extensions";
	remove5;
fi

maxAppFolder="/Applications/Max5";
FrameworkFolder="/Library/Frameworks";
C74Folder="$maxAppFolder/Cycling '74"; 
TapTools="$maxAppFolder/Cycling '74/extensions/tap.tools.mxo";
remove5;

echo -ne "done"
echo -ne "\n\nend of Jamoma's Uninstaller.\n"
echo -ne "(you can quit the Terminal now...)\n"

exit 0;
