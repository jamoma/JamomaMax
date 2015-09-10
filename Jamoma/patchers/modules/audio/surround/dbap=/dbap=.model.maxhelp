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
		"rect" : [ 34.0, 79.0, 1612.0, 933.0 ],
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
					"id" : "obj-11",
					"linecount" : 4,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 752.0, 158.0, 88.0, 60.0 ],
					"presentation_rect" : [ 797.149597, 209.0, 0.0, 0.0 ],
					"style" : "",
					"text" : "The below view can also be accessed from here",
					"textcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"arrows" : 1,
					"id" : "obj-7",
					"justification" : 4,
					"linecolor" : [ 0.450786, 0.49653, 0.528814, 1.0 ],
					"maxclass" : "live.line",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 700.649597, 183.8125, 44.850403, 24.1875 ],
					"presentation_rect" : [ 696.149597, 205.8125, 0.0, 0.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-20",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 291.149597, 500.0, 102.0, 33.0 ],
					"style" : "",
					"text" : "Click to set speaker weights",
					"textcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"arrows" : 2,
					"id" : "obj-16",
					"justification" : 3,
					"linecolor" : [ 0.450786, 0.49653, 0.528814, 1.0 ],
					"maxclass" : "live.line",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 330.149597, 536.8125, 98.850403, 59.1875 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-14",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 10.0, 93.0, 515.0, 20.0 ],
					"style" : "",
					"text" : "Spatialisation technique that works in situations where a \"sweet spot\" approach is not feasable.",
					"textcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-13",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 10.0, 71.0, 429.0, 20.0 ],
					"style" : "",
					"text" : "Distance-Based Amplitude Panning"
				}

			}
, 			{
				"box" : 				{
					"bubble" : 1,
					"bubbleside" : 2,
					"id" : "obj-10",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 616.5, 408.0, 169.0, 52.0 ],
					"style" : "",
					"text" : "Control source parameters specific to DBAP.",
					"textcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ],
					"textjustification" : 1
				}

			}
, 			{
				"box" : 				{
					"bubble" : 1,
					"bubbleside" : 2,
					"id" : "obj-9",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1217.5, 266.0, 171.0, 52.0 ],
					"style" : "",
					"text" : "Monitor and change positions of sources and speakers.",
					"textcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ],
					"textjustification" : 1
				}

			}
, 			{
				"box" : 				{
					"bubble" : 1,
					"bubbleside" : 2,
					"id" : "obj-8",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 471.5, 135.0, 159.0, 52.0 ],
					"style" : "",
					"text" : "View the most basic parameters of the renderer",
					"textcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ],
					"textjustification" : 1
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-6",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 0,
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 7,
							"minor" : 0,
							"revision" : 6,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"rect" : [ 0.0, 0.0, 640.0, 480.0 ],
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
						"boxes" : [ 							{
								"box" : 								{
									"id" : "obj-16",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 100.0, 139.0, 22.0 ],
									"style" : "",
									"text" : "j.initialized /mydbap 200"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-20",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 158.0, 130.0, 22.0 ],
									"style" : "",
									"text" : "j.send /mydbap/preset"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-19",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 130.0, 211.0, 22.0 ],
									"style" : "",
									"text" : "\"speaker rig 2D 16 channels 4x4 grid\""
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-19", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-16", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-20", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-19", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 45.5, 664.0, 80.0, 22.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"style" : "",
						"tags" : ""
					}
,
					"style" : "",
					"text" : "p intialisation"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-5",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 45.5, 809.0, 49.0, 22.0 ],
					"style" : "",
					"text" : "print ---"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-2",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 45.5, 777.0, 176.0, 22.0 ],
					"style" : "",
					"text" : "j.receive /mydbap/renderer/info"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-4",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 45.5, 716.0, 24.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-1",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 45.5, 748.0, 180.0, 22.0 ],
					"style" : "",
					"text" : "j.send /mydbap/renderer/getinfo"
				}

			}
