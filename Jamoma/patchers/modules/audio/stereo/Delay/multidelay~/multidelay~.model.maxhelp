{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 7,
			"minor" : 0,
			"revision" : 0,
			"architecture" : "x86"
		}
,
		"rect" : [ 36.0, 53.0, 589.0, 748.0 ],
		"bglocked" : 0,
		"openinpresentation" : 0,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 0,
		"gridsize" : [ 5.0, 5.0 ],
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
		"boxes" : [ 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-2",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 407.0, 430.0, 100.0, 20.0 ],
					"text" : "print @popup 1"
				}

			}
, 			{
				"box" : 				{
					"args" : [ "@name", "jmod.multidelay~", "@description", "Sample-accurate delay module with 5 delay lines per channel and feedback" ],
					"bgmode" : 1,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-1",
					"lockeddragscroll" : 0,
					"maxclass" : "bpatcher",
					"name" : "j.maxhelpui.maxpat",
					"numinlets" : 1,
					"numoutlets" : 0,
					"offset" : [ 0.0, 0.0 ],
					"patching_rect" : [ 0.0, 0.0, 555.0, 70.0 ],
					"prototypename" : "bphelp",
					"varname" : "maxhelpui",
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
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-38",
					"lockeddragscroll" : 0,
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 0,
					"offset" : [ 0.0, 0.0 ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 7,
							"minor" : 0,
							"revision" : 0,
							"architecture" : "x86"
						}
,
						"rect" : [ 559.0, 85.0, 415.0, 358.0 ],
						"bglocked" : 0,
						"openinpresentation" : 1,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 0,
						"gridsize" : [ 5.0, 5.0 ],
						"gridsnaponopen" : 0,
						"statusbarvisible" : 2,
						"toolbarvisible" : 0,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-14",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 199.0, 306.0, 198.0, 20.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 199.0, 306.0, 198.0, 20.0 ],
									"text" : "feedback mode: stereo or pingpong"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"id" : "obj-13",
									"items" : [ "stereo", ",", "pingpong" ],
									"maxclass" : "umenu",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "int", "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 14.0, 305.0, 81.0, 17.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 244.0, 66.0, 69.0, 17.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-12",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 97.0, 306.0, 111.0, 18.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 97.0, 306.0, 111.0, 18.0 ],
									"text" : "/feedback/mode $1"
								}

							}
, 							{
								"box" : 								{
									"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
									"id" : "obj-1",
									"maxclass" : "flonum",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 16.0, 285.0, 35.0, 20.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 16.0, 285.0, 35.0, 20.0 ],
									"triscale" : 0.9
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-2",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 200.0, 288.0, 186.0, 20.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 200.0, 288.0, 186.0, 20.0 ],
									"text" : "feedback for all delay lines (0.-1.)"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-3",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 62.0, 287.0, 104.0, 18.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 62.0, 287.0, 104.0, 18.0 ],
									"text" : "/feedback/gain $1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-5",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 158.0, 267.0, 241.0, 20.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 158.0, 267.0, 241.0, 20.0 ],
									"text" : "max delay in milliseconds for both channels"
								}

							}
, 							{
								"box" : 								{
									"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
									"id" : "obj-6",
									"maxclass" : "number",
									"maximum" : 10000,
									"minimum" : 0,
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "int", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 16.0, 265.0, 58.0, 20.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 16.0, 265.0, 58.0, 20.0 ],
									"triscale" : 0.9
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 78.0, 265.0, 84.0, 18.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 78.0, 265.0, 84.0, 18.0 ],
									"text" : "/delay/max $1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"hidden" : 1,
									"id" : "obj-8",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 273.0, 236.0, 98.0, 19.0 ],
									"text" : "s jmod.delay.cmd"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 18.0,
									"frgb" : 0.0,
									"id" : "obj-9",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 15.0, 233.0, 241.0, 27.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 15.0, 233.0, 241.0, 27.0 ],
									"text" : "Module specific messages"
								}

							}
, 							{
								"box" : 								{
									"background" : 1,
									"bgcolor" : [ 0.901961, 0.901961, 0.901961, 1.0 ],
									"border" : 1,
									"bordercolor" : [ 0.6, 0.6, 0.6, 1.0 ],
									"id" : "obj-10",
									"maxclass" : "panel",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 11.0, 231.0, 373.0, 27.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 11.0, 231.0, 373.0, 27.0 ],
									"rounded" : 15
								}

							}
, 							{
								"box" : 								{
									"background" : 1,
									"bgcolor" : [ 0.901961, 0.901961, 0.901961, 1.0 ],
									"id" : "obj-11",
									"maxclass" : "panel",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 11.0, 259.0, 373.0, 66.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 11.0, 259.0, 373.0, 66.0 ],
									"rounded" : 15
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"hidden" : 1,
									"id" : "obj-15",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 281.0, 12.0, 98.0, 19.0 ],
									"text" : "s jmod.delay.cmd"
								}

							}
