{
	"patcher" : 	{
		"fileversion" : 1,
		"rect" : [ 257.0, 283.0, 783.0, 412.0 ],
		"bglocked" : 0,
		"defrect" : [ 257.0, 283.0, 783.0, 412.0 ],
		"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
		"openinpresentation" : 0,
		"default_fontsize" : 9.873845,
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
					"maxclass" : "newobj",
					"text" : "thispatcher",
					"fontsize" : 10.0,
					"numinlets" : 1,
					"patching_rect" : [ 20.0, 135.0, 67.0, 19.0 ],
					"id" : "obj-1",
					"fontname" : "Verdana",
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"save" : [ "#N", "thispatcher", ";", "#Q", "end", ";" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "test.finished",
					"fontsize" : 10.0,
					"numinlets" : 1,
					"patching_rect" : [ 20.0, 110.0, 72.0, 19.0 ],
					"id" : "obj-2",
					"fontname" : "Verdana",
					"numoutlets" : 1,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t b b",
					"fontsize" : 10.0,
					"numinlets" : 1,
					"patching_rect" : [ 130.0, 59.0, 40.0, 19.0 ],
					"id" : "obj-3",
					"fontname" : "Verdana",
					"numoutlets" : 2,
					"outlettype" : [ "bang", "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "test.start",
					"fontsize" : 10.0,
					"numinlets" : 1,
					"patching_rect" : [ 130.0, 35.0, 57.0, 19.0 ],
					"id" : "obj-4",
					"fontname" : "Verdana",
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "goof 87 hug me",
					"fontsize" : 10.0,
					"numinlets" : 2,
					"patching_rect" : [ 370.0, 150.0, 101.0, 17.0 ],
					"id" : "obj-5",
					"fontname" : "Verdana",
					"numoutlets" : 1,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "test.assert.equal list_that_starts_with_a_sym_test goof 87 hug me",
					"fontsize" : 10.0,
					"numinlets" : 2,
					"patching_rect" : [ 370.0, 170.0, 350.0, 19.0 ],
					"id" : "obj-6",
					"fontname" : "Verdana",
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "43 a b",
					"fontsize" : 10.0,
					"numinlets" : 2,
					"patching_rect" : [ 311.0, 181.0, 49.0, 17.0 ],
					"id" : "obj-7",
					"fontname" : "Verdana",
					"numoutlets" : 1,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "test.assert.equal list_that_starts_with_a_number_test 43 a b",
					"fontsize" : 10.0,
					"numinlets" : 2,
					"patching_rect" : [ 311.0, 200.0, 320.0, 19.0 ],
					"id" : "obj-8",
					"fontname" : "Verdana",
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "yo!!",
					"fontsize" : 10.0,
					"numinlets" : 2,
					"patching_rect" : [ 265.0, 209.0, 35.0, 17.0 ],
					"id" : "obj-9",
					"fontname" : "Verdana",
					"numoutlets" : 1,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "test.assert.equal sym_test_fail yo! @reverse 1",
					"fontsize" : 10.0,
					"numinlets" : 2,
					"patching_rect" : [ 265.0, 228.0, 246.0, 19.0 ],
					"id" : "obj-10",
					"fontname" : "Verdana",
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "yo!",
					"fontsize" : 10.0,
					"numinlets" : 2,
					"patching_rect" : [ 226.0, 235.0, 31.0, 17.0 ],
					"id" : "obj-11",
					"fontname" : "Verdana",
					"numoutlets" : 1,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "test.assert.equal sym_test yo!",
					"fontsize" : 10.0,
					"numinlets" : 2,
					"patching_rect" : [ 226.0, 254.0, 164.0, 19.0 ],
					"id" : "obj-12",
					"fontname" : "Verdana",
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "23.2",
					"fontsize" : 10.0,
					"numinlets" : 2,
					"patching_rect" : [ 180.0, 260.0, 40.0, 17.0 ],
					"id" : "obj-13",
					"fontname" : "Verdana",
					"numoutlets" : 1,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "test.assert.equal float_test_fail 23.1 @reverse 1",
					"fontsize" : 10.0,
					"numinlets" : 2,
					"patching_rect" : [ 180.0, 280.0, 254.0, 19.0 ],
					"id" : "obj-14",
					"fontname" : "Verdana",
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "23.1",
					"fontsize" : 10.0,
					"numinlets" : 2,
					"patching_rect" : [ 134.0, 288.0, 40.0, 17.0 ],
					"id" : "obj-15",
					"fontname" : "Verdana",
					"numoutlets" : 1,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "test.assert.equal float_test 23.1",
					"fontsize" : 10.0,
					"numinlets" : 2,
					"patching_rect" : [ 134.0, 307.0, 172.0, 19.0 ],
					"id" : "obj-16",
					"fontname" : "Verdana",
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "24",
					"fontsize" : 10.0,
					"numinlets" : 2,
					"patching_rect" : [ 102.0, 315.0, 26.0, 17.0 ],
					"id" : "obj-17",
					"fontname" : "Verdana",
					"numoutlets" : 1,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "test.assert.equal int_test_fail 23 @reverse 1",
					"fontsize" : 10.0,
					"numinlets" : 2,
					"patching_rect" : [ 102.0, 334.0, 235.0, 19.0 ],
					"id" : "obj-18",
					"fontname" : "Verdana",
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "23",
					"fontsize" : 10.0,
					"numinlets" : 2,
					"patching_rect" : [ 70.0, 341.0, 26.0, 17.0 ],
					"id" : "obj-19",
					"fontname" : "Verdana",
					"numoutlets" : 1,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "test.assert.equal int_test 23",
					"fontsize" : 10.0,
					"numinlets" : 2,
					"patching_rect" : [ 70.0, 360.0, 153.0, 19.0 ],
					"id" : "obj-20",
					"fontname" : "Verdana",
					"numoutlets" : 0
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"source" : [ "obj-4", 0 ],
					"destination" : [ "obj-3", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-2", 0 ],
					"destination" : [ "obj-1", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-3", 0 ],
					"destination" : [ "obj-2", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-19", 0 ],
					"destination" : [ "obj-20", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-17", 0 ],
					"destination" : [ "obj-18", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-15", 0 ],
					"destination" : [ "obj-16", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-13", 0 ],
					"destination" : [ "obj-14", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-11", 0 ],
					"destination" : [ "obj-12", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-9", 0 ],
					"destination" : [ "obj-10", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-7", 0 ],
					"destination" : [ "obj-8", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-5", 0 ],
					"destination" : [ "obj-6", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-3", 1 ],
					"destination" : [ "obj-5", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-3", 1 ],
					"destination" : [ "obj-7", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-3", 1 ],
					"destination" : [ "obj-9", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-3", 1 ],
					"destination" : [ "obj-11", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-3", 1 ],
					"destination" : [ "obj-13", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-3", 1 ],
					"destination" : [ "obj-15", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-3", 1 ],
					"destination" : [ "obj-17", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-3", 1 ],
					"destination" : [ "obj-19", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
 ]
	}

}