, 			{
				"box" : 				{
					"annotation" : "none",
					"args" : [ "mydbap" ],
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-21",
					"lockeddragscroll" : 0,
					"maxclass" : "bpatcher",
					"name" : "dbap=_channels.view.maxpat",
					"numinlets" : 1,
					"numoutlets" : 1,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "" ],
					"patching_rect" : [ 401.0, 473.0, 600.0, 385.0 ],
					"presentation_rect" : [ 0.0, 0.0, 600.0, 385.0 ],
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-47",
					"local" : 1,
					"maxclass" : "ezdac~",
					"numinlets" : 2,
					"numoutlets" : 0,
					"patching_rect" : [ 45.5, 456.0, 45.0, 45.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-46",
					"maxclass" : "live.meter~",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "list" ],
					"patching_rect" : [ 231.896881, 332.0, 10.0, 96.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-45",
					"maxclass" : "live.meter~",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "list" ],
					"patching_rect" : [ 219.850418, 332.0, 10.0, 96.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-44",
					"maxclass" : "live.meter~",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "list" ],
					"patching_rect" : [ 207.803955, 332.0, 10.0, 96.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-43",
					"maxclass" : "live.meter~",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "list" ],
					"patching_rect" : [ 195.757507, 332.0, 10.0, 96.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-42",
					"maxclass" : "live.meter~",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "list" ],
					"patching_rect" : [ 183.711044, 332.0, 10.0, 96.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-41",
					"maxclass" : "live.meter~",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "list" ],
					"patching_rect" : [ 171.664581, 332.0, 10.0, 96.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-40",
					"maxclass" : "live.meter~",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "list" ],
					"patching_rect" : [ 159.618118, 332.0, 10.0, 96.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-39",
					"maxclass" : "live.meter~",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "list" ],
					"patching_rect" : [ 147.571686, 332.0, 10.0, 96.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-38",
					"maxclass" : "live.meter~",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "list" ],
					"patching_rect" : [ 135.525208, 332.0, 10.0, 96.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-37",
					"maxclass" : "live.meter~",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "list" ],
					"patching_rect" : [ 123.478752, 332.0, 10.0, 96.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-36",
					"maxclass" : "live.meter~",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "list" ],
					"patching_rect" : [ 111.432289, 332.0, 10.0, 96.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-35",
					"maxclass" : "live.meter~",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "list" ],
					"patching_rect" : [ 99.385841, 332.0, 10.0, 96.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-34",
					"maxclass" : "live.meter~",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "list" ],
					"patching_rect" : [ 87.339378, 332.0, 10.0, 96.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-33",
					"maxclass" : "live.meter~",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "list" ],
					"patching_rect" : [ 75.292923, 332.0, 10.0, 96.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-31",
					"maxclass" : "live.meter~",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "list" ],
					"patching_rect" : [ 63.24646, 332.0, 10.0, 96.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-29",
					"maxclass" : "live.meter~",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "list" ],
					"patching_rect" : [ 51.200001, 332.0, 10.0, 96.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-28",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 17,
					"outlettype" : [ "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "" ],
					"patching_rect" : [ 45.5, 266.0, 213.0, 22.0 ],
					"style" : "",
					"text" : "j.unpack= 16"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-27",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "audio.connect", "" ],
					"patching_rect" : [ 45.5, 196.0, 49.0, 22.0 ],
					"style" : "",
					"text" : "j.pack="
				}

			}
, 			{
				"box" : 				{
					"border" : 0,
					"filename" : "helpdetails.js",
					"id" : "obj-24",
					"ignoreclick" : 1,
					"jsarguments" : [ "dbap=.model" ],
					"maxclass" : "jsui",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 10.0, 10.0, 594.0, 59.0 ]
				}

			}
, 			{
				"box" : 				{
					"annotation" : "none",
					"args" : [ "mydbap" ],
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-18",
					"lockeddragscroll" : 0,
					"maxclass" : "bpatcher",
					"name" : "scene=.view.maxpat",
					"numinlets" : 1,
					"numoutlets" : 1,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "" ],
					"patching_rect" : [ 1077.0, 333.0, 450.0, 525.0 ],
					"presentation_rect" : [ 0.0, 0.0, 450.0, 525.0 ],
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-3",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 45.5, 154.0, 40.0, 22.0 ],
					"style" : "",
					"text" : "pink~"
				}

			}
