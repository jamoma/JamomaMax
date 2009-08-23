{
	"patcher" : 	{
		"fileversion" : 1,
		"rect" : [ 113.0, 125.0, 586.0, 670.0 ],
		"bglocked" : 0,
		"defrect" : [ 113.0, 125.0, 586.0, 670.0 ],
		"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
		"openinpresentation" : 0,
		"default_fontsize" : 10.0,
		"default_fontface" : 0,
		"default_fontname" : "Verdana",
		"gridonopen" : 0,
		"gridsize" : [ 5.0, 5.0 ],
		"gridsnaponopen" : 0,
		"toolbarvisible" : 1,
		"boxanimatetime" : 200,
		"imprint" : 0,
		"metadata" : [  ],
		"boxes" : [ 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "clear",
					"outlettype" : [ "" ],
					"patching_rect" : [ 440.0, 275.0, 35.0, 17.0 ],
					"id" : "obj-4",
					"fontname" : "Verdana",
					"numinlets" : 2,
					"numoutlets" : 1,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "fromsymbol",
					"outlettype" : [ "" ],
					"patching_rect" : [ 265.0, 245.0, 70.0, 19.0 ],
					"id" : "obj-3",
					"fontname" : "Verdana",
					"numinlets" : 1,
					"numoutlets" : 1,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "regexp .*\\\\.maxhelp",
					"outlettype" : [ "", "", "", "", "" ],
					"patching_rect" : [ 215.0, 220.0, 119.0, 19.0 ],
					"id" : "obj-1",
					"fontname" : "Verdana",
					"numinlets" : 1,
					"numoutlets" : 5,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "- 1",
					"outlettype" : [ "int" ],
					"patching_rect" : [ 215.0, 360.0, 32.5, 19.0 ],
					"id" : "obj-528",
					"fontname" : "Verdana",
					"numinlets" : 2,
					"numoutlets" : 1,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "types JSON",
					"outlettype" : [ "" ],
					"patching_rect" : [ 125.0, 105.0, 68.0, 17.0 ],
					"id" : "obj-167",
					"fontname" : "Verdana",
					"numinlets" : 2,
					"numoutlets" : 1,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 15.0, 205.0, 20.0, 20.0 ],
					"id" : "obj-68",
					"numinlets" : 1,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "give the help patcher time to do something bad",
					"linecount" : 2,
					"frgb" : [ 0.658824, 0.658824, 0.658824, 1.0 ],
					"patching_rect" : [ 150.0, 535.0, 150.0, 31.0 ],
					"id" : "obj-67",
					"fontname" : "Verdana",
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "p delay",
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 100.0, 545.0, 49.0, 19.0 ],
					"id" : "obj-65",
					"fontname" : "Verdana",
					"numinlets" : 1,
					"numoutlets" : 2,
					"fontsize" : 10.0,
					"patcher" : 					{
						"fileversion" : 1,
						"rect" : [ 64.0, 69.0, 203.0, 315.0 ],
						"bglocked" : 0,
						"defrect" : [ 64.0, 69.0, 203.0, 315.0 ],
						"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
						"openinpresentation" : 0,
						"default_fontsize" : 10.0,
						"default_fontface" : 0,
						"default_fontname" : "Verdana",
						"gridonopen" : 0,
						"gridsize" : [ 5.0, 5.0 ],
						"gridsnaponopen" : 0,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"metadata" : [  ],
						"boxes" : [ 							{
								"box" : 								{
									"maxclass" : "outlet",
									"patching_rect" : [ 30.0, 215.0, 20.0, 20.0 ],
									"id" : "obj-10",
									"numinlets" : 1,
									"numoutlets" : 0,
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "qlim",
									"outlettype" : [ "" ],
									"patching_rect" : [ 30.0, 185.0, 32.5, 19.0 ],
									"id" : "obj-8",
									"fontname" : "Verdana",
									"numinlets" : 2,
									"numoutlets" : 1,
									"fontsize" : 10.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "qlim",
									"outlettype" : [ "" ],
									"patching_rect" : [ 30.0, 165.0, 32.5, 19.0 ],
									"id" : "obj-9",
									"fontname" : "Verdana",
									"numinlets" : 2,
									"numoutlets" : 1,
									"fontsize" : 10.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"patching_rect" : [ 80.0, 215.0, 20.0, 20.0 ],
									"id" : "obj-7",
									"numinlets" : 1,
									"numoutlets" : 0,
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 80.0, 25.0, 20.0, 20.0 ],
									"id" : "obj-6",
									"numinlets" : 0,
									"numoutlets" : 1,
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "qlim",
									"outlettype" : [ "" ],
									"patching_rect" : [ 80.0, 135.0, 32.5, 19.0 ],
									"id" : "obj-5",
									"fontname" : "Verdana",
									"numinlets" : 2,
									"numoutlets" : 1,
									"fontsize" : 10.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "qlim",
									"outlettype" : [ "" ],
									"patching_rect" : [ 80.0, 115.0, 32.5, 19.0 ],
									"id" : "obj-4",
									"fontname" : "Verdana",
									"numinlets" : 2,
									"numoutlets" : 1,
									"fontsize" : 10.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "delay 10000",
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 80.0, 95.0, 73.0, 19.0 ],
									"id" : "obj-3",
									"fontname" : "Verdana",
									"numinlets" : 2,
									"numoutlets" : 1,
									"fontsize" : 10.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "qlim",
									"outlettype" : [ "" ],
									"patching_rect" : [ 80.0, 75.0, 32.5, 19.0 ],
									"id" : "obj-2",
									"fontname" : "Verdana",
									"numinlets" : 2,
									"numoutlets" : 1,
									"fontsize" : 10.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "qlim",
									"outlettype" : [ "" ],
									"patching_rect" : [ 80.0, 55.0, 32.5, 19.0 ],
									"id" : "obj-1",
									"fontname" : "Verdana",
									"numinlets" : 2,
									"numoutlets" : 1,
									"fontsize" : 10.0
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"source" : [ "obj-2", 0 ],
									"destination" : [ "obj-3", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-3", 0 ],
									"destination" : [ "obj-4", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-4", 0 ],
									"destination" : [ "obj-5", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-1", 0 ],
									"destination" : [ "obj-2", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-6", 0 ],
									"destination" : [ "obj-1", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-5", 0 ],
									"destination" : [ "obj-7", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-9", 0 ],
									"destination" : [ "obj-8", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-5", 0 ],
									"destination" : [ "obj-9", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-8", 0 ],
									"destination" : [ "obj-10", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
 ]
					}
,
					"saved_object_attributes" : 					{
						"default_fontface" : 0,
						"default_fontname" : "Verdana",
						"fontname" : "Verdana",
						"default_fontsize" : 10.0,
						"globalpatchername" : "",
						"fontface" : 0,
						"fontsize" : 10.0
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "script delete helppatcher",
					"outlettype" : [ "" ],
					"patching_rect" : [ 130.0, 570.0, 135.0, 17.0 ],
					"id" : "obj-62",
					"fontname" : "Verdana",
					"numinlets" : 2,
					"numoutlets" : 1,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "script newobject newobj @text $1 @fixwidth 1 @varname helppatcher",
					"linecount" : 2,
					"outlettype" : [ "" ],
					"patching_rect" : [ 300.0, 570.0, 249.0, 29.0 ],
					"id" : "obj-58",
					"fontname" : "Verdana",
					"numinlets" : 2,
					"numoutlets" : 1,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t b l",
					"outlettype" : [ "bang", "" ],
					"patching_rect" : [ 250.0, 485.0, 68.5, 19.0 ],
					"id" : "obj-53",
					"fontname" : "Verdana",
					"numinlets" : 1,
					"numoutlets" : 2,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "sel 1",
					"outlettype" : [ "bang", "" ],
					"patching_rect" : [ 15.0, 485.0, 34.0, 19.0 ],
					"id" : "obj-51",
					"fontname" : "Verdana",
					"numinlets" : 2,
					"numoutlets" : 2,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : ">=",
					"outlettype" : [ "int" ],
					"patching_rect" : [ 15.0, 460.0, 32.5, 19.0 ],
					"id" : "obj-50",
					"fontname" : "Verdana",
					"numinlets" : 2,
					"numoutlets" : 1,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "0",
					"outlettype" : [ "" ],
					"patching_rect" : [ 60.0, 155.0, 32.5, 17.0 ],
					"id" : "obj-48",
					"fontname" : "Verdana",
					"numinlets" : 2,
					"numoutlets" : 1,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "counter",
					"outlettype" : [ "int", "", "", "int" ],
					"patching_rect" : [ 15.0, 230.0, 79.0, 19.0 ],
					"id" : "obj-47",
					"fontname" : "Verdana",
					"numinlets" : 5,
					"numoutlets" : 4,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"outlettype" : [ "int", "bang" ],
					"patching_rect" : [ 215.0, 330.0, 50.0, 19.0 ],
					"id" : "obj-46",
					"fontname" : "Verdana",
					"numinlets" : 1,
					"numoutlets" : 2,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "0",
					"outlettype" : [ "" ],
					"patching_rect" : [ 350.0, 275.0, 32.5, 17.0 ],
					"id" : "obj-45",
					"fontname" : "Verdana",
					"numinlets" : 2,
					"numoutlets" : 1,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "counter",
					"outlettype" : [ "int", "", "", "int" ],
					"patching_rect" : [ 215.0, 300.0, 199.0, 19.0 ],
					"id" : "obj-44",
					"fontname" : "Verdana",
					"numinlets" : 5,
					"numoutlets" : 4,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 215.0, 275.0, 20.0, 20.0 ],
					"id" : "obj-43",
					"numinlets" : 1,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 60.0, 65.0, 20.0, 20.0 ],
					"id" : "obj-41",
					"numinlets" : 1,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "qlim",
					"outlettype" : [ "" ],
					"patching_rect" : [ 60.0, 130.0, 32.5, 19.0 ],
					"id" : "obj-39",
					"fontname" : "Verdana",
					"numinlets" : 2,
					"numoutlets" : 1,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "b 2",
					"outlettype" : [ "bang", "bang" ],
					"patching_rect" : [ 60.0, 105.0, 58.5, 19.0 ],
					"id" : "obj-38",
					"fontname" : "Verdana",
					"numinlets" : 1,
					"numoutlets" : 2,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "folder C74:/jitter-help",
					"outlettype" : [ "", "int" ],
					"patching_rect" : [ 180.0, 140.0, 122.0, 19.0 ],
					"id" : "obj-36",
					"fontname" : "Verdana",
					"numinlets" : 1,
					"numoutlets" : 2,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "folder C74:/msp-help",
					"outlettype" : [ "", "int" ],
					"patching_rect" : [ 215.0, 165.0, 119.0, 19.0 ],
					"id" : "obj-35",
					"fontname" : "Verdana",
					"numinlets" : 1,
					"numoutlets" : 2,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "folder C74:/max-help",
					"outlettype" : [ "", "int" ],
					"patching_rect" : [ 235.0, 190.0, 119.0, 19.0 ],
					"id" : "obj-34",
					"fontname" : "Verdana",
					"numinlets" : 1,
					"numoutlets" : 2,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "umenu",
					"outlettype" : [ "int", "", "" ],
					"items" : [ "abs.maxhelp", ",", "absolutepath.maxhelp", ",", "accum.maxhelp", ",", "acos.maxhelp", ",", "acosh.maxhelp", ",", "active.maxhelp", ",", "anal.maxhelp", ",", "append.maxhelp", ",", "asin.maxhelp", ",", "asinh.maxhelp", ",", "atan.maxhelp", ",", "atan2.maxhelp", ",", "atanh.maxhelp", ",", "atodb.maxhelp", ",", "atoi.maxhelp", ",", "autopattr.maxhelp", ",", "bag.maxhelp", ",", "bangbang.maxhelp", ",", "bendin.maxhelp", ",", "bendout.maxhelp", ",", "bgcolor.maxhelp", ",", "bitand.maxhelp", ",", "bitor.maxhelp", ",", "bline.maxhelp", ",", "bogus.maxhelp", ",", "bondo.maxhelp", ",", "borax.maxhelp", ",", "bpatcher.maxhelp", ",", "bucket.maxhelp", ",", "buddy.maxhelp", ",", "button.maxhelp", ",", "capture.maxhelp", ",", "cartopol.maxhelp", ",", "change.maxhelp", ",", "clip.maxhelp", ",", "clocker.maxhelp", ",", "closebang.maxhelp", ",", "coll.maxhelp", ",", "colorpicker.maxhelp", ",", "combine.maxhelp", ",", "comment.maxhelp", ",", "conformpath.maxhelp", ",", "cos.maxhelp", ",", "cosh.maxhelp", ",", "counter.maxhelp", ",", "cpuclock.maxhelp", ",", "ctlin.maxhelp", ",", "ctlout.maxhelp", ",", "cycle.maxhelp", ",", "date.maxhelp", ",", "dbtoa.maxhelp", ",", "decide.maxhelp", ",", "decode.maxhelp", ",", "defer.maxhelp", ",", "deferlow.maxhelp", ",", "delay.maxhelp", ",", "detonate.maxhelp", ",", "dial.maxhelp", ",", "dialog.maxhelp", ",", "div.maxhelp", ",", "dropfile.maxhelp", ",", "drunk.maxhelp", ",", "equals.maxhelp", ",", "error.maxhelp", ",", "expr.maxhelp", ",", "filedate.maxhelp", ",", "filein.maxhelp", ",", "filepath.maxhelp", ",", "filewatch.maxhelp", ",", "float.maxhelp", ",", "flonum.maxhelp", ",", "flush.maxhelp", ",", "folder.maxhelp", ",", "follow.maxhelp", ",", "fontlist.maxhelp", ",", "forward.maxhelp", ",", "fpic.maxhelp", ",", "freebang.maxhelp", ",", "fromsymbol.maxhelp", ",", "fswap.maxhelp", ",", "ftom.maxhelp", ",", "funbuff.maxhelp", ",", "function.maxhelp", ",", "funnel.maxhelp", ",", "gate.maxhelp", ",", "gestalt.maxhelp", ",", "grab.maxhelp", ",", "greaterthan.maxhelp", ",", "greaterthaneq.maxhelp", ",", "gswitch.maxhelp", ",", "gswitch2.maxhelp", ",", "hi.maxhelp", ",", "hint.maxhelp", ",", "histo.maxhelp", ",", "hover.maxhelp", ",", "if.maxhelp", ",", "imovie.maxhelp", ",", "in.maxhelp", ",", "incdec.maxhelp", ",", "inlet.maxhelp", ",", "inport.maxhelp", ",", "int.maxhelp", ",", "itable.maxhelp", ",", "iter.maxhelp", ",", "itoa.maxhelp", ",", "jit.cellblock.maxhelp", ",", "js.maxhelp", ",", "jstrigger.maxhelp", ",", "jsui.maxhelp", ",", "jweb.maxhelp", ",", "key.maxhelp", ",", "keyup.maxhelp", ",", "kslider.maxhelp", ",", "lcd.maxhelp", ",", "led.maxhelp", ",", "lessthan.maxhelp", ",", "lessthaneq.maxhelp", ",", "line.maxhelp", ",", "linedrive.maxhelp", ",", "listfunnel.maxhelp", ",", "loadbang.maxhelp", ",", "loadmess.maxhelp", ",", "logand.maxhelp", ",", "logor.maxhelp", ",", "makenote.maxhelp", ",", "match.maxhelp", ",", "matrixctrl.maxhelp", ",", "maximum.maxhelp", ",", "mean.maxhelp", ",", "menubar.maxhelp", ",", "message.maxhelp", ",", "metro.maxhelp", ",", "midiflush.maxhelp", ",", "midiformat.maxhelp", ",", "midiin.maxhelp", ",", "midiinfo.maxhelp", ",", "midiout.maxhelp", ",", "midiparse.maxhelp", ",", "minimum.maxhelp", ",", "minus.maxhelp", ",", "modifiers.maxhelp", ",", "modulo.maxhelp", ",", "mousefilter.maxhelp", ",", "mousestate.maxhelp", ",", "movie.maxhelp", ",", "mtof.maxhelp", ",", "mtr.maxhelp", ",", "multislider.maxhelp", ",", "next.maxhelp", ",", "notein.maxhelp", ",", "noteout.maxhelp", ",", "notequals.maxhelp", ",", "nslider.maxhelp", ",", "number.maxhelp", ",", "numkey.maxhelp", ",", "offer.maxhelp", ",", "onebang.maxhelp", ",", "onecopy.maxhelp", ",", "opendialog.maxhelp", ",", "out.maxhelp", ",", "outlet.maxhelp", ",", "outport.maxhelp", ",", "pack.maxhelp", ",", "pak.maxhelp", ",", "panel.maxhelp", ",", "past.maxhelp", ",", "patcher.maxhelp", ",", "patcherargs.maxhelp", ",", "pattr.maxhelp", ",", "pattrforward.maxhelp", ",", "pattrhub.maxhelp", ",", "pattrmarker.maxhelp", ",", "pattrstorage.maxhelp", ",", "pcontrol.maxhelp", ",", "peak.maxhelp", ",", "pgmin.maxhelp", ",", "pgmout.maxhelp", ",", "pictctrl.maxhelp", ",", "pictslider.maxhelp", ",", "pipe.maxhelp", ",", "playbar.maxhelp", ",", "plugconfig.maxhelp", ",", "plugmidiin.maxhelp", ",", "plugmidiout.maxhelp", ",", "plugmod.maxhelp", ",", "plugmorph.maxhelp", ",", "plugmultiparam.maxhelp", ",", "plugstore.maxhelp", ",", "plus.maxhelp", ",", "poltocar.maxhelp", ",", "poly.maxhelp", ",", "polyin.maxhelp", ",", "polyout.maxhelp", ",", "pow.maxhelp", ",", "pp.maxhelp", ",", "pptempo.maxhelp", ",", "pptime.maxhelp", ",", "prepend.maxhelp", ",", "preset.maxhelp", ",", "print.maxhelp", ",", "prob.maxhelp", ",", "pv.maxhelp", ",", "pvar.maxhelp", ",", "qlim.maxhelp", ",", "qlist.maxhelp", ",", "qmetro.maxhelp", ",", "quickthresh.maxhelp", ",", "radiogroup.maxhelp", ",", "random.maxhelp", ",", "rdiv.maxhelp", ",", "receive.maxhelp", ",", "regexp.maxhelp", ",", "relativepath.maxhelp", ",", "rminus.maxhelp", ",", "round.maxhelp", ",", "route.maxhelp", ",", "router.maxhelp", ",", "rslider.maxhelp", ",", "rtin.maxhelp", ",", "savedialog.maxhelp", ",", "scale.maxhelp", ",", "screensize.maxhelp", ",", "select.maxhelp", ",", "send.maxhelp", ",", "seq.maxhelp", ",", "serial.maxhelp", ",", "setclock.maxhelp", ",", "shiftleft.maxhelp", ",", "shiftright.maxhelp", ",", "sin.maxhelp", ",", "sinh.maxhelp", ",", "slide.maxhelp", ",", "slider.maxhelp", ",", "speedlim.maxhelp", ",", "spell.maxhelp", ",", "split.maxhelp", ",", "spray.maxhelp", ",", "sprintf.maxhelp", ",", "sqrt.maxhelp", ",", "standalone.maxhelp", ",", "stripnote.maxhelp", ",", "strippath.maxhelp", ",", "substitute.maxhelp", ",", "suckah.maxhelp", ",", "suspend.maxhelp", ",", "sustain.maxhelp", ",", "swap.maxhelp", ",", "swatch.maxhelp", ",", "switch.maxhelp", ",", "sxformat.maxhelp", ",", "sysexin.maxhelp", ",", "tab.maxhelp", ",", "table.maxhelp", ",", "tan.maxhelp", ",", "tanh.maxhelp", ",", "tempo.maxhelp", ",", "text.maxhelp", ",", "textbutton.maxhelp", ",", "textedit.maxhelp", ",", "thispatcher.maxhelp", ",", "thresh.maxhelp", ",", "timepoint.maxhelp", ",", "timer.maxhelp", ",", "times.maxhelp", ",", "togedge.maxhelp", ",", "toggle.maxhelp", ",", "tosymbol.maxhelp", ",", "touchin.maxhelp", ",", "touchout.maxhelp", ",", "translate.maxhelp", ",", "transport.maxhelp", ",", "trigger.maxhelp", ",", "trough.maxhelp", ",", "ubutton.maxhelp", ",", "udpreceive.maxhelp", ",", "udpsend.maxhelp", ",", "umenu.maxhelp", ",", "universal.maxhelp", ",", "unpack.maxhelp", ",", "urn.maxhelp", ",", "uzi.maxhelp", ",", "value.maxhelp", ",", "vdp.maxhelp", ",", "vexpr.maxhelp", ",", "when.maxhelp", ",", "xbendin.maxhelp", ",", "xbendout.maxhelp", ",", "xnotein.maxhelp", ",", "xnoteout.maxhelp", ",", "zl.maxhelp", ",", "zmap.maxhelp", ",", "2d.wave~.maxhelp", ",", "abs~.maxhelp", ",", "acosh~.maxhelp", ",", "acos~.maxhelp", ",", "adc~.maxhelp", ",", "adoutput~.maxhelp", ",", "adsr~.maxhelp", ",", "adstatus.maxhelp", ",", "allpass~.maxhelp", ",", "asinh~.maxhelp", ",", "asin~.maxhelp", ",", "atan2~.maxhelp", ",", "atanh~.maxhelp", ",", "atan~.maxhelp", ",", "atodb~.maxhelp", ",", "average~.maxhelp", ",", "avg~.maxhelp", ",", "begin~.maxhelp", ",", "biquad~.maxhelp", ",", "bitand~.maxhelp", ",", "bitnot~.maxhelp", ",", "bitor~.maxhelp", ",", "bitsafe~.maxhelp", ",", "bitshift~.maxhelp", ",", "bitxor~.maxhelp", ",", "buffer~.maxhelp", ",", "buffir~.maxhelp", ",", "capture~.maxhelp", ",", "cartopol~.maxhelp", ",", "cascade~.maxhelp", ",", "change~.maxhelp", ",", "click~.maxhelp", ",", "clip~.maxhelp", ",", "comb~.maxhelp", ",", "cosh~.maxhelp", ",", "cosx~.maxhelp", ",", "cos~.maxhelp", ",", "count~.maxhelp", ",", "cross~.maxhelp", ",", "curve~.maxhelp", ",", "cycle~.maxhelp", ",", "dac~.maxhelp", ",", "dbtoa~.maxhelp", ",", "degrade~.maxhelp", ",", "delay~.maxhelp", ",", "deltaclip~.maxhelp", ",", "delta~.maxhelp", ",", "div~.maxhelp", ",", "downsamp~.maxhelp", ",", "dspstate~.maxhelp", ",", "dsptime~.maxhelp", ",", "edge~.maxhelp", ",", "equals~.maxhelp", ",", "ezadc~.maxhelp", ",", "ezdac~.maxhelp", ",", "fbinshift~.maxhelp", ",", "fffb~.maxhelp", ",", "fftinfo~.maxhelp", ",", "fftin~.maxhelp", ",", "fftout~.maxhelp", ",", "fft~.maxhelp", ",", "filtercoeff~.maxhelp", ",", "filtergraph~.maxhelp", ",", "frameaccum~.maxhelp", ",", "framedelta~.maxhelp", ",", "freqshift~.maxhelp", ",", "ftom~.maxhelp", ",", "gain~.maxhelp", ",", "gate~.maxhelp", ",", "gizmo~.maxhelp", ",", "greaterthaneq~.maxhelp", ",", "greaterthan~.maxhelp", ",", "groove~.maxhelp", ",", "hilbert~.maxhelp", ",", "hostcontrol~.maxhelp", ",", "hostphasor~.maxhelp", ",", "hostsync~.maxhelp", ",", "ifft~.maxhelp", ",", "index~.maxhelp", ",", "info~.maxhelp", ",", "in~.maxhelp", ",", "ioscbank~.maxhelp", ",", "kink~.maxhelp", ",", "lessthaneq~.maxhelp", ",", "lessthan~.maxhelp", ",", "levelmeter~.maxhelp", ",", "line~.maxhelp", ",", "log~.maxhelp", ",", "lookup~.maxhelp", ",", "lores~.maxhelp", ",", "matrix~.maxhelp", ",", "maximum~.maxhelp", ",", "meter~.maxhelp", ",", "minimum~.maxhelp", ",", "minmax~.maxhelp", ",", "minus~.maxhelp", ",", "modulo~.maxhelp", ",", "mstosamps~.maxhelp", ",", "mtof~.maxhelp", ",", "mute~.maxhelp", ",", "noise~.maxhelp", ",", "normalize~.maxhelp", ",", "notequals~.maxhelp", ",", "number~.maxhelp", ",", "onepole~.maxhelp", ",", "oscbank~.maxhelp", ",", "out~.maxhelp", ",", "overdrive~.maxhelp", ",", "pass~.maxhelp", ",", "peakamp~.maxhelp", ",", "peek~.maxhelp", ",", "pfft~.maxhelp", ",", "phaseshift~.maxhelp", ",", "phasewrap~.maxhelp", ",", "phasor~.maxhelp", ",", "pink~.maxhelp", ",", "play~.maxhelp", ",", "plugin~.maxhelp", ",", "plugout~.maxhelp", ",", "plugphasor~.maxhelp", ",", "plugreceive~.maxhelp", ",", "plugsend~.maxhelp", ",", "plugsync~.maxhelp", ",", "plusequals~.maxhelp", ",", "plus~.maxhelp", ",", "poke~.maxhelp", ",", "poltocar~.maxhelp", ",", "poly~.maxhelp", ",", "pong~.maxhelp", ",", "pow~.maxhelp", ",", "rampsmooth~.maxhelp", ",", "rand~.maxhelp", ",", "rate~.maxhelp", ",", "rdiv~.maxhelp", ",", "receive~.maxhelp", ",", "record~.maxhelp", ",", "rect~.maxhelp", ",", "reson~.maxhelp", ",", "rewire~.maxhelp", ",", "rminus~.maxhelp", ",", "round~.maxhelp", ",", "sah~.maxhelp", ",", "sampstoms~.maxhelp", ",", "saw~.maxhelp", ",", "scope~.maxhelp", ",", "selector~.maxhelp", ",", "send~.maxhelp", ",", "seq~.maxhelp", ",", "sfinfo~.maxhelp", ",", "sflist~.maxhelp", ",", "sfplay~.maxhelp", ",", "sfrecord~.maxhelp", ",", "sig~.maxhelp", ",", "sinh~.maxhelp", ",", "sinx~.maxhelp", ",", "slide~.maxhelp", ",", "snapshot~.maxhelp", ",", "spectroscope~.maxhelp", ",", "spike~.maxhelp", ",", "sqrt~.maxhelp", ",", "stutter~.maxhelp", ",", "svf~.maxhelp", ",", "sync~.maxhelp", ",", "tanh~.maxhelp", ",", "tanx~.maxhelp", ",", "tapin~.maxhelp", ",", "tapout~.maxhelp", ",", "techno~.maxhelp", ",", "teeth~.maxhelp", ",", "thispoly~.maxhelp", ",", "thresh~.maxhelp", ",", "times~.maxhelp", ",", "train~.maxhelp", ",", "trapezoid~.maxhelp", ",", "triangle~.maxhelp", ",", "tri~.maxhelp", ",", "trunc~.maxhelp", ",", "vectral~.maxhelp", ",", "vst~.maxhelp", ",", "waveform~.maxhelp", ",", "wave~.maxhelp", ",", "zerox~.maxhelp", ",", "zigzag~.maxhelp", ",", "zplane~.maxhelp" ],
					"types" : [  ],
					"patching_rect" : [ 250.0, 455.0, 206.0, 19.0 ],
					"id" : "obj-33",
					"fontname" : "Verdana",
					"numinlets" : 1,
					"numoutlets" : 3,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "0",
					"outlettype" : [ "" ],
					"patching_rect" : [ 90.0, 310.0, 32.5, 17.0 ],
					"id" : "obj-29",
					"fontname" : "Verdana",
					"numinlets" : 2,
					"numoutlets" : 1,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 40.0, 310.0, 20.0, 20.0 ],
					"id" : "obj-28",
					"numinlets" : 1,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t i b b",
					"outlettype" : [ "int", "bang", "bang" ],
					"patching_rect" : [ 15.0, 255.0, 169.0, 19.0 ],
					"id" : "obj-26",
					"fontname" : "Verdana",
					"numinlets" : 1,
					"numoutlets" : 3,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "counter",
					"outlettype" : [ "int", "", "", "int" ],
					"patching_rect" : [ 40.0, 335.0, 86.0, 19.0 ],
					"id" : "obj-25",
					"fontname" : "Verdana",
					"numinlets" : 5,
					"numoutlets" : 4,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "error 1",
					"outlettype" : [ "" ],
					"patching_rect" : [ 40.0, 285.0, 45.0, 19.0 ],
					"id" : "obj-24",
					"fontname" : "Verdana",
					"numinlets" : 1,
					"numoutlets" : 1,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 165.0, 325.0, 20.0, 20.0 ],
					"id" : "obj-22",
					"numinlets" : 1,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"outlettype" : [ "int", "bang" ],
					"patching_rect" : [ 40.0, 390.0, 50.0, 19.0 ],
					"id" : "obj-20",
					"fontname" : "Verdana",
					"numinlets" : 1,
					"numoutlets" : 2,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "test.start",
					"outlettype" : [ "", "bang" ],
					"patching_rect" : [ 60.0, 40.0, 60.0, 19.0 ],
					"id" : "obj-366",
					"fontname" : "Verdana",
					"numinlets" : 1,
					"numoutlets" : 2,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "thispatcher",
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 15.0, 615.0, 67.0, 19.0 ],
					"id" : "obj-365",
					"fontname" : "Verdana",
					"numinlets" : 1,
					"numoutlets" : 2,
					"fontsize" : 10.0,
					"save" : [ "#N", "thispatcher", ";", "#Q", "end", ";" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 60.0, 15.0, 18.0, 18.0 ],
					"id" : "obj-2",
					"numinlets" : 1,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "test.assert.equal no_object_errors 0",
					"patching_rect" : [ 40.0, 415.0, 194.0, 19.0 ],
					"id" : "obj-6",
					"fontname" : "Verdana",
					"color" : [ 0.956863, 0.72549, 0.184314, 1.0 ],
					"numinlets" : 2,
					"numoutlets" : 0,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "test.finished",
					"outlettype" : [ "" ],
					"patching_rect" : [ 15.0, 510.0, 73.0, 19.0 ],
					"id" : "obj-8",
					"fontname" : "Verdana",
					"color" : [ 0.956863, 0.72549, 0.184314, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 1,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "set $1",
					"outlettype" : [ "" ],
					"patching_rect" : [ 40.0, 360.0, 42.0, 17.0 ],
					"id" : "obj-23",
					"fontname" : "Verdana",
					"numinlets" : 2,
					"numoutlets" : 1,
					"fontsize" : 10.0
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"source" : [ "obj-3", 0 ],
					"destination" : [ "obj-43", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-8", 0 ],
					"destination" : [ "obj-365", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-2", 0 ],
					"destination" : [ "obj-366", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-20", 0 ],
					"destination" : [ "obj-6", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-22", 0 ],
					"destination" : [ "obj-20", 0 ],
					"hidden" : 0,
					"midpoints" : [ 174.5, 384.0, 49.5, 384.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-23", 0 ],
					"destination" : [ "obj-20", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-24", 0 ],
					"destination" : [ "obj-28", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-28", 0 ],
					"destination" : [ "obj-25", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-29", 0 ],
					"destination" : [ "obj-25", 3 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-25", 0 ],
					"destination" : [ "obj-23", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-38", 1 ],
					"destination" : [ "obj-36", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-38", 0 ],
					"destination" : [ "obj-39", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-41", 0 ],
					"destination" : [ "obj-38", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-38", 1 ],
					"destination" : [ "obj-35", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-38", 1 ],
					"destination" : [ "obj-34", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-43", 0 ],
					"destination" : [ "obj-44", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-45", 0 ],
					"destination" : [ "obj-44", 3 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-41", 0 ],
					"destination" : [ "obj-45", 0 ],
					"hidden" : 0,
					"midpoints" : [ 69.5, 97.0, 359.5, 97.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-44", 0 ],
					"destination" : [ "obj-46", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-39", 0 ],
					"destination" : [ "obj-48", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-48", 0 ],
					"destination" : [ "obj-47", 3 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-26", 2 ],
					"destination" : [ "obj-22", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-26", 1 ],
					"destination" : [ "obj-29", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-47", 0 ],
					"destination" : [ "obj-26", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-26", 0 ],
					"destination" : [ "obj-33", 0 ],
					"hidden" : 0,
					"midpoints" : [ 24.5, 443.0, 259.5, 443.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-26", 0 ],
					"destination" : [ "obj-50", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-50", 0 ],
					"destination" : [ "obj-51", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-51", 0 ],
					"destination" : [ "obj-8", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-33", 1 ],
					"destination" : [ "obj-53", 0 ],
					"hidden" : 0,
					"midpoints" : [ 353.0, 480.0, 259.5, 480.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-366", 0 ],
					"destination" : [ "obj-41", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-58", 0 ],
					"destination" : [ "obj-365", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-53", 1 ],
					"destination" : [ "obj-58", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-65", 1 ],
					"destination" : [ "obj-62", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-53", 0 ],
					"destination" : [ "obj-65", 0 ],
					"hidden" : 0,
					"midpoints" : [ 259.5, 513.0, 109.5, 513.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-62", 0 ],
					"destination" : [ "obj-365", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-68", 0 ],
					"destination" : [ "obj-47", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-65", 0 ],
					"destination" : [ "obj-68", 0 ],
					"hidden" : 0,
					"midpoints" : [ 109.5, 574.0, 10.0, 574.0, 10.0, 193.0, 24.5, 193.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-33", 1 ],
					"destination" : [ "obj-6", 1 ],
					"hidden" : 0,
					"midpoints" : [ 353.0, 478.0, 241.0, 478.0, 241.0, 410.0, 224.5, 410.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-167", 0 ],
					"destination" : [ "obj-36", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-167", 0 ],
					"destination" : [ "obj-35", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-167", 0 ],
					"destination" : [ "obj-34", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-41", 0 ],
					"destination" : [ "obj-167", 0 ],
					"hidden" : 0,
					"midpoints" : [ 69.5, 100.0, 134.5, 100.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-34", 0 ],
					"destination" : [ "obj-1", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-46", 0 ],
					"destination" : [ "obj-528", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-528", 0 ],
					"destination" : [ "obj-50", 1 ],
					"hidden" : 0,
					"midpoints" : [ 224.5, 377.0, 154.0, 455.0, 38.0, 455.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-1", 2 ],
					"destination" : [ "obj-3", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-3", 0 ],
					"destination" : [ "obj-33", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-35", 0 ],
					"destination" : [ "obj-1", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-36", 0 ],
					"destination" : [ "obj-1", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-4", 0 ],
					"destination" : [ "obj-33", 0 ],
					"hidden" : 0,
					"midpoints" : [ 449.5, 445.0, 259.5, 445.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-41", 0 ],
					"destination" : [ "obj-4", 0 ],
					"hidden" : 0,
					"midpoints" : [ 69.5, 94.0, 449.5, 94.0 ]
				}

			}
 ]
	}

}
