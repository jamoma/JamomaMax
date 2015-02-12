{
  "patcher": {
    "fileversion": 1,
    "rect": [
      67.0,
      44.0,
      1147.0,
      551.0
    ],
    "bglocked": 0,
    "defrect": [
      67.0,
      44.0,
      1147.0,
      551.0
    ],
    "openrect": [
      0.0,
      0.0,
      0.0,
      0.0
    ],
    "openinpresentation": 1,
    "default_fontsize": 12.0,
    "default_fontface": 0,
    "default_fontname": "Arial",
    "gridonopen": 0,
    "gridsize": [
      5.0,
      5.0
    ],
    "gridsnaponopen": 0,
    "toolbarvisible": 1,
    "boxanimatetime": 200,
    "imprint": 0,
    "enablehscroll": 1,
    "enablevscroll": 1,
    "devicewidth": 0.0,
    "boxes": [
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-2",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            214.0,
            356.0,
            55.0,
            19.0
          ],
          "text": "j.out"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-7",
          "linecount": 3,
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 3,
          "outlettype": [
            "",
            "",
            ""
          ],
          "patching_rect": [
            524.0,
            199.0,
            567.0,
            43.0
          ],
          "text": "j.remote 32"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-1",
          "linecount": 2,
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 3,
          "outlettype": [
            "",
            "",
            ""
          ],
          "patching_rect": [
            524.0,
            245.0,
            362.0,
            31.0
          ],
          "text": "j.remote matrix/dump"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-3",
          "linecount": 3,
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 3,
          "outlettype": [
            "",
            "",
            ""
          ],
          "patching_rect": [
            526.0,
            131.0,
            599.0,
            43.0
          ],
          "text": "j.remote numSpeakers",
          "varname": "voices"
        }
      },
      {
        "box": {
          "bgcolor": [
            0.094118,
            0.094118,
            0.094118,
            1.0
          ],
          "bordercolor": [
            0.094118,
            0.094118,
            0.094118,
            1.0
          ],
          "candicane2": [
            0.145098,
            0.203922,
            0.356863,
            1.0
          ],
          "candicane3": [
            0.290196,
            0.411765,
            0.713726,
            1.0
          ],
          "candicane4": [
            0.439216,
            0.619608,
            0.070588,
            1.0
          ],
          "candicane5": [
            0.584314,
            0.827451,
            0.431373,
            1.0
          ],
          "candicane6": [
            0.733333,
            0.035294,
            0.788235,
            1.0
          ],
          "candicane7": [
            0.878431,
            0.243137,
            0.145098,
            1.0
          ],
          "candicane8": [
            0.027451,
            0.447059,
            0.501961,
            1.0
          ],
          "ghostbar": 50,
          "id": "obj-4",
          "ignoreclick": 1,
          "maxclass": "multislider",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            5.0,
            25.0,
            288.0,
            35.0
          ],
          "peakcolor": [
            0.498039,
            0.498039,
            0.498039,
            1.0
          ],
          "presentation": 1,
          "presentation_rect": [
            3.0,
            22.0,
            293.0,
            44.0
          ],
          "setminmax": [
            0.0,
            1.0
          ],
          "size": 5,
          "slidercolor": [
            0.419608,
            0.419608,
            0.419608,
            1.0
          ],
          "spacing": 3,
          "varname": "MULTISLIDER"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-5",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            210.0,
            200.0,
            54.0,
            19.0
          ],
          "text": "j.in"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "frgb": [
            0.0,
            0.0,
            0.0,
            1.0
          ],
          "id": "obj-6",
          "linecount": 3,
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            423.0,
            345.0,
            67.0,
            43.0
          ],
          "text": "multicable signal output"
        }
      },
      {
        "box": {
          "comment": "Channel 1",
          "id": "obj-9",
          "maxclass": "outlet",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            388.0,
            345.0,
            30.0,
            30.0
          ]
        }
      },
      {
        "box": {
          "comment": "W - omni",
          "id": "obj-10",
          "maxclass": "inlet",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            385.0,
            165.0,
            30.0,
            30.0
          ]
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "frgb": [
            0.0,
            0.0,
            0.0,
            1.0
          ],
          "id": "obj-11",
          "linecount": 3,
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            420.0,
            160.0,
            64.0,
            43.0
          ],
          "text": "multicable signal input"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-15",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "dump",
            "audio.connect"
          ],
          "patching_rect": [
            210.0,
            305.0,
            196.0,
            19.0
          ],
          "text": "jalg.sur.speaker.distamp~"
        }
      },
      {
        "box": {
          "bgcolor": [
            0.8,
            0.54902,
            0.54902,
            1.0
          ],
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-16",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            50.0,
            90.0,
            251.0,
            17.0
          ],
          "text": "/preset/store 1 default, /preset/write"
        }
      },
      {
        "box": {
          "bgcolor": [
            0.8,
            0.54902,
            0.54902,
            1.0
          ],
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-17",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            80.0,
            110.0,
            160.0,
            17.0
          ],
          "text": "/documentation/generate"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-19",
          "linecount": 2,
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            10.0,
            150.0,
            295.0,
            31.0
          ],
          "text": "j.model @description \"Amplitude of speakers adjusted in proportion to distance from sweet spot\"",
          "varname": "j.model"
        }
      },
      {
        "box": {
          "comment": "",
          "id": "obj-21",
          "maxclass": "inlet",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            10.0,
            90.0,
            30.0,
            30.0
          ]
        }
      },
      {
        "box": {
          "comment": "",
          "id": "obj-23",
          "maxclass": "outlet",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            10.0,
            345.0,
            30.0,
            30.0
          ]
        }
      },
      {
        "box": {
          "hint": "For display purpose only",
          "id": "obj-24",
          "maxclass": "hint",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            0.0,
            28.0,
            253.0,
            30.0
          ]
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "frgb": [
            0.0,
            0.0,
            0.0,
            1.0
          ],
          "id": "obj-25",
          "linecount": 2,
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            25.0,
            459.0,
            409.0,
            31.0
          ],
          "text": "This module adjust amplitude of speakers according to distance from sweet spot, so that normalized amplitude correction is proportional to distance."
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "frgb": [
            0.0,
            0.0,
            0.0,
            1.0
          ],
          "id": "obj-26",
          "linecount": 3,
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            25.0,
            490.0,
            384.0,
            43.0
          ],
          "text": "Such amplitude correction is performed in the ambipan~ Max external for ambisonic panning made by A.Sedes, B.Courribet and J.B.Thiebaut at CICM Université Paris8, Maison des Sciences de l'Homme Paris Nord."
        }
      },
      {
        "box": {
          "has_bypass": 1,
          "id": "obj-28",
          "maxclass": "j.ui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "prefix": "audio",
          "presentation": 1,
          "presentation_rect": [
            0.0,
            0.0,
            300.0,
            70.0
          ],
          "text": "/editing_this_module"
        }
      }
    ],
    "lines": [
      {
        "patchline": {
          "destination": [
            "obj-15",
            1
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-10",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-9",
            0
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-15",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-19",
            0
          ],
          "hidden": 0,
          "midpoints": [
            59.5,
            138.0,
            19.5,
            138.0
          ],
          "source": [
            "obj-16",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-19",
            0
          ],
          "hidden": 0,
          "midpoints": [
            89.5,
            141.0,
            19.5,
            141.0
          ],
          "source": [
            "obj-17",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-23",
            0
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-19",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-19",
            0
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-21",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-15",
            0
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-5",
            0
          ]
        }
      }
    ]
  }
}