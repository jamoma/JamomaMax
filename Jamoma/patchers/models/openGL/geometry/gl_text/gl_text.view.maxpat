{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 7,
			"minor" : 0,
			"revision" : 5,
			"architecture" : "x86",
			"modernui" : 1
		}
,
		"rect" : [ 594.0, 205.0, 300.0, 140.0 ],
		"bglocked" : 0,
		"openinpresentation" : 1,
		"default_fontsize" : 10.0,
		"default_fontface" : 0,
		"default_fontname" : "Verdana",
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
					"fontface" : 0,
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-20",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 263.0, 229.0, 103.0, 21.0 ],
					"style" : "",
					"text" : "j.remote precision",
					"varname" : "leadscale[3]"
				}

			}
, 			{
				"box" : 				{
					"annotation" : "Sets the precision of the quadratic curve calculation [0 ->inf], The default is 1.0",
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"format" : 6,
					"id" : "obj-21",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 218.0, 230.0, 35.0, 21.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 6.0, 89.0, 35.0, 21.0 ],
					"style" : "",
					"triangle" : 0,
					"triscale" : 0.9,
					"varname" : "LEADSCALE[3]"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-22",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 149.5, 230.0, 77.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 43.0, 89.0, 54.0, 19.0 ],
					"style" : "",
					"text" : "precision"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-17",
					"linecount" : 2,
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 263.0, 192.0, 103.0, 33.0 ],
					"style" : "",
					"text" : "j.remote line_length",
					"varname" : "leadscale[2]"
				}

			}
, 			{
				"box" : 				{
					"annotation" : "The line length specified in gl-units for mode 3d and outline, and in pixels for 2d. Lines of text extending beyond this value will wrap to the next line. The default value of -1 specifies no line length, and therefore no wrapping.",
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"format" : 6,
					"id" : "obj-18",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 218.0, 193.0, 35.0, 21.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 113.0, 67.0, 35.0, 21.0 ],
					"style" : "",
					"triangle" : 0,
					"triscale" : 0.9,
					"varname" : "LEADSCALE[2]"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-19",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 149.5, 193.0, 77.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 150.0, 67.0, 77.0, 19.0 ],
					"style" : "",
					"text" : "line_length"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-14",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 263.0, 162.0, 103.0, 21.0 ],
					"style" : "",
					"text" : "j.remote depth",
					"varname" : "leadscale[1]"
				}

			}
, 			{
				"box" : 				{
					"annotation" : "The depth (z extent) of the 3D geometry relative to the height of the font (default = 0.) If a depth of 0 is used, no extruded character sides are generated, which will draw much faster. Only valid if mode is 3d.",
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"format" : 6,
					"id" : "obj-15",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 218.0, 163.0, 35.0, 21.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 6.0, 67.0, 35.0, 21.0 ],
					"style" : "",
					"triangle" : 0,
					"triscale" : 0.9,
					"varname" : "LEADSCALE[1]"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-16",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 149.5, 163.0, 77.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 43.0, 67.0, 54.0, 19.0 ],
					"style" : "",
					"text" : "depth"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-13",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 605.0, 328.0, 100.0, 21.0 ],
					"style" : "",
					"text" : "j.remote bold"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-12",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 605.0, 296.5, 100.0, 21.0 ],
					"style" : "",
					"text" : "j.remote italic"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-11",
					"maxclass" : "textbutton",
					"mode" : 1,
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 547.5, 324.0, 46.0, 14.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 189.0, 42.0, 46.0, 21.0 ],
					"style" : "",
					"text" : "bold",
					"texton" : "bold"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-10",
					"maxclass" : "textbutton",
					"mode" : 1,
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 547.5, 300.0, 46.0, 14.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 140.0, 42.0, 46.0, 21.0 ],
					"style" : "",
					"text" : "italic",
					"texton" : "italic"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-6",
					"linecount" : 2,
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 348.0, 490.0, 100.0, 33.0 ],
					"style" : "",
					"text" : "substitute set setsymbol"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-4",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 348.0, 460.0, 100.0, 21.0 ],
					"style" : "",
					"text" : "j.remote mode"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-1",
					"maxclass" : "tab",
					"mode" : 1,
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 276.0, 420.0, 200.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 6.0, 20.5, 99.0, 18.0 ],
					"style" : "",
					"tabs" : [ "2d", "3d", "outline" ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-5",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 0.0, 145.0, 110.0, 21.0 ],
					"style" : "",
					"text" : "j.gl_group.panel GL"
				}

			}
