{
	"patcher" : 	{
		"fileversion" : 1,
		"rect" : [ 231.0, 44.0, 581.0, 725.0 ],
		"bglocked" : 0,
		"defrect" : [ 231.0, 44.0, 581.0, 725.0 ],
		"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
		"openinpresentation" : 0,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 0,
		"gridsize" : [ 5.0, 5.0 ],
		"gridsnaponopen" : 0,
		"toolbarvisible" : 1,
		"boxanimatetime" : 200,
		"imprint" : 0,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"boxes" : [ 			{
				"box" : 				{
					"id" : "obj-5",
					"maxclass" : "jit.pwindow",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 115.0, 435.0, 320.0, 240.0 ]
				}

			}
, 			{
				"box" : 				{
					"args" : [ "multichannelOutput" ],
					"id" : "obj-4",
					"maxclass" : "bpatcher",
					"name" : "jmod.sur.output~.maxpat",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 115.0, 200.0, 300.0, 70.0 ],
					"presentation_rect" : [ 299.0, 329.0, 300.0, 70.0 ]
				}

			}
, 			{
				"box" : 				{
					"args" : [ "waveformViewer" ],
					"id" : "obj-3",
					"maxclass" : "bpatcher",
					"name" : "jmod.sur.waveformViewer~.maxpat",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "jit_matrix" ],
					"patching_rect" : [ 115.0, 345.0, 300.0, 70.0 ],
					"presentation_rect" : [ 294.0, 237.0, 300.0, 70.0 ]
				}

			}
, 			{
				"box" : 				{
					"args" : [ "multichannelPlayback" ],
					"id" : "obj-1",
					"maxclass" : "bpatcher",
					"name" : "jmod.sur.input~.maxpat",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "audio.connect" ],
					"patching_rect" : [ 115.0, 115.0, 300.0, 70.0 ],
					"presentation_rect" : [ 0.0, 0.0, 300.0, 70.0 ]
				}

			}
, 			{
				"box" : 				{
					"args" : [ "@description", "View waveform of real-time multichannel signal as jitter matrix" ],
					"bgmode" : 1,
					"id" : "obj-10",
					"maxclass" : "bpatcher",
					"name" : "j.maxhelpui.maxpat",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 0.0, 0.0, 581.0, 70.0 ],
					"prototypename" : "bphelp",
					"varname" : "maxhelpui"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 1 ],
					"hidden" : 0,
					"midpoints" : [ 405.5, 192.0, 427.0, 192.0, 427.0, 284.0, 405.5, 284.0 ],
					"source" : [ "obj-1", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 1 ],
					"hidden" : 0,
					"midpoints" : [  ],
					"source" : [ "obj-1", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"hidden" : 0,
					"midpoints" : [ 405.5, 424.0, 124.5, 424.0 ],
					"source" : [ "obj-3", 1 ]
				}

			}
 ]
	}

}
