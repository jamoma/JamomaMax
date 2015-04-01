{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 7,
			"minor" : 0,
			"revision" : 3,
			"architecture" : "x64",
			"modernui" : 1
		}
,
		"rect" : [ 79.0, 92.0, 1204.0, 883.0 ],
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
		"showrootpatcherontab" : 0,
		"showontab" : 0,
		"boxes" : [ 			{
				"box" : 				{
					"id" : "obj-3",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 0,
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 7,
							"minor" : 0,
							"revision" : 3,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"rect" : [ 0.0, 26.0, 1204.0, 857.0 ],
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
									"bubble" : 1,
									"bubbleside" : 2,
									"id" : "obj-70",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 916.0, 552.0, 146.0, 39.0 ],
									"style" : "",
									"text" : "..results in a mapping..."
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"id" : "obj-69",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 846.0, 715.0, 224.0, 24.0 ],
									"style" : "",
									"text" : "...that updates this between 0. and 1."
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"id" : "obj-68",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 846.0, 505.5, 220.0, 24.0 ],
									"style" : "",
									"text" : "Changing this between -50 and 50..."
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-67",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 728.5, 428.5, 366.0, 20.0 ],
									"style" : "",
									"text" : "The range of the parameters are used for auto-scaling in mappings",
									"textcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-66",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 728.5, 403.0, 199.0, 20.0 ],
									"style" : "",
									"text" : "Range and mapping"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-65",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 728.5, 81.0, 199.0, 20.0 ],
									"style" : "",
									"text" : "Clipping and type"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-64",
									"maxclass" : "live.dial",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "float" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 776.0, 703.5, 44.0, 47.0 ],
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_longname" : "live.dial[1]",
											"parameter_shortname" : "To",
											"parameter_type" : 0,
											"parameter_mmax" : 1.0,
											"parameter_unitstyle" : 1
										}

									}
,
									"varname" : "live.dial[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-63",
									"maxclass" : "live.dial",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "float" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 776.0, 494.0, 44.0, 47.0 ],
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_longname" : "live.dial",
											"parameter_shortname" : "From",
											"parameter_type" : 0,
											"parameter_mmin" : -50.0,
											"parameter_mmax" : 50.0,
											"parameter_unitstyle" : 1
										}

									}
,
									"varname" : "live.dial"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-58",
									"linecount" : 4,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 776.0, 631.0, 98.0, 62.0 ],
									"style" : "",
									"text" : "j.parameter to @type decimal @range 0. 1. @clipmode both"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-57",
									"linecount" : 4,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 776.0, 552.0, 120.0, 62.0 ],
									"style" : "",
									"text" : "j.parameter from @type decimal @range -50. 50. @clipmode both"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-56",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 39.0, 229.5, 199.0, 20.0 ],
									"style" : "",
									"text" : "Available clip modes"
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"id" : "obj-55",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 959.0, 240.0, 138.0, 37.0 ],
									"style" : "",
									"text" : "The type of each list member is observed"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-53",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 728.5, 107.5, 350.0, 20.0 ],
									"style" : "",
									"text" : "Clipping works with @type integer, decimal, array and generic.",
									"textcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-50",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 697.0, 210.0, 29.5, 22.0 ],
									"style" : "",
									"text" : "set"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-48",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 697.0, 182.0, 69.0, 22.0 ],
									"style" : "",
									"text" : "j.savebang"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-47",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 776.0, 247.5, 171.0, 22.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-45",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 776.0, 158.5, 149.0, 22.0 ],
									"style" : "",
									"text" : "0. 1. 2. 3. 4. 5. 6. 7 testing"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-43",
									"linecount" : 4,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 776.0, 183.0, 125.0, 62.0 ],
									"style" : "",
									"text" : "j.parameter adf @type generic @range 2. 4. @clipmode both"
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"id" : "obj-31",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 467.0, 649.0, 55.0, 24.0 ],
									"style" : "",
									"text" : "fold"
								}

							}
, 							{
								"box" : 								{
									"activeslidercolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ],
									"activetricolor2" : [ 0.960784, 0.827451, 0.156863, 1.0 ],
									"appearance" : 2,
									"id" : "obj-32",
									"maxclass" : "live.numbox",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "float" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 324.0, 701.5, 155.0, 15.0 ],
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_longname" : "live.numbox[7]",
											"parameter_shortname" : "live.numbox[1]",
											"parameter_type" : 0,
											"parameter_mmax" : 100.0,
											"parameter_unitstyle" : 0
										}

									}
,
									"varname" : "live.numbox[6]"
								}

							}
, 							{
								"box" : 								{
									"activeslidercolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ],
									"activetricolor2" : [ 0.960784, 0.827451, 0.156863, 1.0 ],
									"appearance" : 2,
									"id" : "obj-33",
									"maxclass" : "live.numbox",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "float" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 324.0, 605.5, 155.0, 15.0 ],
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_longname" : "live.numbox[8]",
											"parameter_shortname" : "live.numbox[1]",
											"parameter_type" : 0,
											"parameter_mmax" : 100.0,
											"parameter_unitstyle" : 0
										}

									}
,
									"varname" : "live.numbox[7]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-34",
									"linecount" : 4,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 324.0, 630.0, 122.0, 62.0 ],
									"style" : "",
									"text" : "j.parameter clip_fold @type integer @range 25 75 @clipmode fold"
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"id" : "obj-35",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 467.0, 487.0, 55.0, 24.0 ],
									"style" : "",
									"text" : "wrap"
								}

							}
, 							{
								"box" : 								{
									"activeslidercolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ],
									"activetricolor2" : [ 0.960784, 0.827451, 0.156863, 1.0 ],
									"appearance" : 2,
									"id" : "obj-36",
									"maxclass" : "live.numbox",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "float" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 324.0, 539.5, 155.0, 15.0 ],
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_longname" : "live.numbox[9]",
											"parameter_shortname" : "live.numbox[1]",
											"parameter_type" : 0,
											"parameter_mmax" : 100.0,
											"parameter_unitstyle" : 0
										}

									}
,
									"varname" : "live.numbox[8]"
								}

							}
, 							{
								"box" : 								{
									"activeslidercolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ],
									"activetricolor2" : [ 0.960784, 0.827451, 0.156863, 1.0 ],
									"appearance" : 2,
									"id" : "obj-37",
									"maxclass" : "live.numbox",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "float" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 324.0, 443.5, 155.0, 15.0 ],
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_longname" : "live.numbox[10]",
											"parameter_shortname" : "live.numbox[1]",
											"parameter_type" : 0,
											"parameter_mmax" : 100.0,
											"parameter_unitstyle" : 0
										}

									}
,
									"varname" : "live.numbox[9]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-38",
									"linecount" : 4,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 324.0, 468.0, 127.0, 62.0 ],
									"style" : "",
									"text" : "j.parameter clip_wrap @type integer @range 25 75 @clipmode wrap"
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"id" : "obj-39",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 467.0, 326.0, 55.0, 24.0 ],
									"style" : "",
									"text" : "both"
								}

							}
, 							{
								"box" : 								{
									"activeslidercolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ],
									"activetricolor2" : [ 0.960784, 0.827451, 0.156863, 1.0 ],
									"appearance" : 2,
									"id" : "obj-40",
									"maxclass" : "live.numbox",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "float" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 324.0, 378.5, 155.0, 15.0 ],
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_longname" : "live.numbox[11]",
											"parameter_shortname" : "live.numbox[1]",
											"parameter_type" : 0,
											"parameter_mmax" : 100.0,
											"parameter_unitstyle" : 0
										}

									}
,
									"varname" : "live.numbox[10]"
								}

							}
, 							{
								"box" : 								{
									"activeslidercolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ],
									"activetricolor2" : [ 0.960784, 0.827451, 0.156863, 1.0 ],
									"appearance" : 2,
									"id" : "obj-41",
									"maxclass" : "live.numbox",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "float" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 324.0, 282.5, 155.0, 15.0 ],
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_longname" : "live.numbox[12]",
											"parameter_shortname" : "live.numbox[1]",
											"parameter_type" : 0,
											"parameter_mmax" : 100.0,
											"parameter_unitstyle" : 0
										}

									}
