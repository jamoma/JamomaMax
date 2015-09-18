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
		"rect" : [ 100.0, 128.0, 529.0, 795.0 ],
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
		"showrootpatcherontab" : 0,
		"showontab" : 0,
		"boxes" : [ 			{
				"box" : 				{
					"id" : "obj-7",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 0,
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 7,
							"minor" : 0,
							"revision" : 5,
							"architecture" : "x86",
							"modernui" : 1
						}
,
						"rect" : [ 0.0, 26.0, 529.0, 769.0 ],
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
						"showontab" : 1,
						"boxes" : [ 							{
								"box" : 								{
									"id" : "obj-6",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 68.0, 21.0, 330.0, 20.0 ],
									"style" : "",
									"text" : "several alternative views can be bound to the same model: "
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-8",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 23.5, 265.0, 443.0, 20.0 ],
									"style" : "",
									"text" : "the large view contained in the view above can also be displayed as a standalone"
								}

							}
, 							{
								"box" : 								{
									"annotation" : "none",
									"args" : [ "eq" ],
									"bgmode" : 0,
									"border" : 0,
									"clickthrough" : 0,
									"enablehscroll" : 0,
									"enablevscroll" : 0,
									"id" : "obj-7",
									"lockeddragscroll" : 0,
									"maxclass" : "bpatcher",
									"name" : "equalizer~.view.large.maxpat",
									"numinlets" : 1,
									"numoutlets" : 1,
									"offset" : [ 0.0, 0.0 ],
									"outlettype" : [ "" ],
									"patching_rect" : [ 20.0, 294.0, 450.0, 420.0 ],
									"presentation_rect" : [ 67.0, 216.0, 450.0, 420.0 ],
									"viewvisibility" : 1
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-5",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 197.0, 374.0, 20.0 ],
									"style" : "",
									"text" : "http://jamoma.org/publications/attachments/icmcsmc2014-demo.pdf "
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-4",
									"linecount" : 7,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 298.0, 95.0, 130.0, 100.0 ],
									"style" : "",
									"text" : "looking into this view (or the default one), you can notice that it contains nested views binding the equalizer~ model or its filter submodels, see:"
								}

							}
, 							{
								"box" : 								{
									"annotation" : "none",
									"args" : [ "eq" ],
									"bgmode" : 0,
									"border" : 0,
									"clickthrough" : 0,
									"enablehscroll" : 0,
									"enablevscroll" : 0,
									"id" : "obj-1",
									"lockeddragscroll" : 0,
									"maxclass" : "bpatcher",
									"name" : "equalizer~.view.small.maxpat",
									"numinlets" : 1,
									"numoutlets" : 1,
									"offset" : [ 0.0, 0.0 ],
									"outlettype" : [ "" ],
									"patching_rect" : [ 44.0, 82.0, 150.0, 105.0 ],
									"presentation_rect" : [ 75.0, 75.0, 150.0, 105.0 ],
									"viewvisibility" : 1
								}

							}
 ],
						"lines" : [  ]
					}
,
					"patching_rect" : [ 36.5, 125.0, 121.0, 22.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"style" : "",
						"tags" : ""
					}
,
					"style" : "",
					"text" : "p alternative_views"
				}

			}