, 							{
								"box" : 								{
									"bgmode" : 0,
									"border" : 0,
									"clickthrough" : 0,
									"enablehscroll" : 0,
									"enablevscroll" : 0,
									"id" : "obj-27",
									"lockeddragscroll" : 0,
									"maxclass" : "bpatcher",
									"name" : "j.gainParameters.helper.maxpat",
									"numinlets" : 0,
									"numoutlets" : 1,
									"offset" : [ 0.0, 0.0 ],
									"outlettype" : [ "" ],
									"patching_rect" : [ 9.0, 8.0, 380.0, 220.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 9.0, 8.0, 380.0, 220.0 ],
									"viewvisibility" : 1
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-8", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-12", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-12", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"midpoints" : [ 54.5, 331.0, 97.25, 331.0, 97.25, 296.0, 106.5, 296.0 ],
									"source" : [ "obj-13", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-8", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-3", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-6", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-8", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 94.0, 673.0, 143.0, 20.0 ],
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
					"text" : "p controlling_the_module",
					"viewvisibility" : 0
				}

			}
, 			{
				"box" : 				{
					"args" : [ "/output~" ],
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-4",
					"lockeddragscroll" : 0,
					"maxclass" : "bpatcher",
					"name" : "output~.module.maxpat",
					"numinlets" : 2,
					"numoutlets" : 1,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "" ],
					"patching_rect" : [ 94.0, 484.0, 300.0, 175.0 ],
					"presentation_rect" : [ 0.0, 0.0, 300.0, 175.0 ],
					"varname" : "/output~",
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-17",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 126.0, 310.0, 99.0, 20.0 ],
					"text" : "r jmod.delay.cmd"
				}

			}
, 			{
				"box" : 				{
					"args" : [ "/input~" ],
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-36",
					"lockeddragscroll" : 0,
					"maxclass" : "bpatcher",
					"name" : "input~.module.maxpat",
					"numinlets" : 1,
					"numoutlets" : 3,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "signal", "signal", "" ],
					"patching_rect" : [ 94.0, 111.0, 300.0, 175.0 ],
					"presentation_rect" : [ 0.0, 0.0, 300.0, 175.0 ],
					"varname" : "/input~",
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"args" : [ "/multidelay~" ],
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-37",
					"lockeddragscroll" : 0,
					"maxclass" : "bpatcher",
					"name" : "multidelay~.module.maxpat",
					"numinlets" : 2,
					"numoutlets" : 3,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "signal", "signal", "" ],
					"patching_rect" : [ 94.0, 345.0, 300.0, 105.0 ],
					"presentation_rect" : [ 0.0, 0.0, 300.0, 105.0 ],
					"varname" : "/multidelay~",
					"viewvisibility" : 1
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-37", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-17", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-37", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-36", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-37", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-36", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-37", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-37", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-37", 0 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-4::obj-1::obj-104" : [ "live.dial[5]", "Depth", 0 ],
			"obj-37::obj-2::obj-3::obj-42" : [ "live.text[1]", "live.text", 0 ],
			"obj-4::obj-1::obj-97" : [ "live.numbox[4]", "CPU", 0 ],
			"obj-36::obj-1::obj-111" : [ "live.numbox[2]", "live.numbox[2]", 0 ],
			"obj-36::obj-1::obj-74" : [ "live.dial[1]", "Transpose", 0 ],
			"obj-4::obj-1::obj-107" : [ "live.dial[4]", "Preamp", 0 ],
			"obj-4::obj-1::obj-106" : [ "live.dial[3]", "Release", 0 ],
			"obj-4::obj-1::obj-53" : [ "Master Gain[1]", "Master Gain", 0 ],
			"obj-4::obj-1::obj-90" : [ "live.text[10]", "live.text[1]", 0 ],
			"obj-4::obj-1::obj-110" : [ "live.numbox[6]", "live.numbox[1]", 0 ],
			"obj-36::obj-1::obj-45" : [ "live.numbox", "live.numbox", 0 ],
			"obj-4::obj-1::obj-100" : [ "live.text[12]", "live.text[1]", 0 ],
			"obj-4::obj-1::obj-111" : [ "live.numbox[5]", "live.numbox[2]", 0 ],
			"obj-36::obj-1::obj-62" : [ "live.text[5]", "live.text[3]", 0 ],
			"obj-4::obj-1::obj-102" : [ "live.text[8]", "live.text", 0 ],
			"obj-36::obj-1::obj-47" : [ "live.numbox[3]", "live.numbox", 0 ],
			"obj-37::obj-2::obj-3::obj-6" : [ "live.text", "live.text", 0 ],
			"obj-36::obj-1::obj-4" : [ "live.text[7]", "live.text[1]", 0 ],
			"obj-37::obj-2::obj-3::obj-5" : [ "Preamp", "Preamp", 0 ],
			"obj-4::obj-1::obj-103" : [ "live.text[11]", "live.text", 0 ],
			"obj-4::obj-1::obj-82" : [ "pan[1]", "Pan", 0 ],
			"obj-37::obj-2::obj-19" : [ "Feedback", "Feedback", 0 ],
			"obj-37::obj-2::obj-3::obj-27" : [ "Threshold", "Threshold", 0 ],
			"obj-37::obj-2::obj-3::obj-15" : [ "Postamp", "Postamp", 0 ],
			"obj-36::obj-1::obj-24" : [ "Master Gain", "Master Gain", 0 ],
			"obj-4::obj-1::obj-98" : [ "live.menu[5]", "live.menu", 0 ],
			"obj-37::obj-2::obj-3::obj-13" : [ "Release", "Release", 0 ],
			"obj-36::obj-1::obj-29::obj-48" : [ "live.menu[2]", "live.menu", 0 ],
			"obj-36::obj-1::obj-58" : [ "live.text[6]", "live.text[4]", 0 ],
			"obj-36::obj-1::obj-48" : [ "live.menu[3]", "live.menu", 0 ],
			"obj-36::obj-1::obj-59" : [ "live.text[3]", "live.text[3]", 0 ],
			"obj-4::obj-1::obj-108" : [ "live.text[9]", "live.text[4]", 0 ],
			"obj-37::obj-2::obj-3::obj-30" : [ "live.menu", "live.menu", 0 ],
			"obj-36::obj-1::obj-82" : [ "pan", "Pan", 0 ],
			"obj-37::obj-2::obj-3::obj-45" : [ "live.text[2]", "live.text", 0 ],
			"obj-36::obj-1::obj-110" : [ "live.numbox[1]", "live.numbox[1]", 0 ],
			"obj-36::obj-1::obj-108" : [ "live.text[4]", "live.text[4]", 0 ],
			"obj-4::obj-1::obj-99" : [ "live.menu[4]", "live.menu[2]", 0 ],
			"obj-37::obj-2::obj-3::obj-12" : [ "Lookahead", "Lookahead", 0 ],
			"obj-37::obj-2::obj-5" : [ "live.menu[1]", "live.menu[1]", 0 ]
		}
