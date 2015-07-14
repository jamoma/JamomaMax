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
		"rect" : [ 379.0, 70.0, 1495.0, 920.0 ],
		"bgcolor" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
		"editing_bgcolor" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
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
		"toolbarvisible" : 0,
		"lefttoolbarpinned" : 2,
		"toptoolbarpinned" : 2,
		"righttoolbarpinned" : 2,
		"bottomtoolbarpinned" : 2,
		"toolbars_unpinned_last_save" : 15,
		"tallnewobj" : 0,
		"boxanimatetime" : 200,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"description" : "",
		"digest" : "",
		"tags" : "",
		"style" : "jpatcher001",
		"subpatcher_template" : "greyish",
		"showontab" : 1,
		"boxes" : [ 			{
				"box" : 				{
					"id" : "obj-4",
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
						"rect" : [ 0.0, 26.0, 1495.0, 894.0 ],
						"bgcolor" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
						"editing_bgcolor" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
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
						"style" : "jpatcher001",
						"subpatcher_template" : "greyish",
						"showontab" : 1,
						"boxes" : [ 							{
								"box" : 								{
									"fontname" : "Lato Regular",
									"fontsize" : 16.0,
									"id" : "obj-22",
									"linecount" : 3,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 107.0, 228.0, 281.0, 64.0 ],
									"style" : "",
									"text" : "j.namespace provides different output format so it can be connect with whatever gui object fitting your needs",
									"textcolor" : [ 0.6, 0.6, 0.6, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-20",
									"linecount" : 3,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 721.0, 659.0, 150.0, 47.0 ],
									"style" : "",
									"text" : "Max bug with leading slashes as prefix in umenu..."
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-17",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 5,
									"outlettype" : [ "", "", "", "", "" ],
									"patching_rect" : [ 721.0, 628.0, 153.0, 22.0 ],
									"style" : "",
									"text" : "regexp (.*:\\\\/) @substitute /"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-15",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 1153.0, 546.25, 74.0, 22.0 ],
									"style" : "",
									"text" : "prepend set"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-14",
									"linecount" : 151,
									"maxclass" : "textedit",
									"numinlets" : 1,
									"numoutlets" : 4,
									"outlettype" : [ "", "int", "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 1153.0, 582.0, 240.0, 120.0 ],
									"style" : "",
									"text" : "degrade.1 degrade.1/audio degrade.1/audio/bypass degrade.1/audio/gain degrade.1/audio/in.L degrade.1/audio/in.R degrade.1/audio/mix degrade.1/audio/mute degrade.1/audio/out.L degrade.1/audio/out.R degrade.1/bitdepth degrade.1/model degrade.1/preset degrade.1/samplerate_ratio degrade.2 degrade.2/audio degrade.2/audio/bypass degrade.2/audio/gain degrade.2/audio/in.L degrade.2/audio/in.R degrade.2/audio/mix degrade.2/audio/mute degrade.2/audio/out.L degrade.2/audio/out.R degrade.2/bitdepth degrade.2/model degrade.2/preset degrade.2/samplerate_ratio eq eq/audio eq/audio/bypass eq/audio/gain eq/audio/in.L eq/audio/in.R eq/audio/mix eq/audio/mute eq/audio/out.L eq/audio/out.R eq/bands eq/filter.1 eq/filter.1/frequency eq/filter.1/gain eq/filter.1/octave_bandwidth eq/filter.1/type eq/filter.2 eq/filter.2/frequency eq/filter.2/gain eq/filter.2/octave_bandwidth eq/filter.2/type eq/filter.3 eq/filter.3/frequency eq/filter.3/gain eq/filter.3/octave_bandwidth eq/filter.3/type eq/filter.4 eq/filter.4/frequency eq/filter.4/gain eq/filter.4/octave_bandwidth eq/filter.4/type eq/filtergraph eq/model eq/preset equalizer~(view) equalizer~(view)/equalizer~(view) equalizer~(view)/equalizer~(view)/filter.1 equalizer~(view)/equalizer~(view)/filter.1/frequency.1 equalizer~(view)/equalizer~(view)/filter.1/gain.1 equalizer~(view)/equalizer~(view)/filter.1/octave_bandwidth.1 equalizer~(view)/equalizer~(view)/filter.1/type.1 equalizer~(view)/equalizer~(view)/filter_graph(view) equalizer~(view)/equalizer~(view)/filter_graph(view)/frequency equalizer~(view)/equalizer~(view)/filter_graph(view)/gain equalizer~(view)/equalizer~(view)/filter_graph(view)/model equalizer~(view)/equalizer~(view)/filter_graph(view)/octave_bandwidth equalizer~(view)/equalizer~(view)/filter_numeric(view) equalizer~(view)/equalizer~(view)/filter_numeric(view)/frequency equalizer~(view)/equalizer~(view)/filter_numeric(view)/frequency.midi_converter equalizer~(view)/equalizer~(view)/filter_numeric(view)/gain equalizer~(view)/equalizer~(view)/filter_numeric(view)/model equalizer~(view)/equalizer~(view)/filter_numeric(view)/octave_bandwidth equalizer~(view)/equalizer~(view)/filter_numeric(view)/type equalizer~(view)/equalizer~(view)/model equalizer~(view)/equalizer~(view)/ui equalizer~(view)/filter.1 equalizer~(view)/filter.1/frequency.1 equalizer~(view)/filter.1/gain.1 equalizer~(view)/filter.1/octave_bandwidth.1 equalizer~(view)/filter.1/type.1 equalizer~(view)/model equalizer~(view)/ui input input/audio input/audio/gain input/audio/mute input/audio/out.L input/audio/out.R input/balance input/balance/audio input/balance/audio/out.L input/balance/audio/out.R input/balance/mode input/balance/model input/balance/position input/balance/shape input/clicktrain input/clicktrain/rate input/file input/file/direct input/file/loop input/file/path input/file/play input/file/time input/file/time/absolute input/file/time/relative input/file/transpose input/input input/input/audio input/input/audio/active input/input/channel.L input/input/channel.R input/input/dspStatus input/input/limiter input/input/limiter/active input/input/limiter/audio input/input/limiter/audio/in.L input/input/limiter/audio/in.R input/input/limiter/audio/out.L input/input/limiter/audio/out.R input/input/limiter/clear input/input/limiter/dcblocker input/input/limiter/dcblocker/active input/input/limiter/lookahead input/input/limiter/mode input/input/limiter/model input/input/limiter/postamp input/input/limiter/preamp input/input/limiter/release input/input/limiter/threshold input/input/model input/model input/preset input/soundfile input/soundfile/report input/source input/testtone input/testtone/frequency output output/audio output/audio/active output/audio/gain output/audio/mute output/audio/out.L output/audio/out.R output/balance output/balance/audio output/balance/audio/out.L output/balance/audio/out.R output/balance/mode output/balance/model output/balance/position output/balance/shape output/ch.1 output/ch.2 output/cpu output/dspStatus output/limiter output/limiter/active output/limiter/audio output/limiter/audio/in.L output/limiter/audio/in.R output/limiter/audio/out.L output/limiter/audio/out.R output/limiter/clear output/limiter/dcblocker output/limiter/dcblocker/active output/limiter/lookahead output/limiter/mode output/limiter/model output/limiter/postamp output/limiter/preamp output/limiter/release output/limiter/threshold output/model output/preset output/record output/record/active output/record/audio output/record/audio/in.L output/record/audio/in.R output/record/file output/record/file/path output/record/file/time output/record/file/type output/record/model output/record/samptype output/saturation output/saturation/active output/saturation/audio output/saturation/audio/in.L output/saturation/audio/in.R output/saturation/audio/out.L output/saturation/audio/out.R output/saturation/depth output/saturation/mode output/saturation/model output/saturation/preamp"
								}

							}
, 							{
								"box" : 								{
									"color" : [ 0.989256, 0.417462, 0.031845, 1.0 ],
									"id" : "obj-13",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "" ],
									"patching_rect" : [ 1153.0, 484.0, 223.0, 22.0 ],
									"style" : "",
									"text" : "j.namespace @address / @format none"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-12",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 4,
									"outlettype" : [ "", "", "", "" ],
									"patching_rect" : [ 912.0, 546.25, 91.0, 22.0 ],
									"saved_object_attributes" : 									{
										"embed" : 0
									}
,
									"style" : "",
									"text" : "coll @embed 0"
								}

							}
, 							{
								"box" : 								{
									"color" : [ 0.989256, 0.417462, 0.031845, 1.0 ],
									"id" : "obj-11",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "" ],
									"patching_rect" : [ 912.0, 484.0, 214.0, 22.0 ],
									"style" : "",
									"text" : "j.namespace @address / @format coll"
								}

							}
, 							{
								"box" : 								{
									"bgcolor" : [ 0.376471, 0.384314, 0.4, 1.0 ],
									"bgcolor2" : [ 0.376471, 0.384314, 0.4, 1.0 ],
									"bgfillcolor_angle" : 270.0,
									"bgfillcolor_autogradient" : 0.0,
									"bgfillcolor_color" : [ 0.290196, 0.309804, 0.301961, 0.0 ],
									"bgfillcolor_color1" : [ 0.376471, 0.384314, 0.4, 1.0 ],
									"bgfillcolor_color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
									"bgfillcolor_proportion" : 0.39,
									"bgfillcolor_type" : "color",
									"gradient" : 1,
									"id" : "obj-8",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 628.0, 582.0, 233.0, 22.0 ],
									"style" : "",
									"text" : "/equalizer~(view)/filter.1/frequency.1",
									"textcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-9",
									"items" : [ "degrade.1", ",", "degrade.1/audio", ",", "degrade.1/audio/bypass", ",", "degrade.1/audio/gain", ",", "degrade.1/audio/in.L", ",", "degrade.1/audio/in.R", ",", "degrade.1/audio/mix", ",", "degrade.1/audio/mute", ",", "degrade.1/audio/out.L", ",", "degrade.1/audio/out.R", ",", "degrade.1/bitdepth", ",", "degrade.1/model", ",", "degrade.1/preset", ",", "degrade.1/samplerate_ratio", ",", "degrade.2", ",", "degrade.2/audio", ",", "degrade.2/audio/bypass", ",", "degrade.2/audio/gain", ",", "degrade.2/audio/in.L", ",", "degrade.2/audio/in.R", ",", "degrade.2/audio/mix", ",", "degrade.2/audio/mute", ",", "degrade.2/audio/out.L", ",", "degrade.2/audio/out.R", ",", "degrade.2/bitdepth", ",", "degrade.2/model", ",", "degrade.2/preset", ",", "degrade.2/samplerate_ratio", ",", "eq", ",", "eq/audio", ",", "eq/audio/bypass", ",", "eq/audio/gain", ",", "eq/audio/in.L", ",", "eq/audio/in.R", ",", "eq/audio/mix", ",", "eq/audio/mute", ",", "eq/audio/out.L", ",", "eq/audio/out.R", ",", "eq/bands", ",", "eq/filter.1", ",", "eq/filter.1/frequency", ",", "eq/filter.1/gain", ",", "eq/filter.1/octave_bandwidth", ",", "eq/filter.1/type", ",", "eq/filter.2", ",", "eq/filter.2/frequency", ",", "eq/filter.2/gain", ",", "eq/filter.2/octave_bandwidth", ",", "eq/filter.2/type", ",", "eq/filter.3", ",", "eq/filter.3/frequency", ",", "eq/filter.3/gain", ",", "eq/filter.3/octave_bandwidth", ",", "eq/filter.3/type", ",", "eq/filter.4", ",", "eq/filter.4/frequency", ",", "eq/filter.4/gain", ",", "eq/filter.4/octave_bandwidth", ",", "eq/filter.4/type", ",", "eq/filtergraph", ",", "eq/model", ",", "eq/preset", ",", "equalizer~(view)", ",", "equalizer~(view)/equalizer~(view)", ",", "equalizer~(view)/equalizer~(view)/filter.1", ",", "equalizer~(view)/equalizer~(view)/filter.1/frequency.1", ",", "equalizer~(view)/equalizer~(view)/filter.1/gain.1", ",", "equalizer~(view)/equalizer~(view)/filter.1/octave_bandwidth.1", ",", "equalizer~(view)/equalizer~(view)/filter.1/type.1", ",", "equalizer~(view)/equalizer~(view)/filter_graph(view)", ",", "equalizer~(view)/equalizer~(view)/filter_graph(view)/frequency", ",", "equalizer~(view)/equalizer~(view)/filter_graph(view)/gain", ",", "equalizer~(view)/equalizer~(view)/filter_graph(view)/model", ",", "equalizer~(view)/equalizer~(view)/filter_graph(view)/octave_bandwidth", ",", "equalizer~(view)/equalizer~(view)/filter_numeric(view)", ",", "equalizer~(view)/equalizer~(view)/filter_numeric(view)/frequency", ",", "equalizer~(view)/equalizer~(view)/filter_numeric(view)/frequency.midi_converter", ",", "equalizer~(view)/equalizer~(view)/filter_numeric(view)/gain", ",", "equalizer~(view)/equalizer~(view)/filter_numeric(view)/model", ",", "equalizer~(view)/equalizer~(view)/filter_numeric(view)/octave_bandwidth", ",", "equalizer~(view)/equalizer~(view)/filter_numeric(view)/type", ",", "equalizer~(view)/equalizer~(view)/model", ",", "equalizer~(view)/equalizer~(view)/ui", ",", "equalizer~(view)/filter.1", ",", "equalizer~(view)/filter.1/frequency.1", ",", "equalizer~(view)/filter.1/gain.1", ",", "equalizer~(view)/filter.1/octave_bandwidth.1", ",", "equalizer~(view)/filter.1/type.1", ",", "equalizer~(view)/model", ",", "equalizer~(view)/ui", ",", "input", ",", "input/audio", ",", "input/audio/gain", ",", "input/audio/mute", ",", "input/audio/out.L", ",", "input/audio/out.R", ",", "input/balance", ",", "input/balance/audio", ",", "input/balance/audio/out.L", ",", "input/balance/audio/out.R", ",", "input/balance/mode", ",", "input/balance/model", ",", "input/balance/position", ",", "input/balance/shape", ",", "input/clicktrain", ",", "input/clicktrain/rate", ",", "input/file", ",", "input/file/direct", ",", "input/file/loop", ",", "input/file/path", ",", "input/file/play", ",", "input/file/time", ",", "input/file/time/absolute", ",", "input/file/time/relative", ",", "input/file/transpose", ",", "input/input", ",", "input/input/audio", ",", "input/input/audio/active", ",", "input/input/channel.L", ",", "input/input/channel.R", ",", "input/input/dspStatus", ",", "input/input/limiter", ",", "input/input/limiter/active", ",", "input/input/limiter/audio", ",", "input/input/limiter/audio/in.L", ",", "input/input/limiter/audio/in.R", ",", "input/input/limiter/audio/out.L", ",", "input/input/limiter/audio/out.R", ",", "input/input/limiter/clear", ",", "input/input/limiter/dcblocker", ",", "input/input/limiter/dcblocker/active", ",", "input/input/limiter/lookahead", ",", "input/input/limiter/mode", ",", "input/input/limiter/model", ",", "input/input/limiter/postamp", ",", "input/input/limiter/preamp", ",", "input/input/limiter/release", ",", "input/input/limiter/threshold", ",", "input/input/model", ",", "input/model", ",", "input/preset", ",", "input/soundfile", ",", "input/soundfile/report", ",", "input/source", ",", "input/testtone", ",", "input/testtone/frequency", ",", "output", ",", "output/audio", ",", "output/audio/active", ",", "output/audio/gain", ",", "output/audio/mute", ",", "output/audio/out.L", ",", "output/audio/out.R", ",", "output/balance", ",", "output/balance/audio", ",", "output/balance/audio/out.L", ",", "output/balance/audio/out.R", ",", "output/balance/mode", ",", "output/balance/model", ",", "output/balance/position", ",", "output/balance/shape", ",", "output/ch.1", ",", "output/ch.2", ",", "output/cpu", ",", "output/dspStatus", ",", "output/limiter", ",", "output/limiter/active", ",", "output/limiter/audio", ",", "output/limiter/audio/in.L", ",", "output/limiter/audio/in.R", ",", "output/limiter/audio/out.L", ",", "output/limiter/audio/out.R", ",", "output/limiter/clear", ",", "output/limiter/dcblocker", ",", "output/limiter/dcblocker/active", ",", "output/limiter/lookahead", ",", "output/limiter/mode", ",", "output/limiter/model", ",", "output/limiter/postamp", ",", "output/limiter/preamp", ",", "output/limiter/release", ",", "output/limiter/threshold", ",", "output/model", ",", "output/preset", ",", "output/record", ",", "output/record/active", ",", "output/record/audio", ",", "output/record/audio/in.L", ",", "output/record/audio/in.R", ",", "output/record/file", ",", "output/record/file/path", ",", "output/record/file/time", ",", "output/record/file/type", ",", "output/record/model", ",", "output/record/samptype", ",", "output/saturation", ",", "output/saturation/active", ",", "output/saturation/audio", ",", "output/saturation/audio/in.L", ",", "output/saturation/audio/in.R", ",", "output/saturation/audio/out.L", ",", "output/saturation/audio/out.R", ",", "output/saturation/depth", ",", "output/saturation/mode", ",", "output/saturation/model", ",", "output/saturation/preamp" ],
									"maxclass" : "umenu",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "int", "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 628.0, 546.25, 233.0, 22.0 ],
									"prefix" : "Macintosh HD:/",
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"color" : [ 0.989256, 0.417462, 0.031845, 1.0 ],
									"id" : "obj-10",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "" ],
									"patching_rect" : [ 628.0, 484.0, 269.0, 22.0 ],
									"style" : "",
									"text" : "j.namespace @address / @format umenu_prefix"
								}

							}