, 			{
				"box" : 				{
					"border" : 0,
					"filename" : "helpname.js",
					"id" : "obj-4",
					"ignoreclick" : 1,
					"jsarguments" : [ "10harmonics~.model" ],
					"maxclass" : "jsui",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 10.0, 10.0, 446.951355, 57.567627 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-1",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 525.0, 468.0, 127.0, 22.0 ],
					"saved_object_attributes" : 					{
						"filename" : "helpstarter.js",
						"parameter_enable" : 0
					}
,
					"style" : "",
					"text" : "js helpstarter.js jit.bfg"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-2",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 0,
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 7,
							"minor" : 0,
							"revision" : 5,
							"architecture" : "x86",
							"modernui" : 1
						}
,
						"rect" : [ 100.0, 154.0, 529.0, 769.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 13.0,
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
						"showontab" : 1,
						"boxes" : [ 							{
								"box" : 								{
									"annotation" : "A generic audio output model with built in master saturation, limiter, and recording abilities.",
									"id" : "obj-5",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 24.0, 512.0, 119.0, 23.0 ],
									"style" : "",
									"text" : "output~.model"
								}

							}
, 							{
								"box" : 								{
									"annotation" : "none",
									"bgmode" : 0,
									"border" : 0,
									"clickthrough" : 0,
									"enablehscroll" : 0,
									"enablevscroll" : 0,
									"id" : "obj-6",
									"lockeddragscroll" : 0,
									"maxclass" : "bpatcher",
									"name" : "output~.view.maxpat",
									"numinlets" : 1,
									"numoutlets" : 1,
									"offset" : [ 0.0, 0.0 ],
									"outlettype" : [ "" ],
									"patching_rect" : [ 188.0, 512.0, 300.0, 175.0 ],
									"presentation_rect" : [ 381.0, 497.0, 300.0, 175.0 ],
									"viewvisibility" : 1
								}

							}
, 							{
								"box" : 								{
									"annotation" : "none",
									"id" : "obj-3",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "signal", "signal", "" ],
									"patching_rect" : [ 24.0, 107.0, 119.0, 23.0 ],
									"style" : "",
									"text" : "input~.model"
								}

							}
, 							{
								"box" : 								{
									"border" : 0,
									"filename" : "helpdetails.js",
									"id" : "obj-4",
									"ignoreclick" : 1,
									"jsarguments" : [ "equalizer~.model" ],
									"maxclass" : "jsui",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 10.0, 10.0, 433.0, 79.0 ]
								}

							}
, 							{
								"box" : 								{
									"annotation" : "none",
									"bgmode" : 0,
									"border" : 0,
									"clickthrough" : 0,
									"enablehscroll" : 0,
									"enablevscroll" : 0,
									"id" : "obj-13",
									"lockeddragscroll" : 0,
									"maxclass" : "bpatcher",
									"name" : "input~.view.maxpat",
									"numinlets" : 1,
									"numoutlets" : 1,
									"offset" : [ 0.0, 0.0 ],
									"outlettype" : [ "" ],
									"patching_rect" : [ 188.0, 107.0, 300.0, 175.0 ],
									"presentation_rect" : [ 15.0, 15.0, 300.0, 175.0 ],
									"viewvisibility" : 1
								}

							}
, 							{
								"box" : 								{
									"annotation" : "none",
									"args" : [ "eq" ],
									"bgmode" : 0,
									"border" : 0,
									"clickthrough" : 0,
									"enablehscroll" : 0,
									"enablevscroll" : 0,
									"id" : "obj-1",
									"lockeddragscroll" : 0,
									"maxclass" : "bpatcher",
									"name" : "equalizer~.view.maxpat",
									"numinlets" : 1,
									"numoutlets" : 1,
									"offset" : [ 0.0, 0.0 ],
									"outlettype" : [ "" ],
									"patching_rect" : [ 188.0, 347.5, 300.0, 105.0 ],
									"presentation_rect" : [ 75.0, 75.0, 300.0, 105.0 ],
									"viewvisibility" : 1
								}

							}
, 							{
								"box" : 								{
									"annotation" : "none",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-2",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 3,
									"outlettype" : [ "signal", "signal", "" ],
									"patching_rect" : [ 24.0, 347.5, 119.0, 22.0 ],
									"style" : "",
									"text" : "equalizer~.model eq"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 1 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-2", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-2", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-2", 1 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-3", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-2", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-3", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 10.0, 85.0, 50.0, 22.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"fontsize" : 13.0,
						"globalpatchername" : "",
						"style" : "",
						"tags" : ""
					}
,
					"style" : "",
					"text" : "p basic",
					"varname" : "basic_tab"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-3",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 0,
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 7,
							"minor" : 0,
							"revision" : 5,
							"architecture" : "x86",
							"modernui" : 1
						}
