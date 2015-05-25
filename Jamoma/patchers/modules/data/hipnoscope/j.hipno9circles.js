autowatch = 1;

// Some constants
var pi = 3.141592653589793238462643383279502884197169399375105820974944592307816406286208998628034825342117068;

// MGraphics setup
var m = mgraphics;
m.init();
m.autofill = 0;
m.relative_coords = 0;

// Inlets and outlets
inlets = 1;
outlets = 1;

// Geometry variables
var width;
var height;
var strokeWidth = 6;

function paint() {
	with(m) {
        
    	width  = box.rect[2] - box.rect[0];
    	height = box.rect[3] - box.rect[1];
        
        distance = height/8.8;
        var diameter = 0.8*distance-strokeWidth;
    
        if (distance>width)
            distance = width;
        
        var lx = 0.5*strokeWidth;
        var ly = 0.5*strokeWidth;
        
        // Make object transparent
		set_source_rgba(0., 0., 0., 0.);
		paint();
        
        // Red
        drawCircle(lx,ly,diameter,1.,0.,0.);
        
        // Orange
        ly += distance;
        drawCircle(lx,ly,diameter,1.,0.5,0.);
        
        // Yellow
        ly += distance;
        drawCircle(lx,ly,diameter,1.,1.,0.);
        
        // Green
        ly += distance;
        drawCircle(lx,ly,diameter,0.,1.,0.);
        
        // Aqua
        ly += distance;
        drawCircle(lx,ly,diameter,0.,1.,1.);
        
        // Blue
        ly += distance;
        drawCircle(lx,ly,diameter,0.,0.,1.);
        
        // Purple
        ly += distance;
        drawCircle(lx,ly,diameter,0.5,0.,1.0);
        
        // Magenta
        ly += distance;
        drawCircle(lx,ly,diameter,1.,0.,1.);
        
        // Black
        ly += distance;
        drawCircle(lx,ly,diameter,0.,0.,0.);

        // 0 6 4 1 5 2 7 3 8
	}
}

function drawCircle(x,y,d,r,g,b)
{
    with(m) {
        // Draw circle 1 - red with gray frame
	    set_source_rgba(0.6, 0.6, 0.6, 1.);
        set_line_width(strokeWidth);
        ellipse(x,y,d,d);
        stroke_preserve();
    
	    set_source_rgba(r, g, b, 1.);
        fill();
    }
}

function fsaa(v)
{
	sketch.fsaa = v;
	bang();
}

function onresize(w,h)
{
	refresh();
}
onresize.local = 1; //private

//  onclick(), ondblclick(), and ondrag() 

function onclick(x,y)
{
	height = box.rect[3] - box.rect[1];
    var button = Math.floor(y*8.8/height);
    
    var buttonSequence = [0, 6, 4, 1, 5, 2, 7, 3, 8];
    var interpolate = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0];
    interpolate[buttonSequence[button]] = 1.0;
    outlet(0, interpolate);
    
}
onclick.local = 1; //private

/*
function ondrag(x,y)
{
	calculateGeometry();
    
    // Clamp to size of GUI

	x =  (x-0.5*width)/hipnoRadius;
	y = -(y-0.5*height)/hipnoRadius;
    
	var d = Math.sqrt(x*x + y*y);
    var a = radiansToDegrees * Math.atan2(y, x);
    // Convert from math to navigational coordinate system
    a = -(a-90);
    if (a>180.)
        a -= 360;
    
    list(x, y);
    
    outlet(0,vx,vy);
}
ondrag.local = 1; //private 
*/