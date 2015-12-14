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
		"rect" : [ 59.0, 84.0, 1162.0, 889.0 ],
		"bglocked" : 0,
		"openinpresentation" : 0,
		"default_fontsize" : 10.0,
		"default_fontface" : 0,
		"default_fontname" : "Verdana",
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
					"id" : "obj-36",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 396.0, 248.5, 150.0, 19.0 ],
					"style" : "",
					"text" : "create/link"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-34",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 7,
							"minor" : 1,
							"revision" : 0,
							"architecture" : "x86",
							"modernui" : 1
						}
,
						"rect" : [ 59.0, 104.0, 336.0, 555.0 ],
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
									"fontname" : "Verdana",
									"fontsize" : 10.0,
									"id" : "obj-28",
									"linecount" : 27,
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 100.0, 186.0, 337.0 ],
									"style" : "",
									"text" : "function linear, clipmode both, data/active 1, data/bypass 0, input /motion%/motion/quantity, input/going.down/action.1 none, input/going.down/action.2 none, input/going.down/action.3 none, input/going.up/action.1 none, input/going.up/action.2 none, input/going.up/action.3 none, input/index 0, input/max 1., input/min 0., input/threshold/active 0, input/threshold.down 0., input/threshold.up 1., output /echo~/delay/right, output/going.down/action.1 none, output/going.down/action.2 none, output/going.down/action.3 none, output/going.up/action.1 none, output/going.up/action.2 none, output/going.up/action.3 none, output/index 0, output/max 2000., output/min 0., output/threshold/active 0, output/threshold.down 0., output/threshold.up 1., output/unit none, rampTime 0"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-27",
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 50.0, 40.0, 30.0, 30.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-33",
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 477.0, 30.0, 30.0 ],
									"style" : ""
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-28", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-27", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-33", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-28", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 370.0, 279.0, 77.0, 21.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"style" : "",
						"tags" : ""
					}
,
					"style" : "",
					"text" : "p create_link"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-26",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 370.0, 246.0, 24.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-1",
					"lockeddragscroll" : 1,
					"maxclass" : "bpatcher",
					"name" : "movie%.module.maxpat",
					"numinlets" : 1,
					"numoutlets" : 2,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 40.0, 77.0, 300.0, 140.0 ],
					"presentation_rect" : [ 0.0, 0.0, 300.0, 140.0 ],
					"varname" : "/movie%",
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-2",
					"maxclass" : "jit.pwindow",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 658.0, 560.0, 320.0, 240.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-3",
					"maxclass" : "jit.fpsgui",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 10.0, 746.0, 60.0, 35.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-4",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 51.0, 592.0, 39.0, 21.0 ],
					"style" : "",
					"text" : "/clear"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-5",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 240.0, 605.0, 47.0, 19.0 ],
					"style" : "",
					"text" : "y"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"hidden" : 1,
					"id" : "obj-6",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 320.0, 824.0, 49.0, 21.0 ],
					"style" : "",
					"text" : "route 0."
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"hidden" : 1,
					"id" : "obj-7",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 614.0, 539.0, 49.0, 21.0 ],
					"style" : "",
					"text" : "route 0."
				}

			}
