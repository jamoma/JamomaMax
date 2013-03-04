/*
 * jmod.jsui_multigain.js
 * multichannel gain adjustment and level display
 * Adapted by Trond Lossius from RTAQ User Interface 
 * RTA Display and Graphic EQ Controls
 * by Tim Place
 * Copyright © 2004 Electrotap L.L.C.
 * Used by permission
 *
 * License: GNU LPGL
 */


/*******************************************************************
 * SETUP
 *******************************************************************/

//autowatch = 1;							// while developing

// CONSTANTS
const MAX_VOICES = 64;						// maximum number of voices permitted

// Globals

// Number of voices
var num_voices = 16;						// number of voices
var num_active = 16;						// number of active voices
var rnum_voices = 1.0 / num_voices;
var hrnum_voices = rnum_voices / 2;

var vmode = 0;								// 0: [0,127] MIDI Gain, 1: [-24,24] dB

// Gains and displayed levels
var gain_left = new Array(MAX_VOICES);		// stored internally as [0.0, 1.0]...
var levels_left = new Array(MAX_VOICES);
var attr_meters_active = 1;					// flag: display meters?

var vbrgb = [0.6,0.6,0.6];					// background
var vfrgb = [0.0,0.0,0.0];					// knob
var vrgb2 = new Array(MAX_VOICES+4);		// gutter
var vrgb3 = [0.2,0.2,0.2]					// 0 dB marker

var gutter_group = 0;						// different grouping patterns for the gutter

var voutline = 1;							// (toggle) draw outline on shapes, or not
var	width;									// width of GUI
var	height;									// height of GUI
var	aspect;									// ratio = width/height

var band_select;

// CONFIGURATION
sketch.default2d();
inlets = 1;
outlets = 2;

isInitiated = 0;


// INITIALIZATION
function init()
{
	// set up assistance strings
	setinletassist(0, "input");
	setoutletassist(0, "output");
	
	// Process Arguments	
	// argument[0] = name of this javascript file

	if (jsarguments.length>1)
		voices(jsarguments[1]);
		
	if (jsarguments.length>2)
		active(jsarguments[2]);
		
	if (jsarguments.length>3)
		mode(jsarguments[3]);
	else
		mode(0);

	if (jsarguments.length>4)
		group(jsarguments[4]);
	else
		group(0);
	
	// init globals
	for(var i=0; i<num_voices; i++){
		levels_left[i] = 0;
	}

	onresize();
	draw();			// writes to the off-screen buffer
	refresh();		// copies the buffer to the screen
	isInitiated = 1;
}
init.local = 1;		// hide the init function
init();				// run the init function


/*******************************************************************
 * METHODS
 *******************************************************************/


// Set the number of voices
function voices(variable)
{
	num_voices = variable;
	rnum_voices = 1.0 / num_voices;
	hrnum_voices = rnum_voices / 2;
	if (vmode==0) {
		for (var i=0; i<num_voices; i++)
			gain_left[i] = 1.
	}
	else {
		for (var i=0; i<num_voices; i++)
			gain_left[i] = 0.5;
	}
	gutter_colors();
	draw();			// writes to the off-screen buffer
	refresh();		// copies the buffer to the screen	
}



// Set the way gutter colors are set
function group(variable)
{
	gutter_group = variable;
	gutter_colors()
}


