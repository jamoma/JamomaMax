{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 6,
			"minor" : 1,
			"revision" : 10,
			"architecture" : "x86"
		}
,
		"rect" : [ 201.0, 64.0, 634.0, 759.0 ],
		"bglocked" : 0,
		"openinpresentation" : 0,
		"default_fontsize" : 10.0,
		"default_fontface" : 0,
		"default_fontname" : "Verdana",
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
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-27",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 280.0, 392.0, 34.0, 19.0 ],
					"text" : "print"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-282",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 112.0, 424.0, 175.0, 20.0 ],
					"text" : "j.initialized /themodule 500"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"frgb" : 0.0,
					"id" : "obj-157",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 169.0, 58.0, 248.0, 19.0 ],
					"text" : "except *.layout and jmod.*.test"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"frgb" : 0.0,
					"id" : "obj-136",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 430.0, 131.0, 86.0, 19.0 ],
					"text" : "items to go"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-96",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 379.0, 107.0, 32.5, 19.0 ],
					"text" : "!-"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.945098, 0.913725, 0.407843, 1.0 ],
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-89",
					"maxclass" : "number",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "int", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 379.0, 131.0, 50.0, 19.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-57",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 5,
					"outlettype" : [ "", "", "", "", "" ],
					"patching_rect" : [ 96.0, 132.0, 183.0, 19.0 ],
					"text" : "regexp .*\\\\.(layout|test)\\\\.maxpat"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-97",
					"linecount" : 5,
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 378.0, 323.0, 170.0, 67.0 ],
					"text" : "prepend script new /themodule newex 450 450 85 472055817 bpatcher @args /themodule @patching_rect 450 450 500 500 @name"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-83",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 674.0, 421.0, 459.0, 256.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 10.0,
						"default_fontface" : 0,
						"default_fontname" : "Verdana",
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
						"boxes" : [ 							{
								"box" : 								{
									"fontname" : "Verdana",
									"fontsize" : 10.0,
									"frgb" : 0.0,
									"id" : "obj-13",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 289.0, 34.0, 150.0, 19.0 ],
									"text" : "probably not necessary"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Verdana",
									"fontsize" : 10.0,
									"id" : "obj-11",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 144.0, 133.0, 118.0, 19.0 ],
									"text" : "tosymbol @separator"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Verdana",
									"fontsize" : 10.0,
									"id" : "obj-10",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 144.0, 110.0, 155.0, 17.0 ],
									"text" : "$1 /documentation/generate"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Verdana",
									"fontsize" : 10.0,
									"id" : "obj-6",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 5,
									"outlettype" : [ "", "", "", "", "" ],
									"patching_rect" : [ 50.0, 35.0, 237.0, 19.0 ],
									"text" : "regexp (.*)\\\\.test.maxpat"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-2",
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 144.0, 170.0, 15.0, 15.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Verdana",
									"fontsize" : 10.0,
									"id" : "obj-3",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 5,
									"outlettype" : [ "", "", "", "", "" ],
									"patching_rect" : [ 51.0, 78.0, 237.0, 19.0 ],
									"text" : "regexp (.*)\\\\.maxpat"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-4",
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 5.0, 15.0, 15.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-5",
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 105.0, 168.0, 15.0, 15.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-11", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-10", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-2", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-11", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-10", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-3", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-3", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-6", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-4", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 223.0, 65.5, 60.5, 65.5 ],
									"source" : [ "obj-6", 3 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 78.0, 262.0, 59.0, 19.0 ],
					"saved_object_attributes" : 					{
						"default_fontface" : 0,
						"default_fontname" : "Verdana",
						"default_fontsize" : 10.0,
						"description" : "",
						"digest" : "",
						"fontface" : 0,
						"fontname" : "Verdana",
						"fontsize" : 10.0,
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p stripext"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 11.0,
					"id" : "obj-63",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 254.0, 185.0, 47.0, 20.0 ],
					"text" : "print 3"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 11.0,
					"id" : "obj-62",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 201.0, 184.0, 47.0, 20.0 ],
					"text" : "print 2"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 11.0,
					"id" : "obj-61",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 96.0, 184.0, 47.0, 20.0 ],
					"text" : "print 1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 11.0,
					"id" : "obj-55",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 465.0, 283.0, 58.0, 20.0 ],
					"text" : "deferlow"
				}

			}
