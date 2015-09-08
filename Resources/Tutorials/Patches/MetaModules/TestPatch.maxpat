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
		"rect" : [ 91.0, 80.0, 426.0, 580.0 ],
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
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"frgb" : 0.0,
					"id" : "obj-9",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 50.0, 45.0, 234.0, 19.0 ],
					"text" : "A simple audio patch for testing purposes...."
				}

			}
, 			{
				"box" : 				{
					"args" : [ "echo~" ],
					"id" : "obj-7",
					"maxclass" : "bpatcher",
					"name" : "echo~.module.maxpat",
					"numinlets" : 2,
					"numoutlets" : 3,
					"outlettype" : [ "signal", "signal", "" ],
					"patching_rect" : [ 50.0, 260.0, 300.0, 105.0 ],
					"presentation_rect" : [ 0.0, 0.0, 300.0, 105.0 ]
				}

			}
, 			{
				"box" : 				{
					"args" : [ "output~" ],
					"id" : "obj-4",
					"maxclass" : "bpatcher",
					"name" : "output~.module.maxpat",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 50.0, 375.0, 300.0, 175.0 ],
					"presentation_rect" : [ 0.0, 0.0, 300.0, 175.0 ]
				}

			}
, 			{
				"box" : 				{
					"annotation" : "none",
					"args" : [ "input~" ],
					"id" : "obj-2",
					"maxclass" : "bpatcher",
					"name" : "input~.module.maxpat",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "signal", "signal", "" ],
					"patching_rect" : [ 50.0, 75.0, 300.0, 175.0 ],
					"presentation_rect" : [ 0.0, 0.0, 300.0, 175.0 ]
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-2", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-2", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-7", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-7", 0 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-2::obj-1::obj-1::obj-27" : [ "Threshold", "Threshold", 0 ],
			"obj-4::obj-1::obj-12::obj-27" : [ "Threshold[2]", "Threshold", 0 ],
			"obj-2::obj-1::obj-48" : [ "live.menu[2]", "live.menu", 0 ],
			"obj-7::obj-4::obj-3::obj-15" : [ "Postamp[1]", "Postamp", 0 ],
			"obj-4::obj-1::obj-12::obj-30" : [ "live.menu[6]", "live.menu", 0 ],
			"obj-4::obj-1::obj-12::obj-12" : [ "Lookahead[2]", "Lookahead", 0 ],
			"obj-2::obj-1::obj-4" : [ "live.text[4]", "live.text[1]", 0 ],
			"obj-4::obj-1::obj-104" : [ "live.dial[5]", "Depth", 0 ],
			"obj-7::obj-4::obj-24" : [ "live.dial[2]", "Delay R", 0 ],
			"obj-4::obj-1::obj-103" : [ "live.text[17]", "live.text", 0 ],
			"obj-4::obj-1::obj-102" : [ "live.text[18]", "live.text", 0 ],
			"obj-7::obj-4::obj-3::obj-27" : [ "Threshold[1]", "Threshold", 0 ],
			"obj-4::obj-1::obj-107" : [ "live.dial[4]", "Preamp", 0 ],
			"obj-7::obj-4::obj-21" : [ "live.menu[3]", "live.menu[2]", 0 ],
			"obj-4::obj-1::obj-106" : [ "live.dial[3]", "Release", 0 ],
			"obj-7::obj-4::obj-3::obj-12" : [ "Lookahead[1]", "Lookahead", 0 ],
			"obj-2::obj-1::obj-110" : [ "live.numbox[1]", "live.numbox[1]", 0 ],
			"obj-4::obj-1::obj-12::obj-5" : [ "Preamp[2]", "Preamp", 0 ],
			"obj-4::obj-1::obj-82" : [ "pan[1]", "Pan", 0 ],
			"obj-7::obj-4::obj-18" : [ "live.text[3]", "live.text[3]", 0 ],
			"obj-4::obj-1::obj-99" : [ "live.menu[7]", "live.menu[2]", 0 ],
			"obj-4::obj-1::obj-97" : [ "live.numbox", "CPU", 0 ],
			"obj-2::obj-1::obj-1::obj-6" : [ "live.text", "live.text", 0 ],
			"obj-7::obj-4::obj-25" : [ "Feedback", "Feedback", 0 ],
			"obj-4::obj-1::obj-12::obj-42" : [ "live.text[14]", "live.text", 0 ],
			"obj-2::obj-1::obj-82" : [ "pan", "Pan", 0 ],
			"obj-2::obj-1::obj-29::obj-48" : [ "live.menu[1]", "live.menu", 0 ],
			"obj-4::obj-1::obj-90" : [ "live.text[19]", "live.text[1]", 0 ],
			"obj-4::obj-1::obj-108" : [ "live.text[16]", "live.text[4]", 0 ],
			"obj-2::obj-1::obj-111" : [ "live.numbox[2]", "live.numbox[2]", 0 ],
			"obj-7::obj-4::obj-3::obj-5" : [ "Preamp[1]", "Preamp", 0 ],
			"obj-2::obj-1::obj-55" : [ "Master Gain[1]", "Master Gain", 0 ],
			"obj-7::obj-4::obj-17" : [ "live.menu[4]", "live.menu[1]", 0 ],
			"obj-2::obj-1::obj-1::obj-45" : [ "live.text[2]", "live.text", 0 ],
			"obj-2::obj-1::obj-62" : [ "live.text[5]", "live.text[3]", 0 ],
			"obj-7::obj-4::obj-3::obj-30" : [ "live.menu[5]", "live.menu", 0 ],
			"obj-7::obj-4::obj-3::obj-6" : [ "live.text[12]", "live.text", 0 ],
			"obj-2::obj-1::obj-47" : [ "live.numbox[3]", "live.numbox", 0 ],
			"obj-4::obj-1::obj-12::obj-6" : [ "live.text[15]", "live.text", 0 ],
			"obj-4::obj-1::obj-98" : [ "live.menu[8]", "live.menu", 0 ],
			"obj-2::obj-1::obj-45" : [ "live.text[9]", "live.text", 0 ],
			"obj-2::obj-1::obj-74" : [ "live.dial[1]", "Transpose", 0 ],
			"obj-7::obj-4::obj-23" : [ "live.dial", "Delay L", 0 ],
			"obj-2::obj-1::obj-1::obj-5" : [ "Preamp", "Preamp", 0 ],
			"obj-2::obj-1::obj-58" : [ "live.text[6]", "live.text[4]", 0 ],
			"obj-4::obj-1::obj-17" : [ "Master Gain[2]", "Master Gain", 0 ],
			"obj-4::obj-1::obj-110" : [ "live.numbox[5]", "live.numbox[1]", 0 ],
			"obj-2::obj-1::obj-1::obj-42" : [ "live.text[1]", "live.text", 0 ],
			"obj-4::obj-1::obj-12::obj-13" : [ "Release[2]", "Release", 0 ],
			"obj-7::obj-4::obj-3::obj-42" : [ "live.text[11]", "live.text", 0 ],
			"obj-2::obj-1::obj-59" : [ "live.text[8]", "live.text[3]", 0 ],
			"obj-2::obj-1::obj-1::obj-15" : [ "Postamp", "Postamp", 0 ],
			"obj-4::obj-1::obj-12::obj-45" : [ "live.text[13]", "live.text", 0 ],
			"obj-2::obj-1::obj-1::obj-13" : [ "Release", "Release", 0 ],
			"obj-4::obj-1::obj-12::obj-15" : [ "Postamp[2]", "Postamp", 0 ],
			"obj-2::obj-1::obj-1::obj-12" : [ "Lookahead", "Lookahead", 0 ],
			"obj-2::obj-1::obj-108" : [ "live.text[7]", "live.text[4]", 0 ],
			"obj-2::obj-1::obj-1::obj-30" : [ "live.menu", "live.menu", 0 ],
			"obj-4::obj-1::obj-100" : [ "live.text[20]", "live.text[1]", 0 ],
			"obj-4::obj-1::obj-111" : [ "live.numbox[4]", "live.numbox[2]", 0 ],
			"obj-7::obj-4::obj-3::obj-13" : [ "Release[1]", "Release", 0 ],
			"obj-7::obj-4::obj-3::obj-45" : [ "live.text[10]", "live.text", 0 ]
		}