// Change the way gutter colors are set
function gutter_colors()
{
	if (gutter_group==1) {				// ambisonic
		for (var i=0; i<Math.min(num_voices, 1); i++)
			vrgb2[i] = [0.2,0.2,0.2];
		for (var i=1; i<Math.min(num_voices, 4); i++)
			vrgb2[i] = [0.6,0.15,0.15];
		for (var i=4; i<Math.min(num_voices, 9); i++)
			vrgb2[i] = [0.15,0.15,0.6];
		for (var i=9; i<Math.min(num_voices, 16); i++)
			vrgb2[i] = [0.15,0.5,0.15];
	}
	else if (gutter_group==2) {				// in two	
		for (var i=0; i<((num_voices)/2+1); i++) {
			vrgb2[2*i] = [0.2,0.2,0.2];
			vrgb2[2*i+1] = [0.6,0.15,0.15];
		}
	}
	else if (gutter_group==3) {				// in three	
		for (var i=0; i<((num_voices)/3+1); i++) {
			vrgb2[3*i] = [0.2,0.2,0.2];
			vrgb2[3*i+1] = [0.6,0.15,0.15];
			vrgb2[3*i+2] = [0.15,0.15,0.6];
		}
	}
	else if (gutter_group==4) {				// in four	
		for (var i=0; i<((num_voices)/4+1); i++) {
			vrgb2[4*i] = [0.2,0.2,0.2];
			vrgb2[4*i+1] = [0.6,0.15,0.15];
			vrgb2[4*i+2] = [0.15,0.15,0.6];
			vrgb2[4*i+3] = [0.15,0.5,0.15];
		}
	}
	else if (gutter_group==5) {				// in five	
		for (var i=0; i<((num_voices)/4+1); i++) {
			vrgb2[5*i] = [0.2,0.2,0.2];
			vrgb2[5*i+1] = [0.6,0.15,0.15];
			vrgb2[5*i+2] = [0.15,0.15,0.6];
			vrgb2[5*i+3] = [0.15,0.5,0.15];
			vrgb2[5*i+4] = [0.8,0.8,0.8];
		}
	}	
	else {
		for (var i=0; i<num_voices; i++)
			vrgb2[i] = [0.2,0.2,0.2];
	}
	draw();			// writes to the off-screen buffer
	refresh();		// copies the buffer to the screen		
}
gutter_colors.local = 1;		// hide this function


// Set the number of voices that are currently active
function active(variable)
{
	num_active = variable;
	if (num_active > num_voices)
		num_active = num_voices;
	if (num_active < 0)
		num_active = 0;
	draw();			// writes to the off-screen buffer
	refresh();		// copies the buffer to the screen	
}
 


// A list of the volume levels to display
// Args are the volume as expressed in millimeters (0-100)
function levels()
{
	if(arguments.length != num_active){
		post("jmod.jsui_multigain.js: Wrong number of args for gain()");
		post();
		return;
	}
		
	for(var i=0; i<num_active; i++){
		levels_left[i] = (Math.min(Math.max(0, arguments[i]), 100)) * 0.01;		// clip range & scale
		
	}
	draw();
	refresh();
}



// Output volumes
function bang()
{
	var temp = new Array(num_active);
	draw();
	refresh();

	if (vmode==0)
	{
		for(var i=0; i<num_active; i++)
		{
			temp[i] = gain_left[i] * 127.0;
		}	
	}
	else
	{
		for(var i=0; i<num_active; i++)
		{
			temp[i] = (gain_left[i] * 48.0) - 24.0;
		}
	}
		
	outlet(0, temp);
}


// Set gain levels and output
function gain()
{
	if(arguments.length != num_active){
		post("jmod.jsui_multigain.js: Wrong number of args for gain()");
		post();
		return;
	}
	
	if (vmode==0) {
		for (var i=0; i<num_active; i++) {
			gain_left[i] = ((Math.min(Math.max(0, arguments[i]), 127))) / 127.;		// clip range & scale	
		}
	}
	else
	{
		for(var i=0; i<num_active; i++)
		{
			gain_left[i] = ((Math.min(Math.max(-24, arguments[i]), 24)) + 24) / 48.0;		// clip range & scale	
		}
	}
	bang();
}



// Set gain levels, but no output
function set()
{
	if(arguments.length != num_active){
		post("jmod.jsui_multigain.js: Wrong number of args for gain()");
		post();
		return;
	}
	
	if (vmode==0) {
		for (var i=0; i<num_active; i++) {
			gain_left[i] = ((Math.min(Math.max(0, arguments[i]), 127))) / 127.;		// clip range & scale	
		}
	}
	else
	{
		for(var i=0; i<num_active; i++)
		{
			gain_left[i] = ((Math.min(Math.max(-24, arguments[i]), 24)) + 24) / 48.0;		// clip range & scale	
		}
	}
}