, 			{
				"box" : 				{
					"annotation" : "Alignment for rows of text.",
					"hint" : "Text Align",
					"id" : "obj-94",
					"items" : [ "left", ",", "center", ",", "right" ],
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 406.5, 22.0, 57.0, 21.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 237.0, 42.0, 55.0, 21.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-88",
					"legacytextcolor" : 1,
					"maxclass" : "textbutton",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 60.0, 331.0, 47.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 248.0, 89.0, 40.0, 18.0 ],
					"rounded" : 8.0,
					"style" : "",
					"text" : "Read",
					"usebgoncolor" : 1,
					"usetextovercolor" : 1
				}

			}
, 			{
				"box" : 				{
					"annotation" : "The tracking (intra-character spacing) as a multiple of the standard tracking for the face. ",
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"format" : 6,
					"id" : "obj-2",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 429.0, 130.0, 35.0, 21.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 113.0, 111.0, 35.0, 21.0 ],
					"style" : "",
					"triangle" : 0,
					"triscale" : 0.9,
					"varname" : "TRACKING"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-3",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 376.0, 128.0, 79.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 150.0, 111.0, 79.0, 19.0 ],
					"style" : "",
					"text" : "Tracking"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-31",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 490.0, 221.0, 118.0, 21.0 ],
					"style" : "",
					"text" : "j.remote screenmode",
					"varname" : "screenmode"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-33",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 420.0, 225.0, 71.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 230.0, 20.5, 76.0, 19.0 ],
					"style" : "",
					"text" : "screenmode"
				}

			}
, 			{
				"box" : 				{
					"activecolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"annotation" : "If screenmode = 1, some 3D transformations are skipped so that pixel-accurate text can be drawn..",
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
					"disabled" : [ 0 ],
					"id" : "obj-34",
					"itemtype" : 1,
					"maxclass" : "radiogroup",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 395.0, 225.0, 80.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 215.0, 20.5, 80.0, 18.0 ],
					"size" : 1,
					"style" : "",
					"values" : [ 1 ],
					"varname" : "SCREENMODE"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-36",
					"linecount" : 2,
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 60.0, 356.0, 76.0, 33.0 ],
					"style" : "",
					"text" : "j.remote read"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-40",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 259.0, 285.0, 96.0, 21.0 ],
					"style" : "",
					"text" : "j.remote fontsize",
					"varname" : "fontsize"
				}

			}
, 			{
				"box" : 				{
					"annotation" : "Specifies the size in which to draw.",
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"hint" : "Fontsize",
					"id" : "obj-41",
					"maxclass" : "number",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 202.0, 283.0, 50.0, 21.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 107.0, 42.0, 28.0, 21.0 ],
					"style" : "",
					"triangle" : 0
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-43",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 428.0, 358.0, 77.0, 21.0 ],
					"style" : "",
					"text" : "j.remote font",
					"varname" : "font"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-45",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "bang", "bang" ],
					"patching_rect" : [ 428.0, 278.0, 52.0, 21.0 ],
					"style" : "",
					"text" : "j.init"
				}

			}
