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
		"rect" : [ 139.0, 243.0, 1292.0, 771.0 ],
		"bglocked" : 0,
		"openinpresentation" : 0,
		"default_fontsize" : 10.0,
		"default_fontface" : 0,
		"default_fontname" : "Verdana",
		"gridonopen" : 1,
		"gridsize" : [ 5.0, 5.0 ],
		"gridsnaponopen" : 2,
		"objectsnaponopen" : 0,
		"statusbarvisible" : 2,
		"toolbarvisible" : 0,
		"lefttoolbarpinned" : 0,
		"toptoolbarpinned" : 0,
		"righttoolbarpinned" : 0,
		"bottomtoolbarpinned" : 0,
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
		"subpatcher_template" : "",
		"showrootpatcherontab" : 0,
		"showontab" : 0,
		"boxes" : [ 			{
				"box" : 				{
					"id" : "obj-1",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 0,
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
						"rect" : [ 0.0, 26.0, 1292.0, 745.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 14.0,
						"default_fontface" : 0,
						"default_fontname" : "Lato Light",
						"gridonopen" : 1,
						"gridsize" : [ 5.0, 5.0 ],
						"gridsnaponopen" : 2,
						"objectsnaponopen" : 0,
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
									"id" : "obj-34",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 615.0, 670.0, 415.0, 23.0 ],
									"style" : "",
									"text" : "Connect with us via Github, GoogleGroups, Facebook, or Twitter!",
									"textcolor" : [ 0.862745, 0.870588, 0.878431, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-33",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 615.0, 640.0, 320.0, 23.0 ],
									"style" : "",
									"text" : "Explore additional tabs in this Overview",
									"textcolor" : [ 0.862745, 0.870588, 0.878431, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-32",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 615.0, 610.0, 320.0, 23.0 ],
									"style" : "",
									"text" : "Video Tutorials available at http://jamoma.org",
									"textcolor" : [ 0.862745, 0.870588, 0.878431, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontsize" : 24.0,
									"id" : "obj-29",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 615.0, 565.0, 137.0, 35.0 ],
									"style" : "",
									"text" : "Next Steps",
									"textcolor" : [ 0.862745, 0.870588, 0.878431, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Courier",
									"id" : "obj-27",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 910.0, 415.0, 347.0, 20.0 ],
									"style" : "",
									"text" : "bpatcher @name echo~.view @args /another"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-28",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 895.0, 390.0, 351.0, 23.0 ],
									"style" : "",
									"text" : "To create this object, type the following in an object box:"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-26",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 3,
									"outlettype" : [ "signal", "signal", "" ],
									"patching_rect" : [ 745.0, 250.0, 96.0, 25.0 ],
									"style" : "",
									"text" : "echo~.module"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-25",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 725.0, 225.0, 351.0, 23.0 ],
									"style" : "",
									"text" : "Or simply create an instance as an abstraction:"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Courier",
									"id" : "obj-24",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 740.0, 195.0, 245.0, 20.0 ],
									"style" : "",
									"text" : "bpatcher @name echo~.module"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-23",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 725.0, 170.0, 351.0, 23.0 ],
									"style" : "",
									"text" : "To create this object, type the following in an object box:"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-22",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 35.0, 575.0, 320.0, 40.0 ],
									"style" : "",
									"text" : "You can have any number of views.  Views can even be other applications or running on a network."
								}

							}
, 							{
								"box" : 								{
									"clipheight" : 39.0,
									"data" : 									{
										"clips" : [ 											{
												"filename" : "brushes.aif",
												"filekind" : "audiofile",
												"loop" : 0,
												"content_state" : 												{
													"formant" : [ 1.0 ],
													"originaltempo" : [ 120.0 ],
													"play" : [ 0 ],
													"originallengthms" : [ 0.0 ],
													"basictuning" : [ 440 ],
													"pitchcorrection" : [ 0 ],
													"slurtime" : [ 0.0 ],
													"followglobaltempo" : [ 0 ],
													"timestretch" : [ 0 ],
													"formantcorrection" : [ 0 ],
													"mode" : [ "basic" ],
													"speed" : [ 1.0 ],
													"quality" : [ "basic" ],
													"pitchshift" : [ 1.0 ],
													"originallength" : [ 0.0, "ticks" ]
												}

											}
 ]
									}
,
									"id" : "obj-21",
									"maxclass" : "playlist~",
									"numinlets" : 1,
									"numoutlets" : 5,
									"outlettype" : [ "signal", "signal", "signal", "", "dictionary" ],
									"patching_rect" : [ 400.0, 350.0, 165.0, 40.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-18",
									"maxclass" : "ezdac~",
									"numinlets" : 2,
									"numoutlets" : 0,
									"patching_rect" : [ 400.0, 435.0, 45.0, 45.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-17",
									"linecount" : 5,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 35.0, 475.0, 320.0, 90.0 ],
									"style" : "",
									"text" : "To the right we have seperate instances of the echo~ model and the echo~ view (the view is in a bpatcher).  Both are given the same OpenSoundControl name, so they are connected.  Try it!"
								}

							}
, 							{
								"box" : 								{
									"annotation" : "none",
									"args" : [ "/another" ],
									"bgmode" : 0,
									"border" : 0,
									"clickthrough" : 0,
									"enablehscroll" : 0,
									"enablevscroll" : 0,
									"id" : "obj-16",
									"lockeddragscroll" : 0,
									"maxclass" : "bpatcher",
									"name" : "echo~.view.maxpat",
									"numinlets" : 1,
									"numoutlets" : 1,
									"offset" : [ 0.0, 0.0 ],
									"outlettype" : [ "" ],
									"patching_rect" : [ 575.0, 365.0, 300.0, 105.0 ],
									"presentation_rect" : [ 0.0, 0.0, 300.0, 105.0 ],
									"viewvisibility" : 1
								}

							}
, 							{
								"box" : 								{
									"annotation" : "Stereo echo module.",
									"id" : "obj-15",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 3,
									"outlettype" : [ "signal", "signal", "" ],
									"patching_rect" : [ 400.0, 400.0, 145.0, 25.0 ],
									"style" : "",
									"text" : "echo~.model /another"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-14",
									"linecount" : 4,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 35.0, 390.0, 323.0, 74.0 ],
									"style" : "",
									"text" : "Those parts typically involve two separate patchers: a \"model\" and a \"view\".  If you don't want the UI we've provided, you don't have to use it.  Or you can make your own."
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Regular",
									"id" : "obj-13",
									"linecount" : 3,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 35.0, 660.0, 325.0, 57.0 ],
									"style" : "",
									"text" : "While it can be handy to use the provided Jamoma modules, the real purpose of Jamoma is to provide the ability to create your own modules."
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-12",
									"linecount" : 3,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 35.0, 320.0, 320.0, 57.0 ],
									"style" : "",
									"text" : "A \"module\" is a term that represents all of the various parts that are packaged together to make a usable block like the echo~ example above."
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-10",
									"linecount" : 3,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 35.0, 215.0, 320.0, 57.0 ],
									"style" : "",
									"text" : "To the right is an instance of \"echo~.model\" in a bpatcher.  A list of modules is available in the \"models\" tab of this overview."
								}

							}
, 							{
								"box" : 								{
									"bgmode" : 0,
									"border" : 0,
									"clickthrough" : 0,
									"enablehscroll" : 0,
									"enablevscroll" : 0,
									"id" : "obj-9",
									"lockeddragscroll" : 0,
									"maxclass" : "bpatcher",
									"name" : "echo~.module.maxpat",
									"numinlets" : 2,
									"numoutlets" : 3,
									"offset" : [ 0.0, 0.0 ],
									"outlettype" : [ "signal", "signal", "" ],
									"patching_rect" : [ 385.0, 170.0, 300.0, 105.0 ],
									"presentation_rect" : [ 0.0, 0.0, 300.0, 105.0 ],
									"viewvisibility" : 1
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-8",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 35.0, 165.0, 320.0, 40.0 ],
									"style" : "",
									"text" : "At its simplest, use the provided modules as you would use a Vizzie, BEAP, or Max for Live module."
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-7",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 35.0, 105.0, 295.0, 23.0 ],
									"style" : "",
									"text" : "Jamoma is a modular patching layer for Max."
								}

							}
, 							{
								"box" : 								{
									"args" : [ "@name", "jamoma", "@description", "Modular Patching and Programming for Realtime Media" ],
									"bgmode" : 1,
									"border" : 0,
									"clickthrough" : 0,
									"enablehscroll" : 0,
									"enablevscroll" : 0,
									"id" : "obj-3",
									"lockeddragscroll" : 0,
									"maxclass" : "bpatcher",
									"name" : "j.maxhelpui.maxpat",
									"numinlets" : 1,
									"numoutlets" : 0,
									"offset" : [ 0.0, 0.0 ],
									"patching_rect" : [ 0.0, 0.0, 398.0, 87.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 0.0, 0.0, 650.0, 70.0 ],
									"prototypename" : "bphelp",
									"varname" : "maxhelpui",
									"viewvisibility" : 1
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-35",
									"maxclass" : "panel",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 585.0, 550.0, 480.0, 165.0 ],
									"style" : ""
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-18", 1 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-15", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-18", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-15", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-15", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-21", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 30.0, 40.0, 82.0, 21.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"fontname" : "Lato Light",
						"fontsize" : 14.0,
						"globalpatchername" : "",
						"style" : "",
						"tags" : ""
					}
