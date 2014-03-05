{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 6,
			"minor" : 1,
			"revision" : 6,
			"architecture" : "x86"
		}
,
		"rect" : [ 538.0, 51.0, 631.0, 657.0 ],
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
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frgb" : 0.0,
					"id" : "obj-13",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 35.0, 610.0, 348.0, 33.0 ],
					"text" : "algorithm after Andrew Benson : http://cycling74.com/forums/topic.php?id=24293"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-3",
					"maxclass" : "bpatcher",
					"name" : "brcosa%.module.maxpat",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 31.0, 188.0, 300.0, 70.0 ],
					"presentation_rect" : [ 0.0, 0.0, 300.0, 70.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-14",
					"maxclass" : "jit.fpsgui",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 356.0, 360.0, 60.0, 35.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-19",
					"maxclass" : "jit.pwindow",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 31.0, 360.0, 320.0, 240.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-1",
					"maxclass" : "bpatcher",
					"name" : "input%.module.maxpat",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 31.0, 108.0, 300.0, 70.0 ],
					"presentation_rect" : [ 0.0, 0.0, 300.0, 70.0 ]
				}

			}
, 			{
				"box" : 				{
					"args" : [ "@name", "television%", "@description", "'Bad TV' effect" ],
					"bgmode" : 1,
					"id" : "obj-21",
					"maxclass" : "bpatcher",
					"name" : "j.maxhelpui.maxpat",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 0.0, 0.0, 631.0, 70.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-8",
					"lockeddragscroll" : 1,
					"maxclass" : "bpatcher",
					"name" : "television%.module.maxpat",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "jit_matrix" ],
					"patching_rect" : [ 31.0, 269.0, 300.0, 70.0 ],
					"presentation_rect" : [ 45.0, 45.0, 300.0, 70.0 ]
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-1", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-8", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-3", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-14", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 40.5, 349.0, 365.5, 349.0 ],
					"source" : [ "obj-8", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-19", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-8", 0 ]
				}

			}
 ],
		"dependency_cache" : [ 			{
				"name" : "television%.module.maxpat",
				"bootpath" : "/Users/hems/git/jamoma/JamomaMax/Jamoma/patchers/modules/video/television%",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "television%.model.maxpat",
				"bootpath" : "/Users/hems/git/jamoma/JamomaMax/Jamoma/patchers/modules/video/television%",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.thru.maxpat",
				"bootpath" : "/Applications/Max 6.1/packages/Jamoma/patchers/components/thru",
				"patcherrelativepath" : "../../../../../../../../../../Applications/Max 6.1/packages/Jamoma/patchers/components/thru",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "television%.view.maxpat",
				"bootpath" : "/Users/hems/git/jamoma/JamomaMax/Jamoma/patchers/modules/video/television%",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.maxhelpui.maxpat",
				"bootpath" : "/Applications/Max 6.1/packages/Jamoma/patchers/components/maxhelpui",
				"patcherrelativepath" : "../../../../../../../../../../Applications/Max 6.1/packages/Jamoma/patchers/components/maxhelpui",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.maxhelpuiButton.png",
				"bootpath" : "/Applications/Max 6.1/packages/Jamoma/patchers/components/maxhelpui",
				"patcherrelativepath" : "../../../../../../../../../../Applications/Max 6.1/packages/Jamoma/patchers/components/maxhelpui",
				"type" : "PNG ",
				"implicit" : 1
			}
, 			{
				"name" : "j.maxhelpuiResize.js",
				"bootpath" : "/Applications/Max 6.1/packages/Jamoma/patchers/components/maxhelpui",
				"patcherrelativepath" : "../../../../../../../../../../Applications/Max 6.1/packages/Jamoma/patchers/components/maxhelpui",
				"type" : "TEXT",
				"implicit" : 1
			}
, 			{
				"name" : "j.jamomaPath.maxpat",
				"bootpath" : "/Applications/Max 6.1/packages/Jamoma/patchers/components/jamomaPath",
				"patcherrelativepath" : "../../../../../../../../../../Applications/Max 6.1/packages/Jamoma/patchers/components/jamomaPath",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "input%.module.maxpat",
				"bootpath" : "/Applications/Max 6.1/packages/Jamoma/patchers/modules/video/input%",
				"patcherrelativepath" : "../../../../../../../../../../Applications/Max 6.1/packages/Jamoma/patchers/modules/video/input%",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "input%.model.maxpat",
				"bootpath" : "/Applications/Max 6.1/packages/Jamoma/patchers/modules/video/input%",
				"patcherrelativepath" : "../../../../../../../../../../Applications/Max 6.1/packages/Jamoma/patchers/modules/video/input%",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "thru.maxpat",
				"bootpath" : "/Applications/Max 6.1/patches/m4l-patches/Pluggo for Live resources/patches",
				"patcherrelativepath" : "../../../../../../../../../../Applications/Max 6.1/patches/m4l-patches/Pluggo for Live resources/patches",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "input%.view.maxpat",
				"bootpath" : "/Applications/Max 6.1/packages/Jamoma/patchers/modules/video/input%",
				"patcherrelativepath" : "../../../../../../../../../../Applications/Max 6.1/packages/Jamoma/patchers/modules/video/input%",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "input%.ui.maxpat",
				"bootpath" : "/Applications/Max 6.1/packages/Jamoma/patchers/modules/video/input%",
				"patcherrelativepath" : "../../../../../../../../../../Applications/Max 6.1/packages/Jamoma/patchers/modules/video/input%",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "brcosa%.module.maxpat",
				"bootpath" : "/Applications/Max 6.1/packages/Jamoma/patchers/modules/video/brcosa%",
				"patcherrelativepath" : "../../../../../../../../../../Applications/Max 6.1/packages/Jamoma/patchers/modules/video/brcosa%",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "brcosa%.model.maxpat",
				"bootpath" : "/Applications/Max 6.1/packages/Jamoma/patchers/modules/video/brcosa%",
				"patcherrelativepath" : "../../../../../../../../../../Applications/Max 6.1/packages/Jamoma/patchers/modules/video/brcosa%",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "brcosa%.view.maxpat",
				"bootpath" : "/Applications/Max 6.1/packages/Jamoma/patchers/modules/video/brcosa%",
				"patcherrelativepath" : "../../../../../../../../../../Applications/Max 6.1/packages/Jamoma/patchers/modules/video/brcosa%",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.pwindow.mouse.maxpat",
				"bootpath" : "/Applications/Max 6.1/packages/Jamoma/patchers/components/pwindow.mouse",
				"patcherrelativepath" : "../../../../../../../../../../Applications/Max 6.1/packages/Jamoma/patchers/components/pwindow.mouse",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.in.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.parameter.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.out.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.oscroute.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.dataspace.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.pass.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.ui.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.model.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.remote.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.receive.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.send.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.savebang.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.message.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.return.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.view.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.textslider.mxo",
				"type" : "iLaX"
			}
 ]
	}

}
