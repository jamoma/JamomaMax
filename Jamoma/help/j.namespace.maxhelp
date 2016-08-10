{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 7,
			"minor" : 2,
			"revision" : 4,
			"architecture" : "x64",
			"modernui" : 1
		}
,
		"rect" : [ 3.0, 45.0, 1680.0, 1001.0 ],
		"bgcolor" : [ 0.878431, 0.878431, 0.858824, 1.0 ],
		"editing_bgcolor" : [ 0.878431, 0.878431, 0.858824, 1.0 ],
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
		"lefttoolbarpinned" : 1,
		"toptoolbarpinned" : 1,
		"righttoolbarpinned" : 1,
		"bottomtoolbarpinned" : 1,
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
		"subpatcher_template" : "greyish",
		"showrootpatcherontab" : 0,
		"showontab" : 0,
		"boxes" : [ 			{
				"box" : 				{
					"id" : "obj-12",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 37.195312, 357.0, 24.0, 22.0 ],
					"style" : "",
					"text" : "t b"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-9",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 37.195312, 319.0, 125.0, 22.0 ],
					"style" : "",
					"text" : "r namespacemaxhelp"
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
							"minor" : 2,
							"revision" : 4,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"rect" : [ 0.0, 26.0, 1680.0, 975.0 ],
						"bgcolor" : [ 0.878431, 0.878431, 0.858824, 1.0 ],
						"editing_bgcolor" : [ 0.878431, 0.878431, 0.858824, 1.0 ],
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
						"lefttoolbarpinned" : 1,
						"toptoolbarpinned" : 1,
						"righttoolbarpinned" : 1,
						"bottomtoolbarpinned" : 1,
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
						"subpatcher_template" : "greyish",
						"showontab" : 1,
						"boxes" : [ 							{
								"box" : 								{
									"id" : "obj-28",
									"maxclass" : "panel",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 358.0, 788.75, 13.0, 13.0 ],
									"shape" : 3,
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-19",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 577.0, 757.5, 37.0, 22.0 ],
									"style" : "",
									"text" : "open"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-20",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 577.0, 788.5, 53.0, 22.0 ],
									"style" : "",
									"text" : "pcontrol"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-22",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 375.0, 783.75, 179.0, 22.0 ],
									"style" : "",
									"text" : "More on selection and @format"
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"bubbleside" : 3,
									"bubbletextmargin" : 10,
									"id" : "obj-10",
									"linecount" : 3,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 1124.0, 538.0, 160.0, 61.0 ],
									"style" : "",
									"text" : "Only selected addresses are stored in a state"
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"bubbleside" : 3,
									"bubbletextmargin" : 10,
									"id" : "obj-9",
									"linecount" : 3,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 1130.0, 331.0, 160.0, 61.0 ],
									"style" : "",
									"text" : "See how items are checked depending on their selection state."
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"bubbleside" : 3,
									"bubbletextmargin" : 10,
									"id" : "obj-1",
									"linecount" : 3,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 1142.0, 233.5, 143.0, 61.0 ],
									"style" : "",
									"text" : "Refer \"jcue_filter\" with this j.namespace"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-8",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 1331.5, 387.0, 59.0, 22.0 ],
									"style" : "",
									"text" : "select $1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-27",
									"linecount" : 2,
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 1291.0, 248.0, 132.0, 35.0 ],
									"style" : "",
									"text" : "namespace jcue_filter, explore"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-25",
									"items" : [ "degrade.1", ",", "degrade.2", ",", "eq", ",", "input", ",", "input/balance", ",", "input/input", ",", "input/input/limiter", ",", "output", ",", "output/balance", ",", "output/limiter", ",", "output/record", ",", "output/saturation" ],
									"maxclass" : "umenu",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "int", "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 1291.0, 359.0, 100.0, 22.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-24",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "" ],
									"patching_rect" : [ 1291.0, 303.0, 190.0, 49.0 ],
									"style" : "",
									"text" : "j.namespace @address / @format umenu @filter/list model @namespace jcue_filter"
								}

							}
, 							{
								"box" : 								{
									"fontsize" : 14.0,
									"id" : "obj-14",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 1291.0, 177.5, 117.0, 22.0 ],
									"style" : "",
									"text" : "Shared selection"
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"bubbletextmargin" : 10,
									"id" : "obj-13",
									"linecount" : 4,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 366.0, 360.5, 112.0, 74.0 ],
									"style" : "",
									"text" : "j.namespace is named \"jcue_filter\" (required)"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-77",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patcher" : 									{
										"fileversion" : 1,
										"appversion" : 										{
											"major" : 7,
											"minor" : 2,
											"revision" : 4,
											"architecture" : "x64",
											"modernui" : 1
										}
,
										"rect" : [ 267.0, 142.0, 1100.0, 732.0 ],
										"bgcolor" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
										"editing_bgcolor" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
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
										"lefttoolbarpinned" : 1,
										"toptoolbarpinned" : 1,
										"righttoolbarpinned" : 1,
										"bottomtoolbarpinned" : 1,
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
										"subpatcher_template" : "greyish",
										"boxes" : [ 											{
												"box" : 												{
													"comment" : "",
													"hidden" : 1,
													"id" : "obj-33",
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 307.0, 293.0, 30.0, 30.0 ],
													"style" : ""
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Lato Regular",
													"fontsize" : 12.0,
													"id" : "obj-31",
													"linecount" : 3,
													"maxclass" : "comment",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 774.25, 636.0, 279.0, 50.0 ],
													"style" : "",
													"text" : "When using '@format jit.cellblock', j.namespace displays addresses selection state as a jit.cellblock cell color message. Colors are hardcoded.",
													"textcolor" : [ 0.113725, 0.607843, 0.607843, 1.0 ]
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Lato Regular",
													"fontsize" : 12.0,
													"id" : "obj-30",
													"linecount" : 3,
													"maxclass" : "comment",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 367.0, 636.0, 279.0, 50.0 ],
													"style" : "",
													"text" : "When using '@format umenu' (and _prefix variant), j.namespace uses umenu's check mark option to display selection state",
													"textcolor" : [ 0.113725, 0.607843, 0.607843, 1.0 ]
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Lato Regular",
													"fontsize" : 12.0,
													"id" : "obj-28",
													"linecount" : 4,
													"maxclass" : "comment",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 35.0, 636.0, 273.0, 64.0 ],
													"style" : "",
													"text" : "When using '@format none', j.namespace outputs  the message \"selection\" followed by a list of boolean values asociated with every filtered address",
													"textcolor" : [ 0.113725, 0.607843, 0.607843, 1.0 ]
												}

											}
, 											{
												"box" : 												{
													"bgcolor" : [ 0.3, 0.3, 0.3, 1.0 ],
													"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
													"celldef" : [ [ 0, 0, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 0, 0.619608, 0.0, 0.360784, 1.0, -1, -1, -1 ], [ 0, 1, 0, 0, 0.819608, 0.819608, 0.819608, 1.0, 0, 0.619608, 0.0, 0.360784, 1.0, -1, -1, -1 ], [ 0, 2, 0, 0, 0.819608, 0.819608, 0.819608, 1.0, 0, 0.619608, 0.0, 0.360784, 1.0, -1, -1, -1 ], [ 0, 3, 0, 0, 0.819608, 0.819608, 0.819608, 1.0, 0, 0.619608, 0.0, 0.360784, 1.0, -1, -1, -1 ], [ 0, 4, 0, 0, 0.819608, 0.819608, 0.819608, 1.0, 0, 0.619608, 0.0, 0.360784, 1.0, -1, -1, -1 ] ],
													"cellmap" : [ [ 0, 0, "degrade.1" ], [ 0, 1, "degrade.2" ], [ 0, 2, "eq" ], [ 0, 3, "input" ], [ 0, 4, "output" ] ],
													"cols" : 1,
													"colwidth" : 196,
													"fgcolor" : [ 0.819608, 0.819608, 0.819608, 1.0 ],
													"fontface" : 0,
													"fontname" : "Lato Regular",
													"fontsize" : 12.0,
													"gridlinecolor" : [ 0.0, 0.0, 0.0, 1.0 ],
													"hcellcolor" : [ 0.7, 0.7, 0.7, 0.76 ],
													"hscroll" : 0,
													"id" : "obj-21",
													"maxclass" : "jit.cellblock",
													"numinlets" : 2,
													"numoutlets" : 4,
													"outlettype" : [ "list", "", "", "" ],
													"patching_rect" : [ 807.0, 306.0, 213.5, 173.75 ],
													"rows" : 5,
													"savemode" : 1,
													"stcolor" : [ 0.8, 0.8, 0.8, 1.0 ]
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-10",
													"maxclass" : "toggle",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "int" ],
													"parameter_enable" : 0,
													"patching_rect" : [ 833.0, 87.0, 24.0, 24.0 ],
													"style" : ""
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-16",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 833.0, 122.0, 88.0, 22.0 ],
													"style" : "",
													"text" : "select input $1"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-17",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 807.0, 43.0, 50.0, 22.0 ],
													"style" : "",
													"text" : "explore"
												}

											}
, 											{
												"box" : 												{
													"color" : [ 0.989256, 0.417462, 0.031845, 1.0 ],
													"id" : "obj-19",
													"linecount" : 6,
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 3,
													"outlettype" : [ "", "", "" ],
													"patching_rect" : [ 807.0, 163.0, 147.0, 89.0 ],
													"style" : "",
													"text" : "j.namespace @namespace sel-and-format @format jit.cellblock @filter/list model @address / @depth 1"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-34",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 485.0, 362.0, 59.0, 22.0 ],
													"style" : "",
													"text" : "select $1"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-32",
													"items" : [ "degrade.1", ",", "degrade.2", ",", "eq", ",", "input", ",", "output" ],
													"maxclass" : "umenu",
													"numinlets" : 1,
													"numoutlets" : 3,
													"outlettype" : [ "int", "", "" ],
													"parameter_enable" : 0,
													"patching_rect" : [ 428.0, 323.0, 133.0, 22.0 ],
													"style" : ""
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-18",
													"maxclass" : "toggle",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "int" ],
													"parameter_enable" : 0,
													"patching_rect" : [ 454.0, 87.0, 24.0, 24.0 ],
													"style" : ""
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-26",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 454.0, 122.0, 116.0, 22.0 ],
													"style" : "",
													"text" : "select degrade.1 $1"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-27",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 428.0, 43.0, 50.0, 22.0 ],
													"style" : "",
													"text" : "explore"
												}

											}
, 											{
												"box" : 												{
													"color" : [ 0.989256, 0.417462, 0.031845, 1.0 ],
													"id" : "obj-29",
													"linecount" : 6,
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 3,
													"outlettype" : [ "", "", "" ],
													"patching_rect" : [ 428.0, 163.0, 133.0, 89.0 ],
													"style" : "",
													"text" : "j.namespace @namespace sel-and-format @format umenu @filter/list model @address / @depth 1"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-14",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 2,
													"outlettype" : [ "", "" ],
													"patching_rect" : [ 35.0, 483.0, 40.0, 22.0 ],
													"style" : "",
													"text" : "zl.reg"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-8",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "bang", "" ],
													"patching_rect" : [ 35.0, 456.0, 89.0, 22.0 ],
													"style" : "",
													"text" : "t b l"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-5",
													"maxclass" : "toggle",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "int" ],
													"parameter_enable" : 0,
													"patching_rect" : [ 61.0, 87.0, 24.0, 24.0 ],
													"style" : ""
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-3",
													"linecount" : 3,
													"maxclass" : "textedit",
													"numinlets" : 1,
													"numoutlets" : 4,
													"outlettype" : [ "", "int", "", "" ],
													"parameter_enable" : 0,
													"patching_rect" : [ 122.0, 323.0, 101.0, 114.0 ],
													"style" : "",
													"text" : "degrade.1 degrade.2 eq input output"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-20",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 112.5, 230.0, 49.0, 22.0 ],
													"style" : "",
													"text" : "size $1"
												}

											}
, 											{
												"box" : 												{
													"disabled" : [ 0, 0, 0, 0, 0 ],
													"id" : "obj-15",
													"itemtype" : 1,
													"maxclass" : "radiogroup",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"parameter_enable" : 0,
													"patching_rect" : [ 35.0, 323.0, 18.0, 82.0 ],
													"size" : 5,
													"style" : "",
													"values" : [ 1, 1, 1, 1, 1 ]
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-13",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 122.0, 289.0, 74.0, 22.0 ],
													"style" : "",
													"text" : "prepend set"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-12",
													"linecount" : 2,
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 35.0, 578.0, 188.0, 35.0 ],
													"style" : "",
													"text" : "degrade.1 1 degrade.2 1 eq 1 input 1 output 1"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-11",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 2,
													"outlettype" : [ "", "" ],
													"patching_rect" : [ 35.0, 525.0, 89.0, 22.0 ],
													"style" : "",
													"text" : "zl.lace"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-9",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 61.0, 122.0, 95.0, 22.0 ],
													"style" : "",
													"text" : "select output $1"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-6",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 35.0, 43.0, 50.0, 22.0 ],
													"style" : "",
													"text" : "explore"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-2",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 2,
													"outlettype" : [ "", "" ],
													"patching_rect" : [ 35.0, 259.0, 106.0, 22.0 ],
													"style" : "",
													"text" : "route selection"
												}

											}
, 											{
												"box" : 												{
													"color" : [ 0.989256, 0.417462, 0.031845, 1.0 ],
													"id" : "obj-1",
													"linecount" : 4,
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 3,
													"outlettype" : [ "", "", "" ],
													"patching_rect" : [ 35.0, 163.0, 174.0, 62.0 ],
													"style" : "",
													"text" : "j.namespace @namespace sel-and-format @format none @filter/list model @address / @depth 1"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-23",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 2,
													"outlettype" : [ "", "" ],
													"patching_rect" : [ 807.0, 522.375, 48.0, 22.0 ],
													"style" : "",
													"text" : "route 0"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-41",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 807.0, 492.0, 32.5, 22.0 ],
													"style" : "",
													"text" : "$3"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-24",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 836.0, 553.0, 59.0, 22.0 ],
													"style" : "",
													"text" : "select $1"
												}

											}
 ],
										"lines" : [ 											{
												"patchline" : 												{
													"destination" : [ "obj-2", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-1", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-20", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-1", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-16", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-10", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-12", 1 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-11", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-3", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-13", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-11", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-14", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-19", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-16", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-19", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-17", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-26", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-18", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-21", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-19", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-13", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-2", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-14", 1 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-2", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-15", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-2", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-8", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-2", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-15", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-20", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-41", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-21", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-24", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-23", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-19", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"midpoints" : [ 845.5, 586.0, 792.0, 586.0, 792.0, 153.0, 816.5, 153.0 ],
													"source" : [ "obj-24", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-29", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-26", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-29", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-27", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-32", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-29", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-34", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-32", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-29", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"midpoints" : [ 494.5, 396.0, 414.0, 396.0, 414.0, 191.0, 437.5, 191.0 ],
													"source" : [ "obj-34", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-23", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-41", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-9", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-5", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-1", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-6", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-11", 1 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-8", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-14", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-8", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-1", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-9", 0 ]
												}

											}
 ],
										"styles" : [ 											{
												"name" : "jpatcher001",
												"parentstyle" : "",
												"multi" : 0
											}
 ]
									}
,
									"patching_rect" : [ 577.0, 837.0, 110.0, 22.0 ],
									"saved_object_attributes" : 									{
										"description" : "",
										"digest" : "",
										"globalpatchername" : "",
										"style" : "",
										"tags" : ""
									}
,
									"style" : "",
									"text" : "p selection_format"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-71",
									"ignoreclick" : 1,
									"legacytextcolor" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 770.0, 405.0, 24.0, 24.0 ],
									"rounded" : 180.0,
									"style" : "",
									"text" : "2",
									"usebgoncolor" : 1,
									"usetextovercolor" : 1
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-70",
									"linecount" : 2,
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 1291.0, 552.5, 123.0, 35.0 ],
									"style" : "",
									"text" : "new selected_gains, edit"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-69",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 1318.0, 644.5, 176.0, 33.0 ],
									"style" : "",
									"text" : "Use @namespace attribute to bind to a j.namespace instance"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-68",
									"linecount" : 3,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 848.0, 370.0, 167.0, 47.0 ],
									"style" : "",
									"text" : "jit.namespace automatically (un-)select nodes under a given address"
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"bubbleside" : 3,
									"bubbletextmargin" : 10,
									"id" : "obj-66",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 665.5, 322.0, 155.0, 47.0 ],
									"style" : "",
									"text" : "Whole model address can be used too"
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"bubbleside" : 3,
									"bubbletextmargin" : 10,
									"id" : "obj-65",
									"linecount" : 3,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 725.0, 472.0, 88.0, 61.0 ],
									"style" : "",
									"text" : "Toggles selection state"
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"bubbleside" : 3,
									"bubbletextmargin" : 10,
									"id" : "obj-63",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 721.5, 264.5, 98.0, 47.0 ],
									"style" : "",
									"text" : "(Un-)select address"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-62",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 821.0, 335.5, 69.0, 22.0 ],
									"style" : "",
									"text" : "select eq 0"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-61",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 862.0, 234.0, 91.0, 22.0 ],
									"style" : "",
									"text" : "loadmess set 1"
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"bubbleside" : 2,
									"bubbletextmargin" : 10,
									"id" : "obj-60",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 167.0, 212.5, 277.0, 49.0 ],
									"style" : "",
									"text" : "Filtering addresses containing 'gain' keyword"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-58",
									"ignoreclick" : 1,
									"legacytextcolor" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 133.0, 218.0, 24.0, 24.0 ],
									"rounded" : 180.0,
									"style" : "",
									"text" : "1",
									"usebgoncolor" : 1,
									"usetextovercolor" : 1
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-57",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 821.0, 493.0, 158.0, 22.0 ],
									"style" : "",
									"text" : "select degrade.1/audio/gain"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-56",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patcher" : 									{
										"fileversion" : 1,
										"appversion" : 										{
											"major" : 7,
											"minor" : 2,
											"revision" : 4,
											"architecture" : "x64",
											"modernui" : 1
										}
,
										"rect" : [ 542.0, 201.0, 640.0, 480.0 ],
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
										"lefttoolbarpinned" : 1,
										"toptoolbarpinned" : 1,
										"righttoolbarpinned" : 1,
										"bottomtoolbarpinned" : 1,
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
										"subpatcher_template" : "greyish",
										"boxes" : [ 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-13",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patcher" : 													{
														"fileversion" : 1,
														"appversion" : 														{
															"major" : 7,
															"minor" : 2,
															"revision" : 4,
															"architecture" : "x64",
															"modernui" : 1
														}
,
														"rect" : [ 165.0, 246.0, 190.0, 155.0 ],
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
														"lefttoolbarpinned" : 1,
														"toptoolbarpinned" : 1,
														"righttoolbarpinned" : 1,
														"bottomtoolbarpinned" : 1,
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
														"boxes" : [ 															{
																"box" : 																{
																	"fontname" : "Arial",
																	"fontsize" : 12.0,
																	"id" : "obj-1",
																	"maxclass" : "newobj",
																	"numinlets" : 1,
																	"numoutlets" : 5,
																	"outlettype" : [ "int", "int", "int", "int", "int" ],
																	"patching_rect" : [ 13.0, 12.0, 83.0, 22.0 ],
																	"style" : "",
																	"text" : "modifiers 100"
																}

															}
, 															{
																"box" : 																{
																	"fontname" : "Arial",
																	"fontsize" : 12.0,
																	"id" : "obj-17",
																	"maxclass" : "newobj",
																	"numinlets" : 2,
																	"numoutlets" : 1,
																	"outlettype" : [ "" ],
																	"patching_rect" : [ 56.0, 92.0, 67.0, 22.0 ],
																	"style" : "",
																	"text" : "gate"
																}

															}
, 															{
																"box" : 																{
																	"comment" : "",
																	"id" : "obj-20",
																	"maxclass" : "inlet",
																	"numinlets" : 0,
																	"numoutlets" : 1,
																	"outlettype" : [ "" ],
																	"patching_rect" : [ 104.0, 12.0, 25.0, 25.0 ],
																	"style" : ""
																}

															}
, 															{
																"box" : 																{
																	"comment" : "",
																	"id" : "obj-26",
																	"maxclass" : "outlet",
																	"numinlets" : 1,
																	"numoutlets" : 0,
																	"patching_rect" : [ 56.0, 117.0, 25.0, 25.0 ],
																	"style" : ""
																}

															}
 ],
														"lines" : [ 															{
																"patchline" : 																{
																	"destination" : [ "obj-17", 0 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-1", 4 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-26", 0 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-17", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-17", 1 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-20", 0 ]
																}

															}
 ]
													}
,
													"patching_rect" : [ 79.0, 280.0, 79.0, 22.0 ],
													"saved_object_attributes" : 													{
														"description" : "",
														"digest" : "",
														"globalpatchername" : "",
														"style" : "",
														"tags" : ""
													}
,
													"style" : "",
													"text" : "p press_cmd"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-14",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 2,
													"outlettype" : [ "", "" ],
													"patching_rect" : [ 50.0, 130.375, 48.0, 22.0 ],
													"style" : "",
													"text" : "route 0"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-41",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 50.0, 100.0, 32.5, 22.0 ],
													"style" : "",
													"text" : "$3"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-15",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 79.0, 233.0, 59.0, 22.0 ],
													"style" : "",
													"text" : "select $1"
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-54",
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "list" ],
													"patching_rect" : [ 50.0, 40.0, 30.0, 30.0 ],
													"style" : ""
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-55",
													"maxclass" : "outlet",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 79.0, 335.0, 30.0, 30.0 ],
													"style" : ""
												}

											}
 ],
										"lines" : [ 											{
												"patchline" : 												{
													"destination" : [ "obj-55", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-13", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-15", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-14", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-13", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-15", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-14", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-41", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-41", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-54", 0 ]
												}

											}
 ]
									}