,
					"style" : "",
					"text" : "p Introduction"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-20",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 110.0, 165.0, 52.0, 21.0 ],
					"style" : "",
					"text" : "onecopy"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-2",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
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
						"rect" : [ 0.0, 26.0, 1292.0, 745.0 ],
						"bglocked" : 0,
						"openinpresentation" : 1,
						"default_fontsize" : 10.0,
						"default_fontface" : 0,
						"default_fontname" : "Verdana",
						"gridonopen" : 2,
						"gridsize" : [ 5.0, 5.0 ],
						"gridsnaponopen" : 2,
						"objectsnaponopen" : 0,
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
						"enablevscroll" : 0,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"style" : "",
						"subpatcher_template" : "",
						"showontab" : 1,
						"boxes" : [ 							{
								"box" : 								{
									"fontname" : "Lato Regular",
									"fontsize" : 18.0,
									"id" : "obj-18",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 1094.0, 78.0, 110.0, 50.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 1105.0, 80.0, 114.0, 28.0 ],
									"style" : "",
									"text" : "Spatial Audio"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-3",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 962.5, 647.0, 79.0, 21.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 1135.0, 195.0, 81.0, 21.0 ],
									"style" : "",
									"text" : "Ambisonics"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-30",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 17.0, 462.176483, 132.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 15.0, 540.0, 122.0, 23.0 ],
									"style" : "",
									"text" : "j.remote"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-135",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 84.0, 445.0, 122.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 15.0, 515.0, 111.0, 23.0 ],
									"style" : "",
									"text" : "j.ui"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-2",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 35.0, 639.0, 131.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 15.0, 140.0, 122.0, 23.0 ],
									"style" : "",
									"text" : "j.view"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-131",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 225.0, 655.0, 132.0, 22.0 ],
									"style" : "",
									"text" : "sprintf load %s.maxpat"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Verdana",
									"fontsize" : 10.0,
									"id" : "obj-214",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 895.0, 588.0, 141.0, 21.0 ],
									"style" : "",
									"text" : "fromsymbol @separator *"
								}

							}
, 							{
								"box" : 								{
									"button" : 1,
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"htabcolor" : [ 0.376471, 0.384314, 0.4, 1.0 ],
									"id" : "obj-213",
									"maxclass" : "tab",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "int", "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 1041.0, 152.0, 109.0, 355.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 915.0, 115.0, 146.0, 620.0 ],
									"rounded" : 10.0,
									"spacing_y" : 6.0,
									"style" : "",
									"tabcolor" : [ 0.376471, 0.384314, 0.4, 1.0 ],
									"tabs" : [ "j.allpass~", "j.array~", "j.average~", "j.balance~", "j.clip~", "j.dcblock~", "j.degrade~", "j.delay~", "j.filter~", "j.function~", "j.hmlshelf~", "j.limiter~", "j.mutesolo~", "j.onepole~", "j.op~", "j.overdrive~", "j.panorama~", "j.ramp~", "j.receive~", "j.send~", "j.thru~", "j.unit~", "j.waveshaper~", "j.xfade~", "j.zerox~", "j~" ],
									"textcolor" : [ 0.862745, 0.870588, 0.878431, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-252",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patcher" : 									{
										"fileversion" : 1,
										"appversion" : 										{
											"major" : 7,
											"minor" : 1,
											"revision" : 0,
											"architecture" : "x86",
											"modernui" : 1
										}
,
										"rect" : [ 300.0, 94.0, 910.0, 938.0 ],
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
													"id" : "obj-12",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patcher" : 													{
														"fileversion" : 1,
														"appversion" : 														{
															"major" : 7,
															"minor" : 1,
															"revision" : 0,
															"architecture" : "x86",
															"modernui" : 1
														}
,
														"rect" : [ 505.0, 128.0, 640.0, 480.0 ],
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
														"boxes" : [ 															{
																"box" : 																{
																	"comment" : "",
																	"id" : "obj-4",
																	"maxclass" : "outlet",
																	"numinlets" : 1,
																	"numoutlets" : 0,
																	"patching_rect" : [ 304.0, 405.0, 25.0, 25.0 ],
																	"style" : ""
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
																	"patching_rect" : [ 216.0, 63.0, 25.0, 25.0 ],
																	"style" : ""
																}

															}
, 															{
																"box" : 																{
																	"fontname" : "Arial",
																	"fontsize" : 12.0,
																	"id" : "obj-11",
																	"maxclass" : "newobj",
																	"numinlets" : 2,
																	"numoutlets" : 2,
																	"outlettype" : [ "bang", "" ],
																	"patching_rect" : [ 216.0, 177.0, 113.0, 22.0 ],
																	"style" : "",
																	"text" : "sel j.audiounit="
																}

															}
 ],
														"lines" : [ 															{
																"patchline" : 																{
																	"destination" : [ "obj-4", 0 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-11", 1 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-11", 0 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-3", 0 ]
																}

															}
 ]
													}
,
													"patching_rect" : [ 395.0, 456.0, 73.0, 22.0 ],
													"saved_object_attributes" : 													{
														"description" : "",
														"digest" : "",
														"globalpatchername" : "",
														"style" : "",
														"tags" : ""
													}
,
													"style" : "",
													"text" : "p unwanted"
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
													"patching_rect" : [ 30.5, 559.0, 77.0, 22.0 ],
													"style" : "",
													"text" : "zl group 128"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-9",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 2,
													"outlettype" : [ "", "" ],
													"patching_rect" : [ 350.0, 540.0, 77.0, 22.0 ],
													"style" : "",
													"text" : "zl group 128"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-27",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 395.0, 483.0, 63.0, 22.0 ],
													"style" : "",
													"text" : "sprintf %s"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-26",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 30.5, 644.0, 81.0, 22.0 ],
													"style" : "",
													"text" : "prepend tabs"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-22",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 2,
													"outlettype" : [ "", "" ],
													"patching_rect" : [ 30.5, 617.0, 43.0, 22.0 ],
													"style" : "",
													"text" : "zl sort"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-19",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patcher" : 													{
														"fileversion" : 1,
														"appversion" : 														{
															"major" : 7,
															"minor" : 1,
															"revision" : 0,
															"architecture" : "x86",
															"modernui" : 1
														}
,
														"rect" : [ 50.0, 94.0, 640.0, 480.0 ],
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
														"boxes" : [ 															{
																"box" : 																{
																	"fontname" : "Arial",
																	"fontsize" : 12.0,
																	"id" : "obj-27",
																	"maxclass" : "newobj",
																	"numinlets" : 1,
																	"numoutlets" : 1,
																	"outlettype" : [ "" ],
																	"patching_rect" : [ 340.0, 135.0, 63.0, 22.0 ],
																	"style" : "",
																	"text" : "sprintf %s"
																}

															}
, 															{
																"box" : 																{
																	"fontname" : "Arial",
																	"fontsize" : 12.0,
																	"id" : "obj-16",
																	"maxclass" : "newobj",
																	"numinlets" : 5,
																	"numoutlets" : 5,
																	"outlettype" : [ "", "", "", "", "" ],
																	"patching_rect" : [ 50.0, 100.0, 309.0, 22.0 ],
																	"style" : "",
																	"text" : "route j.vimic~ j.in~ j.out~ j.test.sample~"
																}

															}
, 															{
																"box" : 																{
																	"comment" : "",
																	"id" : "obj-17",
																	"maxclass" : "inlet",
																	"numinlets" : 0,
																	"numoutlets" : 1,
																	"outlettype" : [ "" ],
																	"patching_rect" : [ 50.0, 40.0, 25.0, 25.0 ],
																	"style" : ""
																}

															}
, 															{
																"box" : 																{
																	"comment" : "",
																	"id" : "obj-18",
																	"maxclass" : "outlet",
																	"numinlets" : 1,
																	"numoutlets" : 0,
																	"patching_rect" : [ 333.0, 180.0, 25.0, 25.0 ],
																	"style" : ""
																}

															}
 ],
														"lines" : [ 															{
																"patchline" : 																{
																	"destination" : [ "obj-27", 0 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-16", 4 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-16", 0 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-17", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-18", 0 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-27", 0 ]
																}

															}
 ]
													}
,
													"patching_rect" : [ 30.5, 514.0, 73.0, 22.0 ],
													"saved_object_attributes" : 													{
														"description" : "",
														"digest" : "",
														"globalpatchername" : "",
														"style" : "",
														"tags" : ""
													}
,
													"style" : "",
													"text" : "p unwanted"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-7",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patcher" : 													{
														"fileversion" : 1,
														"appversion" : 														{
															"major" : 7,
															"minor" : 1,
															"revision" : 0,
															"architecture" : "x86",
															"modernui" : 1
														}
,
														"rect" : [ 50.0, 94.0, 640.0, 480.0 ],
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
														"boxes" : [ 															{
																"box" : 																{
																	"fontname" : "Arial",
																	"fontsize" : 12.0,
																	"id" : "obj-9",
																	"maxclass" : "newobj",
																	"numinlets" : 1,
																	"numoutlets" : 1,
																	"outlettype" : [ "" ],
																	"patching_rect" : [ 50.0, 100.0, 189.0, 22.0 ],
																	"style" : "",
																	"text" : "prepend j.thru~"
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
																	"patching_rect" : [ 50.0, 40.0, 25.0, 25.0 ],
																	"style" : ""
																}

															}
, 															{
																"box" : 																{
																	"comment" : "",
																	"id" : "obj-21",
																	"maxclass" : "outlet",
																	"numinlets" : 1,
																	"numoutlets" : 0,
																	"patching_rect" : [ 50.0, 180.0, 25.0, 25.0 ],
																	"style" : ""
																}

															}
 ],
														"lines" : [ 															{
																"patchline" : 																{
																	"destination" : [ "obj-9", 0 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-20", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-21", 0 ],
																	"disabled" : 0,
																	"hidden" : 0,
																	"source" : [ "obj-9", 0 ]
																}

															}
 ]
													}
,
													"patching_rect" : [ 30.5, 591.0, 59.0, 22.0 ],
													"saved_object_attributes" : 													{
														"description" : "",
														"digest" : "",
														"globalpatchername" : "",
														"style" : "",
														"tags" : ""
													}
,
													"style" : "",
													"text" : "p wanted"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Verdana",
													"fontsize" : 10.0,
													"id" : "obj-6",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 5,
													"outlettype" : [ "", "", "", "", "" ],
													"patching_rect" : [ 30.5, 483.0, 187.0, 21.0 ],
													"style" : "",
													"text" : "regexp (~.maxhelp) @substitute ~"
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-4",
													"maxclass" : "outlet",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 30.5, 671.0, 25.0, 25.0 ],
													"style" : ""
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-90",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "bang" ],
													"patching_rect" : [ 52.0, 100.0, 60.0, 22.0 ],
													"style" : "",
													"text" : "loadbang"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-89",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 481.0, 473.0, 45.0, 22.0 ],
													"style" : "",
													"text" : "zlclear"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-87",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "bang" ],
													"patching_rect" : [ 436.0, 405.0, 50.0, 22.0 ],
													"style" : "",
													"text" : "del 100"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-83",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 453.0, 308.0, 32.5, 22.0 ],
													"style" : "",
													"text" : "106"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-74",
													"maxclass" : "button",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "bang" ],
													"patching_rect" : [ 436.0, 430.0, 20.0, 20.0 ],
													"style" : ""
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-67",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 3,
													"outlettype" : [ "bang", "bang", "int" ],
													"patching_rect" : [ 453.0, 350.0, 48.0, 22.0 ],
													"style" : "",
													"text" : "uzi 8 0"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-66",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 350.0, 591.0, 81.0, 22.0 ],
													"style" : "",
													"text" : "prepend tabs"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Verdana",
													"fontsize" : 10.0,
													"id" : "obj-36",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 2,
													"outlettype" : [ "", "" ],
													"patching_rect" : [ 97.0, 369.0, 54.0, 21.0 ],
													"style" : "",
													"text" : "zl ecils 1"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Verdana",
													"fontsize" : 10.0,
													"id" : "obj-37",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 97.0, 348.0, 139.0, 21.0 ],
													"style" : "",
													"text" : "fromsymbol @separator /"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Verdana",
													"fontsize" : 10.0,
													"id" : "obj-44",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 2,
													"outlettype" : [ "", "" ],
													"patching_rect" : [ 254.0, 353.0, 69.0, 21.0 ],
													"style" : "",
													"text" : "route count"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Verdana",
													"fontsize" : 10.0,
													"id" : "obj-34",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 5,
													"outlettype" : [ "", "", "", "", "" ],
													"patching_rect" : [ 131.0, 391.0, 187.0, 21.0 ],
													"style" : "",
													"text" : "regexp (=.maxhelp) @substitute ="
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Verdana",
													"fontsize" : 10.0,
													"id" : "obj-24",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 3,
													"outlettype" : [ "count", "", "clear" ],
													"patching_rect" : [ 53.0, 170.0, 304.0, 21.0 ],
													"style" : "",
													"text" : "t count l clear"
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
													"patching_rect" : [ 196.0, 265.0, 87.0, 22.0 ],
													"style" : "",
													"text" : "prepend prefix"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-8",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 196.0, 239.0, 131.0, 22.0 ],
													"style" : "",
													"text" : "tosymbol @separator /"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Verdana",
													"fontsize" : 10.0,
													"id" : "obj-2",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 2,
													"outlettype" : [ "", "" ],
													"patching_rect" : [ 196.0, 215.0, 54.0, 21.0 ],
													"style" : "",
													"text" : "zl ecils 1"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Verdana",
													"fontsize" : 10.0,
													"id" : "obj-5",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 196.0, 194.0, 139.0, 21.0 ],
													"style" : "",
													"text" : "fromsymbol @separator /"
												}

											}
