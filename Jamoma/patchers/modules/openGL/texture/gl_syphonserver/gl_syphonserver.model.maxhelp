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
		"rect" : [ 208.0, 399.0, 682.0, 374.0 ],
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
					"annotation" : "none",
					"id" : "obj-4",
					"lockeddragscroll" : 1,
					"maxclass" : "bpatcher",
					"name" : "window%.module.maxpat",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "bang", "" ],
					"patching_rect" : [ 350.0, 70.0, 300.0, 105.0 ],
					"presentation_rect" : [ 346.0, 278.0, 300.0, 105.0 ]
				}

			}
, 			{
				"box" : 				{
					"annotation" : "none",
					"id" : "obj-2",
					"lockeddragscroll" : 1,
					"maxclass" : "bpatcher",
					"name" : "gl_render.module.maxpat",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 350.0, 190.0, 300.0, 175.0 ],
					"presentation_rect" : [ 351.5, 92.0, 300.0, 175.0 ]
				}

			}
, 			{
				"box" : 				{
					"annotation" : "none",
					"id" : "obj-1",
					"lockeddragscroll" : 1,
					"maxclass" : "bpatcher",
					"name" : "gl_syphonserver.module.maxpat",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 20.5, 214.0, 300.0, 70.0 ],
					"presentation_rect" : [ 22.5, 214.0, 300.0, 70.0 ]
				}

			}
, 			{
				"box" : 				{
					"args" : [ "@name", "gl.syphonserver%.model", "@description", "publish a GL texture to Syphon protocol" ],
					"bgmode" : 1,
					"id" : "obj-3",
					"maxclass" : "bpatcher",
					"name" : "j.maxhelpui.maxpat",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 0.0, 0.0, 682.0, 70.0 ],
					"prototypename" : "bphelp",
					"varname" : "maxhelpui"
				}

			}