,
						"rect" : [ 0.0, 26.0, 529.0, 769.0 ],
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
						"showontab" : 1,
						"boxes" : [  ],
						"lines" : [  ]
					}
,
					"patching_rect" : [ 169.0, 290.0, 50.0, 22.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"style" : "",
						"tags" : ""
					}
,
					"style" : "",
					"text" : "p ?",
					"varname" : "q_tab"
				}

			}
 ],
		"lines" : [  ],
		"parameters" : 		{
			"obj-2::obj-1::obj-5::obj-19" : [ "live.numbox", "live.numbox", 0 ],
			"obj-2::obj-1::obj-5::obj-46" : [ "live.text[1]", "live.text", 0 ],
			"obj-2::obj-13::obj-1::obj-13" : [ "Release", "Release", 0 ],
			"obj-2::obj-13::obj-47" : [ "live.numbox[6]", "live.numbox", 0 ],
			"obj-2::obj-13::obj-1::obj-12" : [ "Lookahead", "Lookahead", 0 ],
			"obj-7::obj-7::obj-9" : [ "live.menu[8]", "live.menu", 0 ],
			"obj-2::obj-6::obj-108" : [ "live.text[18]", "live.text[4]", 0 ],
			"obj-2::obj-13::obj-1::obj-6" : [ "live.text[5]", "live.text", 0 ],
			"obj-2::obj-13::obj-29::obj-48" : [ "live.menu[1]", "live.menu", 0 ],
			"obj-7::obj-7::obj-46" : [ "live.text[23]", "live.text", 0 ],
			"obj-2::obj-13::obj-108" : [ "live.text[9]", "live.text[4]", 0 ],
			"obj-2::obj-6::obj-12::obj-13" : [ "Release[1]", "Release", 0 ],
			"obj-2::obj-6::obj-100" : [ "live.text[16]", "live.text[1]", 0 ],
			"obj-7::obj-7::obj-6" : [ "live.numbox[17]", "live.numbox[4]", 0 ],
			"obj-2::obj-6::obj-12::obj-5" : [ "Preamp[1]", "Preamp", 0 ],
			"obj-7::obj-1::obj-5::obj-45" : [ "live.text[20]", "live.text", 0 ],
			"obj-2::obj-13::obj-1::obj-45" : [ "live.text[3]", "live.text", 0 ],
			"obj-7::obj-1::obj-5::obj-46" : [ "live.text[22]", "live.text", 0 ],
			"obj-2::obj-1::obj-5::obj-17" : [ "live.numbox[5]", "live.numbox", 0 ],
			"obj-7::obj-7::obj-27" : [ "live.text[25]", "live.text[2]", 0 ],
			"obj-2::obj-13::obj-59" : [ "live.text[8]", "live.text[3]", 0 ],
			"obj-2::obj-6::obj-12::obj-45" : [ "live.text[13]", "live.text", 0 ],
			"obj-2::obj-6::obj-90" : [ "live.text[15]", "live.text[1]", 0 ],
			"obj-2::obj-6::obj-98" : [ "live.menu[5]", "live.menu", 0 ],
			"obj-2::obj-6::obj-111" : [ "live.numbox[9]", "live.numbox[2]", 0 ],
			"obj-2::obj-6::obj-12::obj-12" : [ "Lookahead[1]", "Lookahead", 0 ],
			"obj-2::obj-13::obj-74" : [ "live.dial[1]", "Transpose", 0 ],
			"obj-2::obj-6::obj-107" : [ "live.dial[4]", "Preamp", 0 ],
			"obj-2::obj-6::obj-102" : [ "live.text[17]", "live.text", 0 ],
			"obj-2::obj-1::obj-5::obj-6" : [ "live.numbox[4]", "live.numbox[4]", 0 ],
			"obj-2::obj-13::obj-111" : [ "live.numbox[3]", "live.numbox[2]", 0 ],
			"obj-2::obj-6::obj-106" : [ "live.dial[3]", "Release", 0 ],
			"obj-2::obj-1::obj-5::obj-7" : [ "live.numbox[2]", "live.numbox", 0 ],
			"obj-2::obj-13::obj-110" : [ "live.numbox[1]", "live.numbox[1]", 0 ],
			"obj-7::obj-7::obj-19" : [ "live.numbox[15]", "live.numbox", 0 ],
			"obj-2::obj-6::obj-99" : [ "live.menu[6]", "live.menu[2]", 0 ],
			"obj-7::obj-1::obj-5::obj-19" : [ "live.numbox[11]", "live.numbox", 0 ],
			"obj-2::obj-1::obj-5::obj-27" : [ "live.text[2]", "live.text[2]", 0 ],
			"obj-7::obj-1::obj-5::obj-9" : [ "live.menu[7]", "live.menu", 0 ],
			"obj-2::obj-6::obj-12::obj-42" : [ "live.text[12]", "live.text", 0 ],
			"obj-2::obj-6::obj-12::obj-6" : [ "live.text[14]", "live.text", 0 ],
			"obj-2::obj-6::obj-12::obj-15" : [ "Postamp[1]", "Postamp", 0 ],
			"obj-2::obj-1::obj-5::obj-9" : [ "live.menu", "live.menu", 0 ],
			"obj-2::obj-1::obj-5::obj-45" : [ "live.text", "live.text", 0 ],
			"obj-2::obj-6::obj-82" : [ "pan[1]", "Pan", 0 ],
			"obj-7::obj-1::obj-5::obj-7" : [ "live.numbox[10]", "live.numbox", 0 ],
			"obj-2::obj-13::obj-58" : [ "live.text[11]", "live.text[4]", 0 ],
			"obj-7::obj-1::obj-5::obj-17" : [ "live.numbox[13]", "live.numbox", 0 ],
			"obj-2::obj-13::obj-48" : [ "live.menu[3]", "live.menu", 0 ],
			"obj-7::obj-7::obj-17" : [ "live.numbox[14]", "live.numbox", 0 ],
			"obj-2::obj-6::obj-12::obj-30" : [ "live.menu[4]", "live.menu", 0 ],
			"obj-2::obj-13::obj-4" : [ "live.text[10]", "live.text[1]", 0 ],
			"obj-7::obj-7::obj-7" : [ "live.numbox[16]", "live.numbox", 0 ],
			"obj-2::obj-6::obj-12::obj-27" : [ "Threshold[1]", "Threshold", 0 ],
			"obj-2::obj-13::obj-1::obj-27" : [ "Threshold", "Threshold", 0 ],
			"obj-2::obj-13::obj-62" : [ "live.text[7]", "live.text[3]", 0 ],
			"obj-2::obj-6::obj-17" : [ "Master Gain[2]", "Master Gain", 0 ],
			"obj-7::obj-1::obj-5::obj-6" : [ "live.numbox[12]", "live.numbox[4]", 0 ],
			"obj-2::obj-13::obj-82" : [ "pan", "Pan", 0 ],
			"obj-2::obj-13::obj-55" : [ "Master Gain[1]", "Master Gain", 0 ],
			"obj-7::obj-7::obj-45" : [ "live.text[24]", "live.text", 0 ],
			"obj-2::obj-13::obj-1::obj-5" : [ "Preamp", "Preamp", 0 ],
			"obj-2::obj-13::obj-45" : [ "live.text[6]", "live.text", 0 ],
			"obj-2::obj-13::obj-1::obj-30" : [ "live.menu[2]", "live.menu", 0 ],
			"obj-2::obj-6::obj-110" : [ "live.numbox[7]", "live.numbox[1]", 0 ],
			"obj-2::obj-6::obj-97" : [ "live.numbox[8]", "CPU", 0 ],
			"obj-2::obj-6::obj-104" : [ "live.dial[2]", "Depth", 0 ],
			"obj-2::obj-6::obj-103" : [ "live.text[19]", "live.text", 0 ],
			"obj-2::obj-13::obj-1::obj-42" : [ "live.text[4]", "live.text", 0 ],
			"obj-2::obj-13::obj-1::obj-15" : [ "Postamp", "Postamp", 0 ],
			"obj-7::obj-1::obj-5::obj-27" : [ "live.text[21]", "live.text[2]", 0 ]
		}