, 			{
				"box" : 				{
					"annotation" : "none",
					"args" : [ "mydbap" ],
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-17",
					"lockeddragscroll" : 0,
					"maxclass" : "bpatcher",
					"name" : "dbap=.view.maxpat",
					"numinlets" : 1,
					"numoutlets" : 1,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "" ],
					"patching_rect" : [ 401.0, 196.0, 300.0, 70.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.0, 0.0, 300.0, 70.0 ],
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"annotation" : "Distance-based amplitude panning.",
					"id" : "obj-23",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "audio.connect", "" ],
					"patching_rect" : [ 45.5, 231.0, 127.0, 22.0 ],
					"style" : "",
					"text" : "dbap=.model mydbap"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-2", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-28", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-23", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-27", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-29", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-28", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-31", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-28", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-33", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-28", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-34", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-28", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-35", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-28", 4 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-36", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-28", 5 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-37", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-28", 6 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-38", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-28", 7 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-39", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-28", 8 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-40", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-28", 9 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-41", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-28", 10 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-42", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-28", 11 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-43", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-28", 12 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-44", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-28", 13 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-45", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-28", 14 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-46", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-28", 15 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-27", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-3", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-4", 0 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-17::obj-10::obj-17::obj-6::obj-8" : [ "live.text[6]", "live.text", 0 ],
			"obj-21::obj-17::obj-2::obj-6" : [ "Gain[10]", "Gain", 0 ],
			"obj-17::obj-2" : [ "live.numbox", "live.numbox", 0 ],
			"obj-17::obj-10::obj-17::obj-7::obj-8" : [ "live.text[7]", "live.text", 0 ],
			"obj-17::obj-10::obj-17::obj-4::obj-4" : [ "Blur[4]", "Blur", 0 ],
			"obj-21::obj-17::obj-6::obj-8" : [ "live.text[15]", "live.text", 0 ],
			"obj-21::obj-17::obj-3::obj-6" : [ "Gain[11]", "Gain", 0 ],
			"obj-21::obj-17::obj-4::obj-8" : [ "live.text[13]", "live.text", 0 ],
			"obj-17::obj-10::obj-17::obj-3::obj-6" : [ "Gain[3]", "Gain", 0 ],
			"obj-21::obj-3::obj-15" : [ "live.button[1]", "live.button", 0 ],
			"obj-17::obj-10::obj-17::obj-7::obj-4" : [ "Blur[7]", "Blur", 0 ],
			"obj-17::obj-10::obj-17::obj-2::obj-4" : [ "Blur[2]", "Blur", 0 ],
			"obj-17::obj-10::obj-17::obj-1::obj-8" : [ "live.text[1]", "live.text", 0 ],
			"obj-17::obj-3" : [ "live.numbox[1]", "live.numbox", 0 ],
			"obj-17::obj-10::obj-17::obj-4::obj-6" : [ "Gain[4]", "Gain", 0 ],
			"obj-21::obj-17::obj-6::obj-4" : [ "Blur[14]", "Blur", 0 ],
			"obj-21::obj-17::obj-1::obj-8" : [ "live.text[10]", "live.text", 0 ],
			"obj-21::obj-17::obj-3::obj-8" : [ "live.text[12]", "live.text", 0 ],
			"obj-21::obj-17::obj-7::obj-8" : [ "live.text[16]", "live.text", 0 ],
			"obj-21::obj-17::obj-8::obj-6" : [ "Gain[8]", "Gain", 0 ],
			"obj-21::obj-17::obj-2::obj-8" : [ "live.text[11]", "live.text", 0 ],
			"obj-21::obj-17::obj-5::obj-8" : [ "live.text[14]", "live.text", 0 ],
			"obj-17::obj-10::obj-17::obj-8::obj-4" : [ "Blur", "Blur", 0 ],
			"obj-17::obj-10::obj-17::obj-5::obj-4" : [ "Blur[5]", "Blur", 0 ],
			"obj-17::obj-10::obj-17::obj-3::obj-8" : [ "live.text[3]", "live.text", 0 ],
			"obj-17::obj-10::obj-17::obj-4::obj-8" : [ "live.text[4]", "live.text", 0 ],
			"obj-17::obj-10::obj-3::obj-16" : [ "live.text[8]", "live.text[8]", 0 ],
			"obj-21::obj-17::obj-1::obj-6" : [ "Gain[9]", "Gain", 0 ],
			"obj-17::obj-10::obj-17::obj-6::obj-6" : [ "Gain[6]", "Gain", 0 ],
			"obj-21::obj-17::obj-5::obj-6" : [ "Gain[13]", "Gain", 0 ],
			"obj-17::obj-10::obj-17::obj-2::obj-6" : [ "Gain[2]", "Gain", 0 ],
			"obj-21::obj-17::obj-8::obj-8" : [ "live.text[9]", "live.text", 0 ],
			"obj-17::obj-10::obj-17::obj-1::obj-4" : [ "Blur[1]", "Blur", 0 ],
			"obj-17::obj-4" : [ "live.numbox[2]", "live.numbox", 0 ],
			"obj-17::obj-10::obj-17::obj-8::obj-8" : [ "live.text", "live.text", 0 ],
			"obj-17::obj-10::obj-17::obj-6::obj-4" : [ "Blur[6]", "Blur", 0 ],
			"obj-21::obj-17::obj-5::obj-4" : [ "Blur[13]", "Blur", 0 ],
			"obj-21::obj-17::obj-8::obj-4" : [ "Blur[8]", "Blur", 0 ],
			"obj-17::obj-10::obj-17::obj-5::obj-8" : [ "live.text[5]", "live.text", 0 ],
			"obj-21::obj-17::obj-4::obj-4" : [ "Blur[12]", "Blur", 0 ],
			"obj-17::obj-10::obj-17::obj-8::obj-6" : [ "Gain", "Gain", 0 ],
			"obj-17::obj-10::obj-17::obj-5::obj-6" : [ "Gain[5]", "Gain", 0 ],
			"obj-17::obj-10::obj-3::obj-15" : [ "live.button", "live.button", 0 ],
			"obj-21::obj-17::obj-7::obj-4" : [ "Blur[15]", "Blur", 0 ],
			"obj-17::obj-10::obj-17::obj-3::obj-4" : [ "Blur[3]", "Blur", 0 ],
			"obj-21::obj-17::obj-1::obj-4" : [ "Blur[9]", "Blur", 0 ],
			"obj-17::obj-10::obj-17::obj-2::obj-8" : [ "live.text[2]", "live.text", 0 ],
			"obj-21::obj-17::obj-4::obj-6" : [ "Gain[12]", "Gain", 0 ],
			"obj-17::obj-10::obj-17::obj-7::obj-6" : [ "Gain[7]", "Gain", 0 ],
			"obj-21::obj-3::obj-16" : [ "live.text[17]", "live.text[8]", 0 ],
			"obj-21::obj-17::obj-2::obj-4" : [ "Blur[10]", "Blur", 0 ],
			"obj-21::obj-17::obj-7::obj-6" : [ "Gain[15]", "Gain", 0 ],
			"obj-21::obj-17::obj-3::obj-4" : [ "Blur[11]", "Blur", 0 ],
			"obj-21::obj-17::obj-6::obj-6" : [ "Gain[14]", "Gain", 0 ],
			"obj-17::obj-10::obj-17::obj-1::obj-6" : [ "Gain[1]", "Gain", 0 ],
			"obj-17::obj-5" : [ "live.numbox[3]", "live.numbox", 0 ]
		}