, 											{
												"box" : 												{
													"allowdrag" : 0,
													"autopopulate" : 1,
													"depth" : 6,
													"fontname" : "Verdana",
													"fontsize" : 11.0,
													"id" : "obj-59",
													"items" : [ "cue_conventions.maxpat", ",", "j._external_template.maxhelp", ",", "j.adsr=.maxhelp", ",", "j.allpass~.maxhelp", ",", "j.array=.maxhelp", ",", "j.array~.maxhelp", ",", "j.attrParameters.helper.maxpat", ",", "j.average=.maxhelp", ",", "j.average~.maxhelp", ",", "j.balance~.maxhelp", ",", "j.clip=.maxhelp", ",", "j.clip~.maxhelp", ",", "j.count=.maxhelp", ",", "j.cubicInterpolate.maxhelp", ",", "j.cue.maxhelp", ",", "j.dbap.maxhelp", ",", "j.dbap_bformat.maxhelp", ",", "j.dcblock=.maxhelp", ",", "j.dcblock~.maxhelp", ",", "j.degrade=.maxhelp", ",", "j.degrade~.maxhelp", ",", "j.delay=.maxhelp", ",", "j.delay~.maxhelp", ",", "j.delta.maxhelp", ",", "j.envexp.maxhelp", ",", "j.fft=.maxhelp", ",", "j.filter=.maxhelp", ",", "j.filter~-benchmark.maxpat", ",", "j.filter~.maxhelp", ",", "j.folder.maxhelp", ",", "j.function~.maxhelp", ",", "j.gain=.maxhelp", ",", "j.gainParameters.helper.maxpat", ",", "j.gang.maxhelp", ",", "j.get_onscreen_position.maxhelp", ",", "j.get_range.js.maxpat", ",", "j.hmlshelf~.maxhelp", ",", "j.in.maxhelp", ",", "j.info=.maxhelp", ",", "j.init.maxhelp", ",", "j.in~.maxhelp", ",", "j.join=.maxhelp", ",", "j.js_systeminfo.maxhelp", ",", "j.jsui_multigain.maxhelp", ",", "j.limiter=.maxhelp", ",", "j.limiter~.maxhelp", ",", "j.map.functions.maxpat", ",", "j.map.maxhelp", ",", "j.maxhelp", ",", "j.message.maxhelp", ",", "j.message_array.maxhelp", ",", "j.minuit_device.maxhelp", ",", "j.mixer=.maxhelp", ",", "j.mkdir.maxpat", ",", "j.model.maxhelp", ",", "j.modular.maxhelp", ",", "j.multimixer=.maxhelp", ",", "j.mutesolo=.maxhelp", ",", "j.mutesolo~.maxhelp", ",", "j.namespace.maxhelp", ",", "j.namespace_explorator.maxhelp", ",", "j.namespacebrowser.view.maxhelp", ",", "j.node.maxhelp", ",", "j.noise=.maxhelp", ",", "j.offset=.maxhelp", ",", "j.onepole~.maxhelp", ",", "j.op=.maxhelp", ",", "j.op~.maxhelp", ",", "j.oscinstance.maxhelp", ",", "j.oscroute.maxhelp", ",", "j.out.maxhelp", ",", "j.out~.maxhelp", ",", "j.overdrive=.maxhelp", ",", "j.overdrive~.maxhelp", ",", "j.pack=.maxhelp", ",", "j.panorama~.maxhelp", ",", "j.parameter.maxhelp", ",", "j.parameter_array.maxhelp", ",", "j.pass.maxhelp", ",", "j.phasor=.maxhelp", ",", "j.pick=.maxhelp", ",", "j.presetParameters.helper.maxpat", ",", "j.pulsesub=.maxhelp", ",", "j.push.maxhelp", ",", "j.ramp.maxhelp", ",", "j.ramp=.maxhelp", ",", "j.ramp~.maxhelp", ",", "j.receive.maxhelp", ",", "j.receive~.maxhelp", ",", "j.remote.maxhelp", ",", "j.remote_Array.maxhelp", ",", "j.remote_menu.maxhelp", ",", "j.resample=.maxhelp", ",", "j.return.maxhelp", ",", "j.return_array.maxhelp", ",", "j.route.maxhelp", ",", "j.savebang.maxhelp", ",", "j.score.maxhelp", ",", "j.scriptingUtilities.js.maxhelp", ",", "j.send.maxhelp", ",", "j.send~.maxhelp", ",", "j.sig=.maxhelp", ",", "j.soundfile.player=.maxhelp", ",", "j.soundfile.recorder=.maxhelp", ",", "j.spat=.maxhelp", ",", "j.SpatDIF.coordinates.maxpat", ",", "j.split=.maxhelp", ",", "j.stats.maxhelp", ",", "j.stickyPatcherWindow.js.maxhelp", ",", "j.test.sample~.maxhelp", ",", "j.textslider.maxhelp", ",", "j.trajectory=.maxhelp", ",", "j.truncate_string.js.maxpat", ",", "j.ui.maxhelp", ",", "j.unfocus.maxhelp", ",", "j.unit.maxhelp", ",", "j.unit~.maxhelp", ",", "j.unpack=.maxhelp", ",", "j.unsig=.maxhelp", ",", "j.view.maxhelp", ",", "j.vimic~.maxhelp", ",", "j.waveshaper=.maxhelp", ",", "j.waveshaper~.maxhelp", ",", "j.wavetable=.maxhelp", ",", "j.window=.maxhelp", ",", "j.xfade~.maxhelp", ",", "j.zerox~.maxhelp", ",", "j=.maxhelp", ",", "j~.maxhelp" ],
													"maxclass" : "umenu",
													"numinlets" : 1,
													"numoutlets" : 3,
													"outlettype" : [ "int", "", "" ],
													"parameter_enable" : 0,
													"patching_rect" : [ 50.0, 324.0, 224.0, 22.0 ],
													"prefix" : "Macintosh HD:/Users/WALL-E/Documents/Developpements/Jamoma/Max/Jamoma/help/",
													"style" : "",
													"types" : "JSON"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Helvetica Neue Light",
													"fontsize" : 13.0,
													"id" : "obj-3",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 53.0, 121.0, 147.0, 24.0 ],
													"style" : "",
													"text" : "j.degrade~.maxhelp"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Helvetica Neue Light",
													"fontsize" : 13.0,
													"id" : "obj-1",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 54.0, 145.0, 85.0, 24.0 ],
													"style" : "",
													"text" : "absolutepath"
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-91",
													"maxclass" : "outlet",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 350.0, 671.0, 25.0, 25.0 ],
													"style" : ""
												}

											}
 ],
										"lines" : [ 											{
												"patchline" : 												{
													"destination" : [ "obj-24", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-1", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-59", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-10", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-27", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-12", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-7", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-14", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-14", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"midpoints" : [ 40.0, 543.0, 40.0, 543.0 ],
													"source" : [ "obj-19", 0 ]
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
													"destination" : [ "obj-26", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-22", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-5", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-24", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-59", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-24", 2 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-59", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-24", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-4", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-26", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-9", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-27", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-1", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-3", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-12", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-34", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-6", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-34", 3 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-34", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-36", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-36", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-37", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-67", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-44", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-2", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-5", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-37", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-59", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-44", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-59", 2 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-19", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-6", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-91", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-66", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-59", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-67", 2 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-87", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-67", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-22", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-7", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-14", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-74", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-9", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-74", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-10", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-8", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-67", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-83", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-74", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-87", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-14", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-89", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-9", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-89", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-66", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-9", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-3", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-90", 0 ]
												}

											}
 ]
									}
,
									"patching_rect" : [ 1041.0, 117.0, 81.0, 22.0 ],
									"saved_object_attributes" : 									{
										"description" : "",
										"digest" : "",
										"globalpatchername" : "",
										"style" : "",
										"tags" : ""
									}
,
									"style" : "",
									"text" : "p create--Tab"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-194",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 315.0, 315.0, 63.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 520.0, 315.0, 137.0, 23.0 ],
									"style" : "",
									"text" : "j.push"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-174",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 1172.0, 640.0, 114.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 1102.5, 140.0, 134.0, 23.0 ],
									"style" : "",
									"text" : "j.dbap_bformat"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Regular",
									"fontsize" : 12.0,
									"id" : "obj-71",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 210.0, 114.0, 421.0, 35.0 ],
									"presentation" : 1,
									"presentation_linecount" : 2,
									"presentation_rect" : [ 880.0, 16.5, 379.0, 35.0 ],
									"style" : "",
									"text" : "The Jamoma \"components\" are building-blocks useful for constructing models, managing systems, or processing audio/video/data.",
									"textcolor" : [ 0.298039, 0.298039, 0.298039, 1.0 ],
									"textjustification" : 2
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-243",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 850.0, 305.0, 107.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 720.0, 165.0, 143.0, 23.0 ],
									"style" : "",
									"text" : "j.autoexpose%"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Verdana",
									"fontsize" : 10.0,
									"hidden" : 1,
									"id" : "obj-218",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 1320.0, 750.0, 74.0, 21.0 ],
									"style" : "",
									"text" : "prepend help"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Verdana",
									"fontsize" : 10.0,
									"hidden" : 1,
									"id" : "obj-219",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 1320.0, 774.0, 49.0, 21.0 ],
									"style" : "",
									"text" : "pcontrol"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-15",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 350.0, 255.0, 61.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 520.0, 415.0, 138.0, 23.0 ],
									"style" : "",
									"text" : "j.qom"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-156",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 1162.0, 690.0, 133.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 1102.5, 165.0, 125.0, 23.0 ],
									"style" : "",
									"text" : "j.vimic~"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-136",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 595.0, 515.0, 122.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 345.0, 515.0, 138.0, 23.0 ],
									"style" : "",
									"text" : "j.post"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-134",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 595.0, 535.0, 110.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 345.0, 440.0, 138.0, 23.0 ],
									"style" : "",
									"text" : "j.message.array"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-133",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 590.0, 500.0, 129.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 345.0, 490.0, 141.0, 23.0 ],
									"style" : "",
									"text" : "j.parameter_create"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-192",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 1050.0, 640.0, 116.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 345.0, 390.0, 138.0, 23.0 ],
									"style" : "",
									"text" : "j.js_systeminfo.js"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-132",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 1046.0, 520.0, 141.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 345.0, 215.0, 142.0, 23.0 ],
									"style" : "",
									"text" : "j.folder"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-140",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 1161.0, 712.0, 141.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 1102.5, 115.0, 133.0, 23.0 ],
									"style" : "",
									"text" : "j.dbap"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-142",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 1045.0, 562.0, 141.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 170.0, 265.0, 143.0, 23.0 ],
									"style" : "",
									"text" : "j.oscinstance"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-151",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 216.0, 595.0, 139.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 345.0, 465.0, 138.0, 23.0 ],
									"style" : "",
									"text" : "j.metro"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-159",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 1046.0, 540.0, 137.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 345.0, 265.0, 134.0, 23.0 ],
									"style" : "",
									"text" : "j.gang"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Regular",
									"fontsize" : 18.0,
									"id" : "obj-161",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 1020.0, 80.0, 110.0, 28.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 915.0, 80.0, 57.0, 28.0 ],
									"style" : "",
									"text" : "Audio"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Verdana",
									"fontsize" : 10.0,
									"hidden" : 1,
									"id" : "obj-162",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 958.0, 621.0, 74.0, 21.0 ],
									"style" : "",
									"text" : "prepend help"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Verdana",
									"fontsize" : 10.0,
									"hidden" : 1,
									"id" : "obj-163",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 958.0, 641.0, 49.0, 21.0 ],
									"style" : "",
									"text" : "pcontrol"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-164",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 1045.0, 582.0, 142.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 170.0, 290.0, 142.0, 23.0 ],
									"style" : "",
									"text" : "j.oscroute"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-166",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 1045.0, 601.0, 138.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 170.0, 315.0, 138.0, 23.0 ],
									"style" : "",
									"text" : "j.pass"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-73",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 69.0, 605.0, 129.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 15.0, 490.0, 119.0, 23.0 ],
									"style" : "",
									"text" : "j.send~"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-94",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 35.0, 505.0, 129.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 15.0, 390.0, 119.0, 23.0 ],
									"style" : "",
									"text" : "j.receive"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-95",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 60.0, 585.0, 132.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 15.0, 465.0, 122.0, 23.0 ],
									"style" : "",
									"text" : "j.send"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Verdana",
									"fontsize" : 10.0,
									"hidden" : 1,
									"id" : "obj-96",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 134.5, 675.0, 74.0, 21.0 ],
									"style" : "",
									"text" : "prepend help"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Verdana",
									"fontsize" : 10.0,
									"hidden" : 1,
									"id" : "obj-97",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 134.5, 695.0, 49.0, 21.0 ],
									"style" : "",
									"text" : "pcontrol"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Regular",
									"fontsize" : 18.0,
									"id" : "obj-98",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 235.0, 147.0, 89.0, 28.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 17.0, 80.0, 88.0, 28.0 ],
									"style" : "",
									"text" : "Essentials"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-99",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 55.0, 565.0, 129.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 15.0, 440.0, 119.0, 23.0 ],
									"style" : "",
									"text" : "j.return"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-100",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 69.0, 545.0, 127.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 15.0, 415.0, 116.0, 23.0 ],
									"style" : "",
									"text" : "j.receive~"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-102",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 35.0, 485.0, 126.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 15.0, 365.0, 115.0, 23.0 ],
									"style" : "",
									"text" : "j.ramp"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-103",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 69.0, 465.0, 129.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 15.0, 340.0, 119.0, 23.0 ],
									"style" : "",
									"text" : "j.parameter_array"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-104",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 69.0, 425.0, 129.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 15.0, 314.888885, 119.0, 23.0 ],
									"style" : "",
									"text" : "j.parameter"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-105",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 69.0, 405.0, 125.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 15.0, 289.888885, 114.0, 23.0 ],
									"style" : "",
									"text" : "j.out~"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-106",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 69.0, 385.0, 128.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 15.0, 264.888885, 117.0, 23.0 ],
									"style" : "",
									"text" : "j.out"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-107",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 69.0, 365.0, 127.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 15.0, 239.888885, 116.0, 23.0 ],
									"style" : "",
									"text" : "j.message"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-108",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 70.0, 345.0, 128.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 15.0, 215.0, 117.0, 23.0 ],
									"style" : "",
									"text" : "j.init"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-109",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 70.0, 305.0, 122.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 15.0, 165.0, 111.0, 23.0 ],
									"style" : "",
									"text" : "j.in"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-110",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 55.0, 625.0, 119.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 15.0, 190.0, 111.0, 23.0 ],
									"style" : "",
									"text" : "j.in~"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-111",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 70.0, 285.0, 132.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 15.0, 115.0, 121.0, 23.0 ],
									"style" : "",
									"text" : "j.model"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-56",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 370.0, 295.0, 68.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 520.0, 240.0, 135.0, 23.0 ],
									"style" : "",
									"text" : "j.map"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-51",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 345.0, 275.0, 124.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 520.0, 165.0, 142.0, 23.0 ],
									"style" : "",
									"text" : "j.cubicInterpolate"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-52",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 295.0, 295.0, 68.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 520.0, 215.0, 138.0, 23.0 ],
									"style" : "",
									"text" : "j.delta"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-41",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 748.0, 513.0, 127.0, 35.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 515.0, 490.0, 167.0, 21.0 ],
									"style" : "",
									"text" : "ICST Ambimonitor Converter"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-36",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 495.0, 370.0, 107.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 345.0, 315.0, 139.0, 23.0 ],
									"style" : "",
									"text" : "j.initialized"
								}

							}
