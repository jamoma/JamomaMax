{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 7,
			"minor" : 0,
			"revision" : 5,
			"architecture" : "x86",
			"modernui" : 1
		}
,
		"rect" : [ 353.0, 97.0, 404.0, 468.0 ],
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
		"toolbarvisible" : 0,
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
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-8",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 29.0, 6.0, 291.0, 20.0 ],
					"style" : "",
					"text" : "this model can instanciate any model multiple times"
				}

			}
, 			{
				"box" : 				{
					"bubble" : 1,
					"bubbleside" : 3,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-6",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 4.0, 47.5, 61.0, 37.0 ],
					"style" : "",
					"text" : "recall preset"
				}

			}
, 			{
				"box" : 				{
					"annotation" : "none",
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-4",
					"lockeddragscroll" : 0,
					"maxclass" : "bpatcher",
					"name" : "multiModel.module.maxpat",
					"numinlets" : 1,
					"numoutlets" : 1,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "" ],
					"patching_rect" : [ 73.0, 58.0, 300.0, 315.0 ],
					"presentation_rect" : [ 0.0, 0.0, 300.0, 315.0 ],
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
					"lockeddragscroll" : 0,
					"maxclass" : "bpatcher",
					"name" : "degrade~.module.maxpat",
					"numinlets" : 2,
					"numoutlets" : 3,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "signal", "signal", "" ],
					"patching_rect" : [ 237.5, 384.0, 150.0, 70.0 ],
					"presentation_rect" : [ 318.0, 251.0, 150.0, 70.0 ],
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
					"id" : "obj-2",
					"lockeddragscroll" : 0,
					"maxclass" : "bpatcher",
					"name" : "mouse.module.maxpat",
					"numinlets" : 1,
					"numoutlets" : 1,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "" ],
					"patching_rect" : [ 73.0, 384.0, 150.0, 70.0 ],
					"presentation_rect" : [ 15.0, 15.0, 150.0, 70.0 ],
					"viewvisibility" : 1
				}

			}
 ],
		"lines" : [  ],
		"parameters" : 		{
			"obj-4::obj-4::obj-30::obj-93::obj-8" : [ "live.text[19]", "live.text", 0 ],
			"obj-4::obj-4::obj-13" : [ "live.text[2]", "live.text", 0 ],
			"obj-4::obj-4::obj-30::obj-93::obj-82::obj-50" : [ "live.text[21]", "live.text[1]", 0 ],
			"obj-3::obj-1::obj-13" : [ "live.dial", "Sample rate", 0 ],
			"obj-4::obj-4::obj-30::obj-93::obj-21" : [ "live.text[18]", "live.text", 0 ],
			"obj-3::obj-1::obj-14" : [ "live.dial[1]", "Bit depth", 0 ],
			"obj-4::obj-4::obj-30::obj-93::obj-82::obj-54" : [ "live.text[20]", "live.text[1]", 0 ]
		}
,
		"dependency_cache" : [ 			{
				"name" : "mouse.module.maxpat",
				"bootpath" : "~/Documents/GITHUB/JamomaMax/Jamoma/patchers/modules/data/mouse",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "mouse.model.maxpat",
				"bootpath" : "~/Documents/GITHUB/JamomaMax/Jamoma/patchers/modules/data/mouse",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "mouse.view.maxpat",
				"bootpath" : "~/Documents/GITHUB/JamomaMax/Jamoma/patchers/modules/data/mouse",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "degrade~.module.maxpat",
				"bootpath" : "~/Documents/GITHUB/JamomaMax/Jamoma/patchers/modules/audio/stereo/Distortion/degrade~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "degrade~.model.maxpat",
				"bootpath" : "~/Documents/GITHUB/JamomaMax/Jamoma/patchers/modules/audio/stereo/Distortion/degrade~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "degrade~.view.maxpat",
				"bootpath" : "~/Documents/GITHUB/JamomaMax/Jamoma/patchers/modules/audio/stereo/Distortion/degrade~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "multiModel.module.maxpat",
				"bootpath" : "~/Documents/GITHUB/JamomaMax/Jamoma/patchers/modules/data/multiModel",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "multiModel.model.maxpat",
				"bootpath" : "~/Documents/GITHUB/JamomaMax/Jamoma/patchers/modules/data/multiModel",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "multiModel.view.maxpat",
				"bootpath" : "~/Documents/GITHUB/JamomaMax/Jamoma/patchers/modules/data/multiModel",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "mapper.view.maxpat",
				"bootpath" : "~/Documents/GITHUB/JamomaMax/Jamoma/patchers/modules/data/mapper",
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
				"name" : "j.function_generic.maxpat",
				"bootpath" : "~/Documents/GITHUB/JamomaMax/Jamoma/patchers/modules/data/mapper/function_options",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.namespacebrowser.view.maxpat",
				"bootpath" : "~/Documents/GITHUB/JamomaMax/Jamoma/patchers/components/namespace/namespacebrowser",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.get_onscreen_position.js",
				"bootpath" : "~/Documents/GITHUB/JamomaMax/Jamoma/javascript",
				"type" : "TEXT",
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
				"name" : "j.remote_array.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.map.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.send.mxo",
				"type" : "iLaX"
			}
 ],
		"embedsnapshot" : 0
	}

}