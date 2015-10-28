{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 7,
			"minor" : 1,
			"revision" : 0,
			"architecture" : "x64",
			"modernui" : 1
		}
,
		"rect" : [ 295.0, 79.0, 647.0, 783.0 ],
		"bglocked" : 0,
		"openinpresentation" : 0,
		"default_fontsize" : 10.0,
		"default_fontface" : 0,
		"default_fontname" : "Verdana",
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
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-28",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 21.0, 460.0, 54.0, 21.0 ],
					"style" : "",
					"text" : "zl rev -1"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.0, 0.572549, 0.811765, 1.0 ],
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-27",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 21.0, 544.5, 66.0, 21.0 ],
					"style" : "",
					"text" : "j.send"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-26",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 56.0, 514.5, 95.0, 21.0 ],
					"style" : "",
					"text" : "prepend address"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-16",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 35.0, 158.0, 259.0, 19.0 ],
					"style" : "",
					"text" : "control the /gain of all modules (which have one)",
					"textcolor" : [ 0.584314, 0.584314, 0.584314, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"format" : 6,
					"id" : "obj-24",
					"maxclass" : "flonum",
					"maximum" : 12.0,
					"minimum" : -96.0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 35.0, 176.0, 48.0, 21.0 ],
					"style" : "",
					"triscale" : 0.9
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-25",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 35.0, 207.0, 106.0, 21.0 ],
					"style" : "",
					"text" : "/*.*/audio/gain $1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-3",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 87.0, 345.0, 221.0, 19.0 ],
					"style" : "",
					"text" : "control the two degrade modules together",
					"textcolor" : [ 0.584314, 0.584314, 0.584314, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"format" : 6,
					"id" : "obj-4",
					"maxclass" : "flonum",
					"maximum" : 1.0,
					"minimum" : 0.0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 39.0, 345.0, 48.0, 21.0 ],
					"style" : "",
					"triscale" : 0.9
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-5",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 39.0, 382.0, 180.0, 21.0 ],
					"style" : "",
					"text" : "/degrade.*/samplerate_ratio $1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-6",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 74.0, 238.0, 187.0, 31.0 ],
					"style" : "",
					"text" : "control the /audio/mute of all modules, the understand it",
					"textcolor" : [ 0.584314, 0.584314, 0.584314, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-7",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 52.0, 269.0, 98.0, 21.0 ],
					"style" : "",
					"text" : "/*/audio/mute $1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-8",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 52.0, 242.0, 23.0, 23.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-9",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 69.0, 99.0, 216.0, 19.0 ],
					"style" : "",
					"text" : "control the /gain of one module, as usual",
					"textcolor" : [ 0.584314, 0.584314, 0.584314, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"format" : 6,
					"id" : "obj-10",
					"maxclass" : "flonum",
					"maximum" : 12.0,
					"minimum" : -96.0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 21.0, 98.0, 48.0, 21.0 ],
					"style" : "",
					"triscale" : 0.9
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-11",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 21.0, 122.0, 118.0, 21.0 ],
					"style" : "",
					"text" : "/filter~/audio/gain $1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-12",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 21.0, 485.5, 54.0, 21.0 ],
					"style" : "",
					"text" : "zl slice 1"
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
					"id" : "obj-13",
					"lockeddragscroll" : 1,
					"maxclass" : "bpatcher",
					"name" : "output~.module.maxpat",
					"numinlets" : 2,
					"numoutlets" : 1,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "" ],
					"patching_rect" : [ 326.0, 597.0, 300.0, 175.0 ],
					"presentation_rect" : [ 0.0, 0.0, 300.0, 175.0 ],
					"varname" : "degrade~.module.mxt[6]",
					"viewvisibility" : 1
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
					"id" : "obj-14",
					"lockeddragscroll" : 1,
					"maxclass" : "bpatcher",
					"name" : "input~.module.maxpat",
					"numinlets" : 1,
					"numoutlets" : 3,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "signal", "signal", "" ],
					"patching_rect" : [ 326.0, 7.0, 300.0, 175.0 ],
					"presentation_rect" : [ 0.0, 0.0, 300.0, 175.0 ],
					"varname" : "degrade~.module.mxt[5]",
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-15",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 35.0, 57.0, 226.0, 19.0 ],
					"style" : "",
					"text" : "addressing modules using wildcards",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 18.0,
					"id" : "obj-17",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 35.0, 30.0, 200.0, 28.0 ],
					"style" : "",
					"text" : "wildcard demo",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"args" : [ "/filter~" ],
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-20",
					"lockeddragscroll" : 1,
					"maxclass" : "bpatcher",
					"name" : "filter~.module.maxpat",
					"numinlets" : 2,
					"numoutlets" : 3,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "signal", "signal", "" ],
					"patching_rect" : [ 326.0, 479.5, 300.0, 105.0 ],
					"presentation_rect" : [ 0.0, 0.0, 300.0, 105.0 ],
					"varname" : "jmod.degrade~.mxt[3]",
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"args" : [ "/degrade.2" ],
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-21",
					"lockeddragscroll" : 1,
					"maxclass" : "bpatcher",
					"name" : "degrade~.module.maxpat",
					"numinlets" : 2,
					"numoutlets" : 3,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "signal", "signal", "" ],
					"patching_rect" : [ 326.0, 395.5, 150.0, 70.0 ],
					"presentation_rect" : [ 0.0, 0.0, 150.0, 70.0 ],
					"varname" : "jmod.degrade~.mxt[2]",
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"args" : [ "/echo~" ],
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-22",
					"lockeddragscroll" : 1,
					"maxclass" : "bpatcher",
					"name" : "echo~.module.maxpat",
					"numinlets" : 2,
					"numoutlets" : 3,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "signal", "signal", "" ],
					"patching_rect" : [ 326.0, 277.0, 300.0, 105.0 ],
					"presentation_rect" : [ 0.0, 0.0, 300.0, 105.0 ],
					"varname" : "jmod.degrade~.mxt[1]",
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"args" : [ "/degrade.1" ],
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-23",
					"lockeddragscroll" : 1,
					"maxclass" : "bpatcher",
					"name" : "degrade~.module.maxpat",
					"numinlets" : 2,
					"numoutlets" : 3,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "signal", "signal", "" ],
					"patching_rect" : [ 326.0, 193.0, 150.0, 70.0 ],
					"presentation_rect" : [ 0.0, 0.0, 150.0, 70.0 ],
					"varname" : "jmod.degrade~.mxt",
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-1",
					"maxclass" : "panel",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 25.0, 19.0, 253.0, 67.0 ],
					"style" : ""
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-11", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-10", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-28", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-11", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-26", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-12", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-27", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-12", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-14", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-14", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-20", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-20", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-20", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-21", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-20", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-21", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-21", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-22", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-21", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-22", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-22", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-23", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-22", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-23", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-25", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-24", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-28", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 44.5, 235.0, 30.0, 235.0, 30.0, 318.0, 30.5, 318.0 ],
					"source" : [ "obj-25", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-27", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-26", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-28", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-4", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-28", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 48.5, 421.0, 30.5, 421.0 ],
					"source" : [ "obj-5", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-28", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 61.5, 307.0, 30.5, 307.0 ],
					"source" : [ "obj-7", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-8", 0 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-14::obj-1::obj-1::obj-12" : [ "Lookahead[2]", "Lookahead", 0 ],
			"obj-13::obj-1::obj-97" : [ "live.numbox[12]", "CPU", 0 ],
			"obj-14::obj-1::obj-29::obj-48" : [ "live.menu[6]", "live.menu", 0 ],
			"obj-13::obj-1::obj-100" : [ "live.text[25]", "live.text[1]", 0 ],
			"obj-22::obj-4::obj-3::obj-6" : [ "live.text", "live.text", 0 ],
			"obj-14::obj-1::obj-62" : [ "live.text[15]", "live.text[3]", 0 ],
			"obj-13::obj-1::obj-12::obj-27" : [ "Threshold[3]", "Threshold", 0 ],
			"obj-22::obj-4::obj-31::obj-1::obj-45" : [ "live.text[5]", "live.text", 0 ],
			"obj-14::obj-1::obj-1::obj-30" : [ "live.menu[7]", "live.menu", 0 ],
			"obj-13::obj-1::obj-12::obj-45" : [ "live.text[19]", "live.text", 0 ],
			"obj-13::obj-1::obj-110" : [ "live.numbox[11]", "live.numbox[1]", 0 ],
			"obj-22::obj-4::obj-3::obj-42" : [ "live.text[1]", "live.text", 0 ],
			"obj-22::obj-4::obj-3::obj-27" : [ "Threshold", "Threshold", 0 ],
			"obj-22::obj-4::obj-31::obj-1::obj-6" : [ "live.text[3]", "live.text", 0 ],
			"obj-20::obj-1::obj-7" : [ "live.numbox[6]", "live.numbox", 0 ],
			"obj-20::obj-1::obj-15" : [ "live.menu[5]", "live.menu", 0 ],
			"obj-22::obj-4::obj-3::obj-15" : [ "Postamp", "Postamp", 0 ],
			"obj-14::obj-1::obj-1::obj-13" : [ "Release[2]", "Release", 0 ],
			"obj-14::obj-1::obj-59" : [ "live.text[17]", "live.text[3]", 0 ],
			"obj-22::obj-4::obj-3::obj-13" : [ "Release", "Release", 0 ],
			"obj-13::obj-1::obj-104" : [ "live.dial[9]", "Depth", 0 ],
			"obj-13::obj-1::obj-102" : [ "live.text[23]", "live.text", 0 ],
			"obj-14::obj-1::obj-58" : [ "live.text[13]", "live.text[4]", 0 ],
			"obj-14::obj-1::obj-48" : [ "live.menu[8]", "live.menu", 0 ],
			"obj-13::obj-1::obj-106" : [ "live.dial[8]", "Release", 0 ],
			"obj-22::obj-4::obj-25" : [ "Feedback", "Feedback", 0 ],
			"obj-13::obj-1::obj-103" : [ "live.text[24]", "live.text", 0 ],
			"obj-14::obj-1::obj-1::obj-6" : [ "live.text[10]", "live.text", 0 ],
			"obj-22::obj-4::obj-17" : [ "live.menu[4]", "live.menu[1]", 0 ],
			"obj-14::obj-1::obj-1::obj-15" : [ "Postamp[2]", "Postamp", 0 ],
			"obj-14::obj-1::obj-74" : [ "live.dial[6]", "Transpose", 0 ],
			"obj-14::obj-1::obj-47" : [ "live.numbox[3]", "live.numbox", 0 ],
			"obj-22::obj-4::obj-18" : [ "live.text[7]", "live.text[3]", 0 ],
			"obj-13::obj-1::obj-12::obj-6" : [ "live.text[18]", "live.text", 0 ],
			"obj-13::obj-1::obj-108" : [ "live.text[21]", "live.text[4]", 0 ],
			"obj-22::obj-4::obj-31::obj-2::obj-12" : [ "live.numbox[4]", "live.numbox[4]", 0 ],
			"obj-22::obj-4::obj-31::obj-1::obj-42" : [ "live.text[4]", "live.text", 0 ],
			"obj-22::obj-4::obj-31::obj-1::obj-12" : [ "Lookahead[1]", "Lookahead", 0 ],
			"obj-20::obj-1::obj-22" : [ "live.text[8]", "live.text", 0 ],
			"obj-13::obj-1::obj-98" : [ "live.menu[10]", "live.menu", 0 ],
			"obj-22::obj-4::obj-3::obj-45" : [ "live.text[2]", "live.text", 0 ],
			"obj-22::obj-4::obj-3::obj-5" : [ "Preamp", "Preamp", 0 ],
			"obj-14::obj-1::obj-1::obj-27" : [ "Threshold[2]", "Threshold", 0 ],
			"obj-14::obj-1::obj-45" : [ "live.text[12]", "live.text", 0 ],
			"obj-22::obj-4::obj-23" : [ "live.dial[2]", "Delay L", 0 ],
			"obj-14::obj-1::obj-1::obj-5" : [ "Preamp[2]", "Preamp", 0 ],
			"obj-23::obj-1::obj-13" : [ "live.dial", "Sample rate", 0 ],
			"obj-13::obj-1::obj-12::obj-5" : [ "Preamp[3]", "Preamp", 0 ],
			"obj-13::obj-1::obj-111" : [ "live.numbox[13]", "live.numbox[2]", 0 ],
			"obj-23::obj-1::obj-14" : [ "live.dial[1]", "Bit depth", 0 ],
			"obj-22::obj-4::obj-31::obj-2::obj-7" : [ "live.numbox[5]", "live.numbox", 0 ],
			"obj-22::obj-4::obj-21" : [ "live.menu[3]", "live.menu[2]", 0 ],
			"obj-22::obj-4::obj-31::obj-2::obj-14" : [ "live.numbox[2]", "live.numbox", 0 ],
			"obj-13::obj-1::obj-17" : [ "Master Gain[2]", "Master Gain", 0 ],
			"obj-22::obj-4::obj-31::obj-1::obj-13" : [ "Release[1]", "Release", 0 ],
			"obj-22::obj-4::obj-31::obj-2::obj-15" : [ "live.menu[2]", "live.menu", 0 ],
			"obj-21::obj-1::obj-14" : [ "live.dial[5]", "Bit depth", 0 ],
			"obj-14::obj-1::obj-110" : [ "live.numbox[1]", "live.numbox[1]", 0 ],
			"obj-13::obj-1::obj-12::obj-12" : [ "Lookahead[3]", "Lookahead", 0 ],
			"obj-13::obj-1::obj-99" : [ "live.menu[11]", "live.menu[2]", 0 ],
			"obj-14::obj-1::obj-108" : [ "live.text[14]", "live.text[4]", 0 ],
			"obj-14::obj-1::obj-1::obj-45" : [ "live.text[9]", "live.text", 0 ],
			"obj-13::obj-1::obj-12::obj-42" : [ "live.text[20]", "live.text", 0 ],
			"obj-22::obj-4::obj-31::obj-1::obj-15" : [ "Postamp[1]", "Postamp", 0 ],
			"obj-20::obj-1::obj-12" : [ "live.numbox[8]", "live.numbox[4]", 0 ],
			"obj-20::obj-1::obj-19" : [ "live.numbox[9]", "live.numbox", 0 ],
			"obj-14::obj-1::obj-82" : [ "pan", "Pan", 0 ],
			"obj-13::obj-1::obj-12::obj-30" : [ "live.menu[9]", "live.menu", 0 ],
			"obj-22::obj-4::obj-31::obj-2::obj-22" : [ "live.text[6]", "live.text", 0 ],
			"obj-14::obj-1::obj-1::obj-42" : [ "live.text[11]", "live.text", 0 ],
			"obj-13::obj-1::obj-12::obj-13" : [ "Release[3]", "Release", 0 ],
			"obj-22::obj-4::obj-3::obj-12" : [ "Lookahead", "Lookahead", 0 ],
			"obj-13::obj-1::obj-82" : [ "pan[1]", "Pan", 0 ],
			"obj-22::obj-4::obj-31::obj-2::obj-19" : [ "live.numbox", "live.numbox", 0 ],
			"obj-13::obj-1::obj-107" : [ "live.dial[7]", "Preamp", 0 ],
			"obj-22::obj-4::obj-31::obj-1::obj-27" : [ "Threshold[1]", "Threshold", 0 ],
			"obj-14::obj-1::obj-111" : [ "live.numbox[10]", "live.numbox[2]", 0 ],
			"obj-22::obj-4::obj-31::obj-1::obj-5" : [ "Preamp[1]", "Preamp", 0 ],
			"obj-14::obj-1::obj-55" : [ "Master Gain[1]", "Master Gain", 0 ],
			"obj-13::obj-1::obj-12::obj-15" : [ "Postamp[3]", "Postamp", 0 ],
			"obj-22::obj-4::obj-31::obj-1::obj-30" : [ "live.menu[1]", "live.menu", 0 ],
			"obj-21::obj-1::obj-13" : [ "live.dial[4]", "Sample rate", 0 ],
			"obj-14::obj-1::obj-4" : [ "live.text[16]", "live.text[1]", 0 ],
			"obj-13::obj-1::obj-90" : [ "live.text[22]", "live.text[1]", 0 ],
			"obj-22::obj-4::obj-3::obj-30" : [ "live.menu", "live.menu", 0 ],
			"obj-22::obj-4::obj-24" : [ "live.dial[3]", "Delay R", 0 ],
			"obj-20::obj-1::obj-14" : [ "live.numbox[7]", "live.numbox", 0 ]
		}
,
		"dependency_cache" : [ 			{
				"name" : "degrade~.module.maxpat",
				"bootpath" : "~/Documents/GITs/JamomaMax/Jamoma/patchers/models/audio/stereo/distortion/degrade",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "degrade~.model.maxpat",
				"bootpath" : "~/Documents/GITs/JamomaMax/Jamoma/patchers/models/audio/stereo/distortion/degrade",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "degrade~.view.maxpat",
				"bootpath" : "~/Documents/GITs/JamomaMax/Jamoma/patchers/models/audio/stereo/distortion/degrade",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "echo~.module.maxpat",
				"bootpath" : "~/Documents/GITs/JamomaMax/Jamoma/patchers/models/audio/stereo/delay/echo",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "echo~.model.maxpat",
				"bootpath" : "~/Documents/GITs/JamomaMax/Jamoma/patchers/models/audio/stereo/delay/echo",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "limiter~.model.maxpat",
				"bootpath" : "~/Documents/GITs/JamomaMax/Jamoma/patchers/models/audio/stereo/dynamics/limiter",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "limiter.parametersAndMessages.maxpat",
				"bootpath" : "~/Documents/GITs/JamomaMax/Jamoma/patchers/models/audio/stereo/dynamics/limiter",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "filter~.model.maxpat",
				"bootpath" : "~/Documents/GITs/JamomaMax/Jamoma/patchers/models/audio/stereo/eq/filter",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.octavebandwidth2q.maxpat",
				"bootpath" : "~/Documents/GITs/JamomaMax/Jamoma/patchers/components/audio/octavebandwidth2q",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.q2octavebandwidth.maxpat",
				"bootpath" : "~/Documents/GITs/JamomaMax/Jamoma/patchers/components/audio/q2octavebandwith",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "echo~.view.maxpat",
				"bootpath" : "~/Documents/GITs/JamomaMax/Jamoma/patchers/models/audio/stereo/delay/echo",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "limiter~.view.maxpat",
				"bootpath" : "~/Documents/GITs/JamomaMax/Jamoma/patchers/models/audio/stereo/dynamics/limiter",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "filter~.view.maxpat",
				"bootpath" : "~/Documents/GITs/JamomaMax/Jamoma/patchers/models/audio/stereo/eq/filter",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "filter~.module.maxpat",
				"bootpath" : "~/Documents/GITs/JamomaMax/Jamoma/patchers/models/audio/stereo/eq/filter",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "input~.module.maxpat",
				"bootpath" : "~/Documents/GITs/JamomaMax/Jamoma/patchers/models/audio/stereo/sources/input",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "input~.view.maxpat",
				"bootpath" : "~/Documents/GITs/JamomaMax/Jamoma/patchers/models/audio/stereo/sources/input",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "input~.model.maxpat",
				"bootpath" : "~/Documents/GITs/JamomaMax/Jamoma/patchers/models/audio/stereo/sources/input",
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
				"bootpath" : "~/Documents/GITs/JamomaMax/Jamoma/patchers/models/audio/stereo/imaging/balance",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "output~.module.maxpat",
				"bootpath" : "~/Documents/GITs/JamomaMax/Jamoma/patchers/models/audio/stereo/output/output",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "output~.model.maxpat",
				"bootpath" : "~/Documents/GITs/JamomaMax/Jamoma/patchers/models/audio/stereo/output/output",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "saturation~.model.maxpat",
				"bootpath" : "~/Documents/GITs/JamomaMax/Jamoma/patchers/models/audio/stereo/distortion/saturation",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "record~.model.maxpat",
				"bootpath" : "~/Documents/GITs/JamomaMax/Jamoma/patchers/models/audio/stereo/output/record",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "record.parametersAndMessages.maxpat",
				"bootpath" : "~/Documents/GITs/JamomaMax/Jamoma/patchers/models/audio/stereo/output/record",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "output~.view.maxpat",
				"bootpath" : "~/Documents/GITs/JamomaMax/Jamoma/patchers/models/audio/stereo/output/output",
				"type" : "JSON",
				"implicit" : 1
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
				"name" : "j.receive~.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.message.mxo",
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
				"name" : "j.receive.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.savebang.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.send.mxo",
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
 ],
		"autosave" : 0
	}

}
