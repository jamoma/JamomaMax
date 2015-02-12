{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 6,
			"minor" : 1,
			"revision" : 7,
			"architecture" : "x86"
		}
,
		"rect" : [ 219.0, 52.0, 823.0, 651.0 ],
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
		"showrootpatcherontab" : 0,
		"showontab" : 0,
		"boxes" : [ 			{
				"box" : 				{
					"annotation" : "none",
					"color" : [ 0.619608, 0.0, 0.360784, 0.701961 ],
					"fontname" : "Arial",
					"fontsize" : 14.0,
					"id" : "obj-5",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 0,
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 7,
							"architecture" : "x86"
						}
,
						"rect" : [ 0.0, 26.0, 823.0, 625.0 ],
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
						"showontab" : 1,
						"boxes" : [ 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-6",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 325.0, 319.0, 96.0, 18.0 ],
									"text" : "thisMessage 18"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"hidden" : 1,
									"id" : "obj-8",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 402.0, 26.0, 142.0, 20.0 ],
									"text" : "save a preset for this tab"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-4",
									"maxclass" : "button",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 378.0, 26.0, 20.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"hidden" : 1,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 378.0, 56.0, 80.0, 20.0 ],
									"text" : "j.helpHelper"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-15",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 420.0, 228.0, 195.0, 20.0 ],
									"text" : "this is another story using modules"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-13",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 434.0, 86.0, 150.0, 20.0 ],
									"text" : "one model to rule them all"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-5",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 378.0, 86.0, 49.0, 20.0 ],
									"text" : "j.model"
								}

							}
, 							{
								"box" : 								{
									"annotation" : "none",
									"id" : "obj-11",
									"maxclass" : "bpatcher",
									"name" : "output~.module.maxpat",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 26.0, 372.0, 300.0, 175.0 ],
									"presentation_rect" : [ 30.0, 30.0, 300.0, 175.0 ]
								}

							}
, 							{
								"box" : 								{
									"annotation" : "none",
									"id" : "obj-7",
									"maxclass" : "bpatcher",
									"name" : "input~.module.maxpat",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "signal", "signal", "" ],
									"patching_rect" : [ 26.0, 26.0, 300.0, 175.0 ],
									"presentation_rect" : [ 30.0, 30.0, 300.0, 175.0 ]
								}

							}
, 							{
								"box" : 								{
									"annotation" : "none",
									"id" : "obj-26",
									"lockeddragscroll" : 1,
									"maxclass" : "bpatcher",
									"name" : "template~.module.maxpat",
									"numinlets" : 2,
									"numoutlets" : 3,
									"outlettype" : [ "signal", "signal", "" ],
									"patching_rect" : [ 26.0, 228.0, 300.0, 70.0 ],
									"presentation_rect" : [ 45.0, 45.0, 300.0, 70.0 ],
									"varname" : "/filter~"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-11", 1 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-26", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-11", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-26", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-6", 1 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-26", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-4", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-26", 1 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-26", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 14.21875, 94.0, 75.0, 22.0 ],
					"saved_object_attributes" : 					{
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"default_fontsize" : 12.0,
						"description" : "",
						"digest" : "",
						"fontface" : 0,
						"fontname" : "Arial",
						"fontsize" : 12.0,
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p modules",
					"varname" : "basic[1]"
				}

			}
, 			{
				"box" : 				{
					"bubble" : 1,
					"bubbletextmargin" : 10,
					"fontname" : "Helvetica Neue",
					"fontsize" : 12.0,
					"frgb" : 0.0,
					"id" : "obj-12",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 82.4375, 155.0, 221.0, 34.0 ],
					"text" : "this one should stay the last one",
					"textcolor" : [ 0.3, 0.3, 0.3, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bubble" : 1,
					"bubbleside" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frgb" : 0.0,
					"id" : "obj-13",
					"linecount" : 6,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 533.0, 3.5, 114.0, 106.0 ],
					"text" : "When you are done documenting a model, right-click on the tab bar and untick \"Show Root Patcher on Tab\""
				}

			}
