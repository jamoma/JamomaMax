{
  "patcher": {
    "rect": [
      116.0,
      66.0,
      428.0,
      348.0
    ],
    "bglocked": 0,
    "defrect": [
      116.0,
      66.0,
      428.0,
      348.0
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
    "boxfadetime": 200,
    "boxanimatetime": 200,
    "scrollanimatetime": 200,
    "metadata": [

    ],
    "boxes": [
      {
        "box": {
          "maxclass": "newobj",
          "text": "j.oscroute /red /green /blue",
          "linecount": 2,
          "numinlets": 1,
          "patching_rect": [
            146.0,
            89.0,
            79.0,
            28.0
          ],
          "numoutlets": 4,
          "fontsize": 10.0,
          "fontname": "Verdana",
          "outlettype": [
            "",
            "",
            "",
            ""
          ],
          "id": "obj-1"
        }
      },
      {
        "box": {
          "maxclass": "newobj",
          "text": "j.oscroute /red /green /blue",
          "linecount": 2,
          "numinlets": 1,
          "patching_rect": [
            54.0,
            89.0,
            79.0,
            28.0
          ],
          "numoutlets": 4,
          "fontsize": 10.0,
          "fontname": "Verdana",
          "outlettype": [
            "",
            "",
            "",
            ""
          ],
          "id": "obj-2"
        }
      },
      {
        "box": {
          "maxclass": "newobj",
          "text": "j.oscroute /mask /tint /direct",
          "numinlets": 1,
          "patching_rect": [
            54.0,
            61.0,
            286.0,
            17.0
          ],
          "numoutlets": 4,
          "fontsize": 10.0,
          "fontname": "Verdana",
          "outlettype": [
            "",
            "",
            "",
            ""
          ],
          "id": "obj-3"
        }
      },
      {
        "box": {
          "maxclass": "newobj",
          "text": "pak mask 0 0 0 0",
          "numinlets": 5,
          "patching_rect": [
            18.0,
            140.0,
            85.0,
            17.0
          ],
          "numoutlets": 1,
          "fontsize": 10.0,
          "fontname": "Verdana",
          "outlettype": [
            ""
          ],
          "id": "obj-4"
        }
      },
      {
        "box": {
          "maxclass": "message",
          "text": "gtint $1",
          "numinlets": 2,
          "patching_rect": [
            175.0,
            141.0,
            44.0,
            15.0
          ],
          "numoutlets": 1,
          "fontsize": 10.0,
          "fontname": "Verdana",
          "outlettype": [
            ""
          ],
          "id": "obj-5"
        }
      },
      {
        "box": {
          "maxclass": "message",
          "text": "rtint $1",
          "numinlets": 2,
          "patching_rect": [
            130.0,
            141.0,
            44.0,
            15.0
          ],
          "numoutlets": 1,
          "fontsize": 10.0,
          "fontname": "Verdana",
          "outlettype": [
            ""
          ],
          "id": "obj-6"
        }
      },
      {
        "box": {
          "maxclass": "message",
          "text": "btint $1",
          "numinlets": 2,
          "patching_rect": [
            220.0,
            141.0,
            45.0,
            15.0
          ],
          "numoutlets": 1,
          "fontsize": 10.0,
          "fontname": "Verdana",
          "outlettype": [
            ""
          ],
          "id": "obj-7"
        }
      },
      {
        "box": {
          "maxclass": "inlet",
          "numinlets": 0,
          "patching_rect": [
            353.0,
            38.0,
            15.0,
            15.0
          ],
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "id": "obj-8",
          "comment": ""
        }
      },
      {
        "box": {
          "maxclass": "inlet",
          "numinlets": 0,
          "patching_rect": [
            54.0,
            35.0,
            15.0,
            15.0
          ],
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "id": "obj-9",
          "comment": ""
        }
      },
      {
        "box": {
          "maxclass": "comment",
          "text": "VIDEO OUTPUT",
          "numinlets": 1,
          "patching_rect": [
            33.0,
            268.0,
            77.0,
            17.0
          ],
          "numoutlets": 0,
          "fontsize": 10.0,
          "fontname": "Verdana",
          "id": "obj-10"
        }
      },
      {
        "box": {
          "maxclass": "outlet",
          "numinlets": 1,
          "patching_rect": [
            18.0,
            268.0,
            15.0,
            15.0
          ],
          "numoutlets": 0,
          "id": "obj-11",
          "comment": ""
        }
      },
      {
        "box": {
          "maxclass": "newobj",
          "text": "jit.brass",
          "numinlets": 1,
          "patching_rect": [
            18.0,
            246.0,
            48.0,
            17.0
          ],
          "numoutlets": 2,
          "fontsize": 10.0,
          "fontname": "Verdana",
          "outlettype": [
            "jit_matrix",
            ""
          ],
          "id": "obj-12"
        }
      },
      {
        "box": {
          "fontname": "Verdana",
          "fontsize": 10.0,
          "id": "obj-1001",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            385.0,
            234.0,
            63.0,
            19.0
          ],
          "text": "j.out 1"
        }
      },
      {
        "box": {
          "fontname": "Verdana",
          "fontsize": 10.0,
          "id": "obj-1004",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 3,
          "outlettype": [
            "",
            "",
            ""
          ],
          "patching_rect": [
            385.0,
            159.0,
            78.0,
            19.0
          ],
          "text": "j.in 1"
        }
      },
      {
        "box": {
          "fontname": "Verdana",
          "fontsize": 10.0,
          "id": "obj-1007",
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
            700.0,
            341.0,
            347.0,
            31.0
          ],
          "text": "j.parameter mask/blue @type decimal @ramp/drive Max @description \"Sets the masking for the blue component.\"",
          "varname": "mask/blue"
        }
      },
      {
        "box": {
          "fontname": "Verdana",
          "fontsize": 10.0,
          "id": "obj-1010",
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
            700.0,
            385.0,
            338.0,
            31.0
          ],
          "text": "j.parameter tint/blue @type decimal @ramp/drive Max @description \"Sets the tinting of the blue component.\"",
          "varname": "tint/blue"
        }
      },
      {
        "box": {
          "fontname": "Verdana",
          "fontsize": 10.0,
          "id": "obj-1015",
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
            700.0,
            152.0,
            343.0,
            31.0
          ],
          "text": "j.parameter mask/red @type decimal @ramp/drive Max @description \"Sets the masking for the red component.\"",
          "varname": "mask/red"
        }
      },
      {
        "box": {
          "fontname": "Verdana",
          "fontsize": 10.0,
          "id": "obj-1016",
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
            700.0,
            241.0,
            355.0,
            31.0
          ],
          "text": "j.parameter mask/green @type decimal @ramp/drive Max @description \"Sets the masking for the green component.\"",
          "varname": "mask/green"
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
            700.0,
            194.0,
            333.0,
            31.0
          ],
          "text": "j.parameter tint/red @type decimal @ramp/drive Max @description \"Sets the tinting of the red component.\"",
          "varname": "tint/red"
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
            700.0,
            287.0,
            345.0,
            31.0
          ],
          "text": "j.parameter tint/green @type decimal @ramp/drive Max @description \"Sets the tinting of the green component.\"",
          "varname": "tint/green"
        }
      }
    ],
    "lines": [
      {
        "patchline": {
          "source": [
            "obj-8",
            0
          ],
          "destination": [
            "obj-12",
            0
          ],
          "hidden": 0,
          "midpoints": [
            362.0,
            237.0,
            27.5,
            237.0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-4",
            0
          ],
          "destination": [
            "obj-12",
            0
          ],
          "hidden": 0
        }
      },
      {
        "patchline": {
          "source": [
            "obj-6",
            0
          ],
          "destination": [
            "obj-12",
            0
          ],
          "hidden": 0,
          "midpoints": [
            139.5,
            164.0,
            27.5,
            164.0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-5",
            0
          ],
          "destination": [
            "obj-12",
            0
          ],
          "hidden": 0,
          "midpoints": [
            184.5,
            166.0,
            27.5,
            166.0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-7",
            0
          ],
          "destination": [
            "obj-12",
            0
          ],
          "hidden": 0,
          "midpoints": [
            229.5,
            168.0,
            27.5,
            168.0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-3",
            2
          ],
          "destination": [
            "obj-12",
            0
          ],
          "hidden": 0,
          "midpoints": [
            241.5,
            233.0,
            27.5,
            233.0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-12",
            0
          ],
          "destination": [
            "obj-11",
            0
          ],
          "hidden": 0
        }
      },
      {
        "patchline": {
          "source": [
            "obj-9",
            0
          ],
          "destination": [
            "obj-3",
            0
          ],
          "hidden": 0
        }
      },
      {
        "patchline": {
          "source": [
            "obj-3",
            0
          ],
          "destination": [
            "obj-2",
            0
          ],
          "hidden": 0
        }
      },
      {
        "patchline": {
          "source": [
            "obj-2",
            0
          ],
          "destination": [
            "obj-4",
            2
          ],
          "hidden": 0
        }
      },
      {
        "patchline": {
          "source": [
            "obj-2",
            1
          ],
          "destination": [
            "obj-4",
            3
          ],
          "hidden": 0
        }
      },
      {
        "patchline": {
          "source": [
            "obj-2",
            2
          ],
          "destination": [
            "obj-4",
            4
          ],
          "hidden": 0
        }
      },
      {
        "patchline": {
          "source": [
            "obj-1",
            0
          ],
          "destination": [
            "obj-6",
            0
          ],
          "hidden": 0
        }
      },
      {
        "patchline": {
          "source": [
            "obj-3",
            1
          ],
          "destination": [
            "obj-1",
            0
          ],
          "hidden": 0
        }
      },
      {
        "patchline": {
          "source": [
            "obj-1",
            1
          ],
          "destination": [
            "obj-5",
            0
          ],
          "hidden": 0
        }
      },
      {
        "patchline": {
          "source": [
            "obj-1",
            2
          ],
          "destination": [
            "obj-7",
            0
          ],
          "hidden": 0
        }
      }
    ]
  }
}