,
									"patching_rect" : [ 133.0, 820.0, 169.0, 22.0 ],
									"saved_object_attributes" : 									{
										"description" : "",
										"digest" : "",
										"globalpatchername" : "",
										"style" : "",
										"tags" : ""
									}
,
									"style" : "",
									"text" : "p cellblock_multiple_selection"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-53",
									"maxclass" : "toggle",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 821.0, 234.0, 24.0, 24.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-49",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 821.0, 278.0, 175.0, 22.0 ],
									"style" : "",
									"text" : "select degrade.2/audio/gain $1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-47",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patcher" : 									{
										"fileversion" : 1,
										"appversion" : 										{
											"major" : 7,
											"minor" : 2,
											"revision" : 4,
											"architecture" : "x64",
											"modernui" : 1
										}
,
										"rect" : [ 556.0, 166.0, 965.0, 768.0 ],
										"bgcolor" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
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
										"lefttoolbarpinned" : 1,
										"toptoolbarpinned" : 1,
										"righttoolbarpinned" : 1,
										"bottomtoolbarpinned" : 1,
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
										"subpatcher_template" : "greyish",
										"boxes" : [ 											{
												"box" : 												{
													"id" : "obj-5",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patcher" : 													{
														"fileversion" : 1,
														"appversion" : 														{
															"major" : 7,
															"minor" : 2,
															"revision" : 4,
															"architecture" : "x64",
															"modernui" : 1
														}
,
														"rect" : [ 550.0, 142.0, 640.0, 480.0 ],
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
														"lefttoolbarpinned" : 1,
														"toptoolbarpinned" : 1,
														"righttoolbarpinned" : 1,
														"bottomtoolbarpinned" : 1,
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
														"subpatcher_template" : "greyish",
														"boxes" : [ 															{
																"box" : 																{
																	"id" : "obj-7",
																	"maxclass" : "newobj",
																	"numinlets" : 1,
																	"numoutlets" : 1,
																	"outlettype" : [ "frgb" ],
																	"patching_rect" : [ 280.25, 398.0, 38.0, 22.0 ],
																	"style" : "",
																	"text" : "t frgb"
																}

															}
, 															{
																"box" : 																{
																	"id" : "obj-6",
																	"maxclass" : "newobj",
																	"numinlets" : 5,
																	"numoutlets" : 1,
																	"outlettype" : [ "" ],
																	"patching_rect" : [ 50.0, 432.0, 326.0, 22.0 ],
																	"style" : "",
																	"text" : "join 5"
																}

															}
, 															{
																"box" : 																{
																	"id" : "obj-1",
																	"maxclass" : "newobj",
																	"numinlets" : 1,
																	"numoutlets" : 5,
																	"outlettype" : [ "", "", "", "", "" ],
																	"patching_rect" : [ 50.0, 85.0, 189.0, 22.0 ],
																	"style" : "",
																	"text" : "unjoin 4"
																}

															}
, 															{
																"box" : 																{
																	"id" : "obj-39",
																	"maxclass" : "message",
																	"numinlets" : 2,
																	"numoutlets" : 1,
																	"outlettype" : [ "" ],
																	"patching_rect" : [ 220.0, 283.0, 77.0, 22.0 ],
																	"style" : "",
																	"text" : "209 209 209"
																}

															}
, 															{
																"box" : 																{
																	"id" : "obj-38",
																	"maxclass" : "message",
																	"numinlets" : 2,
																	"numoutlets" : 1,
																	"outlettype" : [ "" ],
																	"patching_rect" : [ 303.5, 230.0, 57.0, 22.0 ],
																	"style" : "",
																	"text" : "158 0 92"
																}

															}
, 															{
																"box" : 																{
																	"id" : "obj-36",
																	"maxclass" : "newobj",
																	"numinlets" : 1,
																	"numoutlets" : 2,
																	"outlettype" : [ "int", "bang" ],
																	"patching_rect" : [ 288.5, 196.0, 34.0, 22.0 ],
																	"style" : "",
																	"text" : "t 0 b"
																}

															}
, 															{
																"box" : 																{
																	"id" : "obj-34",
																	"maxclass" : "newobj",
																	"numinlets" : 2,
																	"numoutlets" : 1,
																	"outlettype" : [ "" ],
																	"patching_rect" : [ 357.0, 329.0, 54.0, 22.0 ],
																	"style" : "",
																	"text" : "gate 1 1"
																}

															}
, 															{
																"box" : 																{
																	"id" : "obj-33",
																	"maxclass" : "newobj",
																	"numinlets" : 1,
																	"numoutlets" : 3,
																	"outlettype" : [ "bang", "", "int" ],
																	"patching_rect" : [ 220.0, 133.0, 156.0, 22.0 ],
																	"style" : "",
																	"text" : "t b l 1"
																}

															}
, 															{
																"box" : 																{
																	"id" : "obj-25",
																	"maxclass" : "newobj",
																	"numinlets" : 1,
																	"numoutlets" : 1,
																	"outlettype" : [ "" ],
																	"patching_rect" : [ 288.5, 163.0, 93.0, 22.0 ],
																	"style" : "",
																	"text" : "match 158 0 92"
																}

															}
, 															{
																"box" : 																{
																	"comment" : "",
																	"id" : "obj-3",
																	"maxclass" : "inlet",
																	"numinlets" : 0,
																	"numoutlets" : 1,
																	"outlettype" : [ "" ],
																	"patching_rect" : [ 50.0, 40.0, 30.0, 30.0 ],
																	"style" : ""
																}

															}
, 															{
																"box" : 																{
																	"comment" : "",
																	"id" : "obj-4",
																	"maxclass" : "outlet",
																	"numinlets" : 1,
																	"numoutlets" : 0,
																	"patching_rect" : [ 50.0, 469.0, 30.0, 30.0 ],
																	"style" : ""
																}

															}
 ],
														"lines" : [ 															{
																"patchline" : 																{
																	"destination" : [ "obj-33", 0 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-1", 4 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-6", 2 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-1", 2 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-6", 1 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-1", 1 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-6", 0 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-1", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-7", 0 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-1", 3 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-36", 0 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-25", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-1", 0 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-3", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-25", 0 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-33", 1 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-34", 0 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-33", 2 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-39", 0 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-33", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-6", 4 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-34", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-34", 0 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"midpoints" : [ 298.0, 273.0, 366.5, 273.0 ],
																	"source" : [ "obj-36", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-38", 0 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-36", 1 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-34", 1 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"midpoints" : [ 313.0, 265.0, 401.5, 265.0 ],
																	"source" : [ "obj-38", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-34", 1 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"midpoints" : [ 229.5, 316.5, 401.5, 316.5 ],
																	"source" : [ "obj-39", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-4", 0 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-6", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-6", 3 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-7", 0 ]
																}

															}
 ]
													}
,
													"patching_rect" : [ 50.0, 167.21228, 75.0, 22.0 ],
													"saved_object_attributes" : 													{
														"description" : "",
														"digest" : "",
														"globalpatchername" : "",
														"style" : "",
														"tags" : ""
													}
,
													"style" : "",
													"text" : "p set_colors"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Lato Regular",
													"fontsize" : 14.0,
													"id" : "obj-2",
													"linecount" : 9,
													"maxclass" : "comment",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 328.5, 84.21228, 225.0, 158.0 ],
													"style" : "",
													"text" : "When using @format jit.cellblock, j.namespace fakes a multi lines selection in jit.cellblock by setting differents colors for selected cells and unselected cells.\n\nThis abstraction can be removed if you want to use hardcodded j.namespace colors",
													"textcolor" : [ 0.239216, 0.254902, 0.278431, 1.0 ]
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-10",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 2,
													"outlettype" : [ "", "" ],
													"patching_rect" : [ 50.0, 84.21228, 258.0, 22.0 ],
													"style" : "",
													"text" : "routepass cell"
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-45",
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 50.0, 40.0, 30.0, 30.0 ],
													"style" : ""
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-46",
													"maxclass" : "outlet",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 50.0, 507.21228, 30.0, 30.0 ],
													"style" : ""
												}

											}
 ],
										"lines" : [ 											{
												"patchline" : 												{
													"destination" : [ "obj-46", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"midpoints" : [ 298.5, 491.21228, 59.5, 491.21228 ],
													"source" : [ "obj-10", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-5", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-10", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-10", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-45", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-46", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-5", 0 ]
												}

											}
 ]
									}
,
									"patching_rect" : [ 133.0, 425.0, 55.0, 22.0 ],
									"saved_object_attributes" : 									{
										"description" : "",
										"digest" : "",
										"globalpatchername" : "",
										"style" : "",
										"tags" : ""
									}
,
									"style" : "",
									"text" : "p styling"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-23",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 142.75, 852.0, 169.0, 20.0 ],
									"style" : "",
									"text" : "cmd+click to (un-)select items"
								}

							}