, 							{
								"box" : 								{
									"bgcolor" : [ 0.376471, 0.384314, 0.4, 1.0 ],
									"bgcolor2" : [ 0.376471, 0.384314, 0.4, 1.0 ],
									"bgfillcolor_angle" : 270.0,
									"bgfillcolor_autogradient" : 0.0,
									"bgfillcolor_color" : [ 0.290196, 0.309804, 0.301961, 0.0 ],
									"bgfillcolor_color1" : [ 0.376471, 0.384314, 0.4, 1.0 ],
									"bgfillcolor_color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
									"bgfillcolor_proportion" : 0.39,
									"bgfillcolor_type" : "color",
									"gradient" : 1,
									"id" : "obj-7",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 378.0, 582.0, 233.0, 22.0 ],
									"style" : "",
									"text" : "equalizer~(view)/filter.1/frequency.1",
									"textcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-5",
									"items" : [ "degrade.1", ",", "degrade.1/audio", ",", "degrade.1/audio/bypass", ",", "degrade.1/audio/gain", ",", "degrade.1/audio/in.L", ",", "degrade.1/audio/in.R", ",", "degrade.1/audio/mix", ",", "degrade.1/audio/mute", ",", "degrade.1/audio/out.L", ",", "degrade.1/audio/out.R", ",", "degrade.1/bitdepth", ",", "degrade.1/model", ",", "degrade.1/preset", ",", "degrade.1/samplerate_ratio", ",", "degrade.2", ",", "degrade.2/audio", ",", "degrade.2/audio/bypass", ",", "degrade.2/audio/gain", ",", "degrade.2/audio/in.L", ",", "degrade.2/audio/in.R", ",", "degrade.2/audio/mix", ",", "degrade.2/audio/mute", ",", "degrade.2/audio/out.L", ",", "degrade.2/audio/out.R", ",", "degrade.2/bitdepth", ",", "degrade.2/model", ",", "degrade.2/preset", ",", "degrade.2/samplerate_ratio", ",", "eq", ",", "eq/audio", ",", "eq/audio/bypass", ",", "eq/audio/gain", ",", "eq/audio/in.L", ",", "eq/audio/in.R", ",", "eq/audio/mix", ",", "eq/audio/mute", ",", "eq/audio/out.L", ",", "eq/audio/out.R", ",", "eq/bands", ",", "eq/filter.1", ",", "eq/filter.1/frequency", ",", "eq/filter.1/gain", ",", "eq/filter.1/octave_bandwidth", ",", "eq/filter.1/type", ",", "eq/filter.2", ",", "eq/filter.2/frequency", ",", "eq/filter.2/gain", ",", "eq/filter.2/octave_bandwidth", ",", "eq/filter.2/type", ",", "eq/filter.3", ",", "eq/filter.3/frequency", ",", "eq/filter.3/gain", ",", "eq/filter.3/octave_bandwidth", ",", "eq/filter.3/type", ",", "eq/filter.4", ",", "eq/filter.4/frequency", ",", "eq/filter.4/gain", ",", "eq/filter.4/octave_bandwidth", ",", "eq/filter.4/type", ",", "eq/filtergraph", ",", "eq/model", ",", "eq/preset", ",", "equalizer~(view)", ",", "equalizer~(view)/equalizer~(view)", ",", "equalizer~(view)/equalizer~(view)/filter.1", ",", "equalizer~(view)/equalizer~(view)/filter.1/frequency.1", ",", "equalizer~(view)/equalizer~(view)/filter.1/gain.1", ",", "equalizer~(view)/equalizer~(view)/filter.1/octave_bandwidth.1", ",", "equalizer~(view)/equalizer~(view)/filter.1/type.1", ",", "equalizer~(view)/equalizer~(view)/filter_graph(view)", ",", "equalizer~(view)/equalizer~(view)/filter_graph(view)/frequency", ",", "equalizer~(view)/equalizer~(view)/filter_graph(view)/gain", ",", "equalizer~(view)/equalizer~(view)/filter_graph(view)/model", ",", "equalizer~(view)/equalizer~(view)/filter_graph(view)/octave_bandwidth", ",", "equalizer~(view)/equalizer~(view)/filter_numeric(view)", ",", "equalizer~(view)/equalizer~(view)/filter_numeric(view)/frequency", ",", "equalizer~(view)/equalizer~(view)/filter_numeric(view)/frequency.midi_converter", ",", "equalizer~(view)/equalizer~(view)/filter_numeric(view)/gain", ",", "equalizer~(view)/equalizer~(view)/filter_numeric(view)/model", ",", "equalizer~(view)/equalizer~(view)/filter_numeric(view)/octave_bandwidth", ",", "equalizer~(view)/equalizer~(view)/filter_numeric(view)/type", ",", "equalizer~(view)/equalizer~(view)/model", ",", "equalizer~(view)/equalizer~(view)/ui", ",", "equalizer~(view)/filter.1", ",", "equalizer~(view)/filter.1/frequency.1", ",", "equalizer~(view)/filter.1/gain.1", ",", "equalizer~(view)/filter.1/octave_bandwidth.1", ",", "equalizer~(view)/filter.1/type.1", ",", "equalizer~(view)/model", ",", "equalizer~(view)/ui", ",", "input", ",", "input/audio", ",", "input/audio/gain", ",", "input/audio/mute", ",", "input/audio/out.L", ",", "input/audio/out.R", ",", "input/balance", ",", "input/balance/audio", ",", "input/balance/audio/out.L", ",", "input/balance/audio/out.R", ",", "input/balance/mode", ",", "input/balance/model", ",", "input/balance/position", ",", "input/balance/shape", ",", "input/clicktrain", ",", "input/clicktrain/rate", ",", "input/file", ",", "input/file/direct", ",", "input/file/loop", ",", "input/file/path", ",", "input/file/play", ",", "input/file/time", ",", "input/file/time/absolute", ",", "input/file/time/relative", ",", "input/file/transpose", ",", "input/input", ",", "input/input/audio", ",", "input/input/audio/active", ",", "input/input/channel.L", ",", "input/input/channel.R", ",", "input/input/dspStatus", ",", "input/input/limiter", ",", "input/input/limiter/active", ",", "input/input/limiter/audio", ",", "input/input/limiter/audio/in.L", ",", "input/input/limiter/audio/in.R", ",", "input/input/limiter/audio/out.L", ",", "input/input/limiter/audio/out.R", ",", "input/input/limiter/clear", ",", "input/input/limiter/dcblocker", ",", "input/input/limiter/dcblocker/active", ",", "input/input/limiter/lookahead", ",", "input/input/limiter/mode", ",", "input/input/limiter/model", ",", "input/input/limiter/postamp", ",", "input/input/limiter/preamp", ",", "input/input/limiter/release", ",", "input/input/limiter/threshold", ",", "input/input/model", ",", "input/model", ",", "input/preset", ",", "input/soundfile", ",", "input/soundfile/report", ",", "input/source", ",", "input/testtone", ",", "input/testtone/frequency", ",", "output", ",", "output/audio", ",", "output/audio/active", ",", "output/audio/gain", ",", "output/audio/mute", ",", "output/audio/out.L", ",", "output/audio/out.R", ",", "output/balance", ",", "output/balance/audio", ",", "output/balance/audio/out.L", ",", "output/balance/audio/out.R", ",", "output/balance/mode", ",", "output/balance/model", ",", "output/balance/position", ",", "output/balance/shape", ",", "output/ch.1", ",", "output/ch.2", ",", "output/cpu", ",", "output/dspStatus", ",", "output/limiter", ",", "output/limiter/active", ",", "output/limiter/audio", ",", "output/limiter/audio/in.L", ",", "output/limiter/audio/in.R", ",", "output/limiter/audio/out.L", ",", "output/limiter/audio/out.R", ",", "output/limiter/clear", ",", "output/limiter/dcblocker", ",", "output/limiter/dcblocker/active", ",", "output/limiter/lookahead", ",", "output/limiter/mode", ",", "output/limiter/model", ",", "output/limiter/postamp", ",", "output/limiter/preamp", ",", "output/limiter/release", ",", "output/limiter/threshold", ",", "output/model", ",", "output/preset", ",", "output/record", ",", "output/record/active", ",", "output/record/audio", ",", "output/record/audio/in.L", ",", "output/record/audio/in.R", ",", "output/record/file", ",", "output/record/file/path", ",", "output/record/file/time", ",", "output/record/file/type", ",", "output/record/model", ",", "output/record/samptype", ",", "output/saturation", ",", "output/saturation/active", ",", "output/saturation/audio", ",", "output/saturation/audio/in.L", ",", "output/saturation/audio/in.R", ",", "output/saturation/audio/out.L", ",", "output/saturation/audio/out.R", ",", "output/saturation/depth", ",", "output/saturation/mode", ",", "output/saturation/model", ",", "output/saturation/preamp" ],
									"maxclass" : "umenu",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "int", "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 378.0, 546.25, 233.0, 22.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"color" : [ 0.989256, 0.417462, 0.031845, 1.0 ],
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "" ],
									"patching_rect" : [ 378.0, 484.0, 233.0, 22.0 ],
									"style" : "",
									"text" : "j.namespace @address / @format umenu"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-58",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 107.0, 349.5, 50.0, 22.0 ],
									"style" : "",
									"text" : "explore"
								}

							}
