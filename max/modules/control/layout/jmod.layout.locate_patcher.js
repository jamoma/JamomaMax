/*
locate_bpatcher.js
returns names, positions and dimensions of all named patchers in the parent patcher.
*/

// set up inlets/outlets/assist strings
outlets = 2;
setoutletassist(1,"begin (bang)");
setoutletassist(0,"box scripting name (symbol), box rect (list), presentation (0/1)");

function thisparentpatcher()
{
    var a = arrayfromargs(arguments);
	this.patcher.parentpatcher.message(a);
}

function bang()
{
	outlet(1,"bang");
	this.patcher.parentpatcher.apply(iterfun);
}

function iterfun(b)
{
//	if(b.maxclass == "patcher")
//	{
		if(b.varname != "") //filter unamed objects
		{
			outlet(0, b.varname, b.rect);
			// outlet(0, b.varname, b.rect, b.getattr("presentation"));
		}
//	}
return true;
}
iterfun.local=1;

// Pour la compilation automatique
//autowatch = 1;
//post("Compiled...\n");