{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 7,
			"minor" : 1,
			"revision" : 0,
			"architecture" : "x64",
			"modernui" : 1
		}
,
		"rect" : [ 100.0, 100.0, 802.0, 721.0 ],
		"bglocked" : 0,
		"openinpresentation" : 0,
		"default_fontsize" : 10.0,
		"default_fontface" : 0,
		"default_fontname" : "Verdana",
		"gridonopen" : 1,
		"gridsize" : [ 5.0, 5.0 ],
		"gridsnaponopen" : 1,
		"objectsnaponopen" : 1,
		"statusbarvisible" : 2,
		"toolbarvisible" : 1,
		"lefttoolbarpinned" : 0,
		"toptoolbarpinned" : 0,
		"righttoolbarpinned" : 0,
		"bottomtoolbarpinned" : 0,
		"toolbars_unpinned_last_save" : 0,
		"tallnewobj" : 0,
		"boxanimatetime" : 200,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"description" : "",
		"digest" : "",
		"tags" : "",
		"style" : "",
		"subpatcher_template" : "",
		"boxes" : [ 			{
				"box" : 				{
					"fontface" : 1,
					"id" : "obj-7",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 303.0, 584.0, 304.0, 31.0 ],
					"style" : "",
					"text" : "motiongram% model requires third party external xray.jit.mean currently only available as 32 bits.",
					"textcolor" : [ 0.784314, 0.145098, 0.023529, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-10",
					"linecount" : 5,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 349.0, 424.0, 320.0, 67.0 ],
					"style" : "",
					"text" : "A similarity matrix is a matrix of scores which express the similarity between two data points. In this implementation the matrix is shifted 90 degrees and plotted on top of itself. The result is an image that may reveal interesting structural elements in the material. "
				}

			}
