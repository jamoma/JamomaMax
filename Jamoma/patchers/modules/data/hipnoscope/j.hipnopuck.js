autowatch = 1;

// Some constants
var pi = 3.141592653589793238462643383279502884197169399375105820974944592307816406286208998628034825342117068;
var degreesToRadians = pi / 180.0;
var radiansToDegrees = 180.0 / pi;

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
var hipnoRadius;

// Variables describing puck position
var vPuckAngle    = 0;
var vPuckDistance = 0;
var vx            = 0;
var vy            = 0;

// Process arguments
vPuckRadius      = 10.;  // default value
vPuckStrokeWidth = 4;    // default value

if (jsarguments.length>1)
	vPuckRadius = jsarguments[1];
if (jsarguments.length>2)
	vPuckStrokeWidth = jsarguments[2];


function paint() {
	with(m) {
        
        calculateGeometry();
        
        var offset = 0.5*vPuckRadius;
        var lx = width *0.5 + hipnoRadius*vx - offset;
        var ly = height*0.5 - hipnoRadius*vy - offset;
        
        // Make object transparent
		set_source_rgba(0., 0., 0., 0.);
		paint();
        
        // Draw puck - white within black donut
		set_source_rgba(0., 0., 0., 1.);
        set_line_width(vPuckStrokeWidth);
        ellipse(lx, ly, vPuckRadius, vPuckRadius);
        stroke();
        
		set_source_rgba(1., 1., 1., 1.);
        set_line_width(vPuckStrokeWidth-2);
        ellipse(lx, ly, vPuckRadius, vPuckRadius);
        stroke();
	}
}

function msg_float(v)
{
	list(v,vy);
}

function list()
{
	if (arguments.length>0)
		vx = arguments[0];
	if (arguments.length>1)
		vy = arguments[1];
    
    processlist();
	notifyclients();
	bang();
}

function set()
{
	if (arguments.length == 1) {
        setlist(arguments[0],vy)
	} else if (arguments.length == 2) {
		setlist(arguments[0], arguments[1]);
	}
}

function setlist(x, y)
{
	vx = x;
	vy = y;
	
	processlist();
	notifyclients();
	refresh();
}

function processlist()
{
	var width = box.rect[2] - box.rect[0];
	var height = box.rect[3] - box.rect[1];
	
    // Clip to unit circle
    var temp = Math.sqrt(vx*vx+vy*vy);
    
    if (temp<=1)
        temp = 1;
	
    vx = vx/temp;
    vy = vy/temp;    
}
processlist.local = 1; //private

function calculateGeometry()
{
	width = box.rect[2] - box.rect[0];
	height = box.rect[3] - box.rect[1];
    
    if (height<width)
        hipnoRadius = height*0.5;
    else
        hipnoRadius = width*0.5;
    
    // Prevent puck donut from falling off screen
    hipnoRadius = hipnoRadius - 0.5*(vPuckRadius + vPuckStrokeWidth);
}
calculateGeometry.local = 1; //private

function bang()
{
	refresh();
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

function onclick(x,y)
{
	ondrag(x,y);
}
onclick.local = 1; //private

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
