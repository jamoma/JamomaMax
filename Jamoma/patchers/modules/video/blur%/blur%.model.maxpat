{
  "patcher": {
    "fileversion": 1,
    "rect": [
      33.0,
      98.0,
      398.0,
      308.0
    ],
    "bglocked": 0,
    "defrect": [
      33.0,
      98.0,
      398.0,
      308.0
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
          "numinlets": 1,
          "numoutlets": 4,
          "outlettype": [
            "",
            "",
            "",
            ""
          ],
          "patching_rect": [
            191.0,
            71.0,
            166.0,
            19.0
          ],
          "text": "j.pass /center /ring /ripple"
        }
      },
      {
        "box": {
          "fontname": "Verdana",
          "fontsize": 10.0,
          "id": "obj-2",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 3,
          "outlettype": [
            "",
            "",
            ""
          ],
          "patching_rect": [
            13.0,
            71.0,
            175.0,
            19.0
          ],
          "text": "j.oscroute /genframe /direct"
        }
      },
      {
        "box": {
          "comment": "",
          "id": "obj-3",
          "maxclass": "inlet",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            363.0,
            38.0,
            25.0,
            25.0
          ]
        }
      },
      {
        "box": {
          "comment": "",
          "id": "obj-4",
          "maxclass": "inlet",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            13.0,
            38.0,
            25.0,
            25.0
          ]
        }
      },
      {
        "box": {
          "fontname": "Verdana",
          "fontsize": 10.0,
          "id": "obj-5",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            42.0,
            224.0,
            89.0,
            19.0
          ],
          "text": "VIDEO OUTPUT"
        }
      },
      {
        "box": {
          "comment": "",
          "id": "obj-6",
          "maxclass": "outlet",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            13.0,
            224.0,
            25.0,
            25.0
          ]
        }
      },
      {
        "box": {
          "fontname": "Verdana",
          "fontsize": 10.0,
          "id": "obj-7",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "jit_matrix",
            ""
          ],
          "patching_rect": [
            13.0,
            192.0,
            116.0,
            19.0
          ],
          "text": "jit.fastblur @range 3"
        }
      },
      {
        "box": {
          "fontname": "Verdana",
          "fontsize": 10.0,
          "id": "obj-1004",
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
            487.0,
            61.0,
            461.0,
            31.0
          ],
          "text": "j.parameter center @type decimal @ramp/drive Max @range/clipmode none @range/bounds 0. 1. @description \"Weight of center cell\"",
          "varname": "center"
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
            117.0,
            316.0,
            56.0,
            19.0
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
          "numinlets": 1,
          "numoutlets": 3,
          "outlettype": [
            "",
            "",
            ""
          ],
          "patching_rect": [
            117.0,
            255.0,
            59.0,
            19.0
          ],
          "text": "j.in 1"
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
            487.0,
            219.0,
            457.0,
            31.0
          ],
          "text": "j.parameter ripple @type decimal @ramp/drive Max @range/clipmode none @range/bounds -1. 1. @description \"Scaling applied to outer ringing cells\"",
          "varname": "ripple"
        }
      },
      {
        "box": {
          "fontname": "Verdana",
          "fontsize": 10.0,
          "id": "obj-1022",
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
            487.0,
            140.0,
            448.0,
            31.0
          ],
          "text": "j.parameter ring @type decimal @ramp/drive Max @range/clipmode none @range/bounds 0. 1. @description \"Weight of cells adjoining the center\"",
          "varname": "ring"
        }
      }
    ],
    "lines": [
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
            "obj-4",
            0
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
            178.5,
            98.0,
            188.0,
            98.0,
            188.0,
            61.0,
            200.5,
            61.0
          ],
          "source": [
            "obj-2",
            2
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
            "obj-7",
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
            372.5,
            161.0,
            22.5,
            161.0
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
            "obj-7",
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
            100.5,
            105.0,
            22.5,
            105.0
          ],
          "source": [
            "obj-2",
            1
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
            249.5,
            140.0,
            22.5,
            140.0
          ],
          "source": [
            "obj-1",
            1
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
            200.5,
            140.0,
            22.5,
            140.0
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
            "obj-7",
            0
          ],
          "hidden": 0,
          "midpoints": [
            298.5,
            140.0,
            22.5,
            140.0
          ],
          "source": [
            "obj-1",
            2
          ]
        }
      }
    ]
  }
}