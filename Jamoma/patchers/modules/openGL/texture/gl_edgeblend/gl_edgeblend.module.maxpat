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
		"rect" : [ 581.0, 194.0, 311.0, 275.0 ],
		"bglocked" : 0,
		"openinpresentation" : 0,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 0,
		"gridsize" : [ 15.0, 15.0 ],
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
					"annotation" : "none",
					"args" : [ "#1" ],
					"id" : "obj-1",
					"maxclass" : "bpatcher",
					"name" : "gl_edgeblend.view.maxpat",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 0.0, 0.0, 300.0, 70.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 15.0, 15.0, 300.0, 70.0 ]
				}

			}
, 			{
				"box" : 				{
					"annotation" : "Apply edgblending to incomming matrix or texture.",
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-28",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 28.0, 175.0, 158.0, 20.0 ],
					"text" : "gl_edgeblend.model #1",
					"varname" : "j.model"
				}

			}
, 			{
				"box" : 				{
					"comment" : "",
					"id" : "obj-30",
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 28.0, 127.0, 26.0, 26.0 ]
				}

			}
, 			{
				"box" : 				{
					"comment" : "",
					"id" : "obj-33",
					"maxclass" : "outlet",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 167.0, 214.0, 27.0, 27.0 ]
				}

			}
, 			{
				"box" : 				{
					"comment" : "",
					"id" : "obj-40",
					"maxclass" : "outlet",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 28.0, 214.0, 26.0, 26.0 ]
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-33", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-28", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-40", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-28", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-28", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-30", 0 ]
				}

			}
 ],
		"dependency_cache" : [ 			{
				"name" : "gl_edgeblend.model.maxpat",
				"bootpath" : "/Users/reno/Documents/GITs/Jamoma/Implementations/Max/Jamoma/patchers/modules/openGL/texture/gl_edgeblend",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "thru.maxpat",
				"bootpath" : "/Applications/Max 6.1/patches/m4l-patches/Pluggo for Live resources/patches",
				"patcherrelativepath" : "../../../../../../../../../../../../../Applications/Max 6.1/patches/m4l-patches/Pluggo for Live resources/patches",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.gl_group.model.maxpat",
				"bootpath" : "/Users/reno/Documents/GITs/Jamoma/Implementations/Max/Jamoma/patchers/components/openGL/gl_group",
				"patcherrelativepath" : "../../../../components/openGL/gl_group",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "gl_edgeblend.view.maxpat",
				"bootpath" : "/Users/reno/Documents/GITs/Jamoma/Implementations/Max/Jamoma/patchers/modules/openGL/texture/gl_edgeblend",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.gl_group.view.maxpat",
				"bootpath" : "/Users/reno/Documents/GITs/Jamoma/Implementations/Max/Jamoma/patchers/components/openGL/gl_group",
				"patcherrelativepath" : "../../../../components/openGL/gl_group",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.list2parameter.maxpat",
				"bootpath" : "/Users/reno/Documents/GITs/Jamoma/Implementations/Max/Jamoma/patchers/components/data/list2parameter",
				"patcherrelativepath" : "../../../../components/data/list2parameter",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.in.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.out.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.parameter.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.model.mxo",
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
				"name" : "j.send.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.unit.mxo",
				"type" : "iLaX"
			}
 ]
	}

}
