{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 7,
			"minor" : 1,
			"revision" : 0,
			"architecture" : "x86",
			"modernui" : 1
		}
,
		"rect" : [ 34.0, 79.0, 387.0, 419.0 ],
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
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-2",
					"lockeddragscroll" : 1,
					"maxclass" : "bpatcher",
					"name" : "output~.module.maxpat",
					"numinlets" : 2,
					"numoutlets" : 1,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "" ],
					"patching_rect" : [ 45.0, 208.0, 300.0, 175.0 ],
					"presentation_rect" : [ 0.0, 0.0, 300.0, 175.0 ],
					"varname" : "output~",
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
					"id" : "obj-3",
					"lockeddragscroll" : 1,
					"maxclass" : "bpatcher",
					"name" : "input~.module.maxpat",
					"numinlets" : 1,
					"numoutlets" : 3,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "signal", "signal", "" ],
					"patching_rect" : [ 45.0, 9.0, 300.0, 175.0 ],
					"presentation_rect" : [ 0.0, 0.0, 300.0, 175.0 ],
					"varname" : "input~",
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 12.0,
					"id" : "obj-4",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 43.0, 301.0, 278.0, 21.0 ],
					"style" : "",
					"text" : "Simple patch to make/take some recordings"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-3", 1 ]
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
 ],
		"parameters" : 		{
			"obj-3::obj-1::obj-4" : [ "live.text[4]", "live.text[1]", 0 ],
			"obj-2::obj-1::obj-99" : [ "live.menu[5]", "live.menu[2]", 0 ],
			"obj-3::obj-1::obj-1::obj-42" : [ "live.text[1]", "live.text", 0 ],
			"obj-2::obj-1::obj-12::obj-13" : [ "Release[1]", "Release", 0 ],
			"obj-2::obj-1::obj-90" : [ "live.text[13]", "live.text[1]", 0 ],
			"obj-2::obj-1::obj-111" : [ "live.numbox[4]", "live.numbox[2]", 0 ],
			"obj-3::obj-1::obj-74" : [ "live.dial[1]", "Transpose", 0 ],
			"obj-2::obj-1::obj-17" : [ "Master Gain[2]", "Master Gain", 0 ],
			"obj-2::obj-1::obj-110" : [ "live.numbox[5]", "live.numbox[1]", 0 ],
			"obj-3::obj-1::obj-29::obj-48" : [ "live.menu[1]", "live.menu", 0 ],
			"obj-2::obj-1::obj-107" : [ "live.dial[4]", "Preamp", 0 ],
			"obj-2::obj-1::obj-106" : [ "live.dial[3]", "Release", 0 ],
			"obj-2::obj-1::obj-12::obj-45" : [ "live.text[10]", "live.text", 0 ],
			"obj-2::obj-1::obj-98" : [ "live.menu[4]", "live.menu", 0 ],
			"obj-2::obj-1::obj-12::obj-15" : [ "Postamp[1]", "Postamp", 0 ],
			"obj-2::obj-1::obj-104" : [ "live.dial[5]", "Depth", 0 ],
			"obj-2::obj-1::obj-102" : [ "live.text[15]", "live.text", 0 ],
			"obj-3::obj-1::obj-1::obj-5" : [ "Preamp", "Preamp", 0 ],
			"obj-3::obj-1::obj-1::obj-30" : [ "live.menu", "live.menu", 0 ],
			"obj-2::obj-1::obj-12::obj-6" : [ "live.text[11]", "live.text", 0 ],
			"obj-2::obj-1::obj-12::obj-12" : [ "Lookahead[1]", "Lookahead", 0 ],
			"obj-3::obj-1::obj-82" : [ "pan", "Pan", 0 ],
			"obj-3::obj-1::obj-108" : [ "live.text[7]", "live.text[4]", 0 ],
			"obj-2::obj-1::obj-82" : [ "pan[1]", "Pan", 0 ],
			"obj-3::obj-1::obj-110" : [ "live.numbox[1]", "live.numbox[1]", 0 ],
			"obj-3::obj-1::obj-1::obj-6" : [ "live.text", "live.text", 0 ],
			"obj-2::obj-1::obj-12::obj-42" : [ "live.text[9]", "live.text", 0 ],
			"obj-2::obj-1::obj-12::obj-5" : [ "Preamp[1]", "Preamp", 0 ],
			"obj-2::obj-1::obj-100" : [ "live.text[14]", "live.text[1]", 0 ],
			"obj-3::obj-1::obj-1::obj-27" : [ "Threshold", "Threshold", 0 ],
			"obj-3::obj-1::obj-1::obj-15" : [ "Postamp", "Postamp", 0 ],
			"obj-3::obj-1::obj-62" : [ "live.text[5]", "live.text[3]", 0 ],
			"obj-3::obj-1::obj-1::obj-13" : [ "Release", "Release", 0 ],
			"obj-3::obj-1::obj-59" : [ "live.text[8]", "live.text[3]", 0 ],
			"obj-3::obj-1::obj-58" : [ "live.text[6]", "live.text[4]", 0 ],
			"obj-3::obj-1::obj-47" : [ "live.numbox[3]", "live.numbox", 0 ],
			"obj-3::obj-1::obj-45" : [ "live.text[3]", "live.text", 0 ],
			"obj-3::obj-1::obj-48" : [ "live.menu[2]", "live.menu", 0 ],
			"obj-2::obj-1::obj-12::obj-30" : [ "live.menu[3]", "live.menu", 0 ],
			"obj-3::obj-1::obj-1::obj-12" : [ "Lookahead", "Lookahead", 0 ],
			"obj-2::obj-1::obj-12::obj-27" : [ "Threshold[1]", "Threshold", 0 ],
			"obj-2::obj-1::obj-97" : [ "live.numbox", "CPU", 0 ],
			"obj-2::obj-1::obj-108" : [ "live.text[16]", "live.text[4]", 0 ],
			"obj-2::obj-1::obj-103" : [ "live.text[12]", "live.text", 0 ],
			"obj-3::obj-1::obj-111" : [ "live.numbox[2]", "live.numbox[2]", 0 ],
			"obj-3::obj-1::obj-1::obj-45" : [ "live.text[2]", "live.text", 0 ],
			"obj-3::obj-1::obj-55" : [ "Master Gain[1]", "Master Gain", 0 ]
		}
