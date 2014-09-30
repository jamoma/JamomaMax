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
		"rect" : [ 25.0, 69.0, 1440.0, 900.0 ],
		"bglocked" : 0,
		"openinpresentation" : 1,
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
					"frgb" : 0.0,
					"id" : "obj-4",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 30.0, 293.0, 165.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 30.0, 293.0, 165.0, 19.0 ],
					"text" : "some hardwired mappings :"
				}

			}
, 			{
				"box" : 				{
					"args" : [ "/input~.1" ],
					"id" : "obj-25",
					"lockeddragscroll" : 1,
					"maxclass" : "bpatcher",
					"name" : "input~.module.maxpat",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "signal", "signal", "" ],
					"patching_rect" : [ 261.0, 166.0, 300.0, 140.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 300.0, 70.0, 300.0, 140.0 ],
					"varname" : "/input~"
				}

			}
, 			{
				"box" : 				{
					"args" : [ "/mouse" ],
					"id" : "obj-28",
					"lockeddragscroll" : 1,
					"maxclass" : "bpatcher",
					"name" : "mouse.module.maxpat",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 15.0, 310.0, 150.0, 70.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.0, 350.0, 150.0, 70.0 ],
					"varname" : "/mouse/1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-18",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 51.0, 482.0, 61.0, 17.0 ],
					"text" : "/active $1"
				}

			}
, 			{
				"box" : 				{
					"args" : [ "/fileBrowser.1" ],
					"id" : "obj-20",
					"maxclass" : "bpatcher",
					"name" : "fileBrowser.module.maxpat",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 261.0, 46.0, 300.0, 70.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 300.0, 0.0, 300.0, 70.0 ],
					"varname" : "/fileBrowser_1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 14.0,
					"frgb" : 0.0,
					"id" : "obj-16",
					"linecount" : 4,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 581.0, 783.0, 191.0, 75.0 ],
					"presentation" : 1,
					"presentation_linecount" : 3,
					"presentation_rect" : [ 8.0, 116.0, 241.0, 58.0 ],
					"text" : "press Go on the cueTrigger module below to pass through the different cues "
				}

			}
, 			{
				"box" : 				{
					"args" : [ "/cueTrigger" ],
					"id" : "obj-9",
					"maxclass" : "bpatcher",
					"name" : "cueTrigger.module.maxpat",
					"numinlets" : 0,
					"numoutlets" : 0,
					"patching_rect" : [ 263.0, 691.0, 300.0, 140.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.0, 525.0, 300.0, 140.0 ],
					"varname" : "/cueTrigger"
				}

			}
, 			{
				"box" : 				{
					"args" : [ "cuelist" ],
					"id" : "obj-1",
					"maxclass" : "bpatcher",
					"name" : "cueScript.module.maxpat",
					"numinlets" : 0,
					"numoutlets" : 0,
					"patching_rect" : [ 261.0, 591.0, 300.0, 70.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.0, 455.0, 300.0, 70.0 ],
					"varname" : "cuelist"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.4, 0.4, 0.8, 1.0 ],
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-11",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 262.0, 837.0, 151.0, 19.0 ],
					"text" : "j.pass /cue @strip 0"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.4, 0.4, 0.8, 1.0 ],
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-12",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 262.0, 667.0, 159.0, 19.0 ],
					"text" : "j.pass /cues @strip 0"
				}

			}
, 			{
				"box" : 				{
					"args" : [ "/output~" ],
					"id" : "obj-49",
					"maxclass" : "bpatcher",
					"name" : "output~.module.maxpat",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 586.0, 586.0, 300.0, 140.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.0, 735.0, 300.0, 140.0 ],
					"varname" : "/output~"
				}

			}
, 			{
				"box" : 				{
					"args" : [ "/filter~.1" ],
					"id" : "obj-26",
					"lockeddragscroll" : 1,
					"maxclass" : "bpatcher",
					"name" : "filter~.module.maxpat",
					"numinlets" : 2,
					"numoutlets" : 3,
					"outlettype" : [ "signal", "signal", "" ],
					"patching_rect" : [ 261.0, 327.0, 300.0, 70.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 300.0, 210.0, 300.0, 70.0 ],
					"varname" : "/filter~"
				}

			}
, 			{
				"box" : 				{
					"args" : [ "/saturation~.2" ],
					"id" : "obj-52",
					"lockeddragscroll" : 1,
					"maxclass" : "bpatcher",
					"name" : "saturation~.module.maxpat",
					"numinlets" : 3,
					"numoutlets" : 3,
					"outlettype" : [ "signal", "signal", "" ],
					"patching_rect" : [ 586.0, 496.0, 300.0, 70.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 600.0, 350.0, 300.0, 70.0 ],
					"varname" : "/saturation~[2]"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-15",
					"maxclass" : "bpatcher",
					"name" : "layout.module.maxpat",
					"numinlets" : 0,
					"numoutlets" : 0,
					"patching_rect" : [ 54.0, 720.0, 150.0, 70.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.0, 0.0, 150.0, 70.0 ]
				}

			}
, 			{
				"box" : 				{
					"args" : [ "/saturation~.6" ],
					"id" : "obj-76",
					"lockeddragscroll" : 1,
					"maxclass" : "bpatcher",
					"name" : "saturation~.module.maxpat",
					"numinlets" : 3,
					"numoutlets" : 3,
					"outlettype" : [ "signal", "signal", "" ],
					"patching_rect" : [ 1881.0, 496.0, 300.0, 70.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 900.0, 805.0, 300.0, 70.0 ],
					"varname" : "/saturation~[6]"
				}

			}
, 			{
				"box" : 				{
					"args" : [ "/multidelay~.6" ],
					"id" : "obj-77",
					"maxclass" : "bpatcher",
					"name" : "multidelay~.module.maxpat",
					"numinlets" : 3,
					"numoutlets" : 3,
					"outlettype" : [ "signal", "signal", "" ],
					"patching_rect" : [ 1881.0, 411.0, 300.0, 70.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 900.0, 735.0, 300.0, 70.0 ],
					"varname" : "/multidelay~[6]"
				}

			}