, 							{
								"box" : 								{
									"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"celldef" : [ [ 0, 0, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 0, 1.0, 1.0, 1.0, 1.0, -1, -1, -1 ], [ 0, 1, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 0, 1.0, 1.0, 1.0, 1.0, -1, -1, -1 ], [ 0, 2, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 0, 1.0, 1.0, 1.0, 1.0, -1, -1, -1 ], [ 0, 3, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 0, 1.0, 1.0, 1.0, 1.0, -1, -1, -1 ], [ 0, 4, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 0, 1.0, 1.0, 1.0, 1.0, -1, -1, -1 ], [ 0, 5, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 0, 1.0, 1.0, 1.0, 1.0, -1, -1, -1 ], [ 0, 6, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 0, 1.0, 1.0, 1.0, 1.0, -1, -1, -1 ], [ 0, 7, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 0, 1.0, 1.0, 1.0, 1.0, -1, -1, -1 ], [ 0, 8, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 0, 1.0, 1.0, 1.0, 1.0, -1, -1, -1 ], [ 0, 9, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 10, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 11, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 12, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 13, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 14, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 15, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 16, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 17, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 18, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 19, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 20, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 21, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 22, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 23, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 24, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 25, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 26, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 27, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 28, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 29, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 30, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 31, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 32, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 33, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 34, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 35, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 36, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 37, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 38, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 39, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 40, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 41, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 42, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 43, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 44, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 45, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 46, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 47, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 48, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 49, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 50, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 51, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 52, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 53, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 54, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 55, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 56, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 57, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 58, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 59, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 60, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 61, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 62, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 63, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 64, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 65, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 66, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 67, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 68, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 69, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 70, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 71, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 72, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 73, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 74, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 75, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 76, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 77, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 78, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 79, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 80, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 81, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 82, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 83, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 84, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 85, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 86, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 87, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 88, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 89, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 90, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 91, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 92, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 93, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 94, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 95, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 96, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 97, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 98, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 99, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 100, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 101, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 102, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 103, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 104, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 105, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 106, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 107, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 108, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 109, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 110, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 111, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 112, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 113, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 114, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 115, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 116, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 117, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 118, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 119, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 120, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 121, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 122, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 123, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 124, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 125, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 126, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 127, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 128, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 129, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 130, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 131, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 132, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 133, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 134, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 135, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 136, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 137, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 138, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 139, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 140, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 141, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 142, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 143, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 144, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 145, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 146, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 147, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 148, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 149, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 150, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 151, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 152, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 153, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 154, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 155, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 156, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 157, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 158, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 159, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 160, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 161, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 162, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 163, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 164, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 165, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 166, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 167, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 168, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 169, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 170, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 171, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 172, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 173, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 174, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 175, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 176, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 177, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 178, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 179, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 180, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 181, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 182, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 183, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 184, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 185, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 186, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 187, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 188, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 189, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 190, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 191, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 192, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 193, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 194, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 195, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 196, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 197, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ], [ 0, 198, 0, 0, 0.619608, 0.0, 0.360784, 1.0, 1, 0.0, 0.0, 0.0, 1.0, -1, -1, -1 ] ],
									"cellmap" : [ [ 0, 0, "degrade.1" ], [ 0, 1, "degrade.1/audio" ], [ 0, 2, "degrade.1/audio/bypass" ], [ 0, 3, "degrade.1/audio/gain" ], [ 0, 4, "degrade.1/audio/in.L" ], [ 0, 5, "degrade.1/audio/in.R" ], [ 0, 6, "degrade.1/audio/mix" ], [ 0, 7, "degrade.1/audio/mute" ], [ 0, 8, "degrade.1/audio/out.L" ], [ 0, 9, "degrade.1/audio/out.R" ], [ 0, 10, "degrade.1/bitdepth" ], [ 0, 11, "degrade.1/model" ], [ 0, 12, "degrade.1/preset" ], [ 0, 13, "degrade.1/samplerate_ratio" ], [ 0, 14, "degrade.2" ], [ 0, 15, "degrade.2/audio" ], [ 0, 16, "degrade.2/audio/bypass" ], [ 0, 17, "degrade.2/audio/gain" ], [ 0, 18, "degrade.2/audio/in.L" ], [ 0, 19, "degrade.2/audio/in.R" ], [ 0, 20, "degrade.2/audio/mix" ], [ 0, 21, "degrade.2/audio/mute" ], [ 0, 22, "degrade.2/audio/out.L" ], [ 0, 23, "degrade.2/audio/out.R" ], [ 0, 24, "degrade.2/bitdepth" ], [ 0, 25, "degrade.2/model" ], [ 0, 26, "degrade.2/preset" ], [ 0, 27, "degrade.2/samplerate_ratio" ], [ 0, 28, "eq" ], [ 0, 29, "eq/audio" ], [ 0, 30, "eq/audio/bypass" ], [ 0, 31, "eq/audio/gain" ], [ 0, 32, "eq/audio/in.L" ], [ 0, 33, "eq/audio/in.R" ], [ 0, 34, "eq/audio/mix" ], [ 0, 35, "eq/audio/mute" ], [ 0, 36, "eq/audio/out.L" ], [ 0, 37, "eq/audio/out.R" ], [ 0, 38, "eq/bands" ], [ 0, 39, "eq/filter.1" ], [ 0, 40, "eq/filter.1/frequency" ], [ 0, 41, "eq/filter.1/gain" ], [ 0, 42, "eq/filter.1/octave_bandwidth" ], [ 0, 43, "eq/filter.1/type" ], [ 0, 44, "eq/filter.2" ], [ 0, 45, "eq/filter.2/frequency" ], [ 0, 46, "eq/filter.2/gain" ], [ 0, 47, "eq/filter.2/octave_bandwidth" ], [ 0, 48, "eq/filter.2/type" ], [ 0, 49, "eq/filter.3" ], [ 0, 50, "eq/filter.3/frequency" ], [ 0, 51, "eq/filter.3/gain" ], [ 0, 52, "eq/filter.3/octave_bandwidth" ], [ 0, 53, "eq/filter.3/type" ], [ 0, 54, "eq/filter.4" ], [ 0, 55, "eq/filter.4/frequency" ], [ 0, 56, "eq/filter.4/gain" ], [ 0, 57, "eq/filter.4/octave_bandwidth" ], [ 0, 58, "eq/filter.4/type" ], [ 0, 59, "eq/filtergraph" ], [ 0, 60, "eq/model" ], [ 0, 61, "eq/preset" ], [ 0, 62, "equalizer~(view)" ], [ 0, 63, "equalizer~(view)/equalizer~(view)" ], [ 0, 64, "equalizer~(view)/equalizer~(view)/filter.1" ], [ 0, 65, "equalizer~(view)/equalizer~(view)/filter.1/frequency.1" ], [ 0, 66, "equalizer~(view)/equalizer~(view)/filter.1/gain.1" ], [ 0, 67, "equalizer~(view)/equalizer~(view)/filter.1/octave_bandwidth.1" ], [ 0, 68, "equalizer~(view)/equalizer~(view)/filter.1/type.1" ], [ 0, 69, "equalizer~(view)/equalizer~(view)/filter_graph(view)" ], [ 0, 70, "equalizer~(view)/equalizer~(view)/filter_graph(view)/model" ], [ 0, 71, "equalizer~(view)/equalizer~(view)/filter_numeric(view)" ], [ 0, 72, "equalizer~(view)/equalizer~(view)/filter_numeric(view)/frequency.midi_converter" ], [ 0, 73, "equalizer~(view)/equalizer~(view)/filter_numeric(view)/model" ], [ 0, 74, "equalizer~(view)/equalizer~(view)/model" ], [ 0, 75, "equalizer~(view)/equalizer~(view)/ui" ], [ 0, 76, "equalizer~(view)/filter.1" ], [ 0, 77, "equalizer~(view)/filter.1/frequency.1" ], [ 0, 78, "equalizer~(view)/filter.1/gain.1" ], [ 0, 79, "equalizer~(view)/filter.1/octave_bandwidth.1" ], [ 0, 80, "equalizer~(view)/filter.1/type.1" ], [ 0, 81, "equalizer~(view)/model" ], [ 0, 82, "equalizer~(view)/ui" ], [ 0, 83, "input" ], [ 0, 84, "input/audio" ], [ 0, 85, "input/audio/gain" ], [ 0, 86, "input/audio/mute" ], [ 0, 87, "input/audio/out.L" ], [ 0, 88, "input/audio/out.R" ], [ 0, 89, "input/balance" ], [ 0, 90, "input/balance/audio" ], [ 0, 91, "input/balance/audio/out.L" ], [ 0, 92, "input/balance/audio/out.R" ], [ 0, 93, "input/balance/mode" ], [ 0, 94, "input/balance/model" ], [ 0, 95, "input/balance/position" ], [ 0, 96, "input/balance/shape" ], [ 0, 97, "input/clicktrain" ], [ 0, 98, "input/clicktrain/rate" ], [ 0, 99, "input/file" ], [ 0, 100, "input/file/direct" ], [ 0, 101, "input/file/loop" ], [ 0, 102, "input/file/path" ], [ 0, 103, "input/file/play" ], [ 0, 104, "input/file/time" ], [ 0, 105, "input/file/time/absolute" ], [ 0, 106, "input/file/time/relative" ], [ 0, 107, "input/file/transpose" ], [ 0, 108, "input/input" ], [ 0, 109, "input/input/audio" ], [ 0, 110, "input/input/audio/active" ], [ 0, 111, "input/input/channel.L" ], [ 0, 112, "input/input/channel.R" ], [ 0, 113, "input/input/dspStatus" ], [ 0, 114, "input/input/limiter" ], [ 0, 115, "input/input/limiter/active" ], [ 0, 116, "input/input/limiter/audio" ], [ 0, 117, "input/input/limiter/audio/in.L" ], [ 0, 118, "input/input/limiter/audio/in.R" ], [ 0, 119, "input/input/limiter/audio/out.L" ], [ 0, 120, "input/input/limiter/audio/out.R" ], [ 0, 121, "input/input/limiter/clear" ], [ 0, 122, "input/input/limiter/dcblocker" ], [ 0, 123, "input/input/limiter/dcblocker/active" ], [ 0, 124, "input/input/limiter/lookahead" ], [ 0, 125, "input/input/limiter/mode" ], [ 0, 126, "input/input/limiter/model" ], [ 0, 127, "input/input/limiter/postamp" ], [ 0, 128, "input/input/limiter/preamp" ], [ 0, 129, "input/input/limiter/release" ], [ 0, 130, "input/input/limiter/threshold" ], [ 0, 131, "input/input/model" ], [ 0, 132, "input/model" ], [ 0, 133, "input/preset" ], [ 0, 134, "input/soundfile" ], [ 0, 135, "input/soundfile/report" ], [ 0, 136, "input/source" ], [ 0, 137, "input/testtone" ], [ 0, 138, "input/testtone/frequency" ], [ 0, 139, "output" ], [ 0, 140, "output/audio" ], [ 0, 141, "output/audio/active" ], [ 0, 142, "output/audio/gain" ], [ 0, 143, "output/audio/mute" ], [ 0, 144, "output/audio/out.L" ], [ 0, 145, "output/audio/out.R" ], [ 0, 146, "output/balance" ], [ 0, 147, "output/balance/audio" ], [ 0, 148, "output/balance/audio/out.L" ], [ 0, 149, "output/balance/audio/out.R" ], [ 0, 150, "output/balance/mode" ], [ 0, 151, "output/balance/model" ], [ 0, 152, "output/balance/position" ], [ 0, 153, "output/balance/shape" ], [ 0, 154, "output/ch.1" ], [ 0, 155, "output/ch.2" ], [ 0, 156, "output/cpu" ], [ 0, 157, "output/dspStatus" ], [ 0, 158, "output/limiter" ], [ 0, 159, "output/limiter/active" ], [ 0, 160, "output/limiter/audio" ], [ 0, 161, "output/limiter/audio/in.L" ], [ 0, 162, "output/limiter/audio/in.R" ], [ 0, 163, "output/limiter/audio/out.L" ], [ 0, 164, "output/limiter/audio/out.R" ], [ 0, 165, "output/limiter/clear" ], [ 0, 166, "output/limiter/dcblocker" ], [ 0, 167, "output/limiter/dcblocker/active" ], [ 0, 168, "output/limiter/lookahead" ], [ 0, 169, "output/limiter/mode" ], [ 0, 170, "output/limiter/model" ], [ 0, 171, "output/limiter/postamp" ], [ 0, 172, "output/limiter/preamp" ], [ 0, 173, "output/limiter/release" ], [ 0, 174, "output/limiter/threshold" ], [ 0, 175, "output/model" ], [ 0, 176, "output/preset" ], [ 0, 177, "output/record" ], [ 0, 178, "output/record/active" ], [ 0, 179, "output/record/audio" ], [ 0, 180, "output/record/audio/in.L" ], [ 0, 181, "output/record/audio/in.R" ], [ 0, 182, "output/record/file" ], [ 0, 183, "output/record/file/path" ], [ 0, 184, "output/record/file/time" ], [ 0, 185, "output/record/file/type" ], [ 0, 186, "output/record/model" ], [ 0, 187, "output/record/samptype" ], [ 0, 188, "output/saturation" ], [ 0, 189, "output/saturation/active" ], [ 0, 190, "output/saturation/audio" ], [ 0, 191, "output/saturation/audio/in.L" ], [ 0, 192, "output/saturation/audio/in.R" ], [ 0, 193, "output/saturation/audio/out.L" ], [ 0, 194, "output/saturation/audio/out.R" ], [ 0, 195, "output/saturation/depth" ], [ 0, 196, "output/saturation/mode" ], [ 0, 197, "output/saturation/model" ], [ 0, 198, "output/saturation/preamp" ] ],
									"cols" : 1,
									"colwidth" : 196,
									"fgcolor" : [ 0.819608, 0.819608, 0.819608, 1.0 ],
									"fontface" : 0,
									"fontname" : "Lato Regular",
									"fontsize" : 12.0,
									"gridlinecolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"hcellcolor" : [ 0.896579, 0.896579, 0.896579, 1.0 ],
									"hscroll" : 0,
									"id" : "obj-16",
									"maxclass" : "jit.cellblock",
									"numinlets" : 2,
									"numoutlets" : 4,
									"outlettype" : [ "list", "", "", "" ],
									"patching_rect" : [ 133.0, 456.0, 217.5, 350.75 ],
									"rows" : 199,
									"savemode" : 1,
									"stcolor" : [ 0.8, 0.8, 0.8, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-6",
									"linecount" : 2,
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 133.0, 264.5, 427.0, 35.0 ],
									"style" : "",
									"text" : "filter/set filtering_gains_addresses part gain attribute service value parameter, explore"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-3",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 1291.0, 610.0, 168.0, 22.0 ],
									"style" : "",
									"text" : "j.cue @namespace jcue_filter"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-17",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 1317.0, 815.0, 127.0, 22.0 ],
									"style" : "",
									"text" : "s namespacemaxhelp"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-18",
									"maxclass" : "panel",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 1298.0, 869.0, 13.0, 13.0 ],
									"shape" : 3,
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-21",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 1317.0, 859.5, 176.0, 22.0 ],
									"style" : "",
									"text" : "Reveal demo models and view"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-7",
									"maxclass" : "number",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 232.25, 425.0, 50.0, 22.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-5",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "" ],
									"patching_rect" : [ 133.0, 382.0, 218.0, 35.0 ],
									"style" : "",
									"text" : "j.namespace @namespace jcue_filter @address / @format jit.cellblock"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-4",
									"linecount" : 5,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 10.0, 70.0, 829.0, 74.0 ],
									"style" : "",
									"text" : "j.namespace exploration filter results can be refrenced by giving j.namespace a name (@namespace <name>). Doing so allows to set to every addresses a selection state boolean value. Moreover, the list of (un-)selected addresses can be shared accross many j.namespace instances and other object.\n\nThis is particularly usefull when building full features gui or when using j.namespace in combination with j.cue so you can (un-)select which addresses to store in a j.cue state."
								}

							}
, 							{
								"box" : 								{
									"fontsize" : 14.0,
									"id" : "obj-78",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 821.0, 177.5, 119.0, 22.0 ],
									"style" : "",
									"text" : "Select addresses"
								}

							}
, 							{
								"box" : 								{
									"border" : 0,
									"filename" : "helpdetails.js",
									"id" : "obj-2",
									"ignoreclick" : 1,
									"jsarguments" : [ "j.namespace" ],
									"maxclass" : "jsui",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 10.0, 10.0, 274.0, 58.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-56", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-16", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-20", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-19", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-77", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-20", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-17", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-21", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-19", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-22", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-25", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-24", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-8", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-25", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-24", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-27", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-16", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-47", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 830.5, 544.0, 558.0, 544.0, 558.0, 352.0, 142.5, 352.0 ],
									"source" : [ "obj-49", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-5", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-5", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-49", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-53", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 142.5, 848.0, 118.0, 848.0, 118.0, 377.0, 142.5, 377.0 ],
									"source" : [ "obj-56", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"midpoints" : [ 830.5, 525.0, 571.5, 525.0, 571.5, 371.0, 142.5, 371.0 ],
									"source" : [ "obj-57", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-6", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-53", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-61", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"midpoints" : [ 830.5, 370.25, 142.5, 370.25 ],
									"source" : [ "obj-62", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-70", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-24", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 1341.0, 416.0, 1277.0, 416.0, 1277.0, 299.0, 1300.5, 299.0 ],
									"source" : [ "obj-8", 0 ]
								}

							}
 ],
						"styles" : [ 							{
								"name" : "jpatcher001",
								"parentstyle" : "",
								"multi" : 0
							}
 ]
					}
,
					"patching_rect" : [ 691.0, 150.0, 108.0, 22.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"style" : "",
						"tags" : ""
					}
