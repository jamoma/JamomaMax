// Javascript for Jamoma: scripting algorithm for creating doppler shift.
// Number of instances changed dynamically depending on number of voices used.
//
// By Trond Lossius, ©2006
// License: GNU LGPL


/*******************************************************************
 * SETUP
 *******************************************************************/

//autowatch = 1;

// CONSTANTS

MAX_VOICES = 32;                        // Maximum number of speakers

// VARIABLES

var sample_rate = 44100;
var DSP_running = 0;
var distance = new Array(MAX_VOICES);
var num_voices = 0;                     // Current number of voices
var num_voices_prev = 0;                // Previous number of voices
var hold_voices = 0;                    // If audio is running, voices will not be changed
                                        // Instead the message is held until audio is turned off
var hold_flag = 0;                      // Flag indicating if change in number of voices is currently on hold
var i                                   // A counter


// INLETS AND OUTLETS

outlets = 0;

setinletassist(0,"Number of voices, DSP state");
setoutletassist(0,"Scripting messages");

function dspstate(value)
{
    DSP_running = value;
    
    if (value==0)
    {
        if (hold_flag==1)
            numsources(hold_voices);
    }
}

// CamelCase don't work well with JavaScript function names in Max.
function numsources(value)
{
    // Put change in number of voices on hold if audio is running
    if (DSP_running==1)
    {
        hold_voices = value;
        hold_flag = 1;
        
        post("jmod.sur.doppler~: Audio is currently running.");
        post();
        post("Number of voices will be updated next time audio is turned off.");
        post();
    }
    
    else
    {    
        num_voices_prev = num_voices;
        num_voices = value;
        
        if (num_voices > MAX_VOICES)
            num_voices = MAX_VOICES;
        if (num_voices < 0)
            num_voices = 0;
        
        // Only perform scripting if the number of voices actually change
        if (num_voices==num_voices_prev) return;
        
        for (i=0; i<num_voices_prev; i++)
        {
            outlet(0, "script", "delete", "doppler["+(i+1)+"]");
        }
        // Script recreate j.pack= and j.unpack= to prevent processing of redundant channels
        outlet(0, "script", "delete", "pack=");
        outlet(0, "script", "delete", "unpack=");
        outlet(0, "script", "newobject", "newobj", "@varname", "unpack=", "@text", "j.unpack= " + num_voices, "@patching_position", 80, 288, "@fixwidth", 1);
        outlet(0, "script", "newobject", "newobj", "@varname", "pack=",   "@text", "j.pack= "   + num_voices, "@patching_position", 80, 880, "@fixwidth", 1);
        
        outlet(0, "script", "connect", "signalin",  0, "unpack=",   0);
        outlet(0, "script", "connect", "pack=",     0, "signalout", 0);
        
        // Create and connect doppler subpatches
        for (i=0; i<num_voices; i++)
        {            
            outlet(0, "script", "newdefault", "doppler["+(i+1)+"]", (80+30*i), (330+25*i), "j.ch.doppler=");
            outlet(0, "script", "connect", "unpack=",               i, "doppler["+(i+1)+"]",    0);
            outlet(0, "script", "connect", "doppler["+(i+1)+"]",    0, "pack=",                 i);
            outlet(0, "script", "connect", "active_gate",           i, "doppler["+(i+1)+"]",    1);
            outlet(0, "script", "connect", "position_gate",         i, "doppler["+(i+1)+"]",    2);
            outlet(0, "script", "connect", "meters_per_unit",       0, "doppler["+(i+1)+"]",    3);
        }
        outlet(0, "done");
    }
}