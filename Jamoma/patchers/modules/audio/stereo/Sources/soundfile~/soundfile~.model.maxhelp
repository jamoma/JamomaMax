{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 7,
			"minor" : 0,
			"revision" : 1,
			"architecture" : "x86",
			"modernui" : 1
		}
,
		"rect" : [ 59.0, 104.0, 598.0, 511.0 ],
		"bglocked" : 0,
		"openinpresentation" : 0,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 1,
		"gridsize" : [ 15.0, 15.0 ],
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
					"id" : "obj-5",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 140.0, 106.0, 83.0, 22.0 ],
					"style" : "",
					"text" : "file/path none"
				}

			}
, 			{
				"box" : 				{
					"args" : [ "@name", "soundfile~.model", "@description", "Stereo sound file playback." ],
					"bgmode" : 1,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-4",
					"lockeddragscroll" : 0,
					"maxclass" : "bpatcher",
					"name" : "j.maxhelpui.maxpat",
					"numinlets" : 1,
					"numoutlets" : 0,
					"offset" : [ 0.0, 0.0 ],
					"patching_rect" : [ 0.0, 0.0, 595.0, 70.0 ],
					"prototypename" : "bphelp",
					"varname" : "maxhelpui",
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"args" : [ "output~" ],
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-3",
					"lockeddragscroll" : 0,
					"maxclass" : "bpatcher",
					"name" : "output~.module.maxpat",
					"numinlets" : 2,
					"numoutlets" : 1,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "" ],
					"patching_rect" : [ 140.0, 237.0, 300.0, 175.0 ],
					"presentation_rect" : [ 0.0, 0.0, 300.0, 175.0 ],
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"args" : [ "soundfile" ],
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-1",
					"lockeddragscroll" : 0,
					"maxclass" : "bpatcher",
					"name" : "soundfile~.module.maxpat",
					"numinlets" : 1,
					"numoutlets" : 3,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "signal", "signal", "" ],
					"patching_rect" : [ 140.0, 145.0, 300.0, 70.0 ],
					"presentation_rect" : [ 0.0, 0.0, 300.0, 70.0 ],
					"viewvisibility" : 1
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-1", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-1", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-5", 0 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-3::obj-1::obj-12::obj-15" : [ "Postamp", "Postamp", 0 ],
			"obj-3::obj-1::obj-12::obj-13" : [ "Release", "Release", 0 ],
			"obj-3::obj-1::obj-12::obj-12" : [ "Lookahead", "Lookahead", 0 ],
			"obj-3::obj-1::obj-103" : [ "live.text[5]", "live.text", 0 ],
			"obj-1::obj-1::obj-9::obj-16" : [ "live.menu[1]", "live.menu", 0 ],
			"obj-3::obj-1::obj-100" : [ "live.text[7]", "live.text[1]", 0 ],
			"obj-3::obj-1::obj-99" : [ "live.menu[3]", "live.menu[2]", 0 ],
			"obj-3::obj-1::obj-110" : [ "live.numbox[3]", "live.numbox[1]", 0 ],
			"obj-3::obj-1::obj-108" : [ "live.text[6]", "live.text[4]", 0 ],
			"obj-1::obj-1::obj-9::obj-3" : [ "live.dial", "Modulating Freq", 0 ],
			"obj-3::obj-1::obj-12::obj-30" : [ "live.menu[2]", "live.menu", 0 ],
			"obj-1::obj-1::obj-9::obj-22" : [ "live.numbox", "live.numbox", 0 ],
			"obj-1::obj-1::obj-9::obj-43" : [ "Pitch Shift", "Pitch Shift", 0 ],
			"obj-3::obj-1::obj-82" : [ "pan", "Pan", 0 ],
			"obj-1::obj-1::obj-9::obj-37" : [ "Basic Tuning", "Basic Tuning", 0 ],
			"obj-1::obj-1::obj-9::obj-36" : [ "Slur Time", "Slur Time", 0 ],
			"obj-3::obj-1::obj-104" : [ "live.dial[1]", "Depth", 0 ],
			"obj-3::obj-1::obj-107" : [ "live.dial[4]", "Preamp", 0 ],
			"obj-3::obj-1::obj-106" : [ "live.dial[3]", "Release", 0 ],
			"obj-1::obj-1::obj-9::obj-59" : [ "live.text[3]", "live.text", 0 ],
			"obj-3::obj-1::obj-102" : [ "live.text[12]", "live.text", 0 ],
			"obj-3::obj-1::obj-90" : [ "live.text[11]", "live.text[1]", 0 ],
			"obj-3::obj-1::obj-12::obj-42" : [ "live.text[4]", "live.text", 0 ],
			"obj-1::obj-1::obj-9::obj-41" : [ "live.text[2]", "live.text", 0 ],
			"obj-3::obj-1::obj-98" : [ "live.menu[4]", "live.menu", 0 ],
			"obj-1::obj-1::obj-58" : [ "live.text[8]", "live.text[4]", 0 ],
			"obj-1::obj-1::obj-9::obj-29" : [ "live.text[1]", "live.text", 0 ],
			"obj-3::obj-1::obj-12::obj-6" : [ "live.text[10]", "live.text", 0 ],
			"obj-3::obj-1::obj-97" : [ "live.numbox[1]", "CPU", 0 ],
			"obj-3::obj-1::obj-12::obj-27" : [ "Threshold", "Threshold", 0 ],
			"obj-1::obj-1::obj-9::obj-65" : [ "formant", "formant", 0 ],
			"obj-1::obj-1::obj-9::obj-45" : [ "transposition", "transposition", 0 ],
			"obj-1::obj-1::obj-9::obj-14" : [ "live.menu", "live.menu", 0 ],
			"obj-3::obj-1::obj-12::obj-5" : [ "Preamp", "Preamp", 0 ],
			"obj-3::obj-1::obj-12::obj-45" : [ "live.text[9]", "live.text", 0 ],
			"obj-3::obj-1::obj-111" : [ "live.numbox[2]", "live.numbox[2]", 0 ],
			"obj-1::obj-1::obj-9::obj-5" : [ "live.text", "live.text", 0 ],
			"obj-3::obj-1::obj-53" : [ "Master Gain", "Master Gain", 0 ]
		}
