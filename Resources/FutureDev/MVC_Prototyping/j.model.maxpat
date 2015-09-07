{
	"patcher" : 	{
		"fileversion" : 1,
		"rect" : [ 88.0, 46.0, 559.0, 552.0 ],
		"bglocked" : 0,
		"defrect" : [ 88.0, 46.0, 559.0, 552.0 ],
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
		"metadata" : [  ],
		"boxes" : [ 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "the information for the hub could be placed inside of the model ??? -> j.hubinfo",
					"presentation_rect" : [ 67.0, 481.0, 0.0, 0.0 ],
					"fontname" : "Verdana",
					"id" : "obj-2",
					"numinlets" : 1,
					"patching_rect" : [ 75.0, 495.0, 434.0, 19.0 ],
					"numoutlets" : 0,
					"fontsize" : 10.0,
					"frgb" : [ 0.933333, 0.937255, 0.968627, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "The hub, other than being located in the model, is essentially unchanged at the moment.  The hub is, in fact, the entry-point by which a controller communicates with a model.",
					"linecount" : 3,
					"fontname" : "Verdana",
					"id" : "obj-21",
					"numinlets" : 1,
					"patching_rect" : [ 70.0, 365.0, 418.0, 43.0 ],
					"numoutlets" : 0,
					"fontsize" : 10.0,
					"frgb" : [ 0.933333, 0.937255, 0.968627, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "/preset/recall 1",
					"fontname" : "Verdana",
					"id" : "obj-23",
					"numinlets" : 2,
					"patching_rect" : [ 360.0, 420.0, 89.0, 17.0 ],
					"numoutlets" : 1,
					"fontsize" : 10.0,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "/preset/post",
					"fontname" : "Verdana",
					"id" : "obj-24",
					"numinlets" : 2,
					"patching_rect" : [ 285.0, 420.0, 71.0, 17.0 ],
					"numoutlets" : 1,
					"fontsize" : 10.0,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "/documentation/generate",
					"fontname" : "Verdana",
					"id" : "obj-27",
					"numinlets" : 2,
					"patching_rect" : [ 80.0, 420.0, 137.0, 17.0 ],
					"numoutlets" : 1,
					"fontsize" : 10.0,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"varname" : "j.hub",
					"text" : "j.hub @description \"report data from model\"",
					"fontname" : "Verdana",
					"id" : "obj-52",
					"numinlets" : 1,
					"patching_rect" : [ 80.0, 460.0, 309.0, 19.0 ],
					"numoutlets" : 2,
					"fontsize" : 10.0,
					"outlettype" : [ "", "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "/init",
					"fontname" : "Verdana",
					"id" : "obj-55",
					"numinlets" : 2,
					"patching_rect" : [ 220.0, 420.0, 39.0, 17.0 ],
					"numoutlets" : 1,
					"fontsize" : 10.0,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"id" : "obj-22",
					"numinlets" : 1,
					"patching_rect" : [ 60.0, 355.0, 434.0, 133.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "all this could be included in j.in(~) ?",
					"linecount" : 2,
					"fontname" : "Verdana",
					"id" : "obj-15",
					"numinlets" : 1,
					"patching_rect" : [ 170.0, 140.0, 131.0, 31.0 ],
					"numoutlets" : 0,
					"fontsize" : 10.0,
					"frgb" : [ 0.933333, 0.937255, 0.968627, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "<- multichannel outlet",
					"fontname" : "Verdana",
					"id" : "obj-13",
					"numinlets" : 1,
					"patching_rect" : [ 100.0, 250.0, 124.0, 19.0 ],
					"numoutlets" : 0,
					"fontsize" : 10.0,
					"frgb" : [ 0.933333, 0.937255, 0.968627, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "outlet",
					"id" : "obj-12",
					"numinlets" : 1,
					"patching_rect" : [ 75.0, 250.0, 25.0, 25.0 ],
					"numoutlets" : 0,
					"comment" : ""
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "<- multichannel inlet",
					"fontname" : "Verdana",
					"id" : "obj-11",
					"numinlets" : 1,
					"patching_rect" : [ 105.0, 45.0, 116.0, 19.0 ],
					"numoutlets" : 0,
					"fontsize" : 10.0,
					"frgb" : [ 0.933333, 0.937255, 0.968627, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "inlet",
					"id" : "obj-10",
					"numinlets" : 0,
					"patching_rect" : [ 75.0, 45.0, 25.0, 25.0 ],
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"comment" : ""
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "1st argument : (nOSC)name of the model, \n2d argument : filename of the model,\n2d argument :  number of channels, \n3d argument : description",
					"linecount" : 4,
					"fontname" : "Verdana",
					"id" : "obj-4",
					"numinlets" : 1,
					"patching_rect" : [ 70.0, 285.0, 234.0, 55.0 ],
					"numoutlets" : 0,
					"fontsize" : 10.0,
					"frgb" : [ 0.933333, 0.937255, 0.968627, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "poly~ #2 #3",
					"fontname" : "Verdana",
					"id" : "obj-1",
					"numinlets" : 1,
					"patching_rect" : [ 75.0, 180.0, 148.0, 19.0 ],
					"numoutlets" : 1,
					"fontsize" : 10.0,
					"outlettype" : [ "signal" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "pcontrol",
					"fontname" : "Verdana",
					"id" : "obj-74",
					"numinlets" : 1,
					"patching_rect" : [ 120.0, 140.0, 49.0, 19.0 ],
					"numoutlets" : 1,
					"fontsize" : 10.0,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "j.algorithm_control~",
					"fontname" : "Verdana",
					"id" : "obj-75",
					"numinlets" : 1,
					"patching_rect" : [ 105.0, 110.0, 136.0, 19.0 ],
					"numoutlets" : 2,
					"fontsize" : 10.0,
					"outlettype" : [ "", "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "j.out~ #3",
					"fontname" : "Verdana",
					"id" : "obj-73",
					"numinlets" : 5,
					"patching_rect" : [ 75.0, 220.0, 122.0, 19.0 ],
					"numoutlets" : 6,
					"fontsize" : 10.0,
					"outlettype" : [ "signal", "signal", "signal", "signal", "signal", "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "j.in~ #3",
					"fontname" : "Verdana",
					"id" : "obj-72",
					"numinlets" : 5,
					"patching_rect" : [ 75.0, 80.0, 115.0, 19.0 ],
					"numoutlets" : 7,
					"fontsize" : 10.0,
					"outlettype" : [ "signal", "signal", "signal", "signal", "signal", "", "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"id" : "obj-14",
					"numinlets" : 1,
					"patching_rect" : [ 100.0, 105.0, 208.0, 66.0 ],
					"numoutlets" : 0
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"source" : [ "obj-1", 0 ],
					"destination" : [ "obj-73", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-73", 0 ],
					"destination" : [ "obj-12", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-72", 0 ],
					"destination" : [ "obj-1", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-72", 1 ],
					"destination" : [ "obj-75", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-10", 0 ],
					"destination" : [ "obj-72", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-23", 0 ],
					"destination" : [ "obj-52", 0 ],
					"hidden" : 0,
					"midpoints" : [ 369.5, 451.0, 89.5, 451.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-24", 0 ],
					"destination" : [ "obj-52", 0 ],
					"hidden" : 0,
					"midpoints" : [ 294.5, 446.0, 89.5, 446.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-27", 0 ],
					"destination" : [ "obj-52", 0 ],
					"hidden" : 0,
					"midpoints" : [ 89.5, 443.454529, 89.5, 443.454529 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-55", 0 ],
					"destination" : [ "obj-52", 0 ],
					"hidden" : 0,
					"midpoints" : [ 229.5, 442.454529, 89.5, 442.454529 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-75", 1 ],
					"destination" : [ "obj-74", 0 ],
					"hidden" : 0,
					"midpoints" : [ 231.5, 135.0, 129.5, 135.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-74", 0 ],
					"destination" : [ "obj-1", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
 ]
	}

}
