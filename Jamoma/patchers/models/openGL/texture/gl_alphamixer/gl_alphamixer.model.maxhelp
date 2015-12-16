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
		"rect" : [ 100.0, 100.0, 709.0, 440.0 ],
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
					"id" : "obj-1",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 2.0, 58.0, 387.0, 20.0 ],
					"style" : "",
					"text" : "A four layer slab-based video mixer using alpha channel for each layer."
				}

			}
, 			{
				"box" : 				{
					"border" : 0,
					"filename" : "helpdetails.js",
					"id" : "obj-9",
					"ignoreclick" : 1,
					"jsarguments" : [ "gl_alphamixer.model" ],
					"maxclass" : "jsui",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 2.0, 3.0, 450.0, 71.0 ]
				}

			}
, 			{
				"box" : 				{
					"clipheight" : 29.0,
					"data" : 					{
						"clips" : [ 							{
								"filename" : "garbage.mov",
								"filekind" : "moviefile",
								"loop" : 1,
								"content_state" : 								{
									"outputmode" : [ 1 ],
									"out_name" : [ "u219002656" ],
									"dim" : [ 1, 1 ],
									"time_secs" : [ 0.0 ],
									"drawto" : [ "" ],
									"usedstrect" : [ 0 ],
									"interp" : [ 0 ],
									"output_texture" : [ 0 ],
									"colormode" : [ "argb" ],
									"moviefile" : [ "" ],
									"dstrect" : [ 0, 0, 1, 1 ],
									"loopstart" : [ 0 ],
									"texture_name" : [ "u825002654" ],
									"position" : [ 0.0 ],
									"vol" : [ 1.0 ],
									"looppoints" : [ 0, 0 ],
									"adapt" : [ 1 ],
									"rate" : [ 1.0 ],
									"unique" : [ 0 ],
									"loopreport" : [ 0 ],
									"framereport" : [ 0 ],
									"usesrcrect" : [ 0 ],
									"time" : [ 0 ],
									"loopend" : [ 0 ],
									"autostart" : [ 1 ],
									"engine" : [ "avf" ],
									"automatic" : [ 0 ],
									"srcrect" : [ 0, 0, 1, 1 ]
								}

							}
 ]
					}
,
					"id" : "obj-14",
					"maxclass" : "jit.playlist",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "jit_matrix", "", "dictionary" ],
					"patching_rect" : [ 397.5, 184.0, 119.0, 30.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"clipheight" : 29.0,
					"data" : 					{
						"clips" : [ 							{
								"filename" : "countdown.mov",
								"filekind" : "moviefile",
								"loop" : 1,
								"content_state" : 								{
									"outputmode" : [ 1 ],
									"out_name" : [ "u219002656" ],
									"dim" : [ 1, 1 ],
									"time_secs" : [ 0.0 ],
									"drawto" : [ "" ],
									"usedstrect" : [ 0 ],
									"interp" : [ 0 ],
									"output_texture" : [ 0 ],
									"colormode" : [ "argb" ],
									"moviefile" : [ "" ],
									"dstrect" : [ 0, 0, 1, 1 ],
									"loopstart" : [ 0 ],
									"texture_name" : [ "u825002654" ],
									"position" : [ 0.0 ],
									"vol" : [ 1.0 ],
									"looppoints" : [ 0, 0 ],
									"adapt" : [ 1 ],
									"rate" : [ 1.0 ],
									"unique" : [ 0 ],
									"loopreport" : [ 0 ],
									"framereport" : [ 0 ],
									"usesrcrect" : [ 0 ],
									"time" : [ 0 ],
									"loopend" : [ 0 ],
									"autostart" : [ 1 ],
									"engine" : [ "avf" ],
									"automatic" : [ 0 ],
									"srcrect" : [ 0, 0, 1, 1 ]
								}

							}
 ]
					}
,
					"id" : "obj-8",
					"maxclass" : "jit.playlist",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "jit_matrix", "", "dictionary" ],
					"patching_rect" : [ 275.333344, 184.0, 119.0, 30.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"clipheight" : 29.0,
					"data" : 					{
						"clips" : [ 							{
								"filename" : "dishes.mov",
								"filekind" : "moviefile",
								"loop" : 1,
								"content_state" : 								{
									"outputmode" : [ 1 ],
									"out_name" : [ "u219002656" ],
									"dim" : [ 1, 1 ],
									"time_secs" : [ 0.0 ],
									"drawto" : [ "" ],
									"usedstrect" : [ 0 ],
									"interp" : [ 0 ],
									"output_texture" : [ 0 ],
									"colormode" : [ "argb" ],
									"moviefile" : [ "" ],
									"dstrect" : [ 0, 0, 1, 1 ],
									"loopstart" : [ 0 ],
									"texture_name" : [ "u825002654" ],
									"position" : [ 0.0 ],
									"vol" : [ 1.0 ],
									"looppoints" : [ 0, 0 ],
									"adapt" : [ 1 ],
									"rate" : [ 1.0 ],
									"unique" : [ 0 ],
									"loopreport" : [ 0 ],
									"framereport" : [ 0 ],
									"usesrcrect" : [ 0 ],
									"time" : [ 0 ],
									"loopend" : [ 0 ],
									"autostart" : [ 1 ],
									"engine" : [ "avf" ],
									"automatic" : [ 0 ],
									"srcrect" : [ 0, 0, 1, 1 ]
								}

							}
 ]
					}
,
					"id" : "obj-5",
					"maxclass" : "jit.playlist",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "jit_matrix", "", "dictionary" ],
					"patching_rect" : [ 149.666672, 184.0, 119.0, 30.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"clipheight" : 29.0,
					"data" : 					{
						"clips" : [ 							{
								"filename" : "dozer.mov",
								"filekind" : "moviefile",
								"loop" : 1,
								"content_state" : 								{
									"outputmode" : [ 1 ],
									"out_name" : [ "u219002656" ],
									"dim" : [ 1, 1 ],
									"time_secs" : [ 0.0 ],
									"drawto" : [ "" ],
									"usedstrect" : [ 0 ],
									"interp" : [ 0 ],
									"output_texture" : [ 0 ],
									"colormode" : [ "argb" ],
									"moviefile" : [ "" ],
									"dstrect" : [ 0, 0, 1, 1 ],
									"loopstart" : [ 0 ],
									"texture_name" : [ "u825002654" ],
									"position" : [ 0.0 ],
									"vol" : [ 1.0 ],
									"looppoints" : [ 0, 0 ],
									"adapt" : [ 1 ],
									"rate" : [ 1.0 ],
									"unique" : [ 0 ],
									"loopreport" : [ 0 ],
									"framereport" : [ 0 ],
									"usesrcrect" : [ 0 ],
									"time" : [ 0 ],
									"loopend" : [ 0 ],
									"autostart" : [ 1 ],
									"engine" : [ "avf" ],
									"automatic" : [ 0 ],
									"srcrect" : [ 0, 0, 1, 1 ]
								}

							}
 ]
					}
,
					"id" : "obj-3",
					"maxclass" : "jit.playlist",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "jit_matrix", "", "dictionary" ],
					"patching_rect" : [ 25.0, 184.0, 119.0, 30.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"bubble" : 1,
					"bubblepoint" : 0.2,
					"bubbleside" : 0,
					"fontname" : "Verdana",
					"fontsize" : 10.237986,
					"id" : "obj-49",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 416.0, 380.0, 256.0, 38.0 ],
					"style" : "",
					"text" : "Test out the alpha values. They control opacity."
				}

			}
