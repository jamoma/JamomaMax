{
  "patcher": {
    "fileversion": 1,
    "rect": [
      103.0,
      144.0,
      593.0,
      390.0
    ],
    "bglocked": 0,
    "defrect": [
      103.0,
      144.0,
      593.0,
      390.0
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
    "devicewidth": 0.0,
    "boxes": [
      {
        "box": {
          "fontname": "Verdana",
          "fontsize": 10.0,
          "id": "obj-1",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            56.0,
            75.0,
            146.0,
            19.0
          ],
          "text": "osc messages to algorithm"
        }
      },
      {
        "box": {
          "fontname": "Verdana",
          "fontsize": 10.0,
          "id": "obj-2",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            424.0,
            75.0,
            76.0,
            19.0
          ],
          "text": "signal inlet 2"
        }
      },
      {
        "box": {
          "fontname": "Verdana",
          "fontsize": 10.0,
          "id": "obj-3",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            419.0,
            312.0,
            83.0,
            19.0
          ],
          "text": "signal outlet 2"
        }
      },
      {
        "box": {
          "comment": "osc messages to algorithm",
          "id": "obj-4",
          "maxclass": "inlet",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            76.0,
            103.0,
            26.0,
            26.0
          ]
        }
      },
      {
        "box": {
          "comment": "osc messages from algorithm",
          "id": "obj-5",
          "maxclass": "outlet",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            74.0,
            281.0,
            26.0,
            26.0
          ]
        }
      },
      {
        "box": {
          "comment": "signal outlet 2",
          "id": "obj-6",
          "maxclass": "outlet",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            439.0,
            281.0,
            26.0,
            26.0
          ]
        }
      },
      {
        "box": {
          "comment": "signal outlet 1",
          "id": "obj-7",
          "maxclass": "outlet",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            316.0,
            281.0,
            26.0,
            26.0
          ]
        }
      },
      {
        "box": {
          "comment": "signal inlet 2",
          "id": "obj-8",
          "maxclass": "inlet",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            439.0,
            103.0,
            26.0,
            26.0
          ]
        }
      },
      {
        "box": {
          "comment": "signal inlet 1",
          "id": "obj-9",
          "maxclass": "inlet",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            316.0,
            103.0,
            26.0,
            26.0
          ]
        }
      },
      {
        "box": {
          "fontname": "Verdana",
          "fontsize": 10.0,
          "id": "obj-10",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 3,
          "outlettype": [
            "",
            "",
            ""
          ],
          "patching_rect": [
            76.0,
            168.0,
            245.0,
            19.0
          ],
          "text": "j.oscroute /this_parameter /this_message"
        }
      },
      {
        "box": {
          "fontname": "Verdana",
          "fontsize": 10.0,
          "id": "obj-11",
          "maxclass": "newobj",
          "numinlets": 3,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            439.0,
            248.0,
            59.0,
            19.0
          ],
          "text": "degrade~"
        }
      },
      {
        "box": {
          "fontname": "Verdana",
          "fontsize": 10.0,
          "id": "obj-12",
          "maxclass": "newobj",
          "numinlets": 3,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            316.0,
            248.0,
            59.0,
            19.0
          ],
          "text": "degrade~"
        }
      },
      {
        "box": {
          "fontname": "Verdana",
          "fontsize": 10.0,
          "id": "obj-13",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            109.0,
            136.0,
            421.0,
            19.0
          ],
          "text": "[in 1] receives OSC messages. These should be routed to the appropriate places."
        }
      },
      {
        "box": {
          "fontname": "Verdana",
          "fontsize": 10.0,
          "id": "obj-14",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            32.0,
            37.0,
            217.0,
            19.0
          ],
          "text": "This is an algorithm for a stereo module."
        }
      },
      {
        "box": {
          "fontname": "Verdana",
          "fontsize": 10.0,
          "id": "obj-15",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            65.0,
            312.0,
            160.0,
            19.0
          ],
          "text": "osc messages from algorithm"
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
            309.0,
            312.0,
            83.0,
            19.0
          ],
          "text": "signal outlet 1"
        }
      },
      {
        "box": {
          "fontname": "Verdana",
          "fontsize": 10.0,
          "id": "obj-17",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            303.0,
            75.0,
            76.0,
            19.0
          ],
          "text": "signal inlet 1"
        }
      },
      {
        "box": {
          "fontname": "Verdana",
          "fontsize": 10.0,
          "id": "obj-1016",
          "maxclass": "newobj",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            42.0,
            181.0,
            131.0,
            19.0
          ],
          "text": "j.parameterCreate"
        }
      },
      {
        "box": {
          "fontname": "Verdana",
          "fontsize": 10.0,
          "id": "obj-1086",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 3,
          "outlettype": [
            "",
            "",
            ""
          ],
          "patching_rect": [
            639.0,
            350.0,
            523.0,
            19.0
          ],
          "text": "j.parameter a_menu @repetitions/allow 1 @type string @description \"a menu\" @priority 1",
          "varname": "module_in[1]"
        }
      },
      {
        "box": {
          "fontname": "Verdana",
          "fontsize": 10.0,
          "id": "obj-1049",
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
            639.0,
            300.0,
            584.0,
            31.0
          ],
          "text": "j.parameter a_slider @type decimal @range/bounds 0. 1. @range/clipmode none @description \"Document what this parameter does...\"",
          "varname": "hue_angle[2]"
        }
      },
      {
        "box": {
          "fontname": "Verdana",
          "fontsize": 10.0,
          "id": "obj-1047",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 3,
          "outlettype": [
            "",
            "",
            ""
          ],
          "patching_rect": [
            639.0,
            270.0,
            588.0,
            19.0
          ],
          "text": "j.parameter a_toggle @type boolean @description \"Tell me what you are doing I will tell you who you are\"",
          "varname": "saturation/active"
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
            626.0,
            176.0,
            596.0,
            31.0
          ],
          "text": "j.message this_message @type integer @range/bounds 0. 1. @range/clipmode none @description \"Document what this message does...\"",
          "varname": "hue_angle[1]"
        }
      },
      {
        "box": {
          "fontname": "Verdana",
          "fontsize": 10.0,
          "id": "obj-1029",
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
            626.0,
            136.0,
            601.0,
            31.0
          ],
          "text": "j.parameter this_parameter @repetitions/allow 1 @type decimal @range/bounds 0. 1. @range/clipmode none @description \"Document what this parameter does...\"",
          "varname": "hue_angle"
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
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            30.0,
            480.0,
            269.0,
            31.0
          ],
          "text": "j.return return_c @range/bounds 0. 1. @description \"Document what this return does...\""
        }
      },
      {
        "box": {
          "fontname": "Verdana",
          "fontsize": 10.0,
          "id": "obj-1007",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 3,
          "outlettype": [
            "signal",
            "signal",
            ""
          ],
          "patching_rect": [
            90.0,
            410.0,
            79.0,
            19.0
          ],
          "text": "j.out~ 2"
        }
      },
      {
        "box": {
          "fontname": "Verdana",
          "fontsize": 10.0,
          "id": "obj-1008",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 4,
          "outlettype": [
            "signal",
            "signal",
            "",
            ""
          ],
          "patching_rect": [
            90.0,
            335.0,
            151.0,
            19.0
          ],
          "text": "j.in~ 2"
        }
      }
    ],
    "lines": [
      {
        "patchline": {
          "destination": [
            "obj-11",
            2
          ],
          "hidden": 0,
          "midpoints": [
            198.5,
            212.0,
            488.5,
            212.0
          ],
          "source": [
            "obj-10",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-11",
            1
          ],
          "hidden": 0,
          "midpoints": [
            85.5,
            219.0,
            468.5,
            219.0
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
            "obj-12",
            2
          ],
          "hidden": 0,
          "midpoints": [
            198.5,
            212.0,
            365.5,
            212.0
          ],
          "source": [
            "obj-10",
            1
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
            85.5,
            219.0,
            345.5,
            219.0
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
            "obj-6",
            0
          ],
          "hidden": 0,
          "midpoints": [

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
            "obj-7",
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
            "obj-10",
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
            "obj-11",
            0
          ],
          "hidden": 0,
          "midpoints": [

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
            "obj-12",
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