// This function is currently not used
// Could come in handy if we were dealing with a set of stereo channels
function link()
{
	var temp = new Array(num_voices);


	if(arguments.length != num_active){
		post("jmod.jsui_multigain.js: Wrong number of args for link()");
		post();
		return;
	}
		
	for(var i=0; i<num_active; i++){
		gain_left[i] = ((Math.min(Math.max(-24, arguments[i]), 24)) + 24) / 48.0;		// clip range & scale
		
	}
	
	
	draw();
	refresh();	
	for(var i=0; i<num_voices; i++){
		temp[i] = (gain_left[i] * 48.0) - 24.0;
	}
		
	outlet(1, temp);
}

// Toggle display of levels on/off
function metering(v)
{
	attr_meters_active = v;
	draw();
	refresh();
}


// Toggle anti-aliasing on/off
function fsaa(v)
{
	sketch.fsaa = v;
	bang();
}


// Two modes: 0: [0,127] MIDI Gain, 1: [-24,24] dB
function mode(v)
{
	vmode = v;
	if (vmode==0) {
		for (var i=0; i<num_voices; i++)
			//gain_left[i] = 127./157.
			gain_left[i] = 1.
	}
	else {
		for (var i=0; i<num_voices; i++)
			gain_left[i] = 0.5;
	}
	
	// prevent output in the init method:
	if (isInitiated)
		bang();
}


/*******************************************************************
 * DRAWING AND INTERFACE FUNCTIONS
 *******************************************************************/
 
// WRITE TO THE OFF-SCREEN BUFFER
function draw()
{
	with (sketch){
		//scale everything to box size
		glmatrixmode("modelview");
		glpushmatrix();
		glscale(aspect, 1, 1);
		glenable("line_smooth");

		// erase background
		glclearcolor(vbrgb);
		glclear();			
		
		for(var i=0; i<num_active; i++){
			// FIRST, Draw RTA Meter
			if(attr_meters_active == 1){
				glcolor(0.0, 1.0, 0.0);
				shapeslice(1, 1);
				moveto(((i * rnum_voices * 2) - 1) + rnum_voices, -0.9 /* 1.6 * gain_left[i] - 0.8 */); 	//on screen in range -0.8 to 0.8	
				plane(rnum_voices - 0.01, levels_left[i] * 1.8); 
			}
		}
		
		// SECOND, Draw 0 dB marker, if we are in dB mode
		if (vmode==1) {
			glcolor(vrgb3);
			moveto(-1.+(0.2*rnum_voices), 0.0);
			line(2*rnum_voices*(num_active-0.2),0);
		}

		
		for(var i=0; i<num_active; i++){	
			// THIRD, Draw the gutter for the slider
			//draw line
			glcolor(vrgb2[i]);
			shapeslice(1, 1);
			moveto(((i * rnum_voices * 2) - 1) + rnum_voices, 0);
			plane(0.15 / num_voices, 0.8);
			
			// draw marker
			glcolor(vfrgb);
	
			// FORTH, Draw the knob for the slider
			// Draw Rectangle
			shapeslice(1,1);
			moveto(((i * rnum_voices * 2) - 1) + rnum_voices, 1.6 * gain_left[i] - 0.8); 	//on screen in range -0.8 to 0.8	
			plane(0.8 / num_voices, 0.05); 
		}
		
		//reset transformation matrix
		glmatrixmode("modelview");
		glpopmatrix();
	}
}


// WHEN A USER CLICKS ON THE INTERFACE
function onclick(x, y, but, cmd, shift, capslock, option, ctrl)
{
	ondrag(x,y,but,cmd,shift,capslock,option,ctrl)
}
onclick.local = 1;		// hide this function


// WHEN A USER DRAGS IN THE INTERFACE
function ondrag(x, y, but, cmd, shift, capslock, option, ctrl)
{
	var f, a;

	band_select = x / width;		// gives us [0, 1]
	band_select /= rnum_voices;
	band_select = Math.floor(band_select);	// truncates roundoff error

	gain_left[band_select] = Math.min(Math.max(0,(1 - (y / height))), 1);
	bang();
}
ondrag.local = 1;					// hide this function


// WHEN THE OBJECT IS RESIZED
function onresize(w,h)
{
	width = box.rect[2] - box.rect[0];
	height = box.rect[3] - box.rect[1];
	aspect = width/height;	

	draw();
	refresh();
}
onresize.local = 1;		// hide this function