, 			{
				"box" : 				{
					"autopopulate" : 1,
					"depth" : 6,
					"fontname" : "Verdana",
					"fontsize" : 11.0,
					"id" : "obj-59",
					"items" : [ "audio/hipno/amogwai/amogwai~.model.maxhelp", ",", "audio/hipno/amogwai/amogwai~.model.maxpat", ",", "audio/hipno/amogwai/amogwai~.module.maxpat", ",", "audio/hipno/amogwai/amogwai~.view.maxpat", ",", "audio/hipno/brita/brita~.model.maxhelp", ",", "audio/hipno/brita/brita~.model.maxpat", ",", "audio/hipno/brita/brita~.module.maxpat", ",", "audio/hipno/brita/brita~.view.maxpat", ",", "audio/stereo/Delay/delay~/delay~.model.maxhelp", ",", "audio/stereo/Delay/delay~/delay~.model.maxpat", ",", "audio/stereo/Delay/delay~/delay~.module.maxpat", ",", "audio/stereo/Delay/delay~/delay~.view.maxpat", ",", "audio/stereo/Delay/echo~/echo~.model.maxhelp", ",", "audio/stereo/Delay/echo~/echo~.model.maxpat", ",", "audio/stereo/Delay/echo~/echo~.module.maxpat", ",", "audio/stereo/Delay/echo~/echo~.view.maxpat", ",", "audio/stereo/Delay/multidelay~/multidelay~.model.maxhelp", ",", "audio/stereo/Delay/multidelay~/multidelay~.model.maxpat", ",", "audio/stereo/Delay/multidelay~/multidelay~.module.maxpat", ",", "audio/stereo/Delay/multidelay~/multidelay~.view.maxpat", ",", "audio/stereo/Distortion/degrade~/degrade~.model.maxhelp", ",", "audio/stereo/Distortion/degrade~/degrade~.model.maxpat", ",", "audio/stereo/Distortion/degrade~/degrade~.module.maxpat", ",", "audio/stereo/Distortion/degrade~/degrade~.view.maxpat", ",", "audio/stereo/Distortion/saturation~/saturation~.model.maxhelp", ",", "audio/stereo/Distortion/saturation~/saturation~.model.maxpat", ",", "audio/stereo/Distortion/saturation~/saturation~.module.maxpat", ",", "audio/stereo/Distortion/saturation~/saturation~.view.maxpat", ",", "audio/stereo/Dynamics/limiter~/limiter.parametersAndMessages.maxpat", ",", "audio/stereo/Dynamics/limiter~/limiter~.model.maxhelp", ",", "audio/stereo/Dynamics/limiter~/limiter~.model.maxpat", ",", "audio/stereo/Dynamics/limiter~/limiter~.module.maxpat", ",", "audio/stereo/Dynamics/limiter~/limiter~.panel.widget.maxpat", ",", "audio/stereo/Dynamics/limiter~/limiter~.view.maxpat", ",", "audio/stereo/Dynamics/noisegate~/noisegate~.model.maxhelp", ",", "audio/stereo/Dynamics/noisegate~/noisegate~.model.maxpat", ",", "audio/stereo/Dynamics/noisegate~/noisegate~.module.maxpat", ",", "audio/stereo/Dynamics/noisegate~/noisegate~.view.maxpat", ",", "audio/stereo/EQ/equalizer~/equalizer~.model.maxhelp", ",", "audio/stereo/EQ/equalizer~/equalizer~.model.maxpat", ",", "audio/stereo/EQ/equalizer~/equalizer~.module.maxpat", ",", "audio/stereo/EQ/equalizer~/equalizer~.view.large.maxpat", ",", "audio/stereo/EQ/equalizer~/equalizer~.view.maxpat", ",", "audio/stereo/EQ/equalizer~/equalizer~.view.small.maxpat", ",", "audio/stereo/EQ/filter~/filter~.model.maxhelp", ",", "audio/stereo/EQ/filter~/filter~.model.maxpat", ",", "audio/stereo/EQ/filter~/filter~.module.maxpat", ",", "audio/stereo/EQ/filter~/filter~.view.maxpat", ",", "audio/stereo/Imaging/balance~/balance~.model.maxhelp", ",", "audio/stereo/Imaging/balance~/balance~.model.maxpat", ",", "audio/stereo/Imaging/balance~/balance~.module.maxpat", ",", "audio/stereo/Imaging/balance~/balance~view.maxpat", ",", "audio/stereo/Imaging/crossfade~/crossfade~.model.maxhelp", ",", "audio/stereo/Imaging/crossfade~/crossfade~.model.maxpat", ",", "audio/stereo/Imaging/crossfade~/crossfade~.module.maxpat", ",", "audio/stereo/Imaging/crossfade~/crossfade~.view.maxpat", ",", "audio/stereo/Imaging/panning~/panning~.model.maxhelp", ",", "audio/stereo/Imaging/panning~/panning~.model.maxpat", ",", "audio/stereo/Imaging/panning~/panning~.module.maxpat", ",", "audio/stereo/Imaging/panning~/panning~.view.maxpat", ",", "audio/stereo/Metering/scope~/scope~.model.maxhelp", ",", "audio/stereo/Metering/scope~/scope~.model.maxpat", ",", "audio/stereo/Metering/scope~/scope~.module.maxpat", ",", "audio/stereo/Metering/scope~/scope~.view.maxpat", ",", "audio/stereo/Modulation/hilbert_modulator~/hilbert_modulator~.model.maxhelp", ",", "audio/stereo/Modulation/hilbert_modulator~/hilbert_modulator~.model.maxpat", ",", "audio/stereo/Modulation/hilbert_modulator~/hilbert_modulator~.module.maxpat", ",", "audio/stereo/Modulation/hilbert_modulator~/hilbert_modulator~.view.maxpat", ",", "audio/stereo/Modulation/tremolo~/tremolo~.model.maxhelp", ",", "audio/stereo/Modulation/tremolo~/tremolo~.model.maxpat", ",", "audio/stereo/Modulation/tremolo~/tremolo~.module.maxpat", ",", "audio/stereo/Modulation/tremolo~/tremolo~.view.maxpat", ",", "audio/stereo/Output/output~/output~.model.maxhelp", ",", "audio/stereo/Output/output~/output~.model.maxpat", ",", "audio/stereo/Output/output~/output~.module.maxpat", ",", "audio/stereo/Output/output~/output~.view.maxpat", ",", "audio/stereo/Output/record~/record.parametersAndMessages.maxpat", ",", "audio/stereo/Output/record~/record~.model.maxhelp", ",", "audio/stereo/Output/record~/record~.model.maxpat", ",", "audio/stereo/Output/record~/record~.module.maxpat", ",", "audio/stereo/Output/record~/record~.view.maxpat", ",", "audio/stereo/Plugins/vst~/j.vst_bind_to_parameter.maxpat", ",", "audio/stereo/Plugins/vst~/vst~.model.maxhelp", ",", "audio/stereo/Plugins/vst~/vst~.model.maxpat", ",", "audio/stereo/Plugins/vst~/vst~.module.maxpat", ",", "audio/stereo/Plugins/vst~/vst~.view.maxpat", ",", "audio/stereo/Sources/10harmonics~/10harmonics~.model.maxhelp", ",", "audio/stereo/Sources/10harmonics~/10harmonics~.model.maxpat", ",", "audio/stereo/Sources/10harmonics~/10harmonics~.module.maxpat", ",", "audio/stereo/Sources/10harmonics~/10harmonics~.view.maxpat", ",", "audio/stereo/Sources/input~/input~.model.maxhelp", ",", "audio/stereo/Sources/input~/input~.model.maxpat", ",", "audio/stereo/Sources/input~/input~.module.maxpat", ",", "audio/stereo/Sources/input~/input~.view.maxpat", ",", "audio/stereo/Sources/risset_glissando/risset_glissando~.model.maxhelp", ",", "audio/stereo/Sources/risset_glissando/risset_glissando~.model.maxpat", ",", "audio/stereo/Sources/risset_glissando/risset_glissando~.module.maxpat", ",", "audio/stereo/Sources/risset_glissando/risset_glissando~.view.maxpat", ",", "audio/stereo/Sources/sine~/sine~.model.maxhelp", ",", "audio/stereo/Sources/sine~/sine~.model.maxpat", ",", "audio/stereo/Sources/sine~/sine~.module.maxpat", ",", "audio/stereo/Sources/sine~/sine~.view.maxpat", ",", "audio/stereo/Sources/soundfile~/soundfile~.model.maxhelp", ",", "audio/stereo/Sources/soundfile~/soundfile~.model.maxpat", ",", "audio/stereo/Sources/soundfile~/soundfile~.module.maxpat", ",", "audio/stereo/Sources/soundfile~/soundfile~.view.maxpat", ",", "audio/stereo/Spectral/spectral_gate~/j.spectral_gate~.lib.maxpat", ",", "audio/stereo/Spectral/spectral_gate~/spectral_gate~.model.maxhelp", ",", "audio/stereo/Spectral/spectral_gate~/spectral_gate~.model.maxpat", ",", "audio/stereo/Spectral/spectral_gate~/spectral_gate~.module.maxpat", ",", "audio/stereo/Spectral/spectral_gate~/spectral_gate~.view.maxpat", ",", "audio/stereo/Spectral/spectral_shift~/j.spectral_shift_voice~.maxpat", ",", "audio/stereo/Spectral/spectral_shift~/spectral_shift~.model.maxhelp", ",", "audio/stereo/Spectral/spectral_shift~/spectral_shift~.model.maxpat", ",", "audio/stereo/Spectral/spectral_shift~/spectral_shift~.module.maxpat", ",", "audio/stereo/Spectral/spectral_shift~/spectral_shift~.view.maxpat", ",", "audio/surround/ambi.adjust=/ambi.adjust=.gain_helper.maxpat", ",", "audio/surround/ambi.adjust=/ambi.adjust=.model.maxhelp", ",", "audio/surround/ambi.adjust=/ambi.adjust=.model.maxpat", ",", "audio/surround/ambi.adjust=/ambi.adjust=.module.maxpat", ",", "audio/surround/ambi.adjust=/ambi.adjust=.view.maxpat", ",", "audio/surround/ambi.decode=/ambi.decode=.model.maxhelp", ",", "audio/surround/ambi.decode=/ambi.decode=.model.maxpat", ",", "audio/surround/ambi.decode=/ambi.decode=.module.maxpat", ",", "audio/surround/ambi.decode=/ambi.decode=.view.maxpat", ",", "audio/surround/ambi.encodeM=/ambi.encodeM=.model.maxhelp", ",", "audio/surround/ambi.encodeM=/ambi.encodeM=.model.maxpat", ",", "audio/surround/ambi.encodeM=/ambi.encodeM=.module.maxpat", ",", "audio/surround/ambi.encodeM=/ambi.encodeM=.view.maxpat", ",", "audio/surround/ambipanning=/ambipanning=.model.maxhelp", ",", "audio/surround/ambipanning=/ambipanning=.model.maxpat", ",", "audio/surround/ambipanning=/ambipanning=.module.maxpat", ",", "audio/surround/ambipanning=/ambipanning=.view.maxpat", ",", "audio/surround/ambipanning=/j.ambipan_source.maxpat", ",", "audio/surround/ambisonics=/ambisonics=.model.maxhelp", ",", "audio/surround/ambisonics=/ambisonics=.model.maxpat", ",", "audio/surround/ambisonics=/ambisonics=.module.maxpat", ",", "audio/surround/ambisonics=/ambisonics=.view.maxpat", ",", "audio/surround/aux=/aux=.model.maxhelp", ",", "audio/surround/aux=/aux=.model.maxpat", ",", "audio/surround/aux=/aux=.module.maxpat", ",", "audio/surround/aux=/aux=.view.maxpat", ",", "audio/surround/dbap.bformat=/dbap.bformat=.model.maxhelp", ",", "audio/surround/dbap.bformat=/dbap.bformat=.model.maxpat", ",", "audio/surround/dbap.bformat=/dbap.bformat=.module.maxpat", ",", "audio/surround/dbap.bformat=/dbap.bformat=.view.maxpat", ",", "audio/surround/dbap=/dbap=.model.maxhelp", ",", "audio/surround/dbap=/dbap=.model.maxpat", ",", "audio/surround/dbap=/dbap=.module.maxpat", ",", "audio/surround/doppler=/doppler=.model.maxhelp", ",", "audio/surround/doppler=/doppler=.model.maxpat", ",", "audio/surround/doppler=/doppler=.module.maxpat", ",", "audio/surround/doppler=/doppler=.view.maxpat", ",", "audio/surround/doppler=/j.ch.doppler=.maxpat", ",", "audio/surround/info=/info=.model.maxhelp", ",", "audio/surround/info=/info=.model.maxpat", ",", "audio/surround/info=/info=.module.maxpat", ",", "audio/surround/info=/info=.view.maxpat", ",", "audio/surround/input=/input.timeDisplay.maxpat", ",", "audio/surround/input=/input=.model.maxhelp", ",", "audio/surround/input=/input=.model.maxpat", ",", "audio/surround/input=/input=.module.maxpat", ",", "audio/surround/input=/input=.view.maxpat", ",", "audio/surround/limiter=/limiter=.model.maxhelp", ",", "audio/surround/limiter=/limiter=.model.maxpat", ",", "audio/surround/limiter=/limiter=.module.maxpat", ",", "audio/surround/limiter=/limiter=.view.maxpat", ",", "audio/surround/meters=/meters=.model.maxhelp", ",", "audio/surround/meters=/meters=.model.maxpat", ",", "audio/surround/meters=/meters=.module.maxpat", ",", "audio/surround/meters=/meters=.view.maxpat", ",", "audio/surround/multi.in=/multi.in=.model.maxhelp", ",", "audio/surround/multi.in=/multi.in=.model.maxpat", ",", "audio/surround/multi.in=/multi.in=.module.maxpat", ",", "audio/surround/multi.in=/multi.in=.view.maxpat", ",", "audio/surround/multi.out=/multi.out=.model.maxhelp", ",", "audio/surround/multi.out=/multi.out=.model.maxpat", ",", "audio/surround/multi.out=/multi.out=.module.maxpat", ",", "audio/surround/multi.out=/multi.out=.view.maxpat", ",", "audio/surround/output=/output=.model.maxhelp", ",", "audio/surround/output=/output=.model.maxpat", ",", "audio/surround/output=/output=.module.maxpat", ",", "audio/surround/output=/output=.view.maxpat", ",", "audio/surround/position=/position=.view.maxpat", ",", "audio/surround/race=/pingpong.poly.maxpat", ",", "audio/surround/race=/race=.model.maxhelp", ",", "audio/surround/race=/race=.model.maxpat", ",", "audio/surround/race=/race=.module.maxpat", ",", "audio/surround/race=/race=.view.maxpat", ",", "audio/surround/rolloff=/rolloff=.model.maxhelp", ",", "audio/surround/rolloff=/rolloff=.model.maxpat", ",", "audio/surround/rolloff=/rolloff=.module.maxpat", ",", "audio/surround/rolloff=/rolloff=.view.maxpat", ",", "audio/surround/setup=/j.channel.xyz_setup.maxpat", ",", "audio/surround/setup=/setup=.model.maxhelp", ",", "audio/surround/setup=/setup=.module.maxpat", ",", "audio/surround/setup=/setup=.view.maxpat", ",", "audio/surround/speaker.delay=/speaker.delay=.model.maxhelp", ",", "audio/surround/speaker.delay=/speaker.delay=.model.maxpat", ",", "audio/surround/speaker.delay=/speaker.delay=.module.maxpat", ",", "audio/surround/speaker.delay=/speaker.delay=.view.maxpat", ",", "audio/surround/speaker.distamp=/speaker.distamp=.model.maxhelp", ",", "audio/surround/speaker.distamp=/speaker.distamp=.model.maxpat", ",", "audio/surround/speaker.distamp=/speaker.distamp=.module.maxpat", ",", "audio/surround/speaker.distamp=/speaker.distamp=.view.maxpat", ",", "audio/surround/vbap=/vbap=.model.maxhelp", ",", "audio/surround/vbap=/vbap=.model.maxpat", ",", "audio/surround/vbap=/vbap=.module.maxpat", ",", "audio/surround/vbap=/vbap=.view.maxpat", ",", "audio/surround/waveform_viewer/waveform_viewer=.model.maxhelp", ",", "audio/surround/waveform_viewer/waveform_viewer=.model.maxpat", ",", "audio/surround/waveform_viewer/waveform_viewer=.module.maxpat", ",", "audio/surround/waveform_viewer/waveform_viewer=.view.maxpat", ",", "audio/surround/zoomH2ambi=/zoomH2ambi=.model.maxhelp", ",", "audio/surround/zoomH2ambi=/zoomH2ambi=.model.maxpat", ",", "audio/surround/zoomH2ambi=/zoomH2ambi=.module.maxpat", ",", "audio/surround/zoomH2ambi=/zoomH2ambi=.view.maxpat", ",", "data/condition/condition.model.maxhelp", ",", "data/condition/condition.model.maxpat", ",", "data/condition/condition.view.maxpat", ",", "data/cue-manager/cue_manager.model.maxhelp", ",", "data/cue-manager/cue_manager.model.maxpat", ",", "data/cue-manager/cue_manager.module.maxpat", ",", "data/cue-manager/cue_manager.view.maxpat", ",", "data/cue_script/cue_script.model.maxhelp", ",", "data/cue_script/cue_script.model.maxpat", ",", "data/cue_script/cue_script.module.maxpat", ",", "data/cue_script/cue_script.view.maxpat", ",", "data/fileBrowser/fileBrowser.model.maxhelp", ",", "data/fileBrowser/fileBrowser.model.maxpat", ",", "data/fileBrowser/fileBrowser.module.maxpat", ",", "data/fileBrowser/fileBrowser.view.maxpat", ",", "data/filename_generator/filename_generator.model.maxhelp", ",", "data/filename_generator/filename_generator.model.maxpat", ",", "data/filename_generator/filename_generator.module.maxpat", ",", "data/filename_generator/filename_generator.view.maxpat", ",", "data/hi/hi.model.maxhelp", ",", "data/hi/hi.model.maxpat", ",", "data/hi/hi.module.maxpat", ",", "data/hi/hi.view.maxpat", ",", "data/hipnoscope/hipnoscope.model.maxhelp", ",", "data/hipnoscope/hipnoscope.model.maxpat", ",", "data/hipnoscope/hipnoscope.one_blob_gen_view.maxpat", ",", "data/hipnoscope/hipnoscope.view.maxpat", ",", "data/hipnoscope/preset_converter.maxpat", ",", "data/mapper/function_options/j.function_freehand.maxpat", ",", "data/mapper/function_options/j.function_generic.maxpat", ",", "data/mapper/function_options/j.function_power.maxpat", ",", "data/mapper/mapper.model.maxhelp", ",", "data/mapper/mapper.model.maxpat", ",", "data/mapper/mapper.module.maxpat", ",", "data/mapper/mapper.view.maxpat", ",", "data/mapperBCF/bcfFader.view.maxpat", ",", "data/mapperBCF/bcfKey.view.maxpat", ",", "data/mapperBCF/bcfMapper.model.maxpat", ",", "data/mapperBCF/bcfMapper.view.maxpat", ",", "data/mapperBCF/bcfModels.maxpat", ",", "data/mapperBCF/bcfPress.view.maxpat", ",", "data/mapperBCF/bcfTrack.model.maxpat", ",", "data/mapperBCF/bcfTrack.view.maxpat", ",", "data/mapperBCF/bcfTurn.view.maxpat", ",", "data/mapperBCF/mapperBCF.model.maxhelp", ",", "data/mapperBCF/mapperBCF.model.maxpat", ",", "data/mapperBCF/mapperBCF.view.maxpat", ",", "data/midiin/midiin.model.maxhelp", ",", "data/midiin/midiin.model.maxpat", ",", "data/midiin/midiin.module.maxpat", ",", "data/midiin/midiin.view.maxpat", ",", "data/mouse/mouse.model.maxhelp", ",", "data/mouse/mouse.model.maxpat", ",", "data/mouse/mouse.module.maxpat", ",", "data/mouse/mouse.view.maxpat", ",", "data/multiModel/multiModel.model.maxhelp", ",", "data/multiModel/multiModel.model.maxpat", ",", "data/multiModel/multiModel.view.maxpat", ",", "data/qmetro/qmetro.model.maxhelp", ",", "data/qmetro/qmetro.model.maxpat", ",", "data/qmetro/qmetro.module.maxpat", ",", "data/qmetro/qmetro.view.maxpat", ",", "data/spacenavigator/spacenavigator.model.maxhelp", ",", "data/spacenavigator/spacenavigator.model.maxpat", ",", "data/spacenavigator/spacenavigator.view.maxpat", ",", "data/textwriter/textwriter.model.maxhelp", ",", "data/textwriter/textwriter.model.maxpat", ",", "data/textwriter/textwriter.view.maxpat", ",", "data/tosca/tosca.model.maxhelp", ",", "data/tosca/tosca.model.maxpat", ",", "data/tosca/tosca.module.maxpat", ",", "data/tosca/tosca.view.maxpat", ",", "data/wacom/wacom.model.maxhelp", ",", "data/wacom/wacom.model.maxpat", ",", "data/wacom/wacom.view.maxpat", ",", "openGL/geometry/gl_gridshape/gl_gridshape.model.maxhelp", ",", "openGL/geometry/gl_gridshape/gl_gridshape.model.maxpat", ",", "openGL/geometry/gl_gridshape/gl_gridshape.module.maxpat", ",", "openGL/geometry/gl_gridshape/gl_gridshape.view.maxpat", ",", "openGL/geometry/gl_text2d/gl_text2d.model.maxhelp", ",", "openGL/geometry/gl_text2d/gl_text2d.model.maxpat", ",", "openGL/geometry/gl_text2d/gl_text2d.module.maxpat", ",", "openGL/geometry/gl_text2d/gl_text2d.view.maxpat", ",", "openGL/geometry/gl_videoplane/gl_videoplane.model.maxhelp", ",", "openGL/geometry/gl_videoplane/gl_videoplane.model.maxpat", ",", "openGL/geometry/gl_videoplane/gl_videoplane.module.maxpat", ",", "openGL/geometry/gl_videoplane/gl_videoplane.view.maxpat", ",", "openGL/gl_render/gl_render.model.maxhelp", ",", "openGL/gl_render/gl_render.model.maxpat", ",", "openGL/gl_render/gl_render.module.maxpat", ",", "openGL/gl_render/gl_render.view.maxpat", ",", "openGL/gl_render/view_tabs/gl_render_advanced_view.maxpat", ",", "openGL/gl_render/view_tabs/gl_render_basic_view.maxpat", ",", "openGL/gl_render/view_tabs/gl_render_camera_view.maxpat", ",", "openGL/gl_render/view_tabs/gl_render_light_view.maxpat", ",", "openGL/source/gl_hap/gl_hap.model.maxhelp", ",", "openGL/source/gl_hap/gl_hap.model.maxpat", ",", "openGL/source/gl_hap/gl_hap.module.maxpat", ",", "openGL/source/gl_hap/gl_hap.view.maxpat", ",", "openGL/texture/gl_alphamixer/gl_alphamixer.model.maxhelp", ",", "openGL/texture/gl_alphamixer/gl_alphamixer.model.maxpat", ",", "openGL/texture/gl_alphamixer/gl_alphamixer.module.maxpat", ",", "openGL/texture/gl_alphamixer/gl_alphamixer.view.maxpat", ",", "openGL/texture/gl_background/gl_background.model.maxhelp", ",", "openGL/texture/gl_background/gl_background.model.maxpat", ",", "openGL/texture/gl_background/gl_background.module.maxpat", ",", "openGL/texture/gl_background/gl_background.view.maxpat", ",", "openGL/texture/gl_brcosa/gl_brcosa.model.maxhelp", ",", "openGL/texture/gl_brcosa/gl_brcosa.model.maxpat", ",", "openGL/texture/gl_brcosa/gl_brcosa.module.maxpat", ",", "openGL/texture/gl_brcosa/gl_brcosa.view.maxpat", ",", "openGL/texture/gl_chromakey/gl_chromakey.model.maxhelp", ",", "openGL/texture/gl_chromakey/gl_chromakey.model.maxpat", ",", "openGL/texture/gl_chromakey/gl_chromakey.module.maxpat", ",", "openGL/texture/gl_chromakey/gl_chromakey.view.maxpat", ",", "openGL/texture/gl_edgeblend/gl_edgeblend.model.maxhelp", ",", "openGL/texture/gl_edgeblend/gl_edgeblend.model.maxpat", ",", "openGL/texture/gl_edgeblend/gl_edgeblend.module.maxpat", ",", "openGL/texture/gl_edgeblend/gl_edgeblend.view.maxpat", ",", "openGL/texture/gl_framediff/gl_framediff.model.maxhelp", ",", "openGL/texture/gl_framediff/gl_framediff.model.maxpat", ",", "openGL/texture/gl_framediff/gl_framediff.module.maxpat", ",", "openGL/texture/gl_framediff/gl_framediff.view.maxpat", ",", "openGL/texture/gl_rota/gl_rota.model.maxhelp", ",", "openGL/texture/gl_rota/gl_rota.model.maxpat", ",", "openGL/texture/gl_rota/gl_rota.module.maxpat", ",", "openGL/texture/gl_rota/gl_rota.view.maxpat", ",", "openGL/texture/gl_syphonclient/gl_syphonclient.model.maxhelp", ",", "openGL/texture/gl_syphonclient/gl_syphonclient.model.maxpat", ",", "openGL/texture/gl_syphonclient/gl_syphonclient.module.maxpat", ",", "openGL/texture/gl_syphonclient/gl_syphonclient.view.maxpat", ",", "openGL/texture/gl_syphonserver/gl_syphonserver.model.maxhelp", ",", "openGL/texture/gl_syphonserver/gl_syphonserver.model.maxpat", ",", "openGL/texture/gl_syphonserver/gl_syphonserver.module.maxpat", ",", "openGL/texture/gl_syphonserver/gl_syphonserver.view.maxpat", ",", "openGL/world/gl_world.model.maxhelp", ",", "openGL/world/gl_world.model.maxpat", ",", "openGL/world/gl_world.module.maxpat", ",", "openGL/world/gl_world.view.maxpat", ",", "openGL/world/gl_world_basic_view.maxpat", ",", "openGL/world/gl_world_physic.view.maxpat", ",", "openGL/world/gl_world_render_view.maxpat", ",", "physics/phys_world/phys_world.model.maxhelp", ",", "physics/phys_world/phys_world.model.maxpat", ",", "physics/phys_world/phys_world.view.maxpat", ",", "video/fx/alphablend%/alphablend%.model.maxhelp", ",", "video/fx/alphablend%/alphablend%.model.maxpat", ",", "video/fx/alphablend%/alphablend%.module.maxpat", ",", "video/fx/alphablend%/alphablend%.view.maxpat", ",", "video/fx/avg4%/avg4%.model.maxhelp", ",", "video/fx/avg4%/avg4%.model.maxpat", ",", "video/fx/avg4%/avg4%.module.maxpat", ",", "video/fx/avg4%/avg4%.view.maxpat", ",", "video/fx/background%/background%.model.maxhelp", ",", "video/fx/background%/background%.model.maxpat", ",", "video/fx/background%/background%.module.maxpat", ",", "video/fx/background%/background%.view.maxpat", ",", "video/fx/blur%/blur%.model.maxhelp", ",", "video/fx/blur%/blur%.model.maxpat", ",", "video/fx/blur%/blur%.module.maxpat", ",", "video/fx/blur%/blur%.view.maxpat", ",", "video/fx/brcosa%/brcosa%.model.maxhelp", ",", "video/fx/brcosa%/brcosa%.model.maxpat", ",", "video/fx/brcosa%/brcosa%.module.maxpat", ",", "video/fx/brcosa%/brcosa%.view.maxpat", ",", "video/fx/chromakey%/chromakey%.model.maxhelp", ",", "video/fx/chromakey%/chromakey%.model.maxpat", ",", "video/fx/chromakey%/chromakey%.module.maxpat", ",", "video/fx/chromakey%/chromakey%.view.maxpat", ",", "video/fx/edge%/edge%.model.maxhelp", ",", "video/fx/edge%/edge%.model.maxpat", ",", "video/fx/edge%/edge%.module.maxpat", ",", "video/fx/edge%/edge%.view.maxpat", ",", "video/fx/emboss%/emboss%.model.maxhelp", ",", "video/fx/emboss%/emboss%.model.maxpat", ",", "video/fx/emboss%/emboss%.module.maxpat", ",", "video/fx/emboss%/emboss%.view.maxpat", ",", "video/fx/fft%/fft%.model.maxhelp", ",", "video/fx/fft%/fft%.model.maxpat", ",", "video/fx/fft%/fft%.module.maxpat", ",", "video/fx/fft%/fft%.view.maxpat", ",", "video/fx/fluoride%/fluoride%.model.maxhelp", ",", "video/fx/fluoride%/fluoride%.model.maxpat", ",", "video/fx/fluoride%/fluoride%.module.maxpat", ",", "video/fx/fluoride%/fluoride%.view.maxpat", ",", "video/fx/foreground_mask%/foreground_mask%.model.maxhelp", ",", "video/fx/foreground_mask%/foreground_mask%.model.maxpat", ",", "video/fx/foreground_mask%/foreground_mask%.module.maxpat", ",", "video/fx/foreground_mask%/foreground_mask%.view.maxpat", ",", "video/fx/ifft%/ifft%.model.maxhelp", ",", "video/fx/ifft%/ifft%.model.maxpat", ",", "video/fx/ifft%/ifft%.module.maxpat", ",", "video/fx/ifft%/ifft%.view.maxpat", ",", "video/fx/keyscreen%/keyscreen%.model.maxhelp", ",", "video/fx/keyscreen%/keyscreen%.model.maxpat", ",", "video/fx/keyscreen%/keyscreen%.module.maxpat", ",", "video/fx/keyscreen%/keyscreen%.view.maxpat", ",", "video/fx/mblur%/mblur%.model.maxhelp", ",", "video/fx/mblur%/mblur%.model.maxpat", ",", "video/fx/mblur%/mblur%.module.maxpat", ",", "video/fx/mblur%/mblur%.view.maxpat", ",", "video/fx/motion%/motion%.model.maxhelp", ",", "video/fx/motion%/motion%.model.maxpat", ",", "video/fx/motion%/motion%.module.maxpat", ",", "video/fx/motion%/motion%.view.maxpat", ",", "video/fx/motion2%/motion2%.model.maxhelp", ",", "video/fx/motion2%/motion2%.model.maxpat", ",", "video/fx/motion2%/motion2%.module.maxpat", ",", "video/fx/motion2%/motion2%.view.maxpat", ",", "video/fx/motiongram%/motiongram%.model.maxhelp", ",", "video/fx/motiongram%/motiongram%.model.maxpat", ",", "video/fx/motiongram%/motiongram%.module.maxpat", ",", "video/fx/motiongram%/motiongram%.view.maxpat", ",", "video/fx/op%/op%.model.maxhelp", ",", "video/fx/op%/op%.model.maxpat", ",", "video/fx/op%/op%.module.maxpat", ",", "video/fx/op%/op%.view.maxpat", ",", "video/fx/orsize%/orsize%.model.maxhelp", ",", "video/fx/orsize%/orsize%.model.maxpat", ",", "video/fx/orsize%/orsize%.module.maxpat", ",", "video/fx/orsize%/orsize%.view.maxpat", ",", "video/fx/plur%/plur%.model.maxhelp", ",", "video/fx/plur%/plur%.model.maxpat", ",", "video/fx/plur%/plur%.module.maxpat", ",", "video/fx/plur%/plur%.view.maxpat", ",", "video/fx/posterize%/posterize%.model.maxhelp", ",", "video/fx/posterize%/posterize%.model.maxpat", ",", "video/fx/posterize%/posterize%.module.maxpat", ",", "video/fx/posterize%/posterize%.view.maxpat", ",", "video/fx/rgb2gray%/rgb2gray%.model.maxhelp", ",", "video/fx/rgb2gray%/rgb2gray%.model.maxpat", ",", "video/fx/rgb2gray%/rgb2gray%.module.maxpat", ",", "video/fx/rgb2gray%/rgb2gray%.view.maxpat", ",", "video/fx/similarity%/similarity%.model.maxhelp", ",", "video/fx/similarity%/similarity%.model.maxpat", ",", "video/fx/similarity%/similarity%.module.maxpat", ",", "video/fx/similarity%/similarity%.view.maxpat", ",", "video/fx/slitscan%/slitscan%.model.maxhelp", ",", "video/fx/slitscan%/slitscan%.model.maxpat", ",", "video/fx/slitscan%/slitscan%.module.maxpat", ",", "video/fx/slitscan%/slitscan%.view.maxpat", ",", "video/fx/television%/television%.model.maxhelp", ",", "video/fx/television%/television%.model.maxpat", ",", "video/fx/television%/television%.module.maxpat", ",", "video/fx/television%/television%.view.maxpat", ",", "video/fx/wake%/wake%.model.maxhelp", ",", "video/fx/wake%/wake%.model.maxpat", ",", "video/fx/wake%/wake%.module.maxpat", ",", "video/fx/wake%/wake%.view.maxpat", ",", "video/fx/xfade%/xfade%.model.maxhelp", ",", "video/fx/xfade%/xfade%.model.maxpat", ",", "video/fx/xfade%/xfade%.module.maxpat", ",", "video/fx/xfade%/xfade%.view.maxpat", ",", "video/fx/yfade%/yfade%.model.maxhelp", ",", "video/fx/yfade%/yfade%.model.maxpat", ",", "video/fx/yfade%/yfade%.module.maxpat", ",", "video/fx/yfade%/yfade%.view.maxpat", ",", "video/output/preview%/preview%.model.maxhelp", ",", "video/output/preview%/preview%.module.maxpat", ",", "video/output/record%/record%.model.maxhelp", ",", "video/output/record%/record%.model.maxpat", ",", "video/output/record%/record%.module.maxpat", ",", "video/output/record%/record%.view.maxpat", ",", "video/output/window%/window%.model.maxhelp", ",", "video/output/window%/window%.model.maxpat", ",", "video/output/window%/window%.module.maxpat", ",", "video/output/window%/window%.view.maxpat", ",", "video/sources/grab%/grab%.model.maxhelp", ",", "video/sources/grab%/grab%.model.maxpat", ",", "video/sources/grab%/grab%.module.maxpat", ",", "video/sources/grab%/grab%.view.maxpat", ",", "video/sources/input%/input%.model.maxhelp", ",", "video/sources/input%/input%.model.maxpat", ",", "video/sources/input%/input%.module.maxpat", ",", "video/sources/input%/input%.ui.maxpat", ",", "video/sources/input%/input%.view.maxpat", ",", "video/sources/movie%/movie%.model.maxhelp", ",", "video/sources/movie%/movie%.model.maxpat", ",", "video/sources/movie%/movie%.module.maxpat", ",", "video/sources/movie%/movie%.view.maxpat", ",", "video/sources/noise%/noise%.model.maxhelp", ",", "video/sources/noise%/noise%.model.maxpat", ",", "video/sources/noise%/noise%.module.maxpat", ",", "video/sources/noise%/noise%.view.maxpat" ],
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 95.0, 103.0, 224.0, 20.0 ],
					"prefix" : "work:/Users/reno/JamomaMax/Jamoma/patchers/modules/",
					"types" : "JSON"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-4",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 329.0, 270.0, 30.0, 19.0 ],
					"text" : "qlim"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-5",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 329.0, 249.0, 30.0, 19.0 ],
					"text" : "qlim"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-6",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 329.0, 228.0, 30.0, 19.0 ],
					"text" : "qlim"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-7",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 110.0, 217.0, 62.0, 19.0 ],
					"text" : "unpack s s"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-9",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "count" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 76.0, 252.0, 600.0, 426.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 10.0,
						"default_fontface" : 0,
						"default_fontname" : "Verdana",
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
						"boxes" : [ 							{
								"box" : 								{
									"fontname" : "Verdana",
									"fontsize" : 10.0,
									"id" : "obj-24",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "count", "bang", "clear" ],
									"patching_rect" : [ 54.0, 75.0, 299.0, 19.0 ],
									"text" : "t count b clear"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Verdana",
									"fontsize" : 10.0,
									"id" : "obj-23",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 194.0, 149.0, 54.0, 19.0 ],
									"text" : "tosymbol"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Verdana",
									"fontsize" : 10.0,
									"id" : "obj-22",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 194.0, 126.0, 153.0, 19.0 ],
									"text" : "sprintf %spatchers/modules"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-18",
									"maxclass" : "button",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 54.0, 51.0, 20.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Verdana",
									"fontsize" : 10.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 194.0, 104.0, 102.0, 19.0 ],
									"text" : "j.jamomaPath"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Verdana",
									"fontsize" : 10.0,
									"id" : "obj-10",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 194.0, 220.0, 82.0, 19.0 ],
									"text" : "prepend prefix"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-13",
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 54.0, 13.0, 15.0, 15.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-14",
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 54.0, 289.0, 15.0, 15.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-14", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 203.5, 263.5, 63.0, 263.5 ],
									"source" : [ "obj-10", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-18", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-13", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-24", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-18", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-23", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-22", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-10", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-23", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-14", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 343.5, 289.0, 63.0, 289.0 ],
									"source" : [ "obj-24", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-14", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-24", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-24", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-22", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-4", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 95.0, 74.0, 60.0, 19.0 ],
					"saved_object_attributes" : 					{
						"default_fontface" : 0,
						"default_fontname" : "Verdana",
						"default_fontsize" : 10.0,
						"description" : "",
						"digest" : "",
						"fontface" : 0,
						"fontname" : "Verdana",
						"fontsize" : 10.0,
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-10",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "bang", "" ],
					"patching_rect" : [ 112.0, 581.0, 51.0, 19.0 ],
					"text" : "sel done"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-12",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 329.0, 292.0, 30.0, 19.0 ],
					"text" : "qlim"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-13",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 10,
							"architecture" : "x86"
						}
,
						"rect" : [ 653.0, 201.0, 272.0, 259.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 10.0,
						"default_fontface" : 0,
						"default_fontname" : "Verdana",
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
						"boxes" : [ 							{
								"box" : 								{
									"fontname" : "Verdana",
									"fontsize" : 10.0,
									"id" : "obj-7",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 74.0, 128.0, 49.0, 17.0 ],
									"text" : "$1 html"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Verdana",
									"fontsize" : 10.0,
									"id" : "obj-25",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 74.0, 151.0, 118.0, 19.0 ],
									"text" : "tosymbol @separator"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Verdana",
									"fontsize" : 10.0,
									"id" : "obj-23",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 5,
									"outlettype" : [ "", "", "", "", "" ],
									"patching_rect" : [ 45.0, 75.0, 135.0, 19.0 ],
									"text" : "regexp (.*\\\\.)([\\\\w]*)"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-4",
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 30.0, 15.0, 15.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-5",
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 74.0, 204.0, 15.0, 15.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-23", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-25", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-23", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-4", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-25", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 305.0, 424.0, 59.0, 19.0 ],
					"saved_object_attributes" : 					{
						"default_fontface" : 0,
						"default_fontname" : "Verdana",
						"default_fontsize" : 10.0,
						"description" : "",
						"digest" : "",
						"fontface" : 0,
						"fontname" : "Verdana",
						"fontsize" : 10.0,
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p genpath"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-14",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 112.0, 489.0, 240.0, 19.0 ],
					"text" : "prepend /themodule/documentation/generate"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-15",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 112.0, 466.0, 212.0, 19.0 ],
					"text" : "zl reg"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-17",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 112.0, 559.0, 227.0, 19.0 ],
					"text" : "route /themodule/documentation/generate"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-18",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 112.0, 535.0, 208.0, 19.0 ],
					"text" : "j.receive /themodule/*"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-19",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 112.0, 512.0, 103.0, 19.0 ],
					"text" : "j.send /themodule"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-20",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 329.0, 209.0, 15.0, 15.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-21",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 112.0, 668.0, 30.0, 19.0 ],
					"text" : "qlim"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-22",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 112.0, 602.0, 30.0, 19.0 ],
					"text" : "qlim"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-28",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 185.0, 647.0, 132.0, 17.0 ],
					"text" : "script delete /themodule"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-29",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "bang", "bang" ],
					"patching_rect" : [ 112.0, 624.0, 92.0, 19.0 ],
					"text" : "b 2"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-30",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 378.0, 675.0, 68.0, 19.0 ],
					"save" : [ "#N", "thispatcher", ";", "#Q", "end", ";" ],
					"text" : "thispatcher"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"frgb" : 0.0,
					"id" : "obj-32",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 5.0, 126.0, 91.0, 31.0 ],
					"text" : "just the module file names..."
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 12.0,
					"frgb" : 0.0,
					"id" : "obj-33",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 126.0, 27.0, 154.0, 36.0 ],
					"text" : "GENERATE NEW HTML FOR ALL MODULES!"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-35",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 112.0, 705.0, 46.0, 17.0 ],
					"text" : "resume"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-36",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 112.0, 646.0, 68.0, 19.0 ],
					"text" : "delay 1000"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-38",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 78.0, 288.0, 79.0, 19.0 ],
					"text" : "print MODULE"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-40",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "pause", "int" ],
					"patching_rect" : [ 432.0, 260.0, 52.0, 19.0 ],
					"text" : "t pause i"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-41",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 3,
					"outlettype" : [ "bang", "bang", "int" ],
					"patching_rect" : [ 400.0, 238.0, 51.0, 19.0 ],
					"text" : "uzi 10 0"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"frgb" : 0.0,
					"id" : "obj-42",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 459.0, 194.0, 62.0, 19.0 ],
					"text" : "num items"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-43",
					"maxclass" : "number",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "int", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 400.0, 197.0, 51.0, 19.0 ],
					"triscale" : 0.9
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-44",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 300.0, 132.0, 69.0, 19.0 ],
					"text" : "route count"
				}

			}
