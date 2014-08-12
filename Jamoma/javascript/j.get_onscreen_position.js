// autowatch = 1;
outlets = 1;

function bang() {
    var prev = this;
    var owner = this.patcher.box;
	var offset = new Array (0, 0);
	
    while (owner) {
        prev = owner;
		offset = [offset[0] + owner.rect[0], offset[1] + owner.rect[1]];
//DEBUG		outlet (0, offset);
        owner = owner.patcher.box;
    }
    if (prev) {
		outlet(0, offset[0] + prev.patcher.wind.location[0], offset[1] + prev.patcher.wind.location[1])
//DEBUG		outlet(0, "window pos = " + prev.patcher.wind.location.slice(0,2));
		
    }
}