, 			{
				"box" : 				{
					"annotation" : "4 channel slab-based mixer",
					"id" : "obj-18",
					"maxclass" : "newobj",
					"numinlets" : 4,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 25.0, 246.0, 183.0, 22.0 ],
					"style" : "",
					"text" : "gl_alphamixer.model alphamixer"
				}

			}
, 			{
				"box" : 				{
					"frozen_object_attributes" : 					{
						"floating" : 1,
						"windowposition" : [ 700, 65 ]
					}
,
					"id" : "obj-2",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "bang", "" ],
					"patching_rect" : [ 25.0, 140.0, 204.0, 22.0 ],
					"style" : "",
					"text" : "jit.world alphamixer_help @enable 1"
				}

			}
, 			{
				"box" : 				{
					"attr" : "enable",
					"id" : "obj-6",
					"maxclass" : "attrui",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 25.0, 109.0, 86.0, 22.0 ],
					"style" : "",
					"text_width" : 65.0
				}

			}
, 			{
				"box" : 				{
					"annotation" : "Apply incoming video matrix as texture to OpenGL videoplane.",
					"id" : "obj-15",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "jit_matrix", "" ],
					"patching_rect" : [ 25.0, 401.0, 93.0, 22.0 ],
					"style" : "",
					"text" : "jit.gl.videoplane"
				}

			}
