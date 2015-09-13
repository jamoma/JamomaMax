{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 6,
			"minor" : 1,
			"revision" : 10,
			"architecture" : "x86"
		}
,
		"rect" : [ 100.0, 100.0, 536.0, 413.0 ],
		"bglocked" : 0,
		"openinpresentation" : 0,
		"default_fontsize" : 10.0,
		"default_fontface" : 0,
		"default_fontname" : "Verdana",
		"gridonopen" : 0,
		"gridsize" : [ 5.0, 5.0 ],
		"gridsnaponopen" : 0,
		"statusbarvisible" : 2,
		"toolbarvisible" : 1,
		"boxanimatetime" : 200,
		"imprint" : 0,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"description" : "",
		"digest" : "",
		"tags" : "",
		"boxes" : [ 			{
				"box" : 				{
					"args" : [ "@name", "j.motion%", "@description", "Display motion image based on simple frame-differencing" ],
					"bgmode" : 1,
					"id" : "obj-19",
					"maxclass" : "bpatcher",
					"name" : "j.maxhelpui.maxpat",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 0.0, 0.0, 644.0, 70.0 ],
					"varname" : "maxhelpui"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-1",
					"maxclass" : "jit.pwindow",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 23.0, 236.0, 160.0, 120.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-2",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "float", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 478.0, 181.0, 39.0, 19.0 ],
					"triscale" : 0.9
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-7",
					"maxclass" : "jit.fpsgui",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 193.0, 366.0, 60.0, 35.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"frgb" : 0.0,
					"id" : "obj-8",
					"linecount" : 4,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 225.0, 96.0, 298.0, 55.0 ],
					"text" : "This component just subtracts subsequent frames in the video, which will result in what is often called a \"motion image\". Refer to the module (motion%.module) with more controls of the motion image."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-9",
					"maxclass" : "jit.pwindow",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 363.0, 236.0, 160.0, 120.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-10",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "jit_matrix", "" ],
					"patching_rect" : [ 363.0, 206.0, 134.0, 19.0 ],
					"text" : "jit.op @op > @val 0.1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-11",
					"maxclass" : "jit.pwindow",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 193.0, 236.0, 160.0, 120.0 ]
				}

			}
, 			{
				"box" : 				{
					"annotation" : "Read QT movie film.",
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-12",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 23.0, 86.0, 123.0, 19.0 ],
					"text" : "movie%.model",
					"varname" : "/input%"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.619608, 0.0, 0.360784, 0.698039 ],
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-13",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "jit_matrix" ],
					"patching_rect" : [ 193.0, 196.0, 92.0, 19.0 ],
					"text" : "j.motion%"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"frgb" : 0.0,
					"id" : "obj-17",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 413.0, 181.0, 77.0, 19.0 ],
					"text" : "threshold"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-9", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-10", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-11", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-12", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 32.5, 175.5, 202.5, 175.5 ],
					"source" : [ "obj-12", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 202.5, 225.0, 342.0, 225.0, 342.0, 197.0, 372.5, 197.0 ],
					"source" : [ "obj-13", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-11", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-13", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-2", 0 ]
				}

			}
 ],
		"dependency_cache" : [ 			{
				"name" : "j.motion%.maxpat",
				"bootpath" : "/Users/reno/JamomaMax/Jamoma/patchers/components/video/motion%",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "movie%.model.maxpat",
				"bootpath" : "/Users/reno/JamomaMax/Jamoma/patchers/modules/video/sources/movie%",
				"patcherrelativepath" : "../../../modules/video/sources/movie%",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "max7specific.maxpat",
				"bootpath" : "/Users/reno/JamomaMax/Jamoma/patchers/components",
				"patcherrelativepath" : "../..",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.maxhelpui.maxpat",
				"bootpath" : "/Users/reno/JamomaMax/Jamoma/patchers/components/data/maxhelpui",
				"patcherrelativepath" : "../../data/maxhelpui",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.maxhelpuiButton.png",
				"bootpath" : "/Users/reno/JamomaMax/Jamoma/patchers/components/data/maxhelpui",
				"patcherrelativepath" : "../../data/maxhelpui",
				"type" : "PNG ",
				"implicit" : 1
			}
, 			{
				"name" : "j.maxhelpuiResize.js",
				"bootpath" : "/Users/reno/JamomaMax/Jamoma/patchers/components/data/maxhelpui",
				"patcherrelativepath" : "../../data/maxhelpui",
				"type" : "TEXT",
				"implicit" : 1
			}
, 			{
				"name" : "j.jamomaPath.maxpat",
				"bootpath" : "/Users/reno/JamomaMax/Jamoma/patchers/components/data/jamomaPath",
				"patcherrelativepath" : "../../data/jamomaPath",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.model.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.in.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.out.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.parameter.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.message.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.send.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.receive.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.namespace.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.oscroute.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.init.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.return.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.savebang.mxo",
				"type" : "iLaX"
			}
 ]
	}

}
