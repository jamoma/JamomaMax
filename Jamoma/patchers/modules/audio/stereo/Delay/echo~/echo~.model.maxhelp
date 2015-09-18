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
		"rect" : [ 71.0, 81.0, 790.0, 520.0 ],
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
						"rect" : [ 71.0, 107.0, 790.0, 494.0 ],
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
									"id" : "obj-14",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 349.5, 352.0, 226.0, 20.0 ],
									"style" : "",
									"text" : "...or they can be instanciated separately:"
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"id" : "obj-12",
									"linecount" : 3,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 577.5, 197.5, 153.0, 51.0 ],
									"presentation_rect" : [ 576.5, 209.5, 0.0, 0.0 ],
									"style" : "",
									"text" : "filter~.view and limiter~.view are available in the panel"
								}

							}
, 							{
								"box" : 								{
									"annotation" : "none",
									"fontface" : 0,
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-10",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 368.0, 398.0, 171.0, 22.0 ],
									"style" : "",
									"text" : "limiter~.view echo_help/limiter"
								}

							}
, 							{
								"box" : 								{
									"bubbleside" : 0,
									"id" : "obj-9",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 361.5, 40.0, 202.0, 33.0 ],
									"style" : "",
									"text" : "this model contains 2 sub-models : \nfilter~.model and limiter~.model"
								}

							}
, 							{
								"box" : 								{
									"annotation" : "none",
									"args" : [ "echo_help" ],
									"bgmode" : 0,
									"border" : 0,
									"clickthrough" : 0,
									"enablehscroll" : 0,
									"enablevscroll" : 0,
									"id" : "obj-7",
									"lockeddragscroll" : 0,
									"maxclass" : "bpatcher",
									"name" : "echo~.view.maxpat",
									"numinlets" : 1,
									"numoutlets" : 1,
									"offset" : [ 0.0, 0.0 ],
									"outlettype" : [ "" ],
									"patching_rect" : [ 270.5, 210.5, 300.0, 105.0 ],
									"presentation_rect" : [ 555.0, 449.0, 300.0, 105.0 ],
									"viewvisibility" : 1
								}

							}
, 							{
								"box" : 								{
									"annotation" : "Stereo echo module.",
									"id" : "obj-6",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 3,
									"outlettype" : [ "signal", "signal", "" ],
									"patching_rect" : [ 24.0, 241.0, 155.0, 22.0 ],
									"style" : "",
									"text" : "echo~.model echo_help"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-11",
									"maxclass" : "live.gain~",
									"numinlets" : 2,
									"numoutlets" : 5,
									"orientation" : 1,
									"outlettype" : [ "signal", "signal", "", "float", "list" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 24.0, 346.0, 165.0, 48.0 ],
									"presentation_rect" : [ 0.0, 0.0, 50.0, 48.0 ],
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_longname" : "Gain",
											"parameter_shortname" : "Gain",
											"parameter_type" : 0,
											"parameter_mmin" : -70.0,
											"parameter_mmax" : 6.0,
											"parameter_initial" : [ 0.0 ],
											"parameter_unitstyle" : 4
										}

									}
,
									"varname" : "live.gain~"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-5",
									"local" : 1,
									"maxclass" : "ezdac~",
									"numinlets" : 2,
									"numoutlets" : 0,
									"patching_rect" : [ 24.0, 415.0, 45.0, 45.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"clipheight" : 69.0,
									"data" : 									{
										"clips" : [ 											{
												"filename" : "duduk.aif",
												"filekind" : "audiofile",
												"loop" : 1,
												"content_state" : 												{
													"originaltempo" : [ 120.0 ],
													"play" : [ 0 ],
													"pitchcorrection" : [ 0 ],
													"quality" : [ "basic" ],
													"originallength" : [ 0.0, "ticks" ],
													"formantcorrection" : [ 0 ],
													"pitchshift" : [ 1.0 ],
													"followglobaltempo" : [ 0 ],
													"originallengthms" : [ 0.0 ],
													"timestretch" : [ 0 ],
													"slurtime" : [ 0.0 ],
													"mode" : [ "basic" ],
													"formant" : [ 1.0 ],
													"basictuning" : [ 440 ],
													"speed" : [ 1.0 ],
													"pitchshiftcent" : [ 0 ]
												}

											}
 ]
									}
,
									"id" : "obj-8",
									"maxclass" : "playlist~",
									"numinlets" : 1,
									"numoutlets" : 5,
									"outlettype" : [ "signal", "signal", "signal", "", "dictionary" ],
									"patching_rect" : [ 24.0, 108.0, 563.0, 70.0 ],
									"style" : ""
								}

							}