,
					"style" : "",
					"text" : "p \"Selection state\""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-4",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 0,
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 7,
							"minor" : 2,
							"revision" : 4,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"rect" : [ 0.0, 26.0, 1680.0, 975.0 ],
						"bgcolor" : [ 0.878431, 0.878431, 0.858824, 1.0 ],
						"editing_bgcolor" : [ 0.878431, 0.878431, 0.858824, 1.0 ],
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
						"lefttoolbarpinned" : 1,
						"toptoolbarpinned" : 1,
						"righttoolbarpinned" : 1,
						"bottomtoolbarpinned" : 1,
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
						"subpatcher_template" : "greyish",
						"showontab" : 1,
						"boxes" : [ 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-6",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 1316.5, 815.0, 127.0, 22.0 ],
									"style" : "",
									"text" : "s namespacemaxhelp"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-28",
									"maxclass" : "panel",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 1297.5, 869.0, 13.0, 13.0 ],
									"shape" : 3,
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-1",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 1316.5, 859.5, 176.0, 22.0 ],
									"style" : "",
									"text" : "Reveal demo models and view"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-22",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 10.0, 67.0, 301.0, 33.0 ],
									"style" : "",
									"text" : "j.namespace provides different output format so it can be connect with whatever gui object fitting your needs"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-20",
									"linecount" : 3,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 735.0, 655.0, 150.0, 47.0 ],
									"style" : "",
									"text" : "Max bug with leading slashes as prefix in umenu..."
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-17",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 5,
									"outlettype" : [ "", "", "", "", "" ],
									"patching_rect" : [ 735.0, 624.0, 153.0, 22.0 ],
									"style" : "",
									"text" : "regexp (.*:\\\\/) @substitute /"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-15",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 1153.0, 546.25, 74.0, 22.0 ],
									"style" : "",
									"text" : "prepend set"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-14",
									"linecount" : 116,
									"maxclass" : "textedit",
									"numinlets" : 1,
									"numoutlets" : 4,
									"outlettype" : [ "", "int", "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 1153.0, 582.0, 269.0, 120.0 ],
									"style" : "",
									"text" : "degrade.1 degrade.1/audio degrade.1/audio/bypass degrade.1/audio/gain degrade.1/audio/in.L degrade.1/audio/in.R degrade.1/audio/mix degrade.1/audio/mute degrade.1/audio/out.L degrade.1/audio/out.R degrade.1/bitdepth degrade.1/model degrade.1/preset degrade.1/samplerate_ratio degrade.2 degrade.2/audio degrade.2/audio/bypass degrade.2/audio/gain degrade.2/audio/in.L degrade.2/audio/in.R degrade.2/audio/mix degrade.2/audio/mute degrade.2/audio/out.L degrade.2/audio/out.R degrade.2/bitdepth degrade.2/model degrade.2/preset degrade.2/samplerate_ratio eq eq/audio eq/audio/bypass eq/audio/gain eq/audio/in.L eq/audio/in.R eq/audio/mix eq/audio/mute eq/audio/out.L eq/audio/out.R eq/bands eq/filter.1 eq/filter.1/frequency eq/filter.1/gain eq/filter.1/octave_bandwidth eq/filter.1/type eq/filter.2 eq/filter.2/frequency eq/filter.2/gain eq/filter.2/octave_bandwidth eq/filter.2/type eq/filter.3 eq/filter.3/frequency eq/filter.3/gain eq/filter.3/octave_bandwidth eq/filter.3/type eq/filter.4 eq/filter.4/frequency eq/filter.4/gain eq/filter.4/octave_bandwidth eq/filter.4/type eq/filtergraph eq/model eq/preset equalizer~(view) equalizer~(view)/equalizer~(view) equalizer~(view)/equalizer~(view)/filter.1 equalizer~(view)/equalizer~(view)/filter.1/frequency.1 equalizer~(view)/equalizer~(view)/filter.1/gain.1 equalizer~(view)/equalizer~(view)/filter.1/octave_bandwidth.1 equalizer~(view)/equalizer~(view)/filter.1/type.1 equalizer~(view)/equalizer~(view)/filter_graph(view) equalizer~(view)/equalizer~(view)/filter_graph(view)/model equalizer~(view)/equalizer~(view)/filter_numeric(view) equalizer~(view)/equalizer~(view)/filter_numeric(view)/frequency.midi_converter equalizer~(view)/equalizer~(view)/filter_numeric(view)/model equalizer~(view)/equalizer~(view)/model equalizer~(view)/equalizer~(view)/ui equalizer~(view)/filter.1 equalizer~(view)/filter.1/frequency.1 equalizer~(view)/filter.1/gain.1 equalizer~(view)/filter.1/octave_bandwidth.1 equalizer~(view)/filter.1/type.1 equalizer~(view)/model equalizer~(view)/ui input input/audio input/audio/gain input/audio/mute input/audio/out.L input/audio/out.R input/balance input/balance/audio input/balance/audio/out.L input/balance/audio/out.R input/balance/mode input/balance/model input/balance/position input/balance/shape input/clicktrain input/clicktrain/rate input/file input/file/direct input/file/loop input/file/path input/file/play input/file/time input/file/time/absolute input/file/time/relative input/file/transpose input/input input/input/audio input/input/audio/active input/input/channel.L input/input/channel.R input/input/dspStatus input/input/limiter input/input/limiter/active input/input/limiter/audio input/input/limiter/audio/in.L input/input/limiter/audio/in.R input/input/limiter/audio/out.L input/input/limiter/audio/out.R input/input/limiter/clear input/input/limiter/dcblocker input/input/limiter/dcblocker/active input/input/limiter/lookahead input/input/limiter/mode input/input/limiter/model input/input/limiter/postamp input/input/limiter/preamp input/input/limiter/release input/input/limiter/threshold input/input/model input/model input/preset input/soundfile input/soundfile/report input/source input/testtone input/testtone/frequency output output/audio output/audio/active output/audio/gain output/audio/mute output/audio/out.L output/audio/out.R output/balance output/balance/audio output/balance/audio/out.L output/balance/audio/out.R output/balance/mode output/balance/model output/balance/position output/balance/shape output/ch.1 output/ch.2 output/cpu output/dspStatus output/limiter output/limiter/active output/limiter/audio output/limiter/audio/in.L output/limiter/audio/in.R output/limiter/audio/out.L output/limiter/audio/out.R output/limiter/clear output/limiter/dcblocker output/limiter/dcblocker/active output/limiter/lookahead output/limiter/mode output/limiter/model output/limiter/postamp output/limiter/preamp output/limiter/release output/limiter/threshold output/model output/preset output/record output/record/active output/record/audio output/record/audio/in.L output/record/audio/in.R output/record/file output/record/file/path output/record/file/time output/record/file/type output/record/model output/record/samptype output/saturation output/saturation/active output/saturation/audio output/saturation/audio/in.L output/saturation/audio/in.R output/saturation/audio/out.L output/saturation/audio/out.R output/saturation/depth output/saturation/mode output/saturation/model output/saturation/preamp"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-13",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "" ],
									"patching_rect" : [ 1153.0, 484.0, 223.0, 22.0 ],
									"style" : "",
									"text" : "j.namespace @address / @format none"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-12",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 4,
									"outlettype" : [ "", "", "", "" ],
									"patching_rect" : [ 912.0, 546.25, 91.0, 22.0 ],
									"saved_object_attributes" : 									{
										"embed" : 0
									}
,
									"style" : "",
									"text" : "coll @embed 0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-11",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "" ],
									"patching_rect" : [ 912.0, 484.0, 214.0, 22.0 ],
									"style" : "",
									"text" : "j.namespace @address / @format coll"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-8",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 628.0, 582.0, 233.0, 22.0 ],
									"style" : "",
									"text" : "/equalizer~(view)/filter.1/frequency.1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-9",
									"items" : [ "degrade.1", ",", "degrade.1/audio", ",", "degrade.1/audio/bypass", ",", "degrade.1/audio/gain", ",", "degrade.1/audio/in.L", ",", "degrade.1/audio/in.R", ",", "degrade.1/audio/mix", ",", "degrade.1/audio/mute", ",", "degrade.1/audio/out.L", ",", "degrade.1/audio/out.R", ",", "degrade.1/bitdepth", ",", "degrade.1/model", ",", "degrade.1/preset", ",", "degrade.1/samplerate_ratio", ",", "degrade.2", ",", "degrade.2/audio", ",", "degrade.2/audio/bypass", ",", "degrade.2/audio/gain", ",", "degrade.2/audio/in.L", ",", "degrade.2/audio/in.R", ",", "degrade.2/audio/mix", ",", "degrade.2/audio/mute", ",", "degrade.2/audio/out.L", ",", "degrade.2/audio/out.R", ",", "degrade.2/bitdepth", ",", "degrade.2/model", ",", "degrade.2/preset", ",", "degrade.2/samplerate_ratio", ",", "eq", ",", "eq/audio", ",", "eq/audio/bypass", ",", "eq/audio/gain", ",", "eq/audio/in.L", ",", "eq/audio/in.R", ",", "eq/audio/mix", ",", "eq/audio/mute", ",", "eq/audio/out.L", ",", "eq/audio/out.R", ",", "eq/bands", ",", "eq/filter.1", ",", "eq/filter.1/frequency", ",", "eq/filter.1/gain", ",", "eq/filter.1/octave_bandwidth", ",", "eq/filter.1/type", ",", "eq/filter.2", ",", "eq/filter.2/frequency", ",", "eq/filter.2/gain", ",", "eq/filter.2/octave_bandwidth", ",", "eq/filter.2/type", ",", "eq/filter.3", ",", "eq/filter.3/frequency", ",", "eq/filter.3/gain", ",", "eq/filter.3/octave_bandwidth", ",", "eq/filter.3/type", ",", "eq/filter.4", ",", "eq/filter.4/frequency", ",", "eq/filter.4/gain", ",", "eq/filter.4/octave_bandwidth", ",", "eq/filter.4/type", ",", "eq/filtergraph", ",", "eq/model", ",", "eq/preset", ",", "equalizer~(view)", ",", "equalizer~(view)/equalizer~(view)", ",", "equalizer~(view)/equalizer~(view)/filter.1", ",", "equalizer~(view)/equalizer~(view)/filter.1/frequency.1", ",", "equalizer~(view)/equalizer~(view)/filter.1/gain.1", ",", "equalizer~(view)/equalizer~(view)/filter.1/octave_bandwidth.1", ",", "equalizer~(view)/equalizer~(view)/filter.1/type.1", ",", "equalizer~(view)/equalizer~(view)/filter_graph(view)", ",", "equalizer~(view)/equalizer~(view)/filter_graph(view)/model", ",", "equalizer~(view)/equalizer~(view)/filter_numeric(view)", ",", "equalizer~(view)/equalizer~(view)/filter_numeric(view)/frequency.midi_converter", ",", "equalizer~(view)/equalizer~(view)/filter_numeric(view)/model", ",", "equalizer~(view)/equalizer~(view)/model", ",", "equalizer~(view)/equalizer~(view)/ui", ",", "equalizer~(view)/filter.1", ",", "equalizer~(view)/filter.1/frequency.1", ",", "equalizer~(view)/filter.1/gain.1", ",", "equalizer~(view)/filter.1/octave_bandwidth.1", ",", "equalizer~(view)/filter.1/type.1", ",", "equalizer~(view)/model", ",", "equalizer~(view)/ui", ",", "input", ",", "input/audio", ",", "input/audio/gain", ",", "input/audio/mute", ",", "input/audio/out.L", ",", "input/audio/out.R", ",", "input/balance", ",", "input/balance/audio", ",", "input/balance/audio/out.L", ",", "input/balance/audio/out.R", ",", "input/balance/mode", ",", "input/balance/model", ",", "input/balance/position", ",", "input/balance/shape", ",", "input/clicktrain", ",", "input/clicktrain/rate", ",", "input/file", ",", "input/file/direct", ",", "input/file/loop", ",", "input/file/path", ",", "input/file/play", ",", "input/file/time", ",", "input/file/time/absolute", ",", "input/file/time/relative", ",", "input/file/transpose", ",", "input/input", ",", "input/input/audio", ",", "input/input/audio/active", ",", "input/input/channel.L", ",", "input/input/channel.R", ",", "input/input/dspStatus", ",", "input/input/limiter", ",", "input/input/limiter/active", ",", "input/input/limiter/audio", ",", "input/input/limiter/audio/in.L", ",", "input/input/limiter/audio/in.R", ",", "input/input/limiter/audio/out.L", ",", "input/input/limiter/audio/out.R", ",", "input/input/limiter/clear", ",", "input/input/limiter/dcblocker", ",", "input/input/limiter/dcblocker/active", ",", "input/input/limiter/lookahead", ",", "input/input/limiter/mode", ",", "input/input/limiter/model", ",", "input/input/limiter/postamp", ",", "input/input/limiter/preamp", ",", "input/input/limiter/release", ",", "input/input/limiter/threshold", ",", "input/input/model", ",", "input/model", ",", "input/preset", ",", "input/soundfile", ",", "input/soundfile/report", ",", "input/source", ",", "input/testtone", ",", "input/testtone/frequency", ",", "output", ",", "output/audio", ",", "output/audio/active", ",", "output/audio/gain", ",", "output/audio/mute", ",", "output/audio/out.L", ",", "output/audio/out.R", ",", "output/balance", ",", "output/balance/audio", ",", "output/balance/audio/out.L", ",", "output/balance/audio/out.R", ",", "output/balance/mode", ",", "output/balance/model", ",", "output/balance/position", ",", "output/balance/shape", ",", "output/ch.1", ",", "output/ch.2", ",", "output/cpu", ",", "output/dspStatus", ",", "output/limiter", ",", "output/limiter/active", ",", "output/limiter/audio", ",", "output/limiter/audio/in.L", ",", "output/limiter/audio/in.R", ",", "output/limiter/audio/out.L", ",", "output/limiter/audio/out.R", ",", "output/limiter/clear", ",", "output/limiter/dcblocker", ",", "output/limiter/dcblocker/active", ",", "output/limiter/lookahead", ",", "output/limiter/mode", ",", "output/limiter/model", ",", "output/limiter/postamp", ",", "output/limiter/preamp", ",", "output/limiter/release", ",", "output/limiter/threshold", ",", "output/model", ",", "output/preset", ",", "output/record", ",", "output/record/active", ",", "output/record/audio", ",", "output/record/audio/in.L", ",", "output/record/audio/in.R", ",", "output/record/file", ",", "output/record/file/path", ",", "output/record/file/time", ",", "output/record/file/type", ",", "output/record/model", ",", "output/record/samptype", ",", "output/saturation", ",", "output/saturation/active", ",", "output/saturation/audio", ",", "output/saturation/audio/in.L", ",", "output/saturation/audio/in.R", ",", "output/saturation/audio/out.L", ",", "output/saturation/audio/out.R", ",", "output/saturation/depth", ",", "output/saturation/mode", ",", "output/saturation/model", ",", "output/saturation/preamp" ],
									"maxclass" : "umenu",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "int", "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 628.0, 546.25, 233.0, 22.0 ],
									"prefix" : "Macintosh HD:/",
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-10",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "" ],
									"patching_rect" : [ 628.0, 484.0, 269.0, 22.0 ],
									"style" : "",
									"text" : "j.namespace @address / @format umenu_prefix"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-7",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 378.0, 582.0, 233.0, 22.0 ],
									"style" : "",
									"text" : "equalizer~(view)/filter.1/frequency.1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-5",
									"items" : [ "degrade.1", ",", "degrade.1/audio", ",", "degrade.1/audio/bypass", ",", "degrade.1/audio/gain", ",", "degrade.1/audio/in.L", ",", "degrade.1/audio/in.R", ",", "degrade.1/audio/mix", ",", "degrade.1/audio/mute", ",", "degrade.1/audio/out.L", ",", "degrade.1/audio/out.R", ",", "degrade.1/bitdepth", ",", "degrade.1/model", ",", "degrade.1/preset", ",", "degrade.1/samplerate_ratio", ",", "degrade.2", ",", "degrade.2/audio", ",", "degrade.2/audio/bypass", ",", "degrade.2/audio/gain", ",", "degrade.2/audio/in.L", ",", "degrade.2/audio/in.R", ",", "degrade.2/audio/mix", ",", "degrade.2/audio/mute", ",", "degrade.2/audio/out.L", ",", "degrade.2/audio/out.R", ",", "degrade.2/bitdepth", ",", "degrade.2/model", ",", "degrade.2/preset", ",", "degrade.2/samplerate_ratio", ",", "eq", ",", "eq/audio", ",", "eq/audio/bypass", ",", "eq/audio/gain", ",", "eq/audio/in.L", ",", "eq/audio/in.R", ",", "eq/audio/mix", ",", "eq/audio/mute", ",", "eq/audio/out.L", ",", "eq/audio/out.R", ",", "eq/bands", ",", "eq/filter.1", ",", "eq/filter.1/frequency", ",", "eq/filter.1/gain", ",", "eq/filter.1/octave_bandwidth", ",", "eq/filter.1/type", ",", "eq/filter.2", ",", "eq/filter.2/frequency", ",", "eq/filter.2/gain", ",", "eq/filter.2/octave_bandwidth", ",", "eq/filter.2/type", ",", "eq/filter.3", ",", "eq/filter.3/frequency", ",", "eq/filter.3/gain", ",", "eq/filter.3/octave_bandwidth", ",", "eq/filter.3/type", ",", "eq/filter.4", ",", "eq/filter.4/frequency", ",", "eq/filter.4/gain", ",", "eq/filter.4/octave_bandwidth", ",", "eq/filter.4/type", ",", "eq/filtergraph", ",", "eq/model", ",", "eq/preset", ",", "equalizer~(view)", ",", "equalizer~(view)/equalizer~(view)", ",", "equalizer~(view)/equalizer~(view)/filter.1", ",", "equalizer~(view)/equalizer~(view)/filter.1/frequency.1", ",", "equalizer~(view)/equalizer~(view)/filter.1/gain.1", ",", "equalizer~(view)/equalizer~(view)/filter.1/octave_bandwidth.1", ",", "equalizer~(view)/equalizer~(view)/filter.1/type.1", ",", "equalizer~(view)/equalizer~(view)/filter_graph(view)", ",", "equalizer~(view)/equalizer~(view)/filter_graph(view)/model", ",", "equalizer~(view)/equalizer~(view)/filter_numeric(view)", ",", "equalizer~(view)/equalizer~(view)/filter_numeric(view)/frequency.midi_converter", ",", "equalizer~(view)/equalizer~(view)/filter_numeric(view)/model", ",", "equalizer~(view)/equalizer~(view)/model", ",", "equalizer~(view)/equalizer~(view)/ui", ",", "equalizer~(view)/filter.1", ",", "equalizer~(view)/filter.1/frequency.1", ",", "equalizer~(view)/filter.1/gain.1", ",", "equalizer~(view)/filter.1/octave_bandwidth.1", ",", "equalizer~(view)/filter.1/type.1", ",", "equalizer~(view)/model", ",", "equalizer~(view)/ui", ",", "input", ",", "input/audio", ",", "input/audio/gain", ",", "input/audio/mute", ",", "input/audio/out.L", ",", "input/audio/out.R", ",", "input/balance", ",", "input/balance/audio", ",", "input/balance/audio/out.L", ",", "input/balance/audio/out.R", ",", "input/balance/mode", ",", "input/balance/model", ",", "input/balance/position", ",", "input/balance/shape", ",", "input/clicktrain", ",", "input/clicktrain/rate", ",", "input/file", ",", "input/file/direct", ",", "input/file/loop", ",", "input/file/path", ",", "input/file/play", ",", "input/file/time", ",", "input/file/time/absolute", ",", "input/file/time/relative", ",", "input/file/transpose", ",", "input/input", ",", "input/input/audio", ",", "input/input/audio/active", ",", "input/input/channel.L", ",", "input/input/channel.R", ",", "input/input/dspStatus", ",", "input/input/limiter", ",", "input/input/limiter/active", ",", "input/input/limiter/audio", ",", "input/input/limiter/audio/in.L", ",", "input/input/limiter/audio/in.R", ",", "input/input/limiter/audio/out.L", ",", "input/input/limiter/audio/out.R", ",", "input/input/limiter/clear", ",", "input/input/limiter/dcblocker", ",", "input/input/limiter/dcblocker/active", ",", "input/input/limiter/lookahead", ",", "input/input/limiter/mode", ",", "input/input/limiter/model", ",", "input/input/limiter/postamp", ",", "input/input/limiter/preamp", ",", "input/input/limiter/release", ",", "input/input/limiter/threshold", ",", "input/input/model", ",", "input/model", ",", "input/preset", ",", "input/soundfile", ",", "input/soundfile/report", ",", "input/source", ",", "input/testtone", ",", "input/testtone/frequency", ",", "output", ",", "output/audio", ",", "output/audio/active", ",", "output/audio/gain", ",", "output/audio/mute", ",", "output/audio/out.L", ",", "output/audio/out.R", ",", "output/balance", ",", "output/balance/audio", ",", "output/balance/audio/out.L", ",", "output/balance/audio/out.R", ",", "output/balance/mode", ",", "output/balance/model", ",", "output/balance/position", ",", "output/balance/shape", ",", "output/ch.1", ",", "output/ch.2", ",", "output/cpu", ",", "output/dspStatus", ",", "output/limiter", ",", "output/limiter/active", ",", "output/limiter/audio", ",", "output/limiter/audio/in.L", ",", "output/limiter/audio/in.R", ",", "output/limiter/audio/out.L", ",", "output/limiter/audio/out.R", ",", "output/limiter/clear", ",", "output/limiter/dcblocker", ",", "output/limiter/dcblocker/active", ",", "output/limiter/lookahead", ",", "output/limiter/mode", ",", "output/limiter/model", ",", "output/limiter/postamp", ",", "output/limiter/preamp", ",", "output/limiter/release", ",", "output/limiter/threshold", ",", "output/model", ",", "output/preset", ",", "output/record", ",", "output/record/active", ",", "output/record/audio", ",", "output/record/audio/in.L", ",", "output/record/audio/in.R", ",", "output/record/file", ",", "output/record/file/path", ",", "output/record/file/time", ",", "output/record/file/type", ",", "output/record/model", ",", "output/record/samptype", ",", "output/saturation", ",", "output/saturation/active", ",", "output/saturation/audio", ",", "output/saturation/audio/in.L", ",", "output/saturation/audio/in.R", ",", "output/saturation/audio/out.L", ",", "output/saturation/audio/out.R", ",", "output/saturation/depth", ",", "output/saturation/mode", ",", "output/saturation/model", ",", "output/saturation/preamp" ],
									"maxclass" : "umenu",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "int", "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 378.0, 546.25, 233.0, 22.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "" ],
									"patching_rect" : [ 378.0, 484.0, 233.0, 22.0 ],
									"style" : "",
									"text" : "j.namespace @address / @format umenu"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-58",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 107.0, 349.5, 50.0, 22.0 ],
									"style" : "",
									"text" : "explore"
								}

							}