, 			{
				"box" : 				{
					"fgcolor" : [ 0.317647, 0.709804, 0.321569, 1.0 ],
					"id" : "obj-45",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 95.0, 30.0, 32.0, 32.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"frgb" : 0.0,
					"id" : "obj-54",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 451.0, 240.0, 117.0, 19.0 ],
					"text" : "2. For each module..."
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"frgb" : 0.0,
					"id" : "obj-58",
					"linecount" : 8,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 3.0, 558.0, 102.0, 104.0 ],
					"text" : "when the HTML generation is done, the module sends us a message - then we can clean up and move on to the next module..."
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-34",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 5,
					"outlettype" : [ "", "", "", "", "" ],
					"patching_rect" : [ 96.0, 160.0, 437.0, 19.0 ],
					"text" : "regexp .*/(audio|video|control|data|openGL|spatialization)/.*/(.*\\\\.module.maxpat)"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-22", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-10", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-35", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 338.5, 355.0, 96.0, 374.0, 96.0, 701.0, 121.5, 701.0 ],
					"source" : [ "obj-12", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-13", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-19", 0 ],
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
					"source" : [ "obj-15", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-17", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-17", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-18", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-20", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-35", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-21", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-29", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-22", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-30", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 194.5, 667.0, 387.5, 667.0 ],
					"source" : [ "obj-28", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-282", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-28", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-36", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-34", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-20", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 419.0, 184.5, 338.0, 184.5 ],
					"source" : [ "obj-34", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-61", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-34", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-62", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-34", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-63", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-34", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-34", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-41", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 121.5, 731.0, 610.5, 731.0, 610.5, 219.0, 409.5, 219.0 ],
					"source" : [ "obj-35", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-21", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-36", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-4", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-41", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 441.5, 288.0, 394.0, 288.0, 394.0, 228.0, 409.5, 228.0 ],
					"source" : [ "obj-40", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-55", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-40", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-40", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-41", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-41", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-43", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-43", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 309.5, 154.0, 540.0, 154.0, 540.0, 188.0, 409.5, 188.0 ],
					"source" : [ "obj-44", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-96", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 309.5, 154.0, 375.25, 154.0, 375.25, 101.0, 402.0, 101.0 ],
					"source" : [ "obj-44", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-9", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-45", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-5", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-59", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 474.5, 309.0, 587.0, 309.0, 587.0, 243.0, 587.0, 243.0, 587.0, 95.0, 104.5, 95.0 ],
					"source" : [ "obj-55", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-20", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 187.5, 206.5, 338.0, 206.5 ],
					"source" : [ "obj-57", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-34", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 228.5, 157.0, 105.5, 157.0 ],
					"source" : [ "obj-57", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-44", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 309.5, 131.0, 309.5, 131.0 ],
					"source" : [ "obj-59", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-57", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 207.0, 128.0, 105.5, 128.0 ],
					"source" : [ "obj-59", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-96", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 104.5, 125.0, 369.5, 125.0, 369.5, 103.0, 388.5, 103.0 ],
					"source" : [ "obj-59", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-6", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-83", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-7", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-97", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 162.5, 316.5, 387.5, 316.5 ],
					"source" : [ "obj-7", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-38", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-83", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-59", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-9", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-89", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-96", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-30", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-97", 0 ]
				}

			}
 ],
		"parameters" : 		{

		}
,
		"dependency_cache" : [ 			{
				"name" : "j.jamomaPath.maxpat",
				"bootpath" : "/Users/reno/JamomaMax/Jamoma/patchers/components/data/jamomaPath",
				"patcherrelativepath" : "../../patchers/components/data/jamomaPath",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.initialized.maxpat",
				"bootpath" : "/Users/reno/JamomaMax/Jamoma/patchers/components/data/initialized",
				"patcherrelativepath" : "../../patchers/components/data/initialized",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.send.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.receive.mxo",
				"type" : "iLaX"
			}
 ]
	}

}
