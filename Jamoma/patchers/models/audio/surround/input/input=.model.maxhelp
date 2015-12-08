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
		"rect" : [ 357.0, 79.0, 728.0, 755.0 ],
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
					"border" : 0,
					"filename" : "helpdetails.js",
					"id" : "obj-2",
					"ignoreclick" : 1,
					"jsarguments" : [ "input=.model" ],
					"maxclass" : "jsui",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 10.0, 10.0, 470.0, 110.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-3",
					"local" : 1,
					"maxclass" : "ezdac~",
					"numinlets" : 2,
					"numoutlets" : 0,
					"patching_rect" : [ 261.0, 585.0, 45.0, 45.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-1",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "signal", "signal", "" ],
					"patching_rect" : [ 261.0, 547.0, 95.0, 22.0 ],
					"style" : "",
					"text" : "j.unpack= 2"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-33",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 578.0, 579.0, 93.0, 33.0 ],
					"style" : "",
					"text" : "multichannel output"
				}

			}
, 			{
				"box" : 				{
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-31",
					"lockeddragscroll" : 0,
					"maxclass" : "bpatcher",
					"name" : "meters=.module.maxpat",
					"numinlets" : 2,
					"numoutlets" : 2,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "audio.connect", "" ],
					"patching_rect" : [ 261.0, 385.0, 300.0, 140.0 ],
					"presentation_rect" : [ 0.0, 0.0, 300.0, 140.0 ],
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-9",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 53.0, 489.0, 112.0, 20.0 ],
					"style" : "",
					"text" : "SoundFileMerger 2",
					"textcolor" : [ 0.4, 0.4, 0.8, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"handoff" : "",
					"id" : "obj-10",
					"maxclass" : "ubutton",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "bang", "bang", "", "int" ],
					"patching_rect" : [ 53.0, 489.0, 116.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"hidden" : 1,
					"id" : "obj-11",
					"linecount" : 3,
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 53.0, 528.0, 141.0, 49.0 ],
					"style" : "",
					"text" : ";\rmax launchbrowser http://www.e--j.com/"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-41",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 578.0, 445.0, 93.0, 20.0 ],
					"style" : "",
					"text" : "metering"
				}

			}
, 			{
				"box" : 				{
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-52",
					"lockeddragscroll" : 1,
					"maxclass" : "bpatcher",
					"name" : "input=.module.maxpat",
					"numinlets" : 0,
					"numoutlets" : 2,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "audio.connect", "" ],
					"patching_rect" : [ 261.0, 214.0, 300.0, 105.0 ],
					"presentation_rect" : [ 0.0, 0.0, 300.0, 105.0 ],
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-54",
					"linecount" : 3,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 49.0, 417.0, 165.0, 47.0 ],
					"style" : "",
					"text" : "to create multichannel audio files from mulitple monaural audio files, use e.g."
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
					"destination" : [ "obj-11", 0 ],
					"disabled" : 0,
					"hidden" : 1,
					"source" : [ "obj-10", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-31", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-31", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-52", 0 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-52::obj-1::obj-14" : [ "live.text[3]", "live.text[3]", 0 ],
			"obj-52::obj-1::obj-27::obj-9" : [ "live.numbox", "live.numbox", 0 ],
			"obj-52::obj-1::obj-13" : [ "live.numbox[4]", "live.numbox", 0 ],
			"obj-52::obj-1::obj-1" : [ "live.numbox[5]", "live.numbox", 0 ],
			"obj-52::obj-1::obj-27::obj-15" : [ "live.numbox[3]", "live.numbox", 0 ],
			"obj-52::obj-1::obj-27::obj-13" : [ "live.numbox[2]", "live.numbox", 0 ],
			"obj-52::obj-1::obj-27::obj-12" : [ "live.numbox[1]", "live.numbox", 0 ],
			"obj-52::obj-1::obj-16" : [ "live.text[7]", "live.text[3]", 0 ],
			"obj-52::obj-1::obj-18" : [ "live.text[1]", "live.text[1]", 0 ]
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
				"name" : "meters=.module.maxpat",
				"bootpath" : "~/dev/Jamoma/JamomaMax/Jamoma/patchers/modules/audio/surround/meters=",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "meters=.view.maxpat",
				"bootpath" : "~/dev/Jamoma/JamomaMax/Jamoma/patchers/modules/audio/surround/meters=",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "meters=.model.maxpat",
				"bootpath" : "~/dev/Jamoma/JamomaMax/Jamoma/patchers/modules/audio/surround/meters=",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "helpdetails.js",
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
				"name" : "j.remote_array.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.return_array.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.unpack=.mxo",
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