, 							{
								"box" : 								{
									"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"cellmap" : [ [ 0, 0, "degrade.1" ], [ 0, 1, "degrade.1/audio" ], [ 0, 2, "degrade.1/audio/bypass" ], [ 0, 3, "degrade.1/audio/gain" ], [ 0, 4, "degrade.1/audio/in.L" ], [ 0, 5, "degrade.1/audio/in.R" ], [ 0, 6, "degrade.1/audio/mix" ], [ 0, 7, "degrade.1/audio/mute" ], [ 0, 8, "degrade.1/audio/out.L" ], [ 0, 9, "degrade.1/audio/out.R" ], [ 0, 10, "degrade.1/bitdepth" ], [ 0, 11, "degrade.1/model" ], [ 0, 12, "degrade.1/preset" ], [ 0, 13, "degrade.1/samplerate_ratio" ], [ 0, 14, "degrade.2" ], [ 0, 15, "degrade.2/audio" ], [ 0, 16, "degrade.2/audio/bypass" ], [ 0, 17, "degrade.2/audio/gain" ], [ 0, 18, "degrade.2/audio/in.L" ], [ 0, 19, "degrade.2/audio/in.R" ], [ 0, 20, "degrade.2/audio/mix" ], [ 0, 21, "degrade.2/audio/mute" ], [ 0, 22, "degrade.2/audio/out.L" ], [ 0, 23, "degrade.2/audio/out.R" ], [ 0, 24, "degrade.2/bitdepth" ], [ 0, 25, "degrade.2/model" ], [ 0, 26, "degrade.2/preset" ], [ 0, 27, "degrade.2/samplerate_ratio" ], [ 0, 28, "eq" ], [ 0, 29, "eq/audio" ], [ 0, 30, "eq/audio/bypass" ], [ 0, 31, "eq/audio/gain" ], [ 0, 32, "eq/audio/in.L" ], [ 0, 33, "eq/audio/in.R" ], [ 0, 34, "eq/audio/mix" ], [ 0, 35, "eq/audio/mute" ], [ 0, 36, "eq/audio/out.L" ], [ 0, 37, "eq/audio/out.R" ], [ 0, 38, "eq/bands" ], [ 0, 39, "eq/filter.1" ], [ 0, 40, "eq/filter.1/frequency" ], [ 0, 41, "eq/filter.1/gain" ], [ 0, 42, "eq/filter.1/octave_bandwidth" ], [ 0, 43, "eq/filter.1/type" ], [ 0, 44, "eq/filter.2" ], [ 0, 45, "eq/filter.2/frequency" ], [ 0, 46, "eq/filter.2/gain" ], [ 0, 47, "eq/filter.2/octave_bandwidth" ], [ 0, 48, "eq/filter.2/type" ], [ 0, 49, "eq/filter.3" ], [ 0, 50, "eq/filter.3/frequency" ], [ 0, 51, "eq/filter.3/gain" ], [ 0, 52, "eq/filter.3/octave_bandwidth" ], [ 0, 53, "eq/filter.3/type" ], [ 0, 54, "eq/filter.4" ], [ 0, 55, "eq/filter.4/frequency" ], [ 0, 56, "eq/filter.4/gain" ], [ 0, 57, "eq/filter.4/octave_bandwidth" ], [ 0, 58, "eq/filter.4/type" ], [ 0, 59, "eq/filtergraph" ], [ 0, 60, "eq/model" ], [ 0, 61, "eq/preset" ], [ 0, 62, "equalizer~(view)" ], [ 0, 63, "equalizer~(view)/equalizer~(view)" ], [ 0, 64, "equalizer~(view)/equalizer~(view)/filter.1" ], [ 0, 65, "equalizer~(view)/equalizer~(view)/filter.1/frequency.1" ], [ 0, 66, "equalizer~(view)/equalizer~(view)/filter.1/gain.1" ], [ 0, 67, "equalizer~(view)/equalizer~(view)/filter.1/octave_bandwidth.1" ], [ 0, 68, "equalizer~(view)/equalizer~(view)/filter.1/type.1" ], [ 0, 69, "equalizer~(view)/equalizer~(view)/filter_graph(view)" ], [ 0, 70, "equalizer~(view)/equalizer~(view)/filter_graph(view)/model" ], [ 0, 71, "equalizer~(view)/equalizer~(view)/filter_numeric(view)" ], [ 0, 72, "equalizer~(view)/equalizer~(view)/filter_numeric(view)/frequency.midi_converter" ], [ 0, 73, "equalizer~(view)/equalizer~(view)/filter_numeric(view)/model" ], [ 0, 74, "equalizer~(view)/equalizer~(view)/model" ], [ 0, 75, "equalizer~(view)/equalizer~(view)/ui" ], [ 0, 76, "equalizer~(view)/filter.1" ], [ 0, 77, "equalizer~(view)/filter.1/frequency.1" ], [ 0, 78, "equalizer~(view)/filter.1/gain.1" ], [ 0, 79, "equalizer~(view)/filter.1/octave_bandwidth.1" ], [ 0, 80, "equalizer~(view)/filter.1/type.1" ], [ 0, 81, "equalizer~(view)/model" ], [ 0, 82, "equalizer~(view)/ui" ], [ 0, 83, "input" ], [ 0, 84, "input/audio" ], [ 0, 85, "input/audio/gain" ], [ 0, 86, "input/audio/mute" ], [ 0, 87, "input/audio/out.L" ], [ 0, 88, "input/audio/out.R" ], [ 0, 89, "input/balance" ], [ 0, 90, "input/balance/audio" ], [ 0, 91, "input/balance/audio/out.L" ], [ 0, 92, "input/balance/audio/out.R" ], [ 0, 93, "input/balance/mode" ], [ 0, 94, "input/balance/model" ], [ 0, 95, "input/balance/position" ], [ 0, 96, "input/balance/shape" ], [ 0, 97, "input/clicktrain" ], [ 0, 98, "input/clicktrain/rate" ], [ 0, 99, "input/file" ], [ 0, 100, "input/file/direct" ], [ 0, 101, "input/file/loop" ], [ 0, 102, "input/file/path" ], [ 0, 103, "input/file/play" ], [ 0, 104, "input/file/time" ], [ 0, 105, "input/file/time/absolute" ], [ 0, 106, "input/file/time/relative" ], [ 0, 107, "input/file/transpose" ], [ 0, 108, "input/input" ], [ 0, 109, "input/input/audio" ], [ 0, 110, "input/input/audio/active" ], [ 0, 111, "input/input/channel.L" ], [ 0, 112, "input/input/channel.R" ], [ 0, 113, "input/input/dspStatus" ], [ 0, 114, "input/input/limiter" ], [ 0, 115, "input/input/limiter/active" ], [ 0, 116, "input/input/limiter/audio" ], [ 0, 117, "input/input/limiter/audio/in.L" ], [ 0, 118, "input/input/limiter/audio/in.R" ], [ 0, 119, "input/input/limiter/audio/out.L" ], [ 0, 120, "input/input/limiter/audio/out.R" ], [ 0, 121, "input/input/limiter/clear" ], [ 0, 122, "input/input/limiter/dcblocker" ], [ 0, 123, "input/input/limiter/dcblocker/active" ], [ 0, 124, "input/input/limiter/lookahead" ], [ 0, 125, "input/input/limiter/mode" ], [ 0, 126, "input/input/limiter/model" ], [ 0, 127, "input/input/limiter/postamp" ], [ 0, 128, "input/input/limiter/preamp" ], [ 0, 129, "input/input/limiter/release" ], [ 0, 130, "input/input/limiter/threshold" ], [ 0, 131, "input/input/model" ], [ 0, 132, "input/model" ], [ 0, 133, "input/preset" ], [ 0, 134, "input/soundfile" ], [ 0, 135, "input/soundfile/report" ], [ 0, 136, "input/source" ], [ 0, 137, "input/testtone" ], [ 0, 138, "input/testtone/frequency" ], [ 0, 139, "output" ], [ 0, 140, "output/audio" ], [ 0, 141, "output/audio/active" ], [ 0, 142, "output/audio/gain" ], [ 0, 143, "output/audio/mute" ], [ 0, 144, "output/audio/out.L" ], [ 0, 145, "output/audio/out.R" ], [ 0, 146, "output/balance" ], [ 0, 147, "output/balance/audio" ], [ 0, 148, "output/balance/audio/out.L" ], [ 0, 149, "output/balance/audio/out.R" ], [ 0, 150, "output/balance/mode" ], [ 0, 151, "output/balance/model" ], [ 0, 152, "output/balance/position" ], [ 0, 153, "output/balance/shape" ], [ 0, 154, "output/ch.1" ], [ 0, 155, "output/ch.2" ], [ 0, 156, "output/cpu" ], [ 0, 157, "output/dspStatus" ], [ 0, 158, "output/limiter" ], [ 0, 159, "output/limiter/active" ], [ 0, 160, "output/limiter/audio" ], [ 0, 161, "output/limiter/audio/in.L" ], [ 0, 162, "output/limiter/audio/in.R" ], [ 0, 163, "output/limiter/audio/out.L" ], [ 0, 164, "output/limiter/audio/out.R" ], [ 0, 165, "output/limiter/clear" ], [ 0, 166, "output/limiter/dcblocker" ], [ 0, 167, "output/limiter/dcblocker/active" ], [ 0, 168, "output/limiter/lookahead" ], [ 0, 169, "output/limiter/mode" ], [ 0, 170, "output/limiter/model" ], [ 0, 171, "output/limiter/postamp" ], [ 0, 172, "output/limiter/preamp" ], [ 0, 173, "output/limiter/release" ], [ 0, 174, "output/limiter/threshold" ], [ 0, 175, "output/model" ], [ 0, 176, "output/preset" ], [ 0, 177, "output/record" ], [ 0, 178, "output/record/active" ], [ 0, 179, "output/record/audio" ], [ 0, 180, "output/record/audio/in.L" ], [ 0, 181, "output/record/audio/in.R" ], [ 0, 182, "output/record/file" ], [ 0, 183, "output/record/file/path" ], [ 0, 184, "output/record/file/time" ], [ 0, 185, "output/record/file/type" ], [ 0, 186, "output/record/model" ], [ 0, 187, "output/record/samptype" ], [ 0, 188, "output/saturation" ], [ 0, 189, "output/saturation/active" ], [ 0, 190, "output/saturation/audio" ], [ 0, 191, "output/saturation/audio/in.L" ], [ 0, 192, "output/saturation/audio/in.R" ], [ 0, 193, "output/saturation/audio/out.L" ], [ 0, 194, "output/saturation/audio/out.R" ], [ 0, 195, "output/saturation/depth" ], [ 0, 196, "output/saturation/mode" ], [ 0, 197, "output/saturation/model" ], [ 0, 198, "output/saturation/preamp" ] ],
									"cols" : 2,
									"colwidth" : 200,
									"fgcolor" : [ 0.619608, 0.0, 0.360784, 1.0 ],
									"fontface" : 0,
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"gridlinecolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"hcellcolor" : [ 0.819608, 0.819608, 0.898039, 0.0 ],
									"hscroll" : 0,
									"id" : "obj-16",
									"maxclass" : "jit.cellblock",
									"numinlets" : 2,
									"numoutlets" : 4,
									"outlettype" : [ "list", "", "", "" ],
									"patching_rect" : [ 107.0, 546.25, 214.5, 257.75 ],
									"rows" : 199,
									"savemode" : 1,
									"stcolor" : [ 0.8, 0.8, 0.8, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-3",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "" ],
									"patching_rect" : [ 107.0, 484.0, 254.0, 22.0 ],
									"style" : "",
									"text" : "j.namespace @address / @format jit.cellblock"
								}

							}
, 							{
								"box" : 								{
									"border" : 0,
									"filename" : "helpdetails.js",
									"id" : "obj-2",
									"ignoreclick" : 1,
									"jsarguments" : [ "j.namespace" ],
									"maxclass" : "jsui",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 10.0, 10.0, 625.0, 55.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-6", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-9", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-10", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-12", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-11", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-15", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-13", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-14", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-15", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-8", 1 ],
									"disabled" : 0,
									"hidden" : 1,
									"midpoints" : [ 744.5, 614.0, 852.0, 614.0, 852.0, 571.0, 851.5, 571.0 ],
									"source" : [ "obj-17", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-16", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-3", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-4", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 1 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-5", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-10", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 116.5, 454.25, 637.5, 454.25 ],
									"source" : [ "obj-58", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-11", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 116.5, 454.25, 921.5, 454.25 ],
									"source" : [ "obj-58", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-13", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 116.5, 454.25, 1162.5, 454.25 ],
									"source" : [ "obj-58", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 116.5, 454.25, 116.5, 454.25 ],
									"source" : [ "obj-58", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 116.5, 454.25, 387.5, 454.25 ],
									"source" : [ "obj-58", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-17", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-9", 1 ]
								}

							}
 ],
						"styles" : [ 							{
								"name" : "jpatcher001",
								"parentstyle" : "",
								"multi" : 0
							}
 ]
					}
,
					"patching_rect" : [ 257.0, 150.0, 106.0, 22.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"style" : "",
						"tags" : ""
					}
,
					"style" : "",
					"text" : "p \"Output Format\""
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-7",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 37.195312, 398.0, 92.0, 22.0 ],
					"style" : "",
					"text" : "loadmess open"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-5",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 37.195312, 456.0, 53.0, 22.0 ],
					"style" : "",
					"text" : "pcontrol"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-76",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 7,
							"minor" : 2,
							"revision" : 4,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"rect" : [ 1365.0, 73.0, 280.0, 325.0 ],
						"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
						"editing_bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
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
						"lefttoolbarpinned" : 1,
						"toptoolbarpinned" : 1,
						"righttoolbarpinned" : 1,
						"bottomtoolbarpinned" : 1,
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
						"visible" : 1,
						"boxes" : [ 							{
								"box" : 								{
									"annotation" : "none",
									"args" : [ "/eq" ],
									"bgmode" : 0,
									"border" : 0,
									"clickthrough" : 0,
									"enablehscroll" : 0,
									"enablevscroll" : 0,
									"id" : "obj-8",
									"lockeddragscroll" : 0,
									"maxclass" : "bpatcher",
									"name" : "equalizer~.view.small.maxpat",
									"numinlets" : 1,
									"numoutlets" : 1,
									"offset" : [ 0.0, 0.0 ],
									"outlettype" : [ "" ],
									"patching_rect" : [ 14.5, 140.993866, 150.0, 105.0 ],
									"presentation_rect" : [ 0.0, 0.0, 150.0, 105.0 ],
									"viewvisibility" : 1
								}

							}
, 							{
								"box" : 								{
									"annotation" : "A generic audio output model with built in master saturation, limiter, and recording abilities.",
									"fontface" : 0,
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-5",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 14.5, 277.993866, 185.0, 22.0 ],
									"style" : "",
									"text" : "output~.model output @priority 5"
								}

							}
, 							{
								"box" : 								{
									"annotation" : "none",
									"fontface" : 0,
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "signal", "signal", "" ],
									"patching_rect" : [ 14.5, 60.0, 170.0, 22.0 ],
									"style" : "",
									"text" : "input~.model input @priority 1"
								}

							}
, 							{
								"box" : 								{
									"annotation" : "Emulate the use of lower sample-rates and bit-resolution.",
									"fontface" : 0,
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 3,
									"outlettype" : [ "signal", "signal", "" ],
									"patching_rect" : [ 14.5, 87.248459, 216.0, 22.0 ],
									"style" : "",
									"text" : "degrade~.model degrade.1 @priority 2"
								}

							}
, 							{
								"box" : 								{
									"annotation" : "none",
									"fontface" : 0,
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 3,
									"outlettype" : [ "signal", "signal", "" ],
									"patching_rect" : [ 14.5, 250.745392, 180.0, 22.0 ],
									"style" : "",
									"text" : "equalizer~.model eq @priority 4"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-29",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 20.0, -149.0, 24.0, 22.0 ],
									"style" : "",
									"text" : "t b"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-28",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 14.5, -175.0, 42.0, 22.0 ],
									"style" : "",
									"text" : "active"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-27",
									"maxclass" : "newobj",
									"numinlets" : 3,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 14.5, -36.20929, 178.0, 22.0 ],
									"style" : "",
									"text" : "pong @mode fold @range 0. 1."
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-26",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 14.5, -121.0, 67.0, 22.0 ],
									"style" : "",
									"text" : "0, 10 8000"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-24",
									"maxclass" : "newobj",
									"numinlets" : 3,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 14.5, -90.069763, 43.0, 22.0 ],
									"style" : "",
									"text" : "line 0."
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-23",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 14.5, -63.139526, 35.0, 22.0 ],
									"style" : "",
									"text" : "% 2."
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-18",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 14.5, -9.279083, 120.0, 22.0 ],
									"style" : "",
									"text" : "bgcolor 1. 1. 0.75 $1"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-12",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 544.0, 71.0, 60.0, 22.0 ],
									"style" : "",
									"text" : "loadbang"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-11",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 544.0, 110.0, 181.0, 22.0 ],
									"style" : "",
									"text" : "window flags float, window exec"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-9",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 544.0, 150.0, 69.0, 22.0 ],
									"save" : [ "#N", "thispatcher", ";", "#Q", "end", ";" ],
									"style" : "",
									"text" : "thispatcher"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"hidden" : 1,
									"id" : "obj-6",
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 31.0, 645.0, 25.0, 25.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"fontface" : 1,
									"fontname" : "Lato Regular",
									"fontsize" : 14.0,
									"id" : "obj-3",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 14.5, 22.0, 184.0, 23.0 ],
									"style" : "",
									"text" : "Some demo models & views"
								}

							}
, 							{
								"box" : 								{
									"annotation" : "Emulate the use of lower sample-rates and bit-resolution.",
									"fontface" : 0,
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-13",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 3,
									"outlettype" : [ "signal", "signal", "" ],
									"patching_rect" : [ 14.5, 114.496933, 216.0, 22.0 ],
									"style" : "",
									"text" : "degrade~.model degrade.2 @priority 3"
								}

							}
, 							{
								"box" : 								{
									"angle" : 270.0,
									"bgcolor" : [ 1.0, 1.0, 0.75, 0.0 ],
									"id" : "obj-2",
									"maxclass" : "panel",
									"mode" : 0,
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 14.5, 22.0, 180.0, 23.0 ],
									"proportion" : 0.39,
									"rounded" : 0,
									"style" : ""
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-9", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-11", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-11", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-12", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-2", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-18", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-27", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-23", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-23", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-24", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-24", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-26", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-18", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-27", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-29", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-28", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-26", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-29", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 37.195312, 495.0, 102.0, 23.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"style" : "",
						"tags" : ""
					}
,
					"style" : "",
					"text" : "p someModules"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-3",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 0,
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 7,
							"minor" : 2,
							"revision" : 4,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"rect" : [ 0.0, 26.0, 1680.0, 975.0 ],
						"bgcolor" : [ 0.878431, 0.878431, 0.858824, 1.0 ],
						"editing_bgcolor" : [ 0.878431, 0.878431, 0.858824, 1.0 ],
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
						"lefttoolbarpinned" : 1,
						"toptoolbarpinned" : 1,
						"righttoolbarpinned" : 1,
						"bottomtoolbarpinned" : 1,
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
						"subpatcher_template" : "greyish",
						"showontab" : 1,
						"boxes" : [ 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-17",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 1317.0, 815.0, 127.0, 22.0 ],
									"style" : "",
									"text" : "s namespacemaxhelp"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-18",
									"maxclass" : "panel",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 1298.0, 869.0, 13.0, 13.0 ],
									"shape" : 3,
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-33",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 1317.0, 859.5, 176.0, 22.0 ],
									"style" : "",
									"text" : "Reveal demo models and view"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-28",
									"maxclass" : "panel",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 10.0, 181.5, 13.0, 13.0 ],
									"shape" : 3,
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-27",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 27.0, 219.5, 37.0, 22.0 ],
									"style" : "",
									"text" : "open"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-24",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 27.0, 250.5, 53.0, 22.0 ],
									"style" : "",
									"text" : "pcontrol"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-23",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patcher" : 									{
										"fileversion" : 1,
										"appversion" : 										{
											"major" : 7,
											"minor" : 2,
											"revision" : 4,
											"architecture" : "x64",
											"modernui" : 1
										}
,
										"rect" : [ 53.0, 109.0, 277.0, 209.0 ],
										"bgcolor" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
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
										"lefttoolbarpinned" : 1,
										"toptoolbarpinned" : 1,
										"righttoolbarpinned" : 1,
										"bottomtoolbarpinned" : 1,
										"toolbars_unpinned_last_save" : 0,
										"tallnewobj" : 0,
										"boxanimatetime" : 200,
										"enablehscroll" : 0,
										"enablevscroll" : 0,
										"devicewidth" : 0.0,
										"description" : "",
										"digest" : "",
										"tags" : "",
										"style" : "",
										"subpatcher_template" : "greyish",
										"boxes" : [ 											{
												"box" : 												{
													"fontname" : "Lato Regular",
													"fontsize" : 12.0,
													"id" : "obj-16",
													"linecount" : 13,
													"maxclass" : "comment",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 2.0, 6.0, 287.0, 194.0 ],
													"style" : "",
													"text" : "- object (the low-level c++ class of the object)\n\n- attribute (any attribute of the inspected object)\n\n- value (value of the inspected attribute)\n\n- part (a string in the object full address)\n\n- parent (name of the parent node)\n\n- name (name of the object node)\n\n- instance (instance number of the object)",
													"textcolor" : [ 0.3, 0.3, 0.3, 1.0 ]
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"hidden" : 1,
													"id" : "obj-1",
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 17.0, 39.0, 30.0, 30.0 ],
													"style" : ""
												}

											}
, 											{
												"box" : 												{
													"bgcolor" : [ 0.896579, 0.896579, 0.896579, 1.0 ],
													"cols" : 1,
													"colwidth" : 275,
													"fontface" : 0,
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"hscroll" : 0,
													"id" : "obj-2",
													"maxclass" : "jit.cellblock",
													"numinlets" : 2,
													"numoutlets" : 4,
													"outlettype" : [ "list", "", "", "" ],
													"patching_rect" : [ 2.0, 3.0, 273.0, 203.0 ],
													"rowheight" : 29,
													"rows" : 7,
													"selmode" : 0,
													"vscroll" : 0
												}

											}
 ],
										"lines" : [  ],
										"styles" : [ 											{
												"name" : "jpatcher001",
												"parentstyle" : "",
												"multi" : 0
											}
 ]
									}
,
									"patching_rect" : [ 27.0, 279.5, 124.0, 22.0 ],
									"saved_object_attributes" : 									{
										"description" : "",
										"digest" : "",
										"globalpatchername" : "",
										"style" : "",
										"tags" : ""
									}
,
									"style" : "",
									"text" : "p \"Options reference\""
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-22",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 27.0, 176.5, 137.0, 22.0 ],
									"style" : "",
									"text" : "Open options reference"
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"bubbleside" : 3,
									"bubbletextmargin" : 10,
									"id" : "obj-15",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 534.5, 455.0, 123.0, 47.0 ],
									"style" : "",
									"text" : "Add multiple options at once"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-14",
									"linecount" : 2,
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 660.5, 462.0, 308.0, 35.0 ],
									"style" : "",
									"text" : "filter/set myFilter object Data attribute value value 1000, explore"
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"bubbleside" : 3,
									"bubbletextmargin" : 10,
									"id" : "obj-10",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 190.0, 429.0, 84.0, 47.0 ],
									"style" : "",
									"text" : "Remove a filters"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-13",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 278.0, 461.0, 123.0, 22.0 ],
									"style" : "",
									"text" : "filter/remove myFilter"
								}

							}