,
		"dependency_cache" : [ 			{
				"name" : "input~.module.maxpat",
				"bootpath" : "~/Documents/JamomaMax/Jamoma/patchers/models/audio/stereo/sources/input",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "input~.view.maxpat",
				"bootpath" : "~/Documents/JamomaMax/Jamoma/patchers/models/audio/stereo/sources/input",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "limiter~.view.maxpat",
				"bootpath" : "~/Documents/JamomaMax/Jamoma/patchers/models/audio/stereo/dynamics/limiter",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "input~.model.maxpat",
				"bootpath" : "~/Documents/JamomaMax/Jamoma/patchers/models/audio/stereo/sources/input",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "limiter~.model.maxpat",
				"bootpath" : "~/Documents/JamomaMax/Jamoma/patchers/models/audio/stereo/dynamics/limiter",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "limiter.parametersAndMessages.maxpat",
				"bootpath" : "~/Documents/JamomaMax/Jamoma/patchers/models/audio/stereo/dynamics/limiter",
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
				"name" : "balance~.model.maxpat",
				"bootpath" : "~/Documents/JamomaMax/Jamoma/patchers/models/audio/stereo/imaging/balance",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "output~.module.maxpat",
				"bootpath" : "~/Documents/JamomaMax/Jamoma/patchers/models/audio/stereo/output/output",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "output~.model.maxpat",
				"bootpath" : "~/Documents/JamomaMax/Jamoma/patchers/models/audio/stereo/output/output",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "saturation~.model.maxpat",
				"bootpath" : "~/Documents/JamomaMax/Jamoma/patchers/models/audio/stereo/distortion/saturation",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "record~.model.maxpat",
				"bootpath" : "~/Documents/JamomaMax/Jamoma/patchers/models/audio/stereo/output/record",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "record.parametersAndMessages.maxpat",
				"bootpath" : "~/Documents/JamomaMax/Jamoma/patchers/models/audio/stereo/output/record",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "output~.view.maxpat",
				"bootpath" : "~/Documents/JamomaMax/Jamoma/patchers/models/audio/stereo/output/output",
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
 ],
		"autosave" : 0
	}

}
