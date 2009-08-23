{
	"patcher" : 	{
		"fileversion" : 1,
		"rect" : [ 489.0, 110.0, 704.0, 612.0 ],
		"bglocked" : 0,
		"defrect" : [ 489.0, 110.0, 704.0, 612.0 ],
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
					"text" : "instantiating $1",
					"outlettype" : [ "" ],
					"patching_rect" : [ 500.0, 270.0, 89.0, 17.0 ],
					"id" : "obj-22",
					"fontname" : "Verdana",
					"numinlets" : 2,
					"numoutlets" : 1,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "test.log",
					"patching_rect" : [ 500.0, 295.0, 49.0, 19.0 ],
					"id" : "obj-23",
					"fontname" : "Verdana",
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "script newobject newobj @text $1 @varname fred",
					"outlettype" : [ "" ],
					"patching_rect" : [ 345.0, 210.0, 263.0, 17.0 ],
					"id" : "obj-20",
					"fontname" : "Verdana",
					"numinlets" : 2,
					"numoutlets" : 1,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "test.start",
					"outlettype" : [ "", "bang" ],
					"patching_rect" : [ 80.0, 50.0, 60.0, 19.0 ],
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
					"patching_rect" : [ 80.0, 530.0, 67.0, 19.0 ],
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
					"maxclass" : "newobj",
					"text" : "test.log",
					"patching_rect" : [ 415.0, 415.0, 49.0, 19.0 ],
					"id" : "obj-1",
					"fontname" : "Verdana",
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 80.0, 25.0, 18.0, 18.0 ],
					"id" : "obj-2",
					"numinlets" : 1,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "0",
					"outlettype" : [ "int" ],
					"patching_rect" : [ 210.0, 475.0, 39.0, 19.0 ],
					"id" : "obj-3",
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
					"patching_rect" : [ 230.0, 445.0, 82.0, 19.0 ],
					"id" : "obj-4",
					"fontname" : "Verdana",
					"numinlets" : 5,
					"numoutlets" : 4,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t b",
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 230.0, 410.0, 22.0, 19.0 ],
					"id" : "obj-5",
					"fontname" : "Verdana",
					"numinlets" : 1,
					"numoutlets" : 1,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "test.assert.equal no_objects_missing 0",
					"patching_rect" : [ 210.0, 505.0, 207.0, 19.0 ],
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
					"text" : "t b b b 1",
					"outlettype" : [ "bang", "bang", "bang", "int" ],
					"patching_rect" : [ 121.0, 76.0, 66.0, 19.0 ],
					"id" : "obj-7",
					"fontname" : "Verdana",
					"numinlets" : 1,
					"numoutlets" : 4,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "test.finished",
					"outlettype" : [ "" ],
					"patching_rect" : [ 80.0, 505.0, 73.0, 19.0 ],
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
					"maxclass" : "newobj",
					"text" : "regexp (.*)No such Object",
					"outlettype" : [ "", "", "", "", "" ],
					"patching_rect" : [ 187.0, 366.0, 189.0, 19.0 ],
					"id" : "obj-9",
					"fontname" : "Verdana",
					"numinlets" : 1,
					"numoutlets" : 5,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t b i",
					"outlettype" : [ "bang", "int" ],
					"patching_rect" : [ 265.0, 140.0, 61.0, 19.0 ],
					"id" : "obj-11",
					"fontname" : "Verdana",
					"numinlets" : 1,
					"numoutlets" : 2,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "uzi 345",
					"outlettype" : [ "bang", "bang", "int" ],
					"patching_rect" : [ 255.0, 115.0, 50.0, 19.0 ],
					"id" : "obj-12",
					"fontname" : "Verdana",
					"numinlets" : 2,
					"numoutlets" : 3,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "umenu",
					"outlettype" : [ "int", "", "" ],
					"autopopulate" : 1,
					"items" : [ "absolutepath", ",", "acos", ",", "acosh", ",", "anal", ",", "append", ",", "asin", ",", "asinh", ",", "atan", ",", "atan2", ",", "atanh", ",", "atodb", ",", "atoi", ",", "autopattr", ",", "bgcolor", ",", "bline", ",", "bondo", ",", "borax", ",", "bucket", ",", "buddy", ",", "button", ",", "capture", ",", "cartopol", ",", "clip", ",", "coll", ",", "colorpicker", ",", "combine", ",", "comment", ",", "conformpath", ",", "cos", ",", "cosh", ",", "counter", ",", "cpuclock", ",", "cycle", ",", "date", ",", "dbtoa", ",", "decide", ",", "decode", ",", "defer", ",", "deferlow", ",", "delay", ",", "detonate", ",", "dial", ",", "dialog", ",", "dropfile", ",", "drunk", ",", "filedate", ",", "filein", ",", "filepath", ",", "filewatch", ",", "flush", ",", "folder", ",", "fontlist", ",", "forward", ",", "fpic", ",", "fromsymbol", ",", "ftom", ",", "funbuff", ",", "function", ",", "funnel", ",", "gestalt", ",", "gswitch", ",", "gswitch2", ",", "hi", ",", "hint", ",", "histo", ",", "hover", ",", "imovie", ",", "incdec", ",", "itable", ",", "iter", ",", "itoa", ",", "jit.cellblock", ",", "js", ",", "jsui", ",", "kslider", ",", "lcd", ",", "led", ",", "line", ",", "linedrive", ",", "listfunnel", ",", "loadmess", ",", "makenote", ",", "match", ",", "matrixctrl", ",", "maximum", ",", "mean", ",", "message", ",", "metro", ",", "midiflush", ",", "midiinfo", ",", "minimum", ",", "modifiers", ",", "mousefilter", ",", "mousestate", ",", "movie", ",", "mtof", ",", "mtr", ",", "multislider", ",", "mxj", ",", "next", ",", "nslider", ",", "number", ",", "numkey", ",", "offer", ",", "onebang", ",", "opendialog", ",", "override", ",", "pak", ",", "panel", ",", "past", ",", "patcherargs", ",", "pattr", ",", "pattrforward", ",", "pattrhub", ",", "pattrmarker", ",", "pattrstorage", ",", "peak", ",", "pictctrl", ",", "pictslider", ",", "pipe", ",", "playbar", ",", "plugconfig", ",", "plugmidiin", ",", "plugmidiout", ",", "plugmod", ",", "plugmorph", ",", "plugmultiparam", ",", "plugstore", ",", "poltocar", ",", "poly", ",", "pow", ",", "pp", ",", "pptempo", ",", "pptime", ",", "prepend", ",", "prob", ",", "pv", ",", "qlist", ",", "quickthresh", ",", "radiogroup", ",", "rdiv", ",", "regexp", ",", "relativepath", ",", "rminus", ",", "round", ",", "router", ",", "rslider", ",", "savedialog", ",", "scale", ",", "screensize", ",", "serial", ",", "sin", ",", "sinh", ",", "slide", ",", "slider", ",", "speedlim", ",", "spell", ",", "split", ",", "spray", ",", "sprintf", ",", "sqrt", ",", "standalone", ",", "strippath", ",", "substitute", ",", "suckah", ",", "suspend", ",", "swatch", ",", "sxformat", ",", "tab", ",", "tan", ",", "tanh", ",", "tempo", ",", "text", ",", "textbutton", ",", "textedit", ",", "thresh", ",", "timepoint", ",", "timer", ",", "togedge", ",", "toggle", ",", "tosymbol", ",", "translate", ",", "transport", ",", "trough", ",", "ubutton", ",", "udpreceive", ",", "udpsend", ",", "umenu", ",", "universal", ",", "urn", ",", "uzi", ",", "vdp", ",", "vexpr", ",", "when", ",", "xbendin", ",", "xbendout", ",", "xnotein", ",", "xnoteout", ",", "zl", ",", "zmap", ",", "2d.wave~", ",", "abs~", ",", "acos~", ",", "acosh~", ",", "adc~", ",", "adoutput~", ",", "adsr~", ",", "adstatus", ",", "allpass~", ",", "asin~", ",", "asinh~", ",", "atan~", ",", "atan2~", ",", "atanh~", ",", "atodb~", ",", "average~", ",", "avg~", ",", "begin~", ",", "biquad~", ",", "bitand~", ",", "bitnot~", ",", "bitor~", ",", "bitsafe~", ",", "bitshift~", ",", "bitxor~", ",", "buffer~", ",", "buffir~", ",", "capture~", ",", "cartopol~", ",", "cascade~", ",", "change~", ",", "click~", ",", "clip~", ",", "comb~", ",", "cos~", ",", "cosh~", ",", "cosx~", ",", "count~", ",", "cross~", ",", "curve~", ",", "cycle~", ",", "dac~", ",", "dbtoa~", ",", "degrade~", ",", "delay~", ",", "delta~", ",", "deltaclip~", ",", "div~", ",", "downsamp~", ",", "dspstate~", ",", "dsptime~", ",", "edge~", ",", "equals~", ",", "ezadc~", ",", "ezdac~", ",", "fbinshift~", ",", "fffb~", ",", "fft~", ",", "fftin~", ",", "fftinfo~", ",", "fftout~", ",", "filtercoeff~", ",", "filtergraph~", ",", "frameaccum~", ",", "framedelta~", ",", "freqshift~", ",", "ftom~", ",", "gain~", ",", "gate~", ",", "gizmo~", ",", "greaterthan~", ",", "greaterthaneq~", ",", "groove~", ",", "hilbert~", ",", "hostcontrol~", ",", "hostphasor~", ",", "hostsync~", ",", "ifft~", ",", "in", ",", "in~", ",", "index~", ",", "info~", ",", "ioscbank~", ",", "kink~", ",", "lessthan~", ",", "lessthaneq~", ",", "levelmeter~", ",", "line~", ",", "log~", ",", "lookup~", ",", "lores~", ",", "matrix~", ",", "maximum~", ",", "meter~", ",", "minimum~", ",", "minmax~", ",", "minus~", ",", "modulo~", ",", "mstosamps~", ",", "mtof~", ",", "mute~", ",", "mxj~", ",", "noise~", ",", "normalize~", ",", "notequals~", ",", "number~", ",", "omx.4band~", ",", "omx.5band~", ",", "omx.comp~", ",", "omx.peaklim~", ",", "onepole~", ",", "oscbank~", ",", "out", ",", "out~", ",", "overdrive~", ",", "pass~", ",", "peakamp~", ",", "peek~", ",", "pfft~", ",", "phaseshift~", ",", "phasewrap~", ",", "phasor~", ",", "pink~", ",", "play~", ",", "plugin~", ",", "plugout~", ",", "plugphasor~", ",", "plugreceive~", ",", "plugsend~", ",", "plugsync~", ",", "plus~", ",", "plusequals~", ",", "poke~", ",", "poltocar~", ",", "poly~", ",", "pong~", ",", "pow~", ",", "rampsmooth~", ",", "rand~", ",", "rate~", ",", "rdiv~", ",", "receive~", ",", "record~", ",", "rect~", ",", "reson~", ",", "rewire~", ",", "rminus~", ",", "round~", ",", "sah~", ",", "sampstoms~", ",", "saw~", ",", "scope~", ",", "selector~", ",", "send~", ",", "seq~", ",", "sfinfo~", ",", "sflist~", ",", "sfplay~", ",", "sfrecord~", ",", "sig~", ",", "sinh~", ",", "sinx~", ",", "slide~", ",", "snapshot~", ",", "spectroscope~", ",", "spike~", ",", "sqrt~", ",", "stutter~", ",", "svf~", ",", "sync~", ",", "tanh~", ",", "tanx~", ",", "tapin~", ",", "tapout~", ",", "techno~", ",", "teeth~", ",", "thispoly~", ",", "thresh~", ",", "times~", ",", "train~", ",", "trapezoid~", ",", "tri~", ",", "triangle~", ",", "trunc~", ",", "vectral~", ",", "vst~", ",", "wave~", ",", "waveform~", ",", "zerox~", ",", "zigzag~", ",", "zplane~", ",", "jit.3m", ",", "jit.alphablend", ",", "jit.altern", ",", "jit.ameba", ",", "jit.argb2ayuv", ",", "jit.argb2grgb", ",", "jit.argb2uyvy", ",", "jit.avc", ",", "jit.avg4", ",", "jit.ayuv2argb", ",", "jit.ayuv2luma", ",", "jit.ayuv2uyvy", ",", "jit.bfg", ",", "jit.brass", ",", "jit.brcosa", ",", "jit.broadcast", ",", "jit.bsort", ",", "jit.buffer~", ",", "jit.catch~", ",", "jit.change", ",", "jit.charmap", ",", "jit.chromakey", ",", "jit.clip", ",", "jit.coerce", ",", "jit.colorspace", ",", "jit.concat", ",", "jit.convolve", ",", "jit.conway", ",", "jit.cycle", ",", "jit.demultiplex", ",", "jit.desktop", ",", "jit.dimmap", ",", "jit.displays", ",", "jit.eclipse", ",", "jit.expr", ",", "jit.fastblur", ",", "jit.fft", ",", "jit.fill", ",", "jit.findbounds", ",", "jit.fluoride", ",", "jit.fprint", ",", "jit.fpsgui", ",", "jit.freeframe", ",", "jit.gencoord", ",", "jit.gl.asyncread", ",", "jit.gl.cubemap", ",", "jit.gl.graph", ",", "jit.gl.gridshape", ",", "jit.gl.handle", ",", "jit.gl.imageunit", ",", "jit.gl.isosurf", ",", "jit.gl.mesh", ",", "jit.gl.model", ",", "jit.gl.multiple", ",", "jit.gl.nurbs", ",", "jit.gl.plato", ",", "jit.gl.render", ",", "jit.gl.shader", ",", "jit.gl.sketch", ",", "jit.gl.slab", ",", "jit.gl.text2d", ",", "jit.gl.text3d", ",", "jit.gl.texture", ",", "jit.gl.videoplane", ",", "jit.gl.volume", ",", "jit.glop", ",", "jit.glue", ",", "jit.gradient", ",", "jit.graph", ",", "jit.grgb2argb", ",", "jit.hatch", ",", "jit.hello", ",", "jit.histogram", ",", "jit.hsl2rgb", ",", "jit.hue", ",", "jit.iter", ",", "jit.keyscreen", ",", "jit.la.determinant", ",", "jit.la.diagproduct", ",", "jit.la.inverse", ",", "jit.la.mult", ",", "jit.la.trace", ",", "jit.la.uppertri", ",", "jit.lcd", ",", "jit.linden", ",", "jit.luma2ayuv", ",", "jit.luma2uyvy", ",", "jit.lumakey", ",", "jit.map", ",", "jit.matrix", ",", "jit.matrixinfo", ",", "jit.matrixset", ",", "jit.multiplex", ",", "jit.mxform2d", ",", "jit.net.recv", ",", "jit.net.send", ",", "jit.noise", ",", "jit.normalize", ",", "jit.obref", ",", "jit.op", ",", "jit.openexr", ",", "jit.p.bounds", ",", "jit.p.shiva", ",", "jit.p.vishnu", ",", "jit.pack", ",", "jit.peek~", ",", "jit.plot", ",", "jit.plume", ",", "jit.plur", ",", "jit.poke~", ",", "jit.print", ",", "jit.pwindow", ",", "jit.qball", ",", "jit.qfaker", ",", "jit.qt.broadcast", ",", "jit.qt.effect", ",", "jit.qt.grab", ",", "jit.qt.movie", ",", "jit.qt.record", ",", "jit.qt.videoout", ",", "jit.release~", ",", "jit.repos", ",", "jit.resamp", ",", "jit.reverse", ",", "jit.rgb2hsl", ",", "jit.rgb2luma", ",", "jit.robcross", ",", "jit.rota", ",", "jit.roy", ",", "jit.rubix", ",", "jit.scalebias", ",", "jit.scanoffset", ",", "jit.scanslide", ",", "jit.scanwrap", ",", "jit.scissors", ",", "jit.scope", ",", "jit.shade", ",", "jit.slide", ",", "jit.sobel", ",", "jit.spill", ",", "jit.split", ",", "jit.sprinkle", ",", "jit.str.fromsymbol", ",", "jit.str.op", ",", "jit.str.regexp", ",", "jit.str.tosymbol", ",", "jit.streak", ",", "jit.submatrix", ",", "jit.textfile", ",", "jit.thin", ",", "jit.tiffany", ",", "jit.traffic", ",", "jit.transpose", ",", "jit.turtle", ",", "jit.uldl", ",", "jit.unpack", ",", "jit.uyvy2argb", ",", "jit.uyvy2ayuv", ",", "jit.uyvy2luma", ",", "jit.vcr", ",", "jit.wake", ",", "jit.window", ",", "jit.xfade", ",", "spigot~" ],
					"types" : [  ],
					"patching_rect" : [ 368.0, 172.0, 100.0, 19.0 ],
					"id" : "obj-13",
					"fontname" : "Verdana",
					"numinlets" : 1,
					"numoutlets" : 3,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "route error",
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 187.0, 341.0, 99.0, 19.0 ],
					"id" : "obj-15",
					"fontname" : "Verdana",
					"numinlets" : 1,
					"numoutlets" : 2,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "script delete fred",
					"outlettype" : [ "" ],
					"patching_rect" : [ 257.0, 173.0, 106.0, 17.0 ],
					"id" : "obj-17",
					"fontname" : "Verdana",
					"numinlets" : 2,
					"numoutlets" : 1,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "error",
					"outlettype" : [ "" ],
					"patching_rect" : [ 187.0, 317.0, 53.0, 19.0 ],
					"id" : "obj-18",
					"fontname" : "Verdana",
					"numinlets" : 1,
					"numoutlets" : 1,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "thispatcher",
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 306.0, 263.0, 79.0, 19.0 ],
					"id" : "obj-19",
					"fontname" : "Verdana",
					"numinlets" : 1,
					"numoutlets" : 2,
					"fontsize" : 10.0,
					"save" : [ "#N", "thispatcher", ";", "#Q", "end", ";" ]
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"source" : [ "obj-3", 0 ],
					"destination" : [ "obj-6", 0 ],
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
					"source" : [ "obj-366", 0 ],
					"destination" : [ "obj-8", 0 ],
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
					"source" : [ "obj-366", 1 ],
					"destination" : [ "obj-7", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-7", 3 ],
					"destination" : [ "obj-18", 0 ],
					"hidden" : 0,
					"midpoints" : [ 177.5, 310.0, 196.5, 310.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-18", 0 ],
					"destination" : [ "obj-15", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-15", 0 ],
					"destination" : [ "obj-9", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-7", 1 ],
					"destination" : [ "obj-3", 0 ],
					"hidden" : 0,
					"midpoints" : [ 146.166672, 468.0, 219.5, 468.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-9", 1 ],
					"destination" : [ "obj-5", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-5", 0 ],
					"destination" : [ "obj-4", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-4", 0 ],
					"destination" : [ "obj-3", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-7", 3 ],
					"destination" : [ "obj-4", 2 ],
					"hidden" : 0,
					"midpoints" : [ 177.5, 435.0, 271.0, 435.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-11", 0 ],
					"destination" : [ "obj-17", 0 ],
					"hidden" : 0,
					"midpoints" : [ 274.5, 165.0, 266.5, 165.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-7", 2 ],
					"destination" : [ "obj-12", 0 ],
					"hidden" : 0,
					"midpoints" : [ 161.833328, 105.0, 264.5, 105.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-17", 0 ],
					"destination" : [ "obj-19", 0 ],
					"hidden" : 0,
					"midpoints" : [ 266.5, 254.0, 315.5, 254.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-12", 2 ],
					"destination" : [ "obj-11", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-11", 1 ],
					"destination" : [ "obj-13", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-13", 1 ],
					"destination" : [ "obj-20", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-20", 0 ],
					"destination" : [ "obj-19", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-9", 1 ],
					"destination" : [ "obj-1", 0 ],
					"hidden" : 0,
					"midpoints" : [ 239.0, 400.0, 424.5, 400.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-22", 0 ],
					"destination" : [ "obj-23", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-13", 1 ],
					"destination" : [ "obj-22", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
 ]
	}

}