, 			{
				"box" : 				{
					"candicane2" : [ 0.145098, 0.203922, 0.356863, 1.0 ],
					"candicane3" : [ 0.290196, 0.411765, 0.713726, 1.0 ],
					"candicane4" : [ 0.439216, 0.619608, 0.070588, 1.0 ],
					"candicane5" : [ 0.584314, 0.827451, 0.431373, 1.0 ],
					"candicane6" : [ 0.733333, 0.035294, 0.788235, 1.0 ],
					"candicane7" : [ 0.878431, 0.243137, 0.145098, 1.0 ],
					"candicane8" : [ 0.027451, 0.447059, 0.501961, 1.0 ],
					"id" : "obj-8",
					"maxclass" : "multislider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 640.0, 561.0, 20.0, 240.0 ],
					"peakcolor" : [ 0.498039, 0.498039, 0.498039, 1.0 ],
					"setminmax" : [ 0.0, 1.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"candicane2" : [ 0.145098, 0.203922, 0.356863, 1.0 ],
					"candicane3" : [ 0.290196, 0.411765, 0.713726, 1.0 ],
					"candicane4" : [ 0.439216, 0.619608, 0.070588, 1.0 ],
					"candicane5" : [ 0.584314, 0.827451, 0.431373, 1.0 ],
					"candicane6" : [ 0.733333, 0.035294, 0.788235, 1.0 ],
					"candicane7" : [ 0.878431, 0.243137, 0.145098, 1.0 ],
					"candicane8" : [ 0.027451, 0.447059, 0.501961, 1.0 ],
					"id" : "obj-9",
					"maxclass" : "multislider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"orientation" : 0,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 320.0, 801.0, 320.0, 20.0 ],
					"peakcolor" : [ 0.498039, 0.498039, 0.498039, 1.0 ],
					"setminmax" : [ 0.0, 1.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-10",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 178.0, 604.0, 47.0, 19.0 ],
					"style" : "",
					"text" : "x"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-11",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 120.0, 603.0, 50.0, 19.0 ],
					"style" : "",
					"text" : "quantity"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"format" : 6,
					"id" : "obj-12",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 237.0, 584.0, 53.0, 21.0 ],
					"style" : "",
					"triscale" : 0.9
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"format" : 6,
					"id" : "obj-13",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 177.0, 584.0, 53.0, 21.0 ],
					"style" : "",
					"triscale" : 0.9
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-14",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 40.0, 616.0, 84.0, 21.0 ],
					"style" : "",
					"text" : "j.autoscale"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"format" : 6,
					"id" : "obj-15",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 120.0, 584.0, 53.0, 21.0 ],
					"style" : "",
					"triscale" : 0.9
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-16",
					"maxclass" : "newobj",
					"numinlets" : 4,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 40.0, 551.0, 264.0, 21.0 ],
					"style" : "",
					"text" : "j.oscroute quantity x y"
				}

			}
, 			{
				"box" : 				{
					"candicane2" : [ 0.145098, 0.203922, 0.356863, 1.0 ],
					"candicane3" : [ 0.290196, 0.411765, 0.713726, 1.0 ],
					"candicane4" : [ 0.439216, 0.619608, 0.070588, 1.0 ],
					"candicane5" : [ 0.584314, 0.827451, 0.431373, 1.0 ],
					"candicane6" : [ 0.733333, 0.035294, 0.788235, 1.0 ],
					"candicane7" : [ 0.878431, 0.243137, 0.145098, 1.0 ],
					"candicane8" : [ 0.027451, 0.447059, 0.501961, 1.0 ],
					"id" : "obj-17",
					"maxclass" : "multislider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 40.0, 641.0, 160.0, 87.0 ],
					"peakcolor" : [ 0.498039, 0.498039, 0.498039, 1.0 ],
					"setminmax" : [ 0.0, 1.0 ],
					"setstyle" : 5,
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-18",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 40.0, 526.0, 127.0, 21.0 ],
					"style" : "",
					"text" : "j.oscroute motion"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-19",
					"maxclass" : "jit.pwindow",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 319.0, 560.0, 320.0, 240.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-20",
					"linecount" : 3,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 205.0, 642.0, 99.0, 43.0 ],
					"style" : "",
					"text" : "Currently only works for greyscale images."
				}

			}
