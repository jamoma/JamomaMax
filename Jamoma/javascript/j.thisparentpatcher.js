//send messages to parent patcher

function anything()
{
    var a = arrayfromargs(messagename,arguments);
	this.patcher.parentpatcher.message(a);
}