, 							{
								"box" : 								{
									"args" : [ "@name", "jamoma components", "@description", "Overview of components used in Jamoma" ],
									"bgmode" : 1,
									"border" : 0,
									"clickthrough" : 0,
									"enablehscroll" : 0,
									"enablevscroll" : 0,
									"id" : "obj-33",
									"lockeddragscroll" : 0,
									"maxclass" : "bpatcher",
									"name" : "j.maxhelpui.maxpat",
									"numinlets" : 1,
									"numoutlets" : 0,
									"offset" : [ 0.0, 0.0 ],
									"patching_rect" : [ 0.0, 0.0, 1275.0, 70.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 0.0, 0.0, 1275.0, 68.0 ],
									"prototypename" : "bphelp",
									"varname" : "maxhelpui",
									"viewvisibility" : 1
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-87",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 851.0, 321.0, 122.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 720.0, 440.0, 140.0, 23.0 ],
									"style" : "",
									"text" : "j.passmatrixinfo%"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-86",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 863.0, 380.0, 87.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 720.0, 390.0, 141.0, 23.0 ],
									"style" : "",
									"text" : "j.motion%"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-85",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 831.0, 466.0, 75.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 720.0, 365.0, 138.0, 23.0 ],
									"style" : "",
									"text" : "j.mean%"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-84",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 495.0, 395.0, 100.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 345.0, 240.0, 142.0, 23.0 ],
									"style" : "",
									"text" : "j.fullscreen"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-83",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 841.0, 286.0, 87.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 720.0, 190.0, 136.0, 23.0 ],
									"style" : "",
									"text" : "j.binary%"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-82",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 845.0, 360.0, 97.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 720.0, 315.0, 140.0, 23.0 ],
									"style" : "",
									"text" : "j.fullscreen%"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-80",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 240.0, 270.0, 98.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 520.0, 340.0, 139.0, 23.0 ],
									"style" : "",
									"text" : "j.random"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-79",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 235.0, 250.0, 100.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 520.0, 365.0, 141.0, 23.0 ],
									"style" : "",
									"text" : "j.randomizer"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Regular",
									"fontsize" : 18.0,
									"id" : "obj-78",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 225.0, 200.0, 155.0, 50.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 509.0, 80.0, 171.0, 28.0 ],
									"style" : "",
									"text" : "Math & Conversions"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-77",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 831.0, 426.0, 114.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 720.0, 490.0, 137.0, 23.0 ],
									"style" : "",
									"text" : "j.qom%"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-66",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 736.0, 486.0, 132.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 720.0, 415.0, 141.0, 23.0 ],
									"style" : "",
									"text" : "j.noiseremoval%"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-76",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 736.0, 466.0, 68.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 720.0, 565.0, 134.0, 23.0 ],
									"style" : "",
									"text" : "j.sum%"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-58",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 490.0, 615.0, 107.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 345.0, 365.0, 137.0, 23.0 ],
									"style" : "",
									"text" : "j.jamomaPath"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-13",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 495.0, 595.0, 139.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 345.0, 290.0, 137.0, 23.0 ],
									"style" : "",
									"text" : "j.idle"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-5",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 490.0, 575.0, 144.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 345.0, 340.0, 142.0, 23.0 ],
									"style" : "",
									"text" : "j.instance2instance"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 235.0, 495.0, 134.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 170.0, 115.0, 146.0, 23.0 ],
									"style" : "",
									"text" : "j.get_attributes"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-29",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 235.0, 230.0, 94.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 520.0, 390.0, 135.0, 23.0 ],
									"style" : "",
									"text" : "j.stats"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-54",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 490.0, 535.0, 98.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 345.0, 140.0, 139.0, 23.0 ],
									"style" : "",
									"text" : "j.datetime"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Regular",
									"fontsize" : 18.0,
									"id" : "obj-53",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 746.0, 166.0, 150.0, 28.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 7.0, 620.5, 115.0, 28.0 ],
									"style" : "",
									"text" : "Special guest"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-39",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 746.0, 196.0, 99.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 15.0, 655.0, 144.0, 23.0 ],
									"style" : "",
									"text" : "j.eno"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-31",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 490.0, 515.0, 95.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 520.0, 265.0, 135.0, 23.0 ],
									"style" : "",
									"text" : "j.op"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Verdana",
									"fontsize" : 10.0,
									"hidden" : 1,
									"id" : "obj-115",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 863.0, 117.0, 67.0, 21.0 ],
									"save" : [ "#N", "thispatcher", ";", "#Q", "end", ";" ],
									"style" : "",
									"text" : "thispatcher"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Verdana",
									"fontsize" : 10.0,
									"hidden" : 1,
									"id" : "obj-114",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 863.0, 93.0, 35.0, 21.0 ],
									"style" : "",
									"text" : "front"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"hidden" : 1,
									"id" : "obj-112",
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 863.0, 63.0, 25.0, 25.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 736.0, 364.0, 68.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 720.0, 265.0, 137.0, 23.0 ],
									"style" : "",
									"text" : "j.crop%"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-6",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 750.0, 571.0, 119.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 1102.5, 220.0, 139.0, 23.0 ],
									"style" : "",
									"text" : "j.sur.ambi2UHJ~"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 750.0, 588.0, 117.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 1102.5, 245.0, 138.0, 23.0 ],
									"style" : "",
									"text" : "j.sur.UHJ2ambi~"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-8",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 746.0, 556.0, 128.0, 21.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 1102.5, 190.0, 128.0, 21.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-9",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 235.0, 370.0, 130.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 170.0, 140.0, 148.0, 23.0 ],
									"style" : "",
									"text" : "j.get_modules"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-10",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 235.0, 395.0, 135.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 170.0, 165.0, 145.0, 23.0 ],
									"style" : "",
									"text" : "j.get_messages"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-11",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 235.0, 420.0, 143.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 170.0, 190.0, 143.0, 23.0 ],
									"style" : "",
									"text" : "j.get_parameters"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-12",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 235.0, 445.0, 125.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 170.0, 215.0, 144.0, 23.0 ],
									"style" : "",
									"text" : "j.get_returns"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-14",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 235.0, 470.0, 125.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 170.0, 240.0, 147.0, 23.0 ],
									"style" : "",
									"text" : "j.get_attribute_value"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Regular",
									"fontsize" : 18.0,
									"id" : "obj-16",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 215.0, 330.0, 194.0, 28.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 173.0, 80.0, 107.0, 28.0 ],
									"style" : "",
									"text" : "Namespace "
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-17",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 495.0, 295.0, 87.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 345.0, 115.0, 140.0, 23.0 ],
									"style" : "",
									"text" : "j.cpuTimer"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-19",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 736.0, 423.0, 73.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 720.0, 540.0, 135.0, 23.0 ],
									"style" : "",
									"text" : "j.spray%"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-20",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 830.0, 345.0, 98.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 720.0, 290.0, 142.0, 23.0 ],
									"style" : "",
									"text" : "j.float2char%"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-21",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 735.0, 345.0, 98.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 720.0, 215.0, 142.0, 23.0 ],
									"style" : "",
									"text" : "j.char2float%"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Regular",
									"fontsize" : 18.0,
									"id" : "obj-23",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 728.0, 233.0, 157.0, 28.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 722.0, 80.0, 57.0, 28.0 ],
									"style" : "",
									"text" : "Video"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-24",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 490.0, 420.0, 112.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 345.0, 415.0, 140.0, 23.0 ],
									"style" : "",
									"text" : "j.list2parameter"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-25",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 735.0, 325.0, 108.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 720.0, 240.0, 142.0, 23.0 ],
									"style" : "",
									"text" : "j.checkplanes%"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-26",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 824.0, 403.0, 94.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 720.0, 340.0, 140.0, 23.0 ],
									"style" : "",
									"text" : "j.luma2rgb%"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-27",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 736.0, 403.0, 94.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 720.0, 515.0, 140.0, 23.0 ],
									"style" : "",
									"text" : "j.rgb2luma%"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Verdana",
									"fontsize" : 10.0,
									"hidden" : 1,
									"id" : "obj-37",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 658.0, 439.0, 74.0, 21.0 ],
									"style" : "",
									"text" : "prepend help"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Verdana",
									"fontsize" : 10.0,
									"hidden" : 1,
									"id" : "obj-38",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 658.0, 463.0, 49.0, 21.0 ],
									"style" : "",
									"text" : "pcontrol"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-40",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 959.0, 669.0, 89.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 520.0, 190.0, 136.0, 23.0 ],
									"style" : "",
									"text" : "j.unit"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Verdana",
									"fontsize" : 10.0,
									"id" : "obj-43",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 490.0, 689.0, 90.0, 21.0 ],
									"style" : "",
									"text" : "j.multi.out~"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Verdana",
									"fontsize" : 10.0,
									"id" : "obj-44",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 490.0, 671.0, 83.0, 21.0 ],
									"style" : "",
									"text" : "j.multi.in~"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Verdana",
									"fontsize" : 10.0,
									"id" : "obj-45",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 483.0, 655.0, 195.0, 19.0 ],
									"style" : "",
									"text" : "Audio multi cable:"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Verdana",
									"fontsize" : 10.0,
									"hidden" : 1,
									"id" : "obj-47",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 399.0, 625.0, 74.0, 21.0 ],
									"style" : "",
									"text" : "prepend help"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Verdana",
									"fontsize" : 10.0,
									"hidden" : 1,
									"id" : "obj-48",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 399.0, 649.0, 49.0, 21.0 ],
									"style" : "",
									"text" : "pcontrol"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Regular",
									"fontsize" : 18.0,
									"id" : "obj-50",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 460.0, 197.0, 200.0, 28.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 347.0, 80.0, 71.0, 28.0 ],
									"style" : "",
									"text" : "Utilities"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-57",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 490.0, 438.0, 60.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 345.0, 540.0, 140.0, 23.0 ],
									"style" : "",
									"text" : "j.route"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-60",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 495.0, 331.0, 94.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 345.0, 190.0, 142.0, 23.0 ],
									"style" : "",
									"text" : "j.filewatcher"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-61",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 495.0, 313.0, 79.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 345.0, 165.0, 139.0, 23.0 ],
									"style" : "",
									"text" : "j.filesaver"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-62",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 735.0, 306.0, 88.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 720.0, 140.0, 139.0, 23.0 ],
									"style" : "",
									"text" : "j.autosize%"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-63",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 495.0, 277.0, 85.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 520.0, 140.0, 141.0, 23.0 ],
									"style" : "",
									"text" : "j.autoscale"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-64",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 736.0, 383.0, 121.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 720.0, 465.0, 146.0, 23.0 ],
									"style" : "",
									"text" : "j.pwindow.mouse"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-65",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 240.0, 290.0, 43.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 520.0, 290.0, 130.0, 23.0 ],
									"style" : "",
									"text" : "j.pi"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-67",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 735.0, 288.0, 91.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 720.0, 115.0, 142.0, 23.0 ],
									"style" : "",
									"text" : "j.autocrop%"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-68",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 958.0, 710.0, 152.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 520.0, 515.0, 153.0, 23.0 ],
									"style" : "",
									"text" : "j.ambimonitor2position"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-69",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 959.0, 687.0, 152.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 520.0, 540.0, 152.0, 23.0 ],
									"style" : "",
									"text" : "j.position2ambimonitor"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"id" : "obj-70",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 495.0, 259.0, 72.0, 23.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 520.0, 115.0, 142.0, 23.0 ],
									"style" : "",
									"text" : "j.absdiff"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-37", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-10", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-96", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-100", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-96", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-102", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-96", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-103", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-96", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-104", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-96", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-105", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-96", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-106", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-96", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-107", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-96", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-108", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-96", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-109", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-11", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-96", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-110", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-96", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-111", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-114", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-112", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-115", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-114", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-12", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-13", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-97", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-131", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-162", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-132", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-133", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-134", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-96", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-135", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-136", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-14", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-162", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-140", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-162", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-142", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-15", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-96", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-151", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-162", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-156", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-162", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-159", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-163", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-162", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-162", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-164", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-162", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-166", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-17", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-162", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-174", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-37", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-19", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-162", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-192", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-194", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-96", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-2", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-37", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-20", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-37", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-21", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-214", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-213", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-162", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-214", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-219", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-218", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-24", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-37", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-243", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-37", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-25", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-213", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-252", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-37", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-26", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-37", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-27", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-29", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-96", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-30", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-31", 0 ]
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
									"destination" : [ "obj-38", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-37", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-37", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-39", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-4", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-162", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-40", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-43", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-44", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-48", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-47", 0 ]
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
									"destination" : [ "obj-47", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-51", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-52", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-54", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-56", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-57", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-58", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-37", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-6", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-60", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-61", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-37", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-62", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-63", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-37", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-64", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-65", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-37", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-66", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-37", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-67", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-162", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-68", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-162", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-69", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-37", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-7", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-70", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-96", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-73", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-37", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-76", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-37", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-77", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-79", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-80", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-37", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-82", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-37", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-83", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-84", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-37", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-85", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-37", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-86", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-37", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-87", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-9", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-96", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-94", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-96", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-95", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-97", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-96", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-96", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-99", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 65.333374, 100.0, 83.0, 21.0 ],
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
					"style" : "",
					"text" : "p Components"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-4",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
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
						"rect" : [ 139.0, 269.0, 1292.0, 745.0 ],
						"bglocked" : 0,
						"openinpresentation" : 1,
						"default_fontsize" : 10.0,
						"default_fontface" : 0,
						"default_fontname" : "Verdana",
						"gridonopen" : 2,
						"gridsize" : [ 10.0, 10.0 ],
						"gridsnaponopen" : 2,
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
						"enablehscroll" : 0,
						"enablevscroll" : 0,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"style" : "",
						"subpatcher_template" : "",
						"showontab" : 1,
						"boxes" : [ 							{
								"box" : 								{
									"fontname" : "Verdana",
									"fontsize" : 10.0,
									"id" : "obj-14",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 140.0, 270.0, 120.0, 21.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 140.0, 270.0, 120.0, 21.0 ],
									"style" : "",
									"text" : "working with wildcard"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Verdana",
									"fontsize" : 10.0,
									"id" : "obj-12",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 140.0, 240.0, 96.0, 21.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 140.0, 240.0, 96.0, 21.0 ],
									"style" : "",
									"text" : "model in and out"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Verdana",
									"fontsize" : 10.0,
									"id" : "obj-11",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 140.0, 210.0, 110.0, 21.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 140.0, 210.0, 110.0, 21.0 ],
									"style" : "",
									"text" : "listen to live stream"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-10",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 140.0, 150.0, 126.0, 21.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 140.0, 150.0, 126.0, 21.0 ],
									"style" : "",
									"text" : "addressing parameters"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Verdana",
									"fontsize" : 10.0,
									"id" : "obj-8",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 280.0, 210.0, 40.0, 21.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 280.0, 210.0, 40.0, 21.0 ],
									"style" : "",
									"text" : "shade"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-7",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 20.0, 150.0, 71.0, 21.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 20.0, 150.0, 71.0, 21.0 ],
									"style" : "",
									"text" : "introduction"
								}

							}