, 			{
				"box" : 				{
					"args" : [ "/filter~.6" ],
					"id" : "obj-79",
					"lockeddragscroll" : 1,
					"maxclass" : "bpatcher",
					"name" : "filter~.module.maxpat",
					"numinlets" : 2,
					"numoutlets" : 3,
					"outlettype" : [ "signal", "signal", "" ],
					"patching_rect" : [ 1882.0, 327.000031, 300.0, 70.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 900.0, 665.0, 300.0, 70.0 ],
					"varname" : "/filter~[6]"
				}

			}
, 			{
				"box" : 				{
					"args" : [ "/input~.6" ],
					"id" : "obj-78",
					"lockeddragscroll" : 1,
					"maxclass" : "bpatcher",
					"name" : "input~.module.maxpat",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "signal", "signal", "" ],
					"patching_rect" : [ 1881.0, 166.000031, 300.0, 140.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 900.0, 525.0, 300.0, 140.0 ],
					"varname" : "/input~[6]"
				}

			}
, 			{
				"box" : 				{
					"args" : [ "/fileBrowser.6" ],
					"id" : "obj-40",
					"maxclass" : "bpatcher",
					"name" : "fileBrowser.module.maxpat",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1881.0, 46.0, 300.0, 70.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 900.0, 455.0, 300.0, 70.0 ],
					"varname" : "/fileBrowser_6"
				}

			}
, 			{
				"box" : 				{
					"args" : [ "/saturation~.5" ],
					"id" : "obj-70",
					"lockeddragscroll" : 1,
					"maxclass" : "bpatcher",
					"name" : "saturation~.module.maxpat",
					"numinlets" : 3,
					"numoutlets" : 3,
					"outlettype" : [ "signal", "signal", "" ],
					"patching_rect" : [ 1561.0, 496.000092, 300.0, 70.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 600.0, 805.0, 300.0, 70.0 ],
					"varname" : "/saturation~[5]"
				}

			}
, 			{
				"box" : 				{
					"args" : [ "/multidelay~.5" ],
					"id" : "obj-71",
					"maxclass" : "bpatcher",
					"name" : "multidelay~.module.maxpat",
					"numinlets" : 3,
					"numoutlets" : 3,
					"outlettype" : [ "signal", "signal", "" ],
					"patching_rect" : [ 1561.0, 411.000092, 300.0, 70.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 600.0, 735.0, 300.0, 70.0 ],
					"varname" : "/multidelay~[5]"
				}

			}
, 			{
				"box" : 				{
					"args" : [ "/filter~.5" ],
					"id" : "obj-73",
					"lockeddragscroll" : 1,
					"maxclass" : "bpatcher",
					"name" : "filter~.module.maxpat",
					"numinlets" : 2,
					"numoutlets" : 3,
					"outlettype" : [ "signal", "signal", "" ],
					"patching_rect" : [ 1562.0, 327.000122, 300.0, 70.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 600.0, 665.0, 300.0, 70.0 ],
					"varname" : "/filter~[5]"
				}

			}
, 			{
				"box" : 				{
					"args" : [ "/input~.5" ],
					"id" : "obj-72",
					"lockeddragscroll" : 1,
					"maxclass" : "bpatcher",
					"name" : "input~.module.maxpat",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "signal", "signal", "" ],
					"patching_rect" : [ 1561.0, 166.000107, 300.0, 140.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 600.0, 525.0, 300.0, 140.0 ],
					"varname" : "/input~[5]"
				}

			}
, 			{
				"box" : 				{
					"args" : [ "/fileBrowser.5" ],
					"id" : "obj-38",
					"maxclass" : "bpatcher",
					"name" : "fileBrowser.module.maxpat",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1561.0, 46.0, 300.0, 70.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 600.0, 455.0, 300.0, 70.0 ],
					"varname" : "/fileBrowser_5"
				}

			}
, 			{
				"box" : 				{
					"args" : [ "/saturation~.4" ],
					"id" : "obj-64",
					"lockeddragscroll" : 1,
					"maxclass" : "bpatcher",
					"name" : "saturation~.module.maxpat",
					"numinlets" : 3,
					"numoutlets" : 3,
					"outlettype" : [ "signal", "signal", "" ],
					"patching_rect" : [ 1236.0, 496.000061, 300.0, 70.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 300.0, 805.0, 300.0, 70.0 ],
					"varname" : "/saturation~[4]"
				}

			}
, 			{
				"box" : 				{
					"args" : [ "/multidelay~.4" ],
					"id" : "obj-65",
					"maxclass" : "bpatcher",
					"name" : "multidelay~.module.maxpat",
					"numinlets" : 3,
					"numoutlets" : 3,
					"outlettype" : [ "signal", "signal", "" ],
					"patching_rect" : [ 1236.0, 411.000061, 300.0, 70.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 300.0, 735.0, 300.0, 70.0 ],
					"varname" : "/multidelay~[4]"
				}

			}
, 			{
				"box" : 				{
					"args" : [ "/filter~.4" ],
					"id" : "obj-67",
					"lockeddragscroll" : 1,
					"maxclass" : "bpatcher",
					"name" : "filter~.module.maxpat",
					"numinlets" : 2,
					"numoutlets" : 3,
					"outlettype" : [ "signal", "signal", "" ],
					"patching_rect" : [ 1237.0, 327.000092, 300.0, 70.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 300.0, 665.0, 300.0, 70.0 ],
					"varname" : "/filter~[4]"
				}

			}
, 			{
				"box" : 				{
					"args" : [ "/input~.4" ],
					"id" : "obj-66",
					"lockeddragscroll" : 1,
					"maxclass" : "bpatcher",
					"name" : "input~.module.maxpat",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "signal", "signal", "" ],
					"patching_rect" : [ 1236.0, 166.000076, 300.0, 140.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 300.0, 525.0, 300.0, 140.0 ],
					"varname" : "/input~[4]"
				}

			}
