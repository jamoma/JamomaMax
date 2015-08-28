{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 7,
			"minor" : 0,
			"revision" : 4,
			"architecture" : "x64",
			"modernui" : 1
		}
,
		"rect" : [ 210.0, 96.0, 871.0, 714.0 ],
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
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-8",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 0,
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 7,
							"minor" : 0,
							"revision" : 4,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"rect" : [ 0.0, 26.0, 871.0, 688.0 ],
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
						"boxes" : [ 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"hidden" : 1,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 33.0, 530.0, 115.0, 20.0 ],
									"style" : "",
									"text" : "s echo~.model.cmd"
								}

							}
, 							{
								"box" : 								{
									"args" : [ "feedback/gain" ],
									"bgmode" : 0,
									"border" : 0,
									"clickthrough" : 0,
									"enablehscroll" : 0,
									"enablevscroll" : 0,
									"id" : "obj-2",
									"lockeddragscroll" : 0,
									"maxclass" : "bpatcher",
									"name" : "j.attrParameters.helper.maxpat",
									"numinlets" : 0,
									"numoutlets" : 1,
									"offset" : [ 0.0, 0.0 ],
									"outlettype" : [ "" ],
									"patching_rect" : [ 33.0, 23.0, 661.0, 489.0 ],
									"viewvisibility" : 1
								}

							}
 ],
						"lines" : [  ]
					}
,
					"patching_rect" : [ 78.0, 183.0, 81.0, 20.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"style" : "",
						"tags" : ""
					}
,
					"style" : "",
					"text" : "p parameters"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-6",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 0,
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 7,
							"minor" : 0,
							"revision" : 4,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"rect" : [ 0.0, 26.0, 871.0, 688.0 ],
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
						"boxes" : [ 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"hidden" : 1,
									"id" : "obj-3",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 55.0, 420.0, 115.0, 20.0 ],
									"style" : "",
									"text" : "s echo~.model.cmd"
								}

							}
, 							{
								"box" : 								{
									"args" : [ "jmod.crossfade~" ],
									"bgmode" : 0,
									"border" : 0,
									"clickthrough" : 0,
									"enablehscroll" : 0,
									"enablevscroll" : 0,
									"id" : "obj-4",
									"lockeddragscroll" : 0,
									"maxclass" : "bpatcher",
									"name" : "j.presetParameters.helper.maxpat",
									"numinlets" : 0,
									"numoutlets" : 1,
									"offset" : [ 0.0, 0.0 ],
									"outlettype" : [ "" ],
									"patching_rect" : [ 55.0, 61.0, 374.0, 347.0 ],
									"viewvisibility" : 1
								}

							}
 ],
						"lines" : [  ]
					}
,
					"patching_rect" : [ 50.0, 155.0, 60.0, 20.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"style" : "",
						"tags" : ""
					}
,
					"style" : "",
					"text" : "p presets",
					"varname" : "preset_tab"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-5",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 0,
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 7,
							"minor" : 0,
							"revision" : 4,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"rect" : [ 0.0, 26.0, 871.0, 688.0 ],
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
						"boxes" : [ 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"hidden" : 1,
									"id" : "obj-5",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 59.0, 303.0, 115.0, 20.0 ],
									"style" : "",
									"text" : "s echo~.model.cmd"
								}

							}
, 							{
								"box" : 								{
									"bgmode" : 0,
									"border" : 0,
									"clickthrough" : 0,
									"enablehscroll" : 0,
									"enablevscroll" : 0,
									"id" : "obj-6",
									"lockeddragscroll" : 0,
									"maxclass" : "bpatcher",
									"name" : "j.gainParameters.helper.maxpat",
									"numinlets" : 0,
									"numoutlets" : 1,
									"offset" : [ 0.0, 0.0 ],
									"outlettype" : [ "" ],
									"patching_rect" : [ 59.0, 71.0, 374.0, 221.0 ],
									"viewvisibility" : 1
								}

							}
 ],
						"lines" : [  ]
					}
,
					"patching_rect" : [ 30.0, 119.0, 50.0, 20.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"style" : "",
						"tags" : ""
					}
,
					"style" : "",
					"text" : "p audio",
					"varname" : "audio_tab"
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
					"patching_rect" : [ 10.0, 10.0, 451.906219, 53.625 ]
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
					"patching_rect" : [ 525.0, 468.0, 127.0, 20.0 ],
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
							"revision" : 4,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"rect" : [ 210.0, 122.0, 871.0, 688.0 ],
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
						"showontab" : 1,
						"boxes" : [ 							{
								"box" : 								{
									"border" : 0,
									"filename" : "helpdetails.js",
									"id" : "obj-1",
									"ignoreclick" : 1,
									"jsarguments" : [ "echo~.model" ],
									"maxclass" : "jsui",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 10.0, 10.0, 620.0, 72.0 ]
								}

							}
