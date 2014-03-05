
var task = new Task(init, this);
task.schedule(100);


function init()
{
	var a = this.patcher.getnamed("modules_tab");
    if(a==null)
    {
		var name = this.patcher.filepath.split('/').pop().slice(0, -8);
		this.patcher.message("script", "newobject", "newobj", "@text","p modules", "@varname", "modules_tab", "@patching_rect", 10, 85, 50, 20);
		this.patcher.wind.size= [700, 500];
		var basic=this.patcher.getnamed("modules_tab");
		this.patcher.message("script", "newobject", "newobj", "@text","jsui @filename helpname.js @jsarguments " + name + " @patching_rect 10. 10. 305. 55.");
		basic.subpatcher().message("wclose");
		basic.message("showontab", 1);
		basic.message("gridsize", 5., 5.);
		basic.message("default_fontsize", 13);
		basic.message("default_fontname", "Arial");
		basic.message("bgcolor", 1., 1., 1., 1.);
		basic.message("editing_bgcolor", 1., 1., 1., 1.);
		basic.subpatcher().message("script", "newobject", "newobj", "@text","jsui @filename helpdetails.js @jsarguments " + name + " @patching_rect 10. 10. 620. 125.");		
//		basic.subpatcher().message("script", "newobject", "newobj", "@text","jsui @filename j.maxhelpui.maxpat @jsarguments " + name + " @patching_rect 10. 10. 620. 125.");
		basic.subpatcher().message("script", "newobject", "newobj", "@text","jsui @filename helpargs.js @jsarguments " + name + " @patching_rect 185. 285. 295. 70.");
	}
	var b = this.patcher.getnamed("q_tab");
    if (b == null)
       {
               this.patcher.message("script", "newobject", "newobj", "@text","p ?", "@varname", "q_tab", "@patching_rect", 205, 205, 50, 20);
               var q=this.patcher.getnamed("q_tab");
               q.subpatcher().message("wclose");
               q.message("showontab", 1);
       }
}

function resize(x, y)
{
	if(x==null)
	{
		this.patcher.wind.size=[700, 500];
	}
	else
	{
		this.patcher.wind.size= [x, y];
	}
}