, 			{
				"box" : 				{
					"annotation" : "Specifies the font in which to draw.",
					"hint" : "Font",
					"id" : "obj-46",
					"items" : [ "Apple Braille Outline 6 Dot", ",", "Apple Braille Outline 8 Dot", ",", "Apple Braille Pinpoint 6 Dot", ",", "Apple Braille Pinpoint 8 Dot", ",", "Apple Braille", ",", "Apple Symbols", ",", "Apple SD Gothic Neo Bold", ",", "Apple SD Gothic Neo Regular", ",", ".Aqua Kana", ",", "Arial Hebrew", ",", "Arial Hebrew Light", ",", ".Arial Hebrew Desk Interface", ",", ".Arial Hebrew Desk Interface Light", ",", "Arial Hebrew Scholar", ",", "Arial Hebrew Scholar Light", ",", "Avenir Next Condensed Bold", ",", "Avenir Next Condensed Demi Bold", ",", "Avenir Next Condensed Italic", ",", "Avenir Next Condensed Medium", ",", "Avenir Next Condensed Regular", ",", "Avenir Next Condensed Heavy", ",", "Avenir Next Condensed Ultra Light", ",", "Avenir Next Bold", ",", "Avenir Next Demi Bold", ",", "Avenir Next Italic", ",", "Avenir Next Medium", ",", "Avenir Next Regular", ",", "Avenir Next Heavy", ",", "Avenir Next Ultra Light", ",", "Avenir Book", ",", "Avenir Book Oblique", ",", "Avenir Black", ",", "Avenir Black Oblique", ",", "Avenir Heavy", ",", "Avenir Heavy Oblique", ",", "Avenir Light", ",", "Avenir Light Oblique", ",", "Avenir Medium", ",", "Avenir Medium Oblique", ",", "Avenir Oblique", ",", "Avenir Roman", ",", "Courier", ",", "Courier Oblique", ",", "Geeza Pro Regular", ",", "Geeza Pro Bold", ",", ".Geeza Pro Interface Regular", ",", ".Geeza Pro Interface Bold", ",", ".Geeza Pro Interface Light", ",", ".Geeza PUA", ",", "Geneva", ",", "Helvetica", ",", "Helvetica Oblique", ",", "Helvetica Light", ",", "Helvetica Light Oblique", ",", "Helvetica Neue", ",", "Helvetica Neue Condensed Bold", ",", "Helvetica Neue UltraLight", ",", "Helvetica Neue Light", ",", "Helvetica Neue Condensed Black", ",", "Helvetica Neue Medium", ",", "Helvetica Neue Thin", ",", "System Font Regular", ",", "System Font Bold", ",", "System Font Italic", ",", "System Font Medium P4", ",", "System Font Medium Italic P4", ",", "System Font Light", ",", "System Font Thin", ",", "System Font UltraLight", ",", "System Font Heavy", ",", ".Hiragino Kaku Gothic Interface W1", ",", ".Hiragino Kaku Gothic Interface W2", ",", ".Keyboard", ",", "Kohinoor Devanagari Book", ",", "Kohinoor Devanagari Demi", ",", "Kohinoor Devanagari Medium", ",", "Kohinoor Devanagari Bold", ",", "Kohinoor Devanagari Light", ",", "LastResort", ",", "Lucida Grande", ",", ".Lucida Grande UI Regular", ",", ".Lucida Grande UI Bold", ",", "Marker Felt Thin", ",", "Marker Felt Wide", ",", "Menlo Regular", ",", "Menlo Bold", ",", "Menlo Italic", ",", "Monaco", ",", "Noteworthy Light", ",", "Noteworthy Bold", ",", "Optima Regular", ",", "Optima Bold", ",", "Optima Italic", ",", "Optima ExtraBlack", ",", "Palatino", ",", "Heiti TC Light", ",", "Heiti SC Light", ",", "Heiti TC Medium", ",", "Heiti SC Medium", ",", ".HeitiUI TC Thin", ",", ".HeitiUI SC Thin", ",", ".HeitiUI GB18030PUA Thin", ",", ".HeitiUI K Thin", ",", ".HeitiUI J Thin", ",", ".HeitiUI TC Ultra Light", ",", ".HeitiUI SC Ultra Light", ",", ".HeitiUI GB18030PUA Ultra Light", ",", ".HeitiUI K Ultra Light", ",", ".HeitiUI J Ultra Light", ",", "Symbol", ",", "Thonburi", ",", "Thonburi Light", ",", "Times Roman", ",", "Times Bold", ",", "Times Italic", ",", "Zapf Dingbats", ",", "Hiragino Mincho ProN W3", ",", "Hiragino Mincho ProN W6", ",", "Hiragino Kaku Gothic ProN W3", ",", "Hiragino Kaku Gothic ProN W6", ",", "Academy Engraved LET Plain:1.0", ",", "Al Nile", ",", ".Al Nile PUA", ",", "Al Tarikh Regular", ",", ".Al Tarikh PUA", ",", "Al Bayan Plain", ",", ".Al Bayan PUA Plain", ",", "American Typewriter", ",", "American Typewriter Light", ",", "American Typewriter Condensed", ",", "American Typewriter Condensed Light", ",", "Andale Mono", ",", "Apple Chancery", ",", "AppleGothic Regular", ",", "AppleMyungjo Regular", ",", "Apple SD GothicNeo ExtraBold", ",", "Apple SD Gothic Neo Heavy", ",", "Apple SD Gothic Neo Light", ",", "Apple SD Gothic Neo Medium", ",", "Apple SD Gothic Neo SemiBold", ",", "Apple SD Gothic Neo Thin", ",", "Apple SD Gothic Neo UltraLight", ",", "Arial Black", ",", "Arial Narrow", ",", "Arial Rounded MT Bold", ",", "Arial Unicode MS", ",", "Arial", ",", "Athelas Regular", ",", "Athelas Italic", ",", "Athelas Bold", ",", "Ayuthaya", ",", "Baghdad Regular", ",", ".Baghdad PUA", ",", "Bangla MN", ",", "Bangla Sangam MN", ",", "Bank Gothic Light", ",", "Bank Gothic Medium", ",", "Baoli SC Regular", ",", "Baskerville", ",", "Baskerville SemiBold", ",", "Beirut Regular", ",", ".Beirut PUA", ",", "Big Caslon Medium", ",", "Blackmoor LET Plain:2.0", ",", "BlairMdITC TT Medium", ",", "Bodoni 72 Oldstyle Book", ",", "Bodoni 72 Oldstyle Bold", ",", "Bodoni 72 Smallcaps Book", ",", "Bodoni 72 Book", ",", "Bodoni 72 Bold", ",", "Bodoni Ornaments", ",", "Bordeaux Roman Bold LET Plain", ",", "Bradley Hand Bold", ",", "Brush Script MT Italic", ",", "Capitals", ",", "Chalkboard", ",", "Chalkboard SE Light", ",", "Chalkboard SE Regular", ",", "Chalkboard SE Bold", ",", "Chalkduster", ",", "Charter Roman", ",", "Charter Italic", ",", "Charter Bold", ",", "Charter Black", ",", "Cochin", ",", "Comic Sans MS", ",", "Conduit ITC Std Black", ",", "Conduit ITC Std Bold", ",", "Conduit ITC Std Extra Bold", ",", "Conduit ITC Std Extra Light", ",", "Conduit ITC Std Italic", ",", "Conduit ITC Std Light", ",", "Conduit ITC Std Medium", ",", "Conduit ITC Std Regular", ",", "Copperplate", ",", "Copperplate Light", ",", "Corsiva Hebrew", ",", "Courier New", ",", "Damascus Regular", ",", ".Damascus PUA", ",", "Damascus Light", ",", ".Damascus PUA Light", ",", "Damascus Medium", ",", ".Damascus PUA Medium", ",", "Damascus Bold", ",", "Damascus Semi Bold", ",", ".Damascus PUA Semi Bold", ",", "DecoType Naskh Regular", ",", ".DecoType Naskh PUA", ",", "Devanagari Sangam MN", ",", "Devanagari MT", ",", "Didot", ",", "DIN Alternate Bold", ",", "DIN Condensed Bold", ",", "Diwan Kufi Regular", ",", ".Diwan Kufi PUA", ",", "Diwan Thuluth Regular", ",", "Euphemia UCAS", ",", "Farah Regular", ",", ".Farah PUA", ",", "Farisi Regular", ",", "Futura Medium", ",", "Futura Condensed Medium", ",", "Futura Condensed ExtraBold", ",", "Georgia", ",", "Gill Sans", ",", "Gill Sans UltraBold", ",", "Gill Sans SemiBold", ",", "Gill Sans Light", ",", "Gujarati Sangam MN", ",", "Gujarati MT", ",", "GungSeo Regular", ",", "Gurmukhi MN", ",", "Gurmukhi Sangam MN", ",", "Gurmukhi MT", ",", "Hannotate SC Regular", ",", "Hannotate TC Regular", ",", "Hannotate SC Bold", ",", "Hannotate TC Bold", ",", "HanziPen SC Regular", ",", "HanziPen TC Regular", ",", "HanziPen SC Bold", ",", "HanziPen TC Bold", ",", "HeadLineA Regular", ",", "Herculanum", ",", "Hiragino Sans GB W3", ",", "Hiragino Sans GB W6", ",", "Hoefler Text Ornaments", ",", "Hoefler Text", ",", "Hoefler Text Black", ",", "Impact", ",", "InaiMathi", ",", "Iowan Old Style Black", ",", "Iowan Old Style Bold", ",", "Iowan Old Style Italic", ",", "Iowan Old Style Roman", ",", "Iowan Old Style Titling", ",", "ITF Devanagari Book", ",", "ITF Devanagari Bold", ",", "ITF Devanagari Demi", ",", "ITF Devanagari Light", ",", "ITF Devanagari Medium", ",", "Jazz LET Plain:1.0", ",", "Kailasa Regular", ",", "Kaiti SC Black", ",", "Kaiti SC Bold", ",", "Kaiti TC Bold", ",", "Kaiti SC Regular", ",", "STKaiti", ",", "Kaiti TC Regular", ",", "Kannada MN", ",", "Kannada Sangam MN", ",", "Kefa Regular", ",", "Kefa Bold", ",", "Khmer MN", ",", "Khmer Sangam MN", ",", "Kokonor Regular", ",", "Krungthep", ",", "KufiStandardGK Regular", ",", ".KufiStandardGK PUA", ",", "Lantinghei SC Demibold", ",", "Lantinghei SC Extralight", ",", "Lantinghei SC Heavy", ",", "Lantinghei TC Demibold", ",", "Lantinghei TC Extralight", ",", "Lantinghei TC Heavy", ",", "Lao MN", ",", "Lao Sangam MN", ",", "Libian SC Regular", ",", "Luminari", ",", "Malayalam MN", ",", "Malayalam Sangam MN", ",", "Marion Regular", ",", "Marion Italic", ",", "Marion Bold", ",", "Microsoft Sans Serif", ",", "Mishafi Gold Regular", ",", "Mishafi Regular", ",", "Mona Lisa Solid ITC TT", ",", "Mshtakan Oblique", ",", "Mshtakan", ",", "Muna Regular", ",", ".Muna PUA", ",", "Muna Bold", ",", "Muna Black", ",", ".Muna PUA Black", ",", "Myanmar MN", ",", "Myanmar Sangam MN", ",", "Nadeem Regular", ",", ".Nadeem PUA", ",", "NanumGothic", ",", "NanumGothic ExtraBold", ",", "NanumMyeongjo", ",", "NanumMyeongjo ExtraBold", ",", "Nanum Brush Script", ",", "Nanum Pen Script", ",", "New Peninim MT", ",", "New Peninim MT Inclined", ",", "New Peninim MT Bold Inclined", ",", "GB18030 Bitmap", ",", "Oriya MN", ",", "Oriya Sangam MN", ",", "Osaka", ",", "Osaka-Mono", ",", "Papyrus Condensed", ",", "Papyrus", ",", "Party LET Plain:1.0", ",", "PCMyungjo Regular", ",", "Phosphate Inline", ",", "Phosphate Solid", ",", "PilGi Regular", ",", "pixelmix Regular", ",", "pixelmix bold Regular", ",", "Plantagenet Cherokee", ",", "PortagoITC TT", ",", "Princetown LET", ",", "PT Mono", ",", "PT Sans", ",", "PT Sans Narrow", ",", "PT Sans Caption", ",", "PT Serif", ",", "PT Serif Caption", ",", "Raanana", ",", "Sana Regular", ",", ".Sana PUA", ",", "Santa Fe LET Plain:1.0", ",", "Sathu", ",", "Savoye LET Plain:1.0", ",", "Savoye LET Plain CC.:1.0", ",", "SchoolHouse Cursive B", ",", "SchoolHouse Printed A", ",", "Seravek", ",", "Seravek Medium", ",", "Seravek Light", ",", "Seravek ExtraLight", ",", "Shree Devanagari 714", ",", "SignPainter-HouseScript", ",", "Silom", ",", "Sinhala MN", ",", "Sinhala Sangam MN", ",", "Skia", ",", "Snell Roundhand", ",", "Snell Roundhand Black", ",", "Songti SC Black", ",", "Songti SC Bold", ",", "Songti TC Bold", ",", "Songti SC Light", ",", "STSong", ",", "Songti TC Light", ",", "Songti SC Regular", ",", "Songti TC Regular", ",", "STIXGeneral-Regular", ",", "STIXGeneral-Bold", ",", "STIXGeneral-BoldItalic", ",", "STIXGeneral-Italic", ",", "STIXIntegralsD-Bold", ",", "STIXIntegralsD-Regular", ",", "STIXIntegralsSm-Bold", ",", "STIXIntegralsSm-Regular", ",", "STIXIntegralsUp-Bold", ",", "STIXIntegralsUpD-Bold", ",", "STIXIntegralsUpD-Regular", ",", "STIXIntegralsUp-Regular", ",", "STIXIntegralsUpSm-Bold", ",", "STIXIntegralsUpSm-Regular", ",", "STIXNonUnicode-Regular", ",", "STIXNonUnicode-Bold", ",", "STIXNonUnicode-BoldItalic", ",", "STIXNonUnicode-Italic", ",", "STIXSizeFiveSym-Regular", ",", "STIXSizeFourSym-Bold", ",", "STIXSizeFourSym-Regular", ",", "STIXSizeOneSym-Bold", ",", "STIXSizeOneSym-Regular", ",", "STIXSizeThreeSym-Bold", ",", "STIXSizeThreeSym-Regular", ",", "STIXSizeTwoSym-Bold", ",", "STIXSizeTwoSym-Regular", ",", "STIXVariants-Regular", ",", "STIXVariants-Bold", ",", "Stone Sans Sem ITC TT Semi", ",", "Stone Sans ITC TT Bold", ",", "Stone Sans Sem ITC TT SemiIta", ",", "Sukhumvit Set Thin", ",", "Sukhumvit Set Light", ",", "Sukhumvit Set Text", ",", "Sukhumvit Set Medium", ",", "Sukhumvit Set Semi Bold", ",", "Sukhumvit Set Bold", ",", "Superclarendon Regular", ",", "Superclarendon Italic", ",", "Superclarendon Light", ",", "Superclarendon Bold", ",", "Superclarendon Black", ",", "Synchro LET", ",", "Tahoma", ",", "Tamil MN", ",", "Tamil Sangam MN", ",", "Telugu MN", ",", "Telugu Sangam MN", ",", "Times New Roman", ",", "Trattatello", ",", "Trebuchet MS", ",", "Type Embellishments One LET Embellishments One LET Plain:1.0", ",", "Verdana", ",", "Waseem Regular", ",", "Waseem Light", ",", "Wawati SC Regular", ",", "Wawati TC Regular", ",", "Webdings", ",", "Weibei SC Bold", ",", "Weibei TC Bold", ",", "Wingdings 2", ",", "Wingdings 3", ",", "Wingdings", ",", "Xingkai SC Bold", ",", "Xingkai SC Light", ",", "YuGothic Bold", ",", "YuGothic Medium", ",", "YuMincho Demibold", ",", "YuMincho Medium", ",", "Yuanti SC Bold", ",", "Yuanti SC Light", ",", "Yuanti SC Regular", ",", "Yuppy SC Regular", ",", "Yuppy TC Regular", ",", "Zapfino", ",", "Hiragino Maru Gothic Pro W4", ",", "Hiragino Maru Gothic ProN W4", ",", "Hiragino Mincho Pro W3", ",", "Hiragino Mincho Pro W6", ",", "Hiragino Kaku Gothic Pro W3", ",", "Hiragino Kaku Gothic Pro W6", ",", "Hiragino Kaku Gothic Std W8", ",", "Hiragino Kaku Gothic StdN W8", ",", "LiSong Pro", ",", "LiHei Pro", ",", "STFangsong", ",", "STXihei", ",", "STHeiti", ",", "Accidentals", ",", "Boulez", ",", "DIN-Black", ",", "DIN-BlackItalic", ",", "DIN-Bold", ",", "DIN-BoldItalic", ",", "DIN-Light", ",", "DIN-LightItalic", ",", "DIN-Medium", ",", "DIN-MediumItalic", ",", "DIN-Regular", ",", "DIN-RegularItalic", ",", "Apple Color Emoji", ",", "TeamViewer10" ],
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 428.0, 331.0, 100.0, 21.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 6.0, 42.0, 99.0, 21.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-49",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 471.0, 127.0, 97.0, 21.0 ],
					"style" : "",
					"text" : "j.remote tracking",
					"varname" : "tracking"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-50",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 490.0, 163.0, 86.0, 21.0 ],
					"style" : "",
					"text" : "j.remote interp",
					"varname" : "interp"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-52",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 415.0, 160.0, 73.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 136.0, 20.5, 73.0, 19.0 ],
					"style" : "",
					"text" : "interpolate"
				}

			}
