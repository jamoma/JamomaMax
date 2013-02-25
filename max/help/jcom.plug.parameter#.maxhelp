{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 5,
			"minor" : 1,
			"revision" : 9
		}
,
		"rect" : [ 29.0, 69.0, 829.0, 588.0 ],
		"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
		"bglocked" : 0,
		"defrect" : [ 29.0, 69.0, 829.0, 588.0 ],
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
		"imprint" : 1,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"boxes" : [ 			{
				"box" : 				{
					"args" : [ "@description", "receive automation from the plug-in host environment" ],
					"background" : 0,
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"bgmode" : 1,
					"border" : 0,
					"clickthrough" : 0,
					"embed" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"hidden" : 0,
					"id" : "obj-6",
					"ignoreclick" : 0,
					"lockeddragscroll" : 0,
					"maxclass" : "bpatcher",
					"name" : "jcom.maxhelpui.maxpat",
					"numinlets" : 1,
					"numoutlets" : 0,
					"offset" : [ 0.0, 0.0 ],
					"patching_rect" : [ 0.0, 0.0, 781.0, 70.0 ],
					"presentation" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ]
				}

			}
, 			{
				"box" : 				{
					"background" : 0,
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"color" : [ 0.7, 0.7, 0.7, 1.0 ],
					"fontface" : 0,
					"fontname" : "Helvetica Neue Light",
					"fontsize" : 18.0,
					"hidden" : 0,
					"id" : "obj-1",
					"ignoreclick" : 0,
					"linecount" : 4,
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "graph.connect", "" ],
					"patching_rect" : [ 50.0, 140.0, 194.0, 94.0 ],
					"presentation" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"text" : "jcom.plug.parameter# frequency @style hertz @range 20 8000 @default 1000.",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"background" : 0,
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
					"fontface" : 0,
					"fontname" : "Helvetica Neue Light",
					"fontsize" : 13.0,
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
					"hidden" : 0,
					"id" : "obj-17",
					"ignoreclick" : 1,
					"linecount" : 5,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 540.0, 350.0, 280.0, 85.0 ],
					"presentation" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"text" : "In this example the key called 'name', which is the name of the parameter (resonance), is replaced with a different name (q) -- the one we want to use to control the attribute of the audio object.",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"underline" : 0
				}

			}
, 			{
				"box" : 				{
					"background" : 0,
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"color" : [ 0.7, 0.7, 0.7, 1.0 ],
					"fontface" : 0,
					"fontname" : "Helvetica Neue Light",
					"fontsize" : 13.0,
					"hidden" : 0,
					"id" : "obj-16",
					"ignoreclick" : 0,
					"linecount" : 3,
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "graph.connect", "" ],
					"patching_rect" : [ 50.0, 390.0, 101.0, 54.0 ],
					"presentation" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"text" : "jcom.append# @key name @value q",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"background" : 0,
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"color" : [ 0.7, 0.7, 0.7, 1.0 ],
					"fontface" : 0,
					"fontname" : "Helvetica Neue Light",
					"fontsize" : 18.0,
					"hidden" : 0,
					"id" : "obj-15",
					"ignoreclick" : 0,
					"linecount" : 3,
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "graph.connect", "" ],
					"patching_rect" : [ 50.0, 290.0, 196.0, 72.0 ],
					"presentation" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"text" : "jcom.plug.parameter# resonance @range 0. 4. @default 1.",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"background" : 0,
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
					"fontface" : 0,
					"fontname" : "Helvetica Neue Light",
					"fontsize" : 13.0,
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
					"hidden" : 0,
					"id" : "obj-14",
					"ignoreclick" : 1,
					"linecount" : 3,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 540.0, 290.0, 280.0, 54.0 ],
					"presentation" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"text" : "The append# object provides a way to modify the dictionary before sending it to the audio object.",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"underline" : 0
				}

			}
