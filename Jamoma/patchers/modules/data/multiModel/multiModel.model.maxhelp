{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 6,
			"minor" : 1,
			"revision" : 8,
			"architecture" : "x86"
		}
,
		"rect" : [ 25.0, 65.0, 569.0, 496.0 ],
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
					"bubble" : 1,
					"bubblepoint" : 0.19,
					"bubbleside" : 0,
					"fontface" : 2,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frgb" : 0.0,
					"id" : "obj-10",
					"linecount" : 6,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 22.0, 180.0, 151.0, 106.0 ],
					"text" : "because script-created models need to wait to be initialized before being able to receive parameter values from preset...\n:-s"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frgb" : 0.0,
					"id" : "obj-8",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 33.0, 24.0, 291.0, 20.0 ],
					"text" : "this model can instanciate any model multiple times"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-7",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 93.0, 133.0, 126.0, 18.0 ],
					"text" : "preset \"mapper test1\""
				}

			}
, 			{
				"box" : 				{
					"bubble" : 1,
					"bubbleside" : 3,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frgb" : 0.0,
					"id" : "obj-6",
					"linecount" : 3,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 22.0, 116.5, 69.0, 51.0 ],
					"text" : "recall preset twice !!"
				}

			}
, 			{
				"box" : 				{
					"annotation" : "none",
					"id" : "obj-4",
					"maxclass" : "bpatcher",
					"name" : "multiModel.view.maxpat",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 253.0, 67.0, 300.0, 315.0 ],
					"presentation_rect" : [ 0.0, 0.0, 300.0, 315.0 ]
				}

			}
, 			{
				"box" : 				{
					"annotation" : "none",
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-1",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 93.0, 160.0, 105.0, 20.0 ],
					"text" : "multiModel.model"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-3",
					"maxclass" : "bpatcher",
					"name" : "degrade~.module.maxpat",
					"numinlets" : 2,
					"numoutlets" : 3,
					"outlettype" : [ "signal", "signal", "" ],
					"patching_rect" : [ 200.0, 402.0, 150.0, 70.0 ],
					"presentation_rect" : [ 318.0, 251.0, 150.0, 70.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-2",
					"maxclass" : "bpatcher",
					"name" : "mouse.module.maxpat",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 35.5, 402.0, 150.0, 70.0 ],
					"presentation_rect" : [ 15.0, 15.0, 150.0, 70.0 ]
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-7", 0 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-4::obj-30::obj-93::obj-14" : [ "live.dial[3]", "Bit depth", 0 ],
			"obj-4::obj-13" : [ "live.text[2]", "live.text", 0 ],
			"obj-3::obj-1::obj-13" : [ "live.dial", "Sample rate", 0 ],
			"obj-4::obj-30::obj-93::obj-13" : [ "live.dial[2]", "Sample rate", 0 ],
			"obj-3::obj-1::obj-14" : [ "live.dial[1]", "Bit depth", 0 ]
		}
,
		"dependency_cache" : [ 			{
				"name" : "mouse.module.maxpat",
				"bootpath" : "/Users/jln/@Jamoma/Jamoma/Implementations/Max/Jamoma/patchers/modules/data/mouse",
				"patcherrelativepath" : "../mouse",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "mouse.model.maxpat",
				"bootpath" : "/Users/jln/@Jamoma/Jamoma/Implementations/Max/Jamoma/patchers/modules/data/mouse",
				"patcherrelativepath" : "../mouse",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "mouse.view.maxpat",
				"bootpath" : "/Users/jln/@Jamoma/Jamoma/Implementations/Max/Jamoma/patchers/modules/data/mouse",
				"patcherrelativepath" : "../mouse",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "degrade~.module.maxpat",
				"bootpath" : "/Users/jln/@Jamoma/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/Distortion/degrade~",
				"patcherrelativepath" : "../../audio/stereo/Distortion/degrade~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "degrade~.model.maxpat",
				"bootpath" : "/Users/jln/@Jamoma/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/Distortion/degrade~",
				"patcherrelativepath" : "../../audio/stereo/Distortion/degrade~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "degrade~.view.maxpat",
				"bootpath" : "/Users/jln/@Jamoma/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/Distortion/degrade~",
				"patcherrelativepath" : "../../audio/stereo/Distortion/degrade~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "multiModel.model.maxpat",
				"bootpath" : "/Users/jln/@Jamoma/Jamoma/Implementations/Max/Jamoma/patchers/modules/data/multiModel",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "multiModel.view.maxpat",
				"bootpath" : "/Users/jln/@Jamoma/Jamoma/Implementations/Max/Jamoma/patchers/modules/data/multiModel",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.parameter.mxo",
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
				"name" : "j.init.mxo",
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
				"name" : "j.in~.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.out~.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.receive~.mxo",
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
				"name" : "j.send.mxo",
				"type" : "iLaX"
			}
 ]
	}

}