, 							{
								"box" : 								{
									"fontsize" : 14.0,
									"id" : "obj-8",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 278.0, 194.5, 67.0, 22.0 ],
									"style" : "",
									"text" : "Add filter"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-3",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 784.0, 631.5, 81.0, 20.0 ],
									"style" : "",
									"text" : "Inspect filters"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-6",
									"maxclass" : "panel",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 784.0, 631.5, 95.0, 23.0 ],
									"rounded" : 0,
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"bubbleside" : 3,
									"bubbletextmargin" : 10,
									"id" : "obj-105",
									"linecount" : 3,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 1071.0, 472.5, 126.0, 61.0 ],
									"style" : "",
									"text" : "Using mode option to combine filters"
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"bubbleside" : 3,
									"bubbletextmargin" : 10,
									"id" : "obj-104",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 1071.0, 385.0, 129.0, 34.0 ],
									"style" : "",
									"text" : "Filter view nodes"
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"bubbleside" : 3,
									"bubbletextmargin" : 10,
									"id" : "obj-103",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 1045.0, 324.5, 152.0, 47.0 ],
									"style" : "",
									"text" : "Filter nodes with 'eq' in the address"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-102",
									"linecount" : 2,
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 1206.0, 462.0, 184.0, 35.0 ],
									"style" : "",
									"text" : "filter/set eqViews mode exclude, explore"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-101",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 1332.0, 552.0, 56.0, 20.0 ],
									"style" : "",
									"text" : "(default)"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-99",
									"linecount" : 2,
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 1206.0, 513.5, 180.0, 35.0 ],
									"style" : "",
									"text" : "filter/set eqViews mode restrict, explore"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-98",
									"linecount" : 2,
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 1206.0, 385.0, 315.0, 35.0 ],
									"style" : "",
									"text" : "filter/set eqViews object Container attribute service value view, explore"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-97",
									"linecount" : 2,
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 1206.0, 334.5, 236.0, 35.0 ],
									"style" : "",
									"text" : "filter/set eqNodes object Container part eq, explore"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-96",
									"linecount" : 2,
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 1206.0, 278.5, 82.0, 35.0 ],
									"style" : "",
									"text" : "filter/remove, explore"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-94",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 1206.0, 222.5, 164.0, 20.0 ],
									"style" : "",
									"text" : "Set multiple cascaded filters"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-85",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 678.5, 411.0, 239.0, 33.0 ],
									"style" : "",
									"text" : "Note that both addresses under the '/eq' model and 'input/testtone/frequency match"
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"bubbleside" : 3,
									"bubbletextmargin" : 10,
									"id" : "obj-84",
									"linecount" : 3,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 511.5, 364.0, 146.0, 61.0 ],
									"style" : "",
									"text" : "Add option to filter node with 'eq' string in their full address"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-80",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 660.5, 385.0, 149.0, 22.0 ],
									"style" : "",
									"text" : "filter/set myFilter part eq, /"
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"bubbleside" : 3,
									"bubbletextmargin" : 10,
									"id" : "obj-77",
									"linecount" : 3,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 506.5, 264.0, 150.0, 61.0 ],
									"style" : "",
									"text" : "Type of the object to filter (ie. Data for parameter & friends)"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-76",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 660.5, 324.5, 161.0, 22.0 ],
									"style" : "",
									"text" : "filter/set myFilter object $1, /"
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"bubbleside" : 3,
									"bubbletextmargin" : 10,
									"id" : "obj-73",
									"linecount" : 4,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 182.5, 295.0, 97.0, 74.0 ],
									"style" : "",
									"text" : "Create a named (required) filter"
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"bubbleside" : 3,
									"bubbletextmargin" : 10,
									"id" : "obj-70",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 167.0, 486.5, 101.0, 47.0 ],
									"style" : "",
									"text" : "Remove all active filters"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-68",
									"linecount" : 3,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 10.0, 102.0, 1017.0, 47.0 ],
									"style" : "",
									"text" : "The syntaxe is made of pairs of (option + value). By default, these options will match any item in the namespace (ie. model, view, parameter, message, return, remote or any empty node.)\n\nFilters require a name and a combination of the following options. See the \"Namespace exploration and queries\" tutorial for in depth explanation."
								}

							}
, 							{
								"box" : 								{
									"fontsize" : 14.0,
									"id" : "obj-66",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 660.5, 194.5, 85.0, 22.0 ],
									"style" : "",
									"text" : "Add options"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-65",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 784.0, 819.205139, 97.0, 22.0 ],
									"style" : "",
									"text" : "filter/info remote"
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"bubbletextmargin" : 10,
									"id" : "obj-64",
									"linecount" : 3,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 927.0, 732.55127, 122.0, 61.0 ],
									"style" : "",
									"text" : "Get details on user-defined or internal filters"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-62",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 784.0, 675.0, 102.0, 22.0 ],
									"style" : "",
									"text" : "filter/info myFilter"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-61",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 784.0, 842.256409, 86.0, 22.0 ],
									"style" : "",
									"text" : "filter/info none"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-60",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 784.0, 795.205139, 83.0, 22.0 ],
									"style" : "",
									"text" : "filter/info view"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-59",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 784.0, 771.15387, 91.0, 22.0 ],
									"style" : "",
									"text" : "filter/info return"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-58",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 784.0, 747.102539, 108.0, 22.0 ],
									"style" : "",
									"text" : "filter/info message"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-57",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 784.0, 723.05127, 114.0, 22.0 ],
									"style" : "",
									"text" : "filter/info parameter"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-56",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 784.0, 699.0, 92.0, 22.0 ],
									"style" : "",
									"text" : "filter/info model"
								}

							}
, 							{
								"box" : 								{
									"bgmode" : 0,
									"border" : 1,
									"clickthrough" : 0,
									"embed" : 1,
									"enablehscroll" : 0,
									"enablevscroll" : 0,
									"id" : "obj-49",
									"lockeddragscroll" : 0,
									"maxclass" : "bpatcher",
									"numinlets" : 1,
									"numoutlets" : 0,
									"offset" : [ -2.0, -1.0 ],
									"patcher" : 									{
										"fileversion" : 1,
										"appversion" : 										{
											"major" : 7,
											"minor" : 2,
											"revision" : 4,
											"architecture" : "x64",
											"modernui" : 1
										}
,
										"rect" : [ 513.0, 714.0, 236.0, 167.0 ],
										"bgcolor" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
										"bglocked" : 0,
										"openinpresentation" : 1,
										"default_fontsize" : 12.0,
										"default_fontface" : 0,
										"default_fontname" : "Arial",
										"gridonopen" : 1,
										"gridsize" : [ 15.0, 15.0 ],
										"gridsnaponopen" : 1,
										"objectsnaponopen" : 1,
										"statusbarvisible" : 2,
										"toolbarvisible" : 1,
										"lefttoolbarpinned" : 1,
										"toptoolbarpinned" : 1,
										"righttoolbarpinned" : 1,
										"bottomtoolbarpinned" : 1,
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
										"subpatcher_template" : "greyish",
										"boxes" : [ 											{
												"box" : 												{
													"annotation" : "0.5000",
													"bgcolor" : [ 0.898039, 0.898039, 0.898039, 0.0 ],
													"border" : 1.0,
													"bordercolor" : [ 0.65098, 0.666667, 0.662745, 1.0 ],
													"fontname" : "Lato Regular",
													"hint" : "0.5000",
													"id" : "obj-17",
													"maxclass" : "textedit",
													"numinlets" : 1,
													"numoutlets" : 4,
													"outlettype" : [ "", "int", "", "" ],
													"parameter_enable" : 0,
													"patching_rect" : [ 799.0, 290.25, 100.0, 50.0 ],
													"presentation" : 1,
													"presentation_rect" : [ 124.0, 145.53952, 114.0, 22.0 ],
													"rounded" : 0.0,
													"style" : "",
													"textcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ]
												}

											}
, 											{
												"box" : 												{
													"annotation" : "0.5000",
													"bgcolor" : [ 0.898039, 0.898039, 0.898039, 0.0 ],
													"border" : 1.0,
													"bordercolor" : [ 0.65098, 0.666667, 0.662745, 1.0 ],
													"fontname" : "Lato Regular",
													"hint" : "0.5000",
													"id" : "obj-19",
													"maxclass" : "textedit",
													"numinlets" : 1,
													"numoutlets" : 4,
													"outlettype" : [ "", "int", "", "" ],
													"parameter_enable" : 0,
													"patching_rect" : [ 692.0, 290.25, 100.0, 50.0 ],
													"presentation" : 1,
													"presentation_rect" : [ 124.0, 125.167358, 114.0, 22.0 ],
													"rounded" : 0.0,
													"style" : "",
													"textcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ]
												}

											}
, 											{
												"box" : 												{
													"annotation" : "0.5000",
													"bgcolor" : [ 0.898039, 0.898039, 0.898039, 0.0 ],
													"border" : 1.0,
													"bordercolor" : [ 0.65098, 0.666667, 0.662745, 1.0 ],
													"fontname" : "Lato Regular",
													"hint" : "0.5000",
													"id" : "obj-21",
													"maxclass" : "textedit",
													"numinlets" : 1,
													"numoutlets" : 4,
													"outlettype" : [ "", "int", "", "" ],
													"parameter_enable" : 0,
													"patching_rect" : [ 585.0, 290.25, 100.0, 50.0 ],
													"presentation" : 1,
													"presentation_rect" : [ 124.0, 103.960571, 114.0, 22.0 ],
													"rounded" : 0.0,
													"style" : "",
													"textcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ]
												}

											}
, 											{
												"box" : 												{
													"annotation" : "0.5000",
													"bgcolor" : [ 0.898039, 0.898039, 0.898039, 0.0 ],
													"border" : 1.0,
													"bordercolor" : [ 0.65098, 0.666667, 0.662745, 1.0 ],
													"fontname" : "Lato Regular",
													"hint" : "0.5000",
													"id" : "obj-23",
													"maxclass" : "textedit",
													"numinlets" : 1,
													"numoutlets" : 4,
													"outlettype" : [ "", "int", "", "" ],
													"parameter_enable" : 0,
													"patching_rect" : [ 478.0, 290.25, 100.0, 50.0 ],
													"presentation" : 1,
													"presentation_rect" : [ 124.0, 83.001953, 114.0, 22.0 ],
													"rounded" : 0.0,
													"style" : "",
													"textcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ]
												}

											}
, 											{
												"box" : 												{
													"annotation" : "0.5000",
													"bgcolor" : [ 0.898039, 0.898039, 0.898039, 0.0 ],
													"border" : 1.0,
													"bordercolor" : [ 0.65098, 0.666667, 0.662745, 1.0 ],
													"fontname" : "Lato Regular",
													"hint" : "0.5000",
													"id" : "obj-13",
													"maxclass" : "textedit",
													"numinlets" : 1,
													"numoutlets" : 4,
													"outlettype" : [ "", "int", "", "" ],
													"parameter_enable" : 0,
													"patching_rect" : [ 371.0, 290.25, 100.0, 50.0 ],
													"presentation" : 1,
													"presentation_rect" : [ 124.0, 62.043274, 114.0, 22.0 ],
													"rounded" : 0.0,
													"style" : "",
													"textcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ]
												}

											}
, 											{
												"box" : 												{
													"annotation" : "0.5000",
													"bgcolor" : [ 0.898039, 0.898039, 0.898039, 0.0 ],
													"border" : 1.0,
													"bordercolor" : [ 0.65098, 0.666667, 0.662745, 1.0 ],
													"fontname" : "Lato Regular",
													"hint" : "0.5000",
													"id" : "obj-15",
													"maxclass" : "textedit",
													"numinlets" : 1,
													"numoutlets" : 4,
													"outlettype" : [ "", "int", "", "" ],
													"parameter_enable" : 0,
													"patching_rect" : [ 264.0, 290.25, 100.0, 50.0 ],
													"presentation" : 1,
													"presentation_rect" : [ 124.0, 41.084625, 114.0, 22.0 ],
													"rounded" : 0.0,
													"style" : "",
													"textcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ]
												}

											}
, 											{
												"box" : 												{
													"annotation" : "0.5000",
													"bgcolor" : [ 0.898039, 0.898039, 0.898039, 0.0 ],
													"border" : 1.0,
													"bordercolor" : [ 0.65098, 0.666667, 0.662745, 1.0 ],
													"fontname" : "Lato Regular",
													"hint" : "0.5000",
													"id" : "obj-11",
													"maxclass" : "textedit",
													"numinlets" : 1,
													"numoutlets" : 4,
													"outlettype" : [ "", "int", "", "" ],
													"parameter_enable" : 0,
													"patching_rect" : [ 157.0, 290.25, 100.0, 50.0 ],
													"presentation" : 1,
													"presentation_rect" : [ 124.0, 19.960541, 114.0, 22.0 ],
													"rounded" : 0.0,
													"style" : "",
													"textcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ]
												}

											}
, 											{
												"box" : 												{
													"annotation" : "0.5000",
													"bgcolor" : [ 0.898039, 0.898039, 0.898039, 0.0 ],
													"border" : 1.0,
													"bordercolor" : [ 0.65098, 0.666667, 0.662745, 1.0 ],
													"fontname" : "Lato Regular",
													"hint" : "0.5000",
													"id" : "obj-88",
													"maxclass" : "textedit",
													"numinlets" : 1,
													"numoutlets" : 4,
													"outlettype" : [ "", "int", "", "" ],
													"parameter_enable" : 0,
													"patching_rect" : [ 50.0, 290.25, 100.0, 50.0 ],
													"presentation" : 1,
													"presentation_rect" : [ 124.0, -1.163544, 114.0, 22.0 ],
													"rounded" : 0.0,
													"style" : "",
													"textcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ]
												}

											}
, 											{
												"box" : 												{
													"hidden" : 1,
													"id" : "obj-40",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 157.0, 401.0, 37.0, 22.0 ],
													"style" : "",
													"text" : "clear"
												}

											}
, 											{
												"box" : 												{
													"annotation" : "0.5000",
													"bgcolor" : [ 0.898039, 0.898039, 0.898039, 0.0 ],
													"border" : 1.0,
													"bordercolor" : [ 0.65098, 0.666667, 0.662745, 1.0 ],
													"fontname" : "Lato Regular",
													"hint" : "0.5000",
													"id" : "obj-10",
													"maxclass" : "textedit",
													"numinlets" : 1,
													"numoutlets" : 4,
													"outlettype" : [ "", "int", "", "" ],
													"parameter_enable" : 0,
													"patching_rect" : [ 157.0, 591.0, 37.0, 10.0 ],
													"presentation" : 1,
													"presentation_rect" : [ 4.0, 145.53952, 121.0, 22.0 ],
													"rounded" : 0.0,
													"style" : "",
													"textcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ],
													"textjustification" : 2
												}

											}
, 											{
												"box" : 												{
													"annotation" : "0.5000",
													"bgcolor" : [ 0.898039, 0.898039, 0.898039, 0.0 ],
													"border" : 1.0,
													"bordercolor" : [ 0.65098, 0.666667, 0.662745, 1.0 ],
													"fontname" : "Lato Regular",
													"hint" : "0.5000",
													"id" : "obj-29",
													"maxclass" : "textedit",
													"numinlets" : 1,
													"numoutlets" : 4,
													"outlettype" : [ "", "int", "", "" ],
													"parameter_enable" : 0,
													"patching_rect" : [ 157.0, 570.041382, 37.0, 10.0 ],
													"presentation" : 1,
													"presentation_rect" : [ 4.0, 125.167297, 121.0, 22.0 ],
													"rounded" : 0.0,
													"style" : "",
													"textcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ],
													"textjustification" : 2
												}

											}
, 											{
												"box" : 												{
													"annotation" : "0.5000",
													"bgcolor" : [ 0.898039, 0.898039, 0.898039, 0.0 ],
													"border" : 1.0,
													"bordercolor" : [ 0.65098, 0.666667, 0.662745, 1.0 ],
													"fontname" : "Lato Regular",
													"hint" : "0.5000",
													"id" : "obj-30",
													"maxclass" : "textedit",
													"numinlets" : 1,
													"numoutlets" : 4,
													"outlettype" : [ "", "int", "", "" ],
													"parameter_enable" : 0,
													"patching_rect" : [ 157.0, 548.834595, 37.0, 10.0 ],
													"presentation" : 1,
													"presentation_rect" : [ 4.0, 104.374115, 121.0, 22.0 ],
													"rounded" : 0.0,
													"style" : "",
													"textcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ],
													"textjustification" : 2
												}

											}
, 											{
												"box" : 												{
													"annotation" : "0.5000",
													"bgcolor" : [ 0.898039, 0.898039, 0.898039, 0.0 ],
													"border" : 1.0,
													"bordercolor" : [ 0.65098, 0.666667, 0.662745, 1.0 ],
													"fontname" : "Lato Regular",
													"hint" : "0.5000",
													"id" : "obj-31",
													"maxclass" : "textedit",
													"numinlets" : 1,
													"numoutlets" : 4,
													"outlettype" : [ "", "int", "", "" ],
													"parameter_enable" : 0,
													"patching_rect" : [ 157.0, 527.875977, 37.0, 10.0 ],
													"presentation" : 1,
													"presentation_rect" : [ 4.0, 83.415497, 121.0, 22.0 ],
													"rounded" : 0.0,
													"style" : "",
													"textcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ],
													"textjustification" : 2
												}

											}
, 											{
												"box" : 												{
													"annotation" : "0.5000",
													"bgcolor" : [ 0.898039, 0.898039, 0.898039, 0.0 ],
													"border" : 1.0,
													"bordercolor" : [ 0.65098, 0.666667, 0.662745, 1.0 ],
													"fontname" : "Lato Regular",
													"hint" : "0.5000",
													"id" : "obj-33",
													"maxclass" : "textedit",
													"numinlets" : 1,
													"numoutlets" : 4,
													"outlettype" : [ "", "int", "", "" ],
													"parameter_enable" : 0,
													"patching_rect" : [ 157.0, 506.917297, 37.0, 10.0 ],
													"presentation" : 1,
													"presentation_rect" : [ 4.0, 62.456818, 121.0, 22.0 ],
													"rounded" : 0.0,
													"style" : "",
													"textcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ],
													"textjustification" : 2
												}

											}
, 											{
												"box" : 												{
													"annotation" : "0.5000",
													"bgcolor" : [ 0.898039, 0.898039, 0.898039, 0.0 ],
													"border" : 1.0,
													"bordercolor" : [ 0.65098, 0.666667, 0.662745, 1.0 ],
													"fontname" : "Lato Regular",
													"hint" : "0.5000",
													"id" : "obj-34",
													"maxclass" : "textedit",
													"numinlets" : 1,
													"numoutlets" : 4,
													"outlettype" : [ "", "int", "", "" ],
													"parameter_enable" : 0,
													"patching_rect" : [ 157.0, 485.958618, 37.0, 10.0 ],
													"presentation" : 1,
													"presentation_rect" : [ 4.0, 41.498169, 121.0, 22.0 ],
													"rounded" : 0.0,
													"style" : "",
													"textcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ],
													"textjustification" : 2
												}

											}
, 											{
												"box" : 												{
													"annotation" : "0.5000",
													"bgcolor" : [ 0.898039, 0.898039, 0.898039, 0.0 ],
													"border" : 1.0,
													"bordercolor" : [ 0.65098, 0.666667, 0.662745, 1.0 ],
													"fontname" : "Lato Regular",
													"hint" : "0.5000",
													"id" : "obj-36",
													"maxclass" : "textedit",
													"numinlets" : 1,
													"numoutlets" : 4,
													"outlettype" : [ "", "int", "", "" ],
													"parameter_enable" : 0,
													"patching_rect" : [ 157.0, 464.834595, 37.0, 10.0 ],
													"presentation" : 1,
													"presentation_rect" : [ 4.0, 20.374084, 121.0, 22.0 ],
													"rounded" : 0.0,
													"style" : "",
													"textcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ],
													"textjustification" : 2
												}

											}
, 											{
												"box" : 												{
													"annotation" : "0.5000",
													"bgcolor" : [ 0.898039, 0.898039, 0.898039, 0.0 ],
													"border" : 1.0,
													"bordercolor" : [ 0.65098, 0.666667, 0.662745, 1.0 ],
													"fontname" : "Lato Regular",
													"hint" : "0.5000",
													"id" : "obj-38",
													"maxclass" : "textedit",
													"numinlets" : 1,
													"numoutlets" : 4,
													"outlettype" : [ "", "int", "", "" ],
													"parameter_enable" : 0,
													"patching_rect" : [ 157.0, 443.710449, 37.0, 10.0 ],
													"presentation" : 1,
													"presentation_rect" : [ 4.0, -0.75, 121.0, 22.0 ],
													"rounded" : 0.0,
													"style" : "",
													"textcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ],
													"textjustification" : 2
												}

											}
, 											{
												"box" : 												{
													"fontface" : 1,
													"fontname" : "Lato Black",
													"id" : "obj-27",
													"maxclass" : "comment",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 56.0, 553.5, 85.0, 21.0 ],
													"presentation" : 1,
													"presentation_rect" : [ 42.0, 62.043274, 85.0, 21.0 ],
													"style" : "",
													"text" : "Parent name :",
													"textcolor" : [ 0.239216, 0.254902, 0.278431, 1.0 ]
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-26",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 980.0, 252.0, 91.0, 22.0 ],
													"style" : "",
													"text" : "loadmess clear"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-25",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "", "clear" ],
													"patching_rect" : [ 50.0, 53.0, 964.0, 22.0 ],
													"style" : "",
													"text" : "t l clear"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-18",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 799.0, 250.25, 74.0, 22.0 ],
													"style" : "",
													"text" : "prepend set"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-20",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 692.0, 250.25, 74.0, 22.0 ],
													"style" : "",
													"text" : "prepend set"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-22",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 585.0, 250.25, 74.0, 22.0 ],
													"style" : "",
													"text" : "prepend set"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-24",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 478.0, 250.25, 74.0, 22.0 ],
													"style" : "",
													"text" : "prepend set"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-14",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 371.0, 250.25, 74.0, 22.0 ],
													"style" : "",
													"text" : "prepend set"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-16",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 264.0, 250.25, 74.0, 22.0 ],
													"style" : "",
													"text" : "prepend set"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-12",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 157.0, 250.25, 74.0, 22.0 ],
													"style" : "",
													"text" : "prepend set"
												}

											}
, 											{
												"box" : 												{
													"fontface" : 1,
													"fontname" : "Lato Black",
													"id" : "obj-9",
													"maxclass" : "comment",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 34.0, 599.5, 107.0, 21.0 ],
													"presentation" : 1,
													"presentation_rect" : [ 20.0, 104.960571, 107.0, 21.0 ],
													"style" : "",
													"text" : "Instance number :",
													"textcolor" : [ 0.239216, 0.254902, 0.278431, 1.0 ]
												}

											}
, 											{
												"box" : 												{
													"fontface" : 1,
													"fontname" : "Lato Black",
													"id" : "obj-8",
													"maxclass" : "comment",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 63.0, 576.5, 78.0, 21.0 ],
													"presentation" : 1,
													"presentation_rect" : [ 49.0, 83.001892, 78.0, 21.0 ],
													"style" : "",
													"text" : "Node name :",
													"textcolor" : [ 0.239216, 0.254902, 0.278431, 1.0 ]
												}

											}
