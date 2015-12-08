{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 7,
			"minor" : 0,
			"revision" : 6,
			"architecture" : "x64",
			"modernui" : 1
		}
,
		"rect" : [ 34.0, 79.0, 1131.0, 933.0 ],
		"bglocked" : 0,
		"openinpresentation" : 1,
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
		"style" : "",
		"subpatcher_template" : "",
		"boxes" : [ 			{
				"box" : 				{
					"id" : "obj-14",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 36.0, 118.0, 56.0, 22.0 ],
					"style" : "",
					"text" : "deferlow"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-9",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 36.0, 149.0, 137.0, 22.0 ],
					"style" : "",
					"text" : "prepend model:address"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-12",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 36.0, 86.0, 137.0, 22.0 ],
					"style" : "",
					"text" : "j.receive model:address"
				}

			}
, 			{
				"box" : 				{
					"annotation" : "none",
					"id" : "obj-10",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 0.0, 196.0, 168.0, 22.0 ],
					"style" : "",
					"text" : "vbap=_channels.view.maxpat"
				}

			}
, 			{
				"box" : 				{
					"comment" : "",
					"id" : "obj-8",
					"maxclass" : "outlet",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 147.0, 422.0, 30.0, 30.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"comment" : "",
					"id" : "obj-7",
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 147.0, 295.0, 30.0, 30.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-6",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 147.0, 365.0, 41.0, 22.0 ],
					"style" : "",
					"text" : "j.view"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-5",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 481.0, 113.0, 36.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 113.0, 26.5, 36.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "live.numbox[3]",
							"parameter_shortname" : "live.numbox",
							"parameter_type" : 0,
							"parameter_unitstyle" : 0
						}

					}
,
					"varname" : "live.numbox[3]"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-4",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 481.0, 149.0, 36.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 113.0, 46.5, 36.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Blur[8]",
							"parameter_shortname" : "Blur",
							"parameter_type" : 0,
							"parameter_unitstyle" : 0
						}

					}
,
					"varname" : "live.numbox[2]"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-2",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 481.0, 42.0, 36.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 241.0, 26.5, 36.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "live.numbox",
							"parameter_shortname" : "live.numbox",
							"parameter_type" : 0,
							"parameter_mmin" : 1.0,
							"parameter_mmax" : 3.0,
							"parameter_unitstyle" : 0
						}

					}
,
					"varname" : "live.numbox"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-13",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 528.0, 42.0, 168.0, 22.0 ],
					"style" : "",
					"text" : "j.remote renderer/dimensions",
					"varname" : "voices[2]"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-11",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 528.0, 149.0, 223.0, 22.0 ],
					"style" : "",
					"text" : "j.remote speakers/number_of_channels",
					"varname" : "voices[1]"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 10.0,
					"id" : "obj-23",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 170.0, 25.0, 66.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 170.0, 25.0, 66.0, 18.0 ],
					"style" : "",
					"text" : "Dimensions:",
					"textcolor" : [ 0.239216, 0.254902, 0.278431, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 10.0,
					"id" : "obj-24",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 5.0, 45.0, 103.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 5.0, 45.0, 103.0, 18.0 ],
					"style" : "",
					"text" : "Number of speakers:",
					"textcolor" : [ 0.239216, 0.254902, 0.278431, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 10.0,
					"id" : "obj-40",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 5.0, 25.0, 98.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 5.0, 25.0, 98.0, 18.0 ],
					"style" : "",
					"text" : "Number of sources:",
					"textcolor" : [ 0.239216, 0.254902, 0.278431, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-44",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 528.0, 113.0, 214.0, 22.0 ],
					"style" : "",
					"text" : "j.remote sources/number_of_channels",
					"varname" : "voices"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"id" : "obj-1",
					"maxclass" : "j.ui",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"presentation" : 1,
					"presentation_rect" : [ 0.0, 0.0, 300.0, 70.0 ],
					"text" : "/no_model_address"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-1", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-11", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-14", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-12", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-13", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-9", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-14", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-2", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-11", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-4", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
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
					"source" : [ "obj-5", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-8", 0 ],
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
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-9", 0 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-10::obj-17::obj-1::obj-8" : [ "live.text[1]", "live.text", 0 ],
			"obj-10::obj-17::obj-2::obj-6" : [ "Gain[2]", "Gain", 0 ],
			"obj-10::obj-17::obj-5::obj-4" : [ "Blur[5]", "Blur", 0 ],
			"obj-10::obj-17::obj-5::obj-8" : [ "live.text[5]", "live.text", 0 ],
			"obj-10::obj-17::obj-8::obj-4" : [ "Blur", "Blur", 0 ],
			"obj-10::obj-17::obj-3::obj-8" : [ "live.text[3]", "live.text", 0 ],
			"obj-10::obj-17::obj-1::obj-4" : [ "Blur[1]", "Blur", 0 ],
			"obj-10::obj-17::obj-5::obj-6" : [ "Gain[5]", "Gain", 0 ],
			"obj-10::obj-17::obj-7::obj-6" : [ "Gain[7]", "Gain", 0 ],
			"obj-10::obj-17::obj-3::obj-4" : [ "Blur[3]", "Blur", 0 ],
			"obj-10::obj-17::obj-1::obj-6" : [ "Gain[1]", "Gain", 0 ],
			"obj-10::obj-17::obj-6::obj-8" : [ "live.text[6]", "live.text", 0 ],
			"obj-4" : [ "Blur[8]", "Blur", 0 ],
			"obj-10::obj-17::obj-8::obj-6" : [ "Gain", "Gain", 0 ],
			"obj-10::obj-17::obj-2::obj-8" : [ "live.text[2]", "live.text", 0 ],
			"obj-10::obj-17::obj-4::obj-6" : [ "Gain[4]", "Gain", 0 ],
			"obj-2" : [ "live.numbox", "live.numbox", 0 ],
			"obj-5" : [ "live.numbox[3]", "live.numbox", 0 ],
			"obj-10::obj-17::obj-3::obj-6" : [ "Gain[3]", "Gain", 0 ],
			"obj-10::obj-17::obj-7::obj-8" : [ "live.text[7]", "live.text", 0 ],
			"obj-10::obj-17::obj-6::obj-6" : [ "Gain[6]", "Gain", 0 ],
			"obj-10::obj-17::obj-7::obj-4" : [ "Blur[7]", "Blur", 0 ],
			"obj-10::obj-17::obj-2::obj-4" : [ "Blur[2]", "Blur", 0 ],
			"obj-10::obj-17::obj-4::obj-8" : [ "live.text[4]", "live.text", 0 ],
			"obj-10::obj-17::obj-8::obj-8" : [ "live.text", "live.text", 0 ],
			"obj-10::obj-17::obj-6::obj-4" : [ "Blur[6]", "Blur", 0 ],
			"obj-10::obj-17::obj-4::obj-4" : [ "Blur[4]", "Blur", 0 ]
		}
,
		"dependency_cache" : [ 			{
				"name" : "vbap=_channels.view.maxpat",
				"bootpath" : "~/dev/Jamoma/JamomaMax/Jamoma/patchers/modules/audio/surround/vbap=",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "vbap=_one_channel_display.maxpat",
				"bootpath" : "~/dev/Jamoma/JamomaMax/Jamoma/patchers/modules/audio/surround/vbap=",
				"type" : "JSON",
				"implicit" : 1
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
				"name" : "j.receive.mxo",
				"type" : "iLaX"
			}
 ],
		"embedsnapshot" : 0,
		"accentcolor" : [ 0.490196, 0.498039, 0.517647, 1.0 ]
	}

}
