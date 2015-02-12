{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 7,
			"minor" : 0,
			"revision" : 1,
			"architecture" : "x64",
			"modernui" : 1
		}
,
		"rect" : [ 594.0, 79.0, 1007.0, 896.0 ],
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
		"boxes" : [ 			{
				"box" : 				{
					"id" : "obj-11",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 7,
							"minor" : 0,
							"revision" : 1,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"rect" : [ 35.0, 105.0, 1032.0, 791.0 ],
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
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 256.0, 472.0, 39.0, 20.0 ],
									"style" : "",
									"text" : "zl rev"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 14.0,
									"id" : "obj-23",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 76.0, 37.0, 469.0, 22.0 ],
									"style" : "",
									"text" : "Scan patchers/modules folder and build a list of all module help patchers"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-19",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 4,
									"outlettype" : [ "", "", "", "" ],
									"patching_rect" : [ 822.0, 302.14386, 127.0, 20.0 ],
									"saved_object_attributes" : 									{
										"embed" : 0
									}
,
									"style" : "",
									"text" : "coll _objects_to_test_"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-18",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "bang", "count" ],
									"patching_rect" : [ 76.0, 218.998596, 57.0, 20.0 ],
									"style" : "",
									"text" : "t b count"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-17",
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 822.0, 116.0, 25.0, 25.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-16",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "clear", "zlclear" ],
									"patching_rect" : [ 822.0, 168.998596, 171.0, 20.0 ],
									"style" : "",
									"text" : "t clear zlclear"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-92",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 256.0, 435.998596, 83.0, 20.0 ],
									"style" : "",
									"text" : "zl group 8000"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-81",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 3,
									"outlettype" : [ "bang", "bang", "int" ],
									"patching_rect" : [ 593.0, 349.998596, 54.0, 20.0 ],
									"style" : "",
									"text" : "uzi 10 0"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-80",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 593.0, 320.998596, 72.0, 20.0 ],
									"style" : "",
									"text" : "route count"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-2",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 5,
									"outlettype" : [ "", "", "", "", "" ],
									"patching_rect" : [ 256.0, 368.998596, 219.0, 20.0 ],
									"style" : "",
									"text" : "regexp .maxhelp @substitute .maxhelp"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-48",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "int" ],
									"patching_rect" : [ 256.0, 334.998596, 58.0, 20.0 ],
									"style" : "",
									"text" : "strippath"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-37",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 256.0, 218.998596, 88.0, 20.0 ],
									"style" : "",
									"text" : "prepend prefix"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-35",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 256.0, 193.998596, 60.0, 20.0 ],
									"style" : "",
									"text" : "tosymbol"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-32",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 5,
									"outlettype" : [ "", "", "", "", "" ],
									"patching_rect" : [ 256.0, 168.998596, 317.0, 20.0 ],
									"style" : "",
									"text" : "regexp integrationTests/Modular @substitute components"
								}

							}