, 							{
								"box" : 								{
									"annotation" : "none",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 423.0, 517.0, 130.0, 22.0 ],
									"style" : "",
									"text" : "filter~.view echo~/filter"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-3",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 383.0, 438.0, 93.0, 22.0 ],
									"style" : "",
									"text" : "print @popup 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-2",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 102.0, 279.0, 113.0, 22.0 ],
									"style" : "",
									"text" : "r echo~.model.cmd"
								}

							}
, 							{
								"box" : 								{
									"bgmode" : 0,
									"border" : 0,
									"clickthrough" : 0,
									"enablehscroll" : 0,
									"enablevscroll" : 0,
									"id" : "obj-48",
									"lockeddragscroll" : 0,
									"maxclass" : "bpatcher",
									"name" : "input~.module.maxpat",
									"numinlets" : 1,
									"numoutlets" : 3,
									"offset" : [ 0.0, 0.0 ],
									"outlettype" : [ "signal", "signal", "" ],
									"patching_rect" : [ 73.0, 94.0, 300.0, 175.0 ],
									"presentation_rect" : [ 15.0, 15.0, 300.0, 175.0 ],
									"viewvisibility" : 1
								}

							}
, 							{
								"box" : 								{
									"bgmode" : 0,
									"border" : 0,
									"clickthrough" : 0,
									"enablehscroll" : 0,
									"enablevscroll" : 0,
									"id" : "obj-47",
									"lockeddragscroll" : 0,
									"maxclass" : "bpatcher",
									"name" : "output~.module.maxpat",
									"numinlets" : 2,
									"numoutlets" : 1,
									"offset" : [ 0.0, 0.0 ],
									"outlettype" : [ "" ],
									"patching_rect" : [ 73.0, 438.0, 300.0, 175.0 ],
									"presentation_rect" : [ 15.0, 15.0, 300.0, 175.0 ],
									"viewvisibility" : 1
								}

							}