, 							{
								"box" : 								{
									"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"cellmap" : [ [ 0, 0, "degrade.1" ], [ 0, 1, "degrade.1/audio" ], [ 0, 2, "degrade.1/audio/bypass" ], [ 0, 3, "degrade.1/audio/gain" ], [ 0, 4, "degrade.1/audio/in.L" ], [ 0, 5, "degrade.1/audio/in.R" ], [ 0, 6, "degrade.1/audio/mix" ], [ 0, 7, "degrade.1/audio/mute" ], [ 0, 8, "degrade.1/audio/out.L" ], [ 0, 9, "degrade.1/audio/out.R" ], [ 0, 10, "degrade.1/bitdepth" ], [ 0, 11, "degrade.1/model" ], [ 0, 12, "degrade.1/preset" ], [ 0, 13, "degrade.1/samplerate_ratio" ], [ 0, 14, "degrade.2" ], [ 0, 15, "degrade.2/audio" ], [ 0, 16, "degrade.2/audio/bypass" ], [ 0, 17, "degrade.2/audio/gain" ], [ 0, 18, "degrade.2/audio/in.L" ], [ 0, 19, "degrade.2/audio/in.R" ], [ 0, 20, "degrade.2/audio/mix" ], [ 0, 21, "degrade.2/audio/mute" ], [ 0, 22, "degrade.2/audio/out.L" ], [ 0, 23, "degrade.2/audio/out.R" ], [ 0, 24, "degrade.2/bitdepth" ], [ 0, 25, "degrade.2/model" ], [ 0, 26, "degrade.2/preset" ], [ 0, 27, "degrade.2/samplerate_ratio" ], [ 0, 28, "eq" ], [ 0, 29, "eq/audio" ], [ 0, 30, "eq/audio/bypass" ], [ 0, 31, "eq/audio/gain" ], [ 0, 32, "eq/audio/in.L" ], [ 0, 33, "eq/audio/in.R" ], [ 0, 34, "eq/audio/mix" ], [ 0, 35, "eq/audio/mute" ], [ 0, 36, "eq/audio/out.L" ], [ 0, 37, "eq/audio/out.R" ], [ 0, 38, "eq/bands" ], [ 0, 39, "eq/filter.1" ], [ 0, 40, "eq/filter.1/frequency" ], [ 0, 41, "eq/filter.1/gain" ], [ 0, 42, "eq/filter.1/octave_bandwidth" ], [ 0, 43, "eq/filter.1/type" ], [ 0, 44, "eq/filter.2" ], [ 0, 45, "eq/filter.2/frequency" ], [ 0, 46, "eq/filter.2/gain" ], [ 0, 47, "eq/filter.2/octave_bandwidth" ], [ 0, 48, "eq/filter.2/type" ], [ 0, 49, "eq/filter.3" ], [ 0, 50, "eq/filter.3/frequency" ], [ 0, 51, "eq/filter.3/gain" ], [ 0, 52, "eq/filter.3/octave_bandwidth" ], [ 0, 53, "eq/filter.3/type" ], [ 0, 54, "eq/filter.4" ], [ 0, 55, "eq/filter.4/frequency" ], [ 0, 56, "eq/filter.4/gain" ], [ 0, 57, "eq/filter.4/octave_bandwidth" ], [ 0, 58, "eq/filter.4/type" ], [ 0, 59, "eq/filtergraph" ], [ 0, 60, "eq/model" ], [ 0, 61, "eq/preset" ], [ 0, 62, "equalizer~(view)" ], [ 0, 63, "equalizer~(view)/equalizer~(view)" ], [ 0, 64, "equalizer~(view)/equalizer~(view)/filter.1" ], [ 0, 65, "equalizer~(view)/equalizer~(view)/filter.1/frequency.1" ], [ 0, 66, "equalizer~(view)/equalizer~(view)/filter.1/gain.1" ], [ 0, 67, "equalizer~(view)/equalizer~(view)/filter.1/octave_bandwidth.1" ], [ 0, 68, "equalizer~(view)/equalizer~(view)/filter.1/type.1" ], [ 0, 69, "equalizer~(view)/equalizer~(view)/filter_graph(view)" ], [ 0, 70, "equalizer~(view)/equalizer~(view)/filter_graph(view)/frequency" ], [ 0, 71, "equalizer~(view)/equalizer~(view)/filter_graph(view)/gain" ], [ 0, 72, "equalizer~(view)/equalizer~(view)/filter_graph(view)/model" ], [ 0, 73, "equalizer~(view)/equalizer~(view)/filter_graph(view)/octave_bandwidth" ], [ 0, 74, "equalizer~(view)/equalizer~(view)/filter_numeric(view)" ], [ 0, 75, "equalizer~(view)/equalizer~(view)/filter_numeric(view)/frequency" ], [ 0, 76, "equalizer~(view)/equalizer~(view)/filter_numeric(view)/frequency.midi_converter" ], [ 0, 77, "equalizer~(view)/equalizer~(view)/filter_numeric(view)/gain" ], [ 0, 78, "equalizer~(view)/equalizer~(view)/filter_numeric(view)/model" ], [ 0, 79, "equalizer~(view)/equalizer~(view)/filter_numeric(view)/octave_bandwidth" ], [ 0, 80, "equalizer~(view)/equalizer~(view)/filter_numeric(view)/type" ], [ 0, 81, "equalizer~(view)/equalizer~(view)/model" ], [ 0, 82, "equalizer~(view)/equalizer~(view)/ui" ], [ 0, 83, "equalizer~(view)/filter.1" ], [ 0, 84, "equalizer~(view)/filter.1/frequency.1" ], [ 0, 85, "equalizer~(view)/filter.1/gain.1" ], [ 0, 86, "equalizer~(view)/filter.1/octave_bandwidth.1" ], [ 0, 87, "equalizer~(view)/filter.1/type.1" ], [ 0, 88, "equalizer~(view)/model" ], [ 0, 89, "equalizer~(view)/ui" ], [ 0, 90, "input" ], [ 0, 91, "input/audio" ], [ 0, 92, "input/audio/gain" ], [ 0, 93, "input/audio/mute" ], [ 0, 94, "input/audio/out.L" ], [ 0, 95, "input/audio/out.R" ], [ 0, 96, "input/balance" ], [ 0, 97, "input/balance/audio" ], [ 0, 98, "input/balance/audio/out.L" ], [ 0, 99, "input/balance/audio/out.R" ], [ 0, 100, "input/balance/mode" ], [ 0, 101, "input/balance/model" ], [ 0, 102, "input/balance/position" ], [ 0, 103, "input/balance/shape" ], [ 0, 104, "input/clicktrain" ], [ 0, 105, "input/clicktrain/rate" ], [ 0, 106, "input/file" ], [ 0, 107, "input/file/direct" ], [ 0, 108, "input/file/loop" ], [ 0, 109, "input/file/path" ], [ 0, 110, "input/file/play" ], [ 0, 111, "input/file/time" ], [ 0, 112, "input/file/time/absolute" ], [ 0, 113, "input/file/time/relative" ], [ 0, 114, "input/file/transpose" ], [ 0, 115, "input/input" ], [ 0, 116, "input/input/audio" ], [ 0, 117, "input/input/audio/active" ], [ 0, 118, "input/input/channel.L" ], [ 0, 119, "input/input/channel.R" ], [ 0, 120, "input/input/dspStatus" ], [ 0, 121, "input/input/limiter" ], [ 0, 122, "input/input/limiter/active" ], [ 0, 123, "input/input/limiter/audio" ], [ 0, 124, "input/input/limiter/audio/in.L" ], [ 0, 125, "input/input/limiter/audio/in.R" ], [ 0, 126, "input/input/limiter/audio/out.L" ], [ 0, 127, "input/input/limiter/audio/out.R" ], [ 0, 128, "input/input/limiter/clear" ], [ 0, 129, "input/input/limiter/dcblocker" ], [ 0, 130, "input/input/limiter/dcblocker/active" ], [ 0, 131, "input/input/limiter/lookahead" ], [ 0, 132, "input/input/limiter/mode" ], [ 0, 133, "input/input/limiter/model" ], [ 0, 134, "input/input/limiter/postamp" ], [ 0, 135, "input/input/limiter/preamp" ], [ 0, 136, "input/input/limiter/release" ], [ 0, 137, "input/input/limiter/threshold" ], [ 0, 138, "input/input/model" ], [ 0, 139, "input/model" ], [ 0, 140, "input/preset" ], [ 0, 141, "input/soundfile" ], [ 0, 142, "input/soundfile/report" ], [ 0, 143, "input/source" ], [ 0, 144, "input/testtone" ], [ 0, 145, "input/testtone/frequency" ], [ 0, 146, "output" ], [ 0, 147, "output/audio" ], [ 0, 148, "output/audio/active" ], [ 0, 149, "output/audio/gain" ], [ 0, 150, "output/audio/mute" ], [ 0, 151, "output/audio/out.L" ], [ 0, 152, "output/audio/out.R" ], [ 0, 153, "output/balance" ], [ 0, 154, "output/balance/audio" ], [ 0, 155, "output/balance/audio/out.L" ], [ 0, 156, "output/balance/audio/out.R" ], [ 0, 157, "output/balance/mode" ], [ 0, 158, "output/balance/model" ], [ 0, 159, "output/balance/position" ], [ 0, 160, "output/balance/shape" ], [ 0, 161, "output/ch.1" ], [ 0, 162, "output/ch.2" ], [ 0, 163, "output/cpu" ], [ 0, 164, "output/dspStatus" ], [ 0, 165, "output/limiter" ], [ 0, 166, "output/limiter/active" ], [ 0, 167, "output/limiter/audio" ], [ 0, 168, "output/limiter/audio/in.L" ], [ 0, 169, "output/limiter/audio/in.R" ], [ 0, 170, "output/limiter/audio/out.L" ], [ 0, 171, "output/limiter/audio/out.R" ], [ 0, 172, "output/limiter/clear" ], [ 0, 173, "output/limiter/dcblocker" ], [ 0, 174, "output/limiter/dcblocker/active" ], [ 0, 175, "output/limiter/lookahead" ], [ 0, 176, "output/limiter/mode" ], [ 0, 177, "output/limiter/model" ], [ 0, 178, "output/limiter/postamp" ], [ 0, 179, "output/limiter/preamp" ], [ 0, 180, "output/limiter/release" ], [ 0, 181, "output/limiter/threshold" ], [ 0, 182, "output/model" ], [ 0, 183, "output/preset" ], [ 0, 184, "output/record" ], [ 0, 185, "output/record/active" ], [ 0, 186, "output/record/audio" ], [ 0, 187, "output/record/audio/in.L" ], [ 0, 188, "output/record/audio/in.R" ], [ 0, 189, "output/record/file" ], [ 0, 190, "output/record/file/path" ], [ 0, 191, "output/record/file/time" ], [ 0, 192, "output/record/file/type" ], [ 0, 193, "output/record/model" ], [ 0, 194, "output/record/samptype" ], [ 0, 195, "output/saturation" ], [ 0, 196, "output/saturation/active" ], [ 0, 197, "output/saturation/audio" ], [ 0, 198, "output/saturation/audio/in.L" ], [ 0, 199, "output/saturation/audio/in.R" ], [ 0, 200, "output/saturation/audio/out.L" ], [ 0, 201, "output/saturation/audio/out.R" ], [ 0, 202, "output/saturation/depth" ], [ 0, 203, "output/saturation/mode" ], [ 0, 204, "output/saturation/model" ], [ 0, 205, "output/saturation/preamp" ] ],
									"cols" : 2,
									"colwidth" : 200,
									"fgcolor" : [ 0.619608, 0.0, 0.360784, 1.0 ],
									"fontface" : 0,
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"gridlinecolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"hcellcolor" : [ 0.819608, 0.819608, 0.898039, 0.0 ],
									"hscroll" : 0,
									"id" : "obj-16",
									"maxclass" : "jit.cellblock",
									"numinlets" : 2,
									"numoutlets" : 4,
									"outlettype" : [ "list", "", "", "" ],
									"patching_rect" : [ 107.0, 546.25, 214.5, 252.75 ],
									"rows" : 206,
									"savemode" : 1,
									"stcolor" : [ 0.8, 0.8, 0.8, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"color" : [ 0.989256, 0.417462, 0.031845, 1.0 ],
									"id" : "obj-3",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "" ],
									"patching_rect" : [ 107.0, 484.0, 254.0, 22.0 ],
									"style" : "",
									"text" : "j.namespace @address / @format jit.cellblock"
								}

							}