, 			{
				"box" : 				{
					"args" : [ "/fileBrowser.4" ],
					"id" : "obj-30",
					"maxclass" : "bpatcher",
					"name" : "fileBrowser.module.maxpat",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1236.0, 46.0, 300.0, 70.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 300.0, 455.0, 300.0, 70.0 ],
					"varname" : "/fileBrowser_4"
				}

			}
, 			{
				"box" : 				{
					"args" : [ "/saturation~.3" ],
					"id" : "obj-58",
					"lockeddragscroll" : 1,
					"maxclass" : "bpatcher",
					"name" : "saturation~.module.maxpat",
					"numinlets" : 3,
					"numoutlets" : 3,
					"outlettype" : [ "signal", "signal", "" ],
					"patching_rect" : [ 911.0, 496.000031, 300.0, 70.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 900.0, 350.0, 300.0, 70.0 ],
					"varname" : "/saturation~[3]"
				}

			}
, 			{
				"box" : 				{
					"args" : [ "/multidelay~.3" ],
					"id" : "obj-59",
					"maxclass" : "bpatcher",
					"name" : "multidelay~.module.maxpat",
					"numinlets" : 3,
					"numoutlets" : 3,
					"outlettype" : [ "signal", "signal", "" ],
					"patching_rect" : [ 911.0, 411.000031, 300.0, 70.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 900.0, 280.0, 300.0, 70.0 ],
					"varname" : "/multidelay~[3]"
				}

			}
, 			{
				"box" : 				{
					"args" : [ "/filter~.3" ],
					"id" : "obj-61",
					"lockeddragscroll" : 1,
					"maxclass" : "bpatcher",
					"name" : "filter~.module.maxpat",
					"numinlets" : 2,
					"numoutlets" : 3,
					"outlettype" : [ "signal", "signal", "" ],
					"patching_rect" : [ 912.0, 327.000061, 300.0, 70.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 900.0, 210.0, 300.0, 70.0 ],
					"varname" : "/filter~[3]"
				}

			}
, 			{
				"box" : 				{
					"args" : [ "/input~.3" ],
					"id" : "obj-60",
					"lockeddragscroll" : 1,
					"maxclass" : "bpatcher",
					"name" : "input~.module.maxpat",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "signal", "signal", "" ],
					"patching_rect" : [ 911.0, 166.000061, 300.0, 140.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 900.0, 70.0, 300.0, 140.0 ],
					"varname" : "/input~[3]"
				}

			}
, 			{
				"box" : 				{
					"args" : [ "/fileBrowser.3" ],
					"id" : "obj-27",
					"maxclass" : "bpatcher",
					"name" : "fileBrowser.module.maxpat",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 911.0, 46.0, 300.0, 70.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 900.0, 0.0, 300.0, 70.0 ],
					"varname" : "/fileBrowser_3"
				}

			}
, 			{
				"box" : 				{
					"args" : [ "/multidelay~.2" ],
					"id" : "obj-53",
					"maxclass" : "bpatcher",
					"name" : "multidelay~.module.maxpat",
					"numinlets" : 3,
					"numoutlets" : 3,
					"outlettype" : [ "signal", "signal", "" ],
					"patching_rect" : [ 586.0, 411.0, 300.0, 70.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 600.0, 280.0, 300.0, 70.0 ],
					"varname" : "/multidelay~[2]"
				}

			}
, 			{
				"box" : 				{
					"args" : [ "/filter~.2" ],
					"id" : "obj-55",
					"lockeddragscroll" : 1,
					"maxclass" : "bpatcher",
					"name" : "filter~.module.maxpat",
					"numinlets" : 2,
					"numoutlets" : 3,
					"outlettype" : [ "signal", "signal", "" ],
					"patching_rect" : [ 587.0, 327.000031, 300.0, 70.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 600.0, 210.0, 300.0, 70.0 ],
					"varname" : "/filter~[2]"
				}

			}
, 			{
				"box" : 				{
					"args" : [ "/input~.2" ],
					"id" : "obj-54",
					"lockeddragscroll" : 1,
					"maxclass" : "bpatcher",
					"name" : "input~.module.maxpat",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "signal", "signal", "" ],
					"patching_rect" : [ 586.0, 166.000031, 300.0, 140.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 600.0, 70.0, 300.0, 140.0 ],
					"varname" : "/input~[2]"
				}

			}
, 			{
				"box" : 				{
					"args" : [ "/fileBrowser.2" ],
					"id" : "obj-22",
					"maxclass" : "bpatcher",
					"name" : "fileBrowser.module.maxpat",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 586.0, 46.0, 300.0, 70.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 600.0, 0.0, 300.0, 70.0 ],
					"varname" : "/fileBrowser_2"
				}

			}
, 			{
				"box" : 				{
					"args" : [ "/saturation~.1" ],
					"id" : "obj-24",
					"lockeddragscroll" : 1,
					"maxclass" : "bpatcher",
					"name" : "saturation~.module.maxpat",
					"numinlets" : 3,
					"numoutlets" : 3,
					"outlettype" : [ "signal", "signal", "" ],
					"patching_rect" : [ 261.0, 496.0, 300.0, 70.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 300.0, 350.0, 300.0, 70.0 ],
					"varname" : "/saturation~"
				}

			}
, 			{
				"box" : 				{
					"args" : [ "/multidelay~.1" ],
					"id" : "obj-37",
					"maxclass" : "bpatcher",
					"name" : "multidelay~.module.maxpat",
					"numinlets" : 3,
					"numoutlets" : 3,
					"outlettype" : [ "signal", "signal", "" ],
					"patching_rect" : [ 261.0, 411.0, 300.0, 70.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 300.0, 280.0, 300.0, 70.0 ],
					"varname" : "/multidelay~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-3",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 450.0, 13.0, 196.0, 19.0 ],
					"text" : "loadmess /folder ./examples/sounds/"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-75",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 7,
							"architecture" : "x86"
						}
