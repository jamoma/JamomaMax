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
		"rect" : [ 13.0, 44.0, 802.0, 721.0 ],
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
					"frgb" : 0.0,
					"id" : "obj-10",
					"linecount" : 5,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 349.0, 424.0, 320.0, 67.0 ],
					"text" : "A similarity matrix is a matrix of scores which express the similarity between two data points. In this implementation the matrix is shifted 90 degrees and plotted on top of itself. The result is an image that may reveal interesting structural elements in the material. "
				}

			}
, 			{
				"box" : 				{
					"args" : [ "@name", "similarity%", "@description", "Create a similarity matrix from a video stream" ],
					"bgmode" : 1,
					"id" : "obj-9",
					"maxclass" : "bpatcher",
					"name" : "j.maxhelpui.maxpat",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 0.0, 0.0, 802.0, 70.0 ],
					"prototypename" : "bphelp",
					"varname" : "maxhelpui"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-1",
					"maxclass" : "jit.pwindow",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 73.0, 168.0, 240.0, 180.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-2",
					"maxclass" : "jit.pwindow",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 349.0, 168.0, 320.0, 240.0 ],
					"presentation_rect" : [ 0.0, 0.0, 320.0, 240.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-3",
					"lockeddragscroll" : 1,
					"maxclass" : "bpatcher",
					"name" : "similarity%.module.maxpat",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 350.0, 87.0, 300.0, 70.0 ],
					"presentation_rect" : [ 0.0, 0.0, 300.0, 70.0 ],
					"varname" : "/similarity%"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-4",
					"lockeddragscroll" : 1,
					"maxclass" : "bpatcher",
					"name" : "input%.module.maxpat",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 43.0, 87.0, 300.0, 70.0 ],
					"presentation_rect" : [ 0.0, 0.0, 300.0, 70.0 ],
					"varname" : "/input%"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-5",
					"lockeddragscroll" : 1,
					"maxclass" : "bpatcher",
					"name" : "motiongram%.module.maxpat",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 43.0, 440.0, 300.0, 70.0 ],
					"presentation_rect" : [ 0.0, 0.0, 300.0, 70.0 ],
					"varname" : "/motiongram%[1]"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-6",
					"maxclass" : "jit.pwindow",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 43.0, 524.0, 240.0, 180.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-13",
					"lockeddragscroll" : 1,
					"maxclass" : "bpatcher",
					"name" : "motion2%.module.maxpat",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 43.0, 354.0, 300.0, 70.0 ],
					"presentation_rect" : [ 0.0, 0.0, 300.0, 70.0 ],
					"varname" : "/motion%"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"frgb" : 0.0,
					"id" : "obj-14",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 662.0, 111.0, 136.0, 31.0 ],
					"text" : "The algorithm can only be changed in mode 1"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-13", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-3", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-4", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-4", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 52.5, 518.0, 29.0, 518.0, 29.0, 76.0, 359.5, 76.0 ],
					"source" : [ "obj-5", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-5", 0 ]
				}

			}
 ],
		"dependency_cache" : [ 			{
				"name" : "motion2%.module.maxpat",
				"bootpath" : "/Users/reno/Documents/GITs/Jamoma/Implementations/Max/Jamoma/patchers/modules/video/fx/motion2%",
				"patcherrelativepath" : "../motion2%",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "motion2%.model.maxpat",
				"bootpath" : "/Users/reno/Documents/GITs/Jamoma/Implementations/Max/Jamoma/patchers/modules/video/fx/motion2%",
				"patcherrelativepath" : "../motion2%",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.motion%.maxpat",
				"bootpath" : "/Users/reno/Documents/GITs/Jamoma/Implementations/Max/Jamoma/patchers/components/video/motion%",
				"patcherrelativepath" : "../../../../components/video/motion%",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.noiseremoval%.maxpat",
				"bootpath" : "/Users/reno/Documents/GITs/Jamoma/Implementations/Max/Jamoma/patchers/components/video/noiseremoval%",
				"patcherrelativepath" : "../../../../components/video/noiseremoval%",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.rgb2luma%.maxpat",
				"bootpath" : "/Users/reno/Documents/GITs/Jamoma/Implementations/Max/Jamoma/patchers/components/video/rgb2luma%",
				"patcherrelativepath" : "../../../../components/video/rgb2luma%",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.sum%.maxpat",
				"bootpath" : "/Users/reno/Documents/GITs/Jamoma/Implementations/Max/Jamoma/patchers/components/video/sum%",
				"patcherrelativepath" : "../../../../components/video/sum%",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "motion2%.view.maxpat",
				"bootpath" : "/Users/reno/Documents/GITs/Jamoma/Implementations/Max/Jamoma/patchers/modules/video/fx/motion2%",
				"patcherrelativepath" : "../motion2%",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "motiongram%.module.maxpat",
				"bootpath" : "/Users/reno/Documents/GITs/Jamoma/Implementations/Max/Jamoma/patchers/modules/video/fx/motiongram%",
				"patcherrelativepath" : "../motiongram%",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "motiongram%.model.maxpat",
				"bootpath" : "/Users/reno/Documents/GITs/Jamoma/Implementations/Max/Jamoma/patchers/modules/video/fx/motiongram%",
				"patcherrelativepath" : "../motiongram%",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.mean%.maxpat",
				"bootpath" : "/Users/reno/Documents/GITs/Jamoma/Implementations/Max/Jamoma/patchers/components/video/mean%",
				"patcherrelativepath" : "../../../../components/video/mean%",
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
				"name" : "j.float2char%.maxpat",
				"bootpath" : "/Users/reno/Documents/GITs/Jamoma/Implementations/Max/Jamoma/patchers/components/video/float2char%",
				"patcherrelativepath" : "../../../../components/video/float2char%",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "motiongram%.view.maxpat",
				"bootpath" : "/Users/reno/Documents/GITs/Jamoma/Implementations/Max/Jamoma/patchers/modules/video/fx/motiongram%",
				"patcherrelativepath" : "../motiongram%",
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
				"name" : "input%.module.maxpat",
				"bootpath" : "/Users/reno/Documents/GITs/Jamoma/Implementations/Max/Jamoma/patchers/modules/video/sources/input%",
				"patcherrelativepath" : "../../sources/input%",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "input%.model.maxpat",
				"bootpath" : "/Users/reno/Documents/GITs/Jamoma/Implementations/Max/Jamoma/patchers/modules/video/sources/input%",
				"patcherrelativepath" : "../../sources/input%",
				"type" : "TEXT",
				"implicit" : 1
			}
, 			{
				"name" : "noise%.model.maxpat",
				"bootpath" : "/Users/reno/Documents/GITs/Jamoma/Implementations/Max/Jamoma/patchers/modules/video/sources/noise%",
				"patcherrelativepath" : "../../sources/noise%",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "movie%.model.maxpat",
				"bootpath" : "/Users/reno/Documents/GITs/Jamoma/Implementations/Max/Jamoma/patchers/modules/video/sources/movie%",
				"patcherrelativepath" : "../../sources/movie%",
				"type" : "TEXT",
				"implicit" : 1
			}
, 			{
				"name" : "grab%.model.maxpat",
				"bootpath" : "/Users/reno/Documents/GITs/Jamoma/Implementations/Max/Jamoma/patchers/modules/video/sources/grab%",
				"patcherrelativepath" : "../../sources/grab%",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "input%.view.maxpat",
				"bootpath" : "/Users/reno/Documents/GITs/Jamoma/Implementations/Max/Jamoma/patchers/modules/video/sources/input%",
				"patcherrelativepath" : "../../sources/input%",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "input%.ui.maxpat",
				"bootpath" : "/Users/reno/Documents/GITs/Jamoma/Implementations/Max/Jamoma/patchers/modules/video/sources/input%",
				"patcherrelativepath" : "../../sources/input%",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "similarity%.module.maxpat",
				"bootpath" : "/Users/reno/Documents/GITs/Jamoma/Implementations/Max/Jamoma/patchers/modules/video/fx/similarity%",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "similarity%.model.maxpat",
				"bootpath" : "/Users/reno/Documents/GITs/Jamoma/Implementations/Max/Jamoma/patchers/modules/video/fx/similarity%",
				"patcherrelativepath" : ".",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "similarity%.view.maxpat",
				"bootpath" : "/Users/reno/Documents/GITs/Jamoma/Implementations/Max/Jamoma/patchers/modules/video/fx/similarity%",
				"patcherrelativepath" : ".",
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
				"name" : "j.return.mxo",
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
				"name" : "j.message.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "xray.jit.mean.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.receive.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.pass.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.send.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.init.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.savebang.mxo",
				"type" : "iLaX"
			}
 ]
	}

}