, 							{
								"box" : 								{
									"border" : 0,
									"filename" : "helpdetails.js",
									"id" : "obj-2",
									"ignoreclick" : 1,
									"jsarguments" : [ "j.namespace" ],
									"maxclass" : "jsui",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 10.0, 10.0, 624.0, 130.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-9", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-10", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-12", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-11", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-15", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-13", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-14", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-15", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-8", 1 ],
									"disabled" : 0,
									"hidden" : 1,
									"midpoints" : [ 730.5, 614.0, 852.0, 614.0, 852.0, 571.0, 851.5, 571.0 ],
									"source" : [ "obj-17", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-16", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-3", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-4", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 1 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-5", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-10", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 116.5, 454.25, 637.5, 454.25 ],
									"source" : [ "obj-58", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-11", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 116.5, 454.25, 921.5, 454.25 ],
									"source" : [ "obj-58", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-13", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 116.5, 454.25, 1162.5, 454.25 ],
									"source" : [ "obj-58", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 116.5, 454.25, 116.5, 454.25 ],
									"source" : [ "obj-58", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 116.5, 454.25, 387.5, 454.25 ],
									"source" : [ "obj-58", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-17", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-9", 1 ]
								}

							}
 ],
						"styles" : [ 							{
								"name" : "jpatcher001",
								"parentstyle" : "",
								"multi" : 0
							}
 ]
					}
,
					"patching_rect" : [ 257.0, 150.0, 106.0, 22.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"style" : "jpatcher001",
						"tags" : ""
					}
,
					"style" : "",
					"text" : "p \"Output Format\""
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-7",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 37.195312, 247.0, 92.0, 22.0 ],
					"style" : "",
					"text" : "loadmess open"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-5",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 37.195312, 356.0, 53.0, 22.0 ],
					"style" : "",
					"text" : "pcontrol"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-76",
					"maxclass" : "newobj",
					"numinlets" : 1,
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
						"rect" : [ 1920.0, 45.0, 275.0, 325.0 ],
						"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
						"editing_bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
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
						"toolbars_unpinned_last_save" : 15,
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
						"visible" : 1,
						"boxes" : [ 							{
								"box" : 								{
									"annotation" : "none",
									"args" : [ "/eq" ],
									"bgmode" : 0,
									"border" : 0,
									"clickthrough" : 0,
									"enablehscroll" : 0,
									"enablevscroll" : 0,
									"id" : "obj-8",
									"lockeddragscroll" : 0,
									"maxclass" : "bpatcher",
									"name" : "equalizer~.view.small.maxpat",
									"numinlets" : 1,
									"numoutlets" : 1,
									"offset" : [ 0.0, 0.0 ],
									"outlettype" : [ "" ],
									"patching_rect" : [ 14.5, 140.993866, 150.0, 105.0 ],
									"presentation_rect" : [ 0.0, 0.0, 150.0, 105.0 ],
									"viewvisibility" : 1
								}

							}
, 							{
								"box" : 								{
									"annotation" : "A generic audio output model with built in master saturation, limiter, and recording abilities.",
									"fontface" : 0,
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-5",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 14.5, 277.993866, 185.0, 22.0 ],
									"style" : "",
									"text" : "output~.model output @priority 5"
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
									"numoutlets" : 3,
									"outlettype" : [ "signal", "signal", "" ],
									"patching_rect" : [ 14.5, 60.0, 170.0, 22.0 ],
									"style" : "",
									"text" : "input~.model input @priority 1"
								}

							}
, 							{
								"box" : 								{
									"annotation" : "Emulate the use of lower sample-rates and bit-resolution.",
									"fontface" : 0,
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 3,
									"outlettype" : [ "signal", "signal", "" ],
									"patching_rect" : [ 14.5, 87.248459, 216.0, 22.0 ],
									"style" : "",
									"text" : "degrade~.model degrade.1 @priority 2"
								}

							}
, 							{
								"box" : 								{
									"annotation" : "none",
									"fontface" : 0,
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 3,
									"outlettype" : [ "signal", "signal", "" ],
									"patching_rect" : [ 14.5, 250.745392, 180.0, 22.0 ],
									"style" : "",
									"text" : "equalizer~.model eq @priority 4"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-29",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 20.0, -149.0, 24.0, 22.0 ],
									"style" : "",
									"text" : "t b"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-28",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 14.5, -175.0, 42.0, 22.0 ],
									"style" : "",
									"text" : "active"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-27",
									"maxclass" : "newobj",
									"numinlets" : 3,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 14.5, -36.20929, 178.0, 22.0 ],
									"style" : "",
									"text" : "pong @mode fold @range 0. 1."
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-26",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 14.5, -121.0, 67.0, 22.0 ],
									"style" : "",
									"text" : "0, 10 8000"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-24",
									"maxclass" : "newobj",
									"numinlets" : 3,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 14.5, -90.069763, 43.0, 22.0 ],
									"style" : "",
									"text" : "line 0."
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-23",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 14.5, -63.139526, 35.0, 22.0 ],
									"style" : "",
									"text" : "% 2."
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-18",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 14.5, -9.279083, 120.0, 22.0 ],
									"style" : "",
									"text" : "bgcolor 1. 1. 0.75 $1"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-12",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 544.0, 71.0, 60.0, 22.0 ],
									"style" : "",
									"text" : "loadbang"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-11",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 544.0, 110.0, 181.0, 22.0 ],
									"style" : "",
									"text" : "window flags float, window exec"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-9",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 544.0, 150.0, 69.0, 22.0 ],
									"save" : [ "#N", "thispatcher", ";", "#Q", "end", ";" ],
									"style" : "",
									"text" : "thispatcher"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"hidden" : 1,
									"id" : "obj-6",
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 31.0, 645.0, 25.0, 25.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"fontface" : 1,
									"fontname" : "Lato Regular",
									"fontsize" : 14.0,
									"id" : "obj-3",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 14.5, 22.0, 175.0, 23.0 ],
									"style" : "",
									"text" : "Two demo models & views"
								}

							}