,
						"rect" : [ 673.0, 351.0, 449.0, 313.0 ],
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
									"id" : "obj-9",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 47.0, 27.0, 139.0, 19.0 ],
									"text" : "loadmess /preset/recall 1"
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
									"patching_rect" : [ 47.0, 77.0, 51.0, 19.0 ],
									"text" : "deferlow"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Verdana",
									"fontsize" : 10.0,
									"id" : "obj-8",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 94.0, 55.0, 122.0, 19.0 ],
									"text" : "loadmess /fullscreen 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Verdana",
									"fontsize" : 10.0,
									"id" : "obj-7",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 94.0, 105.0, 51.0, 19.0 ],
									"text" : "deferlow"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Verdana",
									"fontsize" : 10.0,
									"id" : "obj-5",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 179.0, 105.0, 267.0, 19.0 ],
									"text" : "loadmess /loadScript JamomaDefaultSymphony.txt"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Verdana",
									"fontsize" : 10.0,
									"id" : "obj-6",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 154.0, 80.0, 225.0, 19.0 ],
									"text" : "loadmess /preset/read BigPatchLayout.xml"
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
									"patching_rect" : [ 179.0, 155.0, 51.0, 19.0 ],
									"text" : "deferlow"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Verdana",
									"fontsize" : 10.0,
									"id" : "obj-3",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 154.0, 130.0, 51.0, 19.0 ],
									"text" : "deferlow"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-2",
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 179.0, 185.0, 25.0, 25.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-1",
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 154.0, 185.0, 25.0, 25.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-10", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-3", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-2", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-4", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-5", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
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
									"source" : [ "obj-7", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-8", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-10", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-9", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 55.0, 649.0, 76.0, 19.0 ],
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
					"text" : "p init"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-47",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 7,
							"architecture" : "x86"
						}
,
						"rect" : [ 780.0, 44.0, 202.0, 267.0 ],
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
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 47.0, 57.0, 103.0, 19.0 ],
									"text" : "j.oscroute /file"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Verdana",
									"fontsize" : 10.0,
									"id" : "obj-2",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "int", "", "int" ],
									"patching_rect" : [ 47.0, 113.0, 40.0, 19.0 ],
									"text" : "t 1 l 0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-3",
									"maxclass" : "toggle",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 47.0, 149.0, 15.0, 15.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Verdana",
									"fontsize" : 10.0,
									"id" : "obj-4",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 47.0, 176.0, 101.0, 17.0 ],
									"text" : "/soundfile/play $1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Verdana",
									"fontsize" : 10.0,
									"id" : "obj-5",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 47.0, 84.0, 132.0, 19.0 ],
									"text" : "prepend /soundfile/open"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-6",
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 47.0, 34.0, 15.0, 15.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-7",
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 47.0, 196.0, 15.0, 15.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-2", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-2", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-2", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-3", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
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
									"source" : [ "obj-5", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-6", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 1881.0, 136.0, 67.0, 19.0 ],
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
					"text" : "p load_play"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-46",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 7,
							"architecture" : "x86"
						}
,
						"rect" : [ 780.0, 44.0, 202.0, 267.0 ],
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
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 47.0, 57.0, 103.0, 19.0 ],
									"text" : "j.oscroute /file"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Verdana",
									"fontsize" : 10.0,
									"id" : "obj-2",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "int", "", "int" ],
									"patching_rect" : [ 47.0, 113.0, 40.0, 19.0 ],
									"text" : "t 1 l 0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-3",
									"maxclass" : "toggle",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 47.0, 149.0, 15.0, 15.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Verdana",
									"fontsize" : 10.0,
									"id" : "obj-4",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 47.0, 176.0, 101.0, 17.0 ],
									"text" : "/soundfile/play $1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Verdana",
									"fontsize" : 10.0,
									"id" : "obj-5",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 47.0, 84.0, 132.0, 19.0 ],
									"text" : "prepend /soundfile/open"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-6",
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 47.0, 34.0, 15.0, 15.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-7",
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 47.0, 196.0, 15.0, 15.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-2", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-2", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-2", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-3", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
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
									"source" : [ "obj-5", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-6", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 1561.0, 131.0, 67.0, 19.0 ],
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
					"text" : "p load_play"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-45",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 7,
							"architecture" : "x86"
						}
,
						"rect" : [ 780.0, 44.0, 202.0, 267.0 ],
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
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 47.0, 57.0, 103.0, 19.0 ],
									"text" : "j.oscroute /file"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Verdana",
									"fontsize" : 10.0,
									"id" : "obj-2",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "int", "", "int" ],
									"patching_rect" : [ 47.0, 113.0, 40.0, 19.0 ],
									"text" : "t 1 l 0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-3",
									"maxclass" : "toggle",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 47.0, 149.0, 15.0, 15.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Verdana",
									"fontsize" : 10.0,
									"id" : "obj-4",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 47.0, 176.0, 101.0, 17.0 ],
									"text" : "/soundfile/play $1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Verdana",
									"fontsize" : 10.0,
									"id" : "obj-5",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 47.0, 84.0, 132.0, 19.0 ],
									"text" : "prepend /soundfile/open"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-6",
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 47.0, 34.0, 15.0, 15.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-7",
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 47.0, 196.0, 15.0, 15.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-2", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-2", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-2", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-3", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
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
									"source" : [ "obj-5", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-6", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 1236.0, 131.0, 67.0, 19.0 ],
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
					"text" : "p load_play"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-44",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 7,
							"architecture" : "x86"
						}
,
						"rect" : [ 780.0, 44.0, 202.0, 267.0 ],
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
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 47.0, 57.0, 103.0, 19.0 ],
									"text" : "j.oscroute /file"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Verdana",
									"fontsize" : 10.0,
									"id" : "obj-2",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "int", "", "int" ],
									"patching_rect" : [ 47.0, 113.0, 40.0, 19.0 ],
									"text" : "t 1 l 0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-3",
									"maxclass" : "toggle",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 47.0, 149.0, 15.0, 15.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Verdana",
									"fontsize" : 10.0,
									"id" : "obj-4",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 47.0, 176.0, 101.0, 17.0 ],
									"text" : "/soundfile/play $1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Verdana",
									"fontsize" : 10.0,
									"id" : "obj-5",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 47.0, 84.0, 132.0, 19.0 ],
									"text" : "prepend /soundfile/open"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-6",
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 47.0, 34.0, 15.0, 15.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-7",
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 47.0, 196.0, 15.0, 15.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-2", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-2", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-2", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-3", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
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
									"source" : [ "obj-5", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-6", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 911.0, 131.0, 67.0, 19.0 ],
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
					"text" : "p load_play"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-42",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 7,
							"architecture" : "x86"
						}
