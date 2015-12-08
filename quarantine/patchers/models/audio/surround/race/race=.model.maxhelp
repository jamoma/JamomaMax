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
		"rect" : [ 295.0, 45.0, 466.0, 530.0 ],
		"bglocked" : 0,
		"openinpresentation" : 0,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
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
					"hidden" : 1,
					"id" : "obj-1",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 353.0, 408.0, 67.0, 20.0 ],
					"saved_object_attributes" : 					{
						"allwindowsactive" : 0,
						"audiosupport" : 1,
						"cantclosetoplevelpatchers" : 1,
						"database" : 0,
						"extensions" : 1,
						"midisupport" : 1,
						"noloadbangdefeating" : 0,
						"overdrive" : 1,
						"preffilename" : "Max 5 Preferences",
						"searchformissingfiles" : 1,
						"statusvisible" : 1,
						"usesearchpath" : 0
					}
,
					"text" : "standalone"
				}

			}
, 			{
				"box" : 				{
					"args" : [ "@name", "sur.race=", "@description", "Ambiophonics RACE implementation" ],
					"bgmode" : 1,
					"id" : "obj-6",
					"maxclass" : "bpatcher",
					"name" : "j.maxhelpui.maxpat",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 0.0, 0.0, 466.0, 70.0 ],
					"prototypename" : "bphelp",
					"varname" : "maxhelpui"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frgb" : 0.0,
					"id" : "obj-14",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 272.0, 420.0, 95.0, 20.0 ],
					"text" : "this AES paper",
					"underline" : 1
				}

			}
, 			{
				"box" : 				{
					"handoff" : "",
					"id" : "obj-12",
					"maxclass" : "ubutton",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "bang", "bang", "", "int" ],
					"patching_rect" : [ 273.122437, 419.69873, 93.0, 16.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"hidden" : 1,
					"id" : "obj-10",
					"linecount" : 4,
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 126.0, 446.0, 284.0, 58.0 ],
					"text" : ";\rmax launchbrowser http://www.ambiophonics.org/papers/RG-RACE_AES123NYC0710.pdf"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frgb" : 0.0,
					"id" : "obj-11",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 12.0, 421.0, 267.0, 20.0 ],
					"text" : "this module is based on the description given in  "
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frgb" : 0.0,
					"id" : "obj-13",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 155.0, 75.0, 37.0, 20.0 ],
					"text" : "here",
					"underline" : 1
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-2",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 0,
					"patching_rect" : [ 73.0, 388.0, 159.5, 20.0 ],
					"text" : "dac~ 1 2"
				}

			}
, 			{
				"box" : 				{
					"handoff" : "",
					"id" : "obj-29",
					"maxclass" : "ubutton",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "bang", "bang", "", "int" ],
					"patching_rect" : [ 153.122467, 76.69873, 43.0, 17.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-3",
					"maxclass" : "bpatcher",
					"name" : "race=.module.maxpat",
					"numinlets" : 2,
					"numoutlets" : 3,
					"outlettype" : [ "signal", "signal", "" ],
					"patching_rect" : [ 73.0, 311.0, 300.0, 70.0 ],
					"presentation_rect" : [ 0.0, 0.0, 300.0, 70.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"hidden" : 1,
					"id" : "obj-30",
					"linecount" : 3,
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 196.122498, 66.69873, 166.0, 45.0 ],
					"text" : ";\rmax launchbrowser http://www.ambiophonics.org/"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frgb" : 0.0,
					"id" : "obj-33",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 4.41394, 74.649887, 156.0, 20.0 ],
					"text" : "What is Ambiophonics? see"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-4",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 232.622437, 388.0, 140.377563, 18.0 ],
					"text" : "sidechain 0."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-5",
					"maxclass" : "bpatcher",
					"name" : "input~.module.maxpat",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "signal", "signal", "" ],
					"patching_rect" : [ 73.0, 125.0, 300.0, 175.0 ],
					"presentation_rect" : [ 0.0, 0.0, 300.0, 175.0 ]
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 0 ],
					"disabled" : 0,
					"hidden" : 1,
					"source" : [ "obj-12", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-30", 0 ],
					"disabled" : 0,
					"hidden" : 1,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
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
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-3", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-5", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-5", 0 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-5::obj-1::obj-58" : [ "live.text[7]", "live.text[4]", 0 ],
			"obj-5::obj-1::obj-59" : [ "live.text[4]", "live.text[3]", 0 ],
			"obj-5::obj-1::obj-47" : [ "live.numbox[3]", "live.numbox", 0 ],
			"obj-5::obj-1::obj-24" : [ "Master Gain", "Master Gain", 0 ],
			"obj-5::obj-1::obj-62" : [ "live.text[6]", "live.text[3]", 0 ],
			"obj-5::obj-1::obj-1::obj-5" : [ "Preamp", "Preamp", 0 ],
			"obj-5::obj-1::obj-29::obj-48" : [ "live.menu[1]", "live.menu", 0 ],
			"obj-5::obj-1::obj-45" : [ "live.numbox", "live.numbox", 0 ],
			"obj-5::obj-1::obj-1::obj-42" : [ "live.text[1]", "live.text", 0 ],
			"obj-5::obj-1::obj-108" : [ "live.text[5]", "live.text[4]", 0 ],
			"obj-5::obj-1::obj-4" : [ "live.text[3]", "live.text[1]", 0 ],
			"obj-5::obj-1::obj-1::obj-12" : [ "Lookahead", "Lookahead", 0 ],
			"obj-5::obj-1::obj-48" : [ "live.menu[2]", "live.menu", 0 ],
			"obj-5::obj-1::obj-82" : [ "pan", "Pan", 0 ],
			"obj-5::obj-1::obj-1::obj-15" : [ "Postamp", "Postamp", 0 ],
			"obj-5::obj-1::obj-1::obj-13" : [ "Release", "Release", 0 ],
			"obj-5::obj-1::obj-74" : [ "live.dial[1]", "Transpose", 0 ],
			"obj-5::obj-1::obj-111" : [ "live.numbox[2]", "live.numbox[2]", 0 ],
			"obj-5::obj-1::obj-110" : [ "live.numbox[1]", "live.numbox[1]", 0 ],
			"obj-5::obj-1::obj-1::obj-6" : [ "live.text", "live.text", 0 ],
			"obj-5::obj-1::obj-1::obj-30" : [ "live.menu", "live.menu", 0 ],
			"obj-5::obj-1::obj-1::obj-45" : [ "live.text[2]", "live.text", 0 ],
			"obj-5::obj-1::obj-1::obj-27" : [ "Threshold", "Threshold", 0 ]
		}