, 			{
				"box" : 				{
					"bubble" : 1,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frgb" : 0.0,
					"id" : "obj-9",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 69.21875, 54.0, 178.0, 24.0 ],
					"text" : "This is where the models go "
				}

			}
, 			{
				"box" : 				{
					"annotation" : "none",
					"color" : [ 0.619608, 0.0, 0.360784, 0.701961 ],
					"fontname" : "Arial",
					"fontsize" : 14.0,
					"id" : "obj-34",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 0,
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 7,
							"architecture" : "x86"
						}
,
						"rect" : [ 219.0, 78.0, 823.0, 625.0 ],
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
						"showontab" : 1,
						"boxes" : [ 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"hidden" : 1,
									"id" : "obj-8",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 398.0, 94.0, 142.0, 20.0 ],
									"text" : "save a preset for this tab"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-3",
									"maxclass" : "button",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 374.0, 94.0, 20.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 374.0, 124.0, 80.0, 20.0 ],
									"text" : "j.helpHelper"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-15",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 374.0, 356.0, 150.0, 20.0 ],
									"text" : "this is a nice story "
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-13",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 430.0, 154.0, 150.0, 20.0 ],
									"text" : "one model to rule them all"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-5",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 374.0, 154.0, 49.0, 20.0 ],
									"text" : "j.model"
								}

							}
, 							{
								"box" : 								{
									"annotation" : "none",
									"id" : "obj-11",
									"maxclass" : "bpatcher",
									"name" : "output~.view.maxpat",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 22.0, 440.0, 300.0, 175.0 ],
									"presentation_rect" : [ 15.0, 15.0, 300.0, 175.0 ]
								}

							}
, 							{
								"box" : 								{
									"annotation" : "none",
									"id" : "obj-7",
									"maxclass" : "bpatcher",
									"name" : "input~.view.maxpat",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 22.0, 105.0, 300.0, 175.0 ],
									"presentation_rect" : [ 15.0, 15.0, 300.0, 175.0 ]
								}

							}
, 							{
								"box" : 								{
									"annotation" : "none",
									"id" : "obj-26",
									"lockeddragscroll" : 1,
									"maxclass" : "bpatcher",
									"name" : "template~.view.maxpat",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 22.0, 322.0, 300.0, 70.0 ],
									"presentation_rect" : [ 30.0, 30.0, 300.0, 70.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-2",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 398.0, 290.0, 132.0, 18.0 ],
									"text" : "thisParameter 2."
								}

							}
, 							{
								"box" : 								{
									"args" : [ "@name", "filter~.model", "@description", "A simple filter model" ],
									"bgmode" : 1,
									"id" : "obj-4",
									"maxclass" : "bpatcher",
									"name" : "j.maxhelpui.maxpat",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 0.0, 0.0, 823.0, 70.0 ],
									"prototypename" : "bphelp",
									"varname" : "maxhelpui"
								}

							}
, 							{
								"box" : 								{
									"annotation" : "A generic audio output model with built in master saturation, limiter, and recording abilities.",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-33",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 374.0, 260.0, 131.0, 20.0 ],
									"text" : "output~.model output~"
								}

							}
, 							{
								"box" : 								{
									"annotation" : "Provide a brief description of this model.",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-32",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 3,
									"outlettype" : [ "signal", "signal", "" ],
									"patching_rect" : [ 374.0, 224.0, 156.0, 20.0 ],
									"text" : "template~.model template~"
								}

							}
