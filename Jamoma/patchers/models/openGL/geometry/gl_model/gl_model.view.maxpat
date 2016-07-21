{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 7,
			"minor" : 2,
			"revision" : 3,
			"architecture" : "x86",
			"modernui" : 1
		}
,
		"rect" : [ 491.0, 363.0, 755.0, 523.0 ],
		"bglocked" : 0,
		"openinpresentation" : 1,
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
					"annotation" : "model file path",
					"id" : "obj-8",
					"keymode" : 1,
					"maxclass" : "textedit",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 154.5, 379.5, 100.0, 50.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 52.5, 20.5, 245.0, 20.0 ],
					"style" : "",
					"text" : "none"
				}

			}
, 			{
				"box" : 				{
					"bordercolor" : [ 0.501961, 0.501961, 0.501961, 0.0 ],
					"id" : "obj-30",
					"maxclass" : "dropfile",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 65.695923, 280.295959, 66.804077, 35.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 46.679199, 18.5, 253.320801, 25.5 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-45",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 471.927734, 461.0, 129.0, 21.0 ],
					"style" : "",
					"text" : "j.remote verbose",
					"varname" : "screenmode[7]"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-46",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 370.0, 461.0, 86.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 189.00293, 210.119751, 50.0, 19.0 ],
					"style" : "",
					"text" : "verbose"
				}

			}
, 			{
				"box" : 				{
					"activecolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"annotation" : "If enabled, messages useful for debugging are printed to the Max Console.",
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
					"disabled" : [ 0 ],
					"id" : "obj-47",
					"itemtype" : 1,
					"maxclass" : "radiogroup",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 345.0, 461.0, 80.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 172.537598, 212.119751, 82.930664, 18.0 ],
					"size" : 1,
					"style" : "",
					"values" : [ 0 ],
					"varname" : "SCREENMODE[7]"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-42",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 471.927734, 436.0, 129.0, 21.0 ],
					"style" : "",
					"text" : "j.remote optimize",
					"varname" : "screenmode[6]"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-43",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 370.0, 436.0, 86.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 189.00293, 192.099823, 53.0, 19.0 ],
					"style" : "",
					"text" : "optimize"
				}

			}
, 			{
				"box" : 				{
					"activecolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"annotation" : "Optimize vertices and nodes on import (default = 1).",
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
					"disabled" : [ 0 ],
					"id" : "obj-44",
					"itemtype" : 1,
					"maxclass" : "radiogroup",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 345.0, 436.0, 80.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 172.537598, 193.991241, 82.930664, 18.0 ],
					"size" : 1,
					"style" : "",
					"values" : [ 1 ],
					"varname" : "SCREENMODE[6]"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-37",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 471.927734, 410.0, 129.0, 21.0 ],
					"style" : "",
					"text" : "j.remote normalize",
					"varname" : "screenmode[5]"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-38",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 370.0, 410.0, 86.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 189.00293, 174.079834, 60.0, 19.0 ],
					"style" : "",
					"text" : "normalize"
				}

			}
, 			{
				"box" : 				{
					"activecolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"annotation" : "Normalize model coordinates flag (default = 1). When enabled, the model is scaled to the range (-1.,1.) for the x, y, and z axes.",
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
					"disabled" : [ 0 ],
					"id" : "obj-39",
					"itemtype" : 1,
					"maxclass" : "radiogroup",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 345.0, 410.0, 80.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 172.537598, 175.862701, 82.930664, 18.0 ],
					"size" : 1,
					"style" : "",
					"values" : [ 1 ],
					"varname" : "SCREENMODE[5]"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-29",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 471.927734, 390.0, 129.0, 21.0 ],
					"style" : "",
					"text" : "j.remote gen_tangents",
					"varname" : "screenmode[4]"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-32",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 370.0, 390.0, 86.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 29.00293, 232.059875, 79.0, 19.0 ],
					"style" : "",
					"text" : "gen_tangents"
				}

			}
, 			{
				"box" : 				{
					"activecolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"annotation" : "Generate tangents on import (default = 1)",
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
					"disabled" : [ 0 ],
					"id" : "obj-35",
					"itemtype" : 1,
					"maxclass" : "radiogroup",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 345.0, 390.0, 80.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 12.537598, 233.734192, 82.930664, 18.0 ],
					"size" : 1,
					"style" : "",
					"values" : [ 1 ],
					"varname" : "SCREENMODE[4]"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-17",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 471.927734, 369.0, 129.0, 21.0 ],
					"style" : "",
					"text" : "j.remote gen_normals",
					"varname" : "screenmode[3]"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-26",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 370.0, 369.0, 86.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 29.00293, 214.039917, 76.0, 19.0 ],
					"style" : "",
					"text" : "gen_normals"
				}

			}
