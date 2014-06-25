/*	@author Adrian Gierakowski */

var DEBUG = 0;	// set to 1 to enable posting debugging messages to max window

inlets = 1;
outlets = 1;
autowatch = 1;

var task = new Task(init, this);
task.schedule(100);


// define CORNER enum
var CORNER = new function() {
  // this.TopLEFT = {value: 0, name: "top-left", code: "TL"}, 
  // this.TopRIGHT = {value: 1, name: "top-right", code: "TR"}, 
  // this.BottomRIGHT = {value: 2, name: "bottom-right", code: "BR"},
  // this.BottomLEFT = {value: 3, name: "bottom-left", code: "BL"},
  this.TopLEFT = 0; 
  this.TopRIGHT = 1;
  this.BottomRIGHT = 2;
  this.BottomLEFT = 3;
  this.getByName = function(name) 
  {
  	for (property in this) 
  	{
  		// if (this[property].name) 
  		// {
  		// 	post("this[property]: " + property + "\n");
  		// 	post("this[property].name: " + this[property].name + "\n");
  		// }
  		if (property === name) 
  		{
  			return this[property];
  		}
  	}
  }
};

// freeze the enum so that it can't be change later in the code
Object.freeze(CORNER);

// storage for all sticky subpatchers
var slavePatchers = [];

// Location object
function Location(array)
{
	this.x0 = array[0];
	this.y0 = array[1];
	this.x1 = array[2];
	this.y1 = array[3];
}
// make private
Location.local = 1;

Location.prototype.getWidth = function()
{
	return (this.x1 - this.x0);
}

Location.prototype.getHight = function()
{
	return (this.y1 - this.y0);
}

Location.prototype.offsetPoint2D = function(point2D)
{
	this.x0 = this.x0 + point2D.x;
	this.y0 = this.y0 + point2D.y;
	this.x1 = this.x1 + point2D.x;
	this.y1 = this.y1 + point2D.y;
}

Location.prototype.getAsArray = function()
{
	return [this.x0, this.y0, this.x1, this.y1];
}

Location.prototype.setFromArray = function(array)
{
	this.x0 = array[0];
	this.y0 = array[1];
	this.x1 = array[2];
	this.y1 = array[3];
}

// returns conrner coordinates as Point2D
Location.prototype.getCorner = function(corner)
{
	if (corner == CORNER.TopLEFT) 
	{
		return new Point2D([this.x0, this.y0]);
	}
	else if (corner == CORNER.TopRIGHT)
	{
		return new Point2D([this.x1, this.y0]);
	}
	else if (corner == CORNER.BottomRIGHT) 
	{
		return new Point2D([this.x1, this.y1]);
	}
	else if (corner == CORNER.BottomLEFT) 
	{
		return new Point2D([this.x0, this.y1]);
	}
}

Location.prototype.getSize = function()
{
	return this.getCorner(CORNER.BottomRIGHT).subtractPoint2D(this.getCorner(CORNER.TopLEFT));
}

// Point2D object
function Point2D(array) 
{
	this.x = array[0];
	this.y = array[1];
}
// make private
Point2D.local = 1;

Point2D.prototype.getAsArray = function()
{
	return [this.x, this.y];
}

Point2D.prototype.setFromArray = function(array)
{
	this.x = array[0];
	this.y = array[1];
	return this;
}

Point2D.prototype.addPoint2D = function(point2D)
{
	this.x += point2D.x;
	this.y += point2D.y;
	return this;
}

Point2D.prototype.subtractPoint2D = function(point2D)
{
	this.x -= point2D.x;
	this.y -= point2D.y;
	return this;
}

function SlavePatcher(masterPatcher, slavePatcher) 
{
	debugPost("Creating new SlavePatcher named: " + slavePatcher.name + ", with master patcher: " + masterPatcher.name + "\n");
	this.masterPatcher = masterPatcher;
	this.patcher = slavePatcher;
	this.name = this.patcher.name;
	this.object = this.patcher.box;

	post("this.object: " + this.object + "\n");

	if (this.object) {
		debugPost("this slave patcher is a subpatcher.\n");
	}
	else {
		debugPost("this slave patcher is not a subpatcher.\n");
	}

	// "top-right", "bottom-right", "top-left", "bottom-left"
	this.stickyCornerSlave = CORNER.TopRIGHT;	// corner of the slave window, which will stick to a specific location relative to one of the corner of the master window
	this.stickyCornerMaster = CORNER.TopLEFT;	// corner of the master window, which the corner of the slave window will follow
	this.stickyCornerOffset = new Point2D([0, 0]);	// offset of the stickyCornerSlave from the stickyCornerMaster

	this.titleBarCorrectionBottom = new Point2D([0, 22]);	// offset of the stickyCornerSlave from the stickyCornerMaster
	this.titleBarCorrectionTop = new Point2D([0, -22]);	// offset of the stickyCornerSlave from the stickyCornerMaster

	this.isSticky = true;
	this.keepInFront = false;

	this.trackMasterPosition;
	this.positionTracker = new Task(this.trackMasterPosition, this);
	this.positionTracker.interval = 100;


}
// make private
SlavePatcher.local = 1;