, 							{
								"box" : 								{
									"autopopulate" : 1,
									"depth" : 7,
									"id" : "obj-3",
									"items" : [ "audio", ",", "audio/stereo", ",", "audio/stereo/Delay", ",", "audio/stereo/Delay/delay~", ",", "audio/stereo/Delay/delay~/delay~.model.html", ",", "audio/stereo/Delay/delay~/delay~.model.maxhelp", ",", "audio/stereo/Delay/delay~/delay~.model.maxpat", ",", "audio/stereo/Delay/delay~/delay~.model.presets.txt", ",", "audio/stereo/Delay/delay~/delay~.module.maxpat", ",", "audio/stereo/Delay/delay~/delay~.view.maxpat", ",", "audio/stereo/Delay/echo~", ",", "audio/stereo/Delay/echo~/echo~.model.html", ",", "audio/stereo/Delay/echo~/echo~.model.maxhelp", ",", "audio/stereo/Delay/echo~/echo~.model.maxpat", ",", "audio/stereo/Delay/echo~/echo~.model.presets.txt", ",", "audio/stereo/Delay/echo~/echo~.module.maxpat", ",", "audio/stereo/Delay/echo~/echo~.view.maxpat", ",", "audio/stereo/Delay/multidelay~", ",", "audio/stereo/Delay/multidelay~/multidelay~.model.html", ",", "audio/stereo/Delay/multidelay~/multidelay~.model.maxhelp", ",", "audio/stereo/Delay/multidelay~/multidelay~.model.maxpat", ",", "audio/stereo/Delay/multidelay~/multidelay~.model.presets.txt", ",", "audio/stereo/Delay/multidelay~/multidelay~.module.maxpat", ",", "audio/stereo/Delay/multidelay~/multidelay~.view.maxpat", ",", "audio/stereo/Distortion", ",", "audio/stereo/Distortion/degrade~", ",", "audio/stereo/Distortion/degrade~/degrade~.model.maxhelp", ",", "audio/stereo/Distortion/degrade~/degrade~.model.maxpat", ",", "audio/stereo/Distortion/degrade~/degrade~.model.presets.txt", ",", "audio/stereo/Distortion/degrade~/degrade~.module.maxpat", ",", "audio/stereo/Distortion/degrade~/degrade~.view.maxpat", ",", "audio/stereo/Distortion/saturation~", ",", "audio/stereo/Distortion/saturation~/saturation~.model.html", ",", "audio/stereo/Distortion/saturation~/saturation~.model.maxhelp", ",", "audio/stereo/Distortion/saturation~/saturation~.model.maxpat", ",", "audio/stereo/Distortion/saturation~/saturation~.model.presets.txt", ",", "audio/stereo/Distortion/saturation~/saturation~.module.maxpat", ",", "audio/stereo/Distortion/saturation~/saturation~.view.maxpat", ",", "audio/stereo/Dynamics", ",", "audio/stereo/Dynamics/limiter~", ",", "audio/stereo/Dynamics/limiter~/limiter.parametersAndMessages.maxpat", ",", "audio/stereo/Dynamics/limiter~/limiter~.model.html", ",", "audio/stereo/Dynamics/limiter~/limiter~.model.maxhelp", ",", "audio/stereo/Dynamics/limiter~/limiter~.model.maxpat", ",", "audio/stereo/Dynamics/limiter~/limiter~.model.presets.txt", ",", "audio/stereo/Dynamics/limiter~/limiter~.module.maxpat", ",", "audio/stereo/Dynamics/limiter~/limiter~.panel.widget.maxpat", ",", "audio/stereo/Dynamics/limiter~/limiter~.view.maxpat", ",", "audio/stereo/Dynamics/noisegate~", ",", "audio/stereo/Dynamics/noisegate~/noisegate~.model.html", ",", "audio/stereo/Dynamics/noisegate~/noisegate~.model.maxhelp", ",", "audio/stereo/Dynamics/noisegate~/noisegate~.model.maxpat", ",", "audio/stereo/Dynamics/noisegate~/noisegate~.model.presets.txt", ",", "audio/stereo/Dynamics/noisegate~/noisegate~.module.maxpat", ",", "audio/stereo/Dynamics/noisegate~/noisegate~.view.maxpat", ",", "audio/stereo/EQ", ",", "audio/stereo/EQ/equalizer~", ",", "audio/stereo/EQ/equalizer~/equalizer~.model.maxhelp", ",", "audio/stereo/EQ/equalizer~/equalizer~.model.maxpat", ",", "audio/stereo/EQ/equalizer~/equalizer~.model.presets.txt", ",", "audio/stereo/EQ/equalizer~/equalizer~.module.maxpat", ",", "audio/stereo/EQ/equalizer~/equalizer~.view.maxpat", ",", "audio/stereo/EQ/equalizer~/equalizer~_large.view.maxpat", ",", "audio/stereo/EQ/equalizer~/equalizer~_wide.view.maxpat", ",", "audio/stereo/EQ/equalizer~/jmod.equalizer~.html", ",", "audio/stereo/EQ/filter~", ",", "audio/stereo/EQ/filter~/filter~.model.html", ",", "audio/stereo/EQ/filter~/filter~.model.maxhelp", ",", "audio/stereo/EQ/filter~/filter~.model.maxpat", ",", "audio/stereo/EQ/filter~/filter~.model.presets.txt", ",", "audio/stereo/EQ/filter~/filter~.module.maxpat", ",", "audio/stereo/EQ/filter~/filter~.view.maxpat", ",", "audio/stereo/Imaging", ",", "audio/stereo/Imaging/balance~", ",", "audio/stereo/Imaging/balance~/balance~.model.html", ",", "audio/stereo/Imaging/balance~/balance~.model.maxhelp", ",", "audio/stereo/Imaging/balance~/balance~.model.maxpat", ",", "audio/stereo/Imaging/balance~/balance~.model.presets.txt", ",", "audio/stereo/Imaging/balance~/balance~.module.maxpat", ",", "audio/stereo/Imaging/balance~/balance~view.maxpat", ",", "audio/stereo/Imaging/crossfade~", ",", "audio/stereo/Imaging/crossfade~/crossfade~.model.html", ",", "audio/stereo/Imaging/crossfade~/crossfade~.model.maxhelp", ",", "audio/stereo/Imaging/crossfade~/crossfade~.model.maxpat", ",", "audio/stereo/Imaging/crossfade~/crossfade~.model.presets.txt", ",", "audio/stereo/Imaging/crossfade~/crossfade~.module.maxpat", ",", "audio/stereo/Imaging/crossfade~/crossfade~.view.maxpat", ",", "audio/stereo/Imaging/panning~", ",", "audio/stereo/Imaging/panning~/panning~.model.maxhelp", ",", "audio/stereo/Imaging/panning~/panning~.model.maxpat", ",", "audio/stereo/Imaging/panning~/panning~.model.presets.txt", ",", "audio/stereo/Imaging/panning~/panning~.module.maxpat", ",", "audio/stereo/Imaging/panning~/panning~.view.maxpat", ",", "audio/stereo/Metering", ",", "audio/stereo/Metering/scope~", ",", "audio/stereo/Metering/scope~/scope~.model.maxhelp", ",", "audio/stereo/Metering/scope~/scope~.model.maxpat", ",", "audio/stereo/Metering/scope~/scope~.model.presets.txt", ",", "audio/stereo/Metering/scope~/scope~.module.maxpat", ",", "audio/stereo/Metering/scope~/scope~.view.html", ",", "audio/stereo/Metering/scope~/scope~.view.maxpat", ",", "audio/stereo/Modulation", ",", "audio/stereo/Modulation/hilbertModulator~", ",", "audio/stereo/Modulation/hilbertModulator~/hilbertModulator~.model.html", ",", "audio/stereo/Modulation/hilbertModulator~/hilbertModulator~.model.maxhelp", ",", "audio/stereo/Modulation/hilbertModulator~/hilbertModulator~.model.maxpat", ",", "audio/stereo/Modulation/hilbertModulator~/hilbertModulator~.model.presets.txt", ",", "audio/stereo/Modulation/hilbertModulator~/hilbertModulator~.module.maxpat", ",", "audio/stereo/Modulation/hilbertModulator~/hilbertModulator~.view.maxpat", ",", "audio/stereo/Modulation/tremolo~", ",", "audio/stereo/Modulation/tremolo~/tremolo~.model.html", ",", "audio/stereo/Modulation/tremolo~/tremolo~.model.maxhelp", ",", "audio/stereo/Modulation/tremolo~/tremolo~.model.maxpat", ",", "audio/stereo/Modulation/tremolo~/tremolo~.model.presets.txt", ",", "audio/stereo/Modulation/tremolo~/tremolo~.module.maxpat", ",", "audio/stereo/Modulation/tremolo~/tremolo~.view.maxpat", ",", "audio/stereo/Output", ",", "audio/stereo/Output/output~", ",", "audio/stereo/Output/output~/output~.model.html", ",", "audio/stereo/Output/output~/output~.model.maxhelp", ",", "audio/stereo/Output/output~/output~.model.maxpat", ",", "audio/stereo/Output/output~/output~.model.presets.txt", ",", "audio/stereo/Output/output~/output~.module.maxpat", ",", "audio/stereo/Output/output~/output~.view.maxpat", ",", "audio/stereo/Output/record~", ",", "audio/stereo/Output/record~/record.parametersAndMessages.maxpat", ",", "audio/stereo/Output/record~/record~.model.maxhelp", ",", "audio/stereo/Output/record~/record~.model.maxpat", ",", "audio/stereo/Output/record~/record~.model.presets.txt", ",", "audio/stereo/Output/record~/record~.module.maxpat", ",", "audio/stereo/Output/record~/record~.view.maxpat", ",", "audio/stereo/Plugins", ",", "audio/stereo/Plugins/vst~", ",", "audio/stereo/Plugins/vst~/j.vst_bind_to_parameter.maxpat", ",", "audio/stereo/Plugins/vst~/vst~.model.html", ",", "audio/stereo/Plugins/vst~/vst~.model.maxhelp", ",", "audio/stereo/Plugins/vst~/vst~.model.maxpat", ",", "audio/stereo/Plugins/vst~/vst~.model.presets.txt", ",", "audio/stereo/Plugins/vst~/vst~.module.maxpat", ",", "audio/stereo/Plugins/vst~/vst~.view.maxpat", ",", "audio/stereo/Sources", ",", "audio/stereo/Sources/10harmonics~", ",", "audio/stereo/Sources/10harmonics~/10harmonics~.model.html", ",", "audio/stereo/Sources/10harmonics~/10harmonics~.model.maxhelp", ",", "audio/stereo/Sources/10harmonics~/10harmonics~.model.maxpat", ",", "audio/stereo/Sources/10harmonics~/10harmonics~.model.presets.txt", ",", "audio/stereo/Sources/10harmonics~/10harmonics~.module.maxpat", ",", "audio/stereo/Sources/10harmonics~/10harmonics~.view.maxpat", ",", "audio/stereo/Sources/input~", ",", "audio/stereo/Sources/input~/input~.model.html", ",", "audio/stereo/Sources/input~/input~.model.maxhelp", ",", "audio/stereo/Sources/input~/input~.model.maxpat", ",", "audio/stereo/Sources/input~/input~.model.presets.txt", ",", "audio/stereo/Sources/input~/input~.module.maxpat", ",", "audio/stereo/Sources/input~/input~.view.maxpat", ",", "audio/stereo/Sources/risset_glissando", ",", "audio/stereo/Sources/risset_glissando/risset_glissando~.model.html", ",", "audio/stereo/Sources/risset_glissando/risset_glissando~.model.maxhelp", ",", "audio/stereo/Sources/risset_glissando/risset_glissando~.model.maxpat", ",", "audio/stereo/Sources/risset_glissando/risset_glissando~.model.presets.txt", ",", "audio/stereo/Sources/risset_glissando/risset_glissando~.module.maxpat", ",", "audio/stereo/Sources/risset_glissando/risset_glissando~.view.maxpat", ",", "audio/stereo/Sources/sine~", ",", "audio/stereo/Sources/sine~/sine~.model.html", ",", "audio/stereo/Sources/sine~/sine~.model.maxhelp", ",", "audio/stereo/Sources/sine~/sine~.model.maxpat", ",", "audio/stereo/Sources/sine~/sine~.model.presets.txt", ",", "audio/stereo/Sources/sine~/sine~.module.maxpat", ",", "audio/stereo/Sources/sine~/sine~.view.maxpat", ",", "audio/stereo/Sources/soundfile~", ",", "audio/stereo/Sources/soundfile~/soundfile~.model.maxhelp", ",", "audio/stereo/Sources/soundfile~/soundfile~.model.maxpat", ",", "audio/stereo/Sources/soundfile~/soundfile~.model.presets.txt", ",", "audio/stereo/Sources/soundfile~/soundfile~.module.maxpat", ",", "audio/stereo/Sources/soundfile~/soundfile~.view.maxpat", ",", "audio/stereo/Spectral", ",", "audio/stereo/Spectral/spectral_gate~", ",", "audio/stereo/Spectral/spectral_gate~/j.spectral_gate~.lib.maxpat", ",", "audio/stereo/Spectral/spectral_gate~/spectral_gate~.model.html", ",", "audio/stereo/Spectral/spectral_gate~/spectral_gate~.model.maxhelp", ",", "audio/stereo/Spectral/spectral_gate~/spectral_gate~.model.maxpat", ",", "audio/stereo/Spectral/spectral_gate~/spectral_gate~.model.presets.txt", ",", "audio/stereo/Spectral/spectral_gate~/spectral_gate~.module.maxpat", ",", "audio/stereo/Spectral/spectral_gate~/spectral_gate~.view.maxpat", ",", "audio/stereo/Spectral/spectral_shift~", ",", "audio/stereo/Spectral/spectral_shift~/j.spectral_shift_voice~.maxpat", ",", "audio/stereo/Spectral/spectral_shift~/spectral_shift~.model.html", ",", "audio/stereo/Spectral/spectral_shift~/spectral_shift~.model.maxhelp", ",", "audio/stereo/Spectral/spectral_shift~/spectral_shift~.model.maxpat", ",", "audio/stereo/Spectral/spectral_shift~/spectral_shift~.model.presets.txt", ",", "audio/stereo/Spectral/spectral_shift~/spectral_shift~.module.maxpat", ",", "audio/stereo/Spectral/spectral_shift~/spectral_shift~.view.maxpat", ",", "audio/surround", ",", "audio/surround/ambi.adjust=", ",", "audio/surround/ambi.adjust=/ambi.adjust=.gain_helper.maxpat", ",", "audio/surround/ambi.adjust=/ambi.adjust=.model.html", ",", "audio/surround/ambi.adjust=/ambi.adjust=.model.maxhelp", ",", "audio/surround/ambi.adjust=/ambi.adjust=.model.maxpat", ",", "audio/surround/ambi.adjust=/ambi.adjust=.model.presets.txt", ",", "audio/surround/ambi.adjust=/ambi.adjust=.module.maxpat", ",", "audio/surround/ambi.adjust=/ambi.adjust=.view.maxpat", ",", "audio/surround/ambi.decode=", ",", "audio/surround/ambi.decode=/ambi.decode=.model.html", ",", "audio/surround/ambi.decode=/ambi.decode=.model.maxhelp", ",", "audio/surround/ambi.decode=/ambi.decode=.model.maxpat", ",", "audio/surround/ambi.decode=/ambi.decode=.model.presets.txt", ",", "audio/surround/ambi.decode=/ambi.decode=.module.maxpat", ",", "audio/surround/ambi.decode=/ambi.decode=.view.maxpat", ",", "audio/surround/ambi.encodeM=", ",", "audio/surround/ambi.encodeM=/ambi.encodeM=.model.html", ",", "audio/surround/ambi.encodeM=/ambi.encodeM=.model.maxhelp", ",", "audio/surround/ambi.encodeM=/ambi.encodeM=.model.maxpat", ",", "audio/surround/ambi.encodeM=/ambi.encodeM=.model.presets.txt", ",", "audio/surround/ambi.encodeM=/ambi.encodeM=.module.maxpat", ",", "audio/surround/ambi.encodeM=/ambi.encodeM=.view.maxpat", ",", "audio/surround/ambipanning=", ",", "audio/surround/ambipanning=/ambipanning=.model.html", ",", "audio/surround/ambipanning=/ambipanning=.model.maxhelp", ",", "audio/surround/ambipanning=/ambipanning=.model.maxpat", ",", "audio/surround/ambipanning=/ambipanning=.model.presets.txt", ",", "audio/surround/ambipanning=/ambipanning=.module.maxpat", ",", "audio/surround/ambipanning=/ambipanning=.view.maxpat", ",", "audio/surround/ambipanning=/j.ambipan_source.maxpat", ",", "audio/surround/ambisonics=", ",", "audio/surround/ambisonics=/ambisonics=.model.html", ",", "audio/surround/ambisonics=/ambisonics=.model.maxhelp", ",", "audio/surround/ambisonics=/ambisonics=.model.maxpat", ",", "audio/surround/ambisonics=/ambisonics=.model.presets.txt", ",", "audio/surround/ambisonics=/ambisonics=.module.maxpat", ",", "audio/surround/ambisonics=/ambisonics=.view.maxpat", ",", "audio/surround/aux=", ",", "audio/surround/aux=/aux=.model.html", ",", "audio/surround/aux=/aux=.model.maxhelp", ",", "audio/surround/aux=/aux=.model.maxpat", ",", "audio/surround/aux=/aux=.model.presets.txt", ",", "audio/surround/aux=/aux=.module.maxpat", ",", "audio/surround/aux=/aux=.view.maxpat", ",", "audio/surround/dbap.bformat=", ",", "audio/surround/dbap.bformat=/dbap.bformat=.model.html", ",", "audio/surround/dbap.bformat=/dbap.bformat=.model.maxhelp", ",", "audio/surround/dbap.bformat=/dbap.bformat=.model.maxpat", ",", "audio/surround/dbap.bformat=/dbap.bformat=.model.presets.txt", ",", "audio/surround/dbap.bformat=/dbap.bformat=.module.maxpat", ",", "audio/surround/dbap.bformat=/dbap.bformat=.view.maxpat", ",", "audio/surround/dbap=", ",", "audio/surround/dbap=/dbap=.model.maxhelp", ",", "audio/surround/dbap=/dbap=.model.maxpat", ",", "audio/surround/dbap=/dbap=.model.presets.txt", ",", "audio/surround/dbap=/dbap=.module.html", ",", "audio/surround/dbap=/dbap=.module.maxpat", ",", "audio/surround/doppler=", ",", "audio/surround/doppler=/doppler=.model.html", ",", "audio/surround/doppler=/doppler=.model.maxhelp", ",", "audio/surround/doppler=/doppler=.model.maxpat", ",", "audio/surround/doppler=/doppler=.model.presets.txt", ",", "audio/surround/doppler=/doppler=.module.maxpat", ",", "audio/surround/doppler=/doppler=.view.maxpat", ",", "audio/surround/doppler=/j.ch.doppler=.maxpat", ",", "audio/surround/doppler=/j.doppler=.js", ",", "audio/surround/info=", ",", "audio/surround/info=/info=.model.html", ",", "audio/surround/info=/info=.model.maxhelp", ",", "audio/surround/info=/info=.model.maxpat", ",", "audio/surround/info=/info=.model.presets.txt", ",", "audio/surround/info=/info=.module.maxpat", ",", "audio/surround/info=/info=.view.maxpat", ",", "audio/surround/input=", ",", "audio/surround/input=/input.timeDisplay.maxpat", ",", "audio/surround/input=/input=.model.html", ",", "audio/surround/input=/input=.model.maxhelp", ",", "audio/surround/input=/input=.model.maxpat", ",", "audio/surround/input=/input=.model.presets.txt", ",", "audio/surround/input=/input=.module.maxpat", ",", "audio/surround/input=/input=.view.maxpat", ",", "audio/surround/limiter=", ",", "audio/surround/limiter=/limiter=.model.html", ",", "audio/surround/limiter=/limiter=.model.maxhelp", ",", "audio/surround/limiter=/limiter=.model.maxpat", ",", "audio/surround/limiter=/limiter=.model.presets.txt", ",", "audio/surround/limiter=/limiter=.module.maxpat", ",", "audio/surround/limiter=/limiter=.view.maxpat", ",", "audio/surround/meters=", ",", "audio/surround/meters=/meters=.model.html", ",", "audio/surround/meters=/meters=.model.maxhelp", ",", "audio/surround/meters=/meters=.model.maxpat", ",", "audio/surround/meters=/meters=.model.presets.txt", ",", "audio/surround/meters=/meters=.module.maxpat", ",", "audio/surround/meters=/meters=.view.maxpat", ",", "audio/surround/multi.in=", ",", "audio/surround/multi.in=/multi.in=.model.html", ",", "audio/surround/multi.in=/multi.in=.model.maxhelp", ",", "audio/surround/multi.in=/multi.in=.model.maxpat", ",", "audio/surround/multi.in=/multi.in=.model.presets.txt", ",", "audio/surround/multi.in=/multi.in=.module.maxpat", ",", "audio/surround/multi.in=/multi.in=.view.maxpat", ",", "audio/surround/multi.out=", ",", "audio/surround/multi.out=/multi.out=.model.html", ",", "audio/surround/multi.out=/multi.out=.model.maxhelp", ",", "audio/surround/multi.out=/multi.out=.model.maxpat", ",", "audio/surround/multi.out=/multi.out=.model.presets.txt", ",", "audio/surround/multi.out=/multi.out=.module.maxpat", ",", "audio/surround/multi.out=/multi.out=.view.maxpat", ",", "audio/surround/output=", ",", "audio/surround/output=/output=.model.html", ",", "audio/surround/output=/output=.model.maxhelp", ",", "audio/surround/output=/output=.model.maxpat", ",", "audio/surround/output=/output=.model.presets.txt", ",", "audio/surround/output=/output=.module.maxpat", ",", "audio/surround/output=/output=.view.maxpat", ",", "audio/surround/position=", ",", "audio/surround/position=/position=.model.html", ",", "audio/surround/position=/position=.model.presets.txt", ",", "audio/surround/position=/position=.view.maxpat", ",", "audio/surround/race=", ",", "audio/surround/race=/pingpong.poly.maxpat", ",", "audio/surround/race=/race=.model.html", ",", "audio/surround/race=/race=.model.maxhelp", ",", "audio/surround/race=/race=.model.maxpat", ",", "audio/surround/race=/race=.model.presets.txt", ",", "audio/surround/race=/race=.module.maxpat", ",", "audio/surround/race=/race=.view.maxpat", ",", "audio/surround/rolloff=", ",", "audio/surround/rolloff=/j.rolloff=.js", ",", "audio/surround/rolloff=/rolloff=.model.html", ",", "audio/surround/rolloff=/rolloff=.model.maxhelp", ",", "audio/surround/rolloff=/rolloff=.model.maxpat", ",", "audio/surround/rolloff=/rolloff=.model.presets.txt", ",", "audio/surround/rolloff=/rolloff=.module.maxpat", ",", "audio/surround/rolloff=/rolloff=.view.maxpat", ",", "audio/surround/setup=", ",", "audio/surround/setup=/j.channel.xyz_setup.maxpat", ",", "audio/surround/setup=/setup=.model.html", ",", "audio/surround/setup=/setup=.model.maxhelp", ",", "audio/surround/setup=/setup=.model.presets.txt", ",", "audio/surround/setup=/setup=.module.maxpat", ",", "audio/surround/setup=/setup=.view.maxpat", ",", "audio/surround/speaker.delay=", ",", "audio/surround/speaker.delay=/j.speaker.delays=.js", ",", "audio/surround/speaker.delay=/speaker.delay=.model.html", ",", "audio/surround/speaker.delay=/speaker.delay=.model.maxhelp", ",", "audio/surround/speaker.delay=/speaker.delay=.model.maxpat", ",", "audio/surround/speaker.delay=/speaker.delay=.model.presets.txt", ",", "audio/surround/speaker.delay=/speaker.delay=.module.maxpat", ",", "audio/surround/speaker.delay=/speaker.delay=.view.maxpat", ",", "audio/surround/speaker.distamp=", ",", "audio/surround/speaker.distamp=/speaker.distamp=.model.html", ",", "audio/surround/speaker.distamp=/speaker.distamp=.model.maxhelp", ",", "audio/surround/speaker.distamp=/speaker.distamp=.model.maxpat", ",", "audio/surround/speaker.distamp=/speaker.distamp=.model.presets.txt", ",", "audio/surround/speaker.distamp=/speaker.distamp=.module.maxpat", ",", "audio/surround/speaker.distamp=/speaker.distamp=.view.maxpat", ",", "audio/surround/vbap=", ",", "audio/surround/vbap=/vbap=.model.html", ",", "audio/surround/vbap=/vbap=.model.maxhelp", ",", "audio/surround/vbap=/vbap=.model.maxpat", ",", "audio/surround/vbap=/vbap=.model.presets.txt", ",", "audio/surround/vbap=/vbap=.module.maxpat", ",", "audio/surround/vbap=/vbap=.view.maxpat", ",", "audio/surround/waveform_viewer", ",", "audio/surround/waveform_viewer/waveform_viewer=.model.html", ",", "audio/surround/waveform_viewer/waveform_viewer=.model.maxhelp", ",", "audio/surround/waveform_viewer/waveform_viewer=.model.maxpat", ",", "audio/surround/waveform_viewer/waveform_viewer=.model.presets.txt", ",", "audio/surround/zoomH2ambi=", ",", "audio/surround/zoomH2ambi=/zoomH2ambi=.model.html", ",", "audio/surround/zoomH2ambi=/zoomH2ambi=.model.maxhelp", ",", "audio/surround/zoomH2ambi=/zoomH2ambi=.model.maxpat", ",", "audio/surround/zoomH2ambi=/zoomH2ambi=.model.presets.txt", ",", "audio/surround/zoomH2ambi=/zoomH2ambi=.module.maxpat", ",", "audio/surround/zoomH2ambi=/zoomH2ambi=.view.maxpat", ",", "data", ",", "data/condition", ",", "data/condition/condition.model.html", ",", "data/condition/condition.model.maxhelp", ",", "data/condition/condition.model.maxpat", ",", "data/condition/condition.model.presets.txt", ",", "data/condition/condition.view.maxpat", ",", "data/cue-manager", ",", "data/cue-manager/cue_manager.model.maxhelp", ",", "data/cue-manager/cue_manager.model.maxpat", ",", "data/cue-manager/cue_manager.module.maxpat", ",", "data/cue-manager/cue_manager.view.maxpat", ",", "data/cue-manager/cuelist.txt", ",", "data/cue_script", ",", "data/cue_script/cue_script.demoscript.txt", ",", "data/cue_script/cue_script.model.html", ",", "data/cue_script/cue_script.model.maxhelp", ",", "data/cue_script/cue_script.model.maxpat", ",", "data/cue_script/cue_script.model.presets.txt", ",", "data/cue_script/cue_script.module.maxpat", ",", "data/cue_script/cue_script.view.maxpat", ",", "data/fileBrowser", ",", "data/fileBrowser/fileBrowser.model.html", ",", "data/fileBrowser/fileBrowser.model.maxhelp", ",", "data/fileBrowser/fileBrowser.model.maxpat", ",", "data/fileBrowser/fileBrowser.model.presets.txt", ",", "data/fileBrowser/fileBrowser.module.maxpat", ",", "data/fileBrowser/fileBrowser.view.maxpat", ",", "data/filename_generator", ",", "data/filename_generator/filename_generator.model.html", ",", "data/filename_generator/filename_generator.model.maxhelp", ",", "data/filename_generator/filename_generator.model.maxpat", ",", "data/filename_generator/filename_generator.model.presets.txt", ",", "data/filename_generator/filename_generator.module.maxpat", ",", "data/filename_generator/filename_generator.view.maxpat", ",", "data/hi", ",", "data/hi/hi.model.html", ",", "data/hi/hi.model.maxhelp", ",", "data/hi/hi.model.maxpat", ",", "data/hi/hi.model.presets.txt", ",", "data/hi/hi.module.maxpat", ",", "data/hi/hi.view.maxpat", ",", "data/mapper", ",", "data/mapper/function_options", ",", "data/mapper/function_options/j.function_freehand.maxpat", ",", "data/mapper/function_options/j.function_generic.maxpat", ",", "data/mapper/function_options/j.function_power.maxpat", ",", "data/mapper/mapper.model.maxhelp", ",", "data/mapper/mapper.model.maxpat", ",", "data/mapper/mapper.model.presets.txt", ",", "data/mapper/mapper.module.maxpat", ",", "data/mapper/mapper.view.maxpat", ",", "data/mapperBCF", ",", "data/mapperBCF/bcfFader.view.maxpat", ",", "data/mapperBCF/bcfKey.view.maxpat", ",", "data/mapperBCF/bcfMapper.model.maxpat", ",", "data/mapperBCF/bcfMapper.view.maxpat", ",", "data/mapperBCF/bcfModels.maxpat", ",", "data/mapperBCF/bcfPress.view.maxpat", ",", "data/mapperBCF/bcfTrack.model.maxpat", ",", "data/mapperBCF/bcfTrack.view.maxpat", ",", "data/mapperBCF/bcfTurn.view.maxpat", ",", "data/mapperBCF/mapperBCF.model.maxhelp", ",", "data/mapperBCF/mapperBCF.model.maxpat", ",", "data/mapperBCF/mapperBCF.view.maxpat", ",", "data/midiin", ",", "data/midiin/midiin.model.html", ",", "data/midiin/midiin.model.maxhelp", ",", "data/midiin/midiin.model.maxpat", ",", "data/midiin/midiin.model.presets.txt", ",", "data/midiin/midiin.module.maxpat", ",", "data/midiin/midiin.view.maxpat", ",", "data/mouse", ",", "data/mouse/mouse.model.html", ",", "data/mouse/mouse.model.maxhelp", ",", "data/mouse/mouse.model.maxpat", ",", "data/mouse/mouse.model.presets.txt", ",", "data/mouse/mouse.module.maxpat", ",", "data/mouse/mouse.view.maxpat", ",", "data/multiModel", ",", "data/multiModel/multiModel.model.maxhelp", ",", "data/multiModel/multiModel.model.maxpat", ",", "data/multiModel/multiModel.model.presets.txt", ",", "data/multiModel/multiModel.view.maxpat", ",", "data/qmetro", ",", "data/qmetro/qmetro.model.html", ",", "data/qmetro/qmetro.model.maxhelp", ",", "data/qmetro/qmetro.model.maxpat", ",", "data/qmetro/qmetro.model.presets.txt", ",", "data/qmetro/qmetro.module.maxpat", ",", "data/qmetro/qmetro.view.maxpat", ",", "data/spacenavigator", ",", "data/spacenavigator/spacenavigator.model.html", ",", "data/spacenavigator/spacenavigator.model.maxhelp", ",", "data/spacenavigator/spacenavigator.model.maxpat", ",", "data/spacenavigator/spacenavigator.model.presets.txt", ",", "data/spacenavigator/spacenavigator.view.maxpat", ",", "data/textwriter", ",", "data/textwriter/textwriter.model.html", ",", "data/textwriter/textwriter.model.maxhelp", ",", "data/textwriter/textwriter.model.maxpat", ",", "data/textwriter/textwriter.model.presets.txt", ",", "data/textwriter/textwriter.view.maxpat", ",", "data/tosca", ",", "data/tosca/tosca.model.maxpat", ",", "data/wacom", ",", "data/wacom/wacom.model.html", ",", "data/wacom/wacom.model.maxhelp", ",", "data/wacom/wacom.model.maxpat", ",", "data/wacom/wacom.model.presets.txt", ",", "data/wacom/wacom.view.maxpat", ",", "openGL", ",", "openGL/geometry", ",", "openGL/geometry/gl_gridshape", ",", "openGL/geometry/gl_gridshape/gl_gridshape.model.maxhelp", ",", "openGL/geometry/gl_gridshape/gl_gridshape.model.maxpat", ",", "openGL/geometry/gl_gridshape/gl_gridshape.model.presets.txt", ",", "openGL/geometry/gl_gridshape/gl_gridshape.module.maxpat", ",", "openGL/geometry/gl_gridshape/gl_gridshape.view.maxpat", ",", "openGL/geometry/gl_text2d", ",", "openGL/geometry/gl_text2d/gl_text2d.model.maxhelp", ",", "openGL/geometry/gl_text2d/gl_text2d.model.maxpat", ",", "openGL/geometry/gl_text2d/gl_text2d.model.presets.txt", ",", "openGL/geometry/gl_text2d/gl_text2d.module.maxpat", ",", "openGL/geometry/gl_text2d/gl_text2d.view.maxpat", ",", "openGL/geometry/gl_videoplane", ",", "openGL/geometry/gl_videoplane/gl_videoplane.model.maxhelp", ",", "openGL/geometry/gl_videoplane/gl_videoplane.model.maxpat", ",", "openGL/geometry/gl_videoplane/gl_videoplane.model.presets.txt", ",", "openGL/geometry/gl_videoplane/gl_videoplane.module.maxpat", ",", "openGL/geometry/gl_videoplane/gl_videoplane.view.maxpat", ",", "openGL/gl_render", ",", "openGL/gl_render/gl_render.model.maxhelp", ",", "openGL/gl_render/gl_render.model.maxpat", ",", "openGL/gl_render/gl_render.model.presets.txt", ",", "openGL/gl_render/gl_render.module.maxpat", ",", "openGL/gl_render/gl_render.view.maxpat", ",", "openGL/gl_render/view_tabs", ",", "openGL/gl_render/view_tabs/gl_render_advanced_view.maxpat", ",", "openGL/gl_render/view_tabs/gl_render_basic_view.maxpat", ",", "openGL/gl_render/view_tabs/gl_render_camera_view.maxpat", ",", "openGL/gl_render/view_tabs/gl_render_light_view.maxpat", ",", "openGL/source", ",", "openGL/source/gl_hap", ",", "openGL/source/gl_hap/gl_hap.model.maxhelp", ",", "openGL/source/gl_hap/gl_hap.model.maxpat", ",", "openGL/source/gl_hap/gl_hap.model.presets.txt", ",", "openGL/source/gl_hap/gl_hap.module.maxpat", ",", "openGL/source/gl_hap/gl_hap.view.maxpat", ",", "openGL/texture", ",", "openGL/texture/gl_alphamixer", ",", "openGL/texture/gl_alphamixer/gl_alphamixer.model.maxhelp", ",", "openGL/texture/gl_alphamixer/gl_alphamixer.model.maxpat", ",", "openGL/texture/gl_alphamixer/gl_alphamixer.model.presets.txt", ",", "openGL/texture/gl_alphamixer/gl_alphamixer.module.maxpat", ",", "openGL/texture/gl_alphamixer/gl_alphamixer.view.maxpat", ",", "openGL/texture/gl_alphamixer/shaders", ",", "openGL/texture/gl_alphamixer/shaders/j.4ch_alphamixer.jxs", ",", "openGL/texture/gl_alphamixer/shaders/j.4ch_alphamixer.vp.glsl", ",", "openGL/texture/gl_background", ",", "openGL/texture/gl_background/gl_background.model.maxhelp", ",", "openGL/texture/gl_background/gl_background.model.maxpat", ",", "openGL/texture/gl_background/gl_background.model.presets.txt", ",", "openGL/texture/gl_background/gl_background.module.maxpat", ",", "openGL/texture/gl_background/gl_background.view.maxpat", ",", "openGL/texture/gl_brcosa", ",", "openGL/texture/gl_brcosa/gl_brcosa.model.maxhelp", ",", "openGL/texture/gl_brcosa/gl_brcosa.model.maxpat", ",", "openGL/texture/gl_brcosa/gl_brcosa.model.presets.txt", ",", "openGL/texture/gl_brcosa/gl_brcosa.module.maxpat", ",", "openGL/texture/gl_brcosa/gl_brcosa.view.maxpat", ",", "openGL/texture/gl_chromakey", ",", "openGL/texture/gl_chromakey/gl_chromakey.model.maxhelp", ",", "openGL/texture/gl_chromakey/gl_chromakey.model.maxpat", ",", "openGL/texture/gl_chromakey/gl_chromakey.model.presets.txt", ",", "openGL/texture/gl_chromakey/gl_chromakey.module.maxpat", ",", "openGL/texture/gl_chromakey/gl_chromakey.view.maxpat", ",", "openGL/texture/gl_edgeblend", ",", "openGL/texture/gl_edgeblend/gl_edgeblend.model.maxhelp", ",", "openGL/texture/gl_edgeblend/gl_edgeblend.model.maxpat", ",", "openGL/texture/gl_edgeblend/gl_edgeblend.model.presets.txt", ",", "openGL/texture/gl_edgeblend/gl_edgeblend.module.maxpat", ",", "openGL/texture/gl_edgeblend/gl_edgeblend.view.maxpat", ",", "openGL/texture/gl_framediff", ",", "openGL/texture/gl_framediff/gl_framediff.model.maxhelp", ",", "openGL/texture/gl_framediff/gl_framediff.model.maxpat", ",", "openGL/texture/gl_framediff/gl_framediff.module.maxpat", ",", "openGL/texture/gl_framediff/gl_framediff.view.maxpat", ",", "openGL/texture/gl_framediff/gl_framediff_help.model.presets.txt", ",", "openGL/texture/gl_framediff/gl_videoplane_help.model.presets.txt", ",", "openGL/texture/gl_rota", ",", "openGL/texture/gl_rota/gl_rota.model.maxhelp", ",", "openGL/texture/gl_rota/gl_rota.model.maxpat", ",", "openGL/texture/gl_rota/gl_rota.model.presets.txt", ",", "openGL/texture/gl_rota/gl_rota.module.maxpat", ",", "openGL/texture/gl_rota/gl_rota.view.maxpat", ",", "openGL/texture/gl_syphonclient", ",", "openGL/texture/gl_syphonclient/gl_syphonclient.model.maxhelp", ",", "openGL/texture/gl_syphonclient/gl_syphonclient.model.maxpat", ",", "openGL/texture/gl_syphonclient/gl_syphonclient.module.maxpat", ",", "openGL/texture/gl_syphonclient/gl_syphonclient.view.maxpat", ",", "openGL/texture/gl_syphonserver", ",", "openGL/texture/gl_syphonserver/gl_syphonserver.model.maxhelp", ",", "openGL/texture/gl_syphonserver/gl_syphonserver.model.maxpat", ",", "openGL/texture/gl_syphonserver/gl_syphonserver.module.maxpat", ",", "openGL/texture/gl_syphonserver/gl_syphonserver.view.maxpat", ",", "openGL/world", ",", "openGL/world/gl_world.model.maxhelp", ",", "openGL/world/gl_world.model.maxpat", ",", "openGL/world/gl_world.model.presets.txt", ",", "openGL/world/gl_world.module.maxpat", ",", "openGL/world/gl_world.view.maxpat", ",", "openGL/world/gl_world_basic_view.maxpat", ",", "openGL/world/gl_world_physic.view.maxpat", ",", "openGL/world/gl_world_render_view.maxpat", ",", "physics", ",", "physics/phys_world", ",", "physics/phys_world/phys_world.model.maxhelp", ",", "physics/phys_world/phys_world.model.maxpat", ",", "physics/phys_world/phys_world.model.presets.txt", ",", "physics/phys_world/phys_world.view.maxpat", ",", "video", ",", "video/fx", ",", "video/fx/alphablend%", ",", "video/fx/alphablend%/alphablend%.model.maxhelp", ",", "video/fx/alphablend%/alphablend%.model.maxpat", ",", "video/fx/alphablend%/alphablend%.model.presets.txt", ",", "video/fx/alphablend%/alphablend%.module.maxpat", ",", "video/fx/alphablend%/alphablend%.view.maxpat", ",", "video/fx/avg4%", ",", "video/fx/avg4%/avg4%.model.maxhelp", ",", "video/fx/avg4%/avg4%.model.maxpat", ",", "video/fx/avg4%/avg4%.model.presets.txt", ",", "video/fx/avg4%/avg4%.module.maxpat", ",", "video/fx/avg4%/avg4%.view.maxpat", ",", "video/fx/background%", ",", "video/fx/background%/background%.model.maxhelp", ",", "video/fx/background%/background%.model.maxpat", ",", "video/fx/background%/background%.model.presets.txt", ",", "video/fx/background%/background%.module.maxpat", ",", "video/fx/background%/background%.view.maxpat", ",", "video/fx/blur%", ",", "video/fx/blur%/blur%.model.maxhelp", ",", "video/fx/blur%/blur%.model.maxpat", ",", "video/fx/blur%/blur%.model.presets.txt", ",", "video/fx/blur%/blur%.module.maxpat", ",", "video/fx/blur%/blur%.view.maxpat", ",", "video/fx/brcosa%", ",", "video/fx/brcosa%/brcosa%.model.maxhelp", ",", "video/fx/brcosa%/brcosa%.model.maxpat", ",", "video/fx/brcosa%/brcosa%.model.presets.txt", ",", "video/fx/brcosa%/brcosa%.module.maxpat", ",", "video/fx/brcosa%/brcosa%.view.maxpat", ",", "video/fx/chromakey%", ",", "video/fx/chromakey%/chromakey%.model.maxhelp", ",", "video/fx/chromakey%/chromakey%.model.maxpat", ",", "video/fx/chromakey%/chromakey%.model.presets.txt", ",", "video/fx/chromakey%/chromakey%.module.maxpat", ",", "video/fx/chromakey%/chromakey%.view.maxpat", ",", "video/fx/edge%", ",", "video/fx/edge%/edge%.model.maxhelp", ",", "video/fx/edge%/edge%.model.maxpat", ",", "video/fx/edge%/edge%.model.presets.txt", ",", "video/fx/edge%/edge%.module.maxpat", ",", "video/fx/edge%/edge%.view.maxpat", ",", "video/fx/emboss%", ",", "video/fx/emboss%/emboss%.model.maxhelp", ",", "video/fx/emboss%/emboss%.model.maxpat", ",", "video/fx/emboss%/emboss%.model.presets.txt", ",", "video/fx/emboss%/emboss%.module.maxpat", ",", "video/fx/emboss%/emboss%.view.maxpat", ",", "video/fx/fft%", ",", "video/fx/fft%/fft%.model.maxhelp", ",", "video/fx/fft%/fft%.model.maxpat", ",", "video/fx/fft%/fft%.model.presets.txt", ",", "video/fx/fft%/fft%.module.maxpat", ",", "video/fx/fft%/fft%.view.maxpat", ",", "video/fx/fluoride%", ",", "video/fx/fluoride%/fluoride%.model.maxhelp", ",", "video/fx/fluoride%/fluoride%.model.maxpat", ",", "video/fx/fluoride%/fluoride%.model.presets.txt", ",", "video/fx/fluoride%/fluoride%.module.maxpat", ",", "video/fx/fluoride%/fluoride%.view.maxpat", ",", "video/fx/foreground_mask%", ",", "video/fx/foreground_mask%/foreground_mask%.model.maxhelp", ",", "video/fx/foreground_mask%/foreground_mask%.model.maxpat", ",", "video/fx/foreground_mask%/foreground_mask%.model.presets.txt", ",", "video/fx/foreground_mask%/foreground_mask%.module.maxpat", ",", "video/fx/foreground_mask%/foreground_mask%.view.maxpat", ",", "video/fx/ifft%", ",", "video/fx/ifft%/ifft%.model.maxhelp", ",", "video/fx/ifft%/ifft%.model.maxpat", ",", "video/fx/ifft%/ifft%.model.presets.txt", ",", "video/fx/ifft%/ifft%.module.maxpat", ",", "video/fx/ifft%/ifft%.view.maxpat", ",", "video/fx/keyscreen%", ",", "video/fx/keyscreen%/keyscreen%.model.maxhelp", ",", "video/fx/keyscreen%/keyscreen%.model.maxpat", ",", "video/fx/keyscreen%/keyscreen%.model.presets.txt", ",", "video/fx/keyscreen%/keyscreen%.module.maxpat", ",", "video/fx/keyscreen%/keyscreen%.view.maxpat", ",", "video/fx/mblur%", ",", "video/fx/mblur%/mblur%.model.maxhelp", ",", "video/fx/mblur%/mblur%.model.maxpat", ",", "video/fx/mblur%/mblur%.model.presets.txt", ",", "video/fx/mblur%/mblur%.module.maxpat", ",", "video/fx/mblur%/mblur%.view.maxpat", ",", "video/fx/motion%", ",", "video/fx/motion%/motion%.model.maxhelp", ",", "video/fx/motion%/motion%.model.maxpat", ",", "video/fx/motion%/motion%.model.presets.txt", ",", "video/fx/motion%/motion%.module.maxpat", ",", "video/fx/motion%/motion%.view.maxpat", ",", "video/fx/motion2%", ",", "video/fx/motion2%/motion2%.model.maxhelp", ",", "video/fx/motion2%/motion2%.model.maxpat", ",", "video/fx/motion2%/motion2%.model.presets.txt", ",", "video/fx/motion2%/motion2%.module.maxpat", ",", "video/fx/motion2%/motion2%.view.maxpat", ",", "video/fx/motiongram%", ",", "video/fx/motiongram%/motiongram%.model.maxhelp", ",", "video/fx/motiongram%/motiongram%.model.maxpat", ",", "video/fx/motiongram%/motiongram%.model.presets.txt", ",", "video/fx/motiongram%/motiongram%.module.maxpat", ",", "video/fx/motiongram%/motiongram%.view.maxpat", ",", "video/fx/op%", ",", "video/fx/op%/op%.model.maxhelp", ",", "video/fx/op%/op%.model.maxpat", ",", "video/fx/op%/op%.model.presets.txt", ",", "video/fx/op%/op%.module.maxpat", ",", "video/fx/op%/op%.view.maxpat", ",", "video/fx/orsize%", ",", "video/fx/orsize%/orsize%.model.maxhelp", ",", "video/fx/orsize%/orsize%.model.maxpat", ",", "video/fx/orsize%/orsize%.model.presets.txt", ",", "video/fx/orsize%/orsize%.module.maxpat", ",", "video/fx/orsize%/orsize%.view.maxpat", ",", "video/fx/plur%", ",", "video/fx/plur%/plur%.model.maxhelp", ",", "video/fx/plur%/plur%.model.maxpat", ",", "video/fx/plur%/plur%.model.presets.txt", ",", "video/fx/plur%/plur%.module.maxpat", ",", "video/fx/plur%/plur%.view.maxpat", ",", "video/fx/posterize%", ",", "video/fx/posterize%/posterize%.model.maxhelp", ",", "video/fx/posterize%/posterize%.model.maxpat", ",", "video/fx/posterize%/posterize%.model.presets.txt", ",", "video/fx/posterize%/posterize%.module.maxpat", ",", "video/fx/posterize%/posterize%.view.maxpat", ",", "video/fx/rgb2gray%", ",", "video/fx/rgb2gray%/rgb2gray%.model.maxhelp", ",", "video/fx/rgb2gray%/rgb2gray%.model.maxpat", ",", "video/fx/rgb2gray%/rgb2gray%.model.presets.txt", ",", "video/fx/rgb2gray%/rgb2gray%.module.maxpat", ",", "video/fx/rgb2gray%/rgb2gray%.view.maxpat", ",", "video/fx/similarity%", ",", "video/fx/similarity%/similarity%.model.maxhelp", ",", "video/fx/similarity%/similarity%.model.maxpat", ",", "video/fx/similarity%/similarity%.model.presets.txt", ",", "video/fx/similarity%/similarity%.module.maxpat", ",", "video/fx/similarity%/similarity%.view.maxpat", ",", "video/fx/slitscan%", ",", "video/fx/slitscan%/slitscan%.model.maxhelp", ",", "video/fx/slitscan%/slitscan%.model.maxpat", ",", "video/fx/slitscan%/slitscan%.model.presets.txt", ",", "video/fx/slitscan%/slitscan%.module.maxpat", ",", "video/fx/slitscan%/slitscan%.view.maxpat", ",", "video/fx/television%", ",", "video/fx/television%/television%.model.maxhelp", ",", "video/fx/television%/television%.model.maxpat", ",", "video/fx/television%/television%.model.presets.txt", ",", "video/fx/television%/television%.module.maxpat", ",", "video/fx/television%/television%.view.maxpat", ",", "video/fx/wake%", ",", "video/fx/wake%/wake%.model.maxhelp", ",", "video/fx/wake%/wake%.model.maxpat", ",", "video/fx/wake%/wake%.model.presets.txt", ",", "video/fx/wake%/wake%.module.maxpat", ",", "video/fx/wake%/wake%.view.maxpat", ",", "video/fx/xfade%", ",", "video/fx/xfade%/xfade%.model.maxhelp", ",", "video/fx/xfade%/xfade%.model.maxpat", ",", "video/fx/xfade%/xfade%.model.presets.txt", ",", "video/fx/xfade%/xfade%.module.maxpat", ",", "video/fx/xfade%/xfade%.view.maxpat", ",", "video/fx/yfade%", ",", "video/fx/yfade%/yfade%.model.maxhelp", ",", "video/fx/yfade%/yfade%.model.maxpat", ",", "video/fx/yfade%/yfade%.model.presets.txt", ",", "video/fx/yfade%/yfade%.module.maxpat", ",", "video/fx/yfade%/yfade%.view.maxpat", ",", "video/output", ",", "video/output/preview%", ",", "video/output/preview%/preview%.model.maxhelp", ",", "video/output/preview%/preview%.model.presets.txt", ",", "video/output/preview%/preview%.module.maxpat", ",", "video/output/record%", ",", "video/output/record%/record%.model.maxhelp", ",", "video/output/record%/record%.model.maxpat", ",", "video/output/record%/record%.model.presets.txt", ",", "video/output/record%/record%.module.maxpat", ",", "video/output/record%/record%.view.maxpat", ",", "video/output/window%", ",", "video/output/window%/window%.model.maxhelp", ",", "video/output/window%/window%.model.maxpat", ",", "video/output/window%/window%.model.presets.txt", ",", "video/output/window%/window%.module.maxpat", ",", "video/output/window%/window%.view.maxpat", ",", "video/sources", ",", "video/sources/grab%", ",", "video/sources/grab%/grab%.model.maxhelp", ",", "video/sources/grab%/grab%.model.maxpat", ",", "video/sources/grab%/grab%.model.presets.txt", ",", "video/sources/grab%/grab%.module.maxpat", ",", "video/sources/grab%/grab%.view.maxpat", ",", "video/sources/input%", ",", "video/sources/input%/input%.model.maxhelp", ",", "video/sources/input%/input%.model.maxpat", ",", "video/sources/input%/input%.model.presets.txt", ",", "video/sources/input%/input%.module.maxpat", ",", "video/sources/input%/input%.ui.maxpat", ",", "video/sources/input%/input%.view.maxpat", ",", "video/sources/movie%", ",", "video/sources/movie%/movie%.model.maxhelp", ",", "video/sources/movie%/movie%.model.maxpat", ",", "video/sources/movie%/movie%.model.presets.txt", ",", "video/sources/movie%/movie%.module.maxpat", ",", "video/sources/movie%/movie%.view.maxpat", ",", "video/sources/noise%", ",", "video/sources/noise%/noise%.model.maxhelp", ",", "video/sources/noise%/noise%.model.maxpat", ",", "video/sources/noise%/noise%.model.presets.txt", ",", "video/sources/noise%/noise%.module.maxpat", ",", "video/sources/noise%/noise%.view.maxpat" ],
									"maxclass" : "umenu",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "int", "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 256.0, 287.998596, 356.0, 20.0 ],
									"prefix" : "Macintosh HD:/Users/lossius/dev/Jamoma/Jamoma/Implementations/Max/Jamoma/patchers/modules/",
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-4",
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 76.0, 116.0, 25.0, 25.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-5",
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 256.0, 116.0, 25.0, 25.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-10",
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 256.0, 695.998596, 25.0, 25.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-6",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 256.0, 510.357544, 27.0, 20.0 ],
									"style" : "",
									"text" : "iter"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-78",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 256.0, 580.071228, 24.0, 20.0 ],
									"style" : "",
									"text" : "t b"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-39",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 256.0, 663.14386, 33.0, 20.0 ],
									"style" : "",
									"text" : "+ 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-83",
									"maxclass" : "number",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 256.0, 633.14386, 51.0, 20.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-82",
									"maxclass" : "newobj",
									"numinlets" : 5,
									"numoutlets" : 4,
									"outlettype" : [ "int", "", "", "int" ],
									"patching_rect" : [ 256.0, 606.64386, 92.0, 20.0 ],
									"style" : "",
									"text" : "counter 1 1000"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-20",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 256.0, 538.357544, 98.0, 20.0 ],
									"style" : "",
									"text" : "prepend insert 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-15",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 4,
									"outlettype" : [ "", "", "", "" ],
									"patching_rect" : [ 361.0, 606.64386, 127.0, 20.0 ],
									"saved_object_attributes" : 									{
										"embed" : 0
									}
,
									"style" : "",
									"text" : "coll _objects_to_test_"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-6", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-19", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-16", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 831.5, 270.998596, 265.5, 270.998596 ],
									"source" : [ "obj-16", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-92", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 983.5, 419.999298, 265.5, 419.999298 ],
									"source" : [ "obj-16", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-16", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-17", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-18", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-92", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-18", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-92", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-2", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-15", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-20", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-78", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-20", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-48", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-3", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-80", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-3", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-35", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-32", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-37", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-35", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-37", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-10", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-39", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-18", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-4", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-2", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-48", 0 ]
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
									"destination" : [ "obj-20", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-6", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-82", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-78", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-81", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-80", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 637.5, 380.998596, 674.0, 380.998596, 674.0, 277.998596, 265.5, 277.998596 ],
									"source" : [ "obj-81", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-83", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-82", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-39", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-83", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-92", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 248.0, 190.002838, 165.0, 22.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"style" : "",
						"tags" : ""
					}
,
					"style" : "default",
					"text" : "p buildListOfHelpPatchers"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-23",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 321.0, 135.858948, 70.0, 22.0 ],
					"save" : [ "#N", "thispatcher", ";", "#Q", "end", ";" ],
					"style" : "default",
					"text" : "thispatcher"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-64",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 474.0, 794.0, 39.0, 22.0 ],
					"style" : "default",
					"text" : "zl rev"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-63",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 474.0, 822.0, 95.0, 22.0 ],
					"style" : "default",
					"text" : "sprintf %s -- %s"
				}

			}
, 			{
				"box" : 				{
					"coll_data" : 					{
						"count" : 2,
						"data" : [ 							{
								"key" : 0,
								"value" : [ "failed" ]
							}
, 							{
								"key" : 1,
								"value" : [ "passed" ]
							}
 ]
					}
,
					"id" : "obj-60",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 474.0, 730.0, 60.0, 22.0 ],
					"saved_object_attributes" : 					{
						"embed" : 1
					}
,
					"style" : "default",
					"text" : "coll"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-16",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 474.0, 762.0, 55.0, 22.0 ],
					"style" : "default",
					"text" : "pack s s"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-15",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 474.0, 849.0, 75.0, 22.0 ],
					"style" : "default",
					"text" : "print Testing"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-1",
					"linecount" : 3,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 450.0, 183.360352, 261.0, 47.0 ],
					"style" : "default",
					"text" : "This test opens the help patches sequencially, and leave them open for 0.5 seconds to check that we do not get error messages (or crashes)."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-20",
					"linecount" : 3,
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 399.0, 675.148132, 211.0, 49.0 ],
					"style" : "default",
					"text" : "test.assert NoErrorsRunningDSPinHelpPatchers @tags Jamoma Foundation"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.0, 0.533333, 0.168627, 1.0 ],
					"id" : "obj-17",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 399.0, 647.146729, 20.0, 20.0 ],
					"style" : "default"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-13",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 399.0, 623.0, 35.0, 22.0 ],
					"style" : "default",
					"text" : "== 0"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-12",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 399.0, 596.366089, 33.0, 22.0 ],
					"style" : "default",
					"text" : "i"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-105",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "int" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 7,
							"minor" : 0,
							"revision" : 1,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"rect" : [ 897.0, 92.0, 696.0, 696.0 ],
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
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-88",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 84.0, 55.0, 20.0 ],
									"style" : "",
									"text" : "gate 1 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-71",
									"maxclass" : "number",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 50.0, 114.142426, 51.0, 20.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-65",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 390.716522, 35.0, 20.0 ],
									"style" : "",
									"text" : "qlim"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-66",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 364.716522, 35.0, 20.0 ],
									"style" : "",
									"text" : "qlim"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-63",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 50.0, 276.142426, 63.0, 20.0 ],
									"style" : "",
									"text" : "delay 500"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-61",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "bang", "int" ],
									"patching_rect" : [ 50.0, 148.142426, 222.0, 20.0 ],
									"style" : "",
									"text" : "t b i"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-60",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 209.074066, 35.0, 20.0 ],
									"style" : "",
									"text" : "qlim"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-59",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 182.21225, 35.0, 20.0 ],
									"style" : "",
									"text" : "qlim"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-99",
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 50.0, 40.0, 25.0, 25.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-100",
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 86.0, 40.0, 25.0, 25.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-101",
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 460.716522, 25.0, 25.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-102",
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 253.0, 460.716522, 25.0, 25.0 ],
									"style" : ""
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-88", 1 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-100", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-60", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-59", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-63", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-60", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-102", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-61", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-59", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-61", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-66", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-63", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-101", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-65", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-65", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-66", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-61", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-71", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-71", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-88", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-88", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-99", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 139.0, 355.860352, 195.0, 22.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"style" : "",
						"tags" : ""
					}
