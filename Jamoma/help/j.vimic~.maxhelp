{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 6,
			"minor" : 0,
			"revision" : 0
		}
,
		"rect" : [ 309.0, 135.0, 519.0, 355.0 ],
		"bglocked" : 0,
		"openinpresentation" : 0,
		"default_fontsize" : 10.0,
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
					"handoff" : "",
					"id" : "obj-12",
					"maxclass" : "ubutton",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "bang", "bang", "", "int" ],
					"patching_rect" : [ 16.377563, 276.0, 375.0, 21.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"hidden" : 1,
					"id" : "obj-10",
					"linecount" : 2,
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 29.877563, 302.5, 434.0, 29.0 ],
					"text" : ";\rmax launchbrowser https://github.com/Nilson/ViMiC-and-friends/archive/v0.5.7.RC2.zip" 
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frgb" : [ 0.152941, 0.254902, 0.658824, 1.0 ],
					"id" : "obj-4",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 28.0, 276.0, 473.0, 21.0 ],
					"text" : "here",
					"textcolor" : [ 0.152941, 0.254902, 0.658824, 1.0 ],
					"underline" : 1
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-3",
					"linecount" : 11,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 28.0, 109.0, 477.0, 167.0 ],
					"text" : "ViMiC is a tool for real-time spatialization synthesis, particularly for concert situations and site-specific immersive installations, and especially for larger or non-centralized audiences. \n\nBased on the concept of virtual microphones positioned within a virtual 3D room, ViMiC supports loudspeaker reproduction up to 24 discrete channels for which the loudspeakers do not necessarily have to be placed uniformly and equidistant around the audience. \n\n\nTo download the ViMiC modules for Jamoma including a users manual, click"
				}

			}
, 			{
				"box" : 				{
					"args" : [ "@name", "j.vimic~", "@description", "Virtual Microphone Control" ],
					"bgmode" : 1,
					"id" : "obj-1",
					"maxclass" : "bpatcher",
					"name" : "j.maxhelpui.maxpat",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 0.0, 0.0, 519.0, 70.0 ],
					"varname" : "maxhelpui"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 0 ],
					"disabled" : 0,
					"hidden" : 1,
					"source" : [ "obj-12", 0 ]
				}

			}
 ],
		"dependency_cache" : [ 			{
				"name" : "j.maxhelpui.maxpat",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.maxhelpuiButton.png",
				"type" : "PNG ",
				"implicit" : 1
			}
, 			{
				"name" : "j.maxhelpuiResize.js",
				"type" : "TEXT",
				"implicit" : 1
			}
, 			{
				"name" : "j.jamomaPath.maxpat",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "thru.maxpat",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "j.route.mxo",
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
 ]
	}

}
