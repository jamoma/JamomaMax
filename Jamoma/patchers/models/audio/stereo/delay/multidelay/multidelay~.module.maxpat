{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 7,
			"minor" : 0,
			"revision" : 0,
			"architecture" : "x86"
		}
,
		"rect" : [ 484.0, 77.0, 298.0, 294.0 ],
		"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
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
					"annotation" : "none",
					"args" : [ "#1" ],
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-2",
					"lockeddragscroll" : 0,
					"maxclass" : "bpatcher",
					"name" : "multidelay~.view.maxpat",
					"numinlets" : 1,
					"numoutlets" : 1,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "" ],
					"patching_rect" : [ 0.0, 0.0, 300.0, 105.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 15.0, 15.0, 300.0, 105.0 ],
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"annotation" : "sample-accurate stereo multidelay with feedback options.",
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-47",
					"lockeddragscroll" : 0,
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 3,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "signal", "signal", "" ],
					"patching_rect" : [ 37.0, 205.0, 175.0, 20.0 ],
					"text" : "multidelay~.model #1",
					"viewvisibility" : 0
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
					"patching_rect" : [ 193.0, 155.0, 26.0, 26.0 ]
				}

			}
, 			{
				"box" : 				{
					"comment" : "",
					"id" : "obj-38",
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 37.0, 155.0, 26.0, 26.0 ]
				}

			}
, 			{
				"box" : 				{
					"comment" : "",
					"id" : "obj-40",
					"maxclass" : "outlet",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 115.0, 249.0, 26.0, 26.0 ]
				}

			}
, 			{
				"box" : 				{
					"comment" : "",
					"id" : "obj-43",
					"maxclass" : "outlet",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 37.0, 249.0, 26.0, 26.0 ]
				}

			}
, 			{
				"box" : 				{
					"comment" : "",
					"id" : "obj-44",
					"maxclass" : "outlet",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 193.0, 249.0, 26.0, 26.0 ]
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-47", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-38", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-47", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-4", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-40", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-47", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-43", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-47", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-44", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-47", 2 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-2::obj-3::obj-42" : [ "live.text[1]", "live.text", 0 ],
			"obj-2::obj-3::obj-6" : [ "live.text", "live.text", 0 ],
			"obj-2::obj-3::obj-5" : [ "Preamp", "Preamp", 0 ],
			"obj-2::obj-19" : [ "Feedback", "Feedback", 0 ],
			"obj-2::obj-3::obj-27" : [ "Threshold", "Threshold", 0 ],
			"obj-2::obj-3::obj-15" : [ "Postamp", "Postamp", 0 ],
			"obj-2::obj-3::obj-13" : [ "Release", "Release", 0 ],
			"obj-2::obj-3::obj-30" : [ "live.menu", "live.menu", 0 ],
			"obj-2::obj-3::obj-45" : [ "live.text[2]", "live.text", 0 ],
			"obj-2::obj-3::obj-12" : [ "Lookahead", "Lookahead", 0 ],
			"obj-2::obj-5" : [ "live.menu[1]", "live.menu[1]", 0 ]
		}
,
		"dependency_cache" : [ 			{
				"name" : "multidelay~.model.maxpat",
				"bootpath" : "~/dev/Jamoma/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/Delay/multidelay~",
				"patcherrelativepath" : "../../../../../../../../../../../../ntations/Max/Jamoma/patchers/modules/audio/stereo/Delay/multidelay~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "limiter~.model.maxpat",
				"bootpath" : "~/dev/Jamoma/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/Dynamics/limiter~",
				"patcherrelativepath" : "../../../../../../../../../../../../ntations/Max/Jamoma/patchers/modules/audio/stereo/Dynamics/limiter~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "limiter.parametersAndMessages.maxpat",
				"bootpath" : "~/dev/Jamoma/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/Dynamics/limiter~",
				"patcherrelativepath" : "../../../../../../../../../../../../ntations/Max/Jamoma/patchers/modules/audio/stereo/Dynamics/limiter~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "multidelay~.view.maxpat",
				"bootpath" : "~/dev/Jamoma/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/Delay/multidelay~",
				"patcherrelativepath" : "../../../../../../../../../../../../ntations/Max/Jamoma/patchers/modules/audio/stereo/Delay/multidelay~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "limiter~.view.maxpat",
				"bootpath" : "~/dev/Jamoma/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/Dynamics/limiter~",
				"patcherrelativepath" : "../../../../../../../../../../../../ntations/Max/Jamoma/patchers/modules/audio/stereo/Dynamics/limiter~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.parameter.mxo",
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
				"name" : "j.model.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.limiter~.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.message.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.unit.mxo",
				"type" : "iLaX"
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
				"name" : "j.view.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.receive~.mxo",
				"type" : "iLaX"
			}
 ]
	}

}
