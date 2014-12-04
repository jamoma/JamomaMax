{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 7,
			"minor" : 0,
			"revision" : 1,
			"architecture" : "x86",
			"modernui" : 1
		}
,
		"rect" : [ 452.0, 197.0, 300.0, 140.0 ],
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
					"patching_rect" : [ 425.0, 45.0, 57.0, 21.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 235.0, 25.0, 60.0, 21.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"annotation" : "Specifies the face variant of the current font..",
					"hint" : "Font",
					"id" : "obj-89",
					"items" : [ "normal", ",", "bold", ",", "italic" ],
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 187.0, 358.0, 64.0, 21.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 175.0, 25.0, 58.0, 21.0 ],
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
					"presentation_rect" : [ 5.0, 25.0, 40.0, 18.0 ],
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
					"patching_rect" : [ 185.0, 319.0, 35.0, 21.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 115.0, 70.0, 35.0, 21.0 ],
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
					"patching_rect" : [ 146.0, 59.0, 79.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 155.0, 70.0, 79.0, 19.0 ],
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
					"presentation_rect" : [ 20.0, 65.0, 76.0, 19.0 ],
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
					"presentation_rect" : [ 5.0, 65.0, 80.0, 18.0 ],
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
					"id" : "obj-38",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 257.0, 358.0, 78.0, 21.0 ],
					"style" : "",
					"text" : "j.remote face",
					"varname" : "face"
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
					"presentation_rect" : [ 145.0, 25.0, 28.0, 21.0 ],
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
					"items" : [ "Apple Braille Outline 6 Dot", ",", "Apple Braille Outline 8 Dot", ",", "Apple Braille Pinpoint 6 Dot", ",", "Apple Braille Pinpoint 8 Dot", ",", "Apple Braille", ",", "Apple Color Emoji", ",", "Apple Symbols", ",", "Apple SD Gothic Neo Bold", ",", "Apple SD Gothic Neo Regular", ",", ".Aqua Kana", ",", "Arial Hebrew", ",", "Arial Hebrew Light", ",", ".Arial Hebrew Desk Interface", ",", ".Arial Hebrew Desk Interface Light", ",", "Arial Hebrew Scholar", ",", "Arial Hebrew Scholar Light", ",", "Avenir Next Condensed Bold", ",", "Avenir Next Condensed Demi Bold", ",", "Avenir Next Condensed Italic", ",", "Avenir Next Condensed Medium", ",", "Avenir Next Condensed Regular", ",", "Avenir Next Condensed Heavy", ",", "Avenir Next Condensed Ultra Light", ",", "Avenir Next Bold", ",", "Avenir Next Demi Bold", ",", "Avenir Next Italic", ",", "Avenir Next Medium", ",", "Avenir Next Regular", ",", "Avenir Next Heavy", ",", "Avenir Next Ultra Light", ",", "Avenir Book", ",", "Avenir Book Oblique", ",", "Avenir Black", ",", "Avenir Black Oblique", ",", "Avenir Heavy", ",", "Avenir Heavy Oblique", ",", "Avenir Light", ",", "Avenir Light Oblique", ",", "Avenir Medium", ",", "Avenir Medium Oblique", ",", "Avenir Oblique", ",", "Avenir Roman", ",", "Courier", ",", "Courier Oblique", ",", "Geeza Pro Regular", ",", "Geeza Pro Bold", ",", ".Geeza Pro Interface Regular", ",", ".Geeza Pro Interface Bold", ",", ".Geeza Pro Interface Light", ",", ".Geeza PUA", ",", "Geneva", ",", ".Helvetica LT MM", ",", "Helvetica", ",", "Helvetica Oblique", ",", "Helvetica Light", ",", "Helvetica Light Oblique", ",", "Helvetica Neue", ",", "Helvetica Neue Condensed Bold", ",", "Helvetica Neue UltraLight", ",", "Helvetica Neue Light", ",", "Helvetica Neue Condensed Black", ",", "Helvetica Neue Medium", ",", "Helvetica Neue Thin", ",", "System Font Regular", ",", "System Font Bold", ",", "System Font Italic", ",", "System Font Medium P4", ",", "System Font Medium Italic P4", ",", "System Font Light", ",", "System Font Thin", ",", "System Font UltraLight", ",", "System Font Heavy", ",", ".Hiragino Kaku Gothic Interface W1", ",", ".Hiragino Kaku Gothic Interface W2", ",", ".Keyboard", ",", "Kohinoor Devanagari Book", ",", "Kohinoor Devanagari Demi", ",", "Kohinoor Devanagari Medium", ",", "Kohinoor Devanagari Bold", ",", "Kohinoor Devanagari Light", ",", "LastResort", ",", "Lucida Grande", ",", ".Lucida Grande UI Regular", ",", ".Lucida Grande UI Bold", ",", "Marker Felt Thin", ",", "Marker Felt Wide", ",", "Menlo Regular", ",", "Menlo Bold", ",", "Menlo Italic", ",", "Monaco", ",", "Noteworthy Light", ",", "Noteworthy Bold", ",", "Optima Regular", ",", "Optima Bold", ",", "Optima Italic", ",", "Optima ExtraBlack", ",", "Palatino", ",", "Heiti TC Light", ",", "Heiti SC Light", ",", "Heiti TC Medium", ",", "Heiti SC Medium", ",", ".HeitiUI TC Thin", ",", ".HeitiUI SC Thin", ",", ".HeitiUI GB18030PUA Thin", ",", ".HeitiUI K Thin", ",", ".HeitiUI J Thin", ",", ".HeitiUI TC Ultra Light", ",", ".HeitiUI SC Ultra Light", ",", ".HeitiUI GB18030PUA Ultra Light", ",", ".HeitiUI K Ultra Light", ",", ".HeitiUI J Ultra Light", ",", "Symbol", ",", "Thonburi", ",", "Thonburi Light", ",", ".Times LT MM", ",", "Times Roman", ",", "Times Bold", ",", "Times Italic", ",", "Zapf Dingbats", ",", "Hiragino Mincho ProN W3", ",", "Hiragino Mincho ProN W6", ",", "Hiragino Kaku Gothic ProN W3", ",", "Hiragino Kaku Gothic ProN W6", ",", "Academy Engraved LET Plain:1.0", ",", "Adobe Caslon Pro", ",", "Adobe Caslon Pro Semibold", ",", "Adobe Arabic Bold", ",", "Adobe Arabic Italic", ",", "Adobe Arabic Regular", ",", "Adobe Fangsong Std R", ",", "Adobe Fan Heiti Std B", ",", "Adobe Gothic Std B", ",", "Adobe Hebrew Bold", ",", "Adobe Hebrew Italic", ",", "Adobe Hebrew Regular", ",", "Adobe Heiti Std R", ",", "Adobe Kaiti Std R", ",", "Adobe Ming Std L", ",", "Adobe Myungjo Std M", ",", "Adobe Song Std L", ",", "Adobe Garamond Pro", ",", "Al Nile", ",", ".Al Nile PUA", ",", "Al Tarikh Regular", ",", ".Al Tarikh PUA", ",", "Al Bayan Plain", ",", ".Al Bayan PUA Plain", ",", "American Typewriter", ",", "American Typewriter Light", ",", "American Typewriter Condensed", ",", "American Typewriter Condensed Light", ",", "Andale Mono", ",", "Apple Chancery", ",", "Apple Casual", ",", "AppleGothic Regular", ",", "AppleMyungjo Regular", ",", "Apple SD GothicNeo ExtraBold", ",", "Apple SD Gothic Neo Heavy", ",", "Apple SD Gothic Neo Light", ",", "Apple SD Gothic Neo Medium", ",", "Apple SD Gothic Neo SemiBold", ",", "Apple SD Gothic Neo Thin", ",", "Apple SD Gothic Neo UltraLight", ",", "Arial Black", ",", "Arial Narrow", ",", "Arial Rounded MT Bold", ",", "Arial Unicode MS", ",", "Arial", ",", "Athelas Regular", ",", "Athelas Italic", ",", "Athelas Bold", ",", "Ayuthaya", ",", "Baghdad Regular", ",", ".Baghdad PUA", ",", "Bangla MN", ",", "Bangla Sangam MN", ",", "Bank Gothic Light", ",", "Bank Gothic Medium", ",", "Baoli SC Regular", ",", "Baskerville", ",", "Baskerville SemiBold", ",", "Beirut Regular", ",", ".Beirut PUA", ",", "Big Caslon Medium", ",", "Birch Std", ",", "Blackmoor LET Plain:2.0", ",", "Blackoak Std", ",", "BlairMdITC TT Medium", ",", "Bodoni 72 Oldstyle Book", ",", "Bodoni 72 Oldstyle Bold", ",", "Bodoni 72 Smallcaps Book", ",", "Bodoni 72 Book", ",", "Bodoni 72 Bold", ",", "Bodoni Ornaments", ",", "Bordeaux Roman Bold LET Plain:1.0", ",", "Bradley Hand Bold", ",", "Brush Script MT Italic", ",", "Brush Script Std Medium", ",", "Capitals", ",", "Chalkboard", ",", "Chalkboard SE Light", ",", "Chalkboard SE Regular", ",", "Chalkboard SE Bold", ",", "Chalkduster", ",", "Chaparral Pro", ",", "Charlemagne Std Bold", ",", "Charter Roman", ",", "Charter Italic", ",", "Charter Bold", ",", "Charter Black", ",", "Cochin", ",", "Comic Sans MS", ",", "Cooper Std Black", ",", "Copperplate", ",", "Copperplate Light", ",", "Corsiva Hebrew", ",", "Courier New", ",", "Cracked", ",", "Damascus Regular", ",", ".Damascus PUA", ",", "Damascus Light", ",", ".Damascus PUA Light", ",", "Damascus Medium", ",", ".Damascus PUA Medium", ",", "Damascus Bold", ",", "Damascus Semi Bold", ",", ".Damascus PUA Semi Bold", ",", "DecoType Naskh Regular", ",", ".DecoType Naskh PUA", ",", "Devanagari Sangam MN", ",", "Devanagari MT", ",", "Didot", ",", "DIN Alternate Bold", ",", "DIN Condensed Bold", ",", "Diwan Kufi Regular", ",", ".Diwan Kufi PUA", ",", "Diwan Thuluth Regular", ",", "Euphemia UCAS", ",", "Farah Regular", ",", ".Farah PUA", ",", "Farisi Regular", ",", "Futura Medium", ",", "Futura Condensed Medium", ",", "Futura Condensed ExtraBold", ",", "Georgia", ",", "Giddyup Std", ",", "Gill Sans", ",", "Gill Sans UltraBold", ",", "Gill Sans SemiBold", ",", "Gill Sans Light", ",", "Guido2", ",", "Gujarati Sangam MN", ",", "Gujarati MT", ",", "GungSeo Regular", ",", "Gurmukhi MN", ",", "Gurmukhi Sangam MN", ",", "Gurmukhi MT", ",", "Handwriting - Dakota", ",", "Hannotate SC Regular", ",", "Hannotate TC Regular", ",", "Hannotate SC Bold", ",", "Hannotate TC Bold", ",", "HanziPen SC Regular", ",", "HanziPen TC Regular", ",", "HanziPen SC Bold", ",", "HanziPen TC Bold", ",", "HeadLineA Regular", ",", "Herculanum", ",", "Hiragino Sans GB W3", ",", "Hiragino Sans GB W6", ",", "Hobo Std Medium", ",", "Hoefler Text Ornaments", ",", "Hoefler Text", ",", "Hoefler Text Black", ",", "Impact", ",", "InaiMathi", ",", "Iowan Old Style Black", ",", "Iowan Old Style Bold", ",", "Iowan Old Style Italic", ",", "Iowan Old Style Roman", ",", "Iowan Old Style Titling", ",", "ITF Devanagari Book", ",", "ITF Devanagari Bold", ",", "ITF Devanagari Demi", ",", "ITF Devanagari Light", ",", "ITF Devanagari Medium", ",", "Jazz LET Plain:1.0", ",", "Kailasa Regular", ",", "Kaiti SC Black", ",", "Kaiti SC Bold", ",", "Kaiti TC Bold", ",", "Kaiti SC Regular", ",", "STKaiti", ",", "Kaiti TC Regular", ",", "Kannada MN", ",", "Kannada Sangam MN", ",", "Kefa Regular", ",", "Kefa Bold", ",", "Khmer MN", ",", "Khmer Sangam MN", ",", "Kokonor Regular", ",", "Kozuka Gothic Pr6N B", ",", "Kozuka Gothic Pr6N EL", ",", "Kozuka Gothic Pr6N H", ",", "Kozuka Gothic Pr6N L", ",", "Kozuka Gothic Pr6N M", ",", "Kozuka Gothic Pr6N R", ",", "Kozuka Gothic Pro B", ",", "Kozuka Gothic Pro EL", ",", "Kozuka Gothic Pro H", ",", "Kozuka Gothic Pro L", ",", "Kozuka Gothic Pro M", ",", "Kozuka Gothic Pro R", ",", "Kozuka Mincho Pr6N B", ",", "Kozuka Mincho Pr6N EL", ",", "Kozuka Mincho Pr6N H", ",", "Kozuka Mincho Pr6N L", ",", "Kozuka Mincho Pr6N M", ",", "Kozuka Mincho Pr6N R", ",", "Kozuka Mincho Pro B", ",", "Kozuka Mincho Pro EL", ",", "Kozuka Mincho Pro H", ",", "Kozuka Mincho Pro L", ",", "Kozuka Mincho Pro M", ",", "Kozuka Mincho Pro R", ",", "Krungthep", ",", "KufiStandardGK Regular", ",", ".KufiStandardGK PUA", ",", "Lantinghei SC Demibold", ",", "Lantinghei SC Extralight", ",", "Lantinghei SC Heavy", ",", "Lantinghei TC Demibold", ",", "Lantinghei TC Extralight", ",", "Lantinghei TC Heavy", ",", "Lao MN", ",", "Lao Sangam MN", ",", "Letter Gothic Std Bold", ",", "Letter Gothic Std Bold Slanted", ",", "Letter Gothic Std Slanted", ",", "Letter Gothic Std Medium", ",", "Libian SC Regular", ",", "Lithos Pro Black", ",", "Lithos Pro", ",", "Luminari", ",", "Malayalam MN", ",", "Malayalam Sangam MN", ",", "Marion Regular", ",", "Marion Italic", ",", "Marion Bold", ",", "Mesquite Std Medium", ",", "Microsoft Sans Serif", ",", "Minion Pro Bold Cond", ",", "Minion Pro Medium", ",", "Minion Pro", ",", "Minion Pro Semibold", ",", "Mishafi Gold Regular", ",", "Mishafi Regular", ",", "Mona Lisa Solid ITC TT", ",", "Mshtakan Oblique", ",", "Mshtakan", ",", "Muna Regular", ",", ".Muna PUA", ",", "Muna Bold", ",", "Muna Black", ",", ".Muna PUA Black", ",", "Myanmar MN", ",", "Myanmar Sangam MN", ",", "Myriad Pro Bold Condensed", ",", "Myriad Pro Condensed", ",", "Myriad Pro", ",", "Myriad Pro Semibold", ",", "Nadeem Regular", ",", ".Nadeem PUA", ",", "NanumGothic", ",", "NanumGothic ExtraBold", ",", "NanumMyeongjo", ",", "NanumMyeongjo ExtraBold", ",", "Nanum Brush Script", ",", "Nanum Pen Script", ",", "New Peninim MT", ",", "New Peninim MT Inclined", ",", "New Peninim MT Bold Inclined", ",", "GB18030 Bitmap", ",", "Nueva Std Bold Condensed", ",", "Nueva Std Condensed", ",", "OCR A Std", ",", "Orator Std Slanted", ",", "Orator Std Medium", ",", "Oriya MN", ",", "Oriya Sangam MN", ",", "Osaka", ",", "Osaka-Mono", ",", "Papyrus Condensed", ",", "Papyrus", ",", "Party LET Plain:1.0", ",", "PCMyungjo Regular", ",", "Phosphate Inline", ",", "Phosphate Solid", ",", "PilGi Regular", ",", "Plantagenet Cherokee", ",", "Poplar Std Black", ",", "PortagoITC TT", ",", "Prestige Elite Std Bold", ",", "Princetown LET", ",", "PT Mono", ",", "PT Sans", ",", "PT Sans Narrow", ",", "PT Sans Caption", ",", "PT Serif", ",", "PT Serif Caption", ",", "Raanana", ",", "Rosewood Std", ",", "Sana Regular", ",", ".Sana PUA", ",", "Santa Fe LET Plain:1.0", ",", "Sathu", ",", "Savoye LET Plain:1.0", ",", "Savoye LET Plain CC.:1.0", ",", "SchoolHouse Cursive B", ",", "SchoolHouse Printed A", ",", "Seravek", ",", "Seravek Medium", ",", "Seravek Light", ",", "Seravek ExtraLight", ",", "Shree Devanagari 714", ",", "SignPainter-HouseScript", ",", "Silom", ",", "Sinhala MN", ",", "Sinhala Sangam MN", ",", "Skia", ",", "Snell Roundhand", ",", "Snell Roundhand Black", ",", "Songti SC Black", ",", "Songti SC Bold", ",", "Songti TC Bold", ",", "Songti SC Light", ",", "STSong", ",", "Songti TC Light", ",", "Songti SC Regular", ",", "Songti TC Regular", ",", "Stencil Std Bold", ",", "STIXGeneral-Regular", ",", "STIXGeneral-Bold", ",", "STIXGeneral-BoldItalic", ",", "STIXGeneral-Italic", ",", "STIXIntegralsD-Bold", ",", "STIXIntegralsD-Regular", ",", "STIXIntegralsSm-Bold", ",", "STIXIntegralsSm-Regular", ",", "STIXIntegralsUp-Bold", ",", "STIXIntegralsUpD-Bold", ",", "STIXIntegralsUpD-Regular", ",", "STIXIntegralsUp-Regular", ",", "STIXIntegralsUpSm-Bold", ",", "STIXIntegralsUpSm-Regular", ",", "STIXNonUnicode-Regular", ",", "STIXNonUnicode-Bold", ",", "STIXNonUnicode-BoldItalic", ",", "STIXNonUnicode-Italic", ",", "STIXSizeFiveSym-Regular", ",", "STIXSizeFourSym-Bold", ",", "STIXSizeFourSym-Regular", ",", "STIXSizeOneSym-Bold", ",", "STIXSizeOneSym-Regular", ",", "STIXSizeThreeSym-Bold", ",", "STIXSizeThreeSym-Regular", ",", "STIXSizeTwoSym-Bold", ",", "STIXSizeTwoSym-Regular", ",", "STIXVariants-Regular", ",", "STIXVariants-Bold", ",", "Stone Sans Sem ITC TT Semi", ",", "Stone Sans ITC TT Bold", ",", "Stone Sans Sem ITC TT SemiIta", ",", "Sukhumvit Set Thin", ",", "Sukhumvit Set Light", ",", "Sukhumvit Set Text", ",", "Sukhumvit Set Medium", ",", "Sukhumvit Set Semi Bold", ",", "Sukhumvit Set Bold", ",", "Superclarendon Regular", ",", "Superclarendon Italic", ",", "Superclarendon Light", ",", "Superclarendon Bold", ",", "Superclarendon Black", ",", "Synchro LET", ",", "Tahoma", ",", "Tamil MN", ",", "Tamil Sangam MN", ",", "Tekton Pro Bold", ",", "Tekton Pro Bold Condensed", ",", "Tekton Pro Bold Extended", ",", "Tekton Pro Bold Oblique", ",", "Telugu MN", ",", "Telugu Sangam MN", ",", "Times New Roman", ",", "Trajan Pro", ",", "Trattatello", ",", "Trebuchet MS", ",", "Type Embellishments One LET Embellishments One LET Plain:1.0", ",", "Verdana", ",", "Waseem Regular", ",", "Waseem Light", ",", "Wawati SC Regular", ",", "Wawati TC Regular", ",", "Webdings", ",", "Weibei SC Bold", ",", "Weibei TC Bold", ",", "Wingdings 2", ",", "Wingdings 3", ",", "Wingdings", ",", "Xingkai SC Bold", ",", "Xingkai SC Light", ",", "YuGothic Bold", ",", "YuGothic Medium", ",", "YuMincho Demibold", ",", "YuMincho Medium", ",", "Yuanti SC Bold", ",", "Yuanti SC Light", ",", "Yuanti SC Regular", ",", "Yuppy SC Regular", ",", "Yuppy TC Regular", ",", "Zapfino", ",", "Hiragino Maru Gothic Pro W4", ",", "Hiragino Maru Gothic ProN W4", ",", "Hiragino Mincho Pro W3", ",", "Hiragino Mincho Pro W6", ",", "Hiragino Kaku Gothic Pro W3", ",", "Hiragino Kaku Gothic Pro W6", ",", "Hiragino Kaku Gothic Std W8", ",", "Hiragino Kaku Gothic StdN W8", ",", "LiSong Pro", ",", "LiHei Pro", ",", "STFangsong", ",", "STXihei", ",", "STHeiti", ",", "DIN 1451 Std Engschrift", ",", "DIN 1451 Std Mittelschrift", ",", "DIN-Black", ",", "DIN-BlackItalic", ",", "DIN-Bold", ",", "DIN-BoldItalic", ",", "DIN-Light", ",", "DIN-LightItalic", ",", "DIN-Medium", ",", "DIN-MediumItalic", ",", "DIN-Regular", ",", "DIN-RegularItalic" ],
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 428.0, 331.0, 100.0, 21.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 45.0, 25.0, 100.0, 21.0 ],
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
					"patching_rect" : [ 227.0, 316.0, 97.0, 21.0 ],
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
					"presentation_rect" : [ 20.0, 50.0, 73.0, 19.0 ],
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
					"presentation_rect" : [ 5.0, 50.0, 80.0, 18.0 ],
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
					"patching_rect" : [ 490.0, 45.0, 81.0, 21.0 ],
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
					"presentation_rect" : [ 115.0, 50.0, 35.0, 21.0 ],
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
					"patching_rect" : [ 146.0, 43.0, 77.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 155.0, 50.0, 77.0, 19.0 ],
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
					"bgcolor" : [ 0.93, 0.93, 0.93, 1.0 ],
					"fontface" : 0,
					"headercolor" : [ 0.82, 0.82, 0.82, 1.0 ],
					"id" : "obj-87",
					"maxclass" : "j.ui",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 0.0, 0.0, 300.0, 140.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.0, 0.0, 300.0, 140.0 ],
					"text" : "/text2d_help"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-49", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-2", 0 ]
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
					"destination" : [ "obj-89", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-38", 0 ]
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
					"destination" : [ "obj-38", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-89", 1 ]
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