,
		"dependency_cache" : [ 			{
				"name" : "input~.module.maxpat",
				"bootpath" : "/Users/reno/JamomaMax/Jamoma/patchers/modules/audio/stereo/Sources/input~",
				"patcherrelativepath" : "../../../../Jamoma/patchers/modules/audio/stereo/Sources/input~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "input~.view.maxpat",
				"bootpath" : "/Users/reno/JamomaMax/Jamoma/patchers/modules/audio/stereo/Sources/input~",
				"patcherrelativepath" : "../../../../Jamoma/patchers/modules/audio/stereo/Sources/input~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "limiter~.view.maxpat",
				"bootpath" : "/Users/reno/JamomaMax/Jamoma/patchers/modules/audio/stereo/Dynamics/limiter~",
				"patcherrelativepath" : "../../../../Jamoma/patchers/modules/audio/stereo/Dynamics/limiter~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "input~.model.maxpat",
				"bootpath" : "/Users/reno/JamomaMax/Jamoma/patchers/modules/audio/stereo/Sources/input~",
				"patcherrelativepath" : "../../../../Jamoma/patchers/modules/audio/stereo/Sources/input~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "limiter~.model.maxpat",
				"bootpath" : "/Users/reno/JamomaMax/Jamoma/patchers/modules/audio/stereo/Dynamics/limiter~",
				"patcherrelativepath" : "../../../../Jamoma/patchers/modules/audio/stereo/Dynamics/limiter~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "limiter.parametersAndMessages.maxpat",
				"bootpath" : "/Users/reno/JamomaMax/Jamoma/patchers/modules/audio/stereo/Dynamics/limiter~",
				"patcherrelativepath" : "../../../../Jamoma/patchers/modules/audio/stereo/Dynamics/limiter~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "thru.maxpat",
				"bootpath" : "/Applications/Max 6.1/patches/m4l-patches/Pluggo for Live resources/patches",
				"patcherrelativepath" : "../../../../../../../Applications/Max 6.1/patches/m4l-patches/Pluggo for Live resources/patches",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "balance~.model.maxpat",
				"bootpath" : "/Users/reno/JamomaMax/Jamoma/patchers/modules/audio/stereo/Imaging/balance~",
				"patcherrelativepath" : "../../../../Jamoma/patchers/modules/audio/stereo/Imaging/balance~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "output~.module.maxpat",
				"bootpath" : "/Users/reno/JamomaMax/Jamoma/patchers/modules/audio/stereo/Output/output~",
				"patcherrelativepath" : "../../../../Jamoma/patchers/modules/audio/stereo/Output/output~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "output~.model.maxpat",
				"bootpath" : "/Users/reno/JamomaMax/Jamoma/patchers/modules/audio/stereo/Output/output~",
				"patcherrelativepath" : "../../../../Jamoma/patchers/modules/audio/stereo/Output/output~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "saturation~.model.maxpat",
				"bootpath" : "/Users/reno/JamomaMax/Jamoma/patchers/modules/audio/stereo/Distortion/saturation~",
				"patcherrelativepath" : "../../../../Jamoma/patchers/modules/audio/stereo/Distortion/saturation~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "record~.model.maxpat",
				"bootpath" : "/Users/reno/JamomaMax/Jamoma/patchers/modules/audio/stereo/Output/record~",
				"patcherrelativepath" : "../../../../Jamoma/patchers/modules/audio/stereo/Output/record~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "record.parametersAndMessages.maxpat",
				"bootpath" : "/Users/reno/JamomaMax/Jamoma/patchers/modules/audio/stereo/Output/record~",
				"patcherrelativepath" : "../../../../Jamoma/patchers/modules/audio/stereo/Output/record~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "output~.view.maxpat",
				"bootpath" : "/Users/reno/JamomaMax/Jamoma/patchers/modules/audio/stereo/Output/output~",
				"patcherrelativepath" : "../../../../Jamoma/patchers/modules/audio/stereo/Output/output~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "echo~.module.maxpat",
				"bootpath" : "/Users/reno/JamomaMax/Jamoma/patchers/modules/audio/stereo/Delay/echo~",
				"patcherrelativepath" : "../../../../Jamoma/patchers/modules/audio/stereo/Delay/echo~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "echo~.model.maxpat",
				"bootpath" : "/Users/reno/JamomaMax/Jamoma/patchers/modules/audio/stereo/Delay/echo~",
				"patcherrelativepath" : "../../../../Jamoma/patchers/modules/audio/stereo/Delay/echo~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "filter~.model.maxpat",
				"bootpath" : "/Users/reno/JamomaMax/Jamoma/patchers/modules/audio/stereo/EQ/filter~",
				"patcherrelativepath" : "../../../../Jamoma/patchers/modules/audio/stereo/EQ/filter~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.octavebandwidth2q.maxpat",
				"bootpath" : "/Users/reno/JamomaMax/Jamoma/patchers/components/audio/octavebandwidth2q",
				"patcherrelativepath" : "../../../../Jamoma/patchers/components/audio/octavebandwidth2q",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.q2octavebandwidth.maxpat",
				"bootpath" : "/Users/reno/JamomaMax/Jamoma/patchers/components/audio/q2octavebandwith",
				"patcherrelativepath" : "../../../../Jamoma/patchers/components/audio/q2octavebandwith",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "echo~.view.maxpat",
				"bootpath" : "/Users/reno/JamomaMax/Jamoma/patchers/modules/audio/stereo/Delay/echo~",
				"patcherrelativepath" : "../../../../Jamoma/patchers/modules/audio/stereo/Delay/echo~",
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
				"name" : "j.view.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.savebang.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.receive.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.receive~.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.send.mxo",
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
				"name" : "j.return.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.unit.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.panorama~.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.stats.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.overdrive~.mxo",
				"type" : "iLaX"
			}
 ]
	}

}