,
		"dependency_cache" : [ 			{
				"name" : "equalizer~.model.maxpat",
				"bootpath" : "~/Documents/GITHUB/JamomaMax/Jamoma/patchers/modules/audio/stereo/EQ/equalizer~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.octavebandwidth2q.maxpat",
				"bootpath" : "~/Documents/GITHUB/JamomaMax/Jamoma/patchers/components/audio/octavebandwidth2q",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "equalizer~.view.maxpat",
				"bootpath" : "~/Documents/GITHUB/JamomaMax/Jamoma/patchers/modules/audio/stereo/EQ/equalizer~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "equalizer~.view.large.maxpat",
				"bootpath" : "~/Documents/GITHUB/JamomaMax/Jamoma/patchers/modules/audio/stereo/EQ/equalizer~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.q2octavebandwidth.maxpat",
				"bootpath" : "~/Documents/GITHUB/JamomaMax/Jamoma/patchers/components/audio/q2octavebandwith",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "input~.view.maxpat",
				"bootpath" : "~/Documents/GITHUB/JamomaMax/Jamoma/patchers/modules/audio/stereo/Sources/input~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "limiter~.view.maxpat",
				"bootpath" : "~/Documents/GITHUB/JamomaMax/Jamoma/patchers/modules/audio/stereo/Dynamics/limiter~",
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
				"name" : "input~.model.maxpat",
				"bootpath" : "~/Documents/GITHUB/JamomaMax/Jamoma/patchers/modules/audio/stereo/Sources/input~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "limiter~.model.maxpat",
				"bootpath" : "~/Documents/GITHUB/JamomaMax/Jamoma/patchers/modules/audio/stereo/Dynamics/limiter~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "limiter.parametersAndMessages.maxpat",
				"bootpath" : "~/Documents/GITHUB/JamomaMax/Jamoma/patchers/modules/audio/stereo/Dynamics/limiter~",
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
				"bootpath" : "~/Documents/GITHUB/JamomaMax/Jamoma/patchers/modules/audio/stereo/Imaging/balance~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "output~.view.maxpat",
				"bootpath" : "~/Documents/GITHUB/JamomaMax/Jamoma/patchers/modules/audio/stereo/Output/output~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "output~.model.maxpat",
				"bootpath" : "~/Documents/GITHUB/JamomaMax/Jamoma/patchers/modules/audio/stereo/Output/output~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "saturation~.model.maxpat",
				"bootpath" : "~/Documents/GITHUB/JamomaMax/Jamoma/patchers/modules/audio/stereo/Distortion/saturation~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "record~.model.maxpat",
				"bootpath" : "~/Documents/GITHUB/JamomaMax/Jamoma/patchers/modules/audio/stereo/Output/record~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "record.parametersAndMessages.maxpat",
				"bootpath" : "~/Documents/GITHUB/JamomaMax/Jamoma/patchers/modules/audio/stereo/Output/record~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "helpstarter.js",
				"bootpath" : "C74:/help/resources",
				"type" : "TEXT",
				"implicit" : 1
			}
, 			{
				"name" : "helpname.js",
				"bootpath" : "C74:/help/resources",
				"type" : "TEXT",
				"implicit" : 1
			}
, 			{
				"name" : "equalizer~.view.small.maxpat",
				"bootpath" : "~/Documents/GITHUB/JamomaMax/Jamoma/patchers/modules/audio/stereo/EQ/equalizer~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.model.mxo",
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
				"name" : "j.message.mxo",
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
				"name" : "j.map.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.ui.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.remote_array.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.receive.mxo",
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
				"name" : "j.send.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.savebang.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.receive~.mxo",
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
		"embedsnapshot" : 0
	}

}