, 							{
								"box" : 								{
									"fontface" : 1,
									"fontname" : "Lato Regular",
									"fontsize" : 18.0,
									"id" : "obj-4",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 20.0, 110.0, 110.0, 28.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 20.0, 110.0, 110.0, 28.0 ],
									"style" : "",
									"text" : "Introduction"
								}

							}
, 							{
								"box" : 								{
									"fontface" : 1,
									"fontname" : "Lato Regular",
									"fontsize" : 18.0,
									"id" : "obj-2",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 140.0, 110.0, 130.0, 28.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 140.0, 110.0, 130.0, 28.0 ],
									"style" : "",
									"text" : "Model features"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Verdana",
									"fontsize" : 10.0,
									"id" : "obj-1",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 280.0, 180.0, 146.0, 21.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 280.0, 180.0, 146.0, 21.0 ],
									"style" : "",
									"text" : "model and view separation"
								}

							}
, 							{
								"box" : 								{
									"fontface" : 1,
									"fontname" : "Lato Regular",
									"fontsize" : 18.0,
									"id" : "obj-13",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 280.0, 110.0, 120.0, 28.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 280.0, 110.0, 120.0, 28.0 ],
									"style" : "",
									"text" : "View features"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Verdana",
									"fontsize" : 10.0,
									"id" : "obj-21",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 280.0, 150.0, 69.0, 21.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 280.0, 150.0, 69.0, 21.0 ],
									"style" : "",
									"text" : "highlighting"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Verdana",
									"fontsize" : 10.0,
									"hidden" : 1,
									"id" : "obj-23",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 140.0, 430.0, 56.0, 21.0 ],
									"style" : "",
									"text" : "tosymbol"
								}

							}
