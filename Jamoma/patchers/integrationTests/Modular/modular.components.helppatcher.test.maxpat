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
		"rect" : [ 594.0, 44.0, 1007.0, 896.0 ],
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
					"id" : "obj-11",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 7,
							"architecture" : "x86"
						}
,
						"rect" : [ 35.0, 105.0, 1032.0, 791.0 ],
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
									"text" : "zl rev"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 14.0,
									"frgb" : 0.0,
									"id" : "obj-23",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 76.0, 37.0, 469.0, 22.0 ],
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
									"patching_rect" : [ 822.0, 116.0, 25.0, 25.0 ]
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
									"text" : "regexp integrationTests/Modular @substitute components"
								}

							}
, 							{
								"box" : 								{
									"autopopulate" : 1,
									"depth" : 7,
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-3",
									"items" : [ "audio", ",", "audio/10harmonics~", ",", "audio/10harmonics~/10harmonics~.model.html", ",", "audio/10harmonics~/10harmonics~.model.maxhelp", ",", "audio/10harmonics~/10harmonics~.model.maxpat", ",", "audio/10harmonics~/10harmonics~.model.xml", ",", "audio/10harmonics~/10harmonics~.module.maxpat", ",", "audio/10harmonics~/10harmonics~.view.maxpat", ",", "audio/_template~", ",", "audio/_template~/template~.model.html", ",", "audio/_template~/template~.model.maxhelp", ",", "audio/_template~/template~.model.maxpat", ",", "audio/_template~/template~.model.xml", ",", "audio/_template~/template~.module.maxpat", ",", "audio/_template~/template~.view.maxpat", ",", "audio/balance~", ",", "audio/balance~/balance~.model.html", ",", "audio/balance~/balance~.model.maxhelp", ",", "audio/balance~/balance~.model.maxpat", ",", "audio/balance~/balance~.model.xml", ",", "audio/balance~/balance~.module.maxpat", ",", "audio/balance~/balance~view.maxpat", ",", "audio/crossfade~", ",", "audio/crossfade~/crossfade~.model.html", ",", "audio/crossfade~/crossfade~.model.maxhelp", ",", "audio/crossfade~/crossfade~.model.maxpat", ",", "audio/crossfade~/crossfade~.model.xml", ",", "audio/crossfade~/crossfade~.module.maxpat", ",", "audio/crossfade~/crossfade~.view.maxpat", ",", "audio/degrade~", ",", "audio/degrade~/degrade~.model.maxhelp", ",", "audio/degrade~/degrade~.model.maxpat", ",", "audio/degrade~/degrade~.model.xml", ",", "audio/degrade~/degrade~.module.maxpat", ",", "audio/degrade~/degrade~.view.maxpat", ",", "audio/delay~", ",", "audio/delay~/delay~.model.html", ",", "audio/delay~/delay~.model.maxhelp", ",", "audio/delay~/delay~.model.maxpat", ",", "audio/delay~/delay~.model.xml", ",", "audio/delay~/delay~.module.maxpat", ",", "audio/delay~/delay~.view.maxpat", ",", "audio/echo~", ",", "audio/echo~/echo~.model.html", ",", "audio/echo~/echo~.model.maxhelp", ",", "audio/echo~/echo~.model.maxpat", ",", "audio/echo~/echo~.model.xml", ",", "audio/echo~/echo~.module.maxpat", ",", "audio/echo~/echo~.view.maxpat", ",", "audio/equalizer~", ",", "audio/equalizer~/equalizerM~.model.maxpat", ",", "audio/equalizer~/equalizerM~.model.xml", ",", "audio/equalizer~/equalizer~-withArrays.view.maxpat", ",", "audio/equalizer~/equalizer~.model.maxhelp", ",", "audio/equalizer~/equalizer~.model.maxpat", ",", "audio/equalizer~/equalizer~.model.xml", ",", "audio/equalizer~/equalizer~.module.maxpat", ",", "audio/equalizer~/equalizer~.view.maxpat", ",", "audio/equalizer~/equalizer~views.maxpat", ",", "audio/equalizer~/jmod.equalizer~.html", ",", "audio/filePlayer~", ",", "audio/filePlayer~/4-channels", ",", "audio/filePlayer~/4-channels/filePlayer.4ch~.model.html", ",", "audio/filePlayer~/4-channels/filePlayer.4ch~.model.maxhelp", ",", "audio/filePlayer~/4-channels/filePlayer.4ch~.model.maxpat", ",", "audio/filePlayer~/4-channels/filePlayer.4ch~.model.xml", ",", "audio/filePlayer~/4-channels/fileplayer.4ch~.module.maxpat", ",", "audio/filePlayer~/filePlayer.mono~.modelBug.maxhelp", ",", "audio/filePlayer~/jalg.filePlayer.gui.maxpat", ",", "audio/filePlayer~/mono", ",", "audio/filePlayer~/mono/filePlayer.mono~.model.html", ",", "audio/filePlayer~/mono/filePlayer.mono~.model.maxhelp", ",", "audio/filePlayer~/mono/filePlayer.mono~.model.maxpat", ",", "audio/filePlayer~/mono/filePlayer.mono~.model.xml", ",", "audio/filePlayer~/mono/fileplayer.mono~.module.maxpat", ",", "audio/filePlayer~/shared", ",", "audio/filePlayer~/shared/filePlayer.algorithm.maxpat", ",", "audio/filePlayer~/shared/filePlayer~.view.maxpat", ",", "audio/filePlayer~/shared/j.filePlayer-demo.txt", ",", "audio/filePlayer~/stereo", ",", "audio/filePlayer~/stereo/filePlayer.stereo~.model.html", ",", "audio/filePlayer~/stereo/filePlayer.stereo~.model.maxhelp", ",", "audio/filePlayer~/stereo/filePlayer.stereo~.model.maxpat", ",", "audio/filePlayer~/stereo/filePlayer.stereo~.model.xml", ",", "audio/filePlayer~/stereo/fileplayer.stereo~.module.maxpat", ",", "audio/filter~", ",", "audio/filter~/filter~.model.html", ",", "audio/filter~/filter~.model.maxhelp", ",", "audio/filter~/filter~.model.maxpat", ",", "audio/filter~/filter~.model.xml", ",", "audio/filter~/filter~.module.maxpat", ",", "audio/filter~/filter~.view.maxpat", ",", "audio/fluidsynth~", ",", "audio/fluidsynth~/fluidsynth~.model.html", ",", "audio/fluidsynth~/fluidsynth~.model.maxhelp", ",", "audio/fluidsynth~/fluidsynth~.model.maxpat", ",", "audio/fluidsynth~/fluidsynth~.model.xml", ",", "audio/fluidsynth~/fluidsynth~.module.maxpat", ",", "audio/fluidsynth~/fluidsynth~.view.maxpat", ",", "audio/hilbertModulator~", ",", "audio/hilbertModulator~/hilbertModulator~.model.html", ",", "audio/hilbertModulator~/hilbertModulator~.model.maxhelp", ",", "audio/hilbertModulator~/hilbertModulator~.model.maxpat", ",", "audio/hilbertModulator~/hilbertModulator~.model.xml", ",", "audio/hilbertModulator~/hilbertModulator~.module.maxpat", ",", "audio/hilbertModulator~/hilbertModulator~.view.maxpat", ",", "audio/input~", ",", "audio/input~/input~.model.html", ",", "audio/input~/input~.model.maxhelp", ",", "audio/input~/input~.model.maxpat", ",", "audio/input~/input~.model.xml", ",", "audio/input~/input~.module.maxpat", ",", "audio/input~/input~.view.maxpat", ",", "audio/limiter~", ",", "audio/limiter~/limiter.parametersAndMessages.maxpat", ",", "audio/limiter~/limiter~.model.html", ",", "audio/limiter~/limiter~.model.maxhelp", ",", "audio/limiter~/limiter~.model.maxpat", ",", "audio/limiter~/limiter~.model.xml", ",", "audio/limiter~/limiter~.module.maxpat", ",", "audio/limiter~/limiter~.panel.widget.maxpat", ",", "audio/limiter~/limiter~.view.maxpat", ",", "audio/multidelay~", ",", "audio/multidelay~/multidelay~.model.html", ",", "audio/multidelay~/multidelay~.model.maxhelp", ",", "audio/multidelay~/multidelay~.model.maxpat", ",", "audio/multidelay~/multidelay~.model.xml", ",", "audio/multidelay~/multidelay~.module.maxpat", ",", "audio/multidelay~/multidelay~.view.maxpat", ",", "audio/noisegate~", ",", "audio/noisegate~/noisegate~.model.html", ",", "audio/noisegate~/noisegate~.model.maxhelp", ",", "audio/noisegate~/noisegate~.model.maxpat", ",", "audio/noisegate~/noisegate~.model.xml", ",", "audio/noisegate~/noisegate~.module.maxpat", ",", "audio/noisegate~/noisegate~.view.maxpat", ",", "audio/noise~", ",", "audio/noise~/noise~.model.html", ",", "audio/noise~/noise~.model.maxhelp", ",", "audio/noise~/noise~.model.maxpat.zip", ",", "audio/noise~/noise~.model.xml", ",", "audio/noise~/noise~.module.maxpat", ",", "audio/noise~/noise~.view.maxpat", ",", "audio/output~", ",", "audio/output~/output~.model.html", ",", "audio/output~/output~.model.maxhelp", ",", "audio/output~/output~.model.maxpat", ",", "audio/output~/output~.model.xml", ",", "audio/output~/output~.module.maxpat", ",", "audio/output~/output~.view.maxpat", ",", "audio/panning~", ",", "audio/panning~/panning~.model.maxhelp", ",", "audio/panning~/panning~.model.maxpat", ",", "audio/panning~/panning~.model.xml", ",", "audio/panning~/panning~.module.maxpat", ",", "audio/panning~/panning~.view.maxpat", ",", "audio/record~", ",", "audio/record~/record.parametersAndMessages.maxpat", ",", "audio/record~/record~.model.maxhelp", ",", "audio/record~/record~.model.maxpat", ",", "audio/record~/record~.model.xml", ",", "audio/record~/record~.module.maxpat", ",", "audio/record~/record~.view.maxpat", ",", "audio/rissetGlissando", ",", "audio/rissetGlissando/rissetGlissando~.model.html", ",", "audio/rissetGlissando/rissetGlissando~.model.maxhelp", ",", "audio/rissetGlissando/rissetGlissando~.model.maxpat", ",", "audio/rissetGlissando/rissetGlissando~.model.xml", ",", "audio/rissetGlissando/rissetGlissando~.module.maxpat", ",", "audio/rissetGlissando/rissetGlissando~.view.maxpat", ",", "audio/samplePlayer2~", ",", "audio/samplePlayer2~/samplePlayer2~.model.html", ",", "audio/samplePlayer2~/samplePlayer2~.model.maxhelp", ",", "audio/samplePlayer2~/samplePlayer2~.model.maxpat", ",", "audio/samplePlayer2~/samplePlayer2~.model.xml", ",", "audio/samplePlayer~", ",", "audio/samplePlayer~/samplePlayer~.model.html", ",", "audio/samplePlayer~/samplePlayer~.model.maxhelp", ",", "audio/samplePlayer~/samplePlayer~.model.maxpat", ",", "audio/samplePlayer~/samplePlayer~.model.xml", ",", "audio/samplePlayer~/samplePlayer~.module.maxpat", ",", "audio/samplePlayer~/samplePlayer~.view.maxpat", ",", "audio/saturation~", ",", "audio/saturation~/saturation~.model.html", ",", "audio/saturation~/saturation~.model.maxhelp", ",", "audio/saturation~/saturation~.model.maxpat", ",", "audio/saturation~/saturation~.model.xml", ",", "audio/saturation~/saturation~.module.maxpat", ",", "audio/saturation~/saturation~.view.maxpat", ",", "audio/scope~", ",", "audio/scope~/scope~.model.maxhelp", ",", "audio/scope~/scope~.model.maxpat", ",", "audio/scope~/scope~.model.xml", ",", "audio/scope~/scope~.module.maxpat", ",", "audio/scope~/scope~.view.html", ",", "audio/scope~/scope~.view.maxpat", ",", "audio/sine~", ",", "audio/sine~/sine~.model.html", ",", "audio/sine~/sine~.model.maxhelp", ",", "audio/sine~/sine~.model.maxpat", ",", "audio/sine~/sine~.model.xml", ",", "audio/sine~/sine~.module.maxpat", ",", "audio/sine~/sine~.view.maxpat", ",", "audio/sonifyer~", ",", "audio/sonifyer~/sonifyer~.model.html", ",", "audio/sonifyer~/sonifyer~.model.maxhelp", ",", "audio/sonifyer~/sonifyer~.model.maxpat", ",", "audio/sonifyer~/sonifyer~.model.xml", ",", "audio/sonifyer~/sonifyer~.view.maxpat", ",", "audio/spectralGate~", ",", "audio/spectralGate~/j.spectralGate~.lib.maxpat", ",", "audio/spectralGate~/spectralGate~.model.html", ",", "audio/spectralGate~/spectralGate~.model.maxhelp", ",", "audio/spectralGate~/spectralGate~.model.maxpat", ",", "audio/spectralGate~/spectralGate~.model.xml", ",", "audio/spectralGate~/spectralGate~.module.maxpat", ",", "audio/spectralGate~/spectralGate~.view.maxpat", ",", "audio/spectralShift~", ",", "audio/spectralShift~/j.spectralShiftVoice~.maxpat", ",", "audio/spectralShift~/spectralShift~.model.html", ",", "audio/spectralShift~/spectralShift~.model.maxhelp", ",", "audio/spectralShift~/spectralShift~.model.maxpat", ",", "audio/spectralShift~/spectralShift~.model.xml", ",", "audio/spectralShift~/spectralShift~.module.maxpat", ",", "audio/spectralShift~/spectralShift~.view.maxpat", ",", "audio/spectrogram~", ",", "audio/spectrogram~/spectrogram~.model.html", ",", "audio/spectrogram~/spectrogram~.model.maxhelp", ",", "audio/spectrogram~/spectrogram~.model.maxpat", ",", "audio/spectrogram~/spectrogram~.model.xml", ",", "audio/spectrogram~/spectrogram~.module.maxpat", ",", "audio/spectrogram~/spectrogram~.view.maxpat", ",", "audio/tremolo~", ",", "audio/tremolo~/tremolo~.model.html", ",", "audio/tremolo~/tremolo~.model.maxhelp", ",", "audio/tremolo~/tremolo~.model.maxpat", ",", "audio/tremolo~/tremolo~.model.xml", ",", "audio/tremolo~/tremolo~.module.maxpat", ",", "audio/tremolo~/tremolo~.view.maxpat", ",", "audio/vst~", ",", "audio/vst~/vst~.model.html", ",", "audio/vst~/vst~.model.maxhelp", ",", "audio/vst~/vst~.model.maxpat", ",", "audio/vst~/vst~.model.xml", ",", "audio/vst~/vst~.view.maxpat", ",", "control", ",", "control/_template", ",", "control/_template/_template.model.html", ",", "control/_template/_template.model.maxhelp", ",", "control/_template/_template.model.maxpat", ",", "control/_template/_template.model.xml", ",", "control/_template/_template.view.maxpat", ",", "control/bcf2000", ",", "control/bcf2000/bcf2000.model.html", ",", "control/bcf2000/bcf2000.model.maxhelp", ",", "control/bcf2000/bcf2000.model.maxpat", ",", "control/bcf2000/bcf2000.model.xml", ",", "control/bcf2000/bcf2000.view.maxpat", ",", "control/bcf2000/BCFFader.view.maxpat", ",", "control/bcf2000/BCFKey.view.maxpat", ",", "control/bcf2000/BCFtrack.view.maxpat", ",", "control/bcf2000/Push_encoder_press.maxpat", ",", "control/bcf2000/Push_encoder_turn.maxpat", ",", "control/colorpicker", ",", "control/colorpicker/colorpicker.model.html", ",", "control/colorpicker/colorpicker.model.maxhelp", ",", "control/colorpicker/colorpicker.model.maxpat", ",", "control/colorpicker/colorpicker.model.xml", ",", "control/colorpicker/colorpicker.view.maxpat", ",", "control/continuum", ",", "control/continuum/continuum.model.html", ",", "control/continuum/continuum.model.maxhelp", ",", "control/continuum/continuum.model.maxpat", ",", "control/continuum/continuum.model.xml", ",", "control/continuum/continuum.view.maxpat", ",", "control/continuum/jalg.continuum_synth.maxpat", ",", "control/cueComment", ",", "control/cueComment/cueComment.model.html", ",", "control/cueComment/cueComment.model.maxhelp", ",", "control/cueComment/cueComment.model.xml", ",", "control/cueComment/cueComment.view.maxpat", ",", "control/cueManager", ",", "control/cueManager/cuelist_help.txt", ",", "control/cueManager/cueManager.lite.view.maxpat", ",", "control/cueManager/cueManager.maxhelp", ",", "control/cueManager/cueManager.model.maxpat", ",", "control/cueManager/cueManager.view.maxpat", ",", "control/cueManager/CuePrioritiesPropagator.maxpat", ",", "control/cueManager/jmod.cueManager.html", ",", "control/cueManager/jmod.cueManager.maxhelp", ",", "control/cueManager/jmod.cueManager.maxpat", ",", "control/cueManager/jmod.cueManager.xml", ",", "control/cueScript", ",", "control/cueScript/cueScript.model.html", ",", "control/cueScript/cueScript.model.maxhelp", ",", "control/cueScript/cueScript.model.maxpat", ",", "control/cueScript/cueScript.model.xml", ",", "control/cueScript/cueScript.view.maxpat", ",", "control/cueScript/jmod.demo_cuescript.txt", ",", "control/cueTrigger", ",", "control/cueTrigger/cueTrigger.model.html", ",", "control/cueTrigger/cueTrigger.model.maxhelp", ",", "control/cueTrigger/cueTrigger.model.xml", ",", "control/cueTrigger/cueTrigger.view.maxpat", ",", "control/fileBrowser", ",", "control/fileBrowser/fileBrowser.model.html", ",", "control/fileBrowser/fileBrowser.model.maxhelp", ",", "control/fileBrowser/fileBrowser.model.maxpat", ",", "control/fileBrowser/fileBrowser.model.xml", ",", "control/fileBrowser/fileBrowser.module.maxpat", ",", "control/fileBrowser/fileBrowser.view.maxpat", ",", "control/fileNameGenerator", ",", "control/fileNameGenerator/fileNameGenerator.model.html", ",", "control/fileNameGenerator/fileNameGenerator.model.maxhelp", ",", "control/fileNameGenerator/fileNameGenerator.model.xml", ",", "control/fileNameGenerator/fileNameGenerator.view.maxpat", ",", "control/globalTransport", ",", "control/globalTransport/globalTransport.model.html", ",", "control/globalTransport/globalTransport.model.maxhelp", ",", "control/globalTransport/globalTransport.model.xml", ",", "control/globalTransport/globalTransport.view.maxpat", ",", "control/hi", ",", "control/hi/hi.model.html", ",", "control/hi/hi.model.maxhelp", ",", "control/hi/hi.model.maxpat", ",", "control/hi/hi.model.xml", ",", "control/hi/hi.module.maxpat", ",", "control/hi/hi.view.maxpat", ",", "control/layout", ",", "control/layout/jmod.layout.locate_patcher.js", ",", "control/layout/jmod.layouthelp.xml", ",", "control/layout/layout.model.html", ",", "control/layout/layout.model.maxhelp", ",", "control/layout/layout.model.xml", ",", "control/layout/layout.view.maxpat", ",", "control/layout/modules.txt", ",", "control/mapper", ",", "control/mapper/j.mappings.js", ",", "control/mapper/jalg.transformation.maxpat", ",", "control/mapper/mapper.model.html", ",", "control/mapper/mapper.model.maxhelp", ",", "control/mapper/mapper.model.maxpat", ",", "control/mapper/mapper.model.xml", ",", "control/mapper/mapper.view.maxpat", ",", "control/mapperBCF", ",", "control/mapperBCF/bcfFader.view.maxpat", ",", "control/mapperBCF/bcfKey.view.maxpat", ",", "control/mapperBCF/bcfMapper.model.maxpat", ",", "control/mapperBCF/bcfMapper.view.maxpat", ",", "control/mapperBCF/bcfModels.maxpat", ",", "control/mapperBCF/bcfPress.view.maxpat", ",", "control/mapperBCF/bcfTrack.model.maxpat", ",", "control/mapperBCF/bcfTrack.view.maxpat", ",", "control/mapperBCF/bcfTurn.view.maxpat", ",", "control/mapperBCF/mapperBCF.model.maxhelp", ",", "control/mapperBCF/mapperBCF.model.maxpat", ",", "control/mapperBCF/mapperBCF.model.xml", ",", "control/mapperBCF/mapperBCF.view.maxpat", ",", "control/mapperContinuous", ",", "control/mapperContinuous/mapperContinuous.model.html", ",", "control/mapperContinuous/mapperContinuous.model.maxhelp", ",", "control/mapperContinuous/mapperContinuous.model.xml", ",", "control/mapperContinuous/mapperContinuous.view.maxpat", ",", "control/mapperDiscrete", ",", "control/mapperDiscrete/mapperDiscrete.model.html", ",", "control/mapperDiscrete/mapperDiscrete.model.maxhelp", ",", "control/mapperDiscrete/mapperDiscrete.model.xml", ",", "control/mapperDiscrete/mapperDiscrete.view.maxpat", ",", "control/mapperDiscrete/mappperDiscreteHelp1.xml", ",", "control/mapperDiscrete/mappperDiscreteHelp2.xml", ",", "control/mapperMulti", ",", "control/mapperMulti/mapper.model.maxpat", ",", "control/mapperMulti/mapper.view.maxpat", ",", "control/mapperMulti/mapperCollSetter.maxpat", ",", "control/mapperMulti/mapperMulti.maxhelp", ",", "control/mapperMulti/mapperMulti.model.maxpat", ",", "control/mapperMulti/mapperMulti.model.xml", ",", "control/mapperMulti/mapperMulti.view.maxpat", ",", "control/messages", ",", "control/messages/messages.model.html", ",", "control/messages/messages.model.maxhelp", ",", "control/messages/messages.model.xml", ",", "control/messages/messages.view.maxpat", ",", "control/midiin", ",", "control/midiin/midiin.model.html", ",", "control/midiin/midiin.model.maxhelp", ",", "control/midiin/midiin.model.maxpat", ",", "control/midiin/midiin.model.xml", ",", "control/midiin/midiin.module.maxpat", ",", "control/midiin/midiin.view.maxpat", ",", "control/mouse", ",", "control/mouse/mouse.model.html", ",", "control/mouse/mouse.model.maxhelp", ",", "control/mouse/mouse.model.maxpat", ",", "control/mouse/mouse.model.xml", ",", "control/mouse/mouse.module.maxpat", ",", "control/mouse/mouse.view.maxpat", ",", "control/mouse.gdif", ",", "control/mouse.gdif/mouse.gdif.model.html", ",", "control/mouse.gdif/mouse.gdif.model.maxhelp", ",", "control/mouse.gdif/mouse.gdif.model.maxpat", ",", "control/mouse.gdif/mouse.gdif.model.xml", ",", "control/mouse.gdif/mouse.gdif.view.maxpat", ",", "control/multicast", ",", "control/multicast/jalg.multicast_core.maxpat", ",", "control/multicast/multicast.model.html", ",", "control/multicast/multicast.model.maxhelp", ",", "control/multicast/multicast.model.maxpat", ",", "control/multicast/multicast.model.xml", ",", "control/multicast/multicast.view.maxpat", ",", "control/oscnet", ",", "control/oscnet/jalg.oscnet.ui.maxpat", ",", "control/oscnet/oscnet.model.html", ",", "control/oscnet/oscnet.model.maxhelp", ",", "control/oscnet/oscnet.model.maxpat", ",", "control/oscnet/oscnet.model.xml", ",", "control/oscnet/oscnet.view.maxpat", ",", "control/palette", ",", "control/palette/palette.model.html", ",", "control/palette/palette.model.maxhelp", ",", "control/palette/palette.model.maxpat", ",", "control/palette/palette.model.xml", ",", "control/palette/palette.view.maxpat", ",", "control/polhemus", ",", "control/polhemus/polhemus.model.html", ",", "control/polhemus/polhemus.model.maxhelp", ",", "control/polhemus/polhemus.model.maxpat", ",", "control/polhemus/polhemus.model.xml", ",", "control/polhemus/polhemus.view.maxpat", ",", "control/qmetro", ",", "control/qmetro/qmetro.model.html", ",", "control/qmetro/qmetro.model.maxhelp", ",", "control/qmetro/qmetro.model.maxpat", ",", "control/qmetro/qmetro.model.xml", ",", "control/qmetro/qmetro.module.maxpat", ",", "control/qmetro/qmetro.view.maxpat", ",", "control/qualisys", ",", "control/qualisys/qualisys.model.html", ",", "control/qualisys/qualisys.model.maxhelp", ",", "control/qualisys/qualisys.model.maxpat", ",", "control/qualisys/qualisys.model.xml", ",", "control/qualisys/qualisys.view.maxpat", ",", "control/spacenavigator", ",", "control/spacenavigator/spacenavigator.model.html", ",", "control/spacenavigator/spacenavigator.model.maxhelp", ",", "control/spacenavigator/spacenavigator.model.maxpat", ",", "control/spacenavigator/spacenavigator.model.xml", ",", "control/spacenavigator/spacenavigator.view.maxpat", ",", "control/uc-33", ",", "control/uc-33/jalg.uc-33-masterFader.maxpat", ",", "control/uc-33/uc-33.model.html", ",", "control/uc-33/uc-33.model.maxhelp", ",", "control/uc-33/uc-33.model.maxpat", ",", "control/uc-33/uc-33.model.xml", ",", "control/uc-33/uc-33.view.maxpat", ",", "control/wacom", ",", "control/wacom/wacom.model.html", ",", "control/wacom/wacom.model.maxhelp", ",", "control/wacom/wacom.model.maxpat", ",", "control/wacom/wacom.model.xml", ",", "control/wacom/wacom.view.maxpat", ",", "data", ",", "data/condition", ",", "data/condition/condition.model.html", ",", "data/condition/condition.model.maxhelp", ",", "data/condition/condition.model.maxpat", ",", "data/condition/condition.model.xml", ",", "data/condition/condition.view.maxpat", ",", "data/textwriter", ",", "data/textwriter/jalg.textwriter.mxt", ",", "data/textwriter/textwriter.model.html", ",", "data/textwriter/textwriter.model.maxhelp", ",", "data/textwriter/textwriter.model.maxpat", ",", "data/textwriter/textwriter.model.xml", ",", "data/textwriter/textwriter.view.maxpat", ",", "openGL", ",", "openGL/gl.alphamixer%", ",", "openGL/gl.alphamixer%/gl.alphamixer%.model.html", ",", "openGL/gl.alphamixer%/gl.alphamixer%.model.maxhelp", ",", "openGL/gl.alphamixer%/gl.alphamixer%.model.maxpat", ",", "openGL/gl.alphamixer%/gl.alphamixer%.model.xml", ",", "openGL/gl.alphamixer%/gl.alphamixer%.module.maxpat", ",", "openGL/gl.alphamixer%/gl.alphamixer%.view.maxpat", ",", "openGL/gl.alphamixer%/shaders", ",", "openGL/gl.alphamixer%/shaders/j.4ch_alphamixer.jxs", ",", "openGL/gl.alphamixer%/shaders/j.4ch_alphamixer.vp.glsl", ",", "openGL/gl.chromakey%", ",", "openGL/gl.chromakey%/gl.chromakey%.model.html", ",", "openGL/gl.chromakey%/gl.chromakey%.model.maxhelp", ",", "openGL/gl.chromakey%/gl.chromakey%.model.maxpat", ",", "openGL/gl.chromakey%/gl.chromakey%.model.xml", ",", "openGL/gl.chromakey%/gl.chromakey%.module.maxpat", ",", "openGL/gl.chromakey%/gl.chromakey%.view.maxpat", ",", "openGL/gl.chromakey%/jmod.gl.td.chromakey-demo.txt", ",", "openGL/gl.edgeblend%", ",", "openGL/gl.edgeblend%/gl.chromakey%.module.maxpat", ",", "openGL/gl.edgeblend%/gl.edgeblend%.model.html", ",", "openGL/gl.edgeblend%/gl.edgeblend%.model.maxhelp", ",", "openGL/gl.edgeblend%/gl.edgeblend%.model.maxpat", ",", "openGL/gl.edgeblend%/gl.edgeblend%.model.xml", ",", "openGL/gl.edgeblend%/gl.edgeblend%.view.maxpat", ",", "openGL/gl.td.background%", ",", "openGL/gl.td.background%/gl.background%.model.html", ",", "openGL/gl.td.background%/gl.background%.model.maxhelp", ",", "openGL/gl.td.background%/gl.background%.model.maxpat", ",", "openGL/gl.td.background%/gl.background%.model.xml", ",", "openGL/gl.td.background%/gl.background%.module.maxpat", ",", "openGL/gl.td.background%/gl.background%.view.maxpat", ",", "openGL/gl.td.rota%", ",", "openGL/gl.td.rota%/gl.td.rota%.model.html", ",", "openGL/gl.td.rota%/gl.td.rota%.model.maxhelp", ",", "openGL/gl.td.rota%/gl.td.rota%.model.maxpat", ",", "openGL/gl.td.rota%/gl.td.rota%.model.xml", ",", "openGL/gl.td.rota%/gl.td.rota%.module.maxpat", ",", "openGL/gl.td.rota%/gl.td.rota%.view.maxpat", ",", "openGL/gl.text2d%", ",", "openGL/gl.text2d%/gl.text2d%.model.html", ",", "openGL/gl.text2d%/gl.text2d%.model.maxhelp", ",", "openGL/gl.text2d%/gl.text2d%.model.maxpat", ",", "openGL/gl.text2d%/gl.text2d%.model.xml", ",", "openGL/gl.text2d%/gl.text2d%.module.maxpat", ",", "openGL/gl.text2d%/gl.text2d%.view.maxpat", ",", "openGL/gl.text2d%/GNU-LGPL.txt", ",", "openGL/gl.text2d%/jmod.gl.text2d%-demo.txt", ",", "openGL/gl.videoplane%", ",", "openGL/gl.videoplane%/gl.videoplane%.model.html", ",", "openGL/gl.videoplane%/gl.videoplane%.model.maxhelp", ",", "openGL/gl.videoplane%/gl.videoplane%.model.maxpat", ",", "openGL/gl.videoplane%/gl.videoplane%.model.xml", ",", "openGL/gl.videoplane%/gl.videoplane%.module.maxpat", ",", "openGL/gl.videoplane%/gl.videoplane%.view.maxpat", ",", "spatialization", ",", "spatialization/dbap_bformat=", ",", "spatialization/dbap_bformat=/dbap_bformat=.model.html", ",", "spatialization/dbap_bformat=/dbap_bformat=.model.maxhelp", ",", "spatialization/dbap_bformat=/dbap_bformat=.model.maxpat", ",", "spatialization/dbap_bformat=/dbap_bformat=.model.xml", ",", "spatialization/dbap_bformat=/dbap_bformat=.view.maxpat", ",", "spatialization/sur.ambi.adjust~", ",", "spatialization/sur.ambi.adjust~/ambiAdjust≈.gain.helper.maxpat", ",", "spatialization/sur.ambi.adjust~/sur.ambi.adjust~.model.html", ",", "spatialization/sur.ambi.adjust~/sur.ambi.adjust~.model.maxhelp", ",", "spatialization/sur.ambi.adjust~/sur.ambi.adjust~.model.maxpat", ",", "spatialization/sur.ambi.adjust~/sur.ambi.adjust~.model.xml", ",", "spatialization/sur.ambi.adjust~/sur.ambi.adjust~.module.maxpat", ",", "spatialization/sur.ambi.adjust~/sur.ambi.adjust~.view.maxpat", ",", "spatialization/sur.ambi.decode~", ",", "spatialization/sur.ambi.decode~/sur.ambi.decode~.model.html", ",", "spatialization/sur.ambi.decode~/sur.ambi.decode~.model.maxhelp", ",", "spatialization/sur.ambi.decode~/sur.ambi.decode~.model.maxpat", ",", "spatialization/sur.ambi.decode~/sur.ambi.decode~.model.xml", ",", "spatialization/sur.ambi.decode~/sur.ambi.decode~.view.maxpat", ",", "spatialization/sur.ambi.encodeM~", ",", "spatialization/sur.ambi.encodeM~/sur.ambi.encodeM~.model.html", ",", "spatialization/sur.ambi.encodeM~/sur.ambi.encodeM~.model.maxhelp", ",", "spatialization/sur.ambi.encodeM~/sur.ambi.encodeM~.model.maxpat", ",", "spatialization/sur.ambi.encodeM~/sur.ambi.encodeM~.model.xml", ",", "spatialization/sur.ambi.encodeM~/sur.ambi.encodeM~.view.maxpat", ",", "spatialization/sur.ambipanning~", ",", "spatialization/sur.ambipanning~/j.ambipanSource.maxpat", ",", "spatialization/sur.ambipanning~/sur.ambipanning~.model.html", ",", "spatialization/sur.ambipanning~/sur.ambipanning~.model.maxhelp", ",", "spatialization/sur.ambipanning~/sur.ambipanning~.model.maxpat", ",", "spatialization/sur.ambipanning~/sur.ambipanning~.model.xml", ",", "spatialization/sur.ambipanning~/sur.ambipanning~.view.maxpat", ",", "spatialization/sur.ambisonics~", ",", "spatialization/sur.ambisonics~/sur.ambisonics~.model.html", ",", "spatialization/sur.ambisonics~/sur.ambisonics~.model.maxhelp", ",", "spatialization/sur.ambisonics~/sur.ambisonics~.model.maxpat", ",", "spatialization/sur.ambisonics~/sur.ambisonics~.model.xml", ",", "spatialization/sur.ambisonics~/sur.ambisonics~.view.maxpat", ",", "spatialization/sur.aux~", ",", "spatialization/sur.aux~/sur.aux~.model.html", ",", "spatialization/sur.aux~/sur.aux~.model.maxhelp", ",", "spatialization/sur.aux~/sur.aux~.model.maxpat", ",", "spatialization/sur.aux~/sur.aux~.model.xml", ",", "spatialization/sur.aux~/sur.aux~.module.maxpat", ",", "spatialization/sur.aux~/sur.aux~.view.maxpat", ",", "spatialization/sur.dbap~", ",", "spatialization/sur.dbap~/sur.dbap~.model.maxhelp", ",", "spatialization/sur.dbap~/sur.dbap~.model.maxpat", ",", "spatialization/sur.dbap~/sur.dbap~.model.xml", ",", "spatialization/sur.dbap~/sur.dbap~.module.html", ",", "spatialization/sur.dbap~/sur.dbap~.module.maxpat", ",", "spatialization/sur.doppler~", ",", "spatialization/sur.doppler~/j.sur.ch.doppler~.maxpat", ",", "spatialization/sur.doppler~/j.sur.doppler.js", ",", "spatialization/sur.doppler~/sur.doppler~.model.html", ",", "spatialization/sur.doppler~/sur.doppler~.model.maxhelp", ",", "spatialization/sur.doppler~/sur.doppler~.model.maxpat", ",", "spatialization/sur.doppler~/sur.doppler~.model.xml", ",", "spatialization/sur.doppler~/sur.doppler~.module.maxpat", ",", "spatialization/sur.doppler~/sur.doppler~.view.maxpat", ",", "spatialization/sur.info~", ",", "spatialization/sur.info~/sur.info~.model.html", ",", "spatialization/sur.info~/sur.info~.model.maxhelp", ",", "spatialization/sur.info~/sur.info~.model.maxpat", ",", "spatialization/sur.info~/sur.info~.model.xml", ",", "spatialization/sur.info~/sur.info~.module.maxpat", ",", "spatialization/sur.info~/sur.info~.view.maxpat", ",", "spatialization/sur.input~", ",", "spatialization/sur.input~/input.timeDisplay.maxpat", ",", "spatialization/sur.input~/sur.input~.model.html", ",", "spatialization/sur.input~/sur.input~.model.maxhelp", ",", "spatialization/sur.input~/sur.input~.model.maxpat", ",", "spatialization/sur.input~/sur.input~.model.xml", ",", "spatialization/sur.input~/sur.input~.view.maxpat", ",", "spatialization/sur.limiter~", ",", "spatialization/sur.limiter~/sur.limiter~.model.html", ",", "spatialization/sur.limiter~/sur.limiter~.model.maxhelp", ",", "spatialization/sur.limiter~/sur.limiter~.model.maxpat", ",", "spatialization/sur.limiter~/sur.limiter~.model.xml", ",", "spatialization/sur.limiter~/sur.limiter~.module.maxpat", ",", "spatialization/sur.limiter~/sur.limiter~.view.maxpat", ",", "spatialization/sur.meters~", ",", "spatialization/sur.meters~/sur.meters~.model.html", ",", "spatialization/sur.meters~/sur.meters~.model.maxhelp", ",", "spatialization/sur.meters~/sur.meters~.model.maxpat", ",", "spatialization/sur.meters~/sur.meters~.model.xml", ",", "spatialization/sur.meters~/sur.meters~.module.maxpat", ",", "spatialization/sur.meters~/sur.meters~.view.maxpat", ",", "spatialization/sur.multi.in~", ",", "spatialization/sur.multi.in~/sur.multi.in~.model.html", ",", "spatialization/sur.multi.in~/sur.multi.in~.model.maxhelp", ",", "spatialization/sur.multi.in~/sur.multi.in~.model.maxpat", ",", "spatialization/sur.multi.in~/sur.multi.in~.model.xml", ",", "spatialization/sur.multi.in~/sur.multi.in~.module.maxpat", ",", "spatialization/sur.multi.in~/sur.multi.in~.view.maxpat", ",", "spatialization/sur.multi.out~", ",", "spatialization/sur.multi.out~/sur.multi.out~.model.html", ",", "spatialization/sur.multi.out~/sur.multi.out~.model.maxhelp", ",", "spatialization/sur.multi.out~/sur.multi.out~.model.maxpat", ",", "spatialization/sur.multi.out~/sur.multi.out~.model.xml", ",", "spatialization/sur.multi.out~/sur.multi.out~.module.maxpat", ",", "spatialization/sur.multi.out~/sur.multi.out~.view.maxpat", ",", "spatialization/sur.output~", ",", "spatialization/sur.output~/sur.output~.model.html", ",", "spatialization/sur.output~/sur.output~.model.maxhelp", ",", "spatialization/sur.output~/sur.output~.model.maxpat", ",", "spatialization/sur.output~/sur.output~.model.xml", ",", "spatialization/sur.output~/sur.output~.module.maxpat", ",", "spatialization/sur.output~/sur.output~.view.maxpat", ",", "spatialization/sur.position", ",", "spatialization/sur.position/sur.position.model.html", ",", "spatialization/sur.position/sur.position.model.xml", ",", "spatialization/sur.position/sur.position.view.maxpat", ",", "spatialization/sur.race~", ",", "spatialization/sur.race~/pingpong.poly.maxpat", ",", "spatialization/sur.race~/sur.race~.model.html", ",", "spatialization/sur.race~/sur.race~.model.maxhelp", ",", "spatialization/sur.race~/sur.race~.model.maxpat", ",", "spatialization/sur.race~/sur.race~.model.xml", ",", "spatialization/sur.race~/sur.race~.view.maxpat", ",", "spatialization/sur.rolloff~", ",", "spatialization/sur.rolloff~/j.sur.rolloff.js", ",", "spatialization/sur.rolloff~/sur.rolloff~.model.html", ",", "spatialization/sur.rolloff~/sur.rolloff~.model.maxhelp", ",", "spatialization/sur.rolloff~/sur.rolloff~.model.maxpat", ",", "spatialization/sur.rolloff~/sur.rolloff~.model.xml", ",", "spatialization/sur.rolloff~/sur.rolloff~.module.maxpat", ",", "spatialization/sur.rolloff~/sur.rolloff~.view.maxpat", ",", "spatialization/sur.setup", ",", "spatialization/sur.setup/j.sur.channel.xyz_setup.maxpat", ",", "spatialization/sur.setup/sur.setup.model.html", ",", "spatialization/sur.setup/sur.setup.model.maxhelp", ",", "spatialization/sur.setup/sur.setup.model.xml", ",", "spatialization/sur.setup/sur.setup.view.maxpat", ",", "spatialization/sur.speaker.delay~", ",", "spatialization/sur.speaker.delay~/j.sur.speaker.delays.js", ",", "spatialization/sur.speaker.delay~/sur.speaker.delay~.model.html", ",", "spatialization/sur.speaker.delay~/sur.speaker.delay~.model.maxhelp", ",", "spatialization/sur.speaker.delay~/sur.speaker.delay~.model.maxpat", ",", "spatialization/sur.speaker.delay~/sur.speaker.delay~.model.xml", ",", "spatialization/sur.speaker.delay~/sur.speaker.delay~.view.maxpat", ",", "spatialization/sur.speaker.distamp~", ",", "spatialization/sur.speaker.distamp~/sur.speaker.distamp~.model.html", ",", "spatialization/sur.speaker.distamp~/sur.speaker.distamp~.model.maxhelp", ",", "spatialization/sur.speaker.distamp~/sur.speaker.distamp~.model.maxpat", ",", "spatialization/sur.speaker.distamp~/sur.speaker.distamp~.model.xml", ",", "spatialization/sur.speaker.distamp~/sur.speaker.distamp~.view.maxpat", ",", "spatialization/sur.vbap~", ",", "spatialization/sur.vbap~/sur.vbap~.model.html", ",", "spatialization/sur.vbap~/sur.vbap~.model.maxhelp", ",", "spatialization/sur.vbap~/sur.vbap~.model.maxpat", ",", "spatialization/sur.vbap~/sur.vbap~.model.xml", ",", "spatialization/sur.vbap~/sur.vbap~.module.maxpat", ",", "spatialization/sur.vbap~/sur.vbap~.view.maxpat", ",", "spatialization/sur.waveformViewer", ",", "spatialization/sur.waveformViewer/jmod.sur.waveformViewer~.html", ",", "spatialization/sur.waveformViewer/jmod.sur.waveformViewer~.maxhelp", ",", "spatialization/sur.waveformViewer/jmod.sur.waveformViewer~.maxpat", ",", "spatialization/sur.waveformViewer/jmod.sur.waveformViewer~.xml", ",", "spatialization/sur.zoomH2ambi~", ",", "spatialization/sur.zoomH2ambi~/sur.zoomH2ambi~.model.html", ",", "spatialization/sur.zoomH2ambi~/sur.zoomH2ambi~.model.maxhelp", ",", "spatialization/sur.zoomH2ambi~/sur.zoomH2ambi~.model.xml", ",", "spatialization/sur.zoomH2ambi~/sur.zoomH2ambi~.view.maxpat", ",", "video", ",", "video/alphablend%", ",", "video/alphablend%/alphablend%.model.html", ",", "video/alphablend%/alphablend%.model.maxhelp", ",", "video/alphablend%/alphablend%.model.maxpat", ",", "video/alphablend%/alphablend%.model.xml", ",", "video/alphablend%/alphablend%.module.maxpat", ",", "video/alphablend%/alphablend%.view.maxpat", ",", "video/avg4%", ",", "video/avg4%/avg4%.model.html", ",", "video/avg4%/avg4%.model.maxhelp", ",", "video/avg4%/avg4%.model.maxpat", ",", "video/avg4%/avg4%.model.xml", ",", "video/avg4%/avg4%.module.maxpat", ",", "video/avg4%/avg4%.view.maxpat", ",", "video/background%", ",", "video/background%/background%.model.html", ",", "video/background%/background%.model.maxhelp", ",", "video/background%/background%.model.maxpat", ",", "video/background%/background%.model.xml", ",", "video/background%/background%.module.maxpat", ",", "video/background%/background%.view.maxpat", ",", "video/blur%", ",", "video/blur%/blur%.model.html", ",", "video/blur%/blur%.model.maxhelp", ",", "video/blur%/blur%.model.maxpat", ",", "video/blur%/blur%.model.xml", ",", "video/blur%/blur%.module.maxpat", ",", "video/blur%/blur%.view.maxpat", ",", "video/box%", ",", "video/box%/box%.model.html", ",", "video/box%/box%.model.maxhelp", ",", "video/box%/box%.model.maxpat", ",", "video/box%/box%.model.xml", ",", "video/box%/box%.module.maxpat", ",", "video/box%/box%.view.maxpat", ",", "video/brcosa%", ",", "video/brcosa%/brcosa%.model.html", ",", "video/brcosa%/brcosa%.model.maxhelp", ",", "video/brcosa%/brcosa%.model.maxpat", ",", "video/brcosa%/brcosa%.model.xml", ",", "video/brcosa%/brcosa%.module.maxpat", ",", "video/brcosa%/brcosa%.view.maxpat", ",", "video/chromakey%", ",", "video/chromakey%/chromakey%.model.html", ",", "video/chromakey%/chromakey%.model.maxhelp", ",", "video/chromakey%/chromakey%.model.maxpat", ",", "video/chromakey%/chromakey%.model.xml", ",", "video/chromakey%/chromakey%.module.maxpat", ",", "video/chromakey%/chromakey%.view.maxpat", ",", "video/edge%", ",", "video/edge%/edge%.model.html", ",", "video/edge%/edge%.model.maxhelp", ",", "video/edge%/edge%.model.maxpat", ",", "video/edge%/edge%.model.xml", ",", "video/edge%/edge%.module.maxpat", ",", "video/edge%/edge%.view.maxpat", ",", "video/emboss%", ",", "video/emboss%/emboss%.model.html", ",", "video/emboss%/emboss%.model.maxhelp", ",", "video/emboss%/emboss%.model.maxpat", ",", "video/emboss%/emboss%.model.xml", ",", "video/emboss%/emboss%.module.maxpat", ",", "video/emboss%/emboss%.view.maxpat", ",", "video/fft%", ",", "video/fft%/fft%.model.html", ",", "video/fft%/fft%.model.maxhelp", ",", "video/fft%/fft%.model.maxpat", ",", "video/fft%/fft%.model.xml", ",", "video/fft%/fft%.module.maxpat", ",", "video/fft%/fft%.view.maxpat", ",", "video/fluoride%", ",", "video/fluoride%/fluoride%.model.html", ",", "video/fluoride%/fluoride%.model.maxhelp", ",", "video/fluoride%/fluoride%.model.maxpat", ",", "video/fluoride%/fluoride%.model.xml", ",", "video/fluoride%/fluoride%.module.maxpat", ",", "video/fluoride%/fluoride%.view.maxpat", ",", "video/foregroundMask%", ",", "video/foregroundMask%/foregroundMask%.model.html", ",", "video/foregroundMask%/foregroundMask%.model.maxhelp", ",", "video/foregroundMask%/foregroundMask%.model.maxpat", ",", "video/foregroundMask%/foregroundMask%.model.xml", ",", "video/foregroundMask%/foregroundMask%.module.maxpat", ",", "video/foregroundMask%/foregroundMask%.view.maxpat", ",", "video/ifft%", ",", "video/ifft%/ifft%.model.html", ",", "video/ifft%/ifft%.model.maxhelp", ",", "video/ifft%/ifft%.model.maxpat", ",", "video/ifft%/ifft%.model.xml", ",", "video/ifft%/ifft%.module.maxpat", ",", "video/ifft%/ifft%.view.maxpat", ",", "video/input%", ",", "video/input%/input%.model.html", ",", "video/input%/input%.model.maxhelp", ",", "video/input%/input%.model.maxpat", ",", "video/input%/input%.model.xml", ",", "video/input%/input%.module.maxpat", ",", "video/input%/input%.ui.maxpat", ",", "video/input%/input%.view.maxpat", ",", "video/keyscreen%", ",", "video/keyscreen%/keyscreen%.model.html", ",", "video/keyscreen%/keyscreen%.model.maxhelp", ",", "video/keyscreen%/keyscreen%.model.maxpat", ",", "video/keyscreen%/keyscreen%.model.xml", ",", "video/keyscreen%/keyscreen%.module.maxpat", ",", "video/keyscreen%/keyscreen%.view.maxpat", ",", "video/mblur%", ",", "video/mblur%/mblur%.model.html", ",", "video/mblur%/mblur%.model.maxhelp", ",", "video/mblur%/mblur%.model.maxpat", ",", "video/mblur%/mblur%.model.xml", ",", "video/mblur%/mblur%.module.maxpat", ",", "video/mblur%/mblur%.view.maxpat", ",", "video/motion%", ",", "video/motion%/motion%.model.html", ",", "video/motion%/motion%.model.maxhelp", ",", "video/motion%/motion%.model.maxpat", ",", "video/motion%/motion%.model.xml", ",", "video/motion%/motion%.module.maxpat", ",", "video/motion%/motion%.view.maxpat", ",", "video/motion2%", ",", "video/motion2%/motion2%.model.html", ",", "video/motion2%/motion2%.model.maxhelp", ",", "video/motion2%/motion2%.model.maxpat", ",", "video/motion2%/motion2%.model.xml", ",", "video/motion2%/motion2%.module.maxpat", ",", "video/motion2%/motion2%.view.maxpat", ",", "video/motiongram%", ",", "video/motiongram%/motiongram%.model.html", ",", "video/motiongram%/motiongram%.model.maxhelp", ",", "video/motiongram%/motiongram%.model.maxpat", ",", "video/motiongram%/motiongram%.model.xml", ",", "video/motiongram%/motiongram%.module.maxpat", ",", "video/motiongram%/motiongram%.view.maxpat", ",", "video/moviePlayer%", ",", "video/moviePlayer%/moviePlayer%.model.html", ",", "video/moviePlayer%/moviePlayer%.model.maxhelp", ",", "video/moviePlayer%/moviePlayer%.model.maxpat", ",", "video/moviePlayer%/moviePlayer%.model.xml", ",", "video/moviePlayer%/moviePlayer%.module.maxpat", ",", "video/moviePlayer%/moviePlayer%.view.maxpat", ",", "video/op%", ",", "video/op%/op%.model.html", ",", "video/op%/op%.model.maxhelp", ",", "video/op%/op%.model.maxpat", ",", "video/op%/op%.model.xml", ",", "video/op%/op%.module.maxpat", ",", "video/op%/op%.view.maxpat", ",", "video/orsize%", ",", "video/orsize%/orsize%.model.html", ",", "video/orsize%/orsize%.model.maxhelp", ",", "video/orsize%/orsize%.model.maxpat", ",", "video/orsize%/orsize%.model.xml", ",", "video/orsize%/orsize%.module.maxpat", ",", "video/orsize%/orsize%.view.maxpat", ",", "video/output%", ",", "video/output%/output%.model.html", ",", "video/output%/output%.model.maxhelp", ",", "video/output%/output%.model.maxpat", ",", "video/output%/output%.model.xml", ",", "video/output%/output%.module.maxpat", ",", "video/output%/output%.view.maxpat", ",", "video/plur%", ",", "video/plur%/plur%.model.html", ",", "video/plur%/plur%.model.maxhelp", ",", "video/plur%/plur%.model.maxpat", ",", "video/plur%/plur%.model.xml", ",", "video/plur%/plur%.module.maxpat", ",", "video/plur%/plur%.view.maxpat", ",", "video/posterize%", ",", "video/posterize%/posterize%.model.html", ",", "video/posterize%/posterize%.model.maxhelp", ",", "video/posterize%/posterize%.model.maxpat", ",", "video/posterize%/posterize%.model.xml", ",", "video/posterize%/posterize%.module.maxpat", ",", "video/posterize%/posterize%.view.maxpat", ",", "video/record%", ",", "video/record%/record%.model.html", ",", "video/record%/record%.model.maxhelp", ",", "video/record%/record%.model.maxpat", ",", "video/record%/record%.model.xml", ",", "video/record%/record%.module.maxpat", ",", "video/record%/record%.view.maxpat", ",", "video/rgb2gray%", ",", "video/rgb2gray%/rgb2gray%.model.html", ",", "video/rgb2gray%/rgb2gray%.model.maxhelp", ",", "video/rgb2gray%/rgb2gray%.model.maxpat", ",", "video/rgb2gray%/rgb2gray%.model.xml", ",", "video/rgb2gray%/rgb2gray%.module.maxpat", ",", "video/rgb2gray%/rgb2gray%.view.maxpat", ",", "video/similarity%", ",", "video/similarity%/similarity%.model.html", ",", "video/similarity%/similarity%.model.maxhelp", ",", "video/similarity%/similarity%.model.maxpat", ",", "video/similarity%/similarity%.model.xml", ",", "video/similarity%/similarity%.module.maxpat", ",", "video/similarity%/similarity%.view.maxpat", ",", "video/slitscan%", ",", "video/slitscan%/slitscan%.model.html", ",", "video/slitscan%/slitscan%.model.maxhelp", ",", "video/slitscan%/slitscan%.model.maxpat", ",", "video/slitscan%/slitscan%.model.xml", ",", "video/slitscan%/slitscan%.module.maxpat", ",", "video/slitscan%/slitscan%.view.maxpat", ",", "video/television%", ",", "video/television%/television%.model.html", ",", "video/television%/television%.model.maxhelp", ",", "video/television%/television%.model.maxpat", ",", "video/television%/television%.model.xml", ",", "video/television%/television%.module.maxpat", ",", "video/television%/television%.view.maxpat", ",", "video/wake%", ",", "video/wake%/wake%.model.html", ",", "video/wake%/wake%.model.maxhelp", ",", "video/wake%/wake%.model.maxpat", ",", "video/wake%/wake%.model.xml", ",", "video/wake%/wake%.module.maxpat", ",", "video/wake%/wake%.view.maxpat", ",", "video/xfade%", ",", "video/xfade%/xfade%.model.html", ",", "video/xfade%/xfade%.model.maxhelp", ",", "video/xfade%/xfade%.model.maxpat", ",", "video/xfade%/xfade%.model.xml", ",", "video/xfade%/xfade%.module.maxpat", ",", "video/xfade%/xfade%.view.maxpat", ",", "video/yfade%", ",", "video/yfade%/yfade%.model.html", ",", "video/yfade%/yfade%.model.maxhelp", ",", "video/yfade%/yfade%.model.maxpat", ",", "video/yfade%/yfade%.model.xml", ",", "video/yfade%/yfade%.module.maxpat", ",", "video/yfade%/yfade%.view.maxpat" ],
									"maxclass" : "umenu",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "int", "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 256.0, 287.998596, 356.0, 20.0 ],
									"prefix" : "Macintosh HD:/Users/lossius/dev/Jamoma/Jamoma/Implementations/Max/Jamoma/patchers/modules/"
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
									"patching_rect" : [ 76.0, 116.0, 25.0, 25.0 ]
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
									"patching_rect" : [ 256.0, 116.0, 25.0, 25.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-10",
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 256.0, 695.998596, 25.0, 25.0 ]
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
									"outlettype" : [ "int", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 256.0, 633.14386, 51.0, 20.0 ]
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
					"patching_rect" : [ 248.0, 190.002838, 165.0, 20.0 ],
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
					"text" : "p buildListOfHelpPatchers"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-23",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 321.0, 135.858948, 70.0, 20.0 ],
					"save" : [ "#N", "thispatcher", ";", "#Q", "end", ";" ],
					"text" : "thispatcher"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-64",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 474.0, 794.0, 39.0, 20.0 ],
					"text" : "zl rev"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-63",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 474.0, 822.0, 95.0, 20.0 ],
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
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-60",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 474.0, 730.0, 59.5, 20.0 ],
					"saved_object_attributes" : 					{
						"embed" : 1
					}
,
					"text" : "coll"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-16",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 474.0, 762.0, 55.0, 20.0 ],
					"text" : "pack s s"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-15",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 474.0, 849.0, 75.0, 20.0 ],
					"text" : "print Testing"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 18.0,
					"frgb" : 0.0,
					"id" : "obj-1",
					"linecount" : 4,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 450.0, 183.360352, 304.0, 87.0 ],
					"text" : "This test opens the help patches sequencially, and leave them open for 0.5 seconds to check that we do not get error messages (or crashes)."
				}

			}