,
						"rect" : [ 780.0, 44.0, 202.0, 267.0 ],
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
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 47.0, 57.0, 103.0, 19.0 ],
									"text" : "j.oscroute /file"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Verdana",
									"fontsize" : 10.0,
									"id" : "obj-2",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "int", "", "int" ],
									"patching_rect" : [ 47.0, 113.0, 40.0, 19.0 ],
									"text" : "t 1 l 0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-3",
									"maxclass" : "toggle",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 47.0, 149.0, 15.0, 15.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Verdana",
									"fontsize" : 10.0,
									"id" : "obj-4",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 47.0, 176.0, 101.0, 17.0 ],
									"text" : "/soundfile/play $1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Verdana",
									"fontsize" : 10.0,
									"id" : "obj-5",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 47.0, 84.0, 132.0, 19.0 ],
									"text" : "prepend /soundfile/open"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-6",
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 47.0, 34.0, 15.0, 15.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-7",
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 47.0, 196.0, 15.0, 15.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-2", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-2", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-2", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-3", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
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
									"source" : [ "obj-5", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-6", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 586.0, 131.0, 67.0, 19.0 ],
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
					"text" : "p load_play"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 1.0, 0.52549, 0.05098, 1.0 ],
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"hidden" : 1,
					"id" : "obj-14",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "none" ],
					"patching_rect" : [ 143.106232, 674.501831, 41.0, 19.0 ],
					"text" : "t none"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 1.0, 0.52549, 0.05098, 1.0 ],
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"hidden" : 1,
					"id" : "obj-19",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 87.0, 675.0, 53.369965, 19.0 ],
					"text" : "hover"
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
							"revision" : 7,
							"architecture" : "x86"
						}
,
						"rect" : [ 780.0, 44.0, 202.0, 267.0 ],
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
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 47.0, 57.0, 103.0, 19.0 ],
									"text" : "j.oscroute /file"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Verdana",
									"fontsize" : 10.0,
									"id" : "obj-2",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "int", "", "int" ],
									"patching_rect" : [ 47.0, 113.0, 40.0, 19.0 ],
									"text" : "t 1 l 0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-3",
									"maxclass" : "toggle",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 47.0, 149.0, 15.0, 15.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Verdana",
									"fontsize" : 10.0,
									"id" : "obj-4",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 47.0, 176.0, 101.0, 17.0 ],
									"text" : "/soundfile/play $1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Verdana",
									"fontsize" : 10.0,
									"id" : "obj-5",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 47.0, 84.0, 132.0, 19.0 ],
									"text" : "prepend /soundfile/open"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-6",
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 47.0, 34.0, 15.0, 15.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-7",
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 47.0, 196.0, 15.0, 15.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-2", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-2", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-2", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-3", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
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
									"source" : [ "obj-5", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-6", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 261.0, 132.0, 67.0, 19.0 ],
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
					"text" : "p load_play"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 12.0,
					"frgb" : 0.0,
					"id" : "obj-43",
					"linecount" : 10,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 15.0, 85.0, 200.0, 152.0 ],
					"presentation" : 1,
					"presentation_linecount" : 7,
					"presentation_rect" : [ 6.0, 183.0, 256.0, 109.0 ],
					"text" : "Notice the subpatch \"mappers\" below, where you can map several data flows, as the mouse position, or audio amplitudes of any module. \nFor further \nexplanation, \nuse mapperContinuous.module.maxhelp"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 14.0,
					"frgb" : 0.0,
					"id" : "obj-41",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 15.0, 35.0, 187.0, 41.0 ],
					"presentation" : 1,
					"presentation_linecount" : 2,
					"presentation_rect" : [ 8.0, 74.0, 245.0, 41.0 ],
					"text" : "This is a quite big patch, organized in \"tracks\""
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"frgb" : 0.0,
					"id" : "obj-36",
					"linecount" : 3,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 123.0, 514.0, 73.0, 43.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 32.0, 329.0, 163.0, 19.0 ],
					"text" : "unmutes all modules  in a row"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"hidden" : 1,
					"id" : "obj-34",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 15.0, 491.0, 32.5, 19.0 ],
					"text" : "gate"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-33",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 15.0, 445.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 7.0, 307.0, 20.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"frgb" : 0.0,
					"id" : "obj-32",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 40.0, 445.0, 165.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 35.0, 309.0, 165.0, 19.0 ],
					"text" : "use the mouse as a global gain"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"hidden" : 1,
					"id" : "obj-17",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 15.0, 415.0, 121.0, 19.0 ],
					"text" : "scale 0. 1. 50. 110."
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"hidden" : 1,
					"id" : "obj-5",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 15.0, 390.0, 137.0, 19.0 ],
					"text" : "j.oscroute /position/x"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"hidden" : 1,
					"id" : "obj-2",
					"linecount" : 2,
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 15.0, 592.0, 132.0, 31.0 ],
					"text" : "j.send j.remote.module.to"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-10",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 98.0, 524.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 7.0, 328.0, 20.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-8",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 98.0, 559.0, 98.0, 17.0 ],
					"text" : "/*/audio/mute $1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-7",
					"linecount" : 2,
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 15.0, 551.0, 81.0, 29.0 ],
					"text" : "/*/audio/gain $1 ramp 100"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-6",
					"maxclass" : "number",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "int", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 15.0, 521.0, 50.0, 19.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 18.0,
					"id" : "obj-116",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 0,
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 1,
							"revision" : 7,
							"architecture" : "x86"
						}