, 			{
				"box" : 				{
					"activecolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"annotation" : "Controls whether interpolation is used to draw textures when not in classic mode.",
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
					"disabled" : [ 0 ],
					"id" : "obj-53",
					"itemtype" : 1,
					"maxclass" : "radiogroup",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 395.0, 160.0, 80.0, 18.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 121.0, 20.5, 80.0, 18.0 ],
					"size" : 1,
					"style" : "",
					"values" : [ 1 ],
					"varname" : "INTERP"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-55",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 473.0, 104.0, 103.0, 21.0 ],
					"style" : "",
					"text" : "j.remote leadscale",
					"varname" : "leadscale"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-59",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 471.5, 22.0, 81.0, 21.0 ],
					"style" : "",
					"text" : "j.remote align",
					"varname" : "align"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-61",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 428.0, 303.0, 43.0, 21.0 ],
					"style" : "",
					"text" : "fontlist"
				}

			}
, 			{
				"box" : 				{
					"annotation" : "The leading between multiple rows of text as a multiple of the standard leading. ",
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"format" : 6,
					"id" : "obj-62",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 428.0, 105.0, 35.0, 21.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 113.0, 89.0, 35.0, 21.0 ],
					"style" : "",
					"triangle" : 0,
					"triscale" : 0.9,
					"varname" : "LEADSCALE"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-63",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 359.5, 105.0, 77.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 150.0, 89.0, 77.0, 19.0 ],
					"style" : "",
					"text" : "Lead Scale"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Verdana",
					"fontsize" : 10.0,
					"id" : "obj-71",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 15.0, 215.0, 40.0, 21.0 ],
					"style" : "",
					"text" : "j.view",
					"varname" : "jmod.hub"
				}

			}
