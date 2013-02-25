{
	"patcher" : 	{
		"fileversion" : 1,
		"rect" : [ 29.0, 69.0, 764.0, 604.0 ],
		"bglocked" : 0,
		"defrect" : [ 29.0, 69.0, 764.0, 604.0 ],
		"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
		"openinpresentation" : 0,
		"default_fontsize" : 13.0,
		"default_fontface" : 0,
		"default_fontname" : "Helvetica Neue Light",
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
					"maxclass" : "newobj",
					"text" : "pack 0 0 1",
					"fontsize" : 13.0,
					"numinlets" : 3,
					"patching_rect" : [ 90.0, 160.0, 72.0, 22.0 ],
					"id" : "obj-33",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontname" : "Helvetica Neue Light"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "makenote 100 500",
					"fontsize" : 13.0,
					"numinlets" : 3,
					"patching_rect" : [ 90.0, 125.0, 119.0, 22.0 ],
					"id" : "obj-32",
					"numoutlets" : 2,
					"outlettype" : [ "float", "float" ],
					"fontname" : "Helvetica Neue Light"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "kslider",
					"numinlets" : 2,
					"patching_rect" : [ 90.0, 65.0, 336.0, 53.0 ],
					"id" : "obj-31",
					"numoutlets" : 2,
					"outlettype" : [ "int", "int" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "jcom.pack#",
					"fontsize" : 13.0,
					"numinlets" : 1,
					"patching_rect" : [ 90.0, 195.0, 78.0, 22.0 ],
					"id" : "obj-30",
					"numoutlets" : 2,
					"outlettype" : [ "graph.connect", "" ],
					"fontname" : "Helvetica Neue Light"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "jcom.append# @key schema @value MidiNoteEvent",
					"linecount" : 2,
					"fontsize" : 13.0,
					"numinlets" : 1,
					"patching_rect" : [ 90.0, 225.0, 178.0, 38.0 ],
					"id" : "obj-29",
					"numoutlets" : 2,
					"outlettype" : [ "graph.connect", "" ],
					"fontname" : "Helvetica Neue Light"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "jcom.midi.format#",
					"fontsize" : 13.0,
					"numinlets" : 1,
					"patching_rect" : [ 90.0, 330.0, 114.0, 22.0 ],
					"id" : "obj-19",
					"numoutlets" : 2,
					"outlettype" : [ "graph.connect", "" ],
					"fontname" : "Helvetica Neue Light"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "print",
					"fontsize" : 13.0,
					"numinlets" : 1,
					"patching_rect" : [ 540.0, 310.0, 36.0, 22.0 ],
					"id" : "obj-28",
					"numoutlets" : 0,
					"fontname" : "Helvetica Neue Light"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadbang",
					"fontsize" : 13.0,
					"numinlets" : 1,
					"patching_rect" : [ 265.0, 290.0, 64.0, 22.0 ],
					"id" : "obj-3",
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"fontname" : "Helvetica Neue Light"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "route getAvailableDeviceNames",
					"fontsize" : 13.0,
					"numinlets" : 1,
					"patching_rect" : [ 160.0, 475.0, 192.0, 22.0 ],
					"id" : "obj-16",
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"fontname" : "Helvetica Neue Light"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "umenu",
					"items" : [ "to MaxMSP 1", ",", "to MaxMSP 2" ],
					"fontsize" : 13.0,
					"types" : [  ],
					"numinlets" : 1,
					"patching_rect" : [ 180.0, 390.0, 181.0, 22.0 ],
					"id" : "obj-20",
					"rounded" : 19,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"fontname" : "Helvetica Neue Light"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t getAvailableDeviceNames clear",
					"fontsize" : 13.0,
					"numinlets" : 1,
					"patching_rect" : [ 265.0, 340.0, 197.0, 22.0 ],
					"id" : "obj-22",
					"numoutlets" : 2,
					"outlettype" : [ "", "clear" ],
					"fontname" : "Helvetica Neue Light"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"numinlets" : 1,
					"patching_rect" : [ 265.0, 315.0, 20.0, 20.0 ],
					"id" : "obj-23",
					"numoutlets" : 1,
					"outlettype" : [ "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "iter",
					"fontsize" : 13.0,
					"numinlets" : 1,
					"patching_rect" : [ 160.0, 505.0, 28.0, 22.0 ],
					"id" : "obj-24",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontname" : "Helvetica Neue Light"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "prepend append",
					"fontsize" : 13.0,
					"numinlets" : 1,
					"patching_rect" : [ 160.0, 530.0, 106.0, 22.0 ],
					"id" : "obj-25",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontname" : "Helvetica Neue Light"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "jcom.midi.out#",
					"fontsize" : 13.0,
					"numinlets" : 1,
					"patching_rect" : [ 90.0, 445.0, 95.0, 22.0 ],
					"id" : "obj-26",
					"numoutlets" : 2,
					"outlettype" : [ "graph.connect", "" ],
					"fontname" : "Helvetica Neue Light"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "device $1",
					"fontsize" : 13.0,
					"numinlets" : 2,
					"patching_rect" : [ 180.0, 420.0, 64.0, 20.0 ],
					"id" : "obj-27",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontname" : "Helvetica Neue Light"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"fontsize" : 13.0,
					"numinlets" : 1,
					"patching_rect" : [ 660.0, 275.0, 50.0, 22.0 ],
					"id" : "obj-18",
					"numoutlets" : 2,
					"outlettype" : [ "int", "bang" ],
					"fontname" : "Helvetica Neue Light"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"fontsize" : 13.0,
					"numinlets" : 1,
					"patching_rect" : [ 600.0, 275.0, 50.0, 22.0 ],
					"id" : "obj-17",
					"numoutlets" : 2,
					"outlettype" : [ "int", "bang" ],
					"fontname" : "Helvetica Neue Light"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"fontsize" : 13.0,
					"numinlets" : 1,
					"patching_rect" : [ 540.0, 275.0, 50.0, 22.0 ],
					"id" : "obj-9",
					"numoutlets" : 2,
					"outlettype" : [ "int", "bang" ],
					"fontname" : "Helvetica Neue Light"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "notein",
					"fontsize" : 13.0,
					"numinlets" : 1,
					"patching_rect" : [ 540.0, 250.0, 139.0, 22.0 ],
					"id" : "obj-2",
					"numoutlets" : 3,
					"outlettype" : [ "int", "int", "int" ],
					"fontname" : "Helvetica Neue Light"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"source" : [ "obj-32", 1 ],
					"destination" : [ "obj-33", 1 ],
					"hidden" : 0,
					"midpoints" : [ 199.5, 151.0, 126.0, 151.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-33", 0 ],
					"destination" : [ "obj-30", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-32", 0 ],
					"destination" : [ "obj-33", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-31", 1 ],
					"destination" : [ "obj-32", 1 ],
					"hidden" : 0,
					"midpoints" : [ 416.5, 121.0, 149.5, 121.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-31", 0 ],
					"destination" : [ "obj-32", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-29", 0 ],
					"destination" : [ "obj-19", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-30", 0 ],
					"destination" : [ "obj-29", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-19", 0 ],
					"destination" : [ "obj-26", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-2", 2 ],
					"destination" : [ "obj-18", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-2", 1 ],
					"destination" : [ "obj-17", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-2", 0 ],
					"destination" : [ "obj-9", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-22", 1 ],
					"destination" : [ "obj-20", 0 ],
					"hidden" : 0,
					"midpoints" : [ 452.5, 381.0, 189.5, 381.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-23", 0 ],
					"destination" : [ "obj-22", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-24", 0 ],
					"destination" : [ "obj-25", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-25", 0 ],
					"destination" : [ "obj-20", 0 ],
					"hidden" : 0,
					"midpoints" : [ 169.5, 569.0, 403.0, 569.0, 403.0, 385.0, 189.5, 385.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-16", 0 ],
					"destination" : [ "obj-24", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-3", 0 ],
					"destination" : [ "obj-23", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-20", 1 ],
					"destination" : [ "obj-27", 0 ],
					"hidden" : 0,
					"midpoints" : [ 270.5, 415.5, 189.5, 415.5 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-27", 0 ],
					"destination" : [ "obj-26", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-26", 1 ],
					"destination" : [ "obj-16", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-22", 0 ],
					"destination" : [ "obj-26", 0 ],
					"hidden" : 0,
					"midpoints" : [ 274.5, 374.0, 99.5, 374.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-9", 0 ],
					"destination" : [ "obj-28", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
 ]
	}

}