, 											{
												"box" : 												{
													"fontface" : 1,
													"fontname" : "Lato Black",
													"id" : "obj-7",
													"maxclass" : "comment",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 56.0, 530.5, 85.0, 21.0 ],
													"presentation" : 1,
													"presentation_rect" : [ 42.0, 41.084595, 85.0, 21.0 ],
													"style" : "",
													"text" : "Address part :",
													"textcolor" : [ 0.239216, 0.254902, 0.278431, 1.0 ]
												}

											}
, 											{
												"box" : 												{
													"fontface" : 1,
													"fontname" : "Lato Black",
													"id" : "obj-6",
													"maxclass" : "comment",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 43.0, 508.0, 98.0, 21.0 ],
													"presentation" : 1,
													"presentation_rect" : [ 28.0, 146.125977, 98.0, 21.0 ],
													"style" : "",
													"text" : "Attribute value :",
													"textcolor" : [ 0.239216, 0.254902, 0.278431, 1.0 ]
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-89",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 50.0, 250.25, 74.0, 22.0 ],
													"style" : "",
													"text" : "prepend set"
												}

											}
, 											{
												"box" : 												{
													"fontface" : 1,
													"fontname" : "Lato Black",
													"id" : "obj-4",
													"maxclass" : "comment",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 21.0, 485.0, 120.0, 21.0 ],
													"presentation" : 1,
													"presentation_rect" : [ 5.5, 126.167297, 120.0, 21.0 ],
													"style" : "",
													"text" : "Inspected attribute :",
													"textcolor" : [ 0.239216, 0.254902, 0.278431, 1.0 ]
												}

											}
, 											{
												"box" : 												{
													"fontface" : 1,
													"fontname" : "Lato Black",
													"id" : "obj-3",
													"maxclass" : "comment",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 61.0, 462.0, 80.0, 21.0 ],
													"presentation" : 1,
													"presentation_rect" : [ 47.0, 20.208649, 80.0, 21.0 ],
													"style" : "",
													"text" : "Object type :",
													"textcolor" : [ 0.239216, 0.254902, 0.278431, 1.0 ]
												}

											}
, 											{
												"box" : 												{
													"fontface" : 1,
													"fontname" : "Lato Black",
													"id" : "obj-2",
													"maxclass" : "comment",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 64.0, 439.0, 77.0, 21.0 ],
													"presentation" : 1,
													"presentation_rect" : [ 50.0, -0.75, 77.0, 21.0 ],
													"style" : "",
													"text" : "Filter name :",
													"textcolor" : [ 0.239216, 0.254902, 0.278431, 1.0 ]
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-37",
													"maxclass" : "newobj",
													"numinlets" : 9,
													"numoutlets" : 9,
													"outlettype" : [ "", "", "", "", "", "", "", "", "" ],
													"patching_rect" : [ 50.0, 148.0, 875.0, 22.0 ],
													"style" : "",
													"text" : "route filter_name object part parent name instance attribute value"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-35",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 50.0, 100.0, 117.0, 22.0 ],
													"style" : "",
													"text" : "prepend filter_name"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-32",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 2,
													"outlettype" : [ "", "" ],
													"patching_rect" : [ 50.0, 124.0, 49.0, 22.0 ],
													"style" : "",
													"text" : "zl.iter 2"
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-48",
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 50.0, 12.0, 30.0, 30.0 ],
													"style" : ""
												}

											}
, 											{
												"box" : 												{
													"angle" : 270.0,
													"bgcolor" : [ 0.898039, 0.898039, 0.898039, 1.0 ],
													"id" : "obj-1",
													"maxclass" : "panel",
													"mode" : 0,
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 163.0, 674.0, 128.0, 128.0 ],
													"presentation" : 1,
													"presentation_rect" : [ 124.0, 0.25, 114.0, 167.624786 ],
													"proportion" : 0.39,
													"rounded" : 0,
													"style" : ""
												}

											}