, 							{
								"box" : 								{
									"args" : [ "@name", "jamoma examples", "@description", "Overview of Jamoma's examples" ],
									"bgmode" : 1,
									"border" : 0,
									"clickthrough" : 0,
									"enablehscroll" : 0,
									"enablevscroll" : 0,
									"id" : "obj-3",
									"lockeddragscroll" : 0,
									"maxclass" : "bpatcher",
									"name" : "j.maxhelpui.maxpat",
									"numinlets" : 1,
									"numoutlets" : 0,
									"offset" : [ 0.0, 0.0 ],
									"patching_rect" : [ 0.0, 0.0, 1276.0, 70.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 0.0, 0.0, 650.0, 70.0 ],
									"prototypename" : "bphelp",
									"varname" : "maxhelpui",
									"viewvisibility" : 1
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Verdana",
									"fontsize" : 10.0,
									"hidden" : 1,
									"id" : "obj-115",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 30.0, 490.0, 67.0, 21.0 ],
									"save" : [ "#N", "thispatcher", ";", "#Q", "end", ";" ],
									"style" : "",
									"text" : "thispatcher"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Verdana",
									"fontsize" : 10.0,
									"hidden" : 1,
									"id" : "obj-114",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 30.0, 466.0, 35.0, 21.0 ],
									"style" : "",
									"text" : "front"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Verdana",
									"fontsize" : 10.0,
									"id" : "obj-6",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 140.0, 180.0, 84.0, 21.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 140.0, 180.0, 84.0, 21.0 ],
									"style" : "",
									"text" : "alias renaming"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Verdana",
									"fontsize" : 10.0,
									"hidden" : 1,
									"id" : "obj-16",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 140.0, 463.0, 74.0, 21.0 ],
									"style" : "",
									"text" : "prepend load"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Verdana",
									"fontsize" : 10.0,
									"hidden" : 1,
									"id" : "obj-18",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 140.0, 490.0, 49.0, 21.0 ],
									"style" : "",
									"text" : "pcontrol"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"hidden" : 1,
									"id" : "obj-112",
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 30.0, 436.0, 25.0, 25.0 ],
									"style" : ""
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-23", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-23", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-10", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-23", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-11", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-114", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-112", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-115", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-114", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-23", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-12", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-23", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-14", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-18", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-16", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-23", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-21", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-16", 0 ],
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
									"source" : [ "obj-6", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-23", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-7", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-23", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-8", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 85.333374, 130.0, 68.0, 21.0 ],
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
					"style" : "",
					"text" : "p Examples"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-5",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
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
						"rect" : [ 0.0, 26.0, 1292.0, 745.0 ],
						"bglocked" : 0,
						"openinpresentation" : 1,
						"default_fontsize" : 10.0,
						"default_fontface" : 0,
						"default_fontname" : "Verdana",
						"gridonopen" : 2,
						"gridsize" : [ 10.0, 10.0 ],
						"gridsnaponopen" : 2,
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
									"fontface" : 1,
									"fontname" : "Lato Regular",
									"fontsize" : 18.0,
									"id" : "obj-16",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 1000.0, 430.5, 233.0, 28.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 519.5, 80.0, 57.0, 28.0 ],
									"style" : "",
									"text" : "Video"
								}

							}
, 							{
								"box" : 								{
									"fontface" : 1,
									"fontname" : "Lato Regular",
									"fontsize" : 18.0,
									"id" : "obj-15",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 1000.0, 400.0, 229.0, 28.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 670.0, 80.0, 69.0, 28.0 ],
									"style" : "",
									"text" : "Physics"
								}

							}
, 							{
								"box" : 								{
									"fontface" : 1,
									"fontname" : "Lato Regular",
									"fontsize" : 18.0,
									"id" : "obj-14",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 1000.0, 360.0, 233.0, 28.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 356.5, 80.0, 77.0, 28.0 ],
									"style" : "",
									"text" : "OpenGL"
								}

							}
, 							{
								"box" : 								{
									"fontface" : 1,
									"fontname" : "Lato Regular",
									"fontsize" : 18.0,
									"id" : "obj-13",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 1010.0, 330.0, 227.0, 28.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 70.0, 80.0, 49.0, 28.0 ],
									"style" : "",
									"text" : "Data"
								}

							}
