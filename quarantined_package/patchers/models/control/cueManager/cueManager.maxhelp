{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 6,
			"minor" : 1,
			"revision" : 7,
			"architecture" : "x86"
		}
,
		"rect" : [ 633.0, 59.0, 417.0, 487.0 ],
		"bglocked" : 0,
		"openinpresentation" : 0,
		"default_fontsize" : 10.0,
		"default_fontface" : 0,
		"default_fontname" : "Verdana",
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
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-10",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 0,
					"patching_rect" : [ 65.0, 466.0, 100.0, 19.0 ],
					"text" : "cue_conventions"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-8",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 278.0, 292.0, 100.0, 19.0 ],
					"text" : "j.namespace"
				}

			}
, 			{
				"box" : 				{
					"annotation" : "Emulate the use of lower sample-rates and bit-resolution.",
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-2",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 0,
					"patching_rect" : [ 65.0, 356.5, 122.0, 17.0 ],
					"text" : "degrade~.model @priority 3"
				}

			}
, 			{
				"box" : 				{
					"annotation" : "a cue list module",
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-6",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 54.0, 297.0, 164.0, 19.0 ],
					"text" : "cueManager.model @priority 1"
				}

			}
, 			{
				"box" : 				{
					"annotation" : "a cue list module",
					"id" : "obj-7",
					"maxclass" : "bpatcher",
					"name" : "cueManager.view.maxpat",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 54.0, 102.0, 300.0, 70.0 ],
					"presentation_rect" : [ 100.0, 258.0, 300.0, 70.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"frgb" : 0.0,
					"id" : "obj-9",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 65.0, 417.0, 276.0, 31.0 ],
					"text" : "modules are fetched/recalled by increasing priority (this can be changed in the cue editor (+ button)"
				}

			}
, 			{
				"box" : 				{
					"annotation" : "none",
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-3",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 65.0, 380.0, 100.0, 19.0 ],
					"text" : "track.model"
				}

			}
, 			{
				"box" : 				{
					"annotation" : "none",
					"id" : "obj-5",
					"maxclass" : "bpatcher",
					"name" : "degrade~.view.maxpat",
					"numinlets" : 0,
					"numoutlets" : 0,
					"patching_rect" : [ 54.0, 197.0, 300.0, 70.0 ],
					"presentation_rect" : [ 247.0, 337.0, 300.0, 70.0 ]
				}

			}
, 			{
				"box" : 				{
					"annotation" : "none",
					"id" : "obj-4",
					"maxclass" : "bpatcher",
					"name" : "mouse.view.maxpat",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 205.0, 330.0, 150.0, 70.0 ],
					"presentation_rect" : [ 15.0, 15.0, 150.0, 70.0 ]
				}

			}
, 			{
				"box" : 				{
					"annotation" : "Output information from mouse",
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-1",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 65.0, 327.0, 119.0, 17.0 ],
					"text" : "mouse.model @priority 2"
				}

			}
, 			{
				"box" : 				{
					"args" : [ "@name", "cueManager", "@description", "Module for managing cuelists" ],
					"bgmode" : 1,
					"id" : "obj-12",
					"maxclass" : "bpatcher",
					"name" : "j.maxhelpui.maxpat",
					"numinlets" : 0,
					"numoutlets" : 0,
					"patching_rect" : [ 0.0, 0.0, 417.0, 70.0 ],
					"prototypename" : "bphelp",
					"varname" : "maxhelpui"
				}

			}
 ],
		"lines" : [  ],
		"dependency_cache" : [ 			{
				"name" : "mouse.model.maxpat",
				"bootpath" : "/Users/bltzr/dev/Jamoma/Implementations/Max/Jamoma/patchers/modules/control/mouse",
				"patcherrelativepath" : "../../../../../Jamoma/patchers/modules/control/mouse",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "mouse.view.maxpat",
				"bootpath" : "/Users/bltzr/dev/Jamoma/Implementations/Max/Jamoma/patchers/modules/control/mouse",
				"patcherrelativepath" : "../../../../../Jamoma/patchers/modules/control/mouse",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "track.model.maxpat",
				"bootpath" : "/Users/bltzr/dev/Jamoma/Implementations/Max/Jamoma/examples/Modular0.6_overview/track",
				"patcherrelativepath" : "../../../../../Jamoma/examples/Modular0.6_overview/track",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "myMovie.model.maxpat",
				"bootpath" : "/Users/bltzr/dev/Jamoma/Implementations/Max/Jamoma/examples/Modular0.6_overview/movie",
				"patcherrelativepath" : "../../../../../Jamoma/examples/Modular0.6_overview/movie",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "cueManager.view.maxpat",
				"bootpath" : "/Users/bltzr/dev/Jamoma/Implementations/Max/quarantined_package/patchers/models/control/cueManager",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "cueManager.model.maxpat",
				"bootpath" : "/Users/bltzr/dev/Jamoma/Implementations/Max/quarantined_package/patchers/models/control/cueManager",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.namespace+.maxpat",
				"bootpath" : "/Users/bltzr/dev/Jamoma/Implementations/Max/Jamoma/patchers/components/quarantined/namespace+",
				"patcherrelativepath" : "../../../../../Jamoma/patchers/components/quarantined/namespace+",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "cue_conventions.maxpat",
				"bootpath" : "/Users/bltzr/dev/Jamoma/Implementations/Max/Jamoma/help",
				"patcherrelativepath" : "../../../../../Jamoma/help",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.parameter.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.return.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.model.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.init.mxo",
				"type" : "iLaX"
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
				"name" : "j.message.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.out.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.namespace.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.receive.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.send.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.oscroute.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.cue.mxo",
				"type" : "iLaX"
			}
 ]
	}

}