,
					"style" : "default",
					"text" : "p open_helppatch_for_0.5_second"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-98",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "int", "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 7,
							"minor" : 0,
							"revision" : 1,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"rect" : [ 0.0, 44.0, 530.0, 503.0 ],
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
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 245.0, 276.0, 24.0, 20.0 ],
									"style" : "",
									"text" : "t 0"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-9",
									"linecount" : 7,
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 276.0, 142.0, 98.0 ],
									"style" : "",
									"text" : "script newobject newobj @text $1 @varname foo @textcolor 1. 0.66 0. 1. @fontface bold @fontsize 32 @patching_position 450 305"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-138",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 188.0, 37.0, 20.0 ],
									"style" : "",
									"text" : "thru"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-79",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 50.0, 148.0, 80.0, 20.0 ],
									"style" : "",
									"text" : "route symbol"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-76",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 4,
									"outlettype" : [ "", "", "", "" ],
									"patching_rect" : [ 50.0, 100.0, 127.0, 20.0 ],
									"saved_object_attributes" : 									{
										"embed" : 0
									}
,
									"style" : "",
									"text" : "coll _objects_to_test_"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-94",
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 50.0, 40.0, 25.0, 25.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-95",
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 448.0, 421.5755, 25.0, 25.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-96",
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 245.0, 421.5755, 25.0, 25.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-97",
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 421.5755, 25.0, 25.0 ],
									"style" : ""
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-96", 0 ],
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
									"source" : [ "obj-138", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-9", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-138", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-95", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 59.5, 216.28775, 457.5, 216.28775 ],
									"source" : [ "obj-138", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-79", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-76", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-138", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-79", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-138", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-79", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-97", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-9", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-76", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-94", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 315.0, 477.71936, 214.0, 22.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"style" : "",
						"tags" : ""
					}
,
					"style" : "default",
					"text" : "p script_create_help_patch_for_object"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-93",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 7,
							"minor" : 0,
							"revision" : 1,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"rect" : [ 25.0, 69.0, 640.0, 480.0 ],
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
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-48",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 100.0, 47.0, 20.0 ],
									"style" : "",
									"text" : "error 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-24",
									"maxclass" : "button",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 50.0, 129.495728, 20.0, 20.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-9",
									"maxclass" : "newobj",
									"numinlets" : 5,
									"numoutlets" : 4,
									"outlettype" : [ "int", "", "", "int" ],
									"patching_rect" : [ 50.0, 155.0, 105.0, 20.0 ],
									"style" : "",
									"text" : "counter 1 100000"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-92",
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 265.495728, 25.0, 25.0 ],
									"style" : ""
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-9", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-24", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-24", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-48", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-92", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-9", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 425.0, 558.720764, 88.0, 22.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"style" : "",
						"tags" : ""
					}
