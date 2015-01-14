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
		"rect" : [ 171.0, 94.0, 1068.0, 681.0 ],
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
					"id" : "obj-12",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 195.0, 484.090912, 49.0, 22.0 ],
					"style" : "default",
					"text" : "test.log"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-7",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 195.0, 426.090912, 46.0, 22.0 ],
					"style" : "default",
					"text" : "error 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-6",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 195.0, 456.090912, 337.0, 22.0 ],
					"style" : "default",
					"text" : "prepend Jamoma/AudioGraph/all_externals_loading_properly"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-45",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 50.0, 359.0, 83.0, 22.0 ],
					"style" : "default",
					"text" : "test.terminate"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.952941, 0.564706, 0.098039, 1.0 ],
					"id" : "obj-44",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 195.0, 333.0, 24.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-21",
					"linecount" : 3,
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 195.0, 359.0, 294.0, 49.0 ],
					"style" : "default",
					"text" : "test.assert Jamoma/AudioGraph/all_externals_loading_properly @tags Jamoma AudioGraph"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-17",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "audio.connect", "" ],
					"patching_rect" : [ 638.0, 543.434937, 103.0, 22.0 ],
					"style" : "default",
					"text" : "j.mutesolo="
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-42",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 828.0, 193.900879, 179.0, 20.0 ],
					"style" : "default",
					"text" : " j.plug.out=  is quarantined"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-24",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 828.0, 168.991318, 179.0, 20.0 ],
					"style" : "default",
					"text" : " j.plug.in=  is quarantined"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-20",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "audio.connect", "" ],
					"patching_rect" : [ 638.0, 31.999985, 103.0, 22.0 ],
					"style" : "default",
					"text" : "j= allpass"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-11",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "audio.connect", "" ],
					"patching_rect" : [ 638.0, 164.856812, 103.0, 22.0 ],
					"style" : "default",
					"text" : "j.clip="
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-15",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "audio.connect", "" ],
					"patching_rect" : [ 638.0, 191.898102, 103.0, 22.0 ],
					"style" : "default",
					"text" : "j.count="
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-2",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "audio.connect", "" ],
					"patching_rect" : [ 828.0, 547.5896, 102.0, 22.0 ],
					"style" : "default",
					"text" : "j.wavetable="
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-13",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "audio.connect", "" ],
					"patching_rect" : [ 828.0, 31.999985, 102.0, 22.0 ],
					"style" : "default",
					"text" : "j.op="
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-81",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "audio.connect", "" ],
					"patching_rect" : [ 828.0, 520.191345, 102.0, 22.0 ],
					"style" : "default",
					"text" : "j.waveshaper="
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-80",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "list", "" ],
					"patching_rect" : [ 828.0, 492.793091, 102.0, 22.0 ],
					"style" : "default",
					"text" : "j.unsig="
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-78",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "audio.connect", "" ],
					"patching_rect" : [ 828.0, 437.996582, 102.0, 22.0 ],
					"style" : "default",
					"text" : "j.trajectory="
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-77",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "audio.connect", "" ],
					"patching_rect" : [ 828.0, 383.200012, 102.0, 22.0 ],
					"style" : "default",
					"text" : "j.spat="
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-74",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "audio.connect", "" ],
					"patching_rect" : [ 828.0, 246.208694, 102.0, 22.0 ],
					"style" : "default",
					"text" : "j.ramp="
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-73",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "audio.connect", "" ],
					"patching_rect" : [ 828.0, 141.593048, 102.0, 22.0 ],
					"style" : "default",
					"text" : "j.pick="
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-70",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "audio.connect", "" ],
					"patching_rect" : [ 638.0, 597.517517, 103.0, 22.0 ],
					"style" : "default",
					"text" : "j.offset="
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-55",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "audio.connect", "" ],
					"patching_rect" : [ 638.0, 137.815506, 103.0, 22.0 ],
					"style" : "default",
					"text" : "j.average="
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-36",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "audio.connect", "" ],
					"patching_rect" : [ 638.0, 59.041283, 103.0, 22.0 ],
					"style" : "default",
					"text" : "j.adsr="
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-49",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "audio.connect", "" ],
					"patching_rect" : [ 638.0, 86.082581, 103.0, 22.0 ],
					"style" : "default",
					"text" : "j.array="
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-18",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "audio.connect", "" ],
					"patching_rect" : [ 828.0, 301.005249, 102.0, 22.0 ],
					"style" : "default",
					"text" : "j.sig="
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-19",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 638.0, 113.123863, 169.0, 20.0 ],
					"style" : "default",
					"text" : "j.audiounit= is quarantined"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-8",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "audio.connect", "" ],
					"patching_rect" : [ 828.0, 355.801758, 124.0, 22.0 ],
					"style" : "default",
					"text" : "j.soundfile.recorder="
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-5",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "audio.connect", "audio.connect", "" ],
					"patching_rect" : [ 828.0, 328.403503, 124.0, 22.0 ],
					"style" : "default",
					"text" : "j.soundfile.player="
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-4",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "audio.connect", "" ],
					"patching_rect" : [ 828.0, 273.606995, 102.0, 22.0 ],
					"style" : "default",
					"text" : "j.resample="
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-3",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "audio.connect", "" ],
					"patching_rect" : [ 828.0, 59.398254, 102.0, 22.0 ],
					"style" : "default",
					"text" : "j.overdrive="
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-9",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "audio.connect", "audio.connect", "" ],
					"patching_rect" : [ 638.0, 381.187164, 103.0, 22.0 ],
					"style" : "default",
					"text" : "j.hilbert="
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-43",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "audio.connect", "" ],
					"patching_rect" : [ 828.0, 574.987854, 104.0, 22.0 ],
					"style" : "default",
					"text" : "j.window="
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-41",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "signal", "signal", "" ],
					"patching_rect" : [ 828.0, 465.394836, 102.0, 22.0 ],
					"style" : "default",
					"text" : "j.unpack="
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-40",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "audio.connect", "" ],
					"patching_rect" : [ 828.0, 410.598328, 102.0, 22.0 ],
					"style" : "default",
					"text" : "j.split="
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-39",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "audio.connect", "" ],
					"patching_rect" : [ 828.0, 218.81044, 102.0, 22.0 ],
					"style" : "default",
					"text" : "j.pulsesub="
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-38",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "audio.connect", "" ],
					"patching_rect" : [ 828.0, 114.194778, 102.0, 22.0 ],
					"style" : "default",
					"text" : "j.phasor="
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-37",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "audio.connect", "" ],
					"patching_rect" : [ 828.0, 86.796509, 102.0, 22.0 ],
					"style" : "default",
					"text" : "j.pack="
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-35",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "audio.connect", "" ],
					"patching_rect" : [ 638.0, 570.476257, 103.0, 22.0 ],
					"style" : "default",
					"text" : "j.noise="
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-34",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "audio.connect", "" ],
					"patching_rect" : [ 638.0, 489.352325, 103.0, 22.0 ],
					"style" : "default",
					"text" : "j.mixer="
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-33",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "audio.connect", "" ],
					"patching_rect" : [ 638.0, 516.393677, 103.0, 22.0 ],
					"style" : "default",
					"text" : "j.multimixer="
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-32",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "audio.connect", "" ],
					"patching_rect" : [ 638.0, 462.311066, 103.0, 22.0 ],
					"style" : "default",
					"text" : "j.limiter="
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-31",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "audio.connect", "" ],
					"patching_rect" : [ 638.0, 435.269745, 103.0, 22.0 ],
					"style" : "default",
					"text" : "j.join="
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-30",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 5,
					"outlettype" : [ "audio.connect", "", "", "", "" ],
					"patching_rect" : [ 638.0, 408.228455, 103.0, 22.0 ],
					"style" : "default",
					"text" : "j.info="
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-29",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "audio.connect", "" ],
					"patching_rect" : [ 638.0, 354.145874, 103.0, 22.0 ],
					"style" : "default",
					"text" : "j.gain="
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-28",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "audio.connect", "" ],
					"patching_rect" : [ 638.0, 327.104553, 103.0, 22.0 ],
					"style" : "default",
					"text" : "j.filter="
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-27",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "audio.connect", "" ],
					"patching_rect" : [ 638.0, 300.063293, 105.0, 22.0 ],
					"style" : "default",
					"text" : "j.fft="
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-26",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "audio.connect", "" ],
					"patching_rect" : [ 638.0, 273.021973, 103.0, 22.0 ],
					"style" : "default",
					"text" : "j.delay="
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-25",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "audio.connect", "" ],
					"patching_rect" : [ 638.0, 245.980682, 103.0, 22.0 ],
					"style" : "default",
					"text" : "j.degrade="
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-23",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "audio.connect", "" ],
					"patching_rect" : [ 638.0, 218.939392, 105.0, 22.0 ],
					"style" : "default",
					"text" : "j.dcblock="
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-1",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "bang", "bang" ],
					"patching_rect" : [ 50.0, 110.0, 35.0, 22.0 ],
					"style" : "default",
					"text" : "t b b"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-51",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 195.0, 303.0, 50.0, 22.0 ],
					"style" : "default",
					"text" : "zl reg"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-52",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "bang", "bang", "int" ],
					"patching_rect" : [ 195.0, 170.0, 50.0, 22.0 ],
					"style" : "default",
					"text" : "t b b 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-53",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 293.5, 272.0, 25.0, 22.0 ],
					"style" : "default",
					"text" : "t 0"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-54",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 293.5, 246.0, 78.0, 22.0 ],
					"style" : "default",
					"text" : "route jbogus"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-56",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 5,
					"outlettype" : [ "", "", "", "", "" ],
					"patching_rect" : [ 245.0, 215.0, 116.0, 22.0 ],
					"saved_object_attributes" : 					{
						"filename" : "patchdescribe.js",
						"parameter_enable" : 0
					}