, 			{
				"box" : 				{
					"comment" : "",
					"id" : "obj-79",
					"maxclass" : "outlet",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 15.0, 246.0, 25.0, 25.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"comment" : "",
					"id" : "obj-80",
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 15.0, 181.0, 25.0, 25.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"id" : "obj-87",
					"maxclass" : "j.ui",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 0.0, 0.0, 300.0, 140.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.0, 0.0, 300.0, 140.0 ],
					"text" : "/text_help"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-1", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-10", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-11", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-12", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-11", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-13", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-14", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-14", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-15", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-18", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-17", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-17", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-18", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-49", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-2", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-21", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-20", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-20", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-21", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-34", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-31", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-31", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-34", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-4", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-41", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-40", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-40", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-41", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-46", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 437.5, 395.0, 420.0, 395.0, 420.0, 328.0, 437.5, 328.0 ],
					"source" : [ "obj-43", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-61", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-45", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-43", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 478.0, 353.5, 437.5, 353.5 ],
					"source" : [ "obj-46", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-49", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-53", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-50", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-50", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-53", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-62", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-55", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-94", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-59", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 357.5, 533.0, 267.5, 533.0, 267.5, 409.0, 285.5, 409.0 ],
					"source" : [ "obj-6", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-46", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-61", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-55", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-62", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-79", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-71", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-71", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-80", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-87", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-36", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-88", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-59", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-94", 1 ]
				}

			}
 ]
	}

}