,
		"dependency_cache" : [ 			{
				"name" : "dbap=.model.maxpat",
				"bootpath" : "~/dev/Jamoma/JamomaMax/Jamoma/patchers/modules/audio/surround/dbap=",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "dbap=.view.maxpat",
				"bootpath" : "~/dev/Jamoma/JamomaMax/Jamoma/patchers/modules/audio/surround/dbap=",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "dbap=_channels.view.maxpat",
				"bootpath" : "~/dev/Jamoma/JamomaMax/Jamoma/patchers/modules/audio/surround/dbap=",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "dbap=_one_channel_display.maxpat",
				"bootpath" : "~/dev/Jamoma/JamomaMax/Jamoma/patchers/modules/audio/surround/dbap=",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "scene=.view.maxpat",
				"bootpath" : "~/dev/Jamoma/JamomaMax/Jamoma/patchers/modules/audio/surround/dbap=",
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
				"name" : "j.initialized.maxpat",
				"bootpath" : "~/dev/Jamoma/JamomaMax/Jamoma/patchers/components/data/initialized",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.dbap.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.mixer=.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.model.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.out~.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.parameter.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.parameter_array.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.unit.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.receive.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.return_array.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.message.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.return.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.remote.mxo",
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
				"name" : "j.savebang.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "ambimonitor.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.remote_array.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.send.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.pack=.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.unpack=.mxo",
				"type" : "iLaX"
			}
 ],
		"embedsnapshot" : 0
	}

}