,
					"style" : "default",
					"text" : "js patchdescribe.js"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-10",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 50.0, 51.0, 60.0, 22.0 ],
					"style" : "default",
					"text" : "loadbang"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-45", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-1", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-52", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-1", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-10", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-21", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-44", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-44", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-51", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-51", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-52", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-51", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-52", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-56", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-52", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-51", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-53", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-53", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-54", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-54", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-56", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-6", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-7", 0 ]
				}

			}
 ],
		"dependency_cache" : [ 			{
				"name" : "patchdescribe.js",
				"bootpath" : "/Users/Shared/Max 7/Examples/javascript/patcher-scripting",
				"patcherrelativepath" : "../../../../../../../../../../Shared/Max 7/Examples/javascript/patcher-scripting",
				"type" : "TEXT",
				"implicit" : 1
			}
, 			{
				"name" : "j.dcblock=.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.degrade=.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.delay=.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.fft=.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.filter=.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.gain=.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.info=.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.join=.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.limiter=.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.multimixer=.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.mixer=.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.noise=.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.pack=.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.phasor=.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.pulsesub=.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.split=.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.unpack=.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.window=.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.hilbert=.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.overdrive=.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.resample=.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.soundfile.player=.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.soundfile.recorder=.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.sig=.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.array=.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.adsr=.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.average=.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.offset=.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.pick=.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.ramp=.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.spat=.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.trajectory=.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.unsig=.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.waveshaper=.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.op=.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.wavetable=.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.count=.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.clip=.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.mutesolo=.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "oscar.mxo",
				"type" : "iLaX"
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
