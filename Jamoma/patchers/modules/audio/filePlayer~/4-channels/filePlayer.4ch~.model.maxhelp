{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 6,
			"minor" : 1,
			"revision" : 5,
			"architecture" : "x86"
		}
,
		"rect" : [ 25.0, 69.0, 665.0, 668.0 ],
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
					"args" : [ "output~" ],
					"id" : "obj-3",
					"maxclass" : "bpatcher",
					"name" : "sur.output~.module.maxpat",
					"numinlets" : 0,
					"numoutlets" : 0,
					"patching_rect" : [ 57.0, 270.0, 300.0, 70.0 ],
					"presentation_rect" : [ 0.0, 0.0, 300.0, 70.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frgb" : 0.0,
					"id" : "obj-8",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 51.0, 613.0, 424.0, 33.0 ],
					"text" : "This module is available in mono, stereo and 4 channel (ambisonic) versions. The 4-channel version has AudioGraph multicable sound output."
				}

			}
, 			{
				"box" : 				{
					"bubble" : 1,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frgb" : 0.0,
					"id" : "obj-5",
					"linecount" : 7,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 368.0, 467.0, 277.0, 104.0 ],
					"text" : "The cue script illustrates how sound files might be preloaded, and then triggered later on.\n\nThe benefit of this as compared to loading the sound file at the same time that it is to start playing, is that we avoid latency at playback start due to disk seek times."
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-6",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 57.0, 454.0, 199.0, 18.0 ],
					"text" : "/loadScript j.filePlayer-demo.txt"
				}

			}
, 			{
				"box" : 				{
					"args" : [ "cueScript" ],
					"bgmode" : 1,
					"id" : "obj-4",
					"maxclass" : "bpatcher",
					"name" : "cueScript.module.maxpat",
					"numinlets" : 0,
					"numoutlets" : 0,
					"patching_rect" : [ 57.0, 484.0, 300.0, 70.0 ],
					"presentation_rect" : [ 183.0, 520.0, 300.0, 70.0 ]
				}

			}
, 			{
				"box" : 				{
					"args" : [ "@name", "filePlayer.4ch~", "@description", "Playback of 4 channel (ambisonic) sound files with preloading of files to play." ],
					"bgmode" : 1,
					"id" : "obj-2",
					"maxclass" : "bpatcher",
					"name" : "j.maxhelpui.maxpat",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 0.0, 0.0, 665.0, 70.0 ],
					"varname" : "maxhelpui"
				}

			}
, 			{
				"box" : 				{
					"args" : [ "filePlayer" ],
					"id" : "obj-1",
					"maxclass" : "bpatcher",
					"name" : "filePlayer.4ch~.module.maxpat",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "audio.connect" ],
					"patching_rect" : [ 57.0, 108.0, 300.0, 140.0 ],
					"presentation_rect" : [ 0.0, 0.0, 300.0, 140.0 ]
				}

			}
 ],
		"lines" : [  ],
		"dependency_cache" : [ 			{
				"name" : "filePlayer.4ch~.module.maxpat",
				"bootpath" : "/Users/tumble/dev/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/filePlayer~",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "filePlayer~.view.maxpat",
				"bootpath" : "/Users/tumble/dev/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/filePlayer~",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "filePlayer.4ch~.model.maxpat",
				"bootpath" : "/Users/tumble/dev/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/filePlayer~",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "filePlayer.algorithm.maxpat",
				"bootpath" : "/Users/tumble/dev/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/filePlayer~",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.maxhelpui.maxpat",
				"bootpath" : "/Users/tumble/dev/Jamoma/Implementations/Max/Jamoma/patchers/components/maxhelpui",
				"patcherrelativepath" : "../../../components/maxhelpui",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.maxhelpuiButton.png",
				"bootpath" : "/Users/tumble/dev/Jamoma/Implementations/Max/Jamoma/patchers/components/maxhelpui",
				"patcherrelativepath" : "../../../components/maxhelpui",
				"type" : "PNG ",
				"implicit" : 1
			}
, 			{
				"name" : "j.maxhelpuiResize.js",
				"bootpath" : "/Users/tumble/dev/Jamoma/Implementations/Max/Jamoma/patchers/components/maxhelpui",
				"patcherrelativepath" : "../../../components/maxhelpui",
				"type" : "TEXT",
				"implicit" : 1
			}
, 			{
				"name" : "j.jamomaPath.maxpat",
				"bootpath" : "/Users/tumble/dev/Jamoma/Implementations/Max/Jamoma/patchers/components/jamomaPath",
				"patcherrelativepath" : "../../../components/jamomaPath",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.remote.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.ui.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.textslider.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.savebang.mxo",
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
, 			{
				"name" : "j.receive.mxo",
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
				"name" : "j.message.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.parameter.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.init.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.out~.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.pack≈.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.route.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.send.mxo",
				"type" : "iLaX"
			}
 ]
	}

}