,
									"varname" : "live.numbox[11]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-42",
									"linecount" : 4,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 324.0, 307.0, 127.0, 62.0 ],
									"style" : "",
									"text" : "j.parameter clip_both @type integer @range 25 75 @clipmode both"
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"id" : "obj-27",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 198.0, 649.0, 55.0, 24.0 ],
									"style" : "",
									"text" : "high"
								}

							}
, 							{
								"box" : 								{
									"activeslidercolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ],
									"activetricolor2" : [ 0.960784, 0.827451, 0.156863, 1.0 ],
									"appearance" : 2,
									"id" : "obj-28",
									"maxclass" : "live.numbox",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "float" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 55.0, 701.5, 155.0, 15.0 ],
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_longname" : "live.numbox[5]",
											"parameter_shortname" : "live.numbox[1]",
											"parameter_type" : 0,
											"parameter_mmax" : 100.0,
											"parameter_unitstyle" : 0
										}

									}
,
									"varname" : "live.numbox[4]"
								}

							}
, 							{
								"box" : 								{
									"activeslidercolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ],
									"activetricolor2" : [ 0.960784, 0.827451, 0.156863, 1.0 ],
									"appearance" : 2,
									"id" : "obj-29",
									"maxclass" : "live.numbox",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "float" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 55.0, 605.5, 155.0, 15.0 ],
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_longname" : "live.numbox[6]",
											"parameter_shortname" : "live.numbox[1]",
											"parameter_type" : 0,
											"parameter_mmax" : 100.0,
											"parameter_unitstyle" : 0
										}

									}
,
									"varname" : "live.numbox[5]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-30",
									"linecount" : 4,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 55.0, 630.0, 123.0, 62.0 ],
									"style" : "",
									"text" : "j.parameter clip_high @type integer @range 25 75 @clipmode high"
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"id" : "obj-23",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 198.0, 487.0, 55.0, 24.0 ],
									"style" : "",
									"text" : "low"
								}

							}
, 							{
								"box" : 								{
									"activeslidercolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ],
									"activetricolor2" : [ 0.960784, 0.827451, 0.156863, 1.0 ],
									"appearance" : 2,
									"id" : "obj-24",
									"maxclass" : "live.numbox",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "float" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 55.0, 539.5, 155.0, 15.0 ],
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_longname" : "live.numbox[3]",
											"parameter_shortname" : "live.numbox[1]",
											"parameter_type" : 0,
											"parameter_mmax" : 100.0,
											"parameter_unitstyle" : 0
										}

									}
,
									"varname" : "live.numbox[2]"
								}

							}
, 							{
								"box" : 								{
									"activeslidercolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ],
									"activetricolor2" : [ 0.960784, 0.827451, 0.156863, 1.0 ],
									"appearance" : 2,
									"id" : "obj-25",
									"maxclass" : "live.numbox",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "float" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 55.0, 443.5, 155.0, 15.0 ],
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_longname" : "live.numbox[4]",
											"parameter_shortname" : "live.numbox[1]",
											"parameter_type" : 0,
											"parameter_mmax" : 100.0,
											"parameter_unitstyle" : 0
										}

									}
,
									"varname" : "live.numbox[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-26",
									"linecount" : 4,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 55.0, 468.0, 119.0, 62.0 ],
									"style" : "",
									"text" : "j.parameter clip_low @type integer @range 25 75 @clipmode low"
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"id" : "obj-22",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 198.0, 326.0, 55.0, 24.0 ],
									"style" : "",
									"text" : "none"
								}

							}
, 							{
								"box" : 								{
									"activeslidercolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ],
									"activetricolor2" : [ 0.960784, 0.827451, 0.156863, 1.0 ],
									"appearance" : 2,
									"id" : "obj-16",
									"maxclass" : "live.numbox",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "float" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 55.0, 378.5, 155.0, 15.0 ],
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_longname" : "live.numbox[2]",
											"parameter_shortname" : "live.numbox[1]",
											"parameter_type" : 0,
											"parameter_mmax" : 100.0,
											"parameter_unitstyle" : 0
										}

									}
,
									"varname" : "live.numbox[1]"
								}

							}
, 							{
								"box" : 								{
									"activeslidercolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ],
									"activetricolor2" : [ 0.960784, 0.827451, 0.156863, 1.0 ],
									"appearance" : 2,
									"id" : "obj-15",
									"maxclass" : "live.numbox",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "float" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 55.0, 282.5, 155.0, 15.0 ],
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_longname" : "live.numbox[1]",
											"parameter_shortname" : "live.numbox[1]",
											"parameter_type" : 0,
											"parameter_mmax" : 100.0,
											"parameter_unitstyle" : 0
										}

									}
,
									"varname" : "live.numbox"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-7",
									"linecount" : 4,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 55.0, 307.0, 127.0, 62.0 ],
									"style" : "",
									"text" : "j.parameter clip_none @type integer @range 25 75 @clipmode none"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-4",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 55.0, 125.5, 406.0, 20.0 ],
									"style" : "",
									"text" : "@clipmode aspecifies what to do when values exceed the specified range.",
									"textcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-3",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 931.5, 600.0, 115.0, 35.0 ],
									"style" : "",
									"text" : "j.map @input /from @output /to"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-2",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 55.0, 98.5, 265.0, 20.0 ],
									"style" : "",
									"text" : "@range specified the expected range of values.",
									"textcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"border" : 0,
									"filename" : "helpname.js",
									"id" : "obj-5",
									"ignoreclick" : 1,
									"jsarguments" : [ "j.parameter" ],
									"maxclass" : "jsui",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 10.0, 10.0, 244.18129, 57.567627 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-15", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-26", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-25", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-24", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-26", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-30", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-29", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-28", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-30", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-34", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-33", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-32", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-34", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-38", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-37", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-36", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-38", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-42", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-41", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-40", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-42", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 1 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-43", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-43", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-45", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-50", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-48", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-50", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-64", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-58", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-57", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-63", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-16", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 269.0, 380.0, 52.0, 21.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"style" : "",
						"tags" : ""
					}
,
					"style" : "",
					"text" : "p Range"
				}

			}
, 			{
				"box" : 				{
					"annotation" : "none",
					"id" : "obj-2",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 0,
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 7,
							"minor" : 0,
							"revision" : 3,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"rect" : [ 0.0, 26.0, 1204.0, 857.0 ],
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
									"border" : 0,
									"filename" : "helpname.js",
									"id" : "obj-41",
									"ignoreclick" : 1,
									"jsarguments" : [ "j.parameter" ],
									"maxclass" : "jsui",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 10.0, 10.0, 244.18129, 57.567627 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-48",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 810.0, 833.0, 69.0, 22.0 ],
									"style" : "default",
									"text" : "help j.node"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-46",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 889.5, 833.0, 53.0, 22.0 ],
									"style" : "default",
									"text" : "pcontrol"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-43",
									"linecolor" : [ 0.619608, 0.0, 0.360784, 1.0 ],
									"maxclass" : "live.line",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 795.0, 518.0, 56.5, 18.0 ]
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-44",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patcher" : 									{
										"fileversion" : 1,
										"appversion" : 										{
											"major" : 7,
											"minor" : 0,
											"revision" : 3,
											"architecture" : "x64",
											"modernui" : 1
										}
,
										"rect" : [ 25.0, 69.0, 422.0, 194.0 ],
										"bglocked" : 0,
										"openinpresentation" : 0,
										"default_fontsize" : 11.0,
										"default_fontface" : 0,
										"default_fontname" : "Helvetica Neue",
										"gridonopen" : 1,
										"gridsize" : [ 10.0, 10.0 ],
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
										"boxes" : [ 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-19",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "bang" ],
													"patching_rect" : [ 50.0, 100.0, 24.0, 20.0 ],
													"style" : "",
													"text" : "t b"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-16",
													"linecount" : 3,
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 50.0, 126.0, 310.0, 45.0 ],
													"style" : "",
													"text" : ";\rmax launchbrowser https://github.com/jamoma/JamomaMax/issues/534"
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-22",
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 50.0, 40.0, 25.0, 25.0 ],
													"style" : ""
												}

											}
 ],
										"lines" : [ 											{
												"patchline" : 												{
													"destination" : [ "obj-16", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-19", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-19", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-22", 0 ]
												}

											}
 ]
									}