, 							{
								"box" : 								{
									"annotation" : "none",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-30",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "signal", "signal", "" ],
									"patching_rect" : [ 374.0, 189.0, 132.0, 20.0 ],
									"text" : "input~.model input~"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-3", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-32", 1 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-30", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-32", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-30", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-2", 1 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-32", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-33", 1 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-32", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-33", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-32", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 6.21875, 54.0, 68.0, 22.0 ],
					"saved_object_attributes" : 					{
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"default_fontsize" : 12.0,
						"description" : "",
						"digest" : "",
						"fontface" : 0,
						"fontname" : "Arial",
						"fontsize" : 12.0,
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p a_story",
					"varname" : "basic"
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
							"major" : 6,
							"minor" : 1,
							"revision" : 7,
							"architecture" : "x86"
						}
,
						"rect" : [ 0.0, 26.0, 823.0, 625.0 ],
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
						"showontab" : 1,
						"boxes" : [  ],
						"lines" : [  ]
					}
,
					"patching_rect" : [ 20.21875, 162.0, 50.0, 20.0 ],
					"saved_object_attributes" : 					{
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"default_fontsize" : 12.0,
						"description" : "",
						"digest" : "",
						"fontface" : 0,
						"fontname" : "Arial",
						"fontsize" : 12.0,
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p ?",
					"varname" : "q_tab"
				}

			}
 ],
		"lines" : [  ],
		"parameters" : 		{
			"obj-5::obj-7::obj-1::obj-1::obj-45" : [ "live.text[2]", "live.text", 0 ],
			"obj-34::obj-7::obj-108" : [ "live.text[26]", "live.text[4]", 0 ],
			"obj-5::obj-7::obj-1::obj-1::obj-42" : [ "live.text[1]", "live.text", 0 ],
			"obj-34::obj-11::obj-111" : [ "live.numbox[4]", "live.numbox[2]", 0 ],
			"obj-34::obj-7::obj-1::obj-27" : [ "Threshold[1]", "Threshold", 0 ],
			"obj-5::obj-7::obj-1::obj-1::obj-27" : [ "Threshold", "Threshold", 0 ],
			"obj-5::obj-7::obj-1::obj-1::obj-15" : [ "Postamp", "Postamp", 0 ],
			"obj-5::obj-11::obj-1::obj-111" : [ "live.numbox[10]", "live.numbox[2]", 0 ],
			"obj-34::obj-7::obj-59" : [ "live.text[19]", "live.text[3]", 0 ],
			"obj-34::obj-7::obj-74" : [ "live.dial[5]", "Transpose", 0 ],
			"obj-5::obj-7::obj-1::obj-45" : [ "live.numbox", "live.numbox", 0 ],
			"obj-5::obj-7::obj-1::obj-58" : [ "live.text[28]", "live.text[4]", 0 ],
			"obj-5::obj-7::obj-1::obj-1::obj-6" : [ "live.text", "live.text", 0 ],
			"obj-34::obj-11::obj-102" : [ "live.text[11]", "live.text", 0 ],
			"obj-34::obj-11::obj-106" : [ "live.dial[3]", "Release", 0 ],
			"obj-34::obj-7::obj-45" : [ "live.numbox[8]", "live.numbox", 0 ],
			"obj-5::obj-7::obj-1::obj-74" : [ "live.dial[1]", "Transpose", 0 ],
			"obj-5::obj-7::obj-1::obj-29::obj-48" : [ "live.menu[1]", "live.menu", 0 ],
			"obj-5::obj-7::obj-1::obj-62" : [ "live.text[5]", "live.text[3]", 0 ],
			"obj-34::obj-7::obj-58" : [ "live.text[20]", "live.text[4]", 0 ],
			"obj-5::obj-7::obj-1::obj-47" : [ "live.numbox[3]", "live.numbox", 0 ],
			"obj-5::obj-7::obj-1::obj-108" : [ "live.text[4]", "live.text[4]", 0 ],
			"obj-34::obj-7::obj-82" : [ "pan[4]", "Pan", 0 ],
			"obj-34::obj-11::obj-90" : [ "live.text[10]", "live.text[1]", 0 ],
			"obj-5::obj-7::obj-1::obj-24" : [ "Master Gain", "Master Gain", 0 ],
			"obj-5::obj-11::obj-1::obj-110" : [ "live.numbox[11]", "live.numbox[1]", 0 ],
			"obj-5::obj-7::obj-1::obj-4" : [ "live.text[29]", "live.text[1]", 0 ],
			"obj-5::obj-11::obj-1::obj-102" : [ "live.text[23]", "live.text", 0 ],
			"obj-5::obj-11::obj-1::obj-100" : [ "live.text[30]", "live.text[1]", 0 ],
			"obj-34::obj-7::obj-24" : [ "Master Gain[4]", "Master Gain", 0 ],
			"obj-34::obj-7::obj-47" : [ "live.numbox[7]", "live.numbox", 0 ],
			"obj-5::obj-7::obj-1::obj-48" : [ "live.menu[13]", "live.menu", 0 ],
			"obj-5::obj-11::obj-1::obj-99" : [ "live.menu[2]", "live.menu[2]", 0 ],
			"obj-5::obj-7::obj-1::obj-59" : [ "live.text[3]", "live.text[3]", 0 ],
			"obj-34::obj-7::obj-1::obj-42" : [ "live.text[16]", "live.text", 0 ],
			"obj-34::obj-7::obj-62" : [ "live.text[18]", "live.text[3]", 0 ],
			"obj-34::obj-7::obj-1::obj-6" : [ "live.text[17]", "live.text", 0 ],
			"obj-5::obj-7::obj-1::obj-1::obj-12" : [ "Lookahead", "Lookahead", 0 ],
			"obj-34::obj-7::obj-1::obj-30" : [ "live.menu[10]", "live.menu", 0 ],
			"obj-34::obj-7::obj-1::obj-15" : [ "Postamp[1]", "Postamp", 0 ],
			"obj-5::obj-11::obj-1::obj-98" : [ "live.menu[14]", "live.menu", 0 ],
			"obj-34::obj-11::obj-97" : [ "live.numbox[6]", "CPU", 0 ],
			"obj-34::obj-11::obj-103" : [ "live.text[12]", "live.text", 0 ],
			"obj-5::obj-7::obj-1::obj-1::obj-5" : [ "Preamp", "Preamp", 0 ],
			"obj-34::obj-7::obj-29::obj-48" : [ "live.menu[12]", "live.menu", 0 ],
			"obj-5::obj-11::obj-1::obj-90" : [ "live.text[24]", "live.text[1]", 0 ],
			"obj-5::obj-11::obj-1::obj-104" : [ "live.dial[8]", "Depth", 0 ],
			"obj-34::obj-7::obj-1::obj-12" : [ "Lookahead[1]", "Lookahead", 0 ],
			"obj-34::obj-11::obj-108" : [ "live.text[8]", "live.text[4]", 0 ],
			"obj-5::obj-7::obj-1::obj-110" : [ "live.numbox[1]", "live.numbox[1]", 0 ],
			"obj-34::obj-7::obj-1::obj-45" : [ "live.text[15]", "live.text", 0 ],
			"obj-34::obj-7::obj-111" : [ "live.numbox[9]", "live.numbox[2]", 0 ],
			"obj-5::obj-11::obj-1::obj-108" : [ "live.text[21]", "live.text[4]", 0 ],
			"obj-34::obj-7::obj-110" : [ "live.numbox[14]", "live.numbox[1]", 0 ],
			"obj-5::obj-11::obj-1::obj-82" : [ "pan[2]", "Pan", 0 ],
			"obj-5::obj-7::obj-1::obj-1::obj-30" : [ "live.menu", "live.menu", 0 ],
			"obj-34::obj-11::obj-99" : [ "live.menu[4]", "live.menu[2]", 0 ],
			"obj-34::obj-11::obj-104" : [ "live.dial[2]", "Depth", 0 ],
			"obj-5::obj-11::obj-1::obj-53" : [ "Master Gain[2]", "Master Gain", 0 ],
			"obj-34::obj-11::obj-107" : [ "live.dial[4]", "Preamp", 0 ],
			"obj-34::obj-11::obj-100" : [ "live.text[9]", "live.text[1]", 0 ],
			"obj-5::obj-7::obj-1::obj-1::obj-13" : [ "Release", "Release", 0 ],
			"obj-5::obj-11::obj-1::obj-106" : [ "live.dial[7]", "Release", 0 ],
			"obj-5::obj-11::obj-1::obj-107" : [ "live.dial[6]", "Preamp", 0 ],
			"obj-34::obj-11::obj-110" : [ "live.numbox[5]", "live.numbox[1]", 0 ],
			"obj-5::obj-11::obj-1::obj-103" : [ "live.text[22]", "live.text", 0 ],
			"obj-34::obj-11::obj-82" : [ "pan[1]", "Pan", 0 ],
			"obj-5::obj-11::obj-1::obj-97" : [ "live.numbox[12]", "CPU", 0 ],
			"obj-34::obj-7::obj-1::obj-5" : [ "Preamp[1]", "Preamp", 0 ],
			"obj-34::obj-7::obj-4" : [ "live.text[27]", "live.text[1]", 0 ],
			"obj-5::obj-7::obj-1::obj-111" : [ "live.numbox[2]", "live.numbox[2]", 0 ],
			"obj-34::obj-7::obj-1::obj-13" : [ "Release[1]", "Release", 0 ],
			"obj-34::obj-11::obj-53" : [ "Master Gain[1]", "Master Gain", 0 ],
			"obj-34::obj-11::obj-98" : [ "live.menu[3]", "live.menu", 0 ],
			"obj-5::obj-7::obj-1::obj-82" : [ "pan", "Pan", 0 ],
			"obj-34::obj-7::obj-48" : [ "live.menu[11]", "live.menu", 0 ]
		}
