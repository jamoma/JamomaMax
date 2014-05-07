{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 6,
			"minor" : 1,
			"revision" : 6,
			"architecture" : "x86"
		}
,
		"rect" : [ 379.0, 51.0, 420.0, 632.0 ],
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
					"id" : "obj-8",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 60.0, 267.0, 245.0, 20.0 ],
					"text" : "pack"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frgb" : 0.0,
					"id" : "obj-9",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 45.0, 77.0, 269.0, 20.0 ],
					"text" : "FluidSynth home: http://www.fluidsynth.org/"
				}

			}
, 			{
				"box" : 				{
					"args" : [ "@name", "fluidsynth~.module", "@description", "Synth based on the fluidsynth using soundfonts" ],
					"bgmode" : 1,
					"id" : "obj-4",
					"maxclass" : "bpatcher",
					"name" : "j.maxhelpui.maxpat",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 0.0, 0.0, 420.0, 70.0 ],
					"prototypename" : "bphelp",
					"varname" : "maxhelpui"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-7",
					"maxclass" : "bpatcher",
					"name" : "output~.module.maxpat",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 45.0, 456.0, 300.0, 140.0 ],
					"presentation_rect" : [ 0.0, 0.0, 300.0, 140.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-6",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 45.0, 185.0, 171.0, 20.0 ],
					"text" : "j.oscroute raw/voice.*/note"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-1",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 6,
							"architecture" : "x86"
						}
,
						"rect" : [ 10.0, 59.0, 390.0, 590.0 ],
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
									"args" : [ "jmod.delay~" ],
									"id" : "obj-1",
									"maxclass" : "bpatcher",
									"name" : "j.presetParameters.helper.maxpat",
									"numinlets" : 0,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 255.0, 374.0, 347.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 7.0, 238.0, 374.0, 347.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-2",
									"maxclass" : "bpatcher",
									"name" : "j.gainParameters.helper.maxpat",
									"numinlets" : 0,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 22.0, 374.0, 221.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 7.0, 5.0, 374.0, 221.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"hidden" : 1,
									"id" : "obj-3",
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 636.0, 15.0, 15.0 ]
								}

							}
 ],
						"lines" : [  ]
					}
,
					"patching_rect" : [ 155.0, 292.0, 125.0, 20.0 ],
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
					"text" : "p standard-messages"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-2",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 60.0, 292.0, 93.0, 20.0 ],
					"text" : "prepend /notein"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-3",
					"maxclass" : "bpatcher",
					"name" : "midiin.module.maxpat",
					"numinlets" : 0,
					"numoutlets" : 0,
					"patching_rect" : [ 45.0, 110.0, 150.0, 70.0 ],
					"presentation_rect" : [ 0.0, 0.0, 150.0, 70.0 ],
					"varname" : "/midiin"
				}

			}
