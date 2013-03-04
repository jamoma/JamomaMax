// Javascript for Jamoma: scripting and setting delays to adjust
// for speaker layout when distance to speakers differs.
// By Trond Lossius, ©2006
// modified by Nils Peters, ©2009
// License: GNU LGPL


/*******************************************************************
 * SETUP
 *******************************************************************/

//autowatch = 1;

// CONSTANTS
MAX_VOICES = 32;                    // Maximum number of speakers

// VARIABLES
var speed_of_sound = 343.8; // Speed of sound at 20°C (m/s)
var one_over_speed_of_sound_ms = 1.0 / (speed_of_sound / 1000);
var temp = 20; // °C 
var DSP_running = 0;
var auto = 1;    // automatic position based calculation of delays or manual delay setting
var distance = new Array(MAX_VOICES);
var delaySamples = new Array(MAX_VOICES);
var num_voices = 0;                    // Current number of voices
var num_voices_prev = 0;            // Previous number of voices
var hold_voices = 0;                // If audio is running, voices will not be changed
                                    // Instead the message is held until audio is turned off
var hold_flag = 0;                    // Flag indicating if change in number of voices 
                                    // is currently on hold
var i                                // A counter

// INLETS AND OUTLETS


outlets = 2

setinletassist(0,"Messages: position, numSpeakers, dspstate, automatic, temperature");
setoutletassist(0,"Scripting messages");

for (i=0; i<MAX_VOICES; i++)
{

    distance[i]=1;
}    

//function sr(value)
//{
//    if (sample_rate==value) return;
//    
//    sample_rate = value;
//    sample_rate_ms = value * 0.001;
//    speed_over_fs = speed_of_sound / sample_rate;
//    fs_over_speed = sample_rate / speed_of_sound;
//    calculate_delays();
//}

function dspstate(value)
{
    DSP_running = value;
    
    if (value==0)
    {
        if (hold_flag==1)
            numSpeakers(hold_voices);
    }
}

function temperature(value)
{
    if (temp==value) return;
    
    speed_of_sound = (331.3 * Math.sqrt(1.0 + value / 273.15));
    //post(speed_of_sound)
    one_over_speed_of_sound_ms = 1.0 / (speed_of_sound / 1000);
    temp = value;
    if (auto == 1) calculate_delays();  
}

function automatic(value)
{
    if (auto==value) return;
    auto = value;
    if (auto ==1) calculate_delays(); 
}

function position()
{
    var a = arrayfromargs(messagename,arguments);
    
    distance[(a[1]-1)] = a[4];
    if (auto ==1) calculate_delays();
}

function numSpeakers(value)
{
    // Put change in number of voices on hold if audio is running
    if (DSP_running==1)
    {
        hold_voices = value;
        hold_flag = 1;
        
        post("jmod.sur.speaker.delays~: Audio is currently running.");
        post();
        post("Number of voices will be updated next time audio is turned off.");
        post();
    }
    
    else
    {    
        // Only perform scripting if the number of voices actually change
        if (value==num_voices) return;    

        num_voices_prev = num_voices;
        num_voices = value;
        
        if (num_voices > MAX_VOICES)
            num_voices = MAX_VOICES;
        if (num_voices < 0)
            num_voices = 0;
        
        for (i=0; i<num_voices_prev; i++)
        {
            outlet(0, "script", "delete", "delay["+(i+1)+"]");
        }
        for (i=0; i<num_voices; i++)
        {
            outlet(0, "script", "new", "delay["+(i+1)+"]", "newex", (220+40*i), (220+25*i), 73, 196617, "delay~", 44100);
            outlet(0, "script", "connect", "multiout", i, "delay["+(i+1)+"]", 0);
            outlet(0, "script", "connect", "delay["+(i+1)+"]", 0, "multiin", i);
        }
    }
}

function calculate_delays()
{
    var i;
    var max_dist = 0;
    
    for (i=0; i<num_voices; i++)
    {
        if (distance[i]>max_dist)
            max_dist = distance[i];
    }
    for (i=0; i<num_voices; i++)
    {   delaySamples[i] = (max_dist - distance[i]) * one_over_speed_of_sound_ms; 
        outlet(0, "script", "send", "delay["+(i+1)+"]", delaySamples[i], "ms");
        
        outlet(1, i+1, delaySamples[i]);  
    }
}

// the following procedures were added by Nils Peters on March 10, 2009
// TODO: if SR changes, the state of the current delays are wrong. 
function delay()   
{   
    if (auto == 1) return;

    var a = arrayfromargs(messagename,arguments);    
        
    if (a[1] <= num_voices)
    { 
      delaySamples[a[1]-1] = (a[2]); // we expect a time delay in ms
      outlet(1, a[1], delaySamples[a[1]-1]); 
      outlet(0, "script", "send", "delay["+(a[1])+"]", delaySamples[a[1]-1], "ms");
    }
}

function bypass(toggle)
{
    if (toggle == 0)
    {
     for (i=0; i<num_voices; i++)
        {
        outlet(0, "script", "send", "delay["+(i+1)+"]", delaySamples[i], "ms");
        outlet(1, i+1, delaySamples[i]);  
        }
    }
    else if (toggle == 1)
        {
        for (i=0; i<num_voices; i++)
        {
        outlet(0, "script", "send", "delay["+(i+1)+"]", 0, "ms");
        outlet(1, i+1, 0);  
        }
    }
}


