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
		"rect" : [ 100.0, 100.0, 511.0, 432.0 ],
		"bglocked" : 0,
		"openinpresentation" : 0,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
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
					"border" : 0,
					"filename" : "helpdetails.js",
					"id" : "obj-3",
					"ignoreclick" : 1,
					"jsarguments" : [ "j.parameter_create", 75 ],
					"maxclass" : "jsui",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 10.0, 10.0, 476.0, 72.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-2",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 58.0, 327.0, 58.0, 22.0 ],
					"style" : "",
					"text" : "j.model"
				}

			}
, 			{
				"box" : 				{
					"bubble" : 1,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-7",
					"linecount" : 7,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 204.5, 249.0, 201.0, 104.0 ],
					"style" : "",
					"text" : "Double-click.\n\nProvide name of the object, and set all attributes. By hitting the \"Generate\" button, the object is script-created and added to the model.",
					"textcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-4",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 10.0, 102.0, 399.0, 33.0 ],
					"style" : "",
					"text" : "Helper utility when creating j.parameter, j.message or j.return objects while developping a module.",
					"textcolor" : [ 0.239216, 0.254902, 0.278431, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-1",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 0,
					"patching_rect" : [ 58.0, 290.0, 124.0, 22.0 ],
					"style" : "",
					"text" : "j.parameter_create"
				}

			}
 ],
		"lines" : [  ],
		"parameters" : 		{
			"obj-1::obj-163" : [ "live.text[2]", "live.text", 0 ],
			"obj-1::obj-170" : [ "live.text[9]", "live.text", 0 ],
			"obj-1::obj-171" : [ "live.text[10]", "live.text", 0 ],
			"obj-1::obj-162" : [ "live.text[1]", "live.text", 0 ],
			"obj-1::obj-172" : [ "live.text[11]", "live.text", 0 ],
			"obj-1::obj-176" : [ "live.text[15]", "live.text", 0 ],
			"obj-1::obj-173" : [ "live.text[12]", "live.text", 0 ],
			"obj-1::obj-166" : [ "live.text[5]", "live.text", 0 ],
			"obj-1::obj-167" : [ "live.text[6]", "live.text", 0 ],
			"obj-1::obj-174" : [ "live.text[13]", "live.text", 0 ],
			"obj-1::obj-168" : [ "live.text[7]", "live.text", 0 ],
			"obj-1::obj-169" : [ "live.text[8]", "live.text", 0 ],
			"obj-1::obj-164" : [ "live.text[3]", "live.text", 0 ],
			"obj-1::obj-165" : [ "live.text[4]", "live.text", 0 ],
			"obj-1::obj-175" : [ "live.text[14]", "live.text", 0 ],
			"obj-1::obj-161" : [ "live.text", "live.text", 0 ]
		}
,
		"dependency_cache" : [ 			{
				"name" : "j.parameter_create.maxpat",
				"bootpath" : "~/dev/Jamoma/JamomaMax/Jamoma/patchers/components/data/parameter_create",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.thisparentpatcher.js",
				"bootpath" : "~/dev/Jamoma/JamomaMax/Jamoma/javascript",
				"type" : "TEXT",
				"implicit" : 1
			}
, 			{
				"name" : "j.parameter_create_preset_doc.js",
				"bootpath" : "~/dev/Jamoma/JamomaMax/Jamoma/javascript",
				"type" : "TEXT",
				"implicit" : 1
			}
, 			{
				"name" : "helpdetails.js",
				"bootpath" : "C74:/help/resources",
				"type" : "TEXT",
				"implicit" : 1
			}
, 			{
				"name" : "j.map.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.unit.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.model.mxo",
				"type" : "iLaX"
			}
 ],
		"embedsnapshot" : 0
	}

}
