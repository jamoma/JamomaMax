{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 6,
			"minor" : 0,
			"revision" : 0
		}
,
		"rect" : [ 190.0, 203.0, 477.0, 510.0 ],
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
					"id" : "obj-15",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "audio.connect", "" ],
					"patching_rect" : [ 305.0, 249.0, 80.0, 19.0 ],
					"text" : "j.pack≈ 2"
				}

			}
, 			{
				"box" : 				{
					"args" : [ "/input~" ],
					"id" : "obj-14",
					"maxclass" : "bpatcher",
					"name" : "jmod.input~.maxpat",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "signal", "signal" ],
					"patching_rect" : [ 85.0, 99.0, 300.0, 140.0 ],
					"presentation_rect" : [ 0.0, 0.0, 300.0, 140.0 ]
				}

			}
, 			{
				"box" : 				{
					"args" : [ "@name", "jmod.sur.output~", "@description", "Distribute multicable signals directly to dac~ output channels" ],
					"bgmode" : 1,
					"id" : "obj-1",
					"maxclass" : "bpatcher",
					"name" : "j.maxhelpui.maxpat",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 0.0, 0.0, 481.0, 70.0 ],
					"prototypename" : "bphelp",
					"varname" : "maxhelpui"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-2",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 85.0, 369.0, 300.0, 17.0 ],
					"text" : "/audio/active 0"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.529412, 0.529412, 0.529412, 1.0 ],
					"id" : "obj-6",
					"maxclass" : "scope~",
					"numinlets" : 2,
					"numoutlets" : 0,
					"patching_rect" : [ 190.0, 429.0, 100.0, 50.0 ],
					"rounded" : 0
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.529412, 0.529412, 0.529412, 1.0 ],
					"id" : "obj-7",
					"maxclass" : "scope~",
					"numinlets" : 2,
					"numoutlets" : 0,
					"patching_rect" : [ 85.0, 429.0, 100.0, 50.0 ],
					"rounded" : 0
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-8",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "signal" ],
					"patching_rect" : [ 85.0, 399.0, 124.0, 19.0 ],
					"text" : "adoutput~ 1 2"
				}

			}
, 			{
				"box" : 				{
					"args" : [ "/output" ],
					"id" : "obj-11",
					"lockeddragscroll" : 1,
					"maxclass" : "bpatcher",
					"name" : "jmod.sur.output~.maxpat",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 85.0, 284.0, 300.0, 70.0 ],
					"presentation_rect" : [ 0.0, 0.0, 300.0, 70.0 ],
					"varname" : "jmod.sur.output~"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 94.5, 360.0, 375.5, 360.0 ],
					"source" : [ "obj-11", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-14", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-14", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-11", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 314.5, 275.5, 375.5, 275.5 ],
					"source" : [ "obj-15", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-8", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-8", 0 ]
				}

			}
 ],
		"dependency_cache" : [ 			{
				"name" : "jmod.sur.output~.maxpat",
				"bootpath" : "/Users/lossius/dev/Jamoma/Modules/Modular/Max/modules/spatialization/sur.output~",
				"patcherrelativepath" : "",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "jalg.sur.output~.maxpat",
				"bootpath" : "/Users/lossius/dev/Jamoma/Modules/Modular/Max/modules/spatialization/sur.output~",
				"patcherrelativepath" : "",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.multi.out~.maxpat",
				"bootpath" : "/Users/lossius/dev/Jamoma/Modules/Modular/Max/library/components/multi.out%",
				"patcherrelativepath" : "../../../library/components/multi.out%",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.thru.maxpat",
				"bootpath" : "/Users/lossius/dev/Jamoma/Modules/Modular/Max/library/components/thru",
				"patcherrelativepath" : "../../../library/components/thru",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.audioOnOff.maxpat",
				"bootpath" : "/Users/lossius/dev/Jamoma/Modules/Modular/Max/library/components/audioOnOff",
				"patcherrelativepath" : "../../../library/components/audioOnOff",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.js_systeminfo.js",
				"bootpath" : "/Users/lossius/dev/Jamoma/Modules/Modular/Max/library/javascript",
				"patcherrelativepath" : "../../../library/javascript",
				"type" : "TEXT",
				"implicit" : 1
			}
, 			{
				"name" : "j.maxhelpui.maxpat",
				"bootpath" : "/Users/lossius/dev/Jamoma/Modules/Modular/Max/library/components/maxhelpui",
				"patcherrelativepath" : "../../../library/components/maxhelpui",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.maxhelpuiButton.png",
				"bootpath" : "/Users/lossius/dev/Jamoma/Modules/Modular/Max/library/components/maxhelpui",
				"patcherrelativepath" : "../../../library/components/maxhelpui",
				"type" : "PNG ",
				"implicit" : 1
			}
, 			{
				"name" : "j.maxhelpuiResize.js",
				"bootpath" : "/Users/lossius/dev/Jamoma/Modules/Modular/Max/library/components/maxhelpui",
				"patcherrelativepath" : "../../../library/components/maxhelpui",
				"type" : "TEXT",
				"implicit" : 1
			}
, 			{
				"name" : "j.jamomaPath.maxpat",
				"bootpath" : "/Users/lossius/dev/Jamoma/Modules/Modular/Max/library/components/jamomaPath",
				"patcherrelativepath" : "../../../library/components/jamomaPath",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "jmod.input~.maxpat",
				"bootpath" : "/Users/lossius/dev/Jamoma/Modules/Modular/Max/modules/audio/input~",
				"patcherrelativepath" : "../../audio/input~",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.meter_receive.maxpat",
				"bootpath" : "/Users/lossius/dev/Jamoma/Modules/Modular/Max/library/components/meter_receive",
				"patcherrelativepath" : "../../../library/components/meter_receive",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.ui.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.model.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.parameter.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.unpack≈.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.oscroute.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.pass.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.route.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.stats.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.limiter≈.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.gain≈.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.in.mxo",
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
				"name" : "j.return.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.textslider.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.loader.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.loader.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.meter~.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.dataspace.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.in~.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.out~.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.remote.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "j.pack≈.mxo",
				"type" : "iLaX"
			}
 ]
	}

}