SlavePatcher.prototype.setIsSticky = function(isSticky) 
{
	this.isSticky = isSticky;
	if (this.isSticky) 
	{
		debugPost("Starting positionTracker task.\n");
		this.positionTracker.repeat();
	}
	else 
	{
		debugPost("Stopping positionTracker task.\n");
		this.positionTracker.cancel();
	}
}

SlavePatcher.prototype.setLocation = function(newLocation) 
{
	this.patcher.wind.location = newLocation.getAsArray();
}

SlavePatcher.prototype.trackMasterPosition = function() {
	debugPost("this.patcher.name: " + this.patcher.name + "\n");
	debugPost("this.stickyCornerSlave: " + this.stickyCornerSlave + "\n");
	debugPost("this.stickyCornerMaster: " + this.stickyCornerMaster + "\n");

	var masterLocation = new Location(this.masterPatcher.wind.location);
	var slaveLocation = new Location(this.patcher.wind.location);
	var slaveOffset = masterLocation.getCorner(this.stickyCornerMaster);

	slaveOffset.subtractPoint2D(slaveLocation.getCorner(this.stickyCornerSlave)); // calculate amount of offset slaveLocation needs to touch sticky corners with master
	slaveOffset.addPoint2D(this.stickyCornerOffset);	// apply slaveOffset to slaveLocation offset
	slaveLocation.offsetPoint2D(slaveOffset);	// calculate new location

	debugPost("newSlaveLocation: " + slaveLocation.getAsArray() + "\n");

	// correct for title bar hight 
	if ((this.stickyCornerSlave == CORNER.TopLEFT || this.stickyCornerSlave == CORNER.TopRIGHT) &&
		(this.stickyCornerMaster == CORNER.BottomLEFT || this.stickyCornerMaster == CORNER.BottomRIGHT))
	{
		slaveLocation.offsetPoint2D(this.titleBarCorrectionBottom);
	}
	else if ((this.stickyCornerSlave == CORNER.BottomLEFT || this.stickyCornerSlave == CORNER.BottomRIGHT) &&
			(this.stickyCornerMaster == CORNER.TopLEFT || this.stickyCornerMaster == CORNER.TopRIGHT))
	{
		slaveLocation.offsetPoint2D(this.titleBarCorrectionTop);
	}

	// set location of the subpatcher
	this.setLocation(slaveLocation);
}

///// public functions
function setIsStickyForSlaveSubPatcherWithVarname(slavePatcherVarname, isSticky) 
{
	isSticky = !!isSticky;
	post("isSticky: " + isSticky + "\n");
	for (index in slavePatchers) 
	{
		if (slavePatchers[index].object !== null && slavePatchers[index].object.varname === slavePatcherVarname)
		{
			slavePatchers[index].setIsSticky(isSticky);
			return;
		}
	}
	post("No SlaveSubPatcher with varname: " + slavePatcherVarname + " was found.\n")
}

function setStickyCornerSlaveForSlaveSubPatcherWithVarname(slavePatcherVarname, corner) 
{
	for (index in slavePatchers) 
	{
		if (slavePatchers[index].object !== null && slavePatchers[index].object.varname === slavePatcherVarname)
		{
			slavePatchers[index].stickyCornerSlave = CORNER.getByName(corner);
			return;
		}
	}
	post("No SlaveSubPatcher with varname: " + slavePatcherVarname + " was found.\n")
}

function setStickyCornerMasterForSlaveSubPatcherWithVarname(slavePatcherVarname, corner) 
{
	for (index in slavePatchers) 
	{
		if (slavePatchers[index].object !== null && slavePatchers[index].object.varname === slavePatcherVarname)
		{
			slavePatchers[index].stickyCornerMaster = CORNER.getByName(corner);
			return;
		}
	}
	post("No SlaveSubPatcher with varname: " + slavePatcherVarname + " was found.\n")
}