, 			{
				"box" : 				{
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-21",
					"lockeddragscroll" : 1,
					"maxclass" : "bpatcher",
					"name" : "orsize%.module.maxpat",
					"numinlets" : 1,
					"numoutlets" : 2,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 40.0, 225.0, 300.0, 105.0 ],
					"presentation_rect" : [ 0.0, 0.0, 300.0, 105.0 ],
					"varname" : "/orsize%",
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
					"id" : "obj-22",
					"lockeddragscroll" : 1,
					"maxclass" : "bpatcher",
					"name" : "input~.module.maxpat",
					"numinlets" : 1,
					"numoutlets" : 3,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "signal", "signal", "" ],
					"patching_rect" : [ 827.0, 70.0, 300.0, 175.0 ],
					"presentation_rect" : [ 0.0, 0.0, 300.0, 175.0 ],
					"varname" : "/input~",
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
					"id" : "obj-23",
					"lockeddragscroll" : 1,
					"maxclass" : "bpatcher",
					"name" : "echo~.module.maxpat",
					"numinlets" : 2,
					"numoutlets" : 3,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "signal", "signal", "" ],
					"patching_rect" : [ 827.0, 257.0, 300.0, 105.0 ],
					"presentation_rect" : [ 0.0, 0.0, 300.0, 105.0 ],
					"varname" : "/echo",
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
					"id" : "obj-25",
					"lockeddragscroll" : 1,
					"maxclass" : "bpatcher",
					"name" : "output~.module.maxpat",
					"numinlets" : 2,
					"numoutlets" : 1,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "" ],
					"patching_rect" : [ 827.0, 379.0, 300.0, 175.0 ],
					"presentation_rect" : [ 0.0, 0.0, 300.0, 175.0 ],
					"varname" : "/output~",
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
					"id" : "obj-29",
					"lockeddragscroll" : 1,
					"maxclass" : "bpatcher",
					"name" : "mapper.module.maxpat",
					"numinlets" : 1,
					"numoutlets" : 1,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "" ],
					"patching_rect" : [ 370.0, 310.0, 450.0, 105.0 ],
					"presentation_rect" : [ 0.0, 0.0, 450.0, 105.0 ],
					"varname" : "/mapper",
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
					"id" : "obj-30",
					"lockeddragscroll" : 1,
					"maxclass" : "bpatcher",
					"name" : "motion%.module.maxpat",
					"numinlets" : 1,
					"numoutlets" : 2,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 40.0, 431.0, 300.0, 70.0 ],
					"presentation_rect" : [ 0.0, 0.0, 300.0, 70.0 ],
					"varname" : "/motion",
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
					"id" : "obj-31",
					"lockeddragscroll" : 1,
					"maxclass" : "bpatcher",
					"name" : "brcosa%.module.maxpat",
					"numinlets" : 1,
					"numoutlets" : 2,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 40.0, 339.0, 300.0, 70.0 ],
					"presentation_rect" : [ 0.0, 0.0, 300.0, 70.0 ],
					"varname" : "/brcosa",
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-32",
					"linecount" : 4,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 40.0, 13.0, 899.0, 55.0 ],
					"style" : "",
					"text" : "This patch shows a basic example of how it is possible to do video analysis based on frame difference. It is important to calibrate the system well using the brightness and contrast functions, and adjusting the threshold in the motion module.  \r\rClicking on the /create/link message in the mapping module will set up a mapping between the output of the motion module and the echo module to the right. "
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-21", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-1", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-17", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-14", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 212.833328, 572.0, 246.5, 572.0 ],
					"source" : [ "obj-16", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 131.166672, 575.0, 186.5, 575.0 ],
					"source" : [ "obj-16", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-14", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-16", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 49.5, 578.0, 129.5, 578.0 ],
					"source" : [ "obj-16", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"disabled" : 0,
					"hidden" : 1,
					"source" : [ "obj-16", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 0 ],
					"disabled" : 0,
					"hidden" : 1,
					"source" : [ "obj-16", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-16", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-18", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-31", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-21", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-22", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-22", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-25", 1 ],
					"disabled" : 0,
					"hidden" : 1,
					"midpoints" : [ 977.0, 370.0, 1117.5, 370.0 ],
					"source" : [ "obj-23", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-25", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-23", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-34", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-26", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-18", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-30", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-19", 0 ],
					"disabled" : 0,
					"hidden" : 1,
					"source" : [ "obj-30", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 49.5, 506.0, 19.5, 506.0 ],
					"source" : [ "obj-30", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"disabled" : 0,
					"hidden" : 1,
					"source" : [ "obj-31", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-30", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-31", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-29", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-34", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-14", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-4", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-9", 0 ],
					"disabled" : 0,
					"hidden" : 1,
					"source" : [ "obj-6", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-8", 0 ],
					"disabled" : 0,
					"hidden" : 1,
					"source" : [ "obj-7", 1 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-22::obj-1::obj-48" : [ "live.menu[11]", "live.menu", 0 ],
			"obj-22::obj-1::obj-4" : [ "live.text[29]", "live.text[1]", 0 ],
			"obj-1::obj-5::obj-36" : [ "live.text[37]", "live.text", 0 ],
			"obj-29::obj-7::obj-182" : [ "live.text[4]", "live.text[4]", 0 ],
			"obj-23::obj-4::obj-31::obj-1::obj-30" : [ "live.menu[5]", "live.menu", 0 ],
			"obj-23::obj-4::obj-31::obj-1::obj-13" : [ "Release[2]", "Release", 0 ],
			"obj-25::obj-1::obj-12::obj-42" : [ "live.text[1]", "live.text", 0 ],
			"obj-23::obj-4::obj-3::obj-13" : [ "Release[1]", "Release", 0 ],
			"obj-23::obj-4::obj-31::obj-1::obj-27" : [ "Threshold[2]", "Threshold", 0 ],
			"obj-25::obj-1::obj-100" : [ "live.text[13]", "live.text[1]", 0 ],
			"obj-23::obj-4::obj-3::obj-45" : [ "live.text[17]", "live.text", 0 ],
			"obj-23::obj-4::obj-31::obj-2::obj-12" : [ "live.numbox[4]", "live.numbox[4]", 0 ],
			"obj-22::obj-1::obj-29::obj-48" : [ "live.menu[9]", "live.menu", 0 ],
			"obj-22::obj-1::obj-1::obj-45" : [ "live.text[25]", "live.text", 0 ],
			"obj-25::obj-1::obj-104" : [ "live.dial[1]", "Depth", 0 ],
			"obj-23::obj-4::obj-31::obj-2::obj-7" : [ "live.numbox[5]", "live.numbox", 0 ],
			"obj-22::obj-1::obj-55" : [ "Master Gain[2]", "Master Gain", 0 ],
			"obj-25::obj-1::obj-107" : [ "live.dial[4]", "Preamp", 0 ],
			"obj-23::obj-4::obj-18" : [ "live.text[22]", "live.text[3]", 0 ],
			"obj-1::obj-5::obj-39" : [ "live.text[35]", "live.text", 0 ],
			"obj-29::obj-7::obj-10::obj-145" : [ "live.menu[1]", "live.menu", 0 ],
			"obj-25::obj-1::obj-106" : [ "live.dial[3]", "Release", 0 ],
			"obj-1::obj-5::obj-53" : [ "live.button[1]", "live.button", 0 ],
			"obj-23::obj-4::obj-31::obj-2::obj-14" : [ "live.numbox[6]", "live.numbox", 0 ],
			"obj-1::obj-5::obj-49" : [ "live.button", "live.button", 0 ],
			"obj-23::obj-4::obj-3::obj-30" : [ "live.menu[4]", "live.menu", 0 ],
			"obj-29::obj-7::obj-8" : [ "live.text[10]", "live.text", 0 ],
			"obj-23::obj-4::obj-3::obj-15" : [ "Postamp[1]", "Postamp", 0 ],
			"obj-23::obj-4::obj-31::obj-1::obj-12" : [ "Lookahead[2]", "Lookahead", 0 ],
			"obj-22::obj-1::obj-58" : [ "live.text[28]", "live.text[4]", 0 ],
			"obj-23::obj-4::obj-3::obj-42" : [ "live.text[15]", "live.text", 0 ],
			"obj-23::obj-4::obj-24" : [ "live.dial[5]", "Delay R", 0 ],
			"obj-23::obj-4::obj-31::obj-1::obj-6" : [ "live.text[20]", "live.text", 0 ],
			"obj-25::obj-1::obj-12::obj-5" : [ "Preamp", "Preamp", 0 ],
			"obj-23::obj-4::obj-31::obj-1::obj-45" : [ "live.text[18]", "live.text", 0 ],
			"obj-23::obj-4::obj-31::obj-2::obj-22" : [ "live.text[21]", "live.text", 0 ],
			"obj-23::obj-4::obj-31::obj-2::obj-15" : [ "live.menu[6]", "live.menu", 0 ],
			"obj-22::obj-1::obj-45" : [ "live.text[26]", "live.text", 0 ],
			"obj-25::obj-1::obj-12::obj-30" : [ "live.menu", "live.menu", 0 ],
			"obj-25::obj-1::obj-90" : [ "live.text[11]", "live.text[1]", 0 ],
			"obj-23::obj-4::obj-3::obj-12" : [ "Lookahead[1]", "Lookahead", 0 ],
			"obj-23::obj-4::obj-17" : [ "live.menu[8]", "live.menu[1]", 0 ],
			"obj-25::obj-1::obj-82" : [ "pan", "Pan", 0 ],
			"obj-22::obj-1::obj-111" : [ "live.numbox[7]", "live.numbox[2]", 0 ],
			"obj-22::obj-1::obj-74" : [ "live.dial[6]", "Transpose", 0 ],
			"obj-22::obj-1::obj-1::obj-15" : [ "Postamp[3]", "Postamp", 0 ],
			"obj-1::obj-5::obj-89" : [ "live.text[33]", "live.text[2]", 0 ],
			"obj-22::obj-1::obj-1::obj-27" : [ "Threshold[3]", "Threshold", 0 ],
			"obj-22::obj-1::obj-82" : [ "pan[1]", "Pan", 0 ],
			"obj-29::obj-7::obj-10::obj-196" : [ "live.text[7]", "live.text", 0 ],
			"obj-25::obj-1::obj-110" : [ "live.numbox[1]", "live.numbox[1]", 0 ],
			"obj-1::obj-5::obj-37" : [ "live.text[36]", "live.text", 0 ],
			"obj-23::obj-4::obj-25" : [ "Feedback", "Feedback", 0 ],
			"obj-22::obj-1::obj-47" : [ "live.numbox[9]", "live.numbox", 0 ],
			"obj-23::obj-4::obj-31::obj-1::obj-5" : [ "Preamp[2]", "Preamp", 0 ],
			"obj-25::obj-1::obj-12::obj-6" : [ "live.text", "live.text", 0 ],
			"obj-29::obj-7::obj-21" : [ "live.text[9]", "live.text", 0 ],
			"obj-23::obj-4::obj-3::obj-5" : [ "Preamp[1]", "Preamp", 0 ],
			"obj-25::obj-1::obj-108" : [ "live.text[14]", "live.text[4]", 0 ],
			"obj-1::obj-5::obj-91" : [ "live.text[32]", "live.text[2]", 0 ],
			"obj-22::obj-1::obj-1::obj-12" : [ "Lookahead[3]", "Lookahead", 0 ],
			"obj-22::obj-1::obj-1::obj-5" : [ "Preamp[3]", "Preamp", 0 ],
			"obj-25::obj-1::obj-12::obj-27" : [ "Threshold", "Threshold", 0 ],
			"obj-22::obj-1::obj-62" : [ "live.text[27]", "live.text[3]", 0 ],
			"obj-1::obj-5::obj-41" : [ "live.text[34]", "live.text[4]", 0 ],
			"obj-25::obj-1::obj-12::obj-15" : [ "Postamp", "Postamp", 0 ],
			"obj-22::obj-1::obj-1::obj-6" : [ "live.text[24]", "live.text", 0 ],
			"obj-29::obj-7::obj-10::obj-174" : [ "live.text[5]", "live.text[1]", 0 ],
			"obj-25::obj-1::obj-12::obj-13" : [ "Release", "Release", 0 ],
			"obj-29::obj-7::obj-10::obj-95" : [ "live.text[8]", "live.text", 0 ],
			"obj-23::obj-4::obj-31::obj-2::obj-19" : [ "live.numbox[3]", "live.numbox", 0 ],
			"obj-29::obj-7::obj-10::obj-188" : [ "live.text[6]", "live.text[1]", 0 ],
			"obj-25::obj-1::obj-99" : [ "live.menu[2]", "live.menu[2]", 0 ],
			"obj-25::obj-1::obj-98" : [ "live.menu[3]", "live.menu", 0 ],
			"obj-25::obj-1::obj-102" : [ "live.text[3]", "live.text", 0 ],
			"obj-22::obj-1::obj-110" : [ "live.numbox[8]", "live.numbox[1]", 0 ],
			"obj-25::obj-1::obj-12::obj-12" : [ "Lookahead", "Lookahead", 0 ],
			"obj-23::obj-4::obj-21" : [ "live.menu[7]", "live.menu[2]", 0 ],
			"obj-22::obj-1::obj-59" : [ "live.text[30]", "live.text[3]", 0 ],
			"obj-25::obj-1::obj-97" : [ "live.numbox", "CPU", 0 ],
			"obj-23::obj-4::obj-3::obj-27" : [ "Threshold[1]", "Threshold", 0 ],
			"obj-23::obj-4::obj-31::obj-1::obj-15" : [ "Postamp[2]", "Postamp", 0 ],
			"obj-22::obj-1::obj-108" : [ "live.text[31]", "live.text[4]", 0 ],
			"obj-23::obj-4::obj-3::obj-6" : [ "live.text[16]", "live.text", 0 ],
			"obj-25::obj-1::obj-103" : [ "live.text[12]", "live.text", 0 ],
			"obj-25::obj-1::obj-111" : [ "live.numbox[2]", "live.numbox[2]", 0 ],
			"obj-22::obj-1::obj-1::obj-13" : [ "Release[3]", "Release", 0 ],
			"obj-25::obj-1::obj-12::obj-45" : [ "live.text[2]", "live.text", 0 ],
			"obj-23::obj-4::obj-31::obj-1::obj-42" : [ "live.text[19]", "live.text", 0 ],
			"obj-23::obj-4::obj-23" : [ "live.dial", "Delay L", 0 ],
			"obj-25::obj-1::obj-17" : [ "Master Gain[1]", "Master Gain", 0 ],
			"obj-22::obj-1::obj-1::obj-30" : [ "live.menu[10]", "live.menu", 0 ],
			"obj-22::obj-1::obj-1::obj-42" : [ "live.text[23]", "live.text", 0 ]
		}
,
		"dependency_cache" : [ 			{
				"name" : "brcosa%.module.maxpat",
				"bootpath" : "~/Documents/JamomaMax/Jamoma/patchers/models/video/fx/brcosa%",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "brcosa%.model.maxpat",
				"bootpath" : "~/Documents/JamomaMax/Jamoma/patchers/models/video/fx/brcosa%",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "brcosa%.view.maxpat",
				"bootpath" : "~/Documents/JamomaMax/Jamoma/patchers/models/video/fx/brcosa%",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "motion%.module.maxpat",
				"bootpath" : "~/Documents/JamomaMax/Jamoma/patchers/models/video/fx/motion%",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "motion%.model.maxpat",
				"bootpath" : "~/Documents/JamomaMax/Jamoma/patchers/models/video/fx/motion%",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.motion%.maxpat",
				"bootpath" : "~/Documents/JamomaMax/Jamoma/patchers/components/video/motion%",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.checkplanes%.maxpat",
				"bootpath" : "~/Documents/JamomaMax/Jamoma/patchers/components/video/checkplanes%",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.absdiff.maxpat",
				"bootpath" : "~/Documents/JamomaMax/Jamoma/patchers/components/data/absdiff",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.autoscale.maxpat",
				"bootpath" : "~/Documents/JamomaMax/Jamoma/patchers/components/data/autoscale",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.initialized.maxpat",
				"bootpath" : "~/Documents/JamomaMax/Jamoma/patchers/components/data/initialized",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.passmatrixinfo%.maxpat",
				"bootpath" : "~/Documents/JamomaMax/Jamoma/patchers/components/video/passmatrixinfo%",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.rgb2luma%.maxpat",
				"bootpath" : "~/Documents/JamomaMax/Jamoma/patchers/components/video/rgb2luma%",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.sum%.maxpat",
				"bootpath" : "~/Documents/JamomaMax/Jamoma/patchers/components/video/sum%",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "motion%.view.maxpat",
				"bootpath" : "~/Documents/JamomaMax/Jamoma/patchers/models/video/fx/motion%",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "mapper.module.maxpat",
				"bootpath" : "~/Documents/JamomaMax/Jamoma/patchers/models/data/mapper",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "mapper.model.maxpat",
				"bootpath" : "~/Documents/JamomaMax/Jamoma/patchers/models/data/mapper",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "mapper.view.maxpat",
				"bootpath" : "~/Documents/JamomaMax/Jamoma/patchers/models/data/mapper",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.namespacebrowser.view.maxpat",
				"bootpath" : "~/Documents/JamomaMax/Jamoma/patchers/components/namespace/namespacebrowser",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.get_onscreen_position.js",
				"bootpath" : "~/Documents/JamomaMax/Jamoma/javascript",
				"type" : "TEXT",
				"implicit" : 1
			}
, 			{
				"name" : "mapper.view.large.maxpat",
				"bootpath" : "~/Documents/JamomaMax/Jamoma/patchers/models/data/mapper",
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
				"name" : "output~.module.maxpat",
				"bootpath" : "~/Documents/JamomaMax/Jamoma/patchers/models/audio/stereo/output/output",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "output~.model.maxpat",
				"bootpath" : "~/Documents/JamomaMax/Jamoma/patchers/models/audio/stereo/output/output",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "saturation~.model.maxpat",
				"bootpath" : "~/Documents/JamomaMax/Jamoma/patchers/models/audio/stereo/distortion/saturation",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "limiter~.model.maxpat",
				"bootpath" : "~/Documents/JamomaMax/Jamoma/patchers/models/audio/stereo/dynamics/limiter",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "limiter.parametersAndMessages.maxpat",
				"bootpath" : "~/Documents/JamomaMax/Jamoma/patchers/models/audio/stereo/dynamics/limiter",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "balance~.model.maxpat",
				"bootpath" : "~/Documents/JamomaMax/Jamoma/patchers/models/audio/stereo/imaging/balance",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "record~.model.maxpat",
				"bootpath" : "~/Documents/JamomaMax/Jamoma/patchers/models/audio/stereo/output/record",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "record.parametersAndMessages.maxpat",
				"bootpath" : "~/Documents/JamomaMax/Jamoma/patchers/models/audio/stereo/output/record",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "output~.view.maxpat",
				"bootpath" : "~/Documents/JamomaMax/Jamoma/patchers/models/audio/stereo/output/output",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "limiter~.view.maxpat",
				"bootpath" : "~/Documents/JamomaMax/Jamoma/patchers/models/audio/stereo/dynamics/limiter",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "echo~.module.maxpat",
				"bootpath" : "~/Documents/JamomaMax/Jamoma/patchers/models/audio/stereo/delay/echo",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "echo~.model.maxpat",
				"bootpath" : "~/Documents/JamomaMax/Jamoma/patchers/models/audio/stereo/delay/echo",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "filter~.model.maxpat",
				"bootpath" : "~/Documents/JamomaMax/Jamoma/patchers/models/audio/stereo/eq/filter",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.octavebandwidth2q.maxpat",
				"bootpath" : "~/Documents/JamomaMax/Jamoma/patchers/components/audio/octavebandwidth2q",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.q2octavebandwidth.maxpat",
				"bootpath" : "~/Documents/JamomaMax/Jamoma/patchers/components/audio/q2octavebandwith",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "echo~.view.maxpat",
				"bootpath" : "~/Documents/JamomaMax/Jamoma/patchers/models/audio/stereo/delay/echo",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "filter~.view.maxpat",
				"bootpath" : "~/Documents/JamomaMax/Jamoma/patchers/models/audio/stereo/eq/filter",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "input~.module.maxpat",
				"bootpath" : "~/Documents/JamomaMax/Jamoma/patchers/models/audio/stereo/sources/input",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "input~.view.maxpat",
				"bootpath" : "~/Documents/JamomaMax/Jamoma/patchers/models/audio/stereo/sources/input",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "input~.model.maxpat",
				"bootpath" : "~/Documents/JamomaMax/Jamoma/patchers/models/audio/stereo/sources/input",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "orsize%.module.maxpat",
				"bootpath" : "~/Documents/JamomaMax/Jamoma/patchers/models/video/fx/orsize%",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "orsize%.model.maxpat",
				"bootpath" : "~/Documents/JamomaMax/Jamoma/patchers/models/video/fx/orsize%",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "orsize%.view.maxpat",
				"bootpath" : "~/Documents/JamomaMax/Jamoma/patchers/models/video/fx/orsize%",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.list2parameter.maxpat",
				"bootpath" : "~/Documents/JamomaMax/Jamoma/patchers/components/data/list2parameter",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "movie%.module.maxpat",
				"bootpath" : "~/Documents/JamomaMax/Jamoma/patchers/models/video/sources/movie%",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "movie%.model.maxpat",
				"bootpath" : "~/Documents/JamomaMax/Jamoma/patchers/models/video/sources/movie%",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "movie%.view.maxpat",
				"bootpath" : "~/Documents/JamomaMax/Jamoma/patchers/models/video/sources/movie%",
				"type" : "JSON",
				"implicit" : 1
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
				"name" : "j.model.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.out.mxo",
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
				"name" : "j.oscroute.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.stats.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.pass.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.receive.mxo",
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
				"name" : "j.map.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.parameter_array.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.send.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.remote_array.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.out~.mxo",
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
, 			{
				"name" : "j.savebang.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.unit.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.namespace.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.init.mxo",
				"type" : "iLaX"
			}
 ],
		"autosave" : 0
	}

}
