/* 
 *	jcom.plug.out≈
 *	Plugtastic Output External
 *	Copyright © 2010 by Timothy Place
 * 
 *	License: This code is licensed under the terms of the "New BSD License"
 *	http://creativecommons.org/licenses/BSD/
 */


#include "MaxAudioGraph.h"


// Data Structure for this object
struct PlugOut {
    Object					obj;
	TTAudioGraphObjectPtr	audioGraphObject;
	ObjectPtr				patcher;			// the patcher -- cached for iterating to make connections
	ObjectPtr				patcherview;		// first view of the top-level patcher (for dirty notifications)
	TTPtr					qelem;				// for clumping patcher dirty notifications
	TTPtr					audioGraphOutlet;	// pass audio through, or to the host
	
	SymbolPtr				pluginName;
	SymbolPtr				pluginVersion;
	SymbolPtr				pluginManufacturer;
	
	SymbolPtr				pluginVersionHex;
	SymbolPtr				pluginID;
	SymbolPtr				pluginManufacturerCode;
	
	TTThreadPtr				buildThread;
	TTPtr					progressWindow;
};
typedef PlugOut* PlugOutPtr;


extern "C" void PlugOutDoBuildAudioUnit_Export(PlugOutPtr self);


extern "C" void open_progress_window(PlugOutPtr self);
extern "C" void close_progress_window(PlugOutPtr self);
extern "C" void set_progress_window(PlugOutPtr self, double percentage);