, 			{
				"box" : 				{
					"background" : 0,
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
					"fontface" : 0,
					"fontname" : "Helvetica Neue Light",
					"fontsize" : 13.0,
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
					"hidden" : 0,
					"id" : "obj-13",
					"ignoreclick" : 1,
					"linecount" : 5,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 250.0, 365.0, 288.0, 85.0 ],
					"presentation" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"text" : "The dictionary produced by jcom.plug.parameter# includes both the parameter value and the parameter name.  Thus, the name of the parameter is also the name of the attribute it will try and control in the connected audio object.",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"underline" : 0
				}

			}
, 			{
				"box" : 				{
					"background" : 0,
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"color" : [ 0.7, 0.7, 0.7, 1.0 ],
					"fontface" : 0,
					"fontname" : "Helvetica Neue Light",
					"fontsize" : 13.0,
					"hidden" : 0,
					"id" : "obj-11",
					"ignoreclick" : 0,
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 0,
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 5,
							"minor" : 1,
							"revision" : 9
						}
,
						"rect" : [ 492.0, 250.0, 298.0, 123.0 ],
						"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
						"bglocked" : 0,
						"defrect" : [ 492.0, 250.0, 298.0, 123.0 ],
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
						"imprint" : 1,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"boxes" : [ 							{
								"box" : 								{
									"background" : 0,
									"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
									"fontface" : 0,
									"fontname" : "Helvetica Neue Light",
									"fontsize" : 13.0,
									"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
									"hidden" : 0,
									"id" : "obj-2",
									"ignoreclick" : 1,
									"linecount" : 6,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 20.0, 10.0, 150.0, 101.0 ],
									"presentation" : 0,
									"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
									"text" : "available styles are:\n+ generic\n+ boolean\n+ hertz\n+ decibels\n+ milliseconds",
									"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"underline" : 0
								}

							}
 ],
						"lines" : [  ]
					}
,
					"patching_rect" : [ 540.0, 230.0, 201.0, 22.0 ],
					"presentation" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"saved_object_attributes" : 					{
						"default_fontname" : "Helvetica Neue Light",
						"fontname" : "Helvetica Neue Light",
						"default_fontsize" : 13.0,
						"fontface" : 0,
						"fontsize" : 13.0,
						"globalpatchername" : "",
						"default_fontface" : 0
					}
,
					"text" : "p \"options for the @style attribute\"",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"background" : 0,
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
					"fontface" : 0,
					"fontname" : "Helvetica Neue Light",
					"fontsize" : 13.0,
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
					"hidden" : 0,
					"id" : "obj-10",
					"ignoreclick" : 1,
					"linecount" : 5,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 540.0, 140.0, 282.0, 85.0 ],
					"presentation" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"text" : "Additional attributes allow you to refine the properties of the parameter.  The @style attribute, for example, will give the host environment some clues about how to generate an intelligent interface for a parameter.",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"underline" : 0
				}

			}
, 			{
				"box" : 				{
					"background" : 0,
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
					"fontface" : 0,
					"fontname" : "Helvetica Neue Light",
					"fontsize" : 13.0,
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
					"hidden" : 0,
					"id" : "obj-8",
					"ignoreclick" : 1,
					"linecount" : 3,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 250.0, 140.0, 282.0, 54.0 ],
					"presentation" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"text" : "The jcom.plug.parameter# object defines a parameter that can be automated and contolled by the host environment for the plug-in.",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"underline" : 0
				}

			}
, 			{
				"box" : 				{
					"background" : 0,
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
					"fontface" : 0,
					"fontname" : "Helvetica Neue Light",
					"fontsize" : 13.0,
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
					"hidden" : 0,
					"id" : "obj-7",
					"ignoreclick" : 1,
					"linecount" : 3,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 250.0, 195.0, 282.0, 54.0 ],
					"presentation" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"text" : "The first argument is the name of the parameter, which defines what the parameter will be named in the host environment.",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"underline" : 0
				}

			}
, 			{
				"box" : 				{
					"background" : 0,
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
					"fontface" : 0,
					"fontname" : "Helvetica Neue Light",
					"fontsize" : 13.0,
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
					"hidden" : 0,
					"id" : "obj-4",
					"ignoreclick" : 1,
					"linecount" : 4,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 250.0, 290.0, 280.0, 69.0 ],
					"presentation" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"text" : "The jcom.plug.parameter# object produces a dictionary output.  A dictionary is a collection of information where specific pieces of information (values) are associated with a 'key'.",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"underline" : 0
				}

			}