, 			{
				"box" : 				{
					"args" : [ "@name", "similarity%", "@description", "Create a similarity matrix from a video stream" ],
					"bgmode" : 1,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-9",
					"lockeddragscroll" : 0,
					"maxclass" : "bpatcher",
					"name" : "j.maxhelpui.maxpat",
					"numinlets" : 1,
					"numoutlets" : 0,
					"offset" : [ 0.0, 0.0 ],
					"patching_rect" : [ 0.0, 0.0, 802.0, 70.0 ],
					"prototypename" : "bphelp",
					"varname" : "maxhelpui",
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-1",
					"maxclass" : "jit.pwindow",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 73.0, 168.0, 240.0, 180.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-2",
					"maxclass" : "jit.pwindow",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 349.0, 168.0, 320.0, 240.0 ],
					"presentation_rect" : [ 0.0, 0.0, 320.0, 240.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-3",
					"lockeddragscroll" : 1,
					"maxclass" : "bpatcher",
					"name" : "similarity%.module.maxpat",
					"numinlets" : 1,
					"numoutlets" : 2,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 350.0, 87.0, 300.0, 70.0 ],
					"presentation_rect" : [ 0.0, 0.0, 300.0, 70.0 ],
					"varname" : "/similarity%",
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-4",
					"lockeddragscroll" : 1,
					"maxclass" : "bpatcher",
					"name" : "input%.module.maxpat",
					"numinlets" : 1,
					"numoutlets" : 2,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 43.0, 87.0, 300.0, 70.0 ],
					"presentation_rect" : [ 0.0, 0.0, 300.0, 70.0 ],
					"varname" : "/input%",
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-5",
					"lockeddragscroll" : 1,
					"maxclass" : "bpatcher",
					"name" : "motiongram%.module.maxpat",
					"numinlets" : 1,
					"numoutlets" : 3,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 43.0, 440.0, 300.0, 70.0 ],
					"presentation_rect" : [ 0.0, 0.0, 300.0, 70.0 ],
					"varname" : "/motiongram%[1]",
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-6",
					"maxclass" : "jit.pwindow",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 43.0, 524.0, 240.0, 180.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-13",
					"lockeddragscroll" : 1,
					"maxclass" : "bpatcher",
					"name" : "motion2%.module.maxpat",
					"numinlets" : 1,
					"numoutlets" : 2,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 43.0, 354.0, 300.0, 70.0 ],
					"presentation_rect" : [ 0.0, 0.0, 300.0, 70.0 ],
					"varname" : "/motion%",
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-14",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 662.0, 111.0, 136.0, 31.0 ],
					"style" : "",
					"text" : "The algorithm can only be changed in mode 1"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-13", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-3", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-4", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-4", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 52.5, 518.0, 29.0, 518.0, 29.0, 76.0, 359.5, 76.0 ],
					"source" : [ "obj-5", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-5", 0 ]
				}

			}
 ],
		"dependency_cache" : [ 			{
				"name" : "motion2%.module.maxpat",
				"bootpath" : "~/Documents/GITs/JamomaMax/Jamoma/patchers/models/video/fx/motion2%",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "motion2%.model.maxpat",
				"bootpath" : "~/Documents/GITs/JamomaMax/Jamoma/patchers/models/video/fx/motion2%",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.motion%.maxpat",
				"bootpath" : "~/Documents/GITs/JamomaMax/Jamoma/patchers/components/video/motion%",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.noiseremoval%.maxpat",
				"bootpath" : "~/Documents/GITs/JamomaMax/Jamoma/patchers/components/video/noiseremoval%",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.rgb2luma%.maxpat",
				"bootpath" : "~/Documents/GITs/JamomaMax/Jamoma/patchers/components/video/rgb2luma%",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.sum%.maxpat",
				"bootpath" : "~/Documents/GITs/JamomaMax/Jamoma/patchers/components/video/sum%",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "motion2%.view.maxpat",
				"bootpath" : "~/Documents/GITs/JamomaMax/Jamoma/patchers/models/video/fx/motion2%",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "motiongram%.module.maxpat",
				"bootpath" : "~/Documents/GITs/JamomaMax/Jamoma/patchers/models/video/fx/motiongram%",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "motiongram%.model.maxpat",
				"bootpath" : "~/Documents/GITs/JamomaMax/Jamoma/patchers/models/video/fx/motiongram%",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.mean%.maxpat",
				"bootpath" : "~/Documents/GITs/JamomaMax/Jamoma/patchers/components/video/mean%",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "thru.maxpat",
				"bootpath" : "C74:/patchers/m4l/Pluggo for Live resources/patches",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.float2char%.maxpat",
				"bootpath" : "~/Documents/GITs/JamomaMax/Jamoma/patchers/components/video/float2char%",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "motiongram%.view.maxpat",
				"bootpath" : "~/Documents/GITs/JamomaMax/Jamoma/patchers/models/video/fx/motiongram%",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.list2parameter.maxpat",
				"bootpath" : "~/Documents/GITs/JamomaMax/Jamoma/patchers/components/data/list2parameter",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "input%.module.maxpat",
				"bootpath" : "~/Documents/GITs/JamomaMax/Jamoma/patchers/models/video/sources/input%",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "input%.model.maxpat",
				"bootpath" : "~/Documents/GITs/JamomaMax/Jamoma/patchers/models/video/sources/input%",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "noise%.model.maxpat",
				"bootpath" : "~/Documents/GITs/JamomaMax/Jamoma/patchers/models/video/sources/noise%",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "movie%.model.maxpat",
				"bootpath" : "~/Documents/GITs/JamomaMax/Jamoma/patchers/models/video/sources/movie%",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "grab%.model.maxpat",
				"bootpath" : "~/Documents/GITs/JamomaMax/Jamoma/patchers/models/video/sources/grab%",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "input%.view.maxpat",
				"bootpath" : "~/Documents/GITs/JamomaMax/Jamoma/patchers/models/video/sources/input%",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "input%.ui.maxpat",
				"bootpath" : "~/Documents/GITs/JamomaMax/Jamoma/patchers/models/video/sources/input%",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "similarity%.module.maxpat",
				"bootpath" : "~/Documents/GITs/JamomaMax/Jamoma/patchers/models/video/fx/similarity%",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "similarity%.model.maxpat",
				"bootpath" : "~/Documents/GITs/JamomaMax/Jamoma/patchers/models/video/fx/similarity%",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "similarity%.view.maxpat",
				"bootpath" : "~/Documents/GITs/JamomaMax/Jamoma/patchers/models/video/fx/similarity%",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.maxhelpui.maxpat",
				"bootpath" : "~/Documents/GITs/JamomaMax/Jamoma/patchers/components/data/maxhelpui",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.maxhelpuiButton.png",
				"bootpath" : "~/Documents/GITs/JamomaMax/Jamoma/patchers/components/data/maxhelpui",
				"type" : "PNG ",
				"implicit" : 1
			}
, 			{
				"name" : "j.parameter.mxo",
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
				"name" : "j.return.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.model.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.ui.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.view.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.remote.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.message.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.receive.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.pass.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.send.mxo",
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
				"name" : "j.savebang.mxo",
				"type" : "iLaX"
			}
 ],
		"autosave" : 0
	}

}