, 							{
								"box" : 								{
									"annotation" : "Emulate the use of lower sample-rates and bit-resolution.",
									"fontface" : 0,
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-13",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 3,
									"outlettype" : [ "signal", "signal", "" ],
									"patching_rect" : [ 14.5, 114.496933, 216.0, 22.0 ],
									"style" : "",
									"text" : "degrade~.model degrade.2 @priority 3"
								}

							}
, 							{
								"box" : 								{
									"angle" : 270.0,
									"bgcolor" : [ 1.0, 1.0, 0.75, 0.0 ],
									"id" : "obj-2",
									"maxclass" : "panel",
									"mode" : 0,
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 14.5, 22.0, 175.0, 23.0 ],
									"proportion" : 0.39,
									"rounded" : 0,
									"style" : ""
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-9", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-11", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-11", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-12", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-2", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-18", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-27", 0 ],
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
									"source" : [ "obj-24", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-24", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-26", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-18", 0 ],
									"disabled" : 0,
									"hidden" : 1,
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
, 							{
								"patchline" : 								{
									"destination" : [ "obj-26", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-29", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 37.195312, 395.0, 102.0, 23.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"style" : "",
						"tags" : ""
					}
,
					"style" : "",
					"text" : "p someModules"
				}

			}
, 			{
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
							"revision" : 5,
							"architecture" : "x86",
							"modernui" : 1
						}
,
						"rect" : [ 379.0, 96.0, 1495.0, 894.0 ],
						"bgcolor" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
						"editing_bgcolor" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
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
						"style" : "jpatcher001",
						"subpatcher_template" : "greyish",
						"showontab" : 1,
						"boxes" : [ 							{
								"box" : 								{
									"id" : "obj-7",
									"maxclass" : "number",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 379.5, 545.0, 50.0, 22.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"cellmap" : [ [ 0, 0, "1" ], [ 0, 1, "2" ] ],
									"cols" : 2,
									"colwidth" : 200,
									"fgcolor" : [ 0.619608, 0.0, 0.360784, 1.0 ],
									"fontface" : 0,
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"gridlinecolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"hcellcolor" : [ 0.819608, 0.819608, 0.898039, 0.0 ],
									"hscroll" : 0,
									"id" : "obj-16",
									"maxclass" : "jit.cellblock",
									"numinlets" : 2,
									"numoutlets" : 4,
									"outlettype" : [ "list", "", "", "" ],
									"patching_rect" : [ 236.0, 574.0, 214.5, 252.75 ],
									"rows" : 2,
									"savemode" : 1,
									"stcolor" : [ 0.8, 0.8, 0.8, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"color" : [ 0.989256, 0.417462, 0.031845, 1.0 ],
									"id" : "obj-5",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "" ],
									"patching_rect" : [ 236.0, 518.0, 306.0, 22.0 ],
									"style" : "",
									"text" : "j.namespace myFilters @address / @format jit.cellblock"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Regular",
									"fontsize" : 12.0,
									"id" : "obj-4",
									"linecount" : 3,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 10.0, 70.0, 325.0, 50.0 ],
									"style" : "",
									"text" : "While the predefined filters can help in a number of cases, j.namespace allows to set some user-defined filters with a simple yet powerful syntaxe",
									"textcolor" : [ 0.6, 0.6, 0.6, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontface" : 1,
									"fontname" : "Lato Regular",
									"fontsize" : 14.0,
									"id" : "obj-78",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 1089.0, 86.5, 116.0, 23.0 ],
									"style" : "",
									"text" : "Combining filters",
									"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"angle" : 270.0,
									"bgcolor" : [ 0.113725, 0.607843, 0.607843, 1.0 ],
									"id" : "obj-79",
									"maxclass" : "panel",
									"mode" : 0,
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 1089.0, 86.5, 116.0, 23.0 ],
									"proportion" : 0.39,
									"rounded" : 0,
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 638.0, 680.0, 72.0, 22.0 ],
									"style" : "",
									"text" : "loadmess 0"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-45",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patcher" : 									{
										"fileversion" : 1,
										"appversion" : 										{
											"major" : 7,
											"minor" : 0,
											"revision" : 5,
											"architecture" : "x86",
											"modernui" : 1
										}
,
										"rect" : [ 0.0, 0.0, 640.0, 480.0 ],
										"bgcolor" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
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
										"style" : "jpatcher001",
										"subpatcher_template" : "greyish",
										"boxes" : [ 											{
												"box" : 												{
													"id" : "obj-33",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 187.0, 396.0, 74.0, 22.0 ],
													"style" : "",
													"text" : "prepend set"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-32",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 195.0, 353.0, 59.0, 22.0 ],
													"style" : "",
													"text" : "tosymbol"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-31",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 252.0, 274.0, 103.0, 22.0 ],
													"style" : "",
													"text" : "(a typeless node)"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-29",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 212.0, 243.0, 85.0, 22.0 ],
													"style" : "",
													"text" : "(any j.remote)"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-26",
													"linecount" : 2,
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 180.0, 183.0, 167.0, 35.0 ],
													"style" : "",
													"text" : "\"(a j.parameter, j.message or j.return)\""
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-24",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 50.0, 189.5, 115.0, 22.0 ],
													"style" : "",
													"text" : "(a j.model or j.view)"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-18",
													"maxclass" : "newobj",
													"numinlets" : 5,
													"numoutlets" : 5,
													"outlettype" : [ "", "", "", "", "" ],
													"patching_rect" : [ 165.0, 100.0, 78.0, 22.0 ],
													"style" : "",
													"text" : "route 0 1 2 3"
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-37",
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "int" ],
													"patching_rect" : [ 165.0, 40.0, 30.0, 30.0 ],
													"style" : ""
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-42",
													"maxclass" : "outlet",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 187.0, 478.0, 30.0, 30.0 ],
													"style" : ""
												}

											}
 ],
										"lines" : [ 											{
												"patchline" : 												{
													"destination" : [ "obj-24", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-18", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-26", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-18", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-29", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-18", 2 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-31", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-18", 3 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-32", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-24", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-32", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-26", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-32", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-29", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-32", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-31", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-33", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-32", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-42", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-33", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-18", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-37", 0 ]
												}

											}
 ],
										"styles" : [ 											{
												"name" : "jpatcher001",
												"parentstyle" : "",
												"multi" : 0
											}
 ]
									}
