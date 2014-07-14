{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 6,
			"minor" : 1,
			"revision" : 7,
			"architecture" : "x86"
		}
,
		"rect" : [ 25.0, 69.0, 681.0, 440.0 ],
		"bglocked" : 0,
		"openinpresentation" : 0,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 0,
		"gridsize" : [ 15.0, 15.0 ],
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
					"id" : "obj-23",
					"lockeddragscroll" : 1,
					"maxclass" : "bpatcher",
					"name" : "brcosa%.module.maxpat",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 10.0, 109.0, 300.0, 70.0 ],
					"presentation_rect" : [ 30.0, 30.0, 300.0, 70.0 ],
					"varname" : "/brcosa%"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-19",
					"maxclass" : "jit.pwindow",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 10.0, 202.0, 300.0, 220.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-20",
					"lockeddragscroll" : 1,
					"maxclass" : "bpatcher",
					"name" : "input%.module.maxpat",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 10.0, 14.0, 300.0, 70.0 ],
					"presentation_rect" : [ 15.0, 15.0, 300.0, 70.0 ]
				}

			}
, 			{
				"box" : 				{
					"annotation" : "An oscilloscope emulator for viewing waverforms or analyzing phase relationships.",
					"args" : [ "preview%_help" ],
					"id" : "obj-1",
					"maxclass" : "bpatcher",
					"name" : "preview%.module.maxpat",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 362.0, 14.0, 300.0, 140.0 ],
					"presentation_rect" : [ 0.0, 0.0, 300.0, 140.0 ]
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-20", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-19", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-23", 0 ]
				}

			}
 ],
		"dependency_cache" : [ 			{
				"name" : "preview%.module.maxpat",
				"bootpath" : "/Users/mathieuchamagne/Documents/GITHUB/Jamoma/Implementations/Max/Jamoma/patchers/modules/video/output/preview%",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.list2parameter.maxpat",
				"bootpath" : "/Users/mathieuchamagne/Documents/GITHUB/Jamoma/Implementations/Max/Jamoma/patchers/components/data/list2parameter",
				"patcherrelativepath" : "../../../../components/data/list2parameter",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "input%.module.maxpat",
				"bootpath" : "/Users/mathieuchamagne/Documents/GITHUB/Jamoma/Implementations/Max/Jamoma/patchers/modules/video/sources/input%",
				"patcherrelativepath" : "../../sources/input%",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "input%.model.maxpat",
				"bootpath" : "/Users/mathieuchamagne/Documents/GITHUB/Jamoma/Implementations/Max/Jamoma/patchers/modules/video/sources/input%",
				"patcherrelativepath" : "../../sources/input%",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "noise%.model.maxpat",
				"bootpath" : "/Users/mathieuchamagne/Documents/GITHUB/Jamoma/Implementations/Max/Jamoma/patchers/modules/video/sources/noise%",
				"patcherrelativepath" : "../../sources/noise%",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "movie%.model.maxpat",
				"bootpath" : "/Users/mathieuchamagne/Documents/GITHUB/Jamoma/Implementations/Max/Jamoma/patchers/modules/video/sources/movie%",
				"patcherrelativepath" : "../../sources/movie%",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "grab%.model.maxpat",
				"bootpath" : "/Users/mathieuchamagne/Documents/GITHUB/Jamoma/Implementations/Max/Jamoma/patchers/modules/video/sources/grab%",
				"patcherrelativepath" : "../../sources/grab%",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "input%.view.maxpat",
				"bootpath" : "/Users/mathieuchamagne/Documents/GITHUB/Jamoma/Implementations/Max/Jamoma/patchers/modules/video/sources/input%",
				"patcherrelativepath" : "../../sources/input%",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "input%.ui.maxpat",
				"bootpath" : "/Users/mathieuchamagne/Documents/GITHUB/Jamoma/Implementations/Max/Jamoma/patchers/modules/video/sources/input%",
				"patcherrelativepath" : "../../sources/input%",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "brcosa%.module.maxpat",
				"bootpath" : "/Users/mathieuchamagne/Documents/GITHUB/Jamoma/Implementations/Max/Jamoma/patchers/modules/video/fx/brcosa%",
				"patcherrelativepath" : "../../fx/brcosa%",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "brcosa%.model.maxpat",
				"bootpath" : "/Users/mathieuchamagne/Documents/GITHUB/Jamoma/Implementations/Max/Jamoma/patchers/modules/video/fx/brcosa%",
				"patcherrelativepath" : "../../fx/brcosa%",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "brcosa%.view.maxpat",
				"bootpath" : "/Users/mathieuchamagne/Documents/GITHUB/Jamoma/Implementations/Max/Jamoma/patchers/modules/video/fx/brcosa%",
				"patcherrelativepath" : "../../fx/brcosa%",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.ui.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.remote.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.namespace.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.receive.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.model.mxo",
				"type" : "iLaX"
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
				"name" : "j.message.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.return.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.send.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.init.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.view.mxo",
				"type" : "iLaX"
			}
 ]
	}

}