, 			{
				"box" : 				{
					"annotation" : "none",
					"args" : [ "alphamixer" ],
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-12",
					"lockeddragscroll" : 1,
					"maxclass" : "bpatcher",
					"name" : "gl_alphamixer.view.maxpat",
					"numinlets" : 1,
					"numoutlets" : 1,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "" ],
					"patching_rect" : [ 234.5, 246.0, 300.0, 140.0 ],
					"presentation_rect" : [ 0.0, 0.0, 300.0, 140.0 ],
					"viewvisibility" : 1
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-18", 3 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 407.0, 237.0, 198.5, 237.0 ],
					"source" : [ "obj-14", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-18", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-18", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-3", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-18", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 159.166672, 223.0, 89.166664, 223.0 ],
					"source" : [ "obj-5", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-6", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-18", 2 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 284.833344, 230.0, 143.833328, 230.0 ],
					"source" : [ "obj-8", 0 ]
				}

			}
 ],
		"dependency_cache" : [ 			{
				"name" : "gl_alphamixer.view.maxpat",
				"bootpath" : "~/Documents/GITHUB/JamomaMax/Jamoma/patchers/models/openGL/texture/gl_alphamixer",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.list2parameter.maxpat",
				"bootpath" : "~/Documents/GITHUB/JamomaMax/Jamoma/patchers/components/data/list2parameter",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.gl_group_slab.panel.maxpat",
				"bootpath" : "~/Documents/GITHUB/JamomaMax/Jamoma/patchers/components/openGL",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.gl_group_slab.view.maxpat",
				"bootpath" : "~/Documents/GITHUB/JamomaMax/Jamoma/patchers/components/openGL",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "gl_alphamixer.model.maxpat",
				"bootpath" : "~/Documents/GITHUB/JamomaMax/Jamoma/patchers/models/openGL/texture/gl_alphamixer",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.gl_group_slab.model.maxpat",
				"bootpath" : "~/Documents/GITHUB/JamomaMax/Jamoma/patchers/components/openGL",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "dozer.mov",
				"bootpath" : "C74:/media/jitter",
				"type" : "MooV",
				"implicit" : 1
			}
, 			{
				"name" : "dishes.mov",
				"bootpath" : "C74:/media/jitter",
				"type" : "MooV",
				"implicit" : 1
			}
, 			{
				"name" : "countdown.mov",
				"bootpath" : "C74:/media/jitter",
				"type" : "MooV",
				"implicit" : 1
			}
, 			{
				"name" : "garbage.mov",
				"bootpath" : "C74:/media/jitter",
				"type" : "MooV",
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
				"name" : "j.receive.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.parameter.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.in.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.out.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.model.mxo",
				"type" : "iLaX"
			}
 ],
		"autosave" : 0
	}

}