,
		"dependency_cache" : [ 			{
				"name" : "soundfile~.module.maxpat",
				"bootpath" : "~/Documents/GITHUB/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/Sources/soundfile~",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "soundfile~.view.maxpat",
				"bootpath" : "~/Documents/GITHUB/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/Sources/soundfile~",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.list2parameter.maxpat",
				"bootpath" : "~/Documents/GITHUB/Jamoma/Implementations/Max/Jamoma/patchers/components/data/list2parameter",
				"patcherrelativepath" : "../../../../../components/data/list2parameter",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "soundfile~.model.maxpat",
				"bootpath" : "~/Documents/GITHUB/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/Sources/soundfile~",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "thru.maxpat",
				"bootpath" : "/Applications/Max.app/Contents/Resources/C74/patchers/m4l/Pluggo for Live resources/patches",
				"patcherrelativepath" : "../../../../../../../../../../../../../../Applications/Max.app/Contents/Resources/C74/patchers/m4l/Pluggo for Live resources/patches",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "output~.module.maxpat",
				"bootpath" : "~/Documents/GITHUB/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/Output/output~",
				"patcherrelativepath" : "../../Output/output~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "output~.model.maxpat",
				"bootpath" : "~/Documents/GITHUB/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/Output/output~",
				"patcherrelativepath" : "../../Output/output~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "saturation~.model.maxpat",
				"bootpath" : "~/Documents/GITHUB/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/Distortion/saturation~",
				"patcherrelativepath" : "../../Distortion/saturation~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "limiter~.model.maxpat",
				"bootpath" : "~/Documents/GITHUB/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/Dynamics/limiter~",
				"patcherrelativepath" : "../../Dynamics/limiter~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "limiter.parametersAndMessages.maxpat",
				"bootpath" : "~/Documents/GITHUB/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/Dynamics/limiter~",
				"patcherrelativepath" : "../../Dynamics/limiter~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "balance~.model.maxpat",
				"bootpath" : "~/Documents/GITHUB/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/Imaging/balance~",
				"patcherrelativepath" : "../../Imaging/balance~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "record~.model.maxpat",
				"bootpath" : "~/Documents/GITHUB/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/Output/record~",
				"patcherrelativepath" : "../../Output/record~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "record.parametersAndMessages.maxpat",
				"bootpath" : "~/Documents/GITHUB/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/Output/record~",
				"patcherrelativepath" : "../../Output/record~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "output~.view.maxpat",
				"bootpath" : "~/Documents/GITHUB/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/Output/output~",
				"patcherrelativepath" : "../../Output/output~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "limiter~.view.maxpat",
				"bootpath" : "~/Documents/GITHUB/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/Dynamics/limiter~",
				"patcherrelativepath" : "../../Dynamics/limiter~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.maxhelpui.maxpat",
				"bootpath" : "~/Documents/GITHUB/Jamoma/Implementations/Max/Jamoma/patchers/components/data/maxhelpui",
				"patcherrelativepath" : "../../../../../components/data/maxhelpui",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.maxhelpuiButton.png",
				"bootpath" : "~/Documents/GITHUB/Jamoma/Implementations/Max/Jamoma/patchers/components/data/maxhelpui",
				"patcherrelativepath" : "../../../../../components/data/maxhelpui",
				"type" : "PNG ",
				"implicit" : 1
			}
, 			{
				"name" : "j.maxhelpuiResize.js",
				"bootpath" : "~/Documents/GITHUB/Jamoma/Implementations/Max/Jamoma/patchers/components/data/maxhelpui",
				"patcherrelativepath" : "../../../../../components/data/maxhelpui",
				"type" : "TEXT",
				"implicit" : 1
			}
, 			{
				"name" : "j.jamomaPath.maxpat",
				"bootpath" : "~/Documents/GITHUB/Jamoma/Implementations/Max/Jamoma/patchers/components/data/jamomaPath",
				"patcherrelativepath" : "../../../../../components/data/jamomaPath",
				"type" : "JSON",
				"implicit" : 1
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
				"name" : "j.savebang.mxo",
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
				"name" : "j.out~.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.model.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.return.mxo",
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
				"name" : "j.stats.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.in~.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.overdrive~.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.limiter~.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.panorama~.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.receive~.mxo",
				"type" : "iLaX"
			}
 ],
		"embedsnapshot" : 0
	}

}