, 							{
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
									"patching_rect" : [ 10.0, 10.0, 293.0, 63.0 ]
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
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 368.0, 374.0, 152.0, 22.0 ],
									"style" : "",
									"text" : "filter~.view echo_help/filter"
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
									"patching_rect" : [ 160.0, 272.0, 93.0, 22.0 ],
									"style" : "",
									"text" : "print @popup 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 1 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-11", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-11", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-11", 1 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-6", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-11", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-6", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-6", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-6", 1 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-8", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-6", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-8", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 10.0, 85.0, 50.0, 22.0 ],
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
							"revision" : 5,
							"architecture" : "x86",
							"modernui" : 1
						}
,
						"rect" : [ 0.0, 26.0, 790.0, 494.0 ],
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
					"patching_rect" : [ 152.0, 242.0, 50.0, 22.0 ],
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
			"obj-2::obj-7::obj-3::obj-42" : [ "live.text[1]", "live.text", 0 ],
			"obj-2::obj-7::obj-3::obj-13" : [ "Release", "Release", 0 ],
			"obj-2::obj-7::obj-31::obj-2::obj-7" : [ "live.numbox[6]", "live.numbox", 0 ],
			"obj-2::obj-4::obj-19" : [ "live.numbox", "live.numbox", 0 ],
			"obj-2::obj-7::obj-3::obj-12" : [ "Lookahead", "Lookahead", 0 ],
			"obj-2::obj-7::obj-31::obj-1::obj-6" : [ "live.text[5]", "live.text", 0 ],
			"obj-2::obj-7::obj-3::obj-30" : [ "live.menu[1]", "live.menu", 0 ],
			"obj-2::obj-7::obj-31::obj-1::obj-13" : [ "Release[1]", "Release", 0 ],
			"obj-2::obj-10::obj-45" : [ "live.text[9]", "live.text", 0 ],
			"obj-2::obj-10::obj-12" : [ "Lookahead[2]", "Lookahead", 0 ],
			"obj-2::obj-7::obj-31::obj-1::obj-5" : [ "Preamp[1]", "Preamp", 0 ],
			"obj-2::obj-10::obj-5" : [ "Preamp[2]", "Preamp", 0 ],
			"obj-2::obj-7::obj-3::obj-45" : [ "live.text[3]", "live.text", 0 ],
			"obj-2::obj-4::obj-7" : [ "live.numbox[5]", "live.numbox", 0 ],
			"obj-2::obj-7::obj-25" : [ "Feedback", "Feedback", 0 ],
			"obj-2::obj-7::obj-18" : [ "live.text[8]", "live.text[3]", 0 ],
			"obj-2::obj-11" : [ "Gain", "Gain", 0 ],
			"obj-2::obj-10::obj-15" : [ "Postamp[2]", "Postamp", 0 ],
			"obj-2::obj-7::obj-31::obj-2::obj-19" : [ "live.numbox[9]", "live.numbox", 0 ],
			"obj-2::obj-7::obj-21" : [ "live.menu[5]", "live.menu[2]", 0 ],
			"obj-2::obj-10::obj-27" : [ "Threshold[2]", "Threshold", 0 ],
			"obj-2::obj-7::obj-31::obj-1::obj-12" : [ "Lookahead[1]", "Lookahead", 0 ],
			"obj-2::obj-7::obj-24" : [ "live.dial[1]", "Delay R", 0 ],
			"obj-2::obj-4::obj-12" : [ "live.numbox[4]", "live.numbox[4]", 0 ],
			"obj-2::obj-4::obj-14" : [ "live.numbox[2]", "live.numbox", 0 ],
			"obj-2::obj-4::obj-15" : [ "live.menu[6]", "live.menu", 0 ],
			"obj-2::obj-7::obj-3::obj-6" : [ "live.text[2]", "live.text", 0 ],
			"obj-2::obj-7::obj-31::obj-1::obj-15" : [ "Postamp[1]", "Postamp", 0 ],
			"obj-2::obj-10::obj-30" : [ "live.menu", "live.menu", 0 ],
			"obj-2::obj-10::obj-6" : [ "live.text", "live.text", 0 ],
			"obj-2::obj-4::obj-22" : [ "live.text[11]", "live.text", 0 ],
			"obj-2::obj-7::obj-31::obj-2::obj-15" : [ "live.menu[3]", "live.menu", 0 ],
			"obj-2::obj-7::obj-17" : [ "live.menu[4]", "live.menu[1]", 0 ],
			"obj-2::obj-10::obj-42" : [ "live.text[10]", "live.text", 0 ],
			"obj-2::obj-7::obj-31::obj-1::obj-27" : [ "Threshold[1]", "Threshold", 0 ],
			"obj-2::obj-7::obj-3::obj-27" : [ "Threshold", "Threshold", 0 ],
			"obj-2::obj-7::obj-31::obj-2::obj-22" : [ "live.text[7]", "live.text", 0 ],
			"obj-2::obj-7::obj-3::obj-5" : [ "Preamp", "Preamp", 0 ],
			"obj-2::obj-7::obj-31::obj-1::obj-45" : [ "live.text[6]", "live.text", 0 ],
			"obj-2::obj-7::obj-31::obj-1::obj-30" : [ "live.menu[2]", "live.menu", 0 ],
			"obj-2::obj-7::obj-31::obj-2::obj-12" : [ "live.numbox[7]", "live.numbox[4]", 0 ],
			"obj-2::obj-7::obj-23" : [ "live.dial", "Delay L", 0 ],
			"obj-2::obj-10::obj-13" : [ "Release[2]", "Release", 0 ],
			"obj-2::obj-7::obj-31::obj-2::obj-14" : [ "live.numbox[8]", "live.numbox", 0 ],
			"obj-2::obj-7::obj-3::obj-15" : [ "Postamp", "Postamp", 0 ],
			"obj-2::obj-7::obj-31::obj-1::obj-42" : [ "live.text[4]", "live.text", 0 ]
		}