,
									"patching_rect" : [ 791.0, 529.0, 19.0, 22.0 ],
									"saved_object_attributes" : 									{
										"description" : "",
										"digest" : "",
										"fontname" : "Helvetica Neue",
										"fontsize" : 11.0,
										"globalpatchername" : "",
										"style" : "",
										"tags" : ""
									}
,
									"style" : "default",
									"text" : "p"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-45",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 791.0, 505.0, 70.0, 22.0 ],
									"style" : "default",
									"text" : "issue #534"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-40",
									"linecount" : 3,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 755.5, 477.0, 263.0, 47.0 ],
									"style" : "default",
									"text" : "NB: j.namespace doesn't work as it should (recursively) to handle priority sorting... \nsee : "
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-39",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 249.0, 824.5, 351.0, 20.0 ],
									"style" : "default",
									"text" : "this way, we can define the priority at the “something\" node level"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-38",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 602.5, 824.5, 163.0, 22.0 ],
									"style" : "default",
									"text" : "j.node something @priority 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-37",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 130.0, 783.5, 346.0, 22.0 ],
									"style" : "default",
									"text" : "j.parameter something/completely/different/param @priority 2"
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"bubbleside" : 2,
									"id" : "obj-36",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 487.0, 767.5, 413.0, 52.0 ],
									"style" : "default",
									"text" : "the solution to handle this kind of case is to use the j.node object, which allow to explicitly declare properties of implicitly-created nodes"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-35",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 408.0, 742.5, 552.0, 20.0 ],
									"style" : "default",
									"text" : "they won't even work between them, because priorities work recursively, each node level after another"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-33",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 130.0, 762.5, 263.0, 22.0 ],
									"style" : "default",
									"text" : "j.parameter yet/another/node/param @priority 3"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-31",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 130.0, 742.5, 263.0, 22.0 ],
									"style" : "default",
									"text" : "j.parameter some/other/node/param @priority 4"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-20",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 130.0, 716.0, 701.0, 20.0 ],
									"style" : "default",
									"text" : "i.e.: these two parameters' priorities below won't be working within the same \"scope\" than the \"simple\" parameters' priorities above"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-18",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 130.0, 689.0, 409.0, 20.0 ],
									"style" : "default",
									"text" : "priorities are handled only at the parameter level, not for higher-level nodes"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-16",
									"linecount" : 3,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 382.5, 629.0, 507.0, 47.0 ],
									"style" : "default",
									"text" : "here, for example, a sub-node of this patcher's model is created, called \"some\"\nthen a sub-node to this node, called \"sub\", is also created, and then a third one called \"node\"\nfinally, the parameter \"param\" exists at the end of this sub-tree"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-14",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 130.0, 606.0, 458.0, 20.0 ],
									"style" : "default",
									"text" : "It is possible to implicitly declare nodes in a j.parameter's address (by using slashes)"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-12",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 130.0, 635.5, 194.0, 22.0 ],
									"style" : "default",
									"text" : "j.parameter some/sub/node/param"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-11",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 96.5, 570.0, 789.0, 20.0 ],
									"style" : "default",
									"text" : "Working with subnodes is possible within parameters, but requires some knowledge about the way nodes work (in particular in relation to priorities)"
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"bubbleside" : 3,
									"id" : "obj-10",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 646.0, 269.0, 272.0, 37.0 ],
									"style" : "default",
									"text" : "create a cue and look at the order in which \nthe parameters are stored (and recalled)"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-34",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 919.0, 278.0, 86.0, 22.0 ],
									"style" : "default",
									"text" : "store cue, edit"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-32",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 0,
									"patcher" : 									{
										"fileversion" : 1,
										"appversion" : 										{
											"major" : 7,
											"minor" : 0,
											"revision" : 3,
											"architecture" : "x64",
											"modernui" : 1
										}
,
										"rect" : [ 25.0, 69.0, 387.0, 155.0 ],
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
										"boxes" : [ 											{
												"box" : 												{
													"id" : "obj-6",
													"maxclass" : "button",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "bang" ],
													"patching_rect" : [ 63.0, 54.0, 20.0, 20.0 ],
													"style" : ""
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-4",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 87.0, 104.0, 75.0, 20.0 ],
													"style" : "",
													"text" : "j.send */*/*/*"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-3",
													"linecount" : 2,
													"maxclass" : "comment",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 98.0, 54.0, 171.0, 33.0 ],
													"style" : "",
													"text" : "this sets all parameters of this model to 0. once it is ready"
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
													"outlettype" : [ "int" ],
													"patching_rect" : [ 27.0, 78.0, 24.0, 20.0 ],
													"style" : "",
													"text" : "t 0"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-1",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 2,
													"outlettype" : [ "bang", "" ],
													"patching_rect" : [ 27.0, 54.0, 36.0, 20.0 ],
													"style" : "",
													"text" : "sel 1"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-14",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 3,
													"outlettype" : [ "", "", "" ],
													"patching_rect" : [ 27.0, 27.0, 111.0, 20.0 ],
													"style" : "",
													"text" : "j.receive :initialized"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-10",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 27.0, 104.0, 51.0, 20.0 ],
													"style" : "",
													"text" : "j.send *"
												}

											}
 ],
										"lines" : [ 											{
												"patchline" : 												{
													"destination" : [ "obj-18", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-1", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-1", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-14", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-10", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-18", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-4", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-18", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-18", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-6", 0 ]
												}

											}
 ]
									}
,
									"patching_rect" : [ 646.0, 144.0, 61.0, 22.0 ],
									"saved_object_attributes" : 									{
										"description" : "",
										"digest" : "",
										"globalpatchername" : "",
										"style" : "",
										"tags" : ""
									}
,
									"style" : "default",
									"text" : "p initStuff"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-30",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 919.0, 307.0, 100.0, 22.0 ],
									"style" : "default",
									"text" : "j.cue @relative 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-28",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 130.0, 509.0, 261.0, 20.0 ],
									"style" : "default",
									"text" : "Smaller still come first with negative values"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-29",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 130.0, 529.0, 283.0, 22.0 ],
									"style" : "default",
									"text" : "j.parameter EvenMoreThanFirstPriority @priority -2"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-27",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 346.0, 364.0, 157.0, 20.0 ],
									"style" : "default",
									"text" : "other prioritized parameters"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-26",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 130.0, 454.0, 261.0, 20.0 ],
									"style" : "default",
									"text" : "Negative values are recalled before @priority 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-25",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 346.0, 400.0, 165.0, 33.0 ],
									"style" : "default",
									"text" : "Here too further ordering is based on aphabetical order"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-24",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 130.0, 351.0, 370.0, 20.0 ],
									"style" : "default",
									"text" : "No priority is equivalent to @priority 0 -> these are recalled after all "
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-23",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 130.0, 269.0, 364.0, 20.0 ],
									"style" : "default",
									"text" : "For equal priorities, further ordering is based on aphabetical order"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-22",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 130.0, 164.0, 364.0, 20.0 ],
									"style" : "default",
									"text" : "Priorities work by ascending order (smaller values are recalled first"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-21",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 695.0, 123.0, 393.0, 33.0 ],
									"style" : "default",
									"text" : "NB: a j.model is used here to gather all parameters of the patcher under a certain node (here the name of this patcher: Priorities & subnodes)"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-19",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 96.5, 123.0, 359.0, 33.0 ],
									"style" : "default",
									"text" : "It is possible to sort parameters by priority: this is particularly useful when recalling values with j.cue or with presets (in j.model)"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-17",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patcher" : 									{
										"fileversion" : 1,
										"appversion" : 										{
											"major" : 7,
											"minor" : 0,
											"revision" : 3,
											"architecture" : "x64",
											"modernui" : 1
										}
,
										"rect" : [ 25.0, 69.0, 468.0, 189.0 ],
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
										"boxes" : [ 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-1",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "clear" ],
													"patching_rect" : [ 95.0, 52.0, 43.0, 20.0 ],
													"style" : "",
													"text" : "t clear"
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
													"patching_rect" : [ 26.0, 50.0, 56.0, 20.0 ],
													"style" : "",
													"text" : "deferlow"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-11",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 26.0, 24.0, 115.0, 20.0 ],
													"style" : "",
													"text" : "loadmess /Priorities"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-10",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 3,
													"outlettype" : [ "", "", "" ],
													"patching_rect" : [ 26.0, 77.0, 408.0, 20.0 ],
													"style" : "",
													"text" : "j.namespace @format umenu_prefix @filter/list parameter @sort priority"
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-16",
													"maxclass" : "outlet",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 26.0, 112.0, 25.0, 25.0 ],
													"style" : ""
												}

											}
 ],
										"lines" : [ 											{
												"patchline" : 												{
													"destination" : [ "obj-16", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-1", 0 ]
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
													"destination" : [ "obj-1", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-11", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-12", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-11", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-10", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-12", 0 ]
												}

											}
 ]
									}
,
									"patching_rect" : [ 971.5, 420.0, 20.0, 22.0 ],
									"saved_object_attributes" : 									{
										"description" : "",
										"digest" : "",
										"globalpatchername" : "",
										"style" : "",
										"tags" : ""
									}
,
									"style" : "default",
									"text" : "p"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-15",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 756.0, 420.0, 263.0, 33.0 ],
									"style" : "default",
									"text" : "Using j.namespace (see in subpatcher) \nalso allows to see how parameters are ordered:"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-8",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 130.0, 420.0, 152.0, 22.0 ],
									"style" : "default",
									"text" : "j.parameter NoPriorityB"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-7",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 130.0, 400.0, 152.0, 22.0 ],
									"style" : "default",
									"text" : "j.parameter NoPriorityA"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-6",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 130.0, 233.0, 214.0, 22.0 ],
									"style" : "default",
									"text" : "j.parameter SecondPriority @priority 2"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-5",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 130.0, 477.0, 255.0, 22.0 ],
									"style" : "default",
									"text" : "j.parameter MoreThanFirstPriority @priority -1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 130.0, 322.0, 205.0, 22.0 ],
									"style" : "default",
									"text" : "j.parameter SamePriority @priority 3"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-3",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 130.0, 376.0, 127.0, 22.0 ],
									"style" : "default",
									"text" : "j.parameter NoPriority"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-2",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 130.0, 295.0, 199.0, 22.0 ],
									"style" : "default",
									"text" : "j.parameter LessPriority @priority 3"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 130.0, 198.0, 197.0, 22.0 ],
									"style" : "default",
									"text" : "j.parameter FirstPriority @priority 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-13",
									"items" : "<empty>",
									"maxclass" : "umenu",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "int", "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 755.5, 457.5, 260.0, 22.0 ],
									"prefix" : "/Priorities/",
									"style" : "default"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-9",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 646.0, 123.0, 49.0, 22.0 ],
									"style" : "default",
									"text" : "j.model"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-13", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"midpoints" : [ 981.0, 453.5, 765.0, 453.5 ],
									"source" : [ "obj-17", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-30", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-34", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-44", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-45", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 496.0, 551.5, 56.0, 21.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"style" : "",
						"tags" : ""
					}
