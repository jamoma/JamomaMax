/*	@author Adrian Gierakowski */

var DEBUG = 0;	// set to 1 to enable posting debugging messages to max window

inlets = 1;
outlets = 1;
autowatch = 1;

// storage
var maxObjects = []
var connections = []

///// OBJECT DEFINITIONS
/*
	MaxObject object: is used to bind on a named object (with scripting name) in a specific patcher
	constructor arguments: 
		patcher - object representing patcher in which the max object we want to bind on resides
		varname - the scripting name of a max object we want to bind on

	the constructor itself doesn't bind on the max object - you need to call the rebind() method of MaxObject instance before doing any scripting on the object.
	The reason is that the actual max object in a patch migth be deleted manually or it's varnmae might change a t any time
	*/

function MaxObject(patcher, varname) {
	this._patcher = patcher;
	this.name = varname;
	this.object = this._patcher.getnamed(this.name);
	this.objectArguments = [];
}
// make private
MaxObject.local = 1;

// recreates named object in a patcher with default parameters but preserving: class, position and varname. 
// Additional arguments for object creation are read from objectArguments property
MaxObject.prototype.recreate = function() {
	if (this.rebind()) {
		var objectPosition = this.object.rect;
		var objectClass = this.object.maxclass;
		this._patcher.remove(this.object);
		debugPost(objectPosition + "\n");

		var newdefaultArguments = [objectPosition[0], objectPosition[1], objectClass];

		if (this.objectArguments.length > 0) {
			newdefaultArguments = newdefaultArguments.concat(this.objectArguments);		
		}
		debugPost("newdefaultArguments: " + newdefaultArguments + "\n");
		// this.object = this._patcher.newdefault(objectPosition[0], objectPosition[1], objectClass);
		this.object = this._patcher.newdefault.apply(this._patcher, newdefaultArguments);
		this.object.varname = this.name;
	}
}

// binds (or rebinds) to object with scripting name: this.name in a patcher: this._patcher
// returns false if it failed to bind. This should be called before any scripting on the max object is performed to make sure we have a valid object
MaxObject.prototype.rebind = function() {
	if (this.object === null || !this.object.valid || this.name !== this.object.varname) {
		this.object = this._patcher.getnamed(this.name);
		if (this.object !== null && this.object.valid) {
			debugPost("Succesfully bound MaxObject to object named: " + this.object.varname + " in patcher: " + this._patcher.name + "\n");
			return true;
		}
		else {
			error("Failed to bind to object named: " + this.name + " in patcher: " + this._patcher.name + "\n");
			return false;
		}
	}
	else {
		debugPost("MaxObject is already bound to valid object named: " + this.name + " in patcher: " + this._patcher.name + "\n");
		return true;
	}
}

/*	Connection object
	For storring and creating a patchcord connection between two max objects
	*/

function Connection(patcher, nameFrom, indexFrom, nameTo, indexTo) {
	this.nameFrom = nameFrom;
	this.indexFrom = indexFrom;
	this.nameTo = nameTo;
	this.indexTo = indexTo;
	this._patcher = patcher;
}
// make private
Connection.local = 1;

// creates a connection between two named objects 
Connection.prototype.create = function() {
	var objectFrom = this._patcher.getnamed(this.nameFrom);
	// first check if object exists, otherwise return
	if (objectFrom === null || !objectFrom.valid) {
		error("Connection FROM object named: " + this.nameFrom + " in patcher: " + this._patcher.name + " not possible. Object doesn't exist!\n");
		return;
	}
	// first check if object exists, otherwise return
	var objectTo = this._patcher.getnamed(this.nameTo);
		if (objectTo === null || !objectTo.valid) {
		error("Connection TO object named: " + this.nameTo + " in patcher: " + this._patcher.name + " not possible. Object doesn't exist!\n");
		return;
	}

	// at this point we know that object we are trying to connect exist
	debugPost("making connection:", objectFrom.varname, this.indexFrom, objectTo.varname, this.indexTo + "\n");
	// script the connection (if it already exists, nothing happens)
	this._patcher.connect(objectFrom, this.indexFrom, objectTo, this.indexTo);
}

///// public functions
function addObject(objectName) {
	for (var index in maxObjects) {
		if (maxObjects[index].name === objectName) {
			error("object with name: " +  objectName + " has already been added\n");
			return;	
		}
	}
	maxObjects.push(new MaxObject(this.patcher, objectName));
}

function setObjectArguments() {
	if (arguments.length >= 1) {
		var objectArguments = []
			// var args = Array.prototype.slice.call(arguments, 0);
		var objectName = arguments[0];
		var maxObject = null;
		debugPost("objectName " + objectName + "\n");

		for (var index in maxObjects) {
			if (maxObjects[index].name === objectName) {
				maxObject = maxObjects[index];
				debugPost("found object: " + maxObject.name + "\n");
			}
		}

		if (maxObject !== null) {
			maxObject.objectArguments = [];
			for (var index = 1; index < arguments.length; index++) {
				debugPost("adding argument: " + arguments[index] + "\n");
				maxObject.objectArguments.push(arguments[index]);
			}
		}
	}
}

function recreateObjects() {
	for (index in maxObjects) {
		maxObjects[index].recreate();
	}
}

function createConnections() {
	for (index in connections) {
		connections[index].create();
	}
}

function addConnection(nameFrom, indexFrom, nameTo, indexTo) {
	connections.push(new Connection(this.patcher, nameFrom, indexFrom, nameTo, indexTo));
}

function clearObjects() {
	maxObjects = []
}

function clearConnections() {
	connections = [];
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