, 			{
				"box" : 				{
					"annotation" : "Input from either a camera - video file - noise synthesis - or a real time screen capture.",
					"args" : [ "input%" ],
					"id" : "obj-12",
					"lockeddragscroll" : 1,
					"maxclass" : "bpatcher",
					"name" : "input%.module.maxpat",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 20.5, 95.0, 300.0, 70.0 ],
					"presentation_rect" : [ 0.0, 0.0, 300.0, 70.0 ],
					"varname" : "input%"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-12", 0 ]
				}

			}
 ],
		"dependency_cache" : [ 			{
				"name" : "input%.module.maxpat",
				"bootpath" : "/Users/reno/Documents/GITs/Jamoma/Implementations/Max/Jamoma/patchers/modules/video/sources/input%",
				"patcherrelativepath" : "../../../video/sources/input%",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "input%.model.maxpat",
				"bootpath" : "/Users/reno/Documents/GITs/Jamoma/Implementations/Max/Jamoma/patchers/modules/video/sources/input%",
				"patcherrelativepath" : "../../../video/sources/input%",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "noise%.model.maxpat",
				"bootpath" : "/Users/reno/Documents/GITs/Jamoma/Implementations/Max/Jamoma/patchers/modules/video/sources/noise%",
				"patcherrelativepath" : "../../../video/sources/noise%",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "movie%.model.maxpat",
				"bootpath" : "/Users/reno/Documents/GITs/Jamoma/Implementations/Max/Jamoma/patchers/modules/video/sources/movie%",
				"patcherrelativepath" : "../../../video/sources/movie%",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "grab%.model.maxpat",
				"bootpath" : "/Users/reno/Documents/GITs/Jamoma/Implementations/Max/Jamoma/patchers/modules/video/sources/grab%",
				"patcherrelativepath" : "../../../video/sources/grab%",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "input%.view.maxpat",
				"bootpath" : "/Users/reno/Documents/GITs/Jamoma/Implementations/Max/Jamoma/patchers/modules/video/sources/input%",
				"patcherrelativepath" : "../../../video/sources/input%",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "input%.ui.maxpat",
				"bootpath" : "/Users/reno/Documents/GITs/Jamoma/Implementations/Max/Jamoma/patchers/modules/video/sources/input%",
				"patcherrelativepath" : "../../../video/sources/input%",
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
				"name" : "j.maxhelpui.maxpat",
				"bootpath" : "/Users/reno/Documents/GITs/Jamoma/Implementations/Max/Jamoma/patchers/components/data/maxhelpui",
				"patcherrelativepath" : "../../../../components/data/maxhelpui",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.maxhelpuiButton.png",
				"bootpath" : "/Users/reno/Documents/GITs/Jamoma/Implementations/Max/Jamoma/patchers/components/data/maxhelpui",
				"patcherrelativepath" : "../../../../components/data/maxhelpui",
				"type" : "PNG ",
				"implicit" : 1
			}
, 			{
				"name" : "j.maxhelpuiResize.js",
				"bootpath" : "/Users/reno/Documents/GITs/Jamoma/Implementations/Max/Jamoma/patchers/components/data/maxhelpui",
				"patcherrelativepath" : "../../../../components/data/maxhelpui",
				"type" : "TEXT",
				"implicit" : 1
			}
, 			{
				"name" : "j.jamomaPath.maxpat",
				"bootpath" : "/Users/reno/Documents/GITs/Jamoma/Implementations/Max/Jamoma/patchers/components/data/jamomaPath",
				"patcherrelativepath" : "../../../../components/data/jamomaPath",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "gl_syphonserver.module.maxpat",
				"bootpath" : "/Users/reno/Documents/GITs/Jamoma/Implementations/Max/Jamoma/patchers/modules/openGL/texture/gl_syphonserver",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "gl_syphonserver.view.maxpat",
				"bootpath" : "/Users/reno/Documents/GITs/Jamoma/Implementations/Max/Jamoma/patchers/modules/openGL/texture/gl_syphonserver",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "gl_syphonserver.model.maxpat",
				"bootpath" : "/Users/reno/Documents/GITs/Jamoma/Implementations/Max/Jamoma/patchers/modules/openGL/texture/gl_syphonserver",
				"patcherrelativepath" : ".",
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
				"name" : "gl_render.module.maxpat",
				"bootpath" : "/Users/reno/Documents/GITs/Jamoma/Implementations/Max/Jamoma/patchers/modules/openGL/gl_render",
				"patcherrelativepath" : "../../gl_render",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "gl_render.view.maxpat",
				"bootpath" : "/Users/reno/Documents/GITs/Jamoma/Implementations/Max/Jamoma/patchers/modules/openGL/gl_render",
				"patcherrelativepath" : "../../gl_render",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.gl_group.panel.maxpat",
				"bootpath" : "/Users/reno/Documents/GITs/Jamoma/Implementations/Max/Jamoma/patchers/components/openGL/gl_group",
				"patcherrelativepath" : "../../../../components/openGL/gl_group",
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
				"name" : "gl_render_basic_view.maxpat",
				"bootpath" : "/Users/reno/Documents/GITs/Jamoma/Implementations/Max/Jamoma/patchers/modules/openGL/gl_render/view_tabs",
				"patcherrelativepath" : "../../gl_render/view_tabs",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "gl_render.model.maxpat",
				"bootpath" : "/Users/reno/Documents/GITs/Jamoma/Implementations/Max/Jamoma/patchers/modules/openGL/gl_render",
				"patcherrelativepath" : "../../gl_render",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "window%.module.maxpat",
				"bootpath" : "/Users/reno/Documents/GITs/Jamoma/Implementations/Max/Jamoma/patchers/modules/video/output/window%",
				"patcherrelativepath" : "../../../video/output/window%",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "window%.view.maxpat",
				"bootpath" : "/Users/reno/Documents/GITs/Jamoma/Implementations/Max/Jamoma/patchers/modules/video/output/window%",
				"patcherrelativepath" : "../../../video/output/window%",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "window%.model.maxpat",
				"bootpath" : "/Users/reno/Documents/GITs/Jamoma/Implementations/Max/Jamoma/patchers/modules/video/output/window%",
				"patcherrelativepath" : "../../../video/output/window%",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.parameter.mxo",
				"type" : "iLaX"
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
				"name" : "j.model.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.send.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.namespace.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.oscroute.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.init.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.message.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.receive.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.return.mxo",
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
				"name" : "j.view.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.savebang.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "jit.gl.syphonserver.mxo",
				"type" : "iLaX"
			}
 ]
	}

}
