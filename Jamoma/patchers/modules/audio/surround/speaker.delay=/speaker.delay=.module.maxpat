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
		"rect" : [ 25.0, 69.0, 640.0, 480.0 ],
		"bglocked" : 0,
		"openinpresentation" : 1,
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
					"comment" : "",
					"id" : "obj-6",
					"maxclass" : "outlet",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 218.0, 320.0, 25.0, 25.0 ]
				}

			}
, 			{
				"box" : 				{
					"comment" : "",
					"id" : "obj-5",
					"maxclass" : "outlet",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 87.0, 320.0, 25.0, 25.0 ]
				}

			}
, 			{
				"box" : 				{
					"comment" : "",
					"id" : "obj-4",
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 87.0, 216.0, 25.0, 25.0 ]
				}

			}
, 			{
				"box" : 				{
					"comment" : "",
					"id" : "obj-3",
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 218.0, 216.0, 25.0, 25.0 ]
				}

			}
, 			{
				"box" : 				{
					"annotation" : "Adjust relative weight of components of ambisonic signal.",
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-2",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "audio.connect", "" ],
					"patching_rect" : [ 87.0, 261.0, 144.0, 20.0 ],
					"text" : "speaker.delay=.model #1"
				}

			}
, 			{
				"box" : 				{
					"annotation" : "Adjust delay of the loudspeakers to adjust for varying distances. Delay can either be provided as a time delay or will be calculated from loudspeaker positions automatically.",
					"args" : [ "#1" ],
					"id" : "obj-1",
					"maxclass" : "bpatcher",
					"name" : "speaker.delay=.view.maxpat",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 0.0, 0.0, 150.0, 70.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.0, 0.0, 150.0, 70.0 ]
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-2", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-2", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-3", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-4", 0 ]
				}

			}
 ],
		"dependency_cache" : [ 			{
				"name" : "speaker.delay=.view.maxpat",
				"bootpath" : "/Users/jln/@Jamoma/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/surround/speaker.delay=",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "thru.maxpat",
				"bootpath" : "/Applications/Max 6.1.8/patches/m4l-patches/Pluggo for Live resources/patches",
				"patcherrelativepath" : "../../../../../../../../../../../../Applications/Max 6.1.8/patches/m4l-patches/Pluggo for Live resources/patches",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "speaker.delay=.model.maxpat",
				"bootpath" : "/Users/jln/@Jamoma/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/surround/speaker.delay=",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.message.array.maxpat",
				"bootpath" : "/Users/jln/@Jamoma/Jamoma/Implementations/Max/Jamoma/patchers/components/deprecated/message.array",
				"patcherrelativepath" : "../../../../components/deprecated/message.array",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.message.array.instance.maxpat",
				"bootpath" : "/Users/jln/@Jamoma/Jamoma/Implementations/Max/Jamoma/patchers/components/deprecated/message.array",
				"patcherrelativepath" : "../../../../components/deprecated/message.array",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.parameter.array.maxpat",
				"bootpath" : "/Users/jln/@Jamoma/Jamoma/Implementations/Max/Jamoma/patchers/components/deprecated/parameter.array",
				"patcherrelativepath" : "../../../../components/deprecated/parameter.array",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.parameter.array.instance.maxpat",
				"bootpath" : "/Users/jln/@Jamoma/Jamoma/Implementations/Max/Jamoma/patchers/components/deprecated/parameter.array",
				"patcherrelativepath" : "../../../../components/deprecated/parameter.array",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.speaker.delays=.js",
				"bootpath" : "/Users/jln/@Jamoma/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/surround/speaker.delay=",
				"patcherrelativepath" : ".",
				"type" : "TEXT",
				"implicit" : 1
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
				"name" : "j.in.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.oscroute.mxo",
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
				"name" : "j.pass.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.unpack=.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.pack=.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.oscinstance.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.unit.mxo",
				"type" : "iLaX"
			}
 ]
	}

}