,
						"rect" : [ 27.0, 59.0, 1231.0, 612.0 ],
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
									"args" : [ "/mapper.16" ],
									"id" : "obj-9",
									"lockeddragscroll" : 1,
									"maxclass" : "bpatcher",
									"name" : "mapperContinuous.module.maxpat",
									"numinlets" : 0,
									"numoutlets" : 0,
									"patching_rect" : [ 620.0, 535.0, 600.0, 70.0 ],
									"presentation_rect" : [ 0.0, 0.0, 600.0, 70.0 ],
									"varname" : "/mapper[9]"
								}

							}
, 							{
								"box" : 								{
									"args" : [ "/mapper.15" ],
									"id" : "obj-10",
									"lockeddragscroll" : 1,
									"maxclass" : "bpatcher",
									"name" : "mapperContinuous.module.maxpat",
									"numinlets" : 0,
									"numoutlets" : 0,
									"patching_rect" : [ 620.0, 460.0, 600.0, 70.0 ],
									"presentation_rect" : [ 0.0, 0.0, 600.0, 70.0 ],
									"varname" : "/mapper[10]"
								}

							}
, 							{
								"box" : 								{
									"args" : [ "/mapper.14" ],
									"id" : "obj-11",
									"lockeddragscroll" : 1,
									"maxclass" : "bpatcher",
									"name" : "mapperContinuous.module.maxpat",
									"numinlets" : 0,
									"numoutlets" : 0,
									"patching_rect" : [ 620.0, 385.0, 600.0, 70.0 ],
									"presentation_rect" : [ 0.0, 0.0, 600.0, 70.0 ],
									"varname" : "/mapper[11]"
								}

							}
, 							{
								"box" : 								{
									"args" : [ "/mapper.13" ],
									"id" : "obj-12",
									"lockeddragscroll" : 1,
									"maxclass" : "bpatcher",
									"name" : "mapperContinuous.module.maxpat",
									"numinlets" : 0,
									"numoutlets" : 0,
									"patching_rect" : [ 620.0, 310.0, 600.0, 70.0 ],
									"presentation_rect" : [ 0.0, 0.0, 600.0, 70.0 ],
									"varname" : "/mapper[12]"
								}

							}
, 							{
								"box" : 								{
									"args" : [ "/mapper.12" ],
									"id" : "obj-13",
									"lockeddragscroll" : 1,
									"maxclass" : "bpatcher",
									"name" : "mapperContinuous.module.maxpat",
									"numinlets" : 0,
									"numoutlets" : 0,
									"patching_rect" : [ 620.0, 235.0, 600.0, 70.0 ],
									"presentation_rect" : [ 0.0, 0.0, 600.0, 70.0 ],
									"varname" : "/mapper[13]"
								}

							}
, 							{
								"box" : 								{
									"args" : [ "/mapper.11" ],
									"id" : "obj-14",
									"lockeddragscroll" : 1,
									"maxclass" : "bpatcher",
									"name" : "mapperContinuous.module.maxpat",
									"numinlets" : 0,
									"numoutlets" : 0,
									"patching_rect" : [ 620.0, 160.0, 600.0, 70.0 ],
									"presentation_rect" : [ 0.0, 0.0, 600.0, 70.0 ],
									"varname" : "/mapper[14]"
								}

							}
, 							{
								"box" : 								{
									"args" : [ "/mapper.10" ],
									"id" : "obj-15",
									"lockeddragscroll" : 1,
									"maxclass" : "bpatcher",
									"name" : "mapperContinuous.module.maxpat",
									"numinlets" : 0,
									"numoutlets" : 0,
									"patching_rect" : [ 620.0, 85.0, 600.0, 70.0 ],
									"presentation_rect" : [ 0.0, 0.0, 600.0, 70.0 ],
									"varname" : "/mapper[15]"
								}

							}
, 							{
								"box" : 								{
									"args" : [ "/mapper.9" ],
									"id" : "obj-16",
									"lockeddragscroll" : 1,
									"maxclass" : "bpatcher",
									"name" : "mapperContinuous.module.maxpat",
									"numinlets" : 0,
									"numoutlets" : 0,
									"patching_rect" : [ 620.0, 10.0, 600.0, 70.0 ],
									"presentation_rect" : [ 0.0, 0.0, 600.0, 70.0 ],
									"varname" : "/mapper[16]"
								}

							}
, 							{
								"box" : 								{
									"args" : [ "/mapper.8" ],
									"id" : "obj-8",
									"lockeddragscroll" : 1,
									"maxclass" : "bpatcher",
									"name" : "mapperContinuous.module.maxpat",
									"numinlets" : 0,
									"numoutlets" : 0,
									"patching_rect" : [ 10.0, 535.0, 600.0, 70.0 ],
									"presentation_rect" : [ 0.0, 0.0, 600.0, 70.0 ],
									"varname" : "/mapper[8]"
								}

							}
, 							{
								"box" : 								{
									"args" : [ "/mapper.7" ],
									"id" : "obj-7",
									"lockeddragscroll" : 1,
									"maxclass" : "bpatcher",
									"name" : "mapperContinuous.module.maxpat",
									"numinlets" : 0,
									"numoutlets" : 0,
									"patching_rect" : [ 10.0, 460.0, 600.0, 70.0 ],
									"presentation_rect" : [ 0.0, 0.0, 600.0, 70.0 ],
									"varname" : "/mapper[7]"
								}

							}
, 							{
								"box" : 								{
									"args" : [ "/mapper.6" ],
									"id" : "obj-6",
									"lockeddragscroll" : 1,
									"maxclass" : "bpatcher",
									"name" : "mapperContinuous.module.maxpat",
									"numinlets" : 0,
									"numoutlets" : 0,
									"patching_rect" : [ 10.0, 385.0, 600.0, 70.0 ],
									"presentation_rect" : [ 0.0, 0.0, 600.0, 70.0 ],
									"varname" : "/mapper[6]"
								}

							}