,
					"style" : "default",
					"text" : "p Priority"
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
							"minor" : 0,
							"revision" : 3,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"rect" : [ 0.0, 26.0, 1204.0, 857.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 10.0, 10.0 ],
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
									"filename" : "helpname.js",
									"id" : "obj-5",
									"ignoreclick" : 1,
									"jsarguments" : [ "j.parameter" ],
									"maxclass" : "jsui",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 10.0, 10.0, 244.18129, 57.567627 ]
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"id" : "obj-25",
									"linecount" : 5,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 439.0, 410.0, 171.0, 78.0 ],
									"style" : "default",
									"text" : "Setting a dataspace and unit for your parameter makes it possible to listen to this value using different unit."
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"id" : "obj-24",
									"linecount" : 5,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 521.0, 287.0, 171.0, 78.0 ],
									"style" : "default",
									"text" : "With a dataspace specified, one can set value using a different unit from the dataspace, such as midi or db in that case."
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-23",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 439.0, 317.0, 73.0, 22.0 ],
									"style" : "default",
									"text" : "50 midigain"
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"id" : "obj-21",
									"linecount" : 7,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 379.0, 135.0, 175.0, 104.0 ],
									"style" : "default",
									"text" : "j.parameter can be defined a dataspace and a unit using the @dataspace and @unit attributes. See help patch for j.unit to explore the list of available dataspaces"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-19",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 379.0, 317.0, 45.0, 22.0 ],
									"style" : "default",
									"text" : "-70 db"
								}

							}
, 							{
								"box" : 								{
									"format" : 6,
									"id" : "obj-17",
									"maxclass" : "flonum",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 213.0, 468.0, 93.0, 22.0 ],
									"style" : "default"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-16",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 4,
									"outlettype" : [ "", "", "", "" ],
									"patching_rect" : [ 213.0, 439.0, 217.0, 22.0 ],
									"style" : "default",
									"text" : "j.remote /gain @unit db"
								}

							}
, 							{
								"box" : 								{
									"format" : 6,
									"id" : "obj-15",
									"maxclass" : "flonum",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 208.0, 317.0, 111.0, 22.0 ],
									"style" : "default"
								}

							}
, 							{
								"box" : 								{
									"format" : 6,
									"id" : "obj-14",
									"maxclass" : "flonum",
									"maximum" : 1.0,
									"minimum" : 0.0,
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 208.0, 126.0, 50.0, 22.0 ],
									"style" : "default"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-1",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 208.0, 164.0, 145.0, 49.0 ],
									"style" : "default",
									"text" : "j.parameter gain @type decimal @dataspace gain @unit linear"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-15", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-14", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-17", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-16", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 388.5, 344.0, 360.0, 344.0, 360.0, 154.0, 217.5, 154.0 ],
									"source" : [ "obj-19", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 448.5, 344.0, 360.5, 344.0, 360.5, 154.0, 217.5, 154.0 ],
									"source" : [ "obj-23", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 402.0, 508.5, 73.0, 21.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"style" : "",
						"tags" : ""
					}
,
					"style" : "default",
					"text" : "p Dataspace"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-35",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 0,
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 7,
							"minor" : 0,
							"revision" : 3,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"rect" : [ 0.0, 26.0, 1204.0, 857.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 10.0, 10.0 ],
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
					"patching_rect" : [ 634.0, 656.0, 26.0, 21.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"style" : "",
						"tags" : ""
					}
