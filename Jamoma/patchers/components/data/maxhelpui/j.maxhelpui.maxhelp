{
	"patcher" : 	{
		"fileversion" : 1,
		"rect" : [ 223.0, 265.0, 611.0, 369.0 ],
		"bglocked" : 0,
		"defrect" : [ 223.0, 265.0, 611.0, 369.0 ],
		"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
		"openinpresentation" : 0,
		"default_fontsize" : 10.970939,
		"default_fontface" : 0,
		"default_fontname" : "Verdana",
		"gridonopen" : 0,
		"gridsize" : [ 5.0, 5.0 ],
		"gridsnaponopen" : 0,
		"toolbarvisible" : 1,
		"boxanimatetime" : 200,
		"imprint" : 0,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"boxes" : [ 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-2",
					"linecount" : 3,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 44.0, 116.0, 540.0, 43.0 ],
					"text" : "j.maxhelpui is a simple utility to be used as a bpatcher, displaying the name and description of the object presented in the help patch. It takes one attributes (@description) defining the description of the object. The name (here j.ui) will be set automatically according to the name of the maxhelp file."
				}

			}
, 			{
				"box" : 				{
					"args" : [ "@description", "A utility to display object name and description in Jamoma help patches" ],
					"bgmode" : 1,
					"id" : "obj-21",
					"maxclass" : "bpatcher",
					"name" : "j.maxhelpui.maxpat",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 0.0, 0.0, 611.0, 70.0 ]
				}

			}
 ],
		"lines" : [  ]
	}

}