function setStickyCornerOffsetForSlaveSubPatcherWithVarname(slavePatcherVarname, x, y) 
{
	if (arguments.length > 2) {
		for (index in slavePatchers) 
		{
			if (slavePatchers[index].object !== null && slavePatchers[index].object.varname === slavePatcherVarname)
			{
				slavePatchers[index].stickyCornerOffset.setFromArray([x, y]);
				return;
			}
		}
		post("No SlaveSubPatcher with varname: " + slavePatcherVarname + " was found.\n");
	}
	else {
		error("setStickyCornerOffsetForSlaveSubPatcherWithVarname: need to provide 3 arguments: slavePatcherVarname, x, y\n");
	}
}

function addSlaveSubPatcherByVarname(varname)
{
	var newSlaveMaxObject = this.patcher.getnamed(varname);
	if (newSlaveMaxObject !== null && newSlaveMaxObject.valid) 
	{
		debugPost("Found max object with varname: " + newSlaveMaxObject.varname + ", in patcher: " + this.patcher.name  + "\n");
		if (newSlaveMaxObject.subpatcher() !== null) 
		{
			var newSlavePatcher = new SlavePatcher(this.patcher, newSlaveMaxObject.subpatcher());
			slavePatchers.push(newSlavePatcher);
			debugPost("Added new slave subpatcher named: " + newSlavePatcher.name + "\n");
		}

		else
		{
			error("Failed to add new slave subpatcher: object is not a subpatcher!\n");
		}		
	}
	else {
		error("Couldn't find object with varname: " + varname + " in patcher: " + this.patcher.name + "\n");
	}
}

// function setKeepInFrontForSlaveSubPatcherWithVarname(slavePatcherVarname, keepInFront) 
// {
// 	if (arguments.length > 1) {
// 		for (index in slavePatchers) 
// 		{
// 			if (slavePatchers[index].object !== null && slavePatchers[index].object.varname === slavePatcherVarname)
// 			{
// 				slavePatchers[index].keepInFront = keepInFront;
// 				return;
// 			}
// 		}
// 		post("No SlaveSubPatcher with varname: " + slavePatcherVarname + " was found.\n");
// 	}
// 	else {
// 		error("setKeepInFrontForSlaveSubPatcherWithVarname: need to provide 2 arguments: slavePatcherVarname, keepInFront\n");
// 	}
// }

///// test functions
function testLocation() 
{
	var location = new Location([0, 10, 100, 20]);
	post("location: " + location.getAsArray() + "\n");
	var newOffsetPoint = new Point2D([10, 20]);
	location.offsetPoint2D(newOffsetPoint);
	post("location: " + location.getAsArray() + "\n");

	post("CORNER.TopLEFT" + CORNER.TopLEFT + "\n");
	post("CORNER.TopLEFT == 0: " + (CORNER.TopLEFT == 0) + "\n");

	post("location.getCorner(CORNER.TopLEFT): " + location.getCorner(CORNER.TopLEFT).getAsArray() + "\n");
	post("location.getCorner(CORNER.TopRIGHT): " + location.getCorner(CORNER.TopRIGHT).getAsArray() + "\n");
	post("location.getCorner(CORNER.BottomRIGHT): " + location.getCorner(CORNER.BottomRIGHT).getAsArray() + "\n");
	post("location.getCorner(CORNER.BottomLEFT): " + location.getCorner(CORNER.BottomLEFT).getAsArray() + "\n");

	post("location.getSize: " + location.getSize().getAsArray() + "\n");	
}


// enable/disable debugging
function debug(debug) 
{
	DEBUG = debug;
}

///// private functions
function debugPost() 
{
	var args = Array.prototype.slice.call(arguments, 0);
	if (DEBUG) post(args);
}
// make debugPost private
debugPost.local = 1;

function init()
{
	addSlaveSubPatcherByVarname(arguments[0]);
	setStickyCornerSlaveForSlaveSubPatcherWithVarname(arguments[0], TopRIGHT); 
	setStickyCornerMasterForSlaveSubPatcherWithVarname(arguments[0], TopLEFT); 
	setIsStickyForSlaveSubPatcherWithVarname(arguments[0], 1);
	setStickyCornerOffsetForSlaveSubPatcherWithVarname(arguments[0], 0);
}	