, 			{
				"box" : 				{
					"color" : [ 1.0, 0.66, 0.0, 1.0 ],
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-20",
					"linecount" : 3,
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 399.0, 675.148132, 211.0, 47.0 ],
					"text" : "test.assert NoErrorsRunningDSPinHelpPatchers @tags Jamoma Foundation"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-17",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 399.0, 647.146729, 20.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-13",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 399.0, 623.0, 35.0, 20.0 ],
					"text" : "== 0"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-12",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 399.0, 596.366089, 32.5, 20.0 ],
					"text" : "i"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-105",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "int" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 7,
							"architecture" : "x86"
						}
,
						"rect" : [ 897.0, 92.0, 696.0, 696.0 ],
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
									"outlettype" : [ "int", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 50.0, 114.142426, 51.0, 20.0 ]
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
									"patching_rect" : [ 50.0, 40.0, 25.0, 25.0 ]
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
									"patching_rect" : [ 86.0, 40.0, 25.0, 25.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-101",
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 460.716522, 25.0, 25.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-102",
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 253.0, 460.716522, 25.0, 25.0 ]
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
					"patching_rect" : [ 139.0, 355.860352, 195.0, 20.0 ],
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
					"text" : "p open_helppatch_for_0.5_second"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-98",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "int", "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 7,
							"architecture" : "x86"
						}
