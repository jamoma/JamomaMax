{
	"patcher" : 	{
		"fileversion" : 1,
		"rect" : [ 64.0, 47.0, 806.0, 473.0 ],
		"bglocked" : 0,
		"defrect" : [ 64.0, 47.0, 806.0, 473.0 ],
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
					"maxclass" : "message",
					"text" : "/is/osc/on/your/diet? not yet",
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 570.0, 180.0, 156.0, 17.0 ],
					"id" : "obj-5",
					"fontname" : "Verdana",
					"outlettype" : [ "" ],
					"fontsize" : 10.0,
					"presentation_rect" : [ 570.0, 179.0, 0.0, 0.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "/is/osc/on/your/diet?",
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 440.0, 180.0, 117.0, 17.0 ],
					"id" : "obj-4",
					"fontname" : "Verdana",
					"outlettype" : [ "" ],
					"fontsize" : 10.0,
					"presentation_rect" : [ 445.0, 182.0, 0.0, 0.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "udpsend 127.0.0.1 9090",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 440.0, 210.0, 135.0, 19.0 ],
					"id" : "obj-2",
					"fontname" : "Verdana",
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "where's my net?",
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 260.0, 135.0, 93.0, 17.0 ],
					"id" : "obj-32",
					"fontname" : "Verdana",
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "or we can be fancy and use our own object to receive the messages.",
					"linecount" : 3,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 285.0, 325.0, 129.0, 43.0 ],
					"id" : "obj-27",
					"fontname" : "Verdana",
					"frgb" : [ 0.658824, 0.658824, 0.658824, 1.0 ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "wow",
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 285.0, 400.0, 157.0, 17.0 ],
					"id" : "obj-24",
					"fontname" : "Verdana",
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "jcom.net.receive @port 9090 @mode udp",
					"numinlets" : 1,
					"numoutlets" : 2,
					"patching_rect" : [ 285.0, 370.0, 221.0, 19.0 ],
					"id" : "obj-23",
					"fontname" : "Verdana",
					"outlettype" : [ "", "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "hangin' loose bros.",
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 130.0, 135.0, 106.0, 17.0 ],
					"id" : "obj-8",
					"fontname" : "Verdana",
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "prepend send",
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 80.0, 180.0, 79.0, 19.0 ],
					"id" : "obj-7",
					"fontname" : "Verdana",
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "wow",
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 80.0, 135.0, 33.0, 17.0 ],
					"id" : "obj-3",
					"fontname" : "Verdana",
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "jcom.net.send @address 127.0.0.1 @port 9090 @mode udp",
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 80.0, 210.0, 314.0, 19.0 ],
					"id" : "obj-1",
					"fontname" : "Verdana",
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "bpatcher",
					"numinlets" : 1,
					"args" : [ "@name", "jcom.net.receive", "@description", "receive data via a network socket" ],
					"numoutlets" : 0,
					"patching_rect" : [ 0.0, 0.0, 918.0, 70.0 ],
					"bgmode" : 1,
					"id" : "obj-14",
					"name" : "jcom.maxhelpui.maxpat"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"source" : [ "obj-5", 0 ],
					"destination" : [ "obj-2", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-4", 0 ],
					"destination" : [ "obj-2", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-23", 0 ],
					"destination" : [ "obj-24", 1 ],
					"hidden" : 0,
					"midpoints" : [ 294.5, 396.0, 432.5, 396.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-7", 0 ],
					"destination" : [ "obj-1", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-3", 0 ],
					"destination" : [ "obj-7", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-8", 0 ],
					"destination" : [ "obj-7", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-32", 0 ],
					"destination" : [ "obj-7", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
 ]
	}

}
