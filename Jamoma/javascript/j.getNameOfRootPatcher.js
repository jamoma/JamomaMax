function bang() {
    var prev = this;
    var owner = this.patcher.box;
    while (owner) {
        prev = owner;
        owner = owner.patcher.box;
    }
    if (prev) {
		outlet(0, prev.patcher.name);
    }
}