,
		"dependency_cache" : [ 			{
				"name" : "filter~.view.maxpat",
				"bootpath" : "~/Documents/GITHUB/JamomaMax/Jamoma/patchers/modules/audio/stereo/EQ/filter~",
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
				"name" : "j.q2octavebandwidth.maxpat",
				"bootpath" : "~/Documents/GITHUB/JamomaMax/Jamoma/patchers/components/audio/q2octavebandwith",
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
				"name" : "duduk.aif",
				"bootpath" : "C74:/media/msp",
				"type" : "AIFF",
				"implicit" : 1
			}
, 			{
				"name" : "echo~.model.maxpat",
				"bootpath" : "~/Documents/GITHUB/JamomaMax/Jamoma/patchers/modules/audio/stereo/Delay/echo~",
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
				"name" : "filter~.model.maxpat",
				"bootpath" : "~/Documents/GITHUB/JamomaMax/Jamoma/patchers/modules/audio/stereo/EQ/filter~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "echo~.view.maxpat",
				"bootpath" : "~/Documents/GITHUB/JamomaMax/Jamoma/patchers/modules/audio/stereo/Delay/echo~",
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
				"name" : "helpname.js",
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
				"name" : "j.receive~.mxo",
				"type" : "iLaX"
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
 ],
		"embedsnapshot" : 0
	}

}
