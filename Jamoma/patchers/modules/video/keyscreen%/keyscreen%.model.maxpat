{
  "patcher": {
    "fileversion": 1,
    "rect": [
      384.0,
      79.0,
      654.0,
      286.0
    ],
    "bglocked": 0,
    "defrect": [
      384.0,
      79.0,
      654.0,
      286.0
    ],
    "openrect": [
      0.0,
      0.0,
      0.0,
      0.0
    ],
    "openinpresentation": 0,
    "default_fontsize": 10.0,
    "default_fontface": 0,
    "default_fontname": "Verdana",
    "gridonopen": 0,
    "gridsize": [
      5.0,
      5.0
    ],
    "gridsnaponopen": 0,
    "toolbarvisible": 1,
    "boxanimatetime": 200,
    "imprint": 0,
    "boxes": [
      {
        "box": {
          "fontname": "Verdana",
          "fontsize": 10.0,
          "id": "obj-1",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ],
          "patching_rect": [
            384.0,
            99.0,
            32.5,
            19.0
          ],
          "text": "- 1"
        }
      },
      {
        "box": {
          "fontname": "Verdana",
          "fontsize": 10.0,
          "id": "obj-2",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ],
          "patching_rect": [
            323.0,
            97.0,
            32.5,
            19.0
          ],
          "text": "- 1"
        }
      },
      {
        "box": {
          "fontname": "Verdana",
          "fontsize": 10.0,
          "id": "obj-3",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ],
          "patching_rect": [
            261.0,
            97.0,
            32.5,
            19.0
          ],
          "text": "- 1"
        }
      },
      {
        "box": {
          "fontname": "Verdana",
          "fontsize": 10.0,
          "id": "obj-4",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            446.0,
            124.0,
            55.0,
            17.0
          ],
          "text": "mode $1"
        }
      },
      {
        "box": {
          "fontname": "Verdana",
          "fontsize": 10.0,
          "id": "obj-5",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            384.0,
            124.0,
            54.0,
            17.0
          ],
          "text": "mask $1"
        }
      },
      {
        "box": {
          "fontname": "Verdana",
          "fontsize": 10.0,
          "id": "obj-6",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            323.0,
            124.0,
            57.0,
            17.0
          ],
          "text": "target $1"
        }
      },
      {
        "box": {
          "fontname": "Verdana",
          "fontsize": 10.0,
          "id": "obj-7",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            261.0,
            124.0,
            45.0,
            17.0
          ],
          "text": "key $1"
        }
      },
      {
        "box": {
          "fontname": "Verdana",
          "fontsize": 10.0,
          "id": "obj-8",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            138.0,
            75.0,
            48.0,
            17.0
          ],
          "text": "blue $1"
        }
      },
      {
        "box": {
          "fontname": "Verdana",
          "fontsize": 10.0,
          "id": "obj-9",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            77.0,
            75.0,
            55.0,
            17.0
          ],
          "text": "green $1"
        }
      },
      {
        "box": {
          "fontname": "Verdana",
          "fontsize": 10.0,
          "id": "obj-10",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            15.0,
            75.0,
            43.0,
            17.0
          ],
          "text": "red $1"
        }
      },
      {
        "box": {
          "comment": "video input 2 (background)",
          "id": "obj-11",
          "maxclass": "inlet",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            603.0,
            10.0,
            25.0,
            25.0
          ]
        }
      },
      {
        "box": {
          "fontname": "Verdana",
          "fontsize": 10.0,
          "id": "obj-12",
          "linecount": 4,
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            186.0,
            75.0,
            73.0,
            53.0
          ],
          "text": "alphatol $1, redtol $1, greentol $1, bluetol $1"
        }
      },
      {
        "box": {
          "comment": "video input 2 (background)",
          "id": "obj-13",
          "maxclass": "inlet",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            571.0,
            10.0,
            25.0,
            25.0
          ]
        }
      },
      {
        "box": {
          "comment": "video input 1 (key)",
          "id": "obj-14",
          "maxclass": "inlet",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            542.0,
            11.0,
            25.0,
            25.0
          ]
        }
      },
      {
        "box": {
          "comment": "",
          "id": "obj-15",
          "maxclass": "inlet",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            15.0,
            8.0,
            25.0,
            25.0
          ]
        }
      },
      {
        "box": {
          "fontname": "Verdana",
          "fontsize": 10.0,
          "id": "obj-16",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            45.0,
            253.0,
            87.0,
            18.0
          ],
          "text": "VIDEO OUTPUT"
        }
      },
      {
        "box": {
          "comment": "",
          "id": "obj-17",
          "maxclass": "outlet",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            15.0,
            253.0,
            25.0,
            25.0
          ]
        }
      },
      {
        "box": {
          "fontname": "Verdana",
          "fontsize": 10.0,
          "id": "obj-18",
          "maxclass": "newobj",
          "numinlets": 3,
          "numoutlets": 2,
          "outlettype": [
            "jit_matrix",
            ""
          ],
          "patching_rect": [
            15.0,
            221.0,
            75.0,
            19.0
          ],
          "text": "jit.keyscreen"
        }
      },
      {
        "box": {
          "fontname": "Verdana",
          "fontsize": 10.0,
          "id": "obj-19",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 9,
          "outlettype": [
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            ""
          ],
          "patching_rect": [
            15.0,
            39.0,
            511.0,
            19.0
          ],
          "text": "j.oscroute /key/red /key/green /key/blue /tolerance /key /target /mask /mode"
        }
      },
      {
        "box": {
          "fontname": "Verdana",
          "fontsize": 10.0,
          "id": "obj-1009",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            15.0,
            439.0,
            57.0,
            18.0
          ],
          "text": "j.out"
        }
      },
      {
        "box": {
          "fontname": "Verdana",
          "fontsize": 10.0,
          "id": "obj-1010",
          "maxclass": "newobj",
          "numinlets": 3,
          "numoutlets": 5,
          "outlettype": [
            "",
            "",
            "",
            "",
            ""
          ],
          "patching_rect": [
            45.0,
            376.0,
            139.0,
            18.0
          ],
          "text": "j.in 3"
        }
      },
      {
        "box": {
          "fontname": "Verdana",
          "fontsize": 10.0,
          "id": "obj-1017",
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
            482.0,
            609.0,
            332.0,
            30.0
          ],
          "text": "j.parameter key/blue @repetitions/filter 1 @type decimal @range/bounds 0. 1. @description \"blue level of the chromakey\"",
          "varname": "key/blue"
        }
      },
      {
        "box": {
          "fontname": "Verdana",
          "fontsize": 10.0,
          "id": "obj-1019",
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
            482.0,
            531.0,
            339.0,
            30.0
          ],
          "text": "j.parameter key/green @repetitions/filter 1 @type decimal @range/bounds 0. 1. @description \"green level of the chromakey\"",
          "varname": "key/green"
        }
      },
      {
        "box": {
          "fontname": "Verdana",
          "fontsize": 10.0,
          "id": "obj-1021",
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
            482.0,
            450.0,
            327.0,
            30.0
          ],
          "text": "j.parameter key/red @repetitions/filter 1 @type decimal @range/bounds 0. 1. @description \"red level of the chromakey\"",
          "varname": "key/red"
        }
      },
      {
        "box": {
          "fontname": "Verdana",
          "fontsize": 10.0,
          "id": "obj-1041",
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
            482.0,
            374.0,
            312.0,
            30.0
          ],
          "text": "j.parameter mode @repetitions/filter 1 @type boolean @range/bounds 0 1 @description \"keying mode\"",
          "varname": "mode"
        }
      },
      {
        "box": {
          "fontname": "Verdana",
          "fontsize": 10.0,
          "id": "obj-1043",
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
            482.0,
            307.0,
            388.0,
            30.0
          ],
          "text": "j.parameter mask @repetitions/filter 1 @type integer @range/bounds 1 3 @range/clipmode both @description \"input used as mask\"",
          "varname": "mask[1]"
        }
      },
      {
        "box": {
          "fontname": "Verdana",
          "fontsize": 10.0,
          "id": "obj-1045",
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
            482.0,
            238.0,
            391.0,
            30.0
          ],
          "text": "j.parameter target @repetitions/filter 1 @type integer @range/bounds 1 3 @range/clipmode both @description \"input used as target\"",
          "varname": "target[1]"
        }
      },
      {
        "box": {
          "fontname": "Verdana",
          "fontsize": 10.0,
          "id": "obj-1047",
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
            483.0,
            149.0,
            253.0,
            42.0
          ],
          "text": "j.parameter key @repetitions/filter 1 @type integer @range/bounds 1 3 @range/clipmode both @description \"input used as key\"",
          "varname": "key[1]"
        }
      },
      {
        "box": {
          "fontname": "Verdana",
          "fontsize": 10.0,
          "id": "obj-1054",
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
            483.0,
            81.0,
            416.0,
            30.0
          ],
          "text": "j.parameter tolerance @repetitions/filter 1 @type decimal @range/bounds 0. 1. @range/clipmode both @description \"Tolerance of the chromakey\"",
          "varname": "tolerance"
        }
      }
    ],
    "lines": [
      {
        "patchline": {
          "destination": [
            "obj-4",
            0
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-19",
            7
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-1",
            0
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-19",
            6
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-5",
            0
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-1",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-2",
            0
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-19",
            5
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-6",
            0
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-2",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-7",
            0
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-3",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-3",
            0
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-19",
            4
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-12",
            0
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-19",
            3
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-18",
            2
          ],
          "hidden": 0,
          "midpoints": [
            612.5,
            214.5,
            80.5,
            214.5
          ],
          "source": [
            "obj-11",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-8",
            0
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-19",
            2
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-18",
            1
          ],
          "hidden": 0,
          "midpoints": [
            580.5,
            197.5,
            52.5,
            197.5
          ],
          "source": [
            "obj-13",
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
            "obj-19",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-17",
            0
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-18",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-18",
            0
          ],
          "hidden": 0,
          "midpoints": [
            551.5,
            174.0,
            24.5,
            174.0
          ],
          "source": [
            "obj-14",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-18",
            0
          ],
          "hidden": 0,
          "midpoints": [
            195.5,
            133.0,
            24.5,
            133.0
          ],
          "source": [
            "obj-12",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-18",
            0
          ],
          "hidden": 0,
          "midpoints": [
            24.5,
            131.0,
            24.5,
            131.0
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
            "obj-18",
            0
          ],
          "hidden": 0,
          "midpoints": [
            86.5,
            133.0,
            24.5,
            133.0
          ],
          "source": [
            "obj-9",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-18",
            0
          ],
          "hidden": 0,
          "midpoints": [
            147.5,
            130.0,
            24.5,
            130.0
          ],
          "source": [
            "obj-8",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-18",
            0
          ],
          "hidden": 0,
          "midpoints": [
            270.5,
            157.0,
            24.5,
            157.0
          ],
          "source": [
            "obj-7",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-18",
            0
          ],
          "hidden": 0,
          "midpoints": [
            332.5,
            157.0,
            24.5,
            157.0
          ],
          "source": [
            "obj-6",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-18",
            0
          ],
          "hidden": 0,
          "midpoints": [
            393.5,
            157.0,
            24.5,
            157.0
          ],
          "source": [
            "obj-5",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-18",
            0
          ],
          "hidden": 0,
          "midpoints": [
            455.5,
            157.0,
            24.5,
            157.0
          ],
          "source": [
            "obj-4",
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
            "obj-15",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-10",
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
      }
    ]
  }
}