,
									"patching_rect" : [ 742.0, 731.0, 40.0, 22.0 ],
									"saved_object_attributes" : 									{
										"description" : "",
										"digest" : "",
										"globalpatchername" : "",
										"style" : "jpatcher001",
										"tags" : ""
									}
,
									"style" : "",
									"text" : "p info"
								}

							}
, 							{
								"box" : 								{
									"fontface" : 2,
									"id" : "obj-36",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 742.0, 763.0, 217.0, 20.0 ],
									"style" : "",
									"text" : "(a j.model or j.view)"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-11",
									"items" : [ "Container", ",", "Data", ",", "Viewer", ",", "none" ],
									"maxclass" : "umenu",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "int", "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 638.0, 763.0, 100.0, 22.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"border" : 0,
									"filename" : "helpdetails.js",
									"id" : "obj-2",
									"ignoreclick" : 1,
									"jsarguments" : [ "j.namespace" ],
									"maxclass" : "jsui",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 10.0, 10.0, 274.0, 58.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-11", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-45", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-11", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-36", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-45", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-16", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-5", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-5", 1 ]
								}

							}
 ],
						"styles" : [ 							{
								"name" : "jpatcher001",
								"parentstyle" : "",
								"multi" : 0
							}
 ]
					}
,
					"patching_rect" : [ 377.0, 150.0, 102.0, 22.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"style" : "jpatcher001",
						"tags" : ""
					}
,
					"style" : "",
					"text" : "p \"Custom filters\""
				}

			}
, 			{
				"box" : 				{
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
						"rect" : [ 0.0, 26.0, 1495.0, 894.0 ],
						"bgcolor" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
						"editing_bgcolor" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
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
						"style" : "jpatcher001",
						"subpatcher_template" : "greyish",
						"showontab" : 1,
						"boxes" : [  ],
						"lines" : [  ],
						"styles" : [ 							{
								"name" : "jpatcher001",
								"parentstyle" : "",
								"multi" : 0
							}
 ]
					}
,
					"patching_rect" : [ 508.0, 148.0, 27.0, 22.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"style" : "jpatcher001",
						"tags" : ""
					}
,
					"style" : "",
					"text" : "p ?"
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
							"revision" : 5,
							"architecture" : "x86",
							"modernui" : 1
						}
,
						"rect" : [ 0.0, 26.0, 1495.0, 894.0 ],
						"bgcolor" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
						"editing_bgcolor" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
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
						"style" : "jpatcher001",
						"subpatcher_template" : "greyish",
						"showontab" : 1,
						"boxes" : [ 							{
								"box" : 								{
									"bubble" : 1,
									"bubbleside" : 3,
									"bubbletextmargin" : 10,
									"fontname" : "Lato Regular",
									"fontsize" : 12.0,
									"id" : "obj-1",
									"linecount" : 4,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 964.0, 367.0, 141.0, 78.0 ],
									"presentation_rect" : [ 964.0, 370.0, 0.0, 0.0 ],
									"style" : "",
									"text" : "Choose items to filter based on their relationship to exploration root",
									"textcolor" : [ 0.3, 0.3, 0.3, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Regular",
									"fontsize" : 12.0,
									"id" : "obj-26",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 1193.0, 526.5, 119.0, 35.0 ],
									"style" : "",
									"text" : "Instances of the exploration root",
									"textcolor" : [ 0.6, 0.6, 0.6, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Regular",
									"fontsize" : 12.0,
									"id" : "obj-25",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 1189.0, 433.05957, 150.0, 21.0 ],
									"style" : "",
									"text" : "Exploration root attributes",
									"textcolor" : [ 0.6, 0.6, 0.6, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Regular",
									"fontsize" : 12.0,
									"id" : "obj-24",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 1189.0, 378.039734, 213.0, 21.0 ],
									"style" : "",
									"text" : "All direct nodes under exploration root",
									"textcolor" : [ 0.6, 0.6, 0.6, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Regular",
									"fontsize" : 12.0,
									"id" : "obj-23",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 1189.0, 322.55957, 180.0, 21.0 ],
									"style" : "",
									"text" : "All nodes under exlporation root",
									"textcolor" : [ 0.6, 0.6, 0.6, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-22",
									"maxclass" : "live.line",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 1151.0, 294.0, 5.0, 221.0 ]
								}

							}