,
					"style" : "default",
					"text" : "p ?"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-34",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 0,
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 7,
							"minor" : 0,
							"revision" : 3,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"rect" : [ 79.0, 118.0, 1204.0, 857.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 10.0, 10.0 ],
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
									"id" : "obj-47",
									"maxclass" : "button",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 68.0, 237.0, 24.0, 24.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"id" : "obj-45",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 856.0, 621.0, 264.0, 37.0 ],
									"presentation_rect" : [ 860.0, 602.0, 0.0, 0.0 ],
									"style" : "default",
									"text" : "Some ramping functions, such as tanh, have additional parameters that can be controlled"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-44",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 684.0, 682.5, 147.0, 22.0 ],
									"presentation_rect" : [ 709.0, 704.0, 0.0, 0.0 ],
									"style" : "",
									"text" : "ramp/function/parameters"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-43",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 248.0, 371.0, 175.0, 35.0 ],
									"style" : "",
									"text" : "print ramp/function/parameters @popup 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-42",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 301.0, 329.0, 89.0, 22.0 ],
									"style" : "",
									"text" : "r to_paramater"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-41",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 659.0, 628.5, 110.0, 22.0 ],
									"style" : "",
									"text" : "ramp/function tanh"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-39",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 659.5, 806.0, 91.0, 22.0 ],
									"style" : "",
									"text" : "s to_paramater"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-18",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 602.0, 592.0, 177.0, 20.0 ],
									"presentation_rect" : [ 603.0, 556.0, 0.0, 0.0 ],
									"style" : "",
									"text" : "Controlling function parameters"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-16",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 4,
									"outlettype" : [ "", "", "", "" ],
									"patching_rect" : [ 659.0, 461.0, 162.0, 22.0 ],
									"style" : "default",
									"text" : "j.remote /my_line:ramp/drive"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-15",
									"items" : [ "max", ",", "system", ",", "none" ],
									"maxclass" : "umenu",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "int", "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 659.0, 426.0, 100.0, 22.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-14",
									"linecount" : 3,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 668.0, 355.0, 371.0, 47.0 ],
									"style" : "default",
									"text" : "Use the Max scheduler (default, recommended).\nUse the OS system scheduler.\nDisables ramping, parameter will be set to target value immediately.",
									"textcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-10",
									"linecount" : 3,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 602.0, 355.0, 52.0, 47.0 ],
									"style" : "default",
									"text" : "max\nsystem\nnone",
									"textcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-4",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 602.0, 328.0, 437.0, 20.0 ],
									"style" : "default",
									"text" : "Controls what mechanism is used to drive output of new values during the ramp.",
									"textcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-9",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 602.0, 309.0, 150.0, 20.0 ],
									"style" : "",
									"text" : "@ramp/drive"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-34",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 4,
									"outlettype" : [ "", "", "", "" ],
									"patching_rect" : [ 866.0, 169.0, 178.0, 22.0 ],
									"style" : "default",
									"text" : "j.remote /my_line:ramp/function"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-33",
									"items" : [ "linear", ",", "-", ",", "easeInBack", ",", "easeInOutBack", ",", "easeOutBack", ",", "easeInBounce", ",", "easeInOutBounce", ",", "easeOutBounce", ",", "easeInCircular", ",", "easeInOutCircular", ",", "easeOutCircular", ",", "easeInCubic", ",", "easeInOutCubic", ",", "easeOutCubic", ",", "easeInElastic", ",", "easeInOutElastic", ",", "easeOutElastic", ",", "easeInExponential", ",", "easeInOutExponential", ",", "easeOutExponential", ",", "easeInQuadratic", ",", "easeInOutQuadratic", ",", "easeOutQuadratic", ",", "easeInQuartic", ",", "easeInOutQuartic", ",", "easeOutQuartic", ",", "easeInQuintic", ",", "easeInOutQuintic", ",", "easeOutQuintic", ",", "easeInSine", ",", "easeInOutSine", ",", "easeOutSine", ",", "-", ",", "exponential", ",", "freehand", ",", "logarithm", ",", "lowpass", ",", "power", ",", "smoothPolynomial", ",", "tanh", ",", "-", ",", "bartlett", ",", "blackman", ",", "blackmanHarris", ",", "expodec", ",", "gauss", ",", "hamming", ",", "hanning", ",", "kaiser", ",", "nuttall", ",", "rectangular", ",", "rosenbergGlottalPulse", ",", "trapezoid", ",", "tukey", ",", "welch" ],
									"maxclass" : "umenu",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "int", "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 866.0, 126.0, 100.0, 22.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-32",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 659.0, 201.5, 139.0, 22.0 ],
									"style" : "",
									"text" : "substitute set setsymbol"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-31",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 602.0, 56.0, 263.0, 33.0 ],
									"style" : "default",
									"text" : "A wide range of easing functions are available.\nWindowing functions can be used as well.",
									"textcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-30",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 602.0, 37.0, 150.0, 20.0 ],
									"style" : "",
									"text" : "@ramp/function"
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"id" : "obj-26",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 171.0, 269.5, 182.0, 37.0 ],
									"style" : "",
									"text" : "Set value to 0.,\nand ramp to 1. over 3800 ms."
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"id" : "obj-11",
									"linecount" : 5,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 856.0, 727.0, 264.0, 78.0 ],
									"style" : "default",
									"text" : "These parameters can be changed dynamically.\n\nRefer to the help file for j.ramp for further details."
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"id" : "obj-21",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 856.0, 675.0, 264.0, 37.0 ],
									"style" : "default",
									"text" : "Get a list of parameters for the current function."
								}

							}
, 							{
								"box" : 								{
									"format" : 6,
									"id" : "obj-23",
									"maxclass" : "flonum",
									"maximum" : 1.0,
									"minimum" : 0.1,
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 715.0, 744.0, 50.0, 22.0 ],
									"style" : "default"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-24",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 715.0, 771.0, 55.0, 22.0 ],
									"style" : "default",
									"text" : "width $1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-13",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 27.0, 85.0, 386.0, 20.0 ],
									"style" : "default",
									"text" : "Ramping or easing is the ability to transition to the new value over time"
								}

							}
, 							{
								"box" : 								{
									"border" : 0,
									"filename" : "helpname.js",
									"id" : "obj-6",
									"ignoreclick" : 1,
									"jsarguments" : [ "j.parameter" ],
									"maxclass" : "jsui",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 10.0, 10.0, 244.18129, 57.567627 ]
								}

							}
, 							{
								"box" : 								{
									"fontsize" : 30.0,
									"id" : "obj-12",
									"maxclass" : "live.menu",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "float" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 659.0, 118.5, 70.0, 37.0 ],
									"pictures" : [ "linear.svg", "easeInBack.svg", "easeInOutBack.svg", "easeOutBack.svg", "easeInBounce.svg", "easeInOutBounce.svg", "easeOutBounce.svg", "easeInCircular.svg", "easeInOutCircular.svg", "easeOutCircular.svg", "easeInCubic.svg", "easeInOutCubic.svg", "easeOutCubic.svg", "easeInElastic.svg", "easeInOutElastic.svg", "easeOutElastic.svg", "easeInExponential.svg", "easeInOutExponential.svg", "easeOutExponential.svg", "easeInQuadratic.svg", "easeInOutQuadratic.svg", "easeOutQuadratic.svg", "easeInQuartic.svg", "easeInOutQuartic.svg", "easeOutQuartic.svg", "easeInQuintic.svg", "easeInOutQuintic.svg", "easeOutQuintic.svg", "easeInSine.svg", "easeInOutSine.svg", "easeOutSine.svg", "exponential.svg", "freehand.svg", "logarithm.svg", "lowpass.svg", "power.svg", "smoothPolynomial.svg", "tanh.svg", "bartlett.svg", "blackman.svg", "blackmanHarris.svg", "expodec.svg", "gauss.svg", "hamming.svg", "hanning.svg", "kaiser.svg", "nuttall.svg", "rectangular.svg", "rosenbergGlottalPulse.svg", "trapezoid.svg", "tukey.svg", "welch.svg" ],
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_longname" : "live.menu[3]",
											"parameter_shortname" : "live.menu",
											"parameter_type" : 2,
											"parameter_enum" : [ "linear", "easeInBack", "easeInOutBack", "easeOutBack", "easeInBounce", "easeInOutBounce", "easeOutBounce", "easeInCircular", "easeInOutCircular", "easeOutCircular", "easeInCubic", "easeInOutCubic", "easeOutCubic", "easeInElastic", "easeInOutElastic", "easeOutElastic", "easeInExponential", "easeInOutExponential", "easeOutExponential", "easeInQuadratic", "easeInOutQuadratic", "easeOutQuadratic", "easeInQuartic", "easeInOutQuartic", "easeOutQuartic", "easeInQuintic", "easeInOutQuintic", "easeOutQuintic", "easeInSine", "easeInOutSine", "easeOutSine", "exponential", "freehand", "logarithm", "lowpass", "power", "smoothPolynomial", "tanh", "bartlett", "blackman", "blackmanHarris", "expodec", "gauss", "hamming", "hanning", "kaiser", "nuttall", "rectangular", "rosenbergGlottalPulse", "trapezoid", "tukey", "welch" ]
										}

									}