, 							{
								"box" : 								{
									"args" : [ "/mapper.5" ],
									"id" : "obj-5",
									"lockeddragscroll" : 1,
									"maxclass" : "bpatcher",
									"name" : "mapperContinuous.module.maxpat",
									"numinlets" : 0,
									"numoutlets" : 0,
									"patching_rect" : [ 10.0, 310.0, 600.0, 70.0 ],
									"presentation_rect" : [ 0.0, 0.0, 600.0, 70.0 ],
									"varname" : "/mapper[5]"
								}

							}
, 							{
								"box" : 								{
									"args" : [ "/mapper.4" ],
									"id" : "obj-4",
									"lockeddragscroll" : 1,
									"maxclass" : "bpatcher",
									"name" : "mapperContinuous.module.maxpat",
									"numinlets" : 0,
									"numoutlets" : 0,
									"patching_rect" : [ 10.0, 235.0, 600.0, 70.0 ],
									"presentation_rect" : [ 0.0, 0.0, 600.0, 70.0 ],
									"varname" : "/mapper[4]"
								}

							}
, 							{
								"box" : 								{
									"args" : [ "/mapper.3" ],
									"id" : "obj-3",
									"lockeddragscroll" : 1,
									"maxclass" : "bpatcher",
									"name" : "mapperContinuous.module.maxpat",
									"numinlets" : 0,
									"numoutlets" : 0,
									"patching_rect" : [ 10.0, 160.0, 600.0, 70.0 ],
									"presentation_rect" : [ 0.0, 0.0, 600.0, 70.0 ],
									"varname" : "/mapper[3]"
								}

							}
, 							{
								"box" : 								{
									"args" : [ "/mapper.2" ],
									"id" : "obj-2",
									"lockeddragscroll" : 1,
									"maxclass" : "bpatcher",
									"name" : "mapperContinuous.module.maxpat",
									"numinlets" : 0,
									"numoutlets" : 0,
									"patching_rect" : [ 10.0, 85.0, 600.0, 70.0 ],
									"presentation_rect" : [ 0.0, 0.0, 600.0, 70.0 ],
									"varname" : "/mapper[2]"
								}

							}
, 							{
								"box" : 								{
									"args" : [ "/mapper.1" ],
									"id" : "obj-1",
									"lockeddragscroll" : 1,
									"maxclass" : "bpatcher",
									"name" : "mapperContinuous.module.maxpat",
									"numinlets" : 0,
									"numoutlets" : 0,
									"patching_rect" : [ 10.0, 10.0, 600.0, 70.0 ],
									"presentation_rect" : [ 0.0, 0.0, 600.0, 70.0 ],
									"varname" : "/mapper[1]"
								}

							}
 ],
						"lines" : [  ]
					}
