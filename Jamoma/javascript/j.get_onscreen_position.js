// autowatch = 1;
outlets = 1;

function screenposition(myObject) {
    var prev = this;
    var owner = this.patcher.box;
	var containerposition = new Array (0, 0);
	var localposition = [this.patcher.getnamed(myObject).rect[0], this.patcher.getnamed(myObject).rect[1]];
	
    while (owner) {
        prev = owner;
		containerposition = [containerposition[0] + owner.rect[0], containerposition[1] + owner.rect[1]];
//DEBUG	outlet (0, containerposition);
        owner = owner.patcher.box;
    }
    if (prev) {
		outlet(0, localposition[0] + containerposition[0] + prev.patcher.wind.location[0], localposition[1] + containerposition[1] + prev.patcher.wind.location[1]);
		
    }
}

function find(objName){
	outlet(0, "Im at" + this.patcher.getnamed(objName).rect);
	}

