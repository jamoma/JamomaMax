{
	"patcher" : 	{
		"fileversion" : 1,
		"rect" : [ 616.0, 44.0, 642.0, 784.0 ],
		"bglocked" : 0,
		"defrect" : [ 616.0, 44.0, 642.0, 784.0 ],
		"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
		"openinpresentation" : 0,
		"default_fontsize" : 10.0,
		"default_fontface" : 0,
		"default_fontname" : "Verdana",
		"gridonopen" : 0,
		"gridsize" : [ 5.0, 5.0 ],
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
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
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
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
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
						"rect" : [ 674.0, 421.0, 459.0, 256.0 ],
						"bglocked" : 0,
						"defrect" : [ 674.0, 421.0, 459.0, 256.0 ],
						"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
						"openinpresentation" : 0,
						"default_fontsize" : 10.0,
						"default_fontface" : 0,
						"default_fontname" : "Verdana",
						"gridonopen" : 0,
						"gridsize" : [ 5.0, 5.0 ],
						"gridsnaponopen" : 0,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"boxes" : [ 							{
								"box" : 								{
									"fontname" : "Verdana",
									"fontsize" : 10.0,
									"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
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
									"hidden" : 0,
									"midpoints" : [  ],
									"source" : [ "obj-10", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-2", 0 ],
									"hidden" : 0,
									"midpoints" : [  ],
									"source" : [ "obj-11", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-10", 0 ],
									"hidden" : 0,
									"midpoints" : [  ],
									"source" : [ "obj-3", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"hidden" : 0,
									"midpoints" : [  ],
									"source" : [ "obj-3", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-6", 0 ],
									"hidden" : 0,
									"midpoints" : [  ],
									"source" : [ "obj-4", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
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
						"default_fontsize" : 10.0,
						"fontname" : "Verdana",
						"globalpatchername" : "",
						"fontface" : 0,
						"fontsize" : 10.0,
						"default_fontface" : 0,
						"default_fontname" : "Verdana"
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
					"items" : [ "audio/10harmonics~/jalg.10harmonics~.maxpat", ",", "audio/10harmonics~/jmod.10harmonics~.maxhelp", ",", "audio/10harmonics~/jmod.10harmonics~.maxpat", ",", "audio/_template~/jalg._template~.maxpat", ",", "audio/_template~/jmod._template~.maxhelp", ",", "audio/_template~/jmod._template~.maxpat", ",", "audio/_template~/jmod._template~.test.maxpat", ",", "audio/audiounit~/jalg.audiounit~.maxpat", ",", "audio/audiounit~/jmod.audiounit~.maxhelp", ",", "audio/audiounit~/jmod.audiounit~.maxpat", ",", "audio/crossfade~/jalg.crossfade~.maxpat", ",", "audio/crossfade~/jmod.crossfade~.maxhelp", ",", "audio/crossfade~/jmod.crossfade~.maxpat", ",", "audio/degrade~/jalg.degrade~.maxpat", ",", "audio/degrade~/jmod.degrade~.maxhelp", ",", "audio/degrade~/jmod.degrade~.maxpat", ",", "audio/delay~/jalg.delay~.maxpat", ",", "audio/delay~/jmod.delay~.maxhelp", ",", "audio/delay~/jmod.delay~.maxpat", ",", "audio/echo~/jalg.echo~.maxpat", ",", "audio/echo~/jmod.echo~.maxhelp", ",", "audio/echo~/jmod.echo~.maxpat", ",", "audio/equalizer~/jalg.equalizer~.maxpat", ",", "audio/equalizer~/jalg.equalizer~_params.maxpat", ",", "audio/equalizer~/jmod.equalizer~.maxhelp", ",", "audio/equalizer~/jmod.equalizer~.maxpat", ",", "audio/filter~/jalg.filter~.maxpat", ",", "audio/filter~/jmod.filter~.maxhelp", ",", "audio/filter~/jmod.filter~.maxpat", ",", "audio/fluidsynth~/jalg.fluidsynth~.maxpat", ",", "audio/fluidsynth~/jmod.fluidsynth~.maxhelp", ",", "audio/fluidsynth~/jmod.fluidsynth~.maxpat", ",", "audio/input~/input~.module.maxhelp", ",", "audio/input~/input~.module.maxpat", ",", "audio/limiter~/jmod.limiter~.maxhelp", ",", "audio/limiter~/jmod.limiter~.maxpat", ",", "audio/multidelay~/jalg.multidelay~.maxpat", ",", "audio/multidelay~/jmod.multidelay~.maxhelp", ",", "audio/multidelay~/jmod.multidelay~.maxpat", ",", "audio/noisegate~/jalg.noisegate~.maxpat", ",", "audio/noisegate~/jmod.noisegate~.maxhelp", ",", "audio/noisegate~/jmod.noisegate~.maxpat", ",", "audio/noise~/jalg.noise~.maxpat", ",", "audio/noise~/jmod.noise~.maxhelp", ",", "audio/noise~/jmod.noise~.maxpat", ",", "audio/output~/jmod.output~.maxhelp", ",", "audio/output~/jmod.output~.maxpat", ",", "audio/rissetGlissando/jalg.rissetGlissando~.maxpat", ",", "audio/rissetGlissando/jmod.rissetGlissando~.maxhelp", ",", "audio/rissetGlissando/jmod.rissetGlissando~.maxpat", ",", "audio/samplePlayer2~/jalg.samplePlayer2~.maxpat", ",", "audio/samplePlayer2~/jmod.samplePlayer2~.maxhelp", ",", "audio/samplePlayer2~/jmod.samplePlayer2~.maxpat", ",", "audio/samplePlayer~/jalg.samplePlayer~.maxpat", ",", "audio/samplePlayer~/jmod.samplePlayer~.maxhelp", ",", "audio/samplePlayer~/jmod.samplePlayer~.maxpat", ",", "audio/saturation~/jmod.saturation~.maxhelp", ",", "audio/saturation~/jmod.saturation~.maxpat", ",", "audio/scope~/jmod.scope~.maxhelp", ",", "audio/scope~/jmod.scope~.maxpat", ",", "audio/sine~/jalg.sine~.maxpat", ",", "audio/sine~/jmod.sine~.maxhelp", ",", "audio/sine~/jmod.sine~.maxpat", ",", "audio/spectralShift~/jalg.spectralShift~.maxpat", ",", "audio/spectralShift~/j.spectralShiftVoice~.maxpat", ",", "audio/spectralShift~/jmod.spectralShift~.maxhelp", ",", "audio/spectralShift~/jmod.spectralShift~.maxpat", ",", "audio/spectrogram~/jalg.spectrogram~.maxpat", ",", "audio/spectrogram~/jmod.spectrogram~.maxhelp", ",", "audio/spectrogram~/jmod.spectrogram~.maxpat", ",", "audio/tremolo~/jalg.tremolo~.maxpat", ",", "audio/tremolo~/jmod.tremolo~.maxhelp", ",", "audio/tremolo~/jmod.tremolo~.maxpat", ",", "audio/vst~/jalg.vst~.maxpat", ",", "audio/vst~/jmod.vst~.maxhelp", ",", "audio/vst~/jmod.vst~.maxpat", ",", "control/_template/jalg._template.maxpat", ",", "control/_template/jmod._template.maxhelp", ",", "control/_template/jmod._template.maxpat", ",", "control/_template/jmod._template.test.maxpat", ",", "control/bcf2000/BCFFader.maxpat", ",", "control/bcf2000/BCFKey.maxpat", ",", "control/bcf2000/jalg.bcf2000.maxpat", ",", "control/bcf2000/jmod.bcf2000.maxhelp", ",", "control/bcf2000/jmod.bcf2000.maxpat", ",", "control/bcf2000/Push_encoder_press.maxpat", ",", "control/bcf2000/Push_encoder_turn.maxpat", ",", "control/colorpicker/jmod.colorpicker.maxhelp", ",", "control/colorpicker/jmod.colorpicker.maxpat", ",", "control/continuum/jalg.continuum.maxpat", ",", "control/continuum/jalg.continuum_synth.maxpat", ",", "control/continuum/jmod.continuum.maxhelp", ",", "control/continuum/jmod.continuum.maxpat", ",", "control/cueComment/jmod.cueComment.maxpat", ",", "control/cueManager/CuePrioritiesPropagator.maxpat", ",", "control/cueManager/jmod.cueManager.maxhelp", ",", "control/cueManager/jmod.cueManager.maxpat", ",", "control/cueScript/jalg.cueScript.maxpat", ",", "control/cueScript/jmod.cueScript.maxhelp", ",", "control/cueScript/jmod.cueScript.maxpat", ",", "control/cueTrigger/jmod.cueTrigger.maxhelp", ",", "control/cueTrigger/jmod.cueTrigger.maxpat", ",", "control/fileBrowser/jmod.fileBrowser.maxhelp", ",", "control/fileBrowser/jmod.fileBrowser.maxpat", ",", "control/fileNameGenerator/jmod.fileNameGenerator.maxhelp", ",", "control/fileNameGenerator/jmod.fileNameGenerator.maxpat", ",", "control/globalTransport/jmod.globalTransport.maxhelp", ",", "control/globalTransport/jmod.globalTransport.maxpat", ",", "control/hi/jalg.hi.maxpat", ",", "control/hi/jmod.hi.maxhelp", ",", "control/hi/jmod.hi.maxpat", ",", "control/layout/jmod.layout.maxhelp", ",", "control/layout/jmod.layout.maxpat", ",", "control/mapper/jalg.mapper.maxpat", ",", "control/mapper/jalg.transformation.maxpat", ",", "control/mapper/jmod.mapper.maxhelp", ",", "control/mapper/jmod.mapper.maxpat", ",", "control/mapperContinuous/jmod.mapperContinuous.maxhelp", ",", "control/mapperContinuous/jmod.mapperContinuous.maxpat", ",", "control/mapperDiscrete/jmod.mapperDiscrete.maxhelp", ",", "control/mapperDiscrete/jmod.mapperDiscrete.maxpat", ",", "control/messages/jmod.messages.maxhelp", ",", "control/messages/jmod.messages.maxpat", ",", "control/midiin/jalg.midiin.maxpat", ",", "control/midiin/jmod.midiin.maxhelp", ",", "control/midiin/jmod.midiin.maxpat", ",", "control/mouse/jalg.mouse.maxpat", ",", "control/mouse/jmod.mouse.maxhelp", ",", "control/mouse/jmod.mouse.maxpat", ",", "control/mouse.gdif/jalg.mouse.gdif.maxpat", ",", "control/mouse.gdif/jmod.mouse.gdif.maxhelp", ",", "control/mouse.gdif/jmod.mouse.gdif.maxpat", ",", "control/multicast/jalg.multicast.maxpat", ",", "control/multicast/jalg.multicast_core.maxpat", ",", "control/multicast/jmod.multicast.maxhelp", ",", "control/multicast/jmod.multicast.maxpat", ",", "control/oscnet/jalg.oscnet.maxpat", ",", "control/oscnet/jalg.oscnet.ui.maxpat", ",", "control/oscnet/jmod.oscnet.maxhelp", ",", "control/oscnet/jmod.oscnet.maxpat", ",", "control/palette/jalg.palette.maxpat", ",", "control/palette/jmod.palette.maxhelp", ",", "control/palette/jmod.palette.maxpat", ",", "control/polhemus/jalg.polhemus.maxpat", ",", "control/polhemus/jmod.polhemus.maxhelp", ",", "control/polhemus/jmod.polhemus.maxpat", ",", "control/qmetro/jalg.qmetro.maxpat", ",", "control/qmetro/jmod.qmetro.maxhelp", ",", "control/qmetro/jmod.qmetro.maxpat", ",", "control/qmetro/qmetro.test.maxpat", ",", "control/spacenavigator/jalg.spacenavigator.maxpat", ",", "control/spacenavigator/jmod.spacenavigator.maxhelp", ",", "control/spacenavigator/jmod.spacenavigator.maxpat", ",", "control/uc-33/jalg.uc-33.maxpat", ",", "control/uc-33/jmod.uc-33.maxhelp", ",", "control/uc-33/jmod.uc-33.maxpat", ",", "control/wacom/jalg.wacom.maxpat", ",", "control/wacom/jmod.wacom.maxhelp", ",", "control/wacom/jmod.wacom.maxpat", ",", "data/condition/jalg.condition.maxpat", ",", "data/condition/jmod.condition.maxhelp", ",", "data/condition/jmod.condition.maxpat", ",", "data/textwriter/jalg.textwriter.maxpat", ",", "data/textwriter/jmod.textwriter.maxhelp", ",", "data/textwriter/jmod.textwriter.maxpat", ",", "openGL/gl.alphamixer%/jalg.gl.alphamixer%.maxpat", ",", "openGL/gl.alphamixer%/jmod.gl.alphamixer%.maxhelp", ",", "openGL/gl.alphamixer%/jmod.gl.alphamixer%.maxpat", ",", "openGL/gl.chromakey%/jalg.gl.chromakey%.maxpat", ",", "openGL/gl.chromakey%/jmod.gl.chromakey%.maxhelp", ",", "openGL/gl.chromakey%/jmod.gl.chromakey%.maxpat", ",", "openGL/gl.edgeblend%/jalg.gl.edgeblend%.maxpat", ",", "openGL/gl.edgeblend%/jmod.gl.edgeblend%.maxhelp", ",", "openGL/gl.edgeblend%/jmod.gl.edgeblend%.maxpat", ",", "openGL/gl.td.background%/jalg.gl.background%.maxpat", ",", "openGL/gl.td.background%/jmod.gl.background%.maxhelp", ",", "openGL/gl.td.background%/jmod.gl.background%.maxpat", ",", "openGL/gl.td.rota%/jalg.gl.td.rota%.maxpat", ",", "openGL/gl.td.rota%/jmod.gl.td.rota%.maxhelp", ",", "openGL/gl.td.rota%/jmod.gl.td.rota%.maxpat", ",", "openGL/gl.text2d%/jalg.gl.text2d%.maxpat", ",", "openGL/gl.text2d%/jmod.gl.text2d%.maxhelp", ",", "openGL/gl.text2d%/jmod.gl.text2d%.maxpat", ",", "openGL/gl.videoplane%/jalg.gl.videoplane%.maxpat", ",", "openGL/gl.videoplane%/jmod.gl.videoplane%.maxhelp", ",", "openGL/gl.videoplane%/jmod.gl.videoplane%.maxpat", ",", "spatialization/sur.ambi.adjust~/jalg.sur.ambi.adjust~.maxpat", ",", "spatialization/sur.ambi.adjust~/jmod.sur.ambi.adjust~.maxhelp", ",", "spatialization/sur.ambi.adjust~/jmod.sur.ambi.adjust~.maxpat", ",", "spatialization/sur.ambi.decode~/jalg.sur.ambi.decode~.maxpat", ",", "spatialization/sur.ambi.decode~/jmod.sur.ambi.decode~.maxhelp", ",", "spatialization/sur.ambi.decode~/jmod.sur.ambi.decode~.maxpat", ",", "spatialization/sur.ambi.encodeM~/jalg.sur.ambi.encodeM~.maxpat", ",", "spatialization/sur.ambi.encodeM~/jmod.sur.ambi.encodeM~.maxhelp", ",", "spatialization/sur.ambi.encodeM~/jmod.sur.ambi.encodeM~.maxpat", ",", "spatialization/sur.ambipanning~/jalg.sur.ambipanning~.maxpat", ",", "spatialization/sur.ambipanning~/j.ambipanSource.maxpat", ",", "spatialization/sur.ambipanning~/jmod.sur.ambipanning~.maxhelp", ",", "spatialization/sur.ambipanning~/jmod.sur.ambipanning~.maxpat", ",", "spatialization/sur.ambisonics~/jalg.sur.ambisonics~.maxpat", ",", "spatialization/sur.ambisonics~/jmod.sur.ambisonics~.maxhelp", ",", "spatialization/sur.ambisonics~/jmod.sur.ambisonics~.maxpat", ",", "spatialization/sur.audiounit~/jalg.sur.audiounit~.maxpat", ",", "spatialization/sur.audiounit~/jmod.sur.audiounit~.maxhelp", ",", "spatialization/sur.audiounit~/jmod.sur.audiounit~.maxpat", ",", "spatialization/sur.aux~/jalg.sur.aux~.maxpat", ",", "spatialization/sur.aux~/jmod.sur.aux~.maxhelp", ",", "spatialization/sur.aux~/jmod.sur.aux~.maxpat", ",", "spatialization/sur.dbap~/jalg.sur.dbap~.maxpat", ",", "spatialization/sur.dbap~/jmod.sur.dbap~.maxhelp", ",", "spatialization/sur.dbap~/jmod.sur.dbap~.maxpat", ",", "spatialization/sur.doppler~/jalg.sur.doppler~.maxpat", ",", "spatialization/sur.doppler~/j.sur.ch.doppler~.maxpat", ",", "spatialization/sur.doppler~/jmod.sur.doppler~.maxhelp", ",", "spatialization/sur.doppler~/jmod.sur.doppler~.maxpat", ",", "spatialization/sur.input~/input.timeDisplay.maxpat", ",", "spatialization/sur.input~/jalg.sur.input~.maxpat", ",", "spatialization/sur.input~/jmod.sur.input~.maxhelp", ",", "spatialization/sur.input~/jmod.sur.input~.maxpat", ",", "spatialization/sur.meters~/jmod.sur.meters~.maxhelp", ",", "spatialization/sur.meters~/jmod.sur.meters~.maxpat", ",", "spatialization/sur.multi.in~/jalg.sur.multi.in~.maxpat", ",", "spatialization/sur.multi.in~/jmod.sur.multi.in~.maxhelp", ",", "spatialization/sur.multi.in~/jmod.sur.multi.in~.maxpat", ",", "spatialization/sur.multi.out~/jalg.sur.multi.out~.maxpat", ",", "spatialization/sur.multi.out~/jmod.sur.multi.out~.maxhelp", ",", "spatialization/sur.multi.out~/jmod.sur.multi.out~.maxpat", ",", "spatialization/sur.output~/jalg.sur.output~.maxpat", ",", "spatialization/sur.output~/jmod.sur.output~.maxhelp", ",", "spatialization/sur.output~/jmod.sur.output~.maxpat", ",", "spatialization/sur.position/jmod.sur.position.maxhelp", ",", "spatialization/sur.position/jmod.sur.position.maxpat", ",", "spatialization/sur.race~/jalg.sur.race~.maxpat", ",", "spatialization/sur.race~/jmod.sur.race~.maxhelp", ",", "spatialization/sur.race~/jmod.sur.race~.maxpat", ",", "spatialization/sur.race~/pingpong.poly.maxpat", ",", "spatialization/sur.rolloff~/jalg.sur.rolloff~.maxpat", ",", "spatialization/sur.rolloff~/j.sur.ch.rolloff~.maxpat", ",", "spatialization/sur.rolloff~/jmod.sur.rolloff~.maxhelp", ",", "spatialization/sur.rolloff~/jmod.sur.rolloff~.maxpat", ",", "spatialization/sur.setup/j.sur.channel.xyz_setup.maxpat", ",", "spatialization/sur.setup/jmod.sur.setup.maxhelp", ",", "spatialization/sur.setup/jmod.sur.setup.maxpat", ",", "spatialization/sur.speaker.delay~/jalg.sur.speaker.delay~.maxpat", ",", "spatialization/sur.speaker.delay~/jmod.sur.speaker.delay~.maxhelp", ",", "spatialization/sur.speaker.delay~/jmod.sur.speaker.delay~.maxpat", ",", "spatialization/sur.speaker.distamp~/jalg.sur.speaker.distamp~.maxpat", ",", "spatialization/sur.speaker.distamp~/jmod.sur.speaker.distamp~.maxhelp", ",", "spatialization/sur.speaker.distamp~/jmod.sur.speaker.distamp~.maxpat", ",", "spatialization/sur.vbap~/jalg.sur.vbap~.maxpat", ",", "spatialization/sur.vbap~/jmod.sur.vbap~.maxhelp", ",", "spatialization/sur.vbap~/jmod.sur.vbap~.maxpat", ",", "spatialization/sur.zoomH2ambi~/jmod.sur.zoomH2ambi~.maxhelp", ",", "spatialization/sur.zoomH2ambi~/jmod.sur.zoomH2ambi~.maxpat", ",", "video/alphablend%/jalg.alphablend%.maxpat", ",", "video/alphablend%/jmod.alphablend%.maxhelp", ",", "video/alphablend%/jmod.alphablend%.maxpat", ",", "video/avg4%/jalg.avg4%.maxpat", ",", "video/avg4%/jmod.avg4%.maxhelp", ",", "video/avg4%/jmod.avg4%.maxpat", ",", "video/background%/jalg.background%.maxpat", ",", "video/background%/jmod.background%.maxhelp", ",", "video/background%/jmod.background%.maxpat", ",", "video/blur%/jalg.blur%.maxpat", ",", "video/blur%/jmod.blur%.maxhelp", ",", "video/blur%/jmod.blur%.maxpat", ",", "video/box%/jalg.box%.maxpat", ",", "video/box%/jmod.box%.maxhelp", ",", "video/box%/jmod.box%.maxpat", ",", "video/brcosa%/jalg.brcosa%.maxpat", ",", "video/brcosa%/jmod.brcosa%.maxhelp", ",", "video/brcosa%/jmod.brcosa%.maxpat", ",", "video/chromakey%/jalg.chromakey%.maxpat", ",", "video/chromakey%/jmod.chromakey%.maxhelp", ",", "video/chromakey%/jmod.chromakey%.maxpat", ",", "video/edge%/jalg.edge%.maxpat", ",", "video/edge%/jmod.edge%.maxhelp", ",", "video/edge%/jmod.edge%.maxpat", ",", "video/emboss%/jalg.emboss%.maxpat", ",", "video/emboss%/jmod.emboss%.maxhelp", ",", "video/emboss%/jmod.emboss%.maxpat", ",", "video/fluoride%/jalg.fluoride%.maxpat", ",", "video/fluoride%/jmod.fluoride%.maxhelp", ",", "video/fluoride%/jmod.fluoride%.maxpat", ",", "video/foregroundMask%/jalg.foregroundMask%.maxpat", ",", "video/foregroundMask%/jmod.foregroundMask%.maxhelp", ",", "video/foregroundMask%/jmod.foregroundMask%.maxpat", ",", "video/input%/jalg.input%.maxpat", ",", "video/input%/jalg.input%.ui.maxpat", ",", "video/input%/jmod.input%.maxhelp", ",", "video/input%/jmod.input%.maxpat", ",", "video/keyscreen%/jalg.keyscreen%.maxpat", ",", "video/keyscreen%/jmod.keyscreen%.maxhelp", ",", "video/keyscreen%/jmod.keyscreen%.maxpat", ",", "video/mblur%/jalg.mblur%.maxpat", ",", "video/mblur%/jmod.mblur%.maxhelp", ",", "video/mblur%/jmod.mblur%.maxpat", ",", "video/motion%/jalg.motion%.maxpat", ",", "video/motion%/jmod.motion%.maxhelp", ",", "video/motion%/jmod.motion%.maxpat", ",", "video/motion2%/jalg.motion2%.maxpat", ",", "video/motion2%/jmod.motion2%.maxhelp", ",", "video/motion2%/jmod.motion2%.maxpat", ",", "video/motiongram%/jalg.motiongram%.maxpat", ",", "video/motiongram%/jmod.motiongram%.maxhelp", ",", "video/motiongram%/jmod.motiongram%.maxpat", ",", "video/moviePlayer%/jalg.moviePlayer%.maxpat", ",", "video/moviePlayer%/jmod.moviePlayer%.maxhelp", ",", "video/moviePlayer%/jmod.moviePlayer%.maxpat", ",", "video/op%/jalg.op%.maxpat", ",", "video/op%/jmod.op%.maxhelp", ",", "video/op%/jmod.op%.maxpat", ",", "video/orsize%/jalg.orsize%.maxpat", ",", "video/orsize%/jmod.orsize%.maxhelp", ",", "video/orsize%/jmod.orsize%.maxpat", ",", "video/output%/jalg.output%.maxpat", ",", "video/output%/jmod.output%.maxhelp", ",", "video/output%/jmod.output%.maxpat", ",", "video/plur%/jalg.plur%.maxpat", ",", "video/plur%/jmod.plur%.maxhelp", ",", "video/plur%/jmod.plur%.maxpat", ",", "video/record%/jalg.record%.maxpat", ",", "video/record%/jmod.record%.maxhelp", ",", "video/record%/jmod.record%.maxpat", ",", "video/similarity%/jalg.similarity%.maxpat", ",", "video/similarity%/jmod.similarity%.maxhelp", ",", "video/similarity%/jmod.similarity%.maxpat", ",", "video/slitscan%/jalg.slitscan%.maxpat", ",", "video/slitscan%/jmod.slitscan%.maxhelp", ",", "video/slitscan%/jmod.slitscan%.maxpat", ",", "video/television%/jalg.television%.maxpat", ",", "video/television%/jmod.television%.maxhelp", ",", "video/television%/jmod.television%.maxpat", ",", "video/wake%/jalg.wake%.maxpat", ",", "video/wake%/jmod.wake%.maxhelp", ",", "video/wake%/jmod.wake%.maxpat", ",", "video/xfade%/jalg.xfade%.maxpat", ",", "video/xfade%/jmod.xfade%.maxhelp", ",", "video/xfade%/jmod.xfade%.maxpat", ",", "video/yfade%/jalg.yfade%.maxpat", ",", "video/yfade%/jmod.yfade%.maxhelp", ",", "video/yfade%/jmod.yfade%.maxpat" ],
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"patching_rect" : [ 95.0, 103.0, 224.0, 20.0 ],
					"prefix" : "Macintosh HD:/Users/nilspeters/Documents/PhD/gitreps/Jamoma/Modules/Modular/Max/modules/",
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
						"rect" : [ 680.0, 117.0, 600.0, 426.0 ],
						"bglocked" : 0,
						"defrect" : [ 680.0, 117.0, 600.0, 426.0 ],
						"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
						"openinpresentation" : 0,
						"default_fontsize" : 10.0,
						"default_fontface" : 0,
						"default_fontname" : "Verdana",
						"gridonopen" : 0,
						"gridsize" : [ 5.0, 5.0 ],
						"gridsnaponopen" : 0,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
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
									"patching_rect" : [ 194.0, 126.0, 109.0, 19.0 ],
									"text" : "sprintf %s/modules"
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
									"hidden" : 0,
									"midpoints" : [ 203.5, 263.5, 63.0, 263.5 ],
									"source" : [ "obj-10", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-18", 0 ],
									"hidden" : 0,
									"midpoints" : [  ],
									"source" : [ "obj-13", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-24", 0 ],
									"hidden" : 0,
									"midpoints" : [  ],
									"source" : [ "obj-18", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-23", 0 ],
									"hidden" : 0,
									"midpoints" : [  ],
									"source" : [ "obj-22", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-10", 0 ],
									"hidden" : 0,
									"midpoints" : [  ],
									"source" : [ "obj-23", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-14", 0 ],
									"hidden" : 0,
									"midpoints" : [ 343.5, 289.0, 63.0, 289.0 ],
									"source" : [ "obj-24", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-14", 0 ],
									"hidden" : 0,
									"midpoints" : [  ],
									"source" : [ "obj-24", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"hidden" : 0,
									"midpoints" : [  ],
									"source" : [ "obj-24", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-22", 0 ],
									"hidden" : 0,
									"midpoints" : [  ],
									"source" : [ "obj-4", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 95.0, 74.0, 60.0, 19.0 ],
					"saved_object_attributes" : 					{
						"default_fontsize" : 10.0,
						"fontname" : "Verdana",
						"globalpatchername" : "",
						"fontface" : 0,
						"fontsize" : 10.0,
						"default_fontface" : 0,
						"default_fontname" : "Verdana"
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
					"numinlets" : 1,
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
						"rect" : [ 653.0, 201.0, 272.0, 259.0 ],
						"bglocked" : 0,
						"defrect" : [ 653.0, 201.0, 272.0, 259.0 ],
						"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
						"openinpresentation" : 0,
						"default_fontsize" : 10.0,
						"default_fontface" : 0,
						"default_fontname" : "Verdana",
						"gridonopen" : 0,
						"gridsize" : [ 5.0, 5.0 ],
						"gridsnaponopen" : 0,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
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
									"hidden" : 0,
									"midpoints" : [  ],
									"source" : [ "obj-23", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"hidden" : 0,
									"midpoints" : [  ],
									"source" : [ "obj-25", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-23", 0 ],
									"hidden" : 0,
									"midpoints" : [  ],
									"source" : [ "obj-4", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-25", 0 ],
									"hidden" : 0,
									"midpoints" : [  ],
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 305.0, 424.0, 59.0, 19.0 ],
					"saved_object_attributes" : 					{
						"default_fontsize" : 10.0,
						"fontname" : "Verdana",
						"globalpatchername" : "",
						"fontface" : 0,
						"fontsize" : 10.0,
						"default_fontface" : 0,
						"default_fontname" : "Verdana"
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
					"numinlets" : 1,
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
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 112.0, 535.0, 208.0, 19.0 ],
					"text" : "j.receive j.remote.module.from"
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
					"patching_rect" : [ 112.0, 512.0, 182.0, 19.0 ],
					"text" : "j.send j.remote.module.to"
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
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
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
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
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
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
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
					"numinlets" : 1,
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
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
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
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
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
					"text" : "regexp .*/(audio|video|control|data|openGL|spatialization)/.*/(jmod\\\\..*\\\\.maxpat)"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-22", 0 ],
					"hidden" : 0,
					"midpoints" : [  ],
					"source" : [ "obj-10", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-35", 0 ],
					"hidden" : 0,
					"midpoints" : [ 338.5, 355.0, 96.0, 374.0, 96.0, 701.0, 121.5, 701.0 ],
					"source" : [ "obj-12", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 1 ],
					"hidden" : 0,
					"midpoints" : [  ],
					"source" : [ "obj-13", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-19", 0 ],
					"hidden" : 0,
					"midpoints" : [  ],
					"source" : [ "obj-14", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-14", 0 ],
					"hidden" : 0,
					"midpoints" : [  ],
					"source" : [ "obj-15", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 0 ],
					"hidden" : 0,
					"midpoints" : [  ],
					"source" : [ "obj-17", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-17", 0 ],
					"hidden" : 0,
					"midpoints" : [  ],
					"source" : [ "obj-18", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"hidden" : 0,
					"midpoints" : [  ],
					"source" : [ "obj-20", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-35", 0 ],
					"hidden" : 0,
					"midpoints" : [  ],
					"source" : [ "obj-21", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-29", 0 ],
					"hidden" : 0,
					"midpoints" : [  ],
					"source" : [ "obj-22", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-30", 0 ],
					"hidden" : 0,
					"midpoints" : [ 194.5, 667.0, 387.5, 667.0 ],
					"source" : [ "obj-28", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 0 ],
					"hidden" : 0,
					"midpoints" : [  ],
					"source" : [ "obj-282", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-28", 0 ],
					"hidden" : 0,
					"midpoints" : [  ],
					"source" : [ "obj-29", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-36", 0 ],
					"hidden" : 0,
					"midpoints" : [  ],
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 0 ],
					"hidden" : 0,
					"midpoints" : [  ],
					"source" : [ "obj-34", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-20", 0 ],
					"hidden" : 0,
					"midpoints" : [ 419.0, 184.5, 338.0, 184.5 ],
					"source" : [ "obj-34", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-61", 0 ],
					"hidden" : 0,
					"midpoints" : [  ],
					"source" : [ "obj-34", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-62", 0 ],
					"hidden" : 0,
					"midpoints" : [  ],
					"source" : [ "obj-34", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-63", 0 ],
					"hidden" : 0,
					"midpoints" : [  ],
					"source" : [ "obj-34", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 0 ],
					"hidden" : 0,
					"midpoints" : [  ],
					"source" : [ "obj-34", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-41", 0 ],
					"hidden" : 0,
					"midpoints" : [ 121.5, 731.0, 610.5, 731.0, 610.5, 219.0, 409.5, 219.0 ],
					"source" : [ "obj-35", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-21", 0 ],
					"hidden" : 0,
					"midpoints" : [  ],
					"source" : [ "obj-36", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"hidden" : 0,
					"midpoints" : [  ],
					"source" : [ "obj-4", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-41", 0 ],
					"hidden" : 0,
					"midpoints" : [ 441.5, 288.0, 394.0, 288.0, 394.0, 228.0, 409.5, 228.0 ],
					"source" : [ "obj-40", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-55", 0 ],
					"hidden" : 0,
					"midpoints" : [  ],
					"source" : [ "obj-40", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-40", 0 ],
					"hidden" : 0,
					"midpoints" : [  ],
					"source" : [ "obj-41", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-41", 0 ],
					"hidden" : 0,
					"midpoints" : [  ],
					"source" : [ "obj-43", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-43", 0 ],
					"hidden" : 0,
					"midpoints" : [ 309.5, 154.0, 540.0, 154.0, 540.0, 188.0, 409.5, 188.0 ],
					"source" : [ "obj-44", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-96", 1 ],
					"hidden" : 0,
					"midpoints" : [ 309.5, 154.0, 375.25, 154.0, 375.25, 101.0, 402.0, 101.0 ],
					"source" : [ "obj-44", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-9", 0 ],
					"hidden" : 0,
					"midpoints" : [  ],
					"source" : [ "obj-45", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"hidden" : 0,
					"midpoints" : [  ],
					"source" : [ "obj-5", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-59", 0 ],
					"hidden" : 0,
					"midpoints" : [ 474.5, 309.0, 587.0, 309.0, 587.0, 243.0, 587.0, 243.0, 587.0, 95.0, 104.5, 95.0 ],
					"source" : [ "obj-55", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-20", 0 ],
					"hidden" : 0,
					"midpoints" : [ 187.5, 206.5, 338.0, 206.5 ],
					"source" : [ "obj-57", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-34", 0 ],
					"hidden" : 0,
					"midpoints" : [ 228.5, 157.0, 105.5, 157.0 ],
					"source" : [ "obj-57", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-44", 0 ],
					"hidden" : 0,
					"midpoints" : [ 309.5, 131.0, 309.5, 131.0 ],
					"source" : [ "obj-59", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-57", 0 ],
					"hidden" : 0,
					"midpoints" : [ 207.0, 128.0, 105.5, 128.0 ],
					"source" : [ "obj-59", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-96", 0 ],
					"hidden" : 0,
					"midpoints" : [ 104.5, 125.0, 369.5, 125.0, 369.5, 103.0, 388.5, 103.0 ],
					"source" : [ "obj-59", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"hidden" : 0,
					"midpoints" : [  ],
					"source" : [ "obj-6", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-83", 0 ],
					"hidden" : 0,
					"midpoints" : [  ],
					"source" : [ "obj-7", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-97", 0 ],
					"hidden" : 0,
					"midpoints" : [ 162.5, 316.5, 387.5, 316.5 ],
					"source" : [ "obj-7", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-38", 0 ],
					"hidden" : 0,
					"midpoints" : [  ],
					"source" : [ "obj-83", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-59", 0 ],
					"hidden" : 0,
					"midpoints" : [  ],
					"source" : [ "obj-9", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-89", 0 ],
					"hidden" : 0,
					"midpoints" : [  ],
					"source" : [ "obj-96", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-30", 0 ],
					"hidden" : 0,
					"midpoints" : [  ],
					"source" : [ "obj-97", 0 ]
				}

			}
 ]
	}

}