,
									"usepicture" : 1,
									"varname" : "live.menu[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-5",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 4,
									"outlettype" : [ "", "", "", "" ],
									"patching_rect" : [ 659.0, 169.0, 178.0, 22.0 ],
									"style" : "default",
									"text" : "j.remote /my_line:ramp/function"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-8",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 68.0, 148.5, 72.0, 22.0 ],
									"style" : "default",
									"text" : "loadmess 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-7",
									"maxclass" : "toggle",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 68.0, 177.0, 20.0, 20.0 ],
									"style" : "default"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-3",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 68.0, 206.0, 71.0, 22.0 ],
									"style" : "default",
									"text" : "metro 4000"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-2",
									"maxclass" : "multislider",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 68.0, 417.0, 394.0, 266.0 ],
									"setminmax" : [ -0.5, 1.5 ],
									"setstyle" : 4,
									"style" : "default"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 68.0, 329.0, 199.0, 22.0 ],
									"style" : "default",
									"text" : "j.parameter my_line @type decimal"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-68",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 68.0, 277.0, 92.0, 22.0 ],
									"style" : "default",
									"text" : "0, 1 ramp 3800"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-2", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-43", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-12", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-16", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-15", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-15", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 668.5, 494.0, 651.5, 494.0, 651.5, 415.0, 668.5, 415.0 ],
									"source" : [ "obj-16", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-24", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-23", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-39", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-24", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-3", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-12", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 668.5, 233.5, 650.5, 233.5, 650.5, 107.5, 668.5, 107.5 ],
									"source" : [ "obj-32", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-34", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-33", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-33", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 875.5, 201.0, 854.5, 201.0, 854.5, 115.0, 875.5, 115.0 ],
									"source" : [ "obj-34", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-39", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-41", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 310.5, 361.0, 284.0, 361.0, 284.0, 318.0, 77.5, 318.0 ],
									"source" : [ "obj-42", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-39", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-44", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-68", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-47", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-32", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-5", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-68", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-8", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 370.0, 465.5, 77.0, 21.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"style" : "",
						"tags" : ""
					}
,
					"style" : "default",
					"text" : "p Ramp/Ease"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-31",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 0,
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 7,
							"minor" : 0,
							"revision" : 3,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"rect" : [ 0.0, 26.0, 1204.0, 857.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 10.0, 10.0 ],
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
									"bubble" : 1,
									"id" : "obj-41",
									"linecount" : 3,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 862.5, 609.5, 263.0, 51.0 ],
									"style" : "default",
									"text" : "As you drag the note up and down, you can notice how the defined range and clipmode restricts the range of permitted notes."
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-37",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 4,
									"outlettype" : [ "", "", "", "" ],
									"patching_rect" : [ 588.0, 742.5, 122.0, 35.0 ],
									"style" : "default",
									"text" : "j.remote /frequency @unit midinote"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-36",
									"maxclass" : "nslider",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "int", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 588.0, 536.0, 75.0, 198.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"id" : "obj-34",
									"linecount" : 4,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 862.5, 445.0, 206.0, 64.0 ],
									"style" : "default",
									"text" : "As the parameter has been set to use the time dataspace, an alternative \"midinote\" unit can be used interchangeably."
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"id" : "obj-33",
									"linecount" : 6,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 862.5, 172.5, 202.0, 91.0 ],
									"style" : "default",
									"text" : "Using j.remote several user interface objects can be used with the same parameter.\n\nThese two examples both controls frequency as Hz."
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-32",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 4,
									"outlettype" : [ "", "", "", "" ],
									"patching_rect" : [ 588.0, 166.0, 113.0, 22.0 ],
									"style" : "default",
									"text" : "j.remote /frequency"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-31",
									"maxclass" : "live.numbox",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "float" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 588.0, 133.0, 86.0, 15.0 ],
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_longname" : "live.numbox",
											"parameter_shortname" : "live.numbox",
											"parameter_type" : 0,
											"parameter_mmin" : 65.0,
											"parameter_mmax" : 1000.0,
											"parameter_unitstyle" : 3
										}

									}
,
									"varname" : "live.numbox"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-28",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 4,
									"outlettype" : [ "", "", "", "" ],
									"patching_rect" : [ 588.0, 275.0, 113.0, 22.0 ],
									"style" : "default",
									"text" : "j.remote /frequency"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-27",
									"maxclass" : "live.slider",
									"numinlets" : 1,
									"numoutlets" : 2,
									"orientation" : 1,
									"outlettype" : [ "", "float" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 588.0, 226.0, 201.0, 40.0 ],
									"presentation_rect" : [ 0.0, 0.0, 50.0, 40.0 ],
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_longname" : "live.slider",
											"parameter_shortname" : "Frequency",
											"parameter_type" : 0,
											"parameter_mmin" : 65.0,
											"parameter_mmax" : 1000.0,
											"parameter_unitstyle" : 3
										}

									}
,
									"varname" : "live.slider"
								}

							}
, 							{
								"box" : 								{
									"channels" : 1,
									"id" : "obj-14",
									"maxclass" : "live.gain~",
									"numinlets" : 1,
									"numoutlets" : 4,
									"outlettype" : [ "signal", "", "float", "list" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 77.0, 636.5, 27.0, 76.0 ],
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_longname" : "live.gain~",
											"parameter_shortname" : "gain",
											"parameter_type" : 0,
											"parameter_mmin" : -70.0,
											"parameter_mmax" : 6.0,
											"parameter_initial_enable" : 1,
											"parameter_initial" : [ -15 ],
											"parameter_unitstyle" : 4
										}

									}
,
									"varname" : "live.gain~"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-6",
									"maxclass" : "kslider",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "int", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 588.0, 378.0, 336.0, 53.0 ],
									"presentation_rect" : [ 0.0, 0.0, 336.0, 53.0 ],
									"style" : "default"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-3",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 4,
									"outlettype" : [ "", "", "", "" ],
									"patching_rect" : [ 588.0, 459.5, 122.0, 35.0 ],
									"style" : "default",
									"text" : "j.remote /frequency @unit midinote"
								}

							}
