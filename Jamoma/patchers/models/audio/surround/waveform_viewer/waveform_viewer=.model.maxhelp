{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 7,
			"minor" : 0,
			"revision" : 6,
			"architecture" : "x64",
			"modernui" : 1
		}
,
		"rect" : [ 231.0, 79.0, 660.0, 739.0 ],
		"bglocked" : 0,
		"openinpresentation" : 0,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
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
					"id" : "obj-10",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 372.0, 368.0, 229.0, 22.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 14.0,
					"id" : "obj-8",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 10.0, 85.0, 286.0, 22.0 ],
					"style" : "",
					"text" : "Multichannel audio signal visualisation",
					"textcolor" : [ 0.239216, 0.254902, 0.278431, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"border" : 0,
					"filename" : "helpname.js",
					"id" : "obj-6",
					"ignoreclick" : 1,
					"jsarguments" : [ "waveform_viewer=.model" ],
					"maxclass" : "jsui",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 10.0, 10.0, 548.144409, 57.567627 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-4",
					"local" : 1,
					"maxclass" : "ezdac~",
					"numinlets" : 2,
					"numoutlets" : 0,
					"patching_rect" : [ 101.5, 669.0, 45.0, 45.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-2",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "signal", "signal", "" ],
					"patching_rect" : [ 101.0, 637.0, 72.0, 22.0 ],
					"style" : "",
					"text" : "j.unpack= 2"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-5",
					"maxclass" : "jit.pwindow",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 206.0, 419.0, 320.0, 240.0 ]
				}

			}
, 			{
				"box" : 				{
					"annotation" : "Display waveform of real-time multi-channel signal as jitter matrix.",
					"args" : [ "waveformViewer" ],
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-3",
					"lockeddragscroll" : 0,
					"maxclass" : "bpatcher",
					"name" : "waveform_viewer=.module.maxpat",
					"numinlets" : 1,
					"numoutlets" : 2,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "jit_matrix", "" ],
					"patching_rect" : [ 206.0, 309.0, 150.0, 70.0 ],
					"presentation_rect" : [ 294.0, 237.0, 150.0, 70.0 ],
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"annotation" : "Playback of multichannel audiofiles based on sfplay~",
					"args" : [ "multichannelPlayback" ],
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-1",
					"lockeddragscroll" : 0,
					"maxclass" : "bpatcher",
					"name" : "input=.module.maxpat",
					"numinlets" : 0,
					"numoutlets" : 2,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "audio.connect", "" ],
					"patching_rect" : [ 101.0, 168.0, 300.0, 105.0 ],
					"presentation_rect" : [ 0.0, 0.0, 300.0, 105.0 ],
					"viewvisibility" : 1
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-1", 0 ]
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
					"destination" : [ "obj-4", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-2", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-2", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-3", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 215.5, 408.0, 215.5, 408.0 ],
					"source" : [ "obj-3", 0 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-3::obj-1::obj-5" : [ "live.numbox[6]", "live.numbox", 0 ],
			"obj-1::obj-1::obj-27::obj-9" : [ "live.numbox", "live.numbox", 0 ],
			"obj-1::obj-1::obj-27::obj-12" : [ "live.numbox[1]", "live.numbox", 0 ],
			"obj-1::obj-1::obj-16" : [ "live.text[7]", "live.text[3]", 0 ],
			"obj-1::obj-1::obj-13" : [ "live.numbox[4]", "live.numbox", 0 ],
			"obj-3::obj-1::obj-7" : [ "live.text", "live.text", 0 ],
			"obj-1::obj-1::obj-1" : [ "live.numbox[5]", "live.numbox", 0 ],
			"obj-1::obj-1::obj-27::obj-13" : [ "live.numbox[2]", "live.numbox", 0 ],
			"obj-1::obj-1::obj-27::obj-15" : [ "live.numbox[3]", "live.numbox", 0 ],
			"obj-1::obj-1::obj-18" : [ "live.text[1]", "live.text[1]", 0 ],
			"obj-1::obj-1::obj-14" : [ "live.text[3]", "live.text[3]", 0 ]
		}
,
		"dependency_cache" : [ 			{
				"name" : "input=.module.maxpat",
				"bootpath" : "~/dev/Jamoma/JamomaMax/Jamoma/patchers/modules/audio/surround/input=",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "input=.view.maxpat",
				"bootpath" : "~/dev/Jamoma/JamomaMax/Jamoma/patchers/modules/audio/surround/input=",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "input.timeDisplay.maxpat",
				"bootpath" : "~/dev/Jamoma/JamomaMax/Jamoma/patchers/modules/audio/surround/input=",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.playbutton.svg",
				"bootpath" : "~/dev/Jamoma/JamomaMax/Jamoma/media/playbar-icons",
				"type" : "svg ",
				"implicit" : 1
			}
, 			{
				"name" : "j.pausebutton.svg",
				"bootpath" : "~/dev/Jamoma/JamomaMax/Jamoma/media/playbar-icons",
				"type" : "svg ",
				"implicit" : 1
			}
, 			{
				"name" : "j.truncate_string.js",
				"bootpath" : "~/dev/Jamoma/JamomaMax/Jamoma/javascript",
				"type" : "TEXT",
				"implicit" : 1
			}
, 			{
				"name" : "input=.model.maxpat",
				"bootpath" : "~/dev/Jamoma/JamomaMax/Jamoma/patchers/modules/audio/surround/input=",
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
				"name" : "waveform_viewer=.module.maxpat",
				"bootpath" : "~/dev/Jamoma/JamomaMax/Jamoma/patchers/modules/audio/surround/waveform_viewer",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "waveform_viewer=.model.maxpat",
				"bootpath" : "~/dev/Jamoma/JamomaMax/Jamoma/patchers/modules/audio/surround/waveform_viewer",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "waveform_viewer=.view.maxpat",
				"bootpath" : "~/dev/Jamoma/JamomaMax/Jamoma/patchers/modules/audio/surround/waveform_viewer",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "helpname.js",
				"bootpath" : "C74:/help/resources",
				"type" : "TEXT",
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
				"name" : "j.textslider.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.receive.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.pack=.mxo",
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
				"name" : "j.init.mxo",
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
				"name" : "j.gain=.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.out~.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.unpack=.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.op=.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.info=.mxo",
				"type" : "iLaX"
			}
 ],
		"embedsnapshot" : 0
	}

}