, 			{
				"box" : 				{
					"hkeycolor" : [ 0.501961, 0.501961, 0.501961, 1.0 ],
					"id" : "obj-5",
					"maxclass" : "kslider",
					"mode" : 1,
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "int", "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 60.0, 225.0, 245.0, 34.0 ],
					"presentation_rect" : [ 0.0, 0.0, 245.0, 35.0 ],
					"range" : 60
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-11",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 226.0, 422.0, 103.0, 18.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-14",
					"maxclass" : "bpatcher",
					"name" : "fluidsynth~.module.maxpat",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "signal", "signal", "" ],
					"patching_rect" : [ 45.0, 341.0, 300.0, 70.0 ],
					"presentation_rect" : [ 0.0, 0.0, 300.0, 70.0 ],
					"varname" : "/fluidsynth~"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-14", 0 ],
					"disabled" : 0,
					"hidden" : 1,
					"midpoints" : [ 164.5, 316.5, 54.5, 316.5 ],
					"source" : [ "obj-1", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 2 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-14", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-14", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-14", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-14", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 69.5, 317.5, 54.5, 317.5 ],
					"source" : [ "obj-2", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-8", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-5", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-8", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-5", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-14", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-6", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-8", 0 ]
				}

			}
 ],
		"dependency_cache" : [ 			{
				"name" : "fluidsynth~.module.maxpat",
				"bootpath" : "/Users/bltzr/dev/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/fluidsynth~",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "fluidsynth~.model.maxpat",
				"bootpath" : "/Users/bltzr/dev/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/fluidsynth~",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "fluidsynth~.view.maxpat",
				"bootpath" : "/Users/bltzr/dev/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/fluidsynth~",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.gainParameters.helper.maxpat",
				"bootpath" : "/Users/bltzr/dev/Jamoma/Implementations/Max/Jamoma/help",
				"patcherrelativepath" : "../../../../help",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.presetParameters.helper.maxpat",
				"bootpath" : "/Users/bltzr/dev/Jamoma/Implementations/Max/Jamoma/help",
				"patcherrelativepath" : "../../../../help",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "output~.module.maxpat",
				"bootpath" : "/Users/bltzr/dev/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/output~",
				"patcherrelativepath" : "../output~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "output~.model.maxpat",
				"bootpath" : "/Users/bltzr/dev/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/output~",
				"patcherrelativepath" : "../output~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "saturation~.model.maxpat",
				"bootpath" : "/Users/bltzr/dev/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/saturation~",
				"patcherrelativepath" : "../saturation~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "limiter~.model.maxpat",
				"bootpath" : "/Users/bltzr/dev/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/limiter~",
				"patcherrelativepath" : "../limiter~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "limiter.parametersAndMessages.maxpat",
				"bootpath" : "/Users/bltzr/dev/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/limiter~",
				"patcherrelativepath" : "../limiter~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "balance~.model.maxpat",
				"bootpath" : "/Users/bltzr/dev/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/balance~",
				"patcherrelativepath" : "../balance~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "record~.model.maxpat",
				"bootpath" : "/Users/bltzr/dev/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/record~",
				"patcherrelativepath" : "../record~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "record.parametersAndMessages.maxpat",
				"bootpath" : "/Users/bltzr/dev/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/record~",
				"patcherrelativepath" : "../record~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.thru.maxpat",
				"bootpath" : "/Users/bltzr/dev/Jamoma/Implementations/Max/Jamoma/patchers/components/thru",
				"patcherrelativepath" : "../../../components/thru",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "output~.view.maxpat",
				"bootpath" : "/Users/bltzr/dev/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/output~",
				"patcherrelativepath" : "../output~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.js_systeminfo.js",
				"bootpath" : "/Users/bltzr/dev/Jamoma/Implementations/Max/Jamoma/javascript",
				"patcherrelativepath" : "../../../../javascript",
				"type" : "TEXT",
				"implicit" : 1
			}
, 			{
				"name" : "",
				"bootpath" : "/",
				"patcherrelativepath" : "../../../../../../../../../../..",
				"type" : "fold",
				"implicit" : 1
			}
, 			{
				"name" : "j.maxhelpui.maxpat",
				"bootpath" : "/Users/bltzr/dev/Jamoma/Implementations/Max/Jamoma/patchers/components/maxhelpui",
				"patcherrelativepath" : "../../../components/maxhelpui",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.maxhelpuiButton.png",
				"bootpath" : "/Users/bltzr/dev/Jamoma/Implementations/Max/Jamoma/patchers/components/maxhelpui",
				"patcherrelativepath" : "../../../components/maxhelpui",
				"type" : "PNG ",
				"implicit" : 1
			}
, 			{
				"name" : "j.maxhelpuiResize.js",
				"bootpath" : "/Users/bltzr/dev/Jamoma/Implementations/Max/Jamoma/patchers/components/maxhelpui",
				"patcherrelativepath" : "../../../components/maxhelpui",
				"type" : "TEXT",
				"implicit" : 1
			}
, 			{
				"name" : "j.jamomaPath.maxpat",
				"bootpath" : "/Users/bltzr/dev/Jamoma/Implementations/Max/Jamoma/patchers/components/jamomaPath",
				"patcherrelativepath" : "../../../components/jamomaPath",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "fluidsynth~.mxo",
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
				"name" : "j.out~.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.model.mxo",
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
, 			{
				"name" : "j.send.mxo",
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
				"name" : "j.return.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.init.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.textslider.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.savebang.mxo",
				"type" : "iLaX"
			}
 ]
	}

}