,
		"dependency_cache" : [ 			{
				"name" : "input~.model.maxpat",
				"bootpath" : "/Users/mathieuchamagne/Documents/GITHUB/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/Sources/input~",
				"patcherrelativepath" : "../../patchers/modules/audio/stereo/Sources/input~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "limiter~.model.maxpat",
				"bootpath" : "/Users/mathieuchamagne/Documents/GITHUB/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/Dynamics/limiter~",
				"patcherrelativepath" : "../../patchers/modules/audio/stereo/Dynamics/limiter~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "limiter.parametersAndMessages.maxpat",
				"bootpath" : "/Users/mathieuchamagne/Documents/GITHUB/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/Dynamics/limiter~",
				"patcherrelativepath" : "../../patchers/modules/audio/stereo/Dynamics/limiter~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "thru.maxpat",
				"bootpath" : "/Applications/Max 6.1/patches/m4l-patches/Pluggo for Live resources/patches",
				"patcherrelativepath" : "../../../../../../../../../../Applications/Max 6.1/patches/m4l-patches/Pluggo for Live resources/patches",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "balance~.model.maxpat",
				"bootpath" : "/Users/mathieuchamagne/Documents/GITHUB/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/Imaging/balance~",
				"patcherrelativepath" : "../../patchers/modules/audio/stereo/Imaging/balance~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "template~.model.maxpat",
				"bootpath" : "/Users/mathieuchamagne/Documents/GITHUB/Jamoma/Implementations/Max/Jamoma/templates/Jamoma Audio Model",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.parameterCreate.maxpat",
				"bootpath" : "/Users/mathieuchamagne/Documents/GITHUB/Jamoma/Implementations/Max/Jamoma/patchers/components/data/parameterCreate",
				"patcherrelativepath" : "../../patchers/components/data/parameterCreate",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.thisparentpatcher.js",
				"bootpath" : "/Users/mathieuchamagne/Documents/GITHUB/Jamoma/Implementations/Max/Jamoma/javascript",
				"patcherrelativepath" : "../../javascript",
				"type" : "TEXT",
				"implicit" : 1
			}
, 			{
				"name" : "j.parameterCreatePresetDoc.js",
				"bootpath" : "/Users/mathieuchamagne/Documents/GITHUB/Jamoma/Implementations/Max/Jamoma/javascript",
				"patcherrelativepath" : "../../javascript",
				"type" : "TEXT",
				"implicit" : 1
			}
, 			{
				"name" : "output~.model.maxpat",
				"bootpath" : "/Users/mathieuchamagne/Documents/GITHUB/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/Output/output~",
				"patcherrelativepath" : "../../patchers/modules/audio/stereo/Output/output~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "saturation~.model.maxpat",
				"bootpath" : "/Users/mathieuchamagne/Documents/GITHUB/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/Distortion/saturation~",
				"patcherrelativepath" : "../../patchers/modules/audio/stereo/Distortion/saturation~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "record~.model.maxpat",
				"bootpath" : "/Users/mathieuchamagne/Documents/GITHUB/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/Output/record~",
				"patcherrelativepath" : "../../patchers/modules/audio/stereo/Output/record~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "record.parametersAndMessages.maxpat",
				"bootpath" : "/Users/mathieuchamagne/Documents/GITHUB/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/Output/record~",
				"patcherrelativepath" : "../../patchers/modules/audio/stereo/Output/record~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.maxhelpui.maxpat",
				"bootpath" : "/Users/mathieuchamagne/Documents/GITHUB/Jamoma/Implementations/Max/Jamoma/patchers/components/data/maxhelpui",
				"patcherrelativepath" : "../../patchers/components/data/maxhelpui",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.maxhelpuiButton.png",
				"bootpath" : "/Users/mathieuchamagne/Documents/GITHUB/Jamoma/Implementations/Max/Jamoma/patchers/components/data/maxhelpui",
				"patcherrelativepath" : "../../patchers/components/data/maxhelpui",
				"type" : "PNG ",
				"implicit" : 1
			}
, 			{
				"name" : "j.maxhelpuiResize.js",
				"bootpath" : "/Users/mathieuchamagne/Documents/GITHUB/Jamoma/Implementations/Max/Jamoma/patchers/components/data/maxhelpui",
				"patcherrelativepath" : "../../patchers/components/data/maxhelpui",
				"type" : "TEXT",
				"implicit" : 1
			}
, 			{
				"name" : "j.jamomaPath.maxpat",
				"bootpath" : "/Users/mathieuchamagne/Documents/GITHUB/Jamoma/Implementations/Max/Jamoma/patchers/components/data/jamomaPath",
				"patcherrelativepath" : "../../patchers/components/data/jamomaPath",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "template~.view.maxpat",
				"bootpath" : "/Users/mathieuchamagne/Documents/GITHUB/Jamoma/Implementations/Max/Jamoma/templates/Jamoma Audio Model",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "input~.view.maxpat",
				"bootpath" : "/Users/mathieuchamagne/Documents/GITHUB/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/Sources/input~",
				"patcherrelativepath" : "../../patchers/modules/audio/stereo/Sources/input~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "limiter~.view.maxpat",
				"bootpath" : "/Users/mathieuchamagne/Documents/GITHUB/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/Dynamics/limiter~",
				"patcherrelativepath" : "../../patchers/modules/audio/stereo/Dynamics/limiter~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "output~.view.maxpat",
				"bootpath" : "/Users/mathieuchamagne/Documents/GITHUB/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/Output/output~",
				"patcherrelativepath" : "../../patchers/modules/audio/stereo/Output/output~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "",
				"bootpath" : "/",
				"patcherrelativepath" : "../../../../../../../../../..",
				"type" : "fold",
				"implicit" : 1
			}
, 			{
				"name" : "j.helpHelper.maxpat",
				"bootpath" : "/Users/mathieuchamagne/Documents/GITHUB/Jamoma/Implementations/Max/Jamoma/patchers/components/data/helpHelper",
				"patcherrelativepath" : "../../patchers/components/data/helpHelper",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.getNameOfRootPatcher.js",
				"bootpath" : "/Users/mathieuchamagne/Documents/GITHUB/Jamoma/Implementations/Max/Jamoma/javascript",
				"patcherrelativepath" : "../../javascript",
				"type" : "TEXT",
				"implicit" : 1
			}
, 			{
				"name" : "template~.module.maxpat",
				"bootpath" : "/Users/mathieuchamagne/Documents/GITHUB/Jamoma/Implementations/Max/Jamoma/templates/Jamoma Audio Model",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "input~.module.maxpat",
				"bootpath" : "/Users/mathieuchamagne/Documents/GITHUB/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/Sources/input~",
				"patcherrelativepath" : "../../patchers/modules/audio/stereo/Sources/input~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "output~.module.maxpat",
				"bootpath" : "/Users/mathieuchamagne/Documents/GITHUB/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/Output/output~",
				"patcherrelativepath" : "../../patchers/modules/audio/stereo/Output/output~",
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
				"name" : "j.map.mxo",
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
				"name" : "j.receive.mxo",
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
				"name" : "j.view.mxo",
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
				"name" : "j.oscroute.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.receive~.mxo",
				"type" : "iLaX"
			}
 ]
	}

}