,
						"rect" : [ 0.0, 44.0, 530.0, 503.0 ],
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
									"patching_rect" : [ 50.0, 40.0, 25.0, 25.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-95",
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 448.0, 421.5755, 25.0, 25.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-96",
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 245.0, 421.5755, 25.0, 25.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-97",
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 421.5755, 25.0, 25.0 ]
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
					"patching_rect" : [ 315.0, 477.71936, 214.0, 20.0 ],
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
					"text" : "p script_create_help_patch_for_object"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-93",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 7,
							"architecture" : "x86"
						}
,
						"rect" : [ 25.0, 69.0, 640.0, 480.0 ],
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
									"patching_rect" : [ 50.0, 129.495728, 20.0, 20.0 ]
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
									"patching_rect" : [ 50.0, 265.495728, 25.0, 25.0 ]
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
					"patching_rect" : [ 425.0, 558.720764, 88.0, 20.0 ],
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
					"text" : "p count_errors"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-89",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "bang", "int" ],
					"patching_rect" : [ 40.0, 282.43161, 118.0, 20.0 ],
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
					"patching_rect" : [ 175.0, 203.072632, 20.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-72",
					"maxclass" : "newobj",
					"numinlets" : 5,
					"numoutlets" : 4,
					"outlettype" : [ "int", "", "", "int" ],
					"patching_rect" : [ 175.0, 228.072632, 92.0, 20.0 ],
					"text" : "counter 1 1000"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-68",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 139.0, 546.146729, 35.0, 20.0 ],
					"text" : "qlim"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-69",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 139.0, 519.146729, 35.0, 20.0 ],
					"text" : "qlim"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-53",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 170.0, 477.71936, 97.0, 18.0 ],
					"text" : "script delete foo"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-46",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 315.0, 541.576904, 70.0, 20.0 ],
					"save" : [ "#N", "thispatcher", ";", "#Q", "end", ";" ],
					"text" : "thispatcher"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 1.0, 0.698039, 0.698039, 1.0 ],
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-21",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 175.0, 135.858948, 35.0, 20.0 ],
					"text" : "qlim"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-52",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "bang", "bang", "path", "bang" ],
					"patching_rect" : [ 175.0, 72.572632, 238.0, 20.0 ],
					"text" : "t b b path b"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-70",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 175.0, 16.001404, 60.0, 20.0 ],
					"text" : "loadbang"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-6",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 175.0, 45.430176, 33.0, 20.0 ],
					"text" : "qlim"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 1.0, 0.66, 0.0, 1.0 ],
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-84",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 40.0, 316.002838, 83.0, 20.0 ],
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
				"bootpath" : "/Users/lossius/dev/Jamoma/Jamoma/Implementations/Max/Jamoma/patchers/components/thru",
				"patcherrelativepath" : "../../components/thru",
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
 ]
	}

}