,
					"style" : "default",
					"text" : "p count_errors"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-89",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "bang", "int" ],
					"patching_rect" : [ 40.0, 282.43161, 118.0, 22.0 ],
					"style" : "default",
					"text" : "t b 0"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-75",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 175.0, 203.072632, 20.0, 20.0 ],
					"style" : "default"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-72",
					"maxclass" : "newobj",
					"numinlets" : 5,
					"numoutlets" : 4,
					"outlettype" : [ "int", "", "", "int" ],
					"patching_rect" : [ 175.0, 228.072632, 92.0, 22.0 ],
					"style" : "default",
					"text" : "counter 1 1000"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-68",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 139.0, 546.146729, 35.0, 22.0 ],
					"style" : "default",
					"text" : "qlim"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-69",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 139.0, 519.146729, 35.0, 22.0 ],
					"style" : "default",
					"text" : "qlim"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-53",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 170.0, 477.71936, 97.0, 22.0 ],
					"style" : "default",
					"text" : "script delete foo"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-46",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 315.0, 541.576904, 70.0, 22.0 ],
					"save" : [ "#N", "thispatcher", ";", "#Q", "end", ";" ],
					"style" : "default",
					"text" : "thispatcher"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-21",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 175.0, 135.858948, 35.0, 22.0 ],
					"style" : "default",
					"text" : "qlim"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-52",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "bang", "bang", "path", "bang" ],
					"patching_rect" : [ 175.0, 72.572632, 238.0, 22.0 ],
					"style" : "default",
					"text" : "t b b path b"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-70",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 175.0, 16.001404, 60.0, 22.0 ],
					"style" : "default",
					"text" : "loadbang"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-6",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 175.0, 45.430176, 33.0, 22.0 ],
					"style" : "default",
					"text" : "qlim"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-84",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 40.0, 316.002838, 83.0, 22.0 ],
					"style" : "default",
					"text" : "test.terminate"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-53", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-105", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-69", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-105", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-98", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-105", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-72", 4 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-11", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-12", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-17", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-13", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-64", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-16", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-20", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-17", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-60", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-17", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-75", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-21", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-11", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-23", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-11", 2 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-52", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-11", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-52", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-21", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-52", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-52", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-46", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-53", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-52", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-6", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-16", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-60", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-63", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-63", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-64", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-68", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-75", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 148.5, 582.072632, 16.0, 582.072632, 16.0, 199.072632, 184.5, 199.072632 ],
					"source" : [ "obj-68", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-68", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-69", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-70", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-105", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-72", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-89", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-72", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-72", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-75", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-105", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-89", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-84", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-89", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-93", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-98", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-16", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-98", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-46", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-98", 0 ]
				}

			}
 ],
		"dependency_cache" : [ 			{
				"name" : "thru.maxpat",
				"bootpath" : "/Applications/Max.app/Contents/Resources/C74/patchers/m4l/Pluggo for Live resources/patches",
				"patcherrelativepath" : "../../../../../../../../../../Applications/Max.app/Contents/Resources/C74/patchers/m4l/Pluggo for Live resources/patches",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "oscar.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "oscar.mxo",
				"type" : "iLaX"
			}
 ],
		"embedsnapshot" : 0
	}

}