, 							{
								"box" : 								{
									"bgcolor" : [ 0.93, 0.93, 0.93, 1.0 ],
									"bgoncolor" : [ 0.93, 0.93, 0.93, 1.0 ],
									"fontface" : 1,
									"fontname" : "Helvetica Neue Bold",
									"id" : "obj-14",
									"ignoreclick" : 1,
									"legacytextcolor" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 1114.0, 387.0, 24.0, 24.0 ],
									"rounded" : 180.0,
									"style" : "",
									"text" : "2",
									"textcolor" : [ 0.619608, 0.0, 0.360784, 0.698039 ],
									"textoncolor" : [ 1.0, 1.0, 1.0, 1.0 ],
									"textovercolor" : [ 0.619608, 0.0, 0.360784, 1.0 ],
									"usebgoncolor" : 1,
									"usetextovercolor" : 1
								}

							}
, 							{
								"box" : 								{
									"bgcolor" : [ 0.93, 0.93, 0.93, 1.0 ],
									"bgoncolor" : [ 0.93, 0.93, 0.93, 1.0 ],
									"fontface" : 1,
									"fontname" : "Helvetica Neue Bold",
									"id" : "obj-15",
									"ignoreclick" : 1,
									"legacytextcolor" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 1132.0, 243.0, 24.0, 24.0 ],
									"rounded" : 180.0,
									"style" : "",
									"text" : "1",
									"textcolor" : [ 0.619608, 0.0, 0.360784, 0.698039 ],
									"textoncolor" : [ 1.0, 1.0, 1.0, 1.0 ],
									"textovercolor" : [ 0.619608, 0.0, 0.360784, 1.0 ],
									"usebgoncolor" : 1,
									"usetextovercolor" : 1
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-13",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 1166.0, 409.0, 143.0, 22.0 ],
									"style" : "",
									"text" : "output attributes, explore"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-12",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 1166.0, 294.0, 161.0, 22.0 ],
									"style" : "",
									"text" : "output descendants, explore"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Regular",
									"fontsize" : 12.0,
									"id" : "obj-11",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 364.0, 589.0, 136.0, 35.0 ],
									"style" : "",
									"text" : "Number of matching addresses",
									"textcolor" : [ 0.6, 0.6, 0.6, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-8",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 1166.0, 243.0, 133.0, 22.0 ],
									"style" : "",
									"text" : "filter/remove, address /"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-7",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 1166.0, 354.019867, 135.0, 22.0 ],
									"style" : "",
									"text" : "output children, explore"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Regular",
									"fontsize" : 12.0,
									"id" : "obj-6",
									"linecount" : 3,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 1299.0, 457.05957, 154.0, 50.0 ],
									"style" : "",
									"text" : "Brother is not available if the root address is the root of the whole namespace",
									"textcolor" : [ 0.619608, 0.0, 0.360784, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-5",
									"linecount" : 4,
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 1166.0, 457.05957, 126.0, 62.0 ],
									"style" : "",
									"text" : "output brothers, filter/list model, address /degrade.1, explore"
								}

							}
, 							{
								"box" : 								{
									"fontface" : 1,
									"fontname" : "Lato Regular",
									"fontsize" : 14.0,
									"id" : "obj-70",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 1166.0, 157.5, 86.0, 23.0 ],
									"style" : "",
									"text" : "Relationship",
									"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"angle" : 270.0,
									"bgcolor" : [ 0.113725, 0.607843, 0.607843, 1.0 ],
									"id" : "obj-71",
									"maxclass" : "panel",
									"mode" : 0,
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 1166.0, 157.5, 86.0, 23.0 ],
									"proportion" : 0.39,
									"rounded" : 0,
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Regular",
									"fontsize" : 12.0,
									"id" : "obj-69",
									"linecount" : 5,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 60.0, 584.0, 136.0, 78.0 ],
									"style" : "",
									"text" : "NB: Sending a node address to j.namespace will set the address attribute and trigger exploration",
									"textcolor" : [ 0.6, 0.6, 0.6, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontface" : 1,
									"fontname" : "Lato Regular",
									"fontsize" : 14.0,
									"id" : "obj-66",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 866.0, 157.5, 100.0, 23.0 ],
									"style" : "",
									"text" : "Sorting results",
									"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"angle" : 270.0,
									"bgcolor" : [ 0.113725, 0.607843, 0.607843, 1.0 ],
									"id" : "obj-67",
									"maxclass" : "panel",
									"mode" : 0,
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 866.0, 157.5, 100.0, 23.0 ],
									"proportion" : 0.39,
									"rounded" : 0,
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"bubbleside" : 3,
									"bubbletextmargin" : 10,
									"fontname" : "Lato Regular",
									"fontsize" : 12.0,
									"id" : "obj-64",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 776.0, 280.5, 74.0, 49.0 ],
									"style" : "",
									"text" : "Sort results",
									"textcolor" : [ 0.3, 0.3, 0.3, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-62",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 866.0, 306.0, 115.0, 22.0 ],
									"style" : "",
									"text" : "sort priority, explore"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-61",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 866.0, 282.0, 135.0, 22.0 ],
									"style" : "",
									"text" : "sort alphabetic, explore"
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"bubbleside" : 3,
									"bubbletextmargin" : 10,
									"fontname" : "Lato Regular",
									"fontsize" : 12.0,
									"id" : "obj-59",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 512.0, 373.5, 93.0, 49.0 ],
									"style" : "",
									"text" : "Explore all sub-nodes",
									"textcolor" : [ 0.3, 0.3, 0.3, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"bubbleside" : 3,
									"bubbletextmargin" : 10,
									"fontname" : "Lato Regular",
									"fontsize" : 12.0,
									"id" : "obj-57",
									"linecount" : 3,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 462.0, 273.0, 141.0, 64.0 ],
									"style" : "",
									"text" : "How deep in the namespace to explore",
									"textcolor" : [ 0.3, 0.3, 0.3, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"bgcolor" : [ 0.93, 0.93, 0.93, 1.0 ],
									"bgoncolor" : [ 0.93, 0.93, 0.93, 1.0 ],
									"fontface" : 1,
									"fontname" : "Helvetica Neue Bold",
									"id" : "obj-55",
									"ignoreclick" : 1,
									"legacytextcolor" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 197.0, 496.5, 24.0, 24.0 ],
									"rounded" : 180.0,
									"style" : "",
									"text" : "3",
									"textcolor" : [ 0.619608, 0.0, 0.360784, 0.698039 ],
									"textoncolor" : [ 1.0, 1.0, 1.0, 1.0 ],
									"textovercolor" : [ 0.619608, 0.0, 0.360784, 1.0 ],
									"usebgoncolor" : 1,
									"usetextovercolor" : 1
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"bubbleside" : 3,
									"bubbletextmargin" : 10,
									"fontname" : "Lato Regular",
									"fontsize" : 12.0,
									"id" : "obj-56",
									"linecount" : 4,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 60.0, 469.5, 135.0, 78.0 ],
									"style" : "",
									"text" : "Explore the namespace from the root using the above filter",
									"textcolor" : [ 0.3, 0.3, 0.3, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"bgcolor" : [ 0.93, 0.93, 0.93, 1.0 ],
									"bgoncolor" : [ 0.93, 0.93, 0.93, 1.0 ],
									"fontface" : 1,
									"fontname" : "Helvetica Neue Bold",
									"id" : "obj-53",
									"ignoreclick" : 1,
									"legacytextcolor" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 197.0, 329.0, 24.0, 24.0 ],
									"rounded" : 180.0,
									"style" : "",
									"text" : "2",
									"textcolor" : [ 0.619608, 0.0, 0.360784, 0.698039 ],
									"textoncolor" : [ 1.0, 1.0, 1.0, 1.0 ],
									"textovercolor" : [ 0.619608, 0.0, 0.360784, 1.0 ],
									"usebgoncolor" : 1,
									"usetextovercolor" : 1
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"bubbleside" : 3,
									"bubbletextmargin" : 10,
									"fontname" : "Lato Regular",
									"fontsize" : 12.0,
									"id" : "obj-54",
									"linecount" : 3,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 49.0, 309.0, 141.0, 64.0 ],
									"style" : "",
									"text" : "Using filters provided with j.namespace",
									"textcolor" : [ 0.3, 0.3, 0.3, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"bgcolor" : [ 0.93, 0.93, 0.93, 1.0 ],
									"bgoncolor" : [ 0.93, 0.93, 0.93, 1.0 ],
									"fontface" : 1,
									"fontname" : "Helvetica Neue Bold",
									"id" : "obj-52",
									"ignoreclick" : 1,
									"legacytextcolor" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 197.0, 243.0, 24.0, 24.0 ],
									"rounded" : 180.0,
									"style" : "",
									"text" : "1",
									"textcolor" : [ 0.619608, 0.0, 0.360784, 0.698039 ],
									"textoncolor" : [ 1.0, 1.0, 1.0, 1.0 ],
									"textovercolor" : [ 0.619608, 0.0, 0.360784, 1.0 ],
									"usebgoncolor" : 1,
									"usetextovercolor" : 1
								}

							}