, 			{
				"box" : 				{
					"background" : 0,
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
					"fontface" : 0,
					"fontname" : "Helvetica Neue Light",
					"fontsize" : 13.0,
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
					"hidden" : 0,
					"id" : "obj-3",
					"ignoreclick" : 1,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 120.0, 550.0, 322.0, 22.0 ],
					"presentation" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"text" : "Send audio SmartSignal output to the host environment",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"underline" : 0
				}

			}
, 			{
				"box" : 				{
					"background" : 0,
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
					"fontface" : 0,
					"fontname" : "Helvetica Neue Light",
					"fontsize" : 13.0,
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
					"hidden" : 0,
					"id" : "obj-2",
					"ignoreclick" : 1,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 110.0, 105.0, 342.0, 22.0 ],
					"presentation" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"text" : "Receive audio SmartSignal input from the host environment",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"underline" : 0
				}

			}
, 			{
				"box" : 				{
					"background" : 0,
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"color" : [ 0.7, 0.7, 0.7, 1.0 ],
					"fontface" : 0,
					"fontname" : "Helvetica Neue Light",
					"fontsize" : 13.0,
					"hidden" : 0,
					"id" : "obj-5",
					"ignoreclick" : 0,
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "audio.connect", "" ],
					"patching_rect" : [ 20.0, 105.0, 86.0, 22.0 ],
					"presentation" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"text" : "jcom.plug.in≈",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"background" : 0,
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
					"fontface" : 0,
					"fontname" : "Helvetica Neue Light",
					"fontsize" : 13.0,
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
					"hidden" : 0,
					"id" : "obj-43",
					"ignoreclick" : 1,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 125.0, 520.0, 233.0, 22.0 ],
					"presentation" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"text" : "Process the multi-channel SmartSignals",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"underline" : 0
				}

			}
, 			{
				"box" : 				{
					"background" : 0,
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"color" : [ 0.7, 0.7, 0.7, 1.0 ],
					"fontface" : 0,
					"fontname" : "Helvetica Neue Light",
					"fontsize" : 13.0,
					"hidden" : 0,
					"id" : "obj-41",
					"ignoreclick" : 0,
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "audio.connect", "" ],
					"patching_rect" : [ 20.0, 520.0, 72.0, 22.0 ],
					"presentation" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"text" : "jcom.filter≈",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"background" : 0,
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"color" : [ 0.7, 0.7, 0.7, 1.0 ],
					"fontface" : 0,
					"fontname" : "Helvetica Neue Light",
					"fontsize" : 13.0,
					"hidden" : 0,
					"id" : "obj-40",
					"ignoreclick" : 0,
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "audio.connect", "" ],
					"patching_rect" : [ 20.0, 550.0, 95.0, 22.0 ],
					"presentation" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"text" : "jcom.plug.out≈",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ]
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"color" : [ 0.0, 0.0, 0.0, 1.0 ],
					"destination" : [ "obj-41", 0 ],
					"hidden" : 0,
					"midpoints" : [ 59.5, 262.0, 29.5, 262.0 ],
					"source" : [ "obj-1", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.0, 0.0, 0.0, 1.0 ],
					"destination" : [ "obj-16", 0 ],
					"hidden" : 0,
					"midpoints" : [  ],
					"source" : [ "obj-15", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.0, 0.0, 0.0, 1.0 ],
					"destination" : [ "obj-41", 0 ],
					"hidden" : 0,
					"midpoints" : [ 59.5, 457.0, 29.5, 457.0 ],
					"source" : [ "obj-16", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.0, 0.0, 0.0, 1.0 ],
					"destination" : [ "obj-40", 0 ],
					"hidden" : 0,
					"midpoints" : [  ],
					"source" : [ "obj-41", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.0, 0.0, 0.0, 1.0 ],
					"destination" : [ "obj-41", 0 ],
					"hidden" : 0,
					"midpoints" : [  ],
					"source" : [ "obj-5", 0 ]
				}

			}
 ]
	}

}
