{
  "patcher": {
    "fileversion": 1,
    "rect": [
      183.0,
      98.0,
      786.0,
      498.0
    ],
    "bglocked": 0,
    "defrect": [
      183.0,
      98.0,
      786.0,
      498.0
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
    "enablehscroll": 1,
    "enablevscroll": 1,
    "boxes": [
      {
        "box": {
          "fontname": "Verdana",
          "fontsize": 10.0,
          "id": "obj-4",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            15.0,
            110.0,
            93.0,
            19.0
          ],
          "text": "prepend color 0."
        }
      },
      {
        "box": {
          "fontname": "Verdana",
          "fontsize": 10.0,
          "id": "obj-15",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 5,
          "outlettype": [
            "",
            "",
            "",
            "",
            ""
          ],
          "patching_rect": [
            215.0,
            110.0,
            250.0,
            19.0
          ],
          "text": "j.pass /fade /minkey /maxkey /alphaignore"
        }
      },
      {
        "box": {
          "fontname": "Verdana",
          "fontsize": 10.0,
          "id": "obj-14",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            15.0,
            50.0,
            145.0,
            19.0
          ],
          "text": "j.oscroute /chromakey"
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
            115.0,
            110.0,
            37.0,
            17.0
          ],
          "text": "tol $1"
        }
      },
      {
        "box": {
          "comment": "video input 2 (background)",
          "id": "obj-7",
          "maxclass": "inlet",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            640.0,
            20.0,
            25.0,
            25.0
          ]
        }
      },
      {
        "box": {
          "comment": "video input 1 (key)",
          "id": "obj-8",
          "maxclass": "inlet",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            610.0,
            20.0,
            25.0,
            25.0
          ]
        }
      },
      {
        "box": {
          "comment": "",
          "id": "obj-9",
          "maxclass": "inlet",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            15.0,
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
          "frgb": [
            0.0,
            0.0,
            0.0,
            1.0
          ],
          "id": "obj-10",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            520.0,
            285.0,
            86.0,
            19.0
          ],
          "text": "VIDEO OUTPUT"
        }
      },
      {
        "box": {
          "comment": "",
          "id": "obj-11",
          "maxclass": "outlet",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            455.0,
            290.0,
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
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "jit_matrix",
            ""
          ],
          "patching_rect": [
            455.0,
            265.0,
            78.0,
            19.0
          ],
          "text": "jit.chromakey"
        }
      },
      {
        "box": {
          "fontname": "Verdana",
          "fontsize": 10.0,
          "id": "obj-13",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 3,
          "outlettype": [
            "",
            "",
            ""
          ],
          "patching_rect": [
            15.0,
            80.0,
            215.0,
            19.0
          ],
          "text": "j.oscroute /color /tolerance"
        }
      },
      {
        "box": {
          "fontname": "Verdana",
          "fontsize": 10.0,
          "id": "obj-1005",
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
            620.0,
            485.0,
            471.0,
            31.0
          ],
          "text": "j.parameter chromakey/color @repetitions/allow 0 @type decimalArray  @dataspace color @dataspace/unit rgb @range/bounds 0. 1. @range/clipmode both @description \"Chroma keying color (RGB in the range 0-1).\"",
          "varname": "key/blue[1]"
        }
      },
      {
        "box": {
          "fontname": "Verdana",
          "fontsize": 10.0,
          "id": "obj-1007",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            140.0,
            525.0,
            53.0,
            19.0
          ],
          "text": "j.out"
        }
      },
      {
        "box": {
          "fontname": "Verdana",
          "fontsize": 10.0,
          "id": "obj-1011",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 4,
          "outlettype": [
            "",
            "",
            "",
            ""
          ],
          "patching_rect": [
            190.0,
            450.0,
            59.5,
            19.0
          ],
          "text": "j.in 2"
        }
      },
      {
        "box": {
          "fontname": "Verdana",
          "fontsize": 10.0,
          "id": "obj-1040",
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
            566.0,
            357.0,
            400.0,
            31.0
          ],
          "text": "j.parameter chromakey/alphaignore @repetitions/allow 0 @type boolean @range/bounds 0. 1. @description \"alpha of the chromakey\"",
          "varname": "alpha"
        }
      },
      {
        "box": {
          "fontname": "Verdana",
          "fontsize": 10.0,
          "id": "obj-1042",
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
            566.0,
            290.0,
            394.0,
            31.0
          ],
          "text": "j.parameter chromakey/maxkey @repetitions/allow 0 @type decimal @range/bounds 0. 10. @description \"maxkey of the chromakey\"",
          "varname": "maxkey[1]"
        }
      },
      {
        "box": {
          "fontname": "Verdana",
          "fontsize": 10.0,
          "id": "obj-1044",
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
            566.0,
            221.0,
            394.0,
            31.0
          ],
          "text": "j.parameter chromakey/minkey @repetitions/allow 0 @type decimal @range/bounds 0. 10. @description \"minkey of the chromakey\"",
          "varname": "minkey[1]"
        }
      },
      {
        "box": {
          "fontname": "Verdana",
          "fontsize": 10.0,
          "id": "obj-1046",
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
            566.0,
            152.0,
            394.0,
            31.0
          ],
          "text": "j.parameter chromakey/fade @repetitions/allow 0 @type decimal @range/bounds 0. 10. @description \"fade of the chromakey\"",
          "varname": "fade[1]"
        }
      },
      {
        "box": {
          "fontname": "Verdana",
          "fontsize": 10.0,
          "id": "obj-1052",
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
            566.0,
            84.0,
            394.0,
            31.0
          ],
          "text": "j.parameter chromakey/tolerance @repetitions/allow 0 @type decimal @range/bounds 0. 1. @description \"Tolerance of the chromakey\"",
          "varname": "tolerance"
        }
      }
    ],
    "lines": [
      {
        "patchline": {
          "destination": [
            "obj-11",
            0
          ],
          "hidden": 0,
          "midpoints": [

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
            "obj-15",
            0
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-13",
            2
          ]
        }
      },
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
            "obj-13",
            0
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
            "obj-13",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-13",
            0
          ],
          "hidden": 0,
          "midpoints": [

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
            "obj-12",
            0
          ],
          "hidden": 0,
          "midpoints": [
            397.75,
            181.0,
            464.5,
            181.0
          ],
          "source": [
            "obj-15",
            3
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
            340.0,
            187.0,
            464.5,
            187.0
          ],
          "source": [
            "obj-15",
            2
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
            282.25,
            193.0,
            464.5,
            193.0
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
            "obj-12",
            0
          ],
          "hidden": 0,
          "midpoints": [
            224.5,
            200.0,
            464.5,
            200.0
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
            "obj-12",
            0
          ],
          "hidden": 0,
          "midpoints": [
            24.5,
            222.0,
            464.5,
            222.0
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
            "obj-12",
            0
          ],
          "hidden": 0,
          "midpoints": [
            124.5,
            217.0,
            464.5,
            217.0
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
            "obj-12",
            1
          ],
          "hidden": 0,
          "midpoints": [
            649.5,
            253.0,
            523.5,
            253.0
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
            "obj-12",
            0
          ],
          "hidden": 0,
          "midpoints": [
            619.5,
            245.0,
            464.5,
            245.0
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
            "obj-14",
            0
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-9",
            0
          ]
        }
      }
    ]
  }
}