{
	"patcher" : 	{
		"fileversion" : 1,
		"rect" : [ 258.0, 215.0, 1023.0, 549.0 ],
		"bglocked" : 0,
		"defrect" : [ 258.0, 215.0, 1023.0, 549.0 ],
		"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
		"openinpresentation" : 0,
		"default_fontsize" : 9.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 0,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 0,
		"toolbarvisible" : 1,
		"boxanimatetime" : 200,
		"imprint" : 0,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"boxes" : [ 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-41",
					"items" : [ "Selador.1/model/mute", ",", "Selador.2/model/mute", ",", "Selador.3/model/mute", ",", "model/mute" ],
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"patching_rect" : [ 40.0, 500.0, 100.0, 17.0 ],
					"prefix" : "/Sel.arr/",
					"types" : [  ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-42",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 40.0, 477.0, 278.0, 17.0 ],
					"text" : "jcom.namespace+ @lookfor jcom.parameter @restrict/tags generic"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frgb" : [ 0.658824, 0.658824, 0.658824, 1.0 ],
					"id" : "obj-40",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 353.0, 424.0, 659.0, 20.0 ],
					"presentation" : 1,
					"presentation_linecount" : 2,
					"presentation_rect" : [ 313.0, 436.0, 281.0, 34.0 ],
					"text" : "• exclude/tags : every address containing one of the given tags will be excluded"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frgb" : [ 0.658824, 0.658824, 0.658824, 1.0 ],
					"id" : "obj-39",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 353.0, 475.0, 659.0, 20.0 ],
					"presentation" : 1,
					"presentation_linecount" : 2,
					"presentation_rect" : [ 313.0, 431.0, 284.0, 34.0 ],
					"text" : "• restrict/tags : only elements containing one of the given strings will be included"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frgb" : [ 0.658824, 0.658824, 0.658824, 1.0 ],
					"id" : "obj-38",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 351.0, 373.0, 659.0, 20.0 ],
					"presentation" : 1,
					"presentation_linecount" : 3,
					"presentation_rect" : [ 311.0, 385.0, 281.0, 48.0 ],
					"text" : "• restrict/keys : only elements containing one of the given strings will be included (works also with portions)"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-35",
					"items" : [ "Selador.1/amber", ",", "Selador.1/blue", ",", "Selador.1/cyan", ",", "Selador.1/green", ",", "Selador.1/indigo", ",", "Selador.1/intensity", ",", "Selador.1/orange", ",", "Selador.1/red", ",", "Selador.1/startChannel", ",", "Selador.2/amber", ",", "Selador.2/blue", ",", "Selador.2/cyan", ",", "Selador.2/green", ",", "Selador.2/indigo", ",", "Selador.2/intensity", ",", "Selador.2/orange", ",", "Selador.2/red", ",", "Selador.2/startChannel", ",", "Selador.3/amber", ",", "Selador.3/blue", ",", "Selador.3/cyan", ",", "Selador.3/green", ",", "Selador.3/indigo", ",", "Selador.3/intensity", ",", "Selador.3/orange", ",", "Selador.3/red", ",", "Selador.3/startChannel", ",", "arraySize" ],
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"patching_rect" : [ 57.0, 449.0, 100.0, 17.0 ],
					"prefix" : "/Sel.arr/",
					"types" : [  ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-37",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 57.0, 426.0, 282.0, 17.0 ],
					"text" : "jcom.namespace+ @lookfor jcom.parameter @exclude/tags generic"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-34",
					"items" : "<empty>",
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"patching_rect" : [ 81.0, 397.0, 100.0, 17.0 ],
					"prefix" : "/Sel.arr/",
					"types" : [  ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frgb" : [ 0.658824, 0.658824, 0.658824, 1.0 ],
					"id" : "obj-33",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 353.0, 324.0, 637.0, 20.0 ],
					"presentation" : 1,
					"presentation_linecount" : 3,
					"presentation_rect" : [ 303.0, 225.0, 284.0, 48.0 ],
					"text" : "• sort : \"priority\" will sort by priority - everything else will sort alphabetically (until we find another sorting method)"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-32",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 882.0, 172.0, 62.0, 17.0 ],
					"text" : "movie.model"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-31",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 0,
					"patcher" : 					{
						"fileversion" : 1,
						"rect" : [ 50.0, 94.0, 484.0, 147.0 ],
						"bglocked" : 0,
						"defrect" : [ 50.0, 94.0, 484.0, 147.0 ],
						"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
						"openinpresentation" : 0,
						"default_fontsize" : 9.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 0,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 0,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"boxes" : [ 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"id" : "obj-10",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 33.0, 49.0, 50.0, 15.0 ],
									"text" : "/"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"id" : "obj-12",
									"items" : [ "Sel.arr", ",", "Sel.arr/Selador.1", ",", "Sel.arr/Selador.2", ",", "Sel.arr/Selador.3", ",", "Sel.bas", ",", "Sel.bas/Selador.1", ",", "Sel.bas/Selador.2", ",", "Sel.face", ",", "Sel.face/Selador.1", ",", "Sel.face/Selador.2", ",", "Sel.inter", ",", "Sel.inter/Selador.1", ",", "Sel.inter/Selador.2", ",", "Sel.inter/Selador.3", ",", "Sel.poly", ",", "Sel.poly/Selador.1", ",", "Sel.poly/Selador.2", ",", "Sel.poly/Selador.3", ",", "Sel.poly/Selador.4", ",", "Sel.poly/Selador.5", ",", "Sel.rido", ",", "Sel.rido/Selador.1", ",", "Sel.rido/Selador.2", ",", "cueManager", ",", "cyclo", ",", "degrade.1", ",", "degrade.2", ",", "function.1", ",", "function.10", ",", "function.2", ",", "function.3", ",", "function.4", ",", "function.5", ",", "function.6", ",", "function.7", ",", "function.8", ",", "function.9", ",", "p.fresnFen", ",", "p.fresntest", ",", "p2.T8", ",", "p2.brabo", ",", "p2.fluo", ",", "p2.fresn", ",", "p2.latV", ",", "p2.raz", ",", "p2.svob", ",", "p4.mask", ",", "wacmap.selador", ",", "wacom" ],
									"maxclass" : "umenu",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "int", "", "" ],
									"patching_rect" : [ 33.0, 95.0, 100.0, 17.0 ],
									"prefix" : "Servo:/",
									"showdotfiles" : 1,
									"types" : [  ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"id" : "obj-13",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "" ],
									"patching_rect" : [ 33.0, 72.0, 273.0, 17.0 ],
									"text" : "jcom.namespace+ jcom.hub @exclude/keys mo (view)"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"frgb" : [ 0.658824, 0.658824, 0.658824, 1.0 ],
									"id" : "obj-8",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 101.0, 49.0, 350.0, 17.0 ],
									"text" : "• exclude/keys can also  be partial, here for example \"mo\"will filter mouse and movie"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-13", 0 ],
									"hidden" : 0,
									"midpoints" : [  ],
									"source" : [ "obj-10", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-12", 0 ],
									"hidden" : 0,
									"midpoints" : [  ],
									"source" : [ "obj-13", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 959.0, 254.0, 35.0, 17.0 ],
					"saved_object_attributes" : 					{
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"globalpatchername" : "",
						"fontname" : "Arial",
						"default_fontsize" : 9.0,
						"fontface" : 0,
						"fontsize" : 9.0
					}
,
					"text" : "p plus"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frgb" : [ 0.658824, 0.658824, 0.658824, 1.0 ],
					"id" : "obj-30",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 352.0, 253.0, 659.0, 20.0 ],
					"presentation" : 1,
					"presentation_linecount" : 3,
					"presentation_rect" : [ 304.0, 227.0, 281.0, 48.0 ],
					"text" : "• exclude/keys : every address containing one of the given strings will be excluded (works also with portions, see _____)"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frgb" : [ 0.658824, 0.658824, 0.658824, 1.0 ],
					"id" : "obj-29",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 350.0, 204.0, 637.0, 20.0 ],
					"presentation" : 1,
					"presentation_linecount" : 3,
					"presentation_rect" : [ 343.0, 202.0, 281.0, 48.0 ],
					"text" : "• autoupdate : if set to 1, jcom.namespace+ will populate the menu everytime somehting changes in the namespace"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frgb" : [ 0.658824, 0.658824, 0.658824, 1.0 ],
					"id" : "obj-28",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 265.0, 204.0, 71.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 176.0, 205.0, 281.0, 20.0 ],
					"text" : "Attributes :\n"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-27",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 3,
					"outlettype" : [ "", "signal", "signal" ],
					"patching_rect" : [ 644.0, 172.0, 121.0, 17.0 ],
					"text" : "degrade~.model /degrade.2"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frgb" : [ 0.658824, 0.658824, 0.658824, 1.0 ],
					"id" : "obj-26",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 115.0, 156.0, 450.0, 20.0 ],
					"presentation" : 1,
					"presentation_linecount" : 2,
					"presentation_rect" : [ 115.0, 168.0, 281.0, 34.0 ],
					"text" : "by default, sorting is made alphabetically - with @sort priority, it is made by priority"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frgb" : [ 0.658824, 0.658824, 0.658824, 1.0 ],
					"id" : "obj-25",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 353.0, 518.0, 479.0, 20.0 ],
					"presentation" : 1,
					"presentation_linecount" : 2,
					"presentation_rect" : [ 287.0, 118.0, 281.0, 34.0 ],
					"text" : "note : for backwards compatibility, the lookfor attribute can alsobe specified as argument"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.811765, 0.372549, 0.372549, 1.0 ],
					"fontname" : "Arial",
					"fontsize" : 7.0,
					"hidden" : 1,
					"id" : "obj-83",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"rect" : [ 25.0, 69.0, 378.0, 319.0 ],
						"bglocked" : 0,
						"defrect" : [ 25.0, 69.0, 378.0, 319.0 ],
						"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 0,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 0,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"boxes" : [ 							{
								"box" : 								{
									"color" : [ 0.811765, 0.372549, 0.372549, 1.0 ],
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-71",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 173.0, 174.0, 40.0, 20.0 ],
									"text" : "zl reg"
								}

							}
