{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 7,
			"minor" : 0,
			"revision" : 0,
			"architecture" : "x86"
		}
,
		"rect" : [ 101.0, 81.0, 985.0, 505.0 ],
		"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
		"bglocked" : 0,
		"openinpresentation" : 1,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
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
					"automation" : "Invert Off",
					"id" : "obj-4",
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 550.0, 339.0, 83.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 147.0, 47.0, 116.0, 17.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "live.text",
							"parameter_shortname" : "live.text",
							"parameter_type" : 2,
							"parameter_mmax" : 1.0,
							"parameter_enum" : [ "Invert Off", "val2" ]
						}

					}
,
					"text" : "Invert Off",
					"texton" : "Invert On",
					"varname" : "live.text"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-51",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "signal", "", "" ],
					"patching_rect" : [ 331.0, 299.0, 127.0, 20.0 ],
					"text" : "j.receive~ audio/out.R"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-18",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "signal", "", "" ],
					"patching_rect" : [ 185.0, 299.0, 125.0, 20.0 ],
					"text" : "j.receive~ audio/out.L"
				}

			}
, 			{
				"box" : 				{
					"annotation" : "amplitude of output signal 2",
					"id" : "obj-19",
					"maxclass" : "live.meter~",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "list" ],
					"patching_rect" : [ 338.5, 327.0, 4.0, 80.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 288.0, 24.0, 5.0, 40.0 ]
				}

			}
, 			{
				"box" : 				{
					"annotation" : "amplitude of output signal 1",
					"id" : "obj-20",
					"maxclass" : "live.meter~",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "list" ],
					"patching_rect" : [ 185.0, 319.0, 4.0, 80.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 281.0, 24.0, 5.0, 40.0 ]
				}

			}
, 			{
				"box" : 				{
					"annotation" : "Sets the threshold below which a bin of the spectrum is attenuated..",
					"bgcolor" : [ 0.909804, 0.909804, 0.909804, 1.0 ],
					"bordercolor" : [ 0.0, 0.019608, 0.078431, 1.0 ],
					"fgcolor" : [ 0.94902, 0.756863, 0.309804, 1.0 ],
					"fontface" : 1,
					"fontname" : "Arial",
					"id" : "obj-69",
					"knobcolor" : [ 0.94902, 0.756863, 0.309804, 1.0 ],
					"maxclass" : "j.textslider",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 550.0, 245.0, 160.0, 17.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 10.0, 47.0, 116.0, 18.0 ],
					"range" : [ -48.0, 18.0 ],
					"text" : "Decay response",
					"textpos" : [ 10.0, 3.0 ],
					"unit" : "dB"
				}

			}
, 			{
				"box" : 				{
					"annotation" : "Sets the threshold below which a bin of the spectrum is attenuated..",
					"bgcolor" : [ 0.909804, 0.909804, 0.909804, 1.0 ],
					"bordercolor" : [ 0.0, 0.019608, 0.078431, 1.0 ],
					"fgcolor" : [ 0.94902, 0.756863, 0.309804, 1.0 ],
					"fontface" : 1,
					"fontname" : "Arial",
					"id" : "obj-67",
					"knobcolor" : [ 0.94902, 0.756863, 0.309804, 1.0 ],
					"maxclass" : "j.textslider",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 550.0, 150.0, 160.0, 17.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 10.0, 25.0, 116.0, 18.0 ],
					"range" : [ -48.0, 18.0 ],
					"text" : "Attack response",
					"textpos" : [ 10.0, 3.0 ],
					"unit" : "dB"
				}

			}
, 			{
				"box" : 				{
					"annotation" : "Sets the threshold below which a bin of the spectrum is attenuated..",
					"bgcolor" : [ 0.909804, 0.909804, 0.909804, 1.0 ],
					"bordercolor" : [ 0.0, 0.019608, 0.078431, 1.0 ],
					"fgcolor" : [ 0.94902, 0.756863, 0.309804, 1.0 ],
					"fontface" : 1,
					"fontname" : "Arial",
					"id" : "obj-66",
					"knobcolor" : [ 0.94902, 0.756863, 0.309804, 1.0 ],
					"maxclass" : "j.textslider",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 550.0, 65.0, 160.0, 17.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 147.0, 25.0, 116.0, 18.0 ],
					"prototypename" : "M4L",
					"range" : [ -48.0, 18.0 ],
					"text" : "Threshold",
					"textpos" : [ 10.0, 3.0 ],
					"unit" : "dB"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-64",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 550.0, 370.0, 109.0, 20.0 ],
					"text" : "j.remote invert"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-63",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 550.0, 270.0, 165.0, 20.0 ],
					"text" : "j.remote response/decay"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-62",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 550.0, 175.0, 165.0, 20.0 ],
					"text" : "j.remote response/attack"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-61",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 550.0, 90.0, 129.0, 20.0 ],
					"text" : "j.remote threshold"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frgb" : 0.0,
					"id" : "obj-59",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 550.0, 432.0, 400.0, 33.0 ],
					"text" : "Credits: This module is based on the plugin Brita that was part of the now discontinued Hipno, a set of Pluggo plugins developed by Electrotap"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-50",
					"maxclass" : "j.ui",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"presentation" : 1,
					"presentation_rect" : [ 0.0, 0.0, 300.0, 70.0 ],
					"text" : "/noModelAddress"
				}

			}
, 			{
				"box" : 				{
					"comment" : "",
					"id" : "obj-49",
					"maxclass" : "outlet",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 25.0, 255.0, 25.0, 25.0 ]
				}

			}
, 			{
				"box" : 				{
					"comment" : "",
					"id" : "obj-48",
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 25.0, 135.0, 25.0, 25.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-47",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 25.0, 187.0, 63.0, 20.0 ],
					"text" : "j.view"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-20", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-18", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-64", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-4", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-49", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-47", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-47", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-48", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-19", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-51", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-66", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 559.5, 126.0, 540.0, 126.0, 540.0, 58.0, 559.5, 58.0 ],
					"source" : [ "obj-61", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-67", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 559.5, 214.0, 542.0, 214.0, 542.0, 142.0, 559.5, 142.0 ],
					"source" : [ "obj-62", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-69", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 559.5, 308.0, 542.0, 308.0, 542.0, 235.0, 559.5, 235.0 ],
					"source" : [ "obj-63", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 559.5, 399.0, 540.5, 399.0, 540.5, 329.0, 559.5, 329.0 ],
					"source" : [ "obj-64", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-61", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-66", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-62", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-67", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-63", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-69", 0 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-4" : [ "live.text", "live.text", 0 ]
		}
,
		"dependency_cache" : [ 			{
				"name" : "j.view.mxo",
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
				"name" : "j.textslider.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.receive~.mxo",
				"type" : "iLaX"
			}
 ]
	}

}
