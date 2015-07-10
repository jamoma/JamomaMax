{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 7,
			"minor" : 0,
			"revision" : 4,
			"architecture" : "x64",
			"modernui" : 1
		}
,
		"rect" : [ 34.0, 79.0, 1162.0, 903.0 ],
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
					"activeslidercolor" : [ 0.960784, 0.827451, 0.156863, 1.0 ],
					"appearance" : 2,
					"fontsize" : 12.0,
					"id" : "obj-28",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 303.0, 584.535339, 160.5, 17.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 95.5, 224.0, 147.5, 17.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Mix",
							"parameter_shortname" : "Mix",
							"parameter_type" : 0,
							"parameter_mmax" : 100.0,
							"parameter_unitstyle" : 5,
							"parameter_units" : "%.2f Semitones",
							"parameter_steps" : 1001
						}

					}
,
					"varname" : "live.numbox[4]"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 1,
					"id" : "obj-27",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 185.5, 584.535339, 71.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 20.5, 224.0, 71.0, 20.0 ],
					"style" : "",
					"text" : "Mix"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 1,
					"id" : "obj-24",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 185.5, 519.151489, 71.0, 33.0 ],
					"presentation" : 1,
					"presentation_linecount" : 2,
					"presentation_rect" : [ 20.5, 179.75, 71.0, 33.0 ],
					"style" : "",
					"text" : "Feedback delay time"
				}

			}
, 			{
				"box" : 				{
					"activeslidercolor" : [ 0.960784, 0.827451, 0.156863, 1.0 ],
					"appearance" : 2,
					"fontsize" : 12.0,
					"id" : "obj-23",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 303.0, 527.151489, 160.5, 17.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 95.5, 187.75, 147.5, 17.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Feedback delay time",
							"parameter_shortname" : "Feedback delay time",
							"parameter_type" : 0,
							"parameter_mmax" : 200.0,
							"parameter_unitstyle" : 2,
							"parameter_units" : "%.2f Semitones",
							"parameter_steps" : 2001
						}

					}
,
					"varname" : "live.numbox[3]"
				}

			}
, 			{
				"box" : 				{
					"activeslidercolor" : [ 0.960784, 0.827451, 0.156863, 1.0 ],
					"appearance" : 2,
					"fontsize" : 12.0,
					"id" : "obj-17",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 303.0, 469.76767, 160.5, 17.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 95.5, 143.5, 147.5, 17.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Feedback level",
							"parameter_shortname" : "Feedback level",
							"parameter_type" : 0,
							"parameter_mmin" : -60.0,
							"parameter_mmax" : 6.0,
							"parameter_unitstyle" : 4,
							"parameter_units" : "%.2f Semitones",
							"parameter_steps" : 661
						}

					}
,
					"varname" : "live.numbox[2]"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 1,
					"id" : "obj-16",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 185.5, 469.76767, 71.0, 33.0 ],
					"presentation" : 1,
					"presentation_linecount" : 2,
					"presentation_rect" : [ 20.5, 135.5, 71.0, 33.0 ],
					"style" : "",
					"text" : "Feedback level"
				}

			}
, 			{
				"box" : 				{
					"activeslidercolor" : [ 0.960784, 0.827451, 0.156863, 1.0 ],
					"appearance" : 2,
					"fontsize" : 12.0,
					"id" : "obj-15",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 297.5, 413.88382, 160.5, 17.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 95.5, 99.25, 147.5, 17.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Frequency offset",
							"parameter_shortname" : "Frequency offset",
							"parameter_type" : 0,
							"parameter_mmin" : -500.0,
							"parameter_mmax" : 500.0,
							"parameter_unitstyle" : 3,
							"parameter_units" : "%.2f Semitones",
							"parameter_steps" : 1001
						}

					}