,
		"dependency_cache" : [ 			{
				"name" : "multidelay~.module.maxpat",
				"bootpath" : "~/dev/Jamoma/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/Delay/multidelay~",
				"patcherrelativepath" : "../../../../../../../../../../../../ntations/Max/Jamoma/patchers/modules/audio/stereo/Delay/multidelay~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "multidelay~.model.maxpat",
				"bootpath" : "~/dev/Jamoma/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/Delay/multidelay~",
				"patcherrelativepath" : "../../../../../../../../../../../../ntations/Max/Jamoma/patchers/modules/audio/stereo/Delay/multidelay~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "limiter~.model.maxpat",
				"bootpath" : "~/dev/Jamoma/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/Dynamics/limiter~",
				"patcherrelativepath" : "../../../../../../../../../../../../ntations/Max/Jamoma/patchers/modules/audio/stereo/Dynamics/limiter~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "limiter.parametersAndMessages.maxpat",
				"bootpath" : "~/dev/Jamoma/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/Dynamics/limiter~",
				"patcherrelativepath" : "../../../../../../../../../../../../ntations/Max/Jamoma/patchers/modules/audio/stereo/Dynamics/limiter~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "multidelay~.view.maxpat",
				"bootpath" : "~/dev/Jamoma/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/Delay/multidelay~",
				"patcherrelativepath" : "../../../../../../../../../../../../ntations/Max/Jamoma/patchers/modules/audio/stereo/Delay/multidelay~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "limiter~.view.maxpat",
				"bootpath" : "~/dev/Jamoma/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/Dynamics/limiter~",
				"patcherrelativepath" : "../../../../../../../../../../../../ntations/Max/Jamoma/patchers/modules/audio/stereo/Dynamics/limiter~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "input~.module.maxpat",
				"bootpath" : "~/dev/Jamoma/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/Sources/input~",
				"patcherrelativepath" : "../../../../../../../../../../../../ntations/Max/Jamoma/patchers/modules/audio/stereo/Sources/input~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "input~.view.maxpat",
				"bootpath" : "~/dev/Jamoma/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/Sources/input~",
				"patcherrelativepath" : "../../../../../../../../../../../../ntations/Max/Jamoma/patchers/modules/audio/stereo/Sources/input~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "input~.model.maxpat",
				"bootpath" : "~/dev/Jamoma/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/Sources/input~",
				"patcherrelativepath" : "../../../../../../../../../../../../ntations/Max/Jamoma/patchers/modules/audio/stereo/Sources/input~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "thru.maxpat",
				"bootpath" : "/Applications/Max 7/patches/m4l-patches/Pluggo for Live resources/patches",
				"patcherrelativepath" : "../../../../../../../../../../../../../../Applications/Max 7/patches/m4l-patches/Pluggo for Live resources/patches",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "balance~.model.maxpat",
				"bootpath" : "~/dev/Jamoma/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/Imaging/balance~",
				"patcherrelativepath" : "../../../../../../../../../../../../ntations/Max/Jamoma/patchers/modules/audio/stereo/Imaging/balance~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "output~.module.maxpat",
				"bootpath" : "~/dev/Jamoma/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/Output/output~",
				"patcherrelativepath" : "../../../../../../../../../../../../ntations/Max/Jamoma/patchers/modules/audio/stereo/Output/output~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "output~.model.maxpat",
				"bootpath" : "~/dev/Jamoma/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/Output/output~",
				"patcherrelativepath" : "../../../../../../../../../../../../ntations/Max/Jamoma/patchers/modules/audio/stereo/Output/output~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "saturation~.model.maxpat",
				"bootpath" : "~/dev/Jamoma/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/Distortion/saturation~",
				"patcherrelativepath" : "../../../../../../../../../../../../ntations/Max/Jamoma/patchers/modules/audio/stereo/Distortion/saturation~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "record~.model.maxpat",
				"bootpath" : "~/dev/Jamoma/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/Output/record~",
				"patcherrelativepath" : "../../../../../../../../../../../../ntations/Max/Jamoma/patchers/modules/audio/stereo/Output/record~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "record.parametersAndMessages.maxpat",
				"bootpath" : "~/dev/Jamoma/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/Output/record~",
				"patcherrelativepath" : "../../../../../../../../../../../../ntations/Max/Jamoma/patchers/modules/audio/stereo/Output/record~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "output~.view.maxpat",
				"bootpath" : "~/dev/Jamoma/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/Output/output~",
				"patcherrelativepath" : "../../../../../../../../../../../../ntations/Max/Jamoma/patchers/modules/audio/stereo/Output/output~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "",
				"bootpath" : "/",
				"patcherrelativepath" : "../../../../../../../../../../../../../..",
				"type" : "fold",
				"implicit" : 1
			}
, 			{
				"name" : "j.gainParameters.helper.maxpat",
				"bootpath" : "~/dev/Jamoma/Jamoma/Implementations/Max/Jamoma/help",
				"patcherrelativepath" : "../../../../../../../../../../../../ntations/Max/Jamoma/help",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.maxhelpui.maxpat",
				"bootpath" : "~/dev/Jamoma/Jamoma/Implementations/Max/Jamoma/patchers/components/data/maxhelpui",
				"patcherrelativepath" : "../../../../../../../../../../../../ntations/Max/Jamoma/patchers/components/data/maxhelpui",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.maxhelpuiButton.png",
				"bootpath" : "~/dev/Jamoma/Jamoma/Implementations/Max/Jamoma/patchers/components/data/maxhelpui",
				"patcherrelativepath" : "../../../../../../../../../../../../ntations/Max/Jamoma/patchers/components/data/maxhelpui",
				"type" : "PNG ",
				"implicit" : 1
			}
, 			{
				"name" : "j.maxhelpuiResize.js",
				"bootpath" : "~/dev/Jamoma/Jamoma/Implementations/Max/Jamoma/patchers/components/data/maxhelpui",
				"patcherrelativepath" : "../../../../../../../../../../../../ntations/Max/Jamoma/patchers/components/data/maxhelpui",
				"type" : "TEXT",
				"implicit" : 1
			}
, 			{
				"name" : "j.jamomaPath.maxpat",
				"bootpath" : "~/dev/Jamoma/Jamoma/Implementations/Max/Jamoma/patchers/components/data/jamomaPath",
				"patcherrelativepath" : "../../../../../../../../../../../../ntations/Max/Jamoma/patchers/components/data/jamomaPath",
				"type" : "JSON",
				"implicit" : 1
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
				"name" : "j.model.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.limiter~.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.message.mxo",
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
				"name" : "j.savebang.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.return.mxo",
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
				"name" : "j.receive.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.send.mxo",
				"type" : "iLaX"
			}
 ]
	}

}