, 							{
								"box" : 								{
									"fontface" : 1,
									"fontname" : "Lato Regular",
									"fontsize" : 18.0,
									"id" : "obj-11",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 1010.0, 240.0, 235.0, 28.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 183.5, 80.0, 123.0, 28.0 ],
									"style" : "",
									"text" : "Audio (Stereo)"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"htabcolor" : [ 0.376471, 0.384314, 0.4, 1.0 ],
									"id" : "obj-6",
									"maxclass" : "tab",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "int", "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 750.0, 150.0, 180.0, 580.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 480.0, 110.0, 136.0, 610.0 ],
									"style" : "",
									"tabcolor" : [ 0.376471, 0.384314, 0.4, 1.0 ],
									"tabs" : [ "alphablend%.model", "avg4%.model", "background%.model", "blur%.model", "brcosa%.model", "chromakey%.model", "edge%.model", "emboss%.model", "fft%.model", "fluoride%.model", "foreground_mask%.model", "ifft%.model", "keyscreen%.model", "mblur%.model", "motion%.model", "motion2%.model", "motiongram%.model", "op%.model", "orsize%.model", "plur%.model", "posterize%.model", "rgb2gray%.model", "similarity%.model", "slitscan%.model", "television%.model", "wake%.model", "xfade%.model", "yfade%.model", "preview%.model", "record%.model", "window%.model", "grab%.model", "input%.model", "movie%.model", "noise%.model" ],
									"textcolor" : [ 0.862745, 0.870588, 0.878431, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"htabcolor" : [ 0.376471, 0.384314, 0.4, 1.0 ],
									"id" : "obj-5",
									"maxclass" : "tab",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "int", "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 750.0, 90.0, 150.0, 40.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 630.0, 110.0, 150.0, 40.0 ],
									"style" : "",
									"tabcolor" : [ 0.376471, 0.384314, 0.4, 1.0 ],
									"tabs" : [ "phys_world.model" ],
									"textcolor" : [ 0.862745, 0.870588, 0.878431, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"htabcolor" : [ 0.376471, 0.384314, 0.4, 1.0 ],
									"id" : "obj-4",
									"maxclass" : "tab",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "int", "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 560.0, 90.0, 180.0, 580.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 330.0, 110.0, 130.0, 610.0 ],
									"style" : "",
									"tabcolor" : [ 0.376471, 0.384314, 0.4, 1.0 ],
									"tabs" : [ "gl_gridshape.model", "gl_text.model", "gl_videoplane.model", "gl_render.model", "gl_alphamixer.model", "gl_background.model", "gl_brcosa.model", "gl_chromakey.model", "gl_edgeblend.model", "gl_framediff.model", "gl_rota.model", "gl_syphonclient.model", "gl_syphonserver.model", "gl_world.model" ],
									"textcolor" : [ 0.862745, 0.870588, 0.878431, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"htabcolor" : [ 0.376471, 0.384314, 0.4, 1.0 ],
									"id" : "obj-3",
									"maxclass" : "tab",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "int", "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 410.0, 90.0, 130.0, 580.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 30.0, 110.0, 130.0, 610.0 ],
									"style" : "",
									"tabcolor" : [ 0.376471, 0.384314, 0.4, 1.0 ],
									"tabs" : [ "condition.model", "cue_script.model", "cue_manager.model", "fileBrowser.model", "filename_generator.model", "hi.model", "mapper.model", "mapperBCF.model", "midiin.model", "mouse.model", "multi_model.model", "qmetro.model", "spacenavigator.model", "textwriter.model", "wacom.model" ],
									"textcolor" : [ 0.862745, 0.870588, 0.878431, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"htabcolor" : [ 0.376471, 0.384314, 0.4, 1.0 ],
									"id" : "obj-1",
									"maxclass" : "tab",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "int", "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 10.0, 90.0, 130.0, 580.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 180.0, 110.0, 130.0, 610.0 ],
									"style" : "",
									"tabcolor" : [ 0.376471, 0.384314, 0.4, 1.0 ],
									"tabs" : [ "delay~.model", "echo~.model", "multidelay~.model", "degrade~.model", "saturation~.model", "limiter~.model", "noisegate~.model", "equalizer~.model", "filter~.model", "balance~.model", "crossfade~.model", "panning~.model", "scope~.model", "hilbertModulator~.model", "tremolo~.model", "output~.model", "record~.model", "vst~.model", "10harmonics~.model", "filePlayer~.model", "input~.model", "risset_glissando~.model", "sine~.model", "spectral_gate~.model", "spectral_shift~.model" ],
									"textcolor" : [ 0.862745, 0.870588, 0.878431, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Verdana",
									"fontsize" : 10.0,
									"id" : "obj-158",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 80.0, 740.0, 74.0, 21.0 ],
									"style" : "",
									"text" : "prepend help"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Verdana",
									"fontsize" : 10.0,
									"id" : "obj-159",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 80.0, 762.0, 49.0, 21.0 ],
									"style" : "",
									"text" : "pcontrol"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Verdana",
									"fontsize" : 10.0,
									"id" : "obj-115",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 30.0, 790.0, 67.0, 21.0 ],
									"save" : [ "#N", "thispatcher", ";", "#Q", "end", ";" ],
									"style" : "",
									"text" : "thispatcher"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Verdana",
									"fontsize" : 10.0,
									"id" : "obj-114",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 30.0, 769.0, 35.0, 21.0 ],
									"style" : "",
									"text" : "front"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-112",
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 30.0, 739.0, 25.0, 25.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"args" : [ "@name", "jamoma models", "@description", "Overview of Jamoma's models" ],
									"background" : 1,
									"bgmode" : 1,
									"border" : 0,
									"clickthrough" : 0,
									"enablehscroll" : 0,
									"enablevscroll" : 0,
									"id" : "obj-136",
									"lockeddragscroll" : 0,
									"maxclass" : "bpatcher",
									"name" : "j.maxhelpui.maxpat",
									"numinlets" : 1,
									"numoutlets" : 0,
									"offset" : [ 0.0, 0.0 ],
									"patching_rect" : [ 0.0, 0.0, 1276.0, 70.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 0.0, 0.0, 790.0, 70.0 ],
									"prototypename" : "bphelp",
									"viewvisibility" : 1
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-158", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-114", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-112", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-115", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-114", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-159", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-158", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-158", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-3", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-158", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-4", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-158", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-5", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-158", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-6", 1 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 50.0, 70.0, 55.0, 21.0 ],
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
					"style" : "",
					"text" : "p Models"
				}

			}
 ],
		"lines" : [  ],
		"parameters" : 		{
			"obj-1::obj-9::obj-4::obj-3::obj-27" : [ "Threshold[1]", "Threshold", 0 ],
			"obj-1::obj-9::obj-4::obj-31::obj-1::obj-45" : [ "live.text[2]", "live.text", 0 ],
			"obj-1::obj-16::obj-3::obj-15" : [ "Postamp[3]", "Postamp", 0 ],
			"obj-1::obj-9::obj-4::obj-3::obj-6" : [ "live.text[6]", "live.text", 0 ],
			"obj-1::obj-16::obj-3::obj-27" : [ "Threshold[3]", "Threshold", 0 ],
			"obj-1::obj-16::obj-31::obj-2::obj-12" : [ "live.numbox[7]", "live.numbox[4]", 0 ],
			"obj-1::obj-16::obj-31::obj-1::obj-27" : [ "Threshold[2]", "Threshold", 0 ],
			"obj-1::obj-26::obj-4::obj-3::obj-13" : [ "Release[5]", "Release", 0 ],
			"obj-1::obj-9::obj-4::obj-31::obj-1::obj-27" : [ "Threshold", "Threshold", 0 ],
			"obj-1::obj-9::obj-4::obj-25" : [ "Feedback", "Feedback", 0 ],
			"obj-1::obj-9::obj-4::obj-17" : [ "live.menu[4]", "live.menu[1]", 0 ],
			"obj-1::obj-26::obj-4::obj-3::obj-6" : [ "live.text[23]", "live.text", 0 ],
			"obj-1::obj-26::obj-4::obj-31::obj-1::obj-5" : [ "Preamp[4]", "Preamp", 0 ],
			"obj-1::obj-26::obj-4::obj-18" : [ "live.text[20]", "live.text[3]", 0 ],
			"obj-1::obj-16::obj-31::obj-2::obj-7" : [ "live.numbox[6]", "live.numbox", 0 ],
			"obj-1::obj-26::obj-4::obj-31::obj-2::obj-14" : [ "live.numbox[12]", "live.numbox", 0 ],
			"obj-1::obj-26::obj-4::obj-24" : [ "live.dial[4]", "Delay R", 0 ],
			"obj-1::obj-16::obj-23" : [ "live.dial[3]", "Delay L", 0 ],
			"obj-1::obj-16::obj-31::obj-2::obj-22" : [ "live.text[8]", "live.text", 0 ],
			"obj-1::obj-9::obj-4::obj-3::obj-13" : [ "Release[1]", "Release", 0 ],
			"obj-1::obj-16::obj-3::obj-45" : [ "live.text[13]", "live.text", 0 ],
			"obj-1::obj-9::obj-4::obj-31::obj-2::obj-15" : [ "live.menu", "live.menu", 0 ],
			"obj-1::obj-16::obj-31::obj-1::obj-42" : [ "live.text[10]", "live.text", 0 ],
			"obj-1::obj-16::obj-18" : [ "live.text[12]", "live.text[3]", 0 ],
			"obj-1::obj-9::obj-4::obj-31::obj-2::obj-22" : [ "live.text", "live.text", 0 ],
			"obj-1::obj-16::obj-3::obj-6" : [ "live.text[15]", "live.text", 0 ],
			"obj-1::obj-26::obj-4::obj-3::obj-12" : [ "Lookahead[5]", "Lookahead", 0 ],
			"obj-1::obj-16::obj-31::obj-1::obj-12" : [ "Lookahead[2]", "Lookahead", 0 ],
			"obj-1::obj-26::obj-4::obj-31::obj-1::obj-30" : [ "live.menu[12]", "live.menu", 0 ],
			"obj-1::obj-9::obj-4::obj-31::obj-1::obj-15" : [ "Postamp", "Postamp", 0 ],
			"obj-1::obj-26::obj-4::obj-3::obj-42" : [ "live.text[22]", "live.text", 0 ],
			"obj-1::obj-26::obj-4::obj-31::obj-1::obj-13" : [ "Release[4]", "Release", 0 ],
			"obj-1::obj-26::obj-4::obj-31::obj-1::obj-42" : [ "live.text[18]", "live.text", 0 ],
			"obj-1::obj-26::obj-4::obj-17" : [ "live.menu[14]", "live.menu[1]", 0 ],
			"obj-1::obj-9::obj-4::obj-3::obj-15" : [ "Postamp[1]", "Postamp", 0 ],
			"obj-1::obj-9::obj-4::obj-3::obj-45" : [ "live.text[4]", "live.text", 0 ],
			"obj-1::obj-16::obj-3::obj-30" : [ "live.menu[10]", "live.menu", 0 ],
			"obj-1::obj-9::obj-4::obj-3::obj-30" : [ "live.menu[5]", "live.menu", 0 ],
			"obj-1::obj-16::obj-31::obj-1::obj-45" : [ "live.text[9]", "live.text", 0 ],
			"obj-1::obj-16::obj-21" : [ "live.menu[8]", "live.menu[2]", 0 ],
			"obj-1::obj-16::obj-31::obj-1::obj-15" : [ "Postamp[2]", "Postamp", 0 ],
			"obj-1::obj-16::obj-24" : [ "live.dial[2]", "Delay R", 0 ],
			"obj-1::obj-26::obj-4::obj-3::obj-30" : [ "live.menu[15]", "live.menu", 0 ],
			"obj-1::obj-9::obj-4::obj-3::obj-42" : [ "live.text[5]", "live.text", 0 ],
			"obj-1::obj-16::obj-31::obj-1::obj-5" : [ "Preamp[2]", "Preamp", 0 ],
			"obj-1::obj-26::obj-4::obj-31::obj-1::obj-15" : [ "Postamp[4]", "Postamp", 0 ],
			"obj-1::obj-16::obj-31::obj-2::obj-15" : [ "live.menu[6]", "live.menu", 0 ],
			"obj-1::obj-26::obj-4::obj-31::obj-2::obj-15" : [ "live.menu[11]", "live.menu", 0 ],
			"obj-1::obj-9::obj-4::obj-21" : [ "live.menu[3]", "live.menu[2]", 0 ],
			"obj-1::obj-26::obj-4::obj-31::obj-1::obj-6" : [ "live.text[19]", "live.text", 0 ],
			"obj-1::obj-26::obj-4::obj-25" : [ "Feedback[2]", "Feedback", 0 ],
			"obj-1::obj-16::obj-17" : [ "live.menu[9]", "live.menu[1]", 0 ],
			"obj-1::obj-9::obj-4::obj-31::obj-1::obj-5" : [ "Preamp", "Preamp", 0 ],
			"obj-1::obj-9::obj-4::obj-3::obj-12" : [ "Lookahead[1]", "Lookahead", 0 ],
			"obj-1::obj-9::obj-4::obj-31::obj-2::obj-7" : [ "live.numbox[5]", "live.numbox", 0 ],
			"obj-1::obj-16::obj-3::obj-12" : [ "Lookahead[3]", "Lookahead", 0 ],
			"obj-1::obj-16::obj-3::obj-13" : [ "Release[3]", "Release", 0 ],
			"obj-1::obj-9::obj-4::obj-31::obj-1::obj-42" : [ "live.text[1]", "live.text", 0 ],
			"obj-1::obj-9::obj-4::obj-31::obj-2::obj-19" : [ "live.numbox", "live.numbox", 0 ],
			"obj-1::obj-16::obj-31::obj-1::obj-6" : [ "live.text[11]", "live.text", 0 ],
			"obj-1::obj-16::obj-25" : [ "Feedback[1]", "Feedback", 0 ],
			"obj-1::obj-26::obj-4::obj-31::obj-2::obj-22" : [ "live.text[16]", "live.text", 0 ],
			"obj-1::obj-16::obj-31::obj-1::obj-13" : [ "Release[2]", "Release", 0 ],
			"obj-1::obj-26::obj-4::obj-3::obj-27" : [ "Threshold[5]", "Threshold", 0 ],
			"obj-1::obj-9::obj-4::obj-24" : [ "live.dial[1]", "Delay R", 0 ],
			"obj-1::obj-26::obj-4::obj-31::obj-1::obj-27" : [ "Threshold[4]", "Threshold", 0 ],
			"obj-1::obj-26::obj-4::obj-31::obj-2::obj-19" : [ "live.numbox[13]", "live.numbox", 0 ],
			"obj-1::obj-9::obj-4::obj-31::obj-1::obj-13" : [ "Release", "Release", 0 ],
			"obj-1::obj-9::obj-4::obj-31::obj-1::obj-30" : [ "live.menu[1]", "live.menu", 0 ],
			"obj-1::obj-26::obj-4::obj-21" : [ "live.menu[13]", "live.menu[2]", 0 ],
			"obj-1::obj-9::obj-4::obj-31::obj-1::obj-12" : [ "Lookahead", "Lookahead", 0 ],
			"obj-1::obj-26::obj-4::obj-31::obj-2::obj-7" : [ "live.numbox[10]", "live.numbox", 0 ],
			"obj-1::obj-9::obj-4::obj-23" : [ "live.dial", "Delay L", 0 ],
			"obj-1::obj-9::obj-4::obj-3::obj-5" : [ "Preamp[1]", "Preamp", 0 ],
			"obj-1::obj-16::obj-3::obj-5" : [ "Preamp[3]", "Preamp", 0 ],
			"obj-1::obj-16::obj-3::obj-42" : [ "live.text[14]", "live.text", 0 ],
			"obj-1::obj-16::obj-31::obj-1::obj-30" : [ "live.menu[7]", "live.menu", 0 ],
			"obj-1::obj-26::obj-4::obj-3::obj-5" : [ "Preamp[5]", "Preamp", 0 ],
			"obj-1::obj-9::obj-4::obj-31::obj-1::obj-6" : [ "live.text[3]", "live.text", 0 ],
			"obj-1::obj-26::obj-4::obj-3::obj-15" : [ "Postamp[5]", "Postamp", 0 ],
			"obj-1::obj-26::obj-4::obj-31::obj-1::obj-45" : [ "live.text[17]", "live.text", 0 ],
			"obj-1::obj-26::obj-4::obj-3::obj-45" : [ "live.text[21]", "live.text", 0 ],
			"obj-1::obj-26::obj-4::obj-31::obj-1::obj-12" : [ "Lookahead[4]", "Lookahead", 0 ],
			"obj-1::obj-26::obj-4::obj-31::obj-2::obj-12" : [ "live.numbox[11]", "live.numbox[4]", 0 ],
			"obj-1::obj-26::obj-4::obj-23" : [ "live.dial[5]", "Delay L", 0 ],
			"obj-1::obj-16::obj-31::obj-2::obj-19" : [ "live.numbox[9]", "live.numbox", 0 ],
			"obj-1::obj-16::obj-31::obj-2::obj-14" : [ "live.numbox[8]", "live.numbox", 0 ],
			"obj-1::obj-9::obj-4::obj-31::obj-2::obj-12" : [ "live.numbox[4]", "live.numbox[4]", 0 ],
			"obj-1::obj-9::obj-4::obj-18" : [ "live.text[7]", "live.text[3]", 0 ],
			"obj-1::obj-9::obj-4::obj-31::obj-2::obj-14" : [ "live.numbox[2]", "live.numbox", 0 ]
		}