, 			{
				"box" : 				{
					"activecolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"annotation" : "Generate normals on import (default = 1)",
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
					"disabled" : [ 0 ],
					"id" : "obj-27",
					"itemtype" : 1,
					"maxclass" : "radiogroup",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 345.0, 369.0, 80.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 12.537598, 215.605713, 82.930664, 18.0 ],
					"size" : 1,
					"style" : "",
					"values" : [ 1 ],
					"varname" : "SCREENMODE[3]"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-9",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 471.927734, 341.0, 129.0, 21.0 ],
					"style" : "",
					"text" : "j.remote fix_normals",
					"varname" : "screenmode[2]"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-10",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 370.0, 341.0, 86.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 29.00293, 196.019958, 69.0, 19.0 ],
					"style" : "",
					"text" : "fix_normals"
				}

			}
, 			{
				"box" : 				{
					"activecolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"annotation" : "Fix normals on import (default = 0)",
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
					"disabled" : [ 0 ],
					"id" : "obj-11",
					"itemtype" : 1,
					"maxclass" : "radiogroup",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 345.0, 341.0, 80.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 12.537598, 197.477173, 82.930664, 18.0 ],
					"size" : 1,
					"style" : "",
					"values" : [ 0 ],
					"varname" : "SCREENMODE[2]"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-1",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 471.927734, 313.0, 129.0, 21.0 ],
					"style" : "",
					"text" : "j.remote find_instances",
					"varname" : "screenmode[1]"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-2",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 370.0, 313.0, 86.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 29.00293, 178.0, 86.0, 19.0 ],
					"style" : "",
					"text" : "find_instances "
				}

			}
, 			{
				"box" : 				{
					"activecolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"annotation" : "Mesh instance removal on import (default = 1)",
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
					"disabled" : [ 0 ],
					"id" : "obj-7",
					"itemtype" : 1,
					"maxclass" : "radiogroup",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 345.0, 313.0, 80.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 12.537598, 179.348663, 82.930664, 18.0 ],
					"size" : 1,
					"style" : "",
					"values" : [ 1 ],
					"varname" : "SCREENMODE[1]"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-14",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 341.0, 147.0, 76.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 16.930664, 69.0, 70.0, 19.0 ],
					"style" : "",
					"text" : "drawgroup"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-15",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 471.927734, 149.0, 117.0, 21.0 ],
					"style" : "",
					"text" : "j.remote drawgroup",
					"varname" : "fontsize[1]"
				}

			}
, 			{
				"box" : 				{
					"annotation" : "The minor radius of a torus, if one is rendered or sent out as a matrix.",
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-16",
					"maxclass" : "number",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 414.927734, 147.0, 39.0, 21.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 90.858398, 69.0, 50.0, 21.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-13",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 154.5, 441.0, 100.0, 21.0 ],
					"style" : "",
					"text" : "route text"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-36",
					"maxclass" : "live.text",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 154.5, 292.0, 40.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.0, 20.5, 49.0, 20.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "live.text",
							"parameter_shortname" : "live.text",
							"parameter_type" : 2,
							"parameter_mmax" : 1.0,
							"parameter_enum" : [ "val1", "val2" ]
						}

					}
,
					"text" : "Read",
					"varname" : "live.text"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-3",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"patching_rect" : [ 154.5, 322.0, 70.0, 21.0 ],
					"style" : "default",
					"text" : "opendialog"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-51",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 154.5, 353.0, 108.0, 21.0 ],
					"style" : "",
					"text" : "j.remote file/path"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-28",
					"maxclass" : "live.line",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 266.0, 180.0, 5.0, 100.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 135.858398, 178.0, 5.0, 79.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-25",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 683.0, 327.0, 76.0, 31.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 145.00293, 253.734192, 97.0, 19.0 ],
					"style" : "",
					"text" : "smoothing_angle"
				}

			}
, 			{
				"box" : 				{
					"allowdrag" : 0,
					"annotation" : "enable matrix output. ",
					"hint" : "matrix output",
					"id" : "obj-22",
					"items" : [ "off", ",", "on", ",", "on with transform" ],
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 418.927734, 248.0, 83.572266, 21.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 90.858398, 140.0, 62.572266, 21.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-23",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 541.5, 248.0, 120.0, 21.0 ],
					"style" : "",
					"text" : "j.remote matrixoutput",
					"varname" : "align[3]"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-24",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 345.0, 248.0, 76.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 16.00293, 140.0, 76.0, 19.0 ],
					"style" : "",
					"text" : "matrixoutput"
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
					"patching_rect" : [ 53.0, 187.0, 164.0, 21.0 ],
					"style" : "",
					"text" : "model:address /gl_model"
				}

			}