,
		"dependency_cache" : [ 			{
				"name" : "input~.module.maxpat",
				"bootpath" : "/Users/nilspeters/Documents/gits/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/Sources/input~",
				"patcherrelativepath" : "../../stereo/Sources/input~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "input~.view.maxpat",
				"bootpath" : "/Users/nilspeters/Documents/gits/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/Sources/input~",
				"patcherrelativepath" : "../../stereo/Sources/input~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "limiter~.view.maxpat",
				"bootpath" : "/Users/nilspeters/Documents/gits/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/Dynamics/limiter~",
				"patcherrelativepath" : "../../stereo/Dynamics/limiter~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "input~.model.maxpat",
				"bootpath" : "/Users/nilspeters/Documents/gits/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/Sources/input~",
				"patcherrelativepath" : "../../stereo/Sources/input~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "limiter~.model.maxpat",
				"bootpath" : "/Users/nilspeters/Documents/gits/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/Dynamics/limiter~",
				"patcherrelativepath" : "../../stereo/Dynamics/limiter~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "limiter.parametersAndMessages.maxpat",
				"bootpath" : "/Users/nilspeters/Documents/gits/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/Dynamics/limiter~",
				"patcherrelativepath" : "../../stereo/Dynamics/limiter~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "thru.maxpat",
				"bootpath" : "/Applications/Max 6.1/patches/m4l-patches/Pluggo for Live resources/patches",
				"patcherrelativepath" : "../../../../../../../../../../../../../Applications/Max 6.1/patches/m4l-patches/Pluggo for Live resources/patches",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "balance~.model.maxpat",
				"bootpath" : "/Users/nilspeters/Documents/gits/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/Imaging/balance~",
				"patcherrelativepath" : "../../stereo/Imaging/balance~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "race=.module.maxpat",
				"bootpath" : "/Users/nilspeters/Documents/gits/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/surround/race=",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "race=.view.maxpat",
				"bootpath" : "/Users/nilspeters/Documents/gits/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/surround/race=",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "race=.model.maxpat",
				"bootpath" : "/Users/nilspeters/Documents/gits/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/surround/race=",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "pingpong.poly.maxpat",
				"bootpath" : "/Users/nilspeters/Documents/gits/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/surround/race=",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.maxhelpui.maxpat",
				"bootpath" : "/Users/nilspeters/Documents/gits/Jamoma/Implementations/Max/Jamoma/patchers/components/data/maxhelpui",
				"patcherrelativepath" : "../../../../components/data/maxhelpui",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.maxhelpuiButton.png",
				"bootpath" : "/Users/nilspeters/Documents/gits/Jamoma/Implementations/Max/Jamoma/patchers/components/data/maxhelpui",
				"patcherrelativepath" : "../../../../components/data/maxhelpui",
				"type" : "PNG ",
				"implicit" : 1
			}
, 			{
				"name" : "j.maxhelpuiResize.js",
				"bootpath" : "/Users/nilspeters/Documents/gits/Jamoma/Implementations/Max/Jamoma/patchers/components/data/maxhelpui",
				"patcherrelativepath" : "../../../../components/data/maxhelpui",
				"type" : "TEXT",
				"implicit" : 1
			}
, 			{
				"name" : "j.jamomaPath.maxpat",
				"bootpath" : "/Users/nilspeters/Documents/gits/Jamoma/Implementations/Max/Jamoma/patchers/components/data/jamomaPath",
				"patcherrelativepath" : "../../../../components/data/jamomaPath",
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
				"name" : "j.textslider.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.filter~.mxo",
				"type" : "iLaX"
			}
 ]
	}

}