, 							{
								"box" : 								{
									"border" : 0,
									"filename" : "helpdetails.js",
									"id" : "obj-7",
									"ignoreclick" : 1,
									"jsarguments" : [ "j.parameter" ],
									"maxclass" : "jsui",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 6.0, 5.0, 683.0, 105.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-9",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "signal" ],
									"patching_rect" : [ 77.0, 601.5, 46.0, 22.0 ],
									"style" : "default",
									"text" : "cycle~"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-22",
									"linecount" : 9,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 77.0, 419.5, 129.0, 129.0 ],
									"style" : "default",
									"text" : "j.parameter frequency @type decimal @range 65 1000 @clipmode both @dataspace time @unit hz @description \"The frequency value of my patch.\"",
									"varname" : "my_float[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-21",
									"maxclass" : "ezdac~",
									"numinlets" : 2,
									"numoutlets" : 0,
									"patching_rect" : [ 77.0, 732.5, 45.0, 45.0 ],
									"style" : "default"
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"id" : "obj-16",
									"linecount" : 13,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 222.5, 391.5, 202.0, 185.0 ],
									"style" : "default",
									"text" : "A parameter named \"frequency\" controls the oscilator.\n\nThe parameter stores a single decimal value. \n\nThe range of possible values is restricted to between 20 and 10000 Hz.\n\nThis parameter uses the \"time\" dataspace to maintain the state of a frequency expressd as Hz."
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-11",
									"linecount" : 17,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 41.0, 123.5, 472.0, 234.0 ],
									"style" : "default",
									"text" : "j.parameter is somewhat similar to the pattr object, while enabling a number of additional features offered by Jamoma.\n\nThe parameter is an acces point for controlling the processing of the patch. The value can be updated immediately, or by easing over time. Common types of parameters, such as frequency, can be controlled using several different units (e.g. Hz, midinote or midicent) interchangeably.\n\nThe value of the parameter can be stored and recalled using model presets. User interfaces can access the parameter remotely. Mappings enable one parameter dynamically control the value of another parameter. Cues can control all parameters in all models. When designing cues, the value can be queried for every single parameter in the patch.\n\nAdditionally the parameter enables inter-application communication. The parameter is provided with a unique global OSC address. Parameters can also be declared on the network in order for other applications such as i-score to inspect and control models."
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-21", 1 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-14", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-21", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-14", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-9", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-22", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-28", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 597.5, 279.0, 597.5, 279.0 ],
									"source" : [ "obj-27", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-27", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 597.5, 307.0, 578.5, 307.0, 578.5, 215.0, 597.5, 215.0 ],
									"source" : [ "obj-28", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-6", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 597.5, 504.5, 576.5, 504.5, 576.5, 367.0, 597.5, 367.0 ],
									"source" : [ "obj-3", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-32", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-31", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-31", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 597.5, 198.0, 577.5, 198.0, 577.5, 122.0, 597.5, 122.0 ],
									"source" : [ "obj-32", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-37", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-36", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-36", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 597.5, 787.5, 576.5, 787.5, 576.5, 525.0, 597.5, 525.0 ],
									"source" : [ "obj-37", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-6", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-14", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-9", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 158.0, 297.0, 46.0, 21.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"style" : "",
						"tags" : ""
					}
,
					"style" : "default",
					"text" : "p Basic"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-33",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 0,
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 7,
							"minor" : 0,
							"revision" : 3,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"rect" : [ 0.0, 26.0, 1204.0, 857.0 ],
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
									"id" : "obj-59",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 515.0, 529.0, 87.0, 22.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-57",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 753.0, 450.0, 67.0, 22.0 ],
									"style" : "",
									"text" : "1. 2. 3 test"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-55",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 610.5, 450.0, 71.0, 22.0 ],
									"style" : "",
									"text" : "hello world!"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-51",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 515.0, 481.0, 125.0, 35.0 ],
									"style" : "",
									"text" : "j.parameter whatever @type generic"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-50",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 515.0, 450.0, 68.0, 22.0 ],
									"style" : "",
									"text" : "apple 1. 2."
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"id" : "obj-48",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 655.0, 232.5, 128.0, 37.0 ],
									"style" : "",
									"text" : "integers are converted to float"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-46",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 506.0, 319.0, 87.0, 22.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-43",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 506.0, 271.0, 132.0, 35.0 ],
									"style" : "",
									"text" : "j.parameter my_array @type array"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-42",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 506.0, 240.0, 87.0, 22.0 ],
									"style" : "",
									"text" : "1.23 4.56 7.89"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-41",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 601.0, 240.0, 47.0, 22.0 ],
									"style" : "",
									"text" : "1 2 3 4"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-39",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 875.0, 139.0, 29.5, 22.0 ],
									"style" : "",
									"text" : "set"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-37",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 875.0, 106.0, 69.0, 22.0 ],
									"style" : "",
									"text" : "j.savebang"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-36",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 515.0, 743.0, 86.5, 22.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-34",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 515.0, 695.0, 128.0, 35.0 ],
									"style" : "",
									"text" : "j.parameter my_string @type string"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-33",
									"items" : [ "uno", ",", "dos", ",", "tres" ],
									"labelclick" : 1,
									"maxclass" : "umenu",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "int", "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 515.0, 664.0, 74.0, 22.0 ],
									"style" : "default",
									"varname" : "My_Menu[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-31",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 154.0, 695.0, 131.0, 35.0 ],
									"style" : "",
									"text" : "j.parameter my_toggle @type boolean"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-30",
									"maxclass" : "toggle",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 154.0, 743.0, 24.0, 24.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-28",
									"maxclass" : "toggle",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 154.0, 664.0, 24.0, 24.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"format" : 6,
									"id" : "obj-26",
									"maxclass" : "flonum",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 154.0, 319.0, 50.0, 22.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"format" : 6,
									"id" : "obj-24",
									"maxclass" : "flonum",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 154.0, 240.0, 50.0, 22.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-19",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 154.0, 271.0, 140.0, 35.0 ],
									"style" : "",
									"text" : "j.parameter my_decimal @type decimal"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 13.0,
									"id" : "obj-15",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 486.0, 381.0, 61.0, 21.0 ],
									"style" : "",
									"text" : "generic"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 13.0,
									"id" : "obj-18",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 486.0, 396.0, 288.0, 36.0 ],
									"style" : "",
									"text" : "Stores and output any kind of value, including lists combining integers, decimals and symbols.",
									"textcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 13.0,
									"id" : "obj-13",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 486.0, 600.0, 61.0, 21.0 ],
									"style" : "",
									"text" : "string"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 13.0,
									"id" : "obj-14",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 486.0, 615.0, 175.0, 21.0 ],
									"style" : "",
									"text" : "Stores and outputs a symbol",
									"textcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 13.0,
									"id" : "obj-11",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 96.0, 600.0, 61.0, 21.0 ],
									"style" : "",
									"text" : "boolean"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 13.0,
									"id" : "obj-12",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 96.0, 615.0, 265.0, 21.0 ],
									"style" : "",
									"text" : "Stores and outputs 1 or 0",
									"textcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 13.0,
									"id" : "obj-9",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 486.0, 171.0, 61.0, 21.0 ],
									"style" : "",
									"text" : "array"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 13.0,
									"id" : "obj-10",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 486.0, 186.0, 320.0, 21.0 ],
									"style" : "",
									"text" : "Stores and outputs one or more decimal (float) values",
									"textcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 13.0,
									"id" : "obj-4",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 96.0, 171.0, 61.0, 21.0 ],
									"style" : "",
									"text" : "decimal"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 13.0,
									"id" : "obj-8",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 96.0, 186.0, 268.0, 21.0 ],
									"style" : "",
									"text" : "Stores and outputs one decimal (float) value",
									"textcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-3",
									"maxclass" : "number",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 154.0, 529.0, 50.0, 22.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 13.0,
									"id" : "obj-1",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 96.0, 381.0, 61.0, 21.0 ],
									"style" : "",
									"text" : "integer"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 13.0,
									"id" : "obj-32",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 96.0, 396.0, 242.0, 36.0 ],
									"style" : "",
									"text" : "Stores and outputs one integer number, other values gets converted to integer",
									"textcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"border" : 0,
									"filename" : "helpname.js",
									"id" : "obj-5",
									"ignoreclick" : 1,
									"jsarguments" : [ "j.parameter" ],
									"maxclass" : "jsui",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 10.0, 10.0, 244.18129, 57.567627 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-44",
									"linecount" : 3,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 25.0, 85.0, 366.0, 47.0 ],
									"style" : "default",
									"text" : "The type attribute determines the kind of values that the parameter may store and output. The behaviour of other attributes such as ramping and dataspace is optimised based on type."
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-54",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 154.0, 481.0, 118.0, 35.0 ],
									"style" : "default",
									"text" : "j.parameter my_int @type integer",
									"varname" : "my_int"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-60",
									"maxclass" : "number",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 154.0, 450.0, 51.0, 22.0 ],
									"style" : "default",
									"triscale" : 0.9,
									"varname" : "My_Int"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-26", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-19", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-19", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-24", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-31", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-28", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-30", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-31", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-34", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-33", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-36", 1 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-34", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-39", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-37", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-36", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-39", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-46", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-39", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-59", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-39", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-43", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-41", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-43", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-42", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-46", 1 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-43", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-51", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-50", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-59", 1 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-51", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-54", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-51", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-55", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-51", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-57", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-54", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-60", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 220.5, 342.5, 44.0, 21.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"style" : "",
						"tags" : ""
					}