, 							{
								"box" : 								{
									"color" : [ 0.811765, 0.372549, 0.372549, 1.0 ],
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-72",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "bang", "" ],
									"patching_rect" : [ 173.0, 100.0, 40.0, 20.0 ],
									"text" : "t b s"
								}

							}
, 							{
								"box" : 								{
									"color" : [ 0.811765, 0.372549, 0.372549, 1.0 ],
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-77",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 194.0, 148.0, 73.0, 20.0 ],
									"text" : "fromsymbol"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"frgb" : [ 0.811765, 0.372549, 0.372549, 1.0 ],
									"id" : "obj-79",
									"linecount" : 4,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 115.0, 135.0, 62.0 ],
									"text" : "!!! because when prefix is set as \"/\" there is automatically a \"Mac:\" added before !!?!",
									"textcolor" : [ 0.811765, 0.372549, 0.372549, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"color" : [ 0.811765, 0.372549, 0.372549, 1.0 ],
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-80",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 5,
									"outlettype" : [ "", "", "", "", "" ],
									"patching_rect" : [ 193.0, 122.0, 149.0, 20.0 ],
									"text" : "regexp .+:/ @substitute /"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-81",
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 173.0, 40.0, 25.0, 25.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-82",
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 173.0, 254.0, 25.0, 25.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-82", 0 ],
									"hidden" : 0,
									"midpoints" : [  ],
									"source" : [ "obj-71", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-71", 0 ],
									"hidden" : 0,
									"midpoints" : [  ],
									"source" : [ "obj-72", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-80", 0 ],
									"hidden" : 0,
									"midpoints" : [  ],
									"source" : [ "obj-72", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-71", 1 ],
									"hidden" : 0,
									"midpoints" : [  ],
									"source" : [ "obj-77", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-77", 0 ],
									"hidden" : 0,
									"midpoints" : [ 300.0, 145.0, 203.5, 145.0 ],
									"source" : [ "obj-80", 3 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-77", 0 ],
									"hidden" : 0,
									"midpoints" : [  ],
									"source" : [ "obj-80", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-72", 0 ],
									"hidden" : 0,
									"midpoints" : [  ],
									"source" : [ "obj-81", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 81.0, 301.0, 68.0, 15.0 ],
					"saved_object_attributes" : 					{
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"globalpatchername" : "",
						"fontname" : "Arial",
						"default_fontsize" : 12.0,
						"fontface" : 0,
						"fontsize" : 12.0
					}
,
					"text" : "p filter_harddrive:/"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-22",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 81.0, 374.0, 273.0, 17.0 ],
					"text" : "jcom.namespace+ @lookfor jcom.parameter @restrict/keys out"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-13",
					"items" : [ "Selador.1/amber", ",", "Selador.1/blue", ",", "Selador.1/cyan", ",", "Selador.1/green", ",", "Selador.1/indigo", ",", "Selador.1/intensity", ",", "Selador.1/model/mute", ",", "Selador.1/orange", ",", "Selador.1/red", ",", "Selador.1/startChannel", ",", "Selador.2/amber", ",", "Selador.2/blue", ",", "Selador.2/cyan", ",", "Selador.2/green", ",", "Selador.2/indigo", ",", "Selador.2/intensity", ",", "Selador.2/model/mute", ",", "Selador.2/orange", ",", "Selador.2/red", ",", "Selador.2/startChannel", ",", "Selador.3/amber", ",", "Selador.3/blue", ",", "Selador.3/cyan", ",", "Selador.3/green", ",", "Selador.3/indigo", ",", "Selador.3/intensity", ",", "Selador.3/model/mute", ",", "Selador.3/orange", ",", "Selador.3/red", ",", "Selador.3/startChannel", ",", "arraySize", ",", "model/mute" ],
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"patching_rect" : [ 100.0, 347.0, 100.0, 17.0 ],
					"prefix" : "/Sel.arr/",
					"types" : [  ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-11",
					"items" : [ "Sel.arr", ",", "Sel.arr/Selador.1", ",", "Sel.arr/Selador.2", ",", "Sel.arr/Selador.3", ",", "Sel.bas", ",", "Sel.bas/Selador.1", ",", "Sel.bas/Selador.2", ",", "Sel.face", ",", "Sel.face/Selador.1", ",", "Sel.face/Selador.2", ",", "Sel.inter", ",", "Sel.inter/Selador.1", ",", "Sel.inter/Selador.2", ",", "Sel.inter/Selador.3", ",", "Sel.poly", ",", "Sel.poly/Selador.1", ",", "Sel.poly/Selador.2", ",", "Sel.poly/Selador.3", ",", "Sel.poly/Selador.4", ",", "Sel.poly/Selador.5", ",", "Sel.rido", ",", "Sel.rido/Selador.1", ",", "Sel.rido/Selador.2", ",", "cueManager", ",", "cyclo", ",", "degrade.1", ",", "degrade.2", ",", "function.glop", ",", "function.glop/f.1", ",", "function.glop/f.2", ",", "function.glop/f.3", ",", "function.glop/f.4", ",", "function.glop/f.5", ",", "function.test", ",", "function.test/f.1", ",", "function.test/f.10", ",", "function.test/f.2", ",", "function.test/f.3", ",", "function.test/f.4", ",", "function.test/f.5", ",", "function.test/f.6", ",", "function.test/f.7", ",", "function.test/f.8", ",", "function.test/f.9", ",", "mouse", ",", "movie", ",", "p.fresnFen", ",", "p.fresntest", ",", "p2.T8", ",", "p2.brabo", ",", "p2.fluo", ",", "p2.fresn", ",", "p2.latV", ",", "p2.raz", ",", "p2.svob", ",", "p4.mask", ",", "wacmap.selador", ",", "wacom" ],
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"patching_rect" : [ 40.0, 277.0, 100.0, 17.0 ],
					"prefix" : "Servo:/",
					"types" : [  ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-9",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 40.0, 233.0, 50.0, 15.0 ],
					"text" : "/"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frgb" : [ 0.658824, 0.658824, 0.658824, 1.0 ],
					"id" : "obj-7",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 115.0, 116.0, 147.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 56.0, 126.0, 281.0, 20.0 ],
					"text" : "it only works with menus"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-3",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 40.0, 256.0, 256.0, 17.0 ],
					"text" : "jcom.namespace+ @lookfor jcom.hub @exclude/keys (view)"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-2",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 100.0, 325.0, 244.0, 17.0 ],
					"text" : "jcom.namespace+ @lookfor jcom.parameter @sort priority"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-1",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 798.0, 172.0, 65.0, 17.0 ],
					"text" : "mouse.model"
				}

			}
, 			{
				"box" : 				{
					"args" : [ "/degrade.1" ],
					"id" : "obj-5",
					"maxclass" : "bpatcher",
					"name" : "degrade~.module.maxpat",
					"numinlets" : 3,
					"numoutlets" : 3,
					"outlettype" : [ "", "signal", "signal" ],
					"patching_rect" : [ 643.0, 87.0, 303.0, 72.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 645.0, 165.0, 300.0, 71.0 ],
					"varname" : "deg1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frgb" : [ 0.658824, 0.658824, 0.658824, 1.0 ],
					"id" : "obj-73",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 38.0, 85.0, 536.0, 20.0 ],
					"presentation" : 1,
					"presentation_linecount" : 2,
					"presentation_rect" : [ 15.0, 90.0, 281.0, 34.0 ],
					"text" : "jcom.namespace+ is a patcher-based extension of jcom.namespace, in order  to prototype features"
				}

			}
, 			{
				"box" : 				{
					"args" : [ "@name", "jcom.namespace+", "@description", "a patcher-based extension of jcom.namespace to prototype features" ],
					"bgmode" : 1,
					"id" : "obj-36",
					"maxclass" : "bpatcher",
					"name" : "jcom.maxhelpui.maxpat",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 0.0, 0.0, 1023.0, 70.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 15.0, 15.0, 945.0, 70.0 ]
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-83", 0 ],
					"hidden" : 0,
					"midpoints" : [  ],
					"source" : [ "obj-11", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 0 ],
					"hidden" : 0,
					"midpoints" : [  ],
					"source" : [ "obj-2", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-34", 0 ],
					"hidden" : 0,
					"midpoints" : [  ],
					"source" : [ "obj-22", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-11", 0 ],
					"hidden" : 0,
					"midpoints" : [  ],
					"source" : [ "obj-3", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-35", 0 ],
					"hidden" : 0,
					"midpoints" : [  ],
					"source" : [ "obj-37", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-41", 0 ],
					"hidden" : 0,
					"midpoints" : [  ],
					"source" : [ "obj-42", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"hidden" : 0,
					"midpoints" : [ 90.5, 320.0, 109.5, 320.0 ],
					"source" : [ "obj-83", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-22", 0 ],
					"hidden" : 0,
					"midpoints" : [ 90.5, 319.0, 90.5, 319.0 ],
					"source" : [ "obj-83", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-37", 0 ],
					"hidden" : 0,
					"midpoints" : [ 90.5, 320.5, 66.5, 320.5 ],
					"source" : [ "obj-83", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-42", 0 ],
					"hidden" : 0,
					"midpoints" : [ 90.5, 320.5, 49.5, 320.5 ],
					"source" : [ "obj-83", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"hidden" : 0,
					"midpoints" : [  ],
					"source" : [ "obj-9", 0 ]
				}

			}
 ]
	}

}