,
					"patching_rect" : [ 70.0, 820.0, 105.0, 28.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 97.0, 244.0, 105.0, 28.0 ],
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
					"text" : "p mappers"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-8", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-10", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-25", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-13", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-34", 1 ],
					"disabled" : 0,
					"hidden" : 1,
					"midpoints" : [ 24.5, 439.0, 38.0, 439.0 ],
					"source" : [ "obj-17", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-28", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 60.5, 501.0, 60.0, 501.0, 60.0, 505.0, 214.0, 505.0, 214.0, 306.0, 24.5, 306.0 ],
					"source" : [ "obj-18", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-14", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-19", 2 ]
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
					"destination" : [ "obj-42", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-22", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-49", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-24", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-49", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-24", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-26", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-25", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-26", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-25", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-37", 2 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-26", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-37", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-26", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-37", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-26", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-44", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-27", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"disabled" : 0,
					"hidden" : 1,
					"source" : [ "obj-28", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-20", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-3", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-22", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-3", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-27", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-3", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-30", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-3", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-45", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-30", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-18", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-33", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-34", 0 ],
					"disabled" : 0,
					"hidden" : 1,
					"source" : [ "obj-33", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"disabled" : 0,
					"hidden" : 1,
					"source" : [ "obj-34", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-24", 2 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-37", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-24", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-37", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-24", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-37", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-46", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-38", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-47", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-40", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-54", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-42", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-60", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-44", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-66", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-45", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-72", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-46", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-78", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-47", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-17", 0 ],
					"disabled" : 0,
					"hidden" : 1,
					"source" : [ "obj-5", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-49", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-52", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-49", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-52", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-52", 2 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-53", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-52", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-53", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-52", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-53", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-55", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-54", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-55", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-54", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-53", 2 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-55", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-53", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-55", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-53", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-55", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-49", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-58", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-49", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-58", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-58", 2 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-59", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-58", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-59", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-6", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-61", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-60", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-61", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-60", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-59", 2 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-61", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-59", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-61", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-49", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-64", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-49", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-64", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-64", 2 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-65", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-64", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-65", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-64", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-65", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-67", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-66", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-67", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-66", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-65", 2 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-67", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-65", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-67", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-65", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-67", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"disabled" : 0,
					"hidden" : 1,
					"source" : [ "obj-7", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-49", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-70", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-49", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-70", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-70", 2 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-71", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-70", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-71", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-70", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-71", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-73", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-72", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-73", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-72", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-71", 2 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-73", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-71", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-73", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-71", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-73", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-49", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-76", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-49", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-76", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-76", 2 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-77", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-76", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-77", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-76", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-77", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-79", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-78", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-79", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-78", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-77", 2 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-79", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-77", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-79", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-77", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-79", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"disabled" : 0,
					"hidden" : 1,
					"midpoints" : [ 107.5, 584.0, 24.5, 584.0 ],
					"source" : [ "obj-8", 0 ]
				}

			}
 ],
		"dependency_cache" : [ 			{
				"name" : "multidelay~.module.maxpat",
				"bootpath" : "/Users/reno/Documents/GITs/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/multidelay~",
				"patcherrelativepath" : "../../patchers/modules/audio/multidelay~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "multidelay~.model.maxpat",
				"bootpath" : "/Users/reno/Documents/GITs/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/multidelay~",
				"patcherrelativepath" : "../../patchers/modules/audio/multidelay~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "multidelay~.view.maxpat",
				"bootpath" : "/Users/reno/Documents/GITs/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/multidelay~",
				"patcherrelativepath" : "../../patchers/modules/audio/multidelay~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "saturation~.module.maxpat",
				"bootpath" : "/Users/reno/Documents/GITs/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/saturation~",
				"patcherrelativepath" : "../../patchers/modules/audio/saturation~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "saturation~.model.maxpat",
				"bootpath" : "/Users/reno/Documents/GITs/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/saturation~",
				"patcherrelativepath" : "../../patchers/modules/audio/saturation~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "saturation~.view.maxpat",
				"bootpath" : "/Users/reno/Documents/GITs/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/saturation~",
				"patcherrelativepath" : "../../patchers/modules/audio/saturation~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "fileBrowser.module.maxpat",
				"bootpath" : "/Users/reno/Documents/GITs/Jamoma/Implementations/Max/Jamoma/patchers/modules/control/fileBrowser",
				"patcherrelativepath" : "../../patchers/modules/control/fileBrowser",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "fileBrowser.model.maxpat",
				"bootpath" : "/Users/reno/Documents/GITs/Jamoma/Implementations/Max/Jamoma/patchers/modules/control/fileBrowser",
				"patcherrelativepath" : "../../patchers/modules/control/fileBrowser",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "fileBrowser.view.maxpat",
				"bootpath" : "/Users/reno/Documents/GITs/Jamoma/Implementations/Max/Jamoma/patchers/modules/control/fileBrowser",
				"patcherrelativepath" : "../../patchers/modules/control/fileBrowser",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "input~.module.maxpat",
				"bootpath" : "/Users/reno/Documents/GITs/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/input~",
				"patcherrelativepath" : "../../patchers/modules/audio/input~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "input~.view.maxpat",
				"bootpath" : "/Users/reno/Documents/GITs/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/input~",
				"patcherrelativepath" : "../../patchers/modules/audio/input~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "input~.model.maxpat",
				"bootpath" : "/Users/reno/Documents/GITs/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/input~",
				"patcherrelativepath" : "../../patchers/modules/audio/input~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.fileLoader.maxpat",
				"bootpath" : "/Users/reno/Documents/GITs/Jamoma/Implementations/Max/Jamoma/patchers/components/_deprecated/fileLoader",
				"patcherrelativepath" : "../../patchers/components/_deprecated/fileLoader",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "thru.maxpat",
				"bootpath" : "/Applications/Max 6.1/patches/m4l-patches/Pluggo for Live resources/patches",
				"patcherrelativepath" : "../../../../../../../../../../Applications/Max 6.1/patches/m4l-patches/Pluggo for Live resources/patches",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "balance~.model.maxpat",
				"bootpath" : "/Users/reno/Documents/GITs/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/balance~",
				"patcherrelativepath" : "../../patchers/modules/audio/balance~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "filter~.module.maxpat",
				"bootpath" : "/Users/reno/Documents/GITs/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/filter~",
				"patcherrelativepath" : "../../patchers/modules/audio/filter~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "filter~.model.maxpat",
				"bootpath" : "/Users/reno/Documents/GITs/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/filter~",
				"patcherrelativepath" : "../../patchers/modules/audio/filter~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "filter~.view.maxpat",
				"bootpath" : "/Users/reno/Documents/GITs/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/filter~",
				"patcherrelativepath" : "../../patchers/modules/audio/filter~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "output~.module.maxpat",
				"bootpath" : "/Users/reno/Documents/GITs/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/output~",
				"patcherrelativepath" : "../../patchers/modules/audio/output~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "output~.model.maxpat",
				"bootpath" : "/Users/reno/Documents/GITs/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/output~",
				"patcherrelativepath" : "../../patchers/modules/audio/output~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "limiter~.model.maxpat",
				"bootpath" : "/Users/reno/Documents/GITs/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/limiter~",
				"patcherrelativepath" : "../../patchers/modules/audio/limiter~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "limiter.parametersAndMessages.maxpat",
				"bootpath" : "/Users/reno/Documents/GITs/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/limiter~",
				"patcherrelativepath" : "../../patchers/modules/audio/limiter~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "record~.model.maxpat",
				"bootpath" : "/Users/reno/Documents/GITs/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/record~",
				"patcherrelativepath" : "../../patchers/modules/audio/record~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "record.parametersAndMessages.maxpat",
				"bootpath" : "/Users/reno/Documents/GITs/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/record~",
				"patcherrelativepath" : "../../patchers/modules/audio/record~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "output~.view.maxpat",
				"bootpath" : "/Users/reno/Documents/GITs/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/output~",
				"patcherrelativepath" : "../../patchers/modules/audio/output~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.js_systeminfo.js",
				"bootpath" : "/Users/reno/Documents/GITs/Jamoma/Implementations/Max/Jamoma/javascript",
				"patcherrelativepath" : "../../javascript",
				"type" : "TEXT",
				"implicit" : 1
			}
, 			{
				"name" : "",
				"bootpath" : "/",
				"patcherrelativepath" : "../../../../../../../../../..",
				"type" : "fold",
				"implicit" : 1
			}
, 			{
				"name" : "mouse.module.maxpat",
				"bootpath" : "/Users/reno/Documents/GITs/Jamoma/Implementations/Max/Jamoma/patchers/modules/control/mouse",
				"patcherrelativepath" : "../../patchers/modules/control/mouse",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "mouse.model.maxpat",
				"bootpath" : "/Users/reno/Documents/GITs/Jamoma/Implementations/Max/Jamoma/patchers/modules/control/mouse",
				"patcherrelativepath" : "../../patchers/modules/control/mouse",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "mouse.view.maxpat",
				"bootpath" : "/Users/reno/Documents/GITs/Jamoma/Implementations/Max/Jamoma/patchers/modules/control/mouse",
				"patcherrelativepath" : "../../patchers/modules/control/mouse",
				"type" : "JSON",
				"implicit" : 1
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
				"name" : "j.limiter~.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.model.mxo",
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
				"name" : "j.overdrive~.mxo",
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
, 			{
				"name" : "j.message.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.return.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.pass.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.panorama~.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.receive.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.stats.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.init.mxo",
				"type" : "iLaX"
			}
 ]
	}

}