, 							{
								"box" : 								{
									"bubble" : 1,
									"bubbleside" : 3,
									"bubbletextmargin" : 10,
									"fontname" : "Lato Regular",
									"fontsize" : 12.0,
									"id" : "obj-49",
									"linecount" : 3,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 49.0, 223.0, 141.0, 64.0 ],
									"style" : "",
									"text" : "Set the root in the namespace to start exploration from",
									"textcolor" : [ 0.3, 0.3, 0.3, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontface" : 1,
									"fontname" : "Lato Regular",
									"fontsize" : 14.0,
									"id" : "obj-46",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 612.0, 157.5, 121.0, 23.0 ],
									"style" : "",
									"text" : "Exploration depth",
									"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"angle" : 270.0,
									"bgcolor" : [ 0.113725, 0.607843, 0.607843, 1.0 ],
									"id" : "obj-47",
									"maxclass" : "panel",
									"mode" : 0,
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 612.0, 157.5, 121.0, 23.0 ],
									"proportion" : 0.39,
									"rounded" : 0,
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"fontface" : 1,
									"fontname" : "Lato Regular",
									"fontsize" : 14.0,
									"id" : "obj-78",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 227.0, 157.5, 127.0, 23.0 ],
									"style" : "",
									"text" : "Node type filtering",
									"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"angle" : 270.0,
									"bgcolor" : [ 0.113725, 0.607843, 0.607843, 1.0 ],
									"id" : "obj-79",
									"maxclass" : "panel",
									"mode" : 0,
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 227.0, 157.5, 127.0, 23.0 ],
									"proportion" : 0.39,
									"rounded" : 0,
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-9",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 227.0, 243.0, 60.0, 22.0 ],
									"style" : "",
									"text" : "address /"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-58",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 227.0, 497.5, 50.0, 22.0 ],
									"style" : "",
									"text" : "explore"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-44",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 227.0, 457.05957, 92.0, 22.0 ],
									"style" : "",
									"text" : "filter/list remote"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-43",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 227.0, 433.05957, 79.0, 22.0 ],
									"style" : "",
									"text" : "filter/list view"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-41",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 227.0, 402.05957, 86.0, 22.0 ],
									"style" : "",
									"text" : "filter/list return"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-40",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 227.0, 378.039734, 109.0, 22.0 ],
									"style" : "",
									"text" : "filter/list parameter"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-39",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 227.0, 330.0, 86.0, 22.0 ],
									"style" : "",
									"text" : "filter/list model"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-38",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 227.0, 354.019867, 103.0, 22.0 ],
									"style" : "",
									"text" : "filter/list message"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-34",
									"maxclass" : "button",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 246.0, 589.0, 24.0, 24.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-30",
									"maxclass" : "number",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 312.0, 589.0, 50.0, 22.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-28",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 612.0, 306.0, 97.0, 22.0 ],
									"style" : "",
									"text" : "depth 2, explore"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-20",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 612.0, 387.0, 97.0, 22.0 ],
									"style" : "",
									"text" : "depth 0, explore"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-19",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 612.0, 282.0, 97.0, 22.0 ],
									"style" : "",
									"text" : "depth 1, explore"
								}

							}
, 							{
								"box" : 								{
									"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"cellmap" : [ [ 0, 0, "1" ], [ 0, 1, "2" ] ],
									"cols" : 2,
									"colwidth" : 200,
									"fgcolor" : [ 0.619608, 0.0, 0.360784, 1.0 ],
									"fontface" : 0,
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"gridlinecolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"hcellcolor" : [ 0.819608, 0.819608, 0.898039, 0.0 ],
									"hscroll" : 0,
									"id" : "obj-16",
									"maxclass" : "jit.cellblock",
									"numinlets" : 2,
									"numoutlets" : 4,
									"outlettype" : [ "list", "", "", "" ],
									"patching_rect" : [ 227.0, 626.0, 214.5, 252.75 ],
									"rows" : 2,
									"savemode" : 1,
									"stcolor" : [ 0.8, 0.8, 0.8, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"color" : [ 0.989256, 0.417462, 0.031845, 1.0 ],
									"id" : "obj-3",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "" ],
									"patching_rect" : [ 227.0, 558.0, 189.0, 22.0 ],
									"style" : "",
									"text" : "j.namespace @format jit.cellblock"
								}

							}
, 							{
								"box" : 								{
									"border" : 0,
									"filename" : "helpdetails.js",
									"id" : "obj-2",
									"ignoreclick" : 1,
									"jsarguments" : [ "j.namespace" ],
									"maxclass" : "jsui",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 10.0, 10.0, 586.0, 129.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"midpoints" : [ 1175.5, 436.5, 236.5, 436.5 ],
									"source" : [ "obj-12", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"midpoints" : [ 1175.5, 483.0, 236.5, 483.0 ],
									"source" : [ "obj-13", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 621.5, 543.0, 236.5, 543.0 ],
									"source" : [ "obj-19", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"midpoints" : [ 621.5, 467.0, 236.5, 467.0 ],
									"source" : [ "obj-20", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"midpoints" : [ 621.5, 467.0, 236.5, 467.0 ],
									"source" : [ "obj-28", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-16", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-3", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-30", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-3", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-34", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-3", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-38", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-39", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-40", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-41", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-43", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-44", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"midpoints" : [ 1175.5, 538.029785, 236.5, 538.029785 ],
									"source" : [ "obj-5", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-58", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 875.5, 543.5, 236.5, 543.5 ],
									"source" : [ "obj-61", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"source" : [ "obj-62", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"midpoints" : [ 1175.5, 454.5, 236.5, 454.5 ],
									"source" : [ "obj-7", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 1175.5, 543.0, 236.5, 543.0 ],
									"source" : [ "obj-8", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-9", 0 ]
								}

							}
 ],
						"styles" : [ 							{
								"name" : "jpatcher001",
								"parentstyle" : "",
								"multi" : 0
							}
 ]
					}
,
					"patching_rect" : [ 176.0, 150.0, 50.0, 22.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"style" : "jpatcher001",
						"tags" : ""
					}
,
					"style" : "",
					"text" : "p Basic"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-76", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-5", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-7", 0 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-76::obj-8::obj-5::obj-46" : [ "live.text[1]", "live.text", 0 ],
			"obj-76::obj-8::obj-5::obj-27" : [ "live.text[2]", "live.text[2]", 0 ],
			"obj-76::obj-8::obj-5::obj-19" : [ "live.numbox", "live.numbox", 0 ],
			"obj-76::obj-8::obj-5::obj-17" : [ "live.numbox[5]", "live.numbox", 0 ],
			"obj-76::obj-8::obj-5::obj-7" : [ "live.numbox[2]", "live.numbox", 0 ],
			"obj-76::obj-8::obj-5::obj-6" : [ "live.numbox[4]", "live.numbox[4]", 0 ],
			"obj-76::obj-8::obj-5::obj-9" : [ "live.menu", "live.menu", 0 ],
			"obj-76::obj-8::obj-5::obj-45" : [ "live.text", "live.text", 0 ]
		}
,
		"dependency_cache" : [ 			{
				"name" : "helpdetails.js",
				"bootpath" : "C74:/help/resources",
				"type" : "TEXT",
				"implicit" : 1
			}
, 			{
				"name" : "degrade~.model.maxpat",
				"bootpath" : "~/@jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/Distortion/degrade~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "equalizer~.model.maxpat",
				"bootpath" : "~/@jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/EQ/equalizer~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.octavebandwidth2q.maxpat",
				"bootpath" : "~/@jamoma/Implementations/Max/Jamoma/patchers/components/audio/octavebandwidth2q",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "input~.model.maxpat",
				"bootpath" : "~/@jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/Sources/input~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "limiter~.model.maxpat",
				"bootpath" : "~/@jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/Dynamics/limiter~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "limiter.parametersAndMessages.maxpat",
				"bootpath" : "~/@jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/Dynamics/limiter~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "thru.maxpat",
				"bootpath" : "C74:/patchers/m4l/Pluggo for Live resources/patches",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "balance~.model.maxpat",
				"bootpath" : "~/@jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/Imaging/balance~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "output~.model.maxpat",
				"bootpath" : "~/@jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/Output/output~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "saturation~.model.maxpat",
				"bootpath" : "~/@jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/Distortion/saturation~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "record~.model.maxpat",
				"bootpath" : "~/@jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/Output/record~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "record.parametersAndMessages.maxpat",
				"bootpath" : "~/@jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/Output/record~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "equalizer~.view.small.maxpat",
				"bootpath" : "~/@jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/EQ/equalizer~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "equalizer~.view.large.maxpat",
				"bootpath" : "~/@jamoma/Implementations/Max/Jamoma/patchers/modules/audio/stereo/EQ/equalizer~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.q2octavebandwidth.maxpat",
				"bootpath" : "~/@jamoma/Implementations/Max/Jamoma/patchers/components/audio/q2octavebandwith",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.namespace.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.model.mxo",
				"type" : "iLaX"
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
				"name" : "j.message.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.parameter_array.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.map.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.limiter~.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.return.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.unit.mxo",
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
				"name" : "j.ui.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.remote_array.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.receive.mxo",
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
				"name" : "j.send.mxo",
				"type" : "iLaX"
			}
 ],
		"autosave" : 0,
		"styles" : [ 			{
				"name" : "jpatcher001",
				"parentstyle" : "",
				"multi" : 0
			}
 ],
		"bgfillcolor_type" : "gradient",
		"bgfillcolor_color1" : [ 0.376471, 0.384314, 0.4, 1.0 ],
		"bgfillcolor_color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
		"bgfillcolor_color" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
		"bgfillcolor_angle" : 270.0,
		"bgfillcolor_proportion" : 0.39
	}

}