, 							{
								"box" : 								{
									"bgmode" : 0,
									"border" : 0,
									"clickthrough" : 0,
									"enablehscroll" : 0,
									"enablevscroll" : 0,
									"id" : "obj-36",
									"lockeddragscroll" : 0,
									"maxclass" : "bpatcher",
									"name" : "echo~.module.maxpat",
									"numinlets" : 2,
									"numoutlets" : 3,
									"offset" : [ 0.0, 0.0 ],
									"outlettype" : [ "signal", "signal", "" ],
									"patching_rect" : [ 73.0, 313.0, 300.0, 105.0 ],
									"presentation_rect" : [ 15.0, 15.0, 300.0, 105.0 ],
									"varname" : "/echo~",
									"viewvisibility" : 1
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-36", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-2", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-36", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 1 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-36", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-36", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-36", 1 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-48", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-36", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-48", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 10.0, 85.0, 50.0, 20.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
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
							"revision" : 4,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"rect" : [ 0.0, 26.0, 871.0, 688.0 ],
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
					"patching_rect" : [ 152.0, 242.0, 50.0, 20.0 ],
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
			"obj-2::obj-36::obj-4::obj-17" : [ "live.menu[1]", "live.menu[1]", 0 ],
			"obj-2::obj-47::obj-1::obj-12::obj-42" : [ "live.text[6]", "live.text", 0 ],
			"obj-2::obj-48::obj-1::obj-111" : [ "live.numbox[4]", "live.numbox[2]", 0 ],
			"obj-2::obj-36::obj-4::obj-3::obj-42" : [ "live.text[1]", "live.text", 0 ],
			"obj-2::obj-47::obj-1::obj-12::obj-13" : [ "Release[1]", "Release", 0 ],
			"obj-2::obj-48::obj-1::obj-1::obj-27" : [ "Threshold[2]", "Threshold", 0 ],
			"obj-2::obj-47::obj-1::obj-111" : [ "live.numbox[2]", "live.numbox[2]", 0 ],
			"obj-2::obj-48::obj-1::obj-29::obj-48" : [ "live.menu[6]", "live.menu", 0 ],
			"obj-2::obj-47::obj-1::obj-103" : [ "live.text[10]", "live.text", 0 ],
			"obj-2::obj-48::obj-1::obj-1::obj-6" : [ "live.text[14]", "live.text", 0 ],
			"obj-2::obj-47::obj-1::obj-110" : [ "live.numbox[1]", "live.numbox[1]", 0 ],
			"obj-2::obj-48::obj-1::obj-110" : [ "live.numbox[6]", "live.numbox[1]", 0 ],
			"obj-2::obj-36::obj-4::obj-24" : [ "live.dial[1]", "Delay R", 0 ],
			"obj-2::obj-36::obj-4::obj-23" : [ "live.dial", "Delay L", 0 ],
			"obj-2::obj-48::obj-1::obj-47" : [ "live.numbox[5]", "live.numbox", 0 ],
			"obj-2::obj-48::obj-1::obj-1::obj-5" : [ "Preamp[2]", "Preamp", 0 ],
			"obj-2::obj-47::obj-1::obj-107" : [ "live.dial[4]", "Preamp", 0 ],
			"obj-2::obj-48::obj-1::obj-24" : [ "Master Gain[1]", "Master Gain", 0 ],
			"obj-2::obj-48::obj-1::obj-108" : [ "live.text[15]", "live.text[4]", 0 ],
			"obj-2::obj-47::obj-1::obj-12::obj-15" : [ "Postamp[1]", "Postamp", 0 ],
			"obj-2::obj-47::obj-1::obj-106" : [ "live.dial[3]", "Release", 0 ],
			"obj-2::obj-36::obj-4::obj-3::obj-12" : [ "Lookahead", "Lookahead", 0 ],
			"obj-2::obj-47::obj-1::obj-104" : [ "live.dial[5]", "Depth", 0 ],
			"obj-2::obj-36::obj-4::obj-3::obj-6" : [ "live.text", "live.text", 0 ],
			"obj-2::obj-48::obj-1::obj-62" : [ "live.text[16]", "live.text[3]", 0 ],
			"obj-2::obj-47::obj-1::obj-98" : [ "live.menu[4]", "live.menu", 0 ],
			"obj-2::obj-36::obj-4::obj-3::obj-27" : [ "Threshold", "Threshold", 0 ],
			"obj-2::obj-48::obj-1::obj-58" : [ "live.text[17]", "live.text[4]", 0 ],
			"obj-2::obj-48::obj-1::obj-48" : [ "live.menu[8]", "live.menu", 0 ],
			"obj-2::obj-36::obj-4::obj-3::obj-15" : [ "Postamp", "Postamp", 0 ],
			"obj-2::obj-36::obj-4::obj-18" : [ "live.text[3]", "live.text[3]", 0 ],
			"obj-2::obj-47::obj-1::obj-12::obj-12" : [ "Lookahead[1]", "Lookahead", 0 ],
			"obj-2::obj-48::obj-1::obj-1::obj-42" : [ "live.text[13]", "live.text", 0 ],
			"obj-2::obj-36::obj-4::obj-3::obj-13" : [ "Release", "Release", 0 ],
			"obj-2::obj-47::obj-1::obj-12::obj-27" : [ "Threshold[1]", "Threshold", 0 ],
			"obj-2::obj-47::obj-1::obj-100" : [ "live.text[7]", "live.text[1]", 0 ],
			"obj-2::obj-47::obj-1::obj-99" : [ "live.menu[5]", "live.menu[2]", 0 ],
			"obj-2::obj-47::obj-1::obj-90" : [ "live.text[9]", "live.text[1]", 0 ],
			"obj-2::obj-47::obj-1::obj-102" : [ "live.text[11]", "live.text", 0 ],
			"obj-2::obj-47::obj-1::obj-12::obj-5" : [ "Preamp[1]", "Preamp", 0 ],
			"obj-2::obj-47::obj-1::obj-82" : [ "pan", "Pan", 0 ],
			"obj-2::obj-4::obj-14" : [ "live.numbox[10]", "live.numbox", 0 ],
			"obj-2::obj-47::obj-1::obj-108" : [ "live.text[8]", "live.text[4]", 0 ],
			"obj-2::obj-4::obj-7" : [ "live.numbox[8]", "live.numbox", 0 ],
			"obj-2::obj-48::obj-1::obj-1::obj-13" : [ "Release[2]", "Release", 0 ],
			"obj-2::obj-4::obj-22" : [ "live.text[20]", "live.text", 0 ],
			"obj-2::obj-36::obj-4::obj-3::obj-5" : [ "Preamp", "Preamp", 0 ],
			"obj-2::obj-47::obj-1::obj-97" : [ "live.numbox", "CPU", 0 ],
			"obj-2::obj-48::obj-1::obj-1::obj-45" : [ "live.text[12]", "live.text", 0 ],
			"obj-2::obj-48::obj-1::obj-4" : [ "live.text[18]", "live.text[1]", 0 ],
			"obj-2::obj-36::obj-4::obj-21" : [ "live.menu[2]", "live.menu[2]", 0 ],
			"obj-2::obj-47::obj-1::obj-12::obj-30" : [ "live.menu[3]", "live.menu", 0 ],
			"obj-2::obj-4::obj-12" : [ "live.numbox[9]", "live.numbox[4]", 0 ],
			"obj-2::obj-47::obj-1::obj-12::obj-45" : [ "live.text[5]", "live.text", 0 ],
			"obj-2::obj-36::obj-4::obj-3::obj-45" : [ "live.text[2]", "live.text", 0 ],
			"obj-2::obj-48::obj-1::obj-1::obj-15" : [ "Postamp[2]", "Postamp", 0 ],
			"obj-2::obj-47::obj-1::obj-53" : [ "Master Gain", "Master Gain", 0 ],
			"obj-2::obj-47::obj-1::obj-12::obj-6" : [ "live.text[4]", "live.text", 0 ],
			"obj-2::obj-48::obj-1::obj-82" : [ "pan[1]", "Pan", 0 ],
			"obj-2::obj-48::obj-1::obj-74" : [ "live.dial[6]", "Transpose", 0 ],
			"obj-2::obj-36::obj-4::obj-3::obj-30" : [ "live.menu", "live.menu", 0 ],
			"obj-2::obj-4::obj-19" : [ "live.numbox[7]", "live.numbox", 0 ],
			"obj-2::obj-48::obj-1::obj-1::obj-30" : [ "live.menu[7]", "live.menu", 0 ],
			"obj-2::obj-36::obj-4::obj-25" : [ "Feedback", "Feedback", 0 ],
			"obj-2::obj-4::obj-15" : [ "live.menu[9]", "live.menu", 0 ],
			"obj-2::obj-48::obj-1::obj-1::obj-12" : [ "Lookahead[2]", "Lookahead", 0 ],
			"obj-2::obj-48::obj-1::obj-45" : [ "live.numbox[3]", "live.numbox", 0 ],
			"obj-2::obj-48::obj-1::obj-59" : [ "live.text[19]", "live.text[3]", 0 ]
		}
,
		"dependency_cache" : [ 			{
				"name" : "echo~.module.maxpat",
				"bootpath" : "~/dev/Jamoma/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/Delay/echo~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "echo~.model.maxpat",
				"bootpath" : "~/dev/Jamoma/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/Delay/echo~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "limiter~.model.maxpat",
				"bootpath" : "~/dev/Jamoma/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/Dynamics/limiter~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "limiter.parametersAndMessages.maxpat",
				"bootpath" : "~/dev/Jamoma/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/Dynamics/limiter~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "filter~.model.maxpat",
				"bootpath" : "~/dev/Jamoma/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/EQ/filter~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.octavebandwidth2q.maxpat",
				"bootpath" : "~/dev/Jamoma/Jamoma/Implementations/Max/Jamoma/patchers/components/audio/octavebandwidth2q",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.q2octavebandwidth.maxpat",
				"bootpath" : "~/dev/Jamoma/Jamoma/Implementations/Max/Jamoma/patchers/components/audio/q2octavebandwith",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "echo~.view.maxpat",
				"bootpath" : "~/dev/Jamoma/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/Delay/echo~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "limiter~.view.maxpat",
				"bootpath" : "~/dev/Jamoma/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/Dynamics/limiter~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "output~.module.maxpat",
				"bootpath" : "~/dev/Jamoma/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/Output/output~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "output~.model.maxpat",
				"bootpath" : "~/dev/Jamoma/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/Output/output~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "saturation~.model.maxpat",
				"bootpath" : "~/dev/Jamoma/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/Distortion/saturation~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "balance~.model.maxpat",
				"bootpath" : "~/dev/Jamoma/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/Imaging/balance~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "record~.model.maxpat",
				"bootpath" : "~/dev/Jamoma/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/Output/record~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "record.parametersAndMessages.maxpat",
				"bootpath" : "~/dev/Jamoma/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/Output/record~",
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
				"name" : "output~.view.maxpat",
				"bootpath" : "~/dev/Jamoma/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/Output/output~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "input~.module.maxpat",
				"bootpath" : "~/dev/Jamoma/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/Sources/input~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "input~.view.maxpat",
				"bootpath" : "~/dev/Jamoma/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/Sources/input~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "input~.model.maxpat",
				"bootpath" : "~/dev/Jamoma/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/Sources/input~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "filter~.view.maxpat",
				"bootpath" : "~/dev/Jamoma/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/EQ/filter~",
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
				"name" : "j.gainParameters.helper.maxpat",
				"bootpath" : "~/dev/Jamoma/Jamoma/Implementations/Max/Jamoma/help",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.presetParameters.helper.maxpat",
				"bootpath" : "~/dev/Jamoma/Jamoma/Implementations/Max/Jamoma/help",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.attrParameters.helper.maxpat",
				"bootpath" : "~/dev/Jamoma/Jamoma/Implementations/Max/Jamoma/help",
				"type" : "JSON",
				"implicit" : 1
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
				"name" : "j.limiter~.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.unit.mxo",
				"type" : "iLaX"
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
				"name" : "j.receive~.mxo",
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
, 			{
				"name" : "j.panorama~.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.return.mxo",
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
				"name" : "j.map.mxo",
				"type" : "iLaX"
			}
 ],
		"embedsnapshot" : 0
	}

}