,
					"style" : "default",
					"text" : "p Type"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-74",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 0,
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 7,
							"minor" : 0,
							"revision" : 3,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"rect" : [ 0.0, 26.0, 1204.0, 857.0 ],
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
						"showontab" : 1,
						"boxes" : [ 							{
								"box" : 								{
									"border" : 0,
									"filename" : "helpname.js",
									"id" : "obj-13",
									"ignoreclick" : 1,
									"jsarguments" : [ "j.parameter" ],
									"maxclass" : "jsui",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 10.0, 10.0, 244.18129, 57.567627 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-12",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 362.0, 544.0, 289.0, 19.0 ],
									"style" : "default",
									"text" : "- can be used with a list of symbols for the string type"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-32",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 263.0, 846.0, 411.0, 31.0 ],
									"style" : "default",
									"text" : "- keywords can be specified in the tag attribute in order to allow an easier/more powerful sorting in j.namespace and other functions"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-33",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 108.0, 847.0, 100.0, 19.0 ],
									"style" : "default",
									"text" : "@tag"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-30",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 263.0, 804.0, 411.0, 31.0 ],
									"style" : "default",
									"text" : "- defines the order of priority according to which the parameter will be recalled in presets, cues, etc... lower values priorities come first - 0 comes last"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-31",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 108.0, 805.0, 100.0, 19.0 ],
									"style" : "default",
									"text" : "@priority"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-27",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 504.0, 743.0, 89.0, 21.0 ],
									"style" : "default",
									"text" : "j.unit"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-28",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 596.0, 754.0, 78.0, 21.0 ],
									"style" : "default",
									"text" : "prepend help"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-29",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 596.0, 774.0, 55.0, 21.0 ],
									"style" : "default",
									"text" : "pcontrol"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-25",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 263.0, 773.0, 411.0, 19.0 ],
									"style" : "default",
									"text" : "- defines the  unit  of the parameter in the chosen dataspace"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-26",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 108.0, 774.0, 100.0, 19.0 ],
									"style" : "default",
									"text" : "@unit"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-20",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 263.0, 742.0, 411.0, 19.0 ],
									"style" : "default",
									"text" : "- defines the  dataspace of the parameter, see "
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-22",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 108.0, 743.0, 101.0, 19.0 ],
									"style" : "default",
									"text" : "@dataspace"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-14",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 263.0, 707.0, 411.0, 19.0 ],
									"style" : "default",
									"text" : "- defines the  default value to which it will be set at init"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-19",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 108.0, 708.0, 100.0, 19.0 ],
									"style" : "default",
									"text" : "@default"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-11",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 373.0, 434.0, 170.0, 19.0 ],
									"style" : "default",
									"text" : "help patcher for further details)"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-21",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 308.0, 434.0, 65.0, 21.0 ],
									"style" : "default",
									"text" : "j.ramp"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-23",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 493.0, 469.0, 78.0, 21.0 ],
									"style" : "default",
									"text" : "prepend help"
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
									"patching_rect" : [ 493.0, 489.0, 55.0, 21.0 ],
									"style" : "default",
									"text" : "pcontrol"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-4",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 278.0, 434.0, 38.0, 19.0 ],
									"style" : "default",
									"text" : "(see "
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-2",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 263.0, 413.0, 293.0, 19.0 ],
									"style" : "default",
									"text" : "- what function of the FunctionLib is applied to the ramp"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-3",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 108.0, 414.0, 109.0, 19.0 ],
									"style" : "default",
									"text" : "@ramp/function"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-1",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 287.0, 385.0, 324.0, 19.0 ],
									"style" : "default",
									"text" : "only integer, decimal, and array support ramping"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-5",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 283.0, 313.0, 99.0, 19.0 ],
									"style" : "default",
									"text" : "none (bang)"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-6",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 283.0, 268.0, 153.0, 19.0 ],
									"style" : "default",
									"text" : "array (known as list in Max)"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-7",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 283.0, 238.0, 246.0, 19.0 ],
									"style" : "default",
									"text" : "decimal (a.k.a . floating point values, or float)"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-8",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 283.0, 223.0, 51.0, 19.0 ],
									"style" : "default",
									"text" : "integer"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-9",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 283.0, 283.0, 177.0, 19.0 ],
									"style" : "default",
									"text" : "string (known as symbol in Max)"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-10",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 283.0, 253.0, 93.0, 19.0 ],
									"style" : "default",
									"text" : "boolean (0 or 1)"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-15",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 263.0, 658.0, 406.0, 31.0 ],
									"style" : "default",
									"text" : "- defines the size of the step used by the 'inc' and 'dec' messages (default is 1)"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-16",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 108.0, 659.0, 100.0, 19.0 ],
									"style" : "default",
									"text" : "@stepsize"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-17",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 283.0, 689.0, 32.0, 19.0 ],
									"style" : "default",
									"text" : "float"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-77",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 277.0, 148.5, 135.0, 19.0 ],
									"style" : "default",
									"text" : "- name of parameter"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-78",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 87.0, 146.0, 132.0, 19.0 ],
									"style" : "default",
									"text" : "Argument (mandatory):"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-82",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 88.0, 177.0, 63.0, 19.0 ],
									"style" : "default",
									"text" : "Attributes:"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-100",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 263.0, 613.0, 351.0, 19.0 ],
									"style" : "default",
									"text" : "- text describing the parameter for html auto-documenting modules"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-101",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 108.0, 614.0, 100.0, 19.0 ],
									"style" : "default",
									"text" : "@description"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-102",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 283.0, 634.0, 39.0, 19.0 ],
									"style" : "default",
									"text" : "(text)"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-105",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 108.0, 569.0, 100.0, 19.0 ],
									"style" : "default",
									"text" : "@clipmode"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-106",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 283.0, 589.0, 124.0, 19.0 ],
									"style" : "default",
									"text" : "none, low, high, both"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-107",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 263.0, 513.0, 289.0, 31.0 ],
									"style" : "default",
									"text" : "- suggested normal range of parameter (two ints or floats). Default: 0.-1."
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-108",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 263.0, 458.0, 200.0, 19.0 ],
									"style" : "default",
									"text" : "- filter repetitions of the same value"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-109",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 263.0, 204.0, 279.0, 19.0 ],
									"style" : "default",
									"text" : "- what kind of parameter is this?"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-110",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 289.0, 477.0, 63.0, 19.0 ],
									"style" : "default",
									"text" : "0 (default)"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-111",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 289.0, 493.0, 19.0, 19.0 ],
									"style" : "default",
									"text" : "1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-112",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 108.0, 459.0, 115.0, 19.0 ],
									"style" : "default",
									"text" : "@repetitions/filter"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-113",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 108.0, 519.0, 100.0, 19.0 ],
									"style" : "default",
									"text" : "@range"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-115",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 283.0, 298.0, 188.0, 19.0 ],
									"style" : "default",
									"text" : "generic (default : any kind of data)"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-116",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 108.0, 203.0, 100.0, 19.0 ],
									"style" : "default",
									"text" : "@type"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-117",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 283.0, 364.0, 258.0, 19.0 ],
									"style" : "default",
									"text" : "none (default), Max"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-118",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 283.0, 544.0, 82.0, 19.0 ],
									"style" : "default",
									"text" : "2 ints or floats"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-119",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 263.0, 343.0, 278.0, 19.0 ],
									"style" : "default",
									"text" : "- determines if parameter can be ramped or not"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-120",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 108.0, 344.0, 109.0, 19.0 ],
									"style" : "default",
									"text" : "@ramp/drive"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-104",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 263.0, 568.0, 266.0, 19.0 ],
									"style" : "default",
									"text" : "- define range boundary restrictions. Default: none"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-23", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"midpoints" : [ 317.5, 461.0, 502.5, 461.0 ],
									"source" : [ "obj-21", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-24", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-23", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-28", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"midpoints" : [ 513.5, 759.0, 605.5, 759.0 ],
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
 ]
					}
,
					"patching_rect" : [ 532.0, 592.5, 110.0, 21.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"fontname" : "Verdana",
						"fontsize" : 10.0,
						"globalpatchername" : "",
						"style" : "",
						"tags" : ""
					}
,
					"style" : "default",
					"text" : "p \"Other attributes\""
				}

			}
 ],
		"lines" : [  ],
		"parameters" : 		{
			"obj-34::obj-12" : [ "live.menu[3]", "live.menu", 0 ],
			"obj-3::obj-40" : [ "live.numbox[11]", "live.numbox[1]", 0 ],
			"obj-3::obj-15" : [ "live.numbox[1]", "live.numbox[1]", 0 ],
			"obj-3::obj-41" : [ "live.numbox[12]", "live.numbox[1]", 0 ],
			"obj-3::obj-33" : [ "live.numbox[8]", "live.numbox[1]", 0 ],
			"obj-3::obj-25" : [ "live.numbox[4]", "live.numbox[1]", 0 ],
			"obj-3::obj-64" : [ "live.dial[1]", "To", 0 ],
			"obj-3::obj-29" : [ "live.numbox[6]", "live.numbox[1]", 0 ],
			"obj-3::obj-32" : [ "live.numbox[7]", "live.numbox[1]", 0 ],
			"obj-3::obj-24" : [ "live.numbox[3]", "live.numbox[1]", 0 ],
			"obj-3::obj-36" : [ "live.numbox[9]", "live.numbox[1]", 0 ],
			"obj-3::obj-28" : [ "live.numbox[5]", "live.numbox[1]", 0 ],
			"obj-3::obj-63" : [ "live.dial", "From", 0 ],
			"obj-3::obj-37" : [ "live.numbox[10]", "live.numbox[1]", 0 ],
			"obj-3::obj-16" : [ "live.numbox[2]", "live.numbox[1]", 0 ],
			"obj-31::obj-14" : [ "live.gain~", "gain", 0 ],
			"obj-31::obj-31" : [ "live.numbox", "live.numbox", 0 ],
			"obj-31::obj-27" : [ "live.slider", "Frequency", 0 ]
		}
,
		"dependency_cache" : [ 			{
				"name" : "helpname.js",
				"bootpath" : "C74:/help/resources",
				"type" : "TEXT",
				"implicit" : 1
			}
, 			{
				"name" : "helpdetails.js",
				"bootpath" : "C74:/help/resources",
				"type" : "TEXT",
				"implicit" : 1
			}
, 			{
				"name" : "j.parameter.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.savebang.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.remote.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.model.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.namespace.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.cue.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.send.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.receive.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.node.mxo",
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