, 			{
				"box" : 				{
					"allowdrag" : 0,
					"annotation" : "Mode for applying built-in material properties of a model. (default = 1 - Diffuse) ",
					"hint" : "shape",
					"id" : "obj-4",
					"items" : [ "0 = Ignore (Inherit Colors From OB3D)' ( Material properties are ignored )", ",", "1 = 'Diffuse (Use Diffuse Only)' ( Only diffuse color component is used )", ",", "2 = 'All (Use All Color Values)' ( All material components are used )", ",", "3 = 'JMTL (Use Jitter Material)' ( Internal jit.gl.material object is used )" ],
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 405.927734, 106.0, 83.572266, 21.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 90.858398, 94.0, 202.572266, 21.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-6",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 528.5, 106.0, 133.0, 21.0 ],
					"style" : "",
					"text" : "j.remote material_mode",
					"varname" : "align[1]"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-12",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 358.0, 106.0, 86.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.0, 94.0, 92.0, 19.0 ],
					"style" : "",
					"text" : "material_mode"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-5",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 0.0, 145.0, 110.0, 21.0 ],
					"style" : "",
					"text" : "j.gl_group.panel GL"
				}

			}
, 			{
				"box" : 				{
					"allowdrag" : 0,
					"annotation" : "The mode to use for the geometry cache (default = var).",
					"hint" : "cache mode",
					"id" : "obj-94",
					"items" : [ "displaylist", ",", "vertexarray", ",", "vertexbuffer", ",", "immediate" ],
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 405.927734, 68.0, 83.572266, 21.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 90.858398, 46.0, 90.572266, 21.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-31",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 459.0, 204.0, 118.0, 21.0 ],
					"style" : "",
					"text" : "j.remote displaylist",
					"varname" : "screenmode"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-33",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 381.5, 204.0, 71.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 90.858398, 117.0, 60.0, 19.0 ],
					"style" : "",
					"text" : "displaylist"
				}

			}
, 			{
				"box" : 				{
					"activecolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"annotation" : "Cache in displaylist flag (default = 0) This feature may be used to speed up rendering time by creating and storing a list of gl drawing commands on the graphics card. This will have no effect if matrixoutput turned on.",
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
					"disabled" : [ 0 ],
					"id" : "obj-34",
					"itemtype" : 1,
					"maxclass" : "radiogroup",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 356.5, 204.0, 80.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 75.177734, 117.0, 82.930664, 18.0 ],
					"size" : 1,
					"style" : "",
					"values" : [ 0 ],
					"varname" : "SCREENMODE"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-40",
					"linecount" : 2,
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 813.927734, 329.0, 109.0, 33.0 ],
					"style" : "",
					"text" : "j.remote smoothing_angle",
					"varname" : "fontsize"
				}

			}
, 			{
				"box" : 				{
					"annotation" : "Specifies the edge angle above which to smooth vertex normals (default = 89.)",
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"format" : 6,
					"id" : "obj-41",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 756.927734, 327.0, 50.0, 21.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 243.430664, 253.734192, 50.0, 21.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-59",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 528.5, 68.0, 120.0, 21.0 ],
					"style" : "",
					"text" : "j.remote cache_mode",
					"varname" : "align"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-63",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 327.0, 68.0, 71.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 22.430664, 46.0, 71.0, 19.0 ],
					"style" : "",
					"text" : "cache mode"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-71",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 15.0, 215.0, 40.0, 21.0 ],
					"style" : "",
					"text" : "j.view",
					"varname" : "jmod.hub"
				}

			}
, 			{
				"box" : 				{
					"comment" : "",
					"id" : "obj-79",
					"maxclass" : "outlet",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 15.0, 246.0, 25.0, 25.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"comment" : "",
					"id" : "obj-80",
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 15.0, 181.0, 25.0, 25.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"id" : "obj-87",
					"maxclass" : "j.ui",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 0.0, 0.0, 300.0, 140.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.0, 0.0, 300.0, 280.0 ],
					"text" : "/no_model_address"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-1", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-9", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-11", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-51", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 164.0, 468.0, 137.0, 468.0, 137.0, 348.0, 164.0, 348.0 ],
					"source" : [ "obj-13", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-16", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-15", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-16", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-27", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-17", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-71", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-18", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-22", 0 ]
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
					"destination" : [ "obj-17", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-27", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-35", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-51", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-3", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-51", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-30", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-34", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-31", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-31", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-34", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-29", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-35", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-36", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-39", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-37", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-37", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-39", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-4", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-41", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-40", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-40", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-41", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-44", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-42", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-42", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-44", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-47", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-45", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-45", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-47", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-8", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-51", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-94", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-59", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-6", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-7", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-79", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-71", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-8", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-71", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-80", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-87", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-11", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-9", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-59", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-94", 1 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-36" : [ "live.text", "live.text", 0 ]
		}
,
		"dependency_cache" : [ 			{
				"name" : "j.gl_group.panel.maxpat",
				"bootpath" : "~/Documents/GITHUB/JamomaMax/Jamoma/patchers/components/openGL/gl_group",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.gl_group.view.maxpat",
				"bootpath" : "~/Documents/GITHUB/JamomaMax/Jamoma/patchers/components/openGL/gl_group",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.list2parameter.maxpat",
				"bootpath" : "~/Documents/GITHUB/JamomaMax/Jamoma/patchers/components/data/list2parameter",
				"type" : "JSON",
				"implicit" : 1
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
				"name" : "j.send.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.receive.mxo",
				"type" : "iLaX"
			}
 ],
		"autosave" : 0
	}

}