,
		"dependency_cache" : [ 			{
				"name" : "j.maxhelpui.maxpat",
				"bootpath" : "~/Documents/Developpements/Jamoma/Max/Jamoma/patchers/components/data/maxhelpui",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.maxhelpuiButton.png",
				"bootpath" : "~/Documents/Developpements/Jamoma/Max/Jamoma/patchers/components/data/maxhelpui",
				"type" : "PNG ",
				"implicit" : 1
			}
, 			{
				"name" : "echo~.module.maxpat",
				"bootpath" : "~/Documents/Developpements/Jamoma/Max/Jamoma/patchers/models/audio/stereo/delay/echo",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "echo~.model.maxpat",
				"bootpath" : "~/Documents/Developpements/Jamoma/Max/Jamoma/patchers/models/audio/stereo/delay/echo",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "limiter~.model.maxpat",
				"bootpath" : "~/Documents/Developpements/Jamoma/Max/Jamoma/patchers/models/audio/stereo/dynamics/limiter",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "limiter.parametersAndMessages.maxpat",
				"bootpath" : "~/Documents/Developpements/Jamoma/Max/Jamoma/patchers/models/audio/stereo/dynamics/limiter",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "filter~.model.maxpat",
				"bootpath" : "~/Documents/Developpements/Jamoma/Max/Jamoma/patchers/models/audio/stereo/eq/filter",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.octavebandwidth2q.maxpat",
				"bootpath" : "~/Documents/Developpements/Jamoma/Max/Jamoma/patchers/components/audio/octavebandwidth2q",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.q2octavebandwidth.maxpat",
				"bootpath" : "~/Documents/Developpements/Jamoma/Max/Jamoma/patchers/components/audio/q2octavebandwith",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "echo~.view.maxpat",
				"bootpath" : "~/Documents/Developpements/Jamoma/Max/Jamoma/patchers/models/audio/stereo/delay/echo",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "limiter~.view.maxpat",
				"bootpath" : "~/Documents/Developpements/Jamoma/Max/Jamoma/patchers/models/audio/stereo/dynamics/limiter",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "filter~.view.maxpat",
				"bootpath" : "~/Documents/Developpements/Jamoma/Max/Jamoma/patchers/models/audio/stereo/eq/filter",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "brushes.aif",
				"bootpath" : "C74:/media/msp",
				"type" : "AIFF",
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
				"name" : "j.receive.mxo",
				"type" : "iLaX"
			}
 ],
		"autosave" : 0
	}

}
