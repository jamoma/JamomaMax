// Javascript for Jamoma: 
// Calculate gain values associated with free-field amplitude roll-of with distance
// Number of instances changed dynamically depending on number of voices used.
//
// By Trond Lossius, (c) 2007-2014
// This code is licensed under the terms of the "New BSD License"



// SETUP

//autowatch = 1;

// CONSTANTS

MAX_VOICES = 32;                        // Maximum number of speakers

// VARIABLES
var numSources = 0;                     // Current number of sources to process
var referenceDistance   = 1;            // Reference distance for rolloff
var rollOffExponent     = -1.;          // Exponent used for rolloff calculation
var currentChannel      = 0;          // Current channel addressed by position and active messages

var distance = new Array(MAX_VOICES);   // Array of per channel distance values
var active = new Array(MAX_VOICES);     // Array of per chanel flags indicating if rolloff processing is active

var i                                   // A counter

for (i=0; i<MAX_VOICES; i++) {
    active[i] = 1;
    distance[i] = 0.;
}


// INLETS AND OUTLETS

inlets = 2;
outlets = 1;

setinletassist (1,  "Channel number for channel-specific messages")
setinletassist (0,  "Various messages");
setoutletassist(0,  "messages for j.mixer=");

function msg_int(i)
{
    if (inlet==1)
    currentChannel = i-1;   // While message_array counts from 1, javascript counts from 0
}

function sourceactive(value)
{
    active[currentChannel] = value;
    calculateGain(currentChannel);
}

function sourceposition()
{
    distance[currentChannel] = 0.;
    for (i=0; i<arguments.length; i++) {
        distance[currentChannel] = distance[currentChannel] + arguments[i] * arguments[i];
    }
    distance[currentChannel] = Math.sqrt(distance[currentChannel]);
    calculateGain(currentChannel);
    
}

function setreferencedistance(value)
{
    referenceDistance = value;
    updateAllValues();
}

function setrolloff(value)
{
    rollOffExponent = -value / 6.;
    updateAllValues();
}

function setnumsources(value)
{
    numSources = value;
    outlet(0, "numInputs", numSources);
    outlet(0, "numOutputs", numSources);
    updateAllValues();
}

function calculateGain(channel) {
    var relativeDistance;
    
    if (active[channel]==0)
        outlet(0, "setLinearGain", channel, channel, 1.)
    else {
        if (distance[channel] < referenceDistance)
            relativeDistance = 1.;
        else
            relativeDistance = distance[channel] / referenceDistance;
        outlet(0, "setLinearGain", channel, channel, Math.pow(relativeDistance,rollOffExponent));
    }
}
calculateGain.local=1 // keep private

function updateAllValues()
{
    for (i=0; i<numSources; i++)
        calculateGain(i);
}
updateAllValues.local=1; // keep private