, 											{
												"box" : 												{
													"angle" : 270.0,
													"bgcolor" : [ 0.8, 0.8, 0.8, 1.0 ],
													"id" : "obj-28",
													"maxclass" : "panel",
													"mode" : 0,
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 21.0, 674.0, 128.0, 128.0 ],
													"presentation" : 1,
													"presentation_rect" : [ 4.0, 0.25, 120.0, 167.875977 ],
													"proportion" : 0.39,
													"rounded" : 0,
													"style" : ""
												}

											}
 ],
										"lines" : [ 											{
												"patchline" : 												{
													"destination" : [ "obj-11", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-12", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-13", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-14", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-15", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-16", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-17", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-18", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-19", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-20", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-21", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-22", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-23", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-24", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-11", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"midpoints" : [ 1004.5, 182.125, 166.5, 182.125 ],
													"source" : [ "obj-25", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-13", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"midpoints" : [ 1004.5, 182.125, 380.5, 182.125 ],
													"source" : [ "obj-25", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-15", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"midpoints" : [ 1004.5, 182.125, 273.5, 182.125 ],
													"source" : [ "obj-25", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-17", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"midpoints" : [ 1004.5, 182.125, 808.5, 182.125 ],
													"source" : [ "obj-25", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-19", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"midpoints" : [ 1004.5, 182.125, 701.5, 182.125 ],
													"source" : [ "obj-25", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-21", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"midpoints" : [ 1004.5, 182.125, 594.5, 182.125 ],
													"source" : [ "obj-25", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-23", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"midpoints" : [ 1004.5, 182.125, 487.5, 182.125 ],
													"source" : [ "obj-25", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-35", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-25", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-88", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"midpoints" : [ 1004.5, 182.125, 59.5, 182.125 ],
													"source" : [ "obj-25", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-11", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"midpoints" : [ 989.5, 281.625, 166.5, 281.625 ],
													"source" : [ "obj-26", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-13", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"midpoints" : [ 989.5, 281.625, 380.5, 281.625 ],
													"source" : [ "obj-26", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-15", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"midpoints" : [ 989.5, 281.625, 273.5, 281.625 ],
													"source" : [ "obj-26", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-17", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"midpoints" : [ 989.5, 281.625, 808.5, 281.625 ],
													"source" : [ "obj-26", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-19", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"midpoints" : [ 989.5, 281.625, 701.5, 281.625 ],
													"source" : [ "obj-26", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-21", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"midpoints" : [ 989.5, 281.625, 594.5, 281.625 ],
													"source" : [ "obj-26", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-23", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"midpoints" : [ 989.5, 281.625, 487.5, 281.625 ],
													"source" : [ "obj-26", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-88", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"midpoints" : [ 989.5, 281.625, 59.5, 281.625 ],
													"source" : [ "obj-26", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-37", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-32", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-32", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-35", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-12", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-37", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-14", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-37", 3 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-16", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-37", 2 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-18", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-37", 7 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-20", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-37", 6 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-22", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-37", 5 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-24", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-37", 4 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-89", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-37", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-10", 0 ],
													"disabled" : 0,
													"hidden" : 1,
													"source" : [ "obj-40", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-29", 0 ],
													"disabled" : 0,
													"hidden" : 1,
													"source" : [ "obj-40", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-30", 0 ],
													"disabled" : 0,
													"hidden" : 1,
													"source" : [ "obj-40", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-31", 0 ],
													"disabled" : 0,
													"hidden" : 1,
													"source" : [ "obj-40", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-33", 0 ],
													"disabled" : 0,
													"hidden" : 1,
													"source" : [ "obj-40", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-34", 0 ],
													"disabled" : 0,
													"hidden" : 1,
													"source" : [ "obj-40", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-36", 0 ],
													"disabled" : 0,
													"hidden" : 1,
													"source" : [ "obj-40", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-38", 0 ],
													"disabled" : 0,
													"hidden" : 1,
													"source" : [ "obj-40", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-25", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-48", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-88", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-89", 0 ]
												}

											}
 ]
									}
,
									"patching_rect" : [ 513.0, 687.5, 236.0, 167.0 ],
									"viewvisibility" : 1
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-30",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 278.0, 500.0, 77.0, 22.0 ],
									"style" : "",
									"text" : "filter/remove"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-26",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 278.0, 324.5, 144.0, 22.0 ],
									"style" : "",
									"text" : "filter/set myFilter, explore"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-21",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 513.0, 653.625, 87.0, 22.0 ],
									"style" : "",
									"text" : "route filter/info"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-20",
									"maxclass" : "button",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 293.0, 639.0, 24.0, 24.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"cellmap" : [ [ 0, 0, "degrade.1" ], [ 0, 1, "degrade.2" ], [ 0, 2, "eq" ], [ 0, 3, "equalizer~(view)" ], [ 0, 4, "equalizer~(view)/equalizer~(view)" ], [ 0, 5, "equalizer~(view)/equalizer~(view)/filter_graph(view)" ], [ 0, 6, "equalizer~(view)/equalizer~(view)/filter_numeric(view)" ], [ 0, 7, "input" ], [ 0, 8, "input/balance" ], [ 0, 9, "input/input" ], [ 0, 10, "input/input/limiter" ], [ 0, 11, "output" ], [ 0, 12, "output/balance" ], [ 0, 13, "output/limiter" ], [ 0, 14, "output/record" ], [ 0, 15, "output/saturation" ] ],
									"cols" : 1,
									"colwidth" : 200,
									"fgcolor" : [ 0.619608, 0.0, 0.360784, 1.0 ],
									"fontface" : 0,
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"gridlinecolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"hcellcolor" : [ 0.819608, 0.819608, 0.898039, 0.0 ],
									"hscroll" : 0,
									"id" : "obj-12",
									"maxclass" : "jit.cellblock",
									"numinlets" : 2,
									"numoutlets" : 4,
									"outlettype" : [ "list", "", "", "" ],
									"patching_rect" : [ 278.0, 687.5, 214.5, 167.0 ],
									"rows" : 16,
									"savemode" : 1,
									"stcolor" : [ 0.8, 0.8, 0.8, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-7",
									"maxclass" : "number",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 395.5, 639.0, 50.0, 22.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-5",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "" ],
									"patching_rect" : [ 278.0, 610.0, 254.0, 22.0 ],
									"style" : "",
									"text" : "j.namespace @address / @format jit.cellblock"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-4",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 10.0, 70.0, 503.0, 20.0 ],
									"style" : "",
									"text" : "Customize internal filters or write your own from scratch using a simple yet powerful syntaxe."
								}

							}
, 							{
								"box" : 								{
									"fontsize" : 14.0,
									"id" : "obj-78",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 1206.0, 194.5, 116.0, 22.0 ],
									"style" : "",
									"text" : "Combining filters"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 660.5, 255.5, 72.0, 22.0 ],
									"style" : "",
									"text" : "loadmess 0"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-45",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patcher" : 									{
										"fileversion" : 1,
										"appversion" : 										{
											"major" : 7,
											"minor" : 2,
											"revision" : 4,
											"architecture" : "x64",
											"modernui" : 1
										}
,
										"rect" : [ 0.0, 0.0, 640.0, 480.0 ],
										"bgcolor" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
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
										"lefttoolbarpinned" : 1,
										"toptoolbarpinned" : 1,
										"righttoolbarpinned" : 1,
										"bottomtoolbarpinned" : 1,
										"toolbars_unpinned_last_save" : 0,
										"tallnewobj" : 0,
										"boxanimatetime" : 200,
										"enablehscroll" : 1,
										"enablevscroll" : 1,
										"devicewidth" : 0.0,
										"description" : "",
										"digest" : "",
										"tags" : "",
										"style" : "jpatcher001",
										"subpatcher_template" : "greyish",
										"boxes" : [ 											{
												"box" : 												{
													"id" : "obj-33",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 187.0, 396.0, 74.0, 22.0 ],
													"style" : "",
													"text" : "prepend set"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-32",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 195.0, 353.0, 59.0, 22.0 ],
													"style" : "",
													"text" : "tosymbol"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-31",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 252.0, 274.0, 103.0, 22.0 ],
													"style" : "",
													"text" : "(a typeless node)"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-29",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 212.0, 243.0, 85.0, 22.0 ],
													"style" : "",
													"text" : "(any j.remote)"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-26",
													"linecount" : 2,
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 180.0, 183.0, 167.0, 35.0 ],
													"style" : "",
													"text" : "\"(a j.parameter, j.message or j.return)\""
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-24",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 50.0, 189.5, 115.0, 22.0 ],
													"style" : "",
													"text" : "(a j.model or j.view)"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-18",
													"maxclass" : "newobj",
													"numinlets" : 5,
													"numoutlets" : 5,
													"outlettype" : [ "", "", "", "", "" ],
													"patching_rect" : [ 165.0, 100.0, 78.0, 22.0 ],
													"style" : "",
													"text" : "route 0 1 2 3"
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-37",
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "int" ],
													"patching_rect" : [ 165.0, 40.0, 30.0, 30.0 ],
													"style" : ""
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-42",
													"maxclass" : "outlet",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 187.0, 478.0, 30.0, 30.0 ],
													"style" : ""
												}

											}
 ],
										"lines" : [ 											{
												"patchline" : 												{
													"destination" : [ "obj-24", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-18", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-26", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-18", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-29", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-18", 2 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-31", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-18", 3 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-32", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-24", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-32", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-26", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-32", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-29", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-32", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-31", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-33", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-32", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-42", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-33", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-18", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-37", 0 ]
												}

											}
 ],
										"styles" : [ 											{
												"name" : "jpatcher001",
												"parentstyle" : "",
												"multi" : 0
											}
 ]
									}
,
									"patching_rect" : [ 764.5, 255.5, 40.0, 22.0 ],
									"saved_object_attributes" : 									{
										"description" : "",
										"digest" : "",
										"globalpatchername" : "",
										"style" : "jpatcher001",
										"tags" : ""
									}
,
									"style" : "",
									"text" : "p info"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-36",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 764.5, 294.5, 218.0, 20.0 ],
									"style" : "",
									"text" : "(a j.model or j.view)"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-11",
									"items" : [ "Container", ",", "Data", ",", "Viewer", ",", "none" ],
									"maxclass" : "umenu",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "int", "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 660.5, 285.0, 100.0, 22.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"border" : 0,
									"filename" : "helpdetails.js",
									"id" : "obj-2",
									"ignoreclick" : 1,
									"jsarguments" : [ "j.namespace" ],
									"maxclass" : "jsui",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 10.0, 10.0, 274.0, 58.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-11", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"midpoints" : [ 1215.5, 556.5, 287.5, 556.5 ],
									"source" : [ "obj-102", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-45", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-11", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-76", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 710.5, 320.0, 670.0, 320.0 ],
									"source" : [ "obj-11", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-13", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"midpoints" : [ 670.0, 545.5, 287.5, 545.5 ],
									"source" : [ "obj-14", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-49", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-21", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-27", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-22", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-23", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-24", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-26", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-24", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-27", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-30", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-17", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-33", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-36", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-45", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-12", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-5", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-20", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-5", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-21", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-5", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-5", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"midpoints" : [ 793.5, 731.0, 540.5, 731.0, 540.5, 599.0, 287.5, 599.0 ],
									"source" : [ "obj-56", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"midpoints" : [ 793.5, 755.05127, 540.5, 755.05127, 540.5, 599.0, 287.5, 599.0 ],
									"source" : [ "obj-57", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"midpoints" : [ 793.5, 779.102539, 540.5, 779.102539, 540.5, 599.0, 287.5, 599.0 ],
									"source" : [ "obj-58", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"midpoints" : [ 793.5, 803.15387, 540.5, 803.15387, 540.5, 599.0, 287.5, 599.0 ],
									"source" : [ "obj-59", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"midpoints" : [ 793.5, 827.205139, 540.5, 827.205139, 540.5, 599.0, 287.5, 599.0 ],
									"source" : [ "obj-60", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"midpoints" : [ 793.5, 874.256409, 540.5, 874.256409, 540.5, 599.0, 287.5, 599.0 ],
									"source" : [ "obj-61", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 793.5, 871.0, 766.5, 871.0, 766.5, 592.0, 287.5, 592.0 ],
									"source" : [ "obj-62", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-65", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 670.0, 573.0, 287.5, 573.0 ],
									"source" : [ "obj-76", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"midpoints" : [ 670.0, 500.5, 287.5, 500.5 ],
									"source" : [ "obj-80", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 1215.5, 573.5, 287.5, 573.5 ],
									"source" : [ "obj-96", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"midpoints" : [ 1215.5, 491.75, 287.5, 491.75 ],
									"source" : [ "obj-97", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"midpoints" : [ 1215.5, 517.75, 287.5, 517.75 ],
									"source" : [ "obj-98", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"midpoints" : [ 1215.5, 582.25, 287.5, 582.25 ],
									"source" : [ "obj-99", 0 ]
								}

							}
 ],
						"styles" : [ 							{
								"name" : "jpatcher001",
								"parentstyle" : "",
								"multi" : 0
							}
 ],
						"patchlinecolor" : [ 0.65098, 0.65098, 0.65098, 0.898039 ]
					}
,
					"patching_rect" : [ 377.0, 150.0, 102.0, 22.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"patchlinecolor" : [ 0.65098, 0.65098, 0.65098, 0.898039 ],
						"style" : "",
						"tags" : ""
					}
,
					"style" : "",
					"text" : "p \"Custom filters\""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-2",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 0,
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 7,
							"minor" : 2,
							"revision" : 4,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"rect" : [ 0.0, 26.0, 1680.0, 975.0 ],
						"bgcolor" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
						"editing_bgcolor" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
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
						"lefttoolbarpinned" : 1,
						"toptoolbarpinned" : 1,
						"righttoolbarpinned" : 1,
						"bottomtoolbarpinned" : 1,
						"toolbars_unpinned_last_save" : 0,
						"tallnewobj" : 0,
						"boxanimatetime" : 200,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"style" : "jpatcher001",
						"subpatcher_template" : "greyish",
						"showontab" : 1,
						"boxes" : [  ],
						"lines" : [  ],
						"styles" : [ 							{
								"name" : "jpatcher001",
								"parentstyle" : "",
								"multi" : 0
							}
 ]
					}
,
					"patching_rect" : [ 850.0, 150.0, 27.0, 22.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"style" : "jpatcher001",
						"tags" : ""
					}
,
					"style" : "",
					"text" : "p ?"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-1",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 0,
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 7,
							"minor" : 2,
							"revision" : 4,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"rect" : [ 3.0, 71.0, 1680.0, 975.0 ],
						"bgcolor" : [ 0.878431, 0.878431, 0.858824, 1.0 ],
						"editing_bgcolor" : [ 0.878431, 0.878431, 0.858824, 1.0 ],
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
						"lefttoolbarpinned" : 1,
						"toptoolbarpinned" : 1,
						"righttoolbarpinned" : 1,
						"bottomtoolbarpinned" : 1,
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
						"subpatcher_template" : "greyish",
						"showontab" : 1,
						"boxes" : [ 							{
								"box" : 								{
									"bubble" : 1,
									"bubbletextmargin" : 10,
									"id" : "obj-32",
									"linecount" : 4,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 811.0, 627.0, 135.0, 74.0 ],
									"presentation_rect" : [ 835.0, 651.5, 0.0, 0.0 ],
									"style" : "",
									"text" : "Turn off automatic update of namespace selection"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-31",
									"linecount" : 10,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 656.0, 713.0, 169.0, 141.0 ],
									"presentation_rect" : [ 655.0, 713.0, 0.0, 0.0 ],
									"style" : "",
									"text" : "By default, j.namespace will refresh and output its selection everytime a new model or parameter is instanciated in the patcher.\n\nThis can be turned off, especially to speed up things when using j.namespace in very large patcher."
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 14.0,
									"id" : "obj-10",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 656.0, 627.0, 120.0, 22.0 ],
									"presentation_rect" : [ 652.0, 628.5, 0.0, 0.0 ],
									"style" : "",
									"text" : "Live search"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-17",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 1343.0, 812.0, 127.0, 22.0 ],
									"style" : "",
									"text" : "s namespacemaxhelp"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-18",
									"maxclass" : "panel",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 1324.0, 866.0, 13.0, 13.0 ],
									"shape" : 3,
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-21",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 1343.0, 856.5, 176.0, 22.0 ],
									"style" : "",
									"text" : "Reveal demo models and view"
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"bubbleside" : 3,
									"bubbletextmargin" : 10,
									"id" : "obj-1",
									"linecount" : 4,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 1015.0, 398.0, 141.0, 74.0 ],
									"style" : "",
									"text" : "Choose items to filter based on their relationship to exploration root"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-26",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 1237.0, 564.5, 122.0, 33.0 ],
									"style" : "",
									"text" : "Instances of the exploration root"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-25",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 1233.0, 471.05957, 147.0, 20.0 ],
									"style" : "",
									"text" : "Exploration root attributes"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-24",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 1233.0, 416.039734, 213.0, 20.0 ],
									"style" : "",
									"text" : "All direct nodes under exploration root"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-23",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 1233.0, 360.55957, 180.0, 20.0 ],
									"style" : "",
									"text" : "All nodes under exlporation root"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-22",
									"maxclass" : "live.line",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 1195.0, 332.0, 5.0, 221.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-14",
									"ignoreclick" : 1,
									"legacytextcolor" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 1158.0, 425.0, 24.0, 24.0 ],
									"rounded" : 180.0,
									"style" : "",
									"text" : "2",
									"usebgoncolor" : 1,
									"usetextovercolor" : 1
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-15",
									"ignoreclick" : 1,
									"legacytextcolor" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 1176.0, 281.0, 24.0, 24.0 ],
									"rounded" : 180.0,
									"style" : "",
									"text" : "1",
									"usebgoncolor" : 1,
									"usetextovercolor" : 1
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-13",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 1210.0, 447.0, 143.0, 22.0 ],
									"style" : "",
									"text" : "output attributes, explore"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-12",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 1210.0, 332.0, 161.0, 22.0 ],
									"style" : "",
									"text" : "output descendants, explore"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-11",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 408.0, 627.0, 138.0, 33.0 ],
									"style" : "",
									"text" : "Number of matching addresses"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-8",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 1210.0, 281.0, 77.0, 22.0 ],
									"style" : "",
									"text" : "filter/remove"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-7",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 1210.0, 392.019867, 135.0, 22.0 ],
									"style" : "",
									"text" : "output children, explore"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-6",
									"linecount" : 3,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 1343.0, 495.05957, 155.0, 47.0 ],
									"style" : "",
									"text" : "Brother is not available if the root address is the root of the whole namespace"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-5",
									"linecount" : 4,
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 1210.0, 495.05957, 126.0, 62.0 ],
									"style" : "",
									"text" : "output brothers, filter/list model, address /degrade.1, explore"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 14.0,
									"id" : "obj-70",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 1210.0, 219.5, 89.0, 22.0 ],
									"style" : "",
									"text" : "Relationship"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-69",
									"linecount" : 5,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 104.0, 622.0, 143.0, 74.0 ],
									"style" : "",
									"text" : "NB: Sending a node address to j.namespace will set the address attribute and trigger exploration"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 14.0,
									"id" : "obj-66",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 910.0, 219.5, 101.0, 22.0 ],
									"style" : "",
									"text" : "Sorting results"
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"bubbleside" : 3,
									"bubbletextmargin" : 10,
									"id" : "obj-64",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 820.0, 318.5, 76.0, 47.0 ],
									"style" : "",
									"text" : "Sort results"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-62",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 910.0, 344.0, 115.0, 22.0 ],
									"style" : "",
									"text" : "sort priority, explore"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-61",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 910.0, 320.0, 135.0, 22.0 ],
									"style" : "",
									"text" : "sort alphabetic, explore"
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"bubbleside" : 3,
									"bubbletextmargin" : 10,
									"id" : "obj-59",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 556.0, 411.5, 95.0, 47.0 ],
									"style" : "",
									"text" : "Explore all sub-nodes"
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"bubbleside" : 3,
									"bubbletextmargin" : 10,
									"id" : "obj-57",
									"linecount" : 3,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 506.0, 311.0, 141.0, 61.0 ],
									"style" : "",
									"text" : "How deep in the namespace to explore"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-55",
									"ignoreclick" : 1,
									"legacytextcolor" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 241.0, 534.5, 24.0, 24.0 ],
									"rounded" : 180.0,
									"style" : "",
									"text" : "3",
									"usebgoncolor" : 1,
									"usetextovercolor" : 1
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"bubbleside" : 3,
									"bubbletextmargin" : 10,
									"id" : "obj-56",
									"linecount" : 4,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 104.0, 507.5, 135.0, 74.0 ],
									"style" : "",
									"text" : "Explore the namespace from the root using the above filter"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-53",
									"ignoreclick" : 1,
									"legacytextcolor" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 241.0, 367.0, 24.0, 24.0 ],
									"rounded" : 180.0,
									"style" : "",
									"text" : "2",
									"usebgoncolor" : 1,
									"usetextovercolor" : 1
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"bubbleside" : 3,
									"bubbletextmargin" : 10,
									"id" : "obj-54",
									"linecount" : 3,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 93.0, 347.0, 140.0, 61.0 ],
									"style" : "",
									"text" : "Using filters provided with j.namespace"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-52",
									"ignoreclick" : 1,
									"legacytextcolor" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 241.0, 281.0, 24.0, 24.0 ],
									"rounded" : 180.0,
									"style" : "",
									"text" : "1",
									"usebgoncolor" : 1,
									"usetextovercolor" : 1
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"bubbleside" : 3,
									"bubbletextmargin" : 10,
									"id" : "obj-49",
									"linecount" : 3,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 93.0, 261.0, 144.0, 61.0 ],
									"style" : "",
									"text" : "Set the root in the namespace to start exploration from"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 14.0,
									"id" : "obj-46",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 656.0, 219.5, 120.0, 22.0 ],
									"style" : "",
									"text" : "Exploration depth"
								}

							}
, 							{
								"box" : 								{
									"fontsize" : 14.0,
									"id" : "obj-78",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 271.0, 219.5, 124.0, 22.0 ],
									"style" : "",
									"text" : "Node type filtering"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-9",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 271.0, 281.0, 60.0, 22.0 ],
									"style" : "",
									"text" : "address /"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-58",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 271.0, 535.5, 50.0, 22.0 ],
									"style" : "",
									"text" : "explore"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-44",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 271.0, 495.05957, 92.0, 22.0 ],
									"style" : "",
									"text" : "filter/list remote"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-43",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 271.0, 471.05957, 79.0, 22.0 ],
									"style" : "",
									"text" : "filter/list view"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-41",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 271.0, 440.05957, 86.0, 22.0 ],
									"style" : "",
									"text" : "filter/list return"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-40",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 271.0, 416.039734, 109.0, 22.0 ],
									"style" : "",
									"text" : "filter/list parameter"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-39",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 271.0, 368.0, 86.0, 22.0 ],
									"style" : "",
									"text" : "filter/list model"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-38",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 271.0, 392.019867, 103.0, 22.0 ],
									"style" : "",
									"text" : "filter/list message"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-34",
									"maxclass" : "button",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 290.0, 627.0, 24.0, 24.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-30",
									"maxclass" : "number",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 356.0, 627.0, 50.0, 22.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-28",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 656.0, 344.0, 97.0, 22.0 ],
									"style" : "",
									"text" : "depth 2, explore"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-20",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 656.0, 425.0, 97.0, 22.0 ],
									"style" : "",
									"text" : "depth 0, explore"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-19",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 656.0, 320.0, 97.0, 22.0 ],
									"style" : "",
									"text" : "depth 1, explore"
								}

							}
, 							{
								"box" : 								{
									"bgcolor" : [ 0.311041, 0.314599, 0.318357, 1.0 ],
									"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"cellmap" : [ [ 0, 0, "samplerate_ratio" ], [ 0, 1, "bitdepth" ], [ 0, 2, "audio" ], [ 0, 3, "audio/bypass" ], [ 0, 4, "audio/gain" ], [ 0, 5, "audio/in.L" ], [ 0, 6, "audio/in.R" ], [ 0, 7, "audio/mix" ], [ 0, 8, "audio/mute" ], [ 0, 9, "audio/out.L" ], [ 0, 10, "audio/out.R" ], [ 0, 11, "model" ], [ 0, 12, "preset" ] ],
									"cols" : 1,
									"colwidth" : 200,
									"fgcolor" : [ 0.921569, 0.917647, 0.933333, 1.0 ],
									"fontface" : 0,
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"gridlinecolor" : [ 0.560317, 0.570942, 0.601066, 1.0 ],
									"hcellcolor" : [ 0.165741, 0.364658, 0.14032, 0.0 ],
									"hscroll" : 0,
									"id" : "obj-16",
									"maxclass" : "jit.cellblock",
									"numinlets" : 2,
									"numoutlets" : 4,
									"outlettype" : [ "list", "", "", "" ],
									"patching_rect" : [ 271.0, 664.0, 214.5, 252.75 ],
									"rows" : 13,
									"savemode" : 1,
									"sccolor" : [ 0.2495, 0.242348, 0.248704, 1.0 ],
									"sgcolor" : [ 0.560317, 0.570942, 0.601066, 1.0 ],
									"stcolor" : [ 0.8, 0.8, 0.8, 1.0 ],
									"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-3",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "" ],
									"patching_rect" : [ 271.0, 596.0, 189.0, 22.0 ],
									"style" : "",
									"text" : "j.namespace @format jit.cellblock"
								}

							}
, 							{
								"box" : 								{
									"border" : 0,
									"filename" : "helpdetails.js",
									"id" : "obj-2",
									"ignoreclick" : 1,
									"jsarguments" : [ "j.namespace" ],
									"maxclass" : "jsui",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 54.0, 48.0, 586.0, 129.0 ]
								}

							}
, 							{
								"box" : 								{
									"attr" : "update",
									"id" : "obj-4",
									"maxclass" : "attrui",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 656.0, 664.0, 150.0, 22.0 ],
									"style" : ""
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"midpoints" : [ 1219.5, 474.5, 280.5, 474.5 ],
									"source" : [ "obj-12", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"midpoints" : [ 1219.5, 521.0, 280.5, 521.0 ],
									"source" : [ "obj-13", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 665.5, 581.0, 280.5, 581.0 ],
									"source" : [ "obj-19", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"midpoints" : [ 665.5, 505.0, 280.5, 505.0 ],
									"source" : [ "obj-20", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-17", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-21", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"midpoints" : [ 665.5, 505.0, 280.5, 505.0 ],
									"source" : [ "obj-28", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-16", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-3", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-30", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-3", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-34", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-3", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-38", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-39", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 665.5, 696.0, 637.0, 696.0, 637.0, 581.0, 280.5, 581.0 ],
									"source" : [ "obj-4", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-40", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-41", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-43", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-44", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"midpoints" : [ 1219.5, 576.029785, 280.5, 576.029785 ],
									"source" : [ "obj-5", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-58", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 919.5, 581.5, 280.5, 581.5 ],
									"source" : [ "obj-61", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-62", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"midpoints" : [ 1219.5, 492.5, 280.5, 492.5 ],
									"source" : [ "obj-7", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 1219.5, 581.0, 280.5, 581.0 ],
									"source" : [ "obj-8", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-9", 0 ]
								}

							}
 ],
						"styles" : [ 							{
								"name" : "jpatcher001",
								"parentstyle" : "",
								"multi" : 0
							}
 ],
						"patchlinecolor" : [ 0.65098, 0.65098, 0.65098, 0.898039 ]
					}
,
					"patching_rect" : [ 176.0, 150.0, 50.0, 22.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"patchlinecolor" : [ 0.65098, 0.65098, 0.65098, 0.898039 ],
						"style" : "",
						"tags" : ""
					}
,
					"style" : "",
					"text" : "p Basic"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-12", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-76", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-5", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-7", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-9", 0 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-76::obj-8::obj-5::obj-7" : [ "live.numbox[2]", "live.numbox", 0 ],
			"obj-76::obj-8::obj-5::obj-6" : [ "live.numbox[4]", "live.numbox[4]", 0 ],
			"obj-76::obj-8::obj-5::obj-46" : [ "live.text[1]", "live.text", 0 ],
			"obj-76::obj-8::obj-5::obj-27" : [ "live.text[2]", "live.text[2]", 0 ],
			"obj-76::obj-8::obj-5::obj-19" : [ "live.numbox", "live.numbox", 0 ],
			"obj-76::obj-8::obj-5::obj-9" : [ "live.menu", "live.menu", 0 ],
			"obj-76::obj-8::obj-5::obj-17" : [ "live.numbox[5]", "live.numbox", 0 ],
			"obj-76::obj-8::obj-5::obj-45" : [ "live.text", "live.text", 0 ]
		}
,
		"dependency_cache" : [ 			{
				"name" : "helpdetails.js",
				"bootpath" : "C74:/help/resources",
				"type" : "TEXT",
				"implicit" : 1
			}
, 			{
				"name" : "degrade~.model.maxpat",
				"bootpath" : "~/Documents/Max 7/Packages/Jamoma/patchers/models/audio/stereo/distortion/degrade",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "equalizer~.model.maxpat",
				"bootpath" : "~/Documents/Max 7/Packages/Jamoma/patchers/models/audio/stereo/eq/equalizer",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.octavebandwidth2q.maxpat",
				"bootpath" : "~/Documents/Max 7/Packages/Jamoma/patchers/components/audio/octavebandwidth2q",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "input~.model.maxpat",
				"bootpath" : "~/Documents/Max 7/Packages/Jamoma/patchers/models/audio/stereo/sources/input",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "limiter~.model.maxpat",
				"bootpath" : "~/Documents/Max 7/Packages/Jamoma/patchers/models/audio/stereo/dynamics/limiter",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "limiter.parametersAndMessages.maxpat",
				"bootpath" : "~/Documents/Max 7/Packages/Jamoma/patchers/models/audio/stereo/dynamics/limiter",
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
				"bootpath" : "~/Documents/Max 7/Packages/Jamoma/patchers/models/audio/stereo/imaging/balance",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "output~.model.maxpat",
				"bootpath" : "~/Documents/Max 7/Packages/Jamoma/patchers/models/audio/stereo/output/output",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "saturation~.model.maxpat",
				"bootpath" : "~/Documents/Max 7/Packages/Jamoma/patchers/models/audio/stereo/distortion/saturation",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "record~.model.maxpat",
				"bootpath" : "~/Documents/Max 7/Packages/Jamoma/patchers/models/audio/stereo/output/record",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "record.parametersAndMessages.maxpat",
				"bootpath" : "~/Documents/Max 7/Packages/Jamoma/patchers/models/audio/stereo/output/record",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "equalizer~.view.small.maxpat",
				"bootpath" : "~/Documents/Max 7/Packages/Jamoma/patchers/models/audio/stereo/eq/equalizer",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "equalizer~.view.large.maxpat",
				"bootpath" : "~/Documents/Max 7/Packages/Jamoma/patchers/models/audio/stereo/eq/equalizer",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.q2octavebandwidth.maxpat",
				"bootpath" : "~/Documents/Max 7/Packages/Jamoma/patchers/components/audio/q2octavebandwith",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.namespace.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.model.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.parameter.mxo",
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
				"name" : "j.parameter_array.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.map.mxo",
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
				"name" : "j.cue.mxo",
				"type" : "iLaX"
			}
 ],
		"autosave" : 0,
		"styles" : [ 			{
				"name" : "jpatcher001",
				"parentstyle" : "",
				"multi" : 0
			}
 ],
		"patchlinecolor" : [ 0.65098, 0.65098, 0.65098, 0.898039 ],
		"bgfillcolor_type" : "color",
		"bgfillcolor_color1" : [ 0.376471, 0.384314, 0.4, 1.0 ],
		"bgfillcolor_color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
		"bgfillcolor_color" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
		"bgfillcolor_angle" : 270.0,
		"bgfillcolor_proportion" : 0.39
	}

}