,
					"varname" : "live.numbox[1]"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 1,
					"id" : "obj-11",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 185.5, 413.88382, 73.0, 33.0 ],
					"presentation" : 1,
					"presentation_linecount" : 2,
					"presentation_rect" : [ 20.5, 91.25, 73.0, 33.0 ],
					"style" : "",
					"text" : "Frequency offset"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 1,
					"id" : "obj-10",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 185.5, 355.0, 71.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 20.5, 60.0, 71.0, 20.0 ],
					"style" : "",
					"text" : "Pitch shift"
				}

			}
, 			{
				"box" : 				{
					"activeslidercolor" : [ 0.960784, 0.827451, 0.156863, 1.0 ],
					"appearance" : 2,
					"fontsize" : 12.0,
					"id" : "obj-4",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 297.5, 355.0, 160.5, 17.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 95.5, 61.5, 147.5, 17.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "Pitch shift (semintones)",
							"parameter_shortname" : "Pitch shift (semintones)",
							"parameter_type" : 0,
							"parameter_mmin" : -48.0,
							"parameter_mmax" : 48.0,
							"parameter_unitstyle" : 9,
							"parameter_units" : "%.2f Semitones",
							"parameter_steps" : 9601
						}

					}
,
					"varname" : "live.numbox"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-1",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 719.0, 86.0, 128.0, 22.0 ],
					"style" : "",
					"text" : "sprintf %s/hipnoscope"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-9",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 719.0, 118.0, 137.0, 22.0 ],
					"style" : "",
					"text" : "prepend model:address"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-8",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 719.0, 46.0, 137.0, 22.0 ],
					"style" : "",
					"text" : "j.receive model:address"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-26",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 26.0, 355.0, 41.0, 22.0 ],
					"style" : "",
					"text" : "j.view"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-12",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 476.0, 582.535339, 131.0, 22.0 ],
					"style" : "",
					"text" : "j.remote dsp/audio/mix"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-13",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 476.0, 469.76767, 206.0, 22.0 ],
					"style" : "",
					"text" : "j.remote dsp/feedback/gain @unit db",
					"varname" : "feedback"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-25",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 476.0, 526.151489, 155.0, 22.0 ],
					"style" : "",
					"text" : "j.remote dsp/feedback/time",
					"varname" : "right"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-22",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 476.0, 412.38382, 158.0, 22.0 ],
					"style" : "",
					"text" : "j.remote dsp/frequency/shift"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-21",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 476.0, 355.0, 164.0, 22.0 ],
					"style" : "",
					"text" : "j.remote dsp/frequency/scale"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-51",
					"linecount" : 2,
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "signal", "", "" ],
					"patching_rect" : [ 27.5, 633.0, 99.0, 35.0 ],
					"style" : "",
					"text" : "j.receive~ dsp/audio/out.R"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-18",
					"linecount" : 2,
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "signal", "", "" ],
					"patching_rect" : [ 26.0, 501.0, 97.0, 35.0 ],
					"style" : "",
					"text" : "j.receive~ dsp/audio/out.L"
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
					"patching_rect" : [ 29.0, 675.0, 14.0, 78.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 583.0, 25.856873, 5.0, 249.0 ]
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
					"patching_rect" : [ 27.5, 543.0, 14.0, 78.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 576.0, 25.856873, 5.0, 249.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-7",
					"maxclass" : "number",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 26.0, 403.0, 50.0, 22.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-2",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 26.0, 438.0, 126.0, 22.0 ],
					"style" : "",
					"text" : "j.remote preset_offset"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"border" : 1,
					"bordercolor" : [ 0.682032, 0.698052, 0.748716, 1.0 ],
					"grad1" : [ 0.462745, 0.470588, 0.490196, 0.0 ],
					"grad2" : [ 0.786675, 0.801885, 0.845022, 0.0 ],
					"id" : "obj-3",
					"maxclass" : "panel",
					"mode" : 1,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 470.0, 456.0, 128.0, 128.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 9.5, 25.856873, 247.0, 249.0 ],
					"proportion" : 0.39,
					"rounded" : 0,
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"annotation" : "none",
					"args" : [ "hipnoscope", 250 ],
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-6",
					"lockeddragscroll" : 0,
					"maxclass" : "bpatcher",
					"name" : "hipnoscope.view.maxpat",
					"numinlets" : 1,
					"numoutlets" : 0,
					"offset" : [ 0.0, 0.0 ],
					"patching_rect" : [ 719.0, 161.0, 297.0, 254.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 273.0, 25.856873, 280.0, 250.143127 ],
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"border" : 1,
					"bordercolor" : [ 0.682032, 0.698052, 0.748716, 1.0 ],
					"grad1" : [ 0.462745, 0.470588, 0.490196, 0.0 ],
					"grad2" : [ 0.786675, 0.801885, 0.845022, 0.0 ],
					"id" : "obj-5",
					"maxclass" : "panel",
					"mode" : 1,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 267.5, 24.856873, 128.0, 128.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 273.0, 25.856873, 289.0, 249.0 ],
					"proportion" : 0.39,
					"rounded" : 0,
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.93, 0.93, 0.93, 1.0 ],
					"fontface" : 0,
					"headercolor" : [ 0.82, 0.82, 0.82, 1.0 ],
					"id" : "obj-14",
					"maxclass" : "j.ui",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 0.0, 0.0, 600.0, 280.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.0, 0.0, 600.0, 280.0 ],
					"text" : "/no_model_address"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-9", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-1", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-28", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-12", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-17", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-13", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-22", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-15", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-17", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-20", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-18", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 35.5, 470.0, 3.5, 470.0, 3.5, 392.0, 35.5, 392.0 ],
					"source" : [ "obj-2", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-21", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-22", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-25", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-23", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-25", 0 ]
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
					"destination" : [ "obj-21", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-4", 0 ]
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
					"destination" : [ "obj-2", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-7", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-8", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-9", 0 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-15" : [ "Frequency offset", "Frequency offset", 0 ],
			"obj-4" : [ "Pitch shift (semintones)", "Pitch shift (semintones)", 0 ],
			"obj-28" : [ "Mix", "Mix", 0 ],
			"obj-6::obj-31::obj-29" : [ "live.menu", "live.menu", 0 ],
			"obj-6::obj-10" : [ "live.text", "live.text", 0 ],
			"obj-23" : [ "Feedback delay time", "Feedback delay time", 0 ],
			"obj-17" : [ "Feedback level", "Feedback level", 0 ]
		}
,
		"dependency_cache" : [ 			{
				"name" : "hipnoscope.view.maxpat",
				"bootpath" : "~/dev/Jamoma/Jamoma/Implementations/Max/Jamoma/patchers/modules/data/hipnoscope",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "hipnoscope.one_blob_gen_view.maxpat",
				"bootpath" : "~/dev/Jamoma/Jamoma/Implementations/Max/Jamoma/patchers/modules/data/hipnoscope",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "image.thumbnail.js",
				"bootpath" : "C74:/interfaces",
				"type" : "TEXT",
				"implicit" : 1
			}
, 			{
				"name" : "j.hipnopuck.js",
				"bootpath" : "~/dev/Jamoma/Jamoma/Implementations/Max/Jamoma/patchers/modules/data/hipnoscope",
				"type" : "TEXT",
				"implicit" : 1
			}
, 			{
				"name" : "j.hipno8circles.js",
				"bootpath" : "~/dev/Jamoma/Jamoma/Implementations/Max/Jamoma/patchers/modules/data/hipnoscope",
				"type" : "TEXT",
				"implicit" : 1
			}
, 			{
				"name" : "j.ui.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.receive.mxo",
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
				"name" : "j.send.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.pass.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.init.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.receive~.mxo",
				"type" : "iLaX"
			}
 ],
		"embedsnapshot" : 0
	}

}
