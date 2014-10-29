{
  "patcher": {
    "fileversion": 1,
    "appversion": {
      "major": 6,
      "minor": 0,
      "revision": 4
    },
    "rect": [
      502.0,
      69.0,
      640.0,
      506.0
    ],
    "bglocked": 0,
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
    "statusbarvisible": 2,
    "toolbarvisible": 1,
    "boxanimatetime": 200,
    "imprint": 0,
    "enablehscroll": 1,
    "enablevscroll": 1,
    "devicewidth": 0.0,
    "description": "",
    "digest": "",
    "tags": "",
    "boxes": [
      {
        "box": {
          "annotation": "gain for controlling the effect of the recursive bandpass sidechain",
          "fontsize": 9.0,
          "id": "obj-18",
          "maxclass": "j.textslider",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            275.0,
            92.0,
            128.0,
            21.0
          ],
          "presentation": 1,
          "presentation_rect": [
            149.0,
            3.0,
            95.0,
            14.0
          ],
          "range": [
            -10.0,
            3.0
          ],
          "text": "sidechain",
          "textpos": [
            10.0,
            2.0
          ],
          "unit": "dB"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-14",
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
            415.0,
            82.0,
            588.0,
            43.0
          ],
          "text": "j.remote sidechain"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-1",
          "maxclass": "newobj",
          "numinlets": 3,
          "numoutlets": 2,
          "outlettype": [
            "signal",
            "signal"
          ],
          "patching_rect": [
            78.0,
            269.0,
            80.0,
            19.0
          ],
          "text": "jalg.sur.race~"
        }
      },
      {
        "box": {
          "annotation": "Mid High X-over Frequency",
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-10",
          "maxclass": "number",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "int",
            "bang"
          ],
          "parameter_enable": 0,
          "patching_rect": [
            321.0,
            166.0,
            50.0,
            19.0
          ],
          "presentation": 1,
          "presentation_rect": [
            263.0,
            46.0,
            36.0,
            19.0
          ],
          "triangle": 0
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "frozen_object_attributes": {
            "range": [
              5.0,
              20000.0
            ],
            "dataspace": "time",
            "clipmode": "both",
            "unit": "Hz",
            "default": [
              5000
            ],
            "type": "integer",
            "description": "Mid-high crossover frequency"
          },
          "id": "obj-11",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 3,
          "outlettype": [
            "",
            "",
            ""
          ],
          "patching_rect": [
            375.0,
            166.0,
            136.0,
            19.0
          ],
          "text": "j.remote midHigh"
        }
      },
      {
        "box": {
          "comment": "",
          "hidden": 1,
          "id": "obj-12",
          "maxclass": "inlet",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            165.0,
            196.0,
            20.0,
            20.0
          ]
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "frozen_object_attributes": {
            "stepsize": 0.01,
            "range": [
              0.0,
              1.0
            ],
            "dataspace": "time",
            "clipmode": "low",
            "default": [
              0.07
            ],
            "type": "decimal",
            "description": "delaytime for the crosstalk cancelling [µseconds]"
          },
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
            379.0,
            194.0,
            121.0,
            19.0
          ],
          "text": "j.remote delay"
        }
      },
      {
        "box": {
          "annotation": "delaytime for the crosstalk cancelling [µseconds]",
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-15",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "parameter_enable": 0,
          "patching_rect": [
            321.0,
            193.0,
            50.0,
            19.0
          ],
          "presentation": 1,
          "presentation_rect": [
            81.0,
            24.0,
            50.0,
            19.0
          ],
          "triangle": 0
        }
      },
      {
        "box": {
          "annotation": "attenation value for the crosstalk frequency",
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-16",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "parameter_enable": 0,
          "patching_rect": [
            322.0,
            221.0,
            50.0,
            19.0
          ],
          "presentation": 1,
          "presentation_rect": [
            95.0,
            45.0,
            36.0,
            19.0
          ],
          "triangle": 0
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "frozen_object_attributes": {
            "range": [
              -10.0,
              0.0
            ],
            "ramp/drive": "none",
            "clipmode": "both",
            "default": [
              -2.5
            ],
            "type": "decimal",
            "description": "attenation value for the crosstalk frequency"
          },
          "id": "obj-17",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 3,
          "outlettype": [
            "",
            "",
            ""
          ],
          "patching_rect": [
            380.0,
            222.0,
            146.0,
            19.0
          ],
          "text": "j.remote attenation"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "hidden": 1,
          "id": "obj-19",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            60.0,
            135.0,
            139.0,
            17.0
          ],
          "text": "/documentation/generate"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-2",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 3,
          "outlettype": [
            "signal",
            "signal",
            ""
          ],
          "patching_rect": [
            78.0,
            312.0,
            88.0,
            19.0
          ],
          "text": "j.out~ 2"
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
          "id": "obj-20",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            308.0,
            285.0,
            131.0,
            19.0
          ],
          "presentation": 1,
          "presentation_rect": [
            148.0,
            23.0,
            111.0,
            19.0
          ],
          "text": "low-mid xover  [Hz]"
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
          "id": "obj-21",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            308.0,
            310.0,
            135.0,
            19.0
          ],
          "presentation": 1,
          "presentation_rect": [
            148.0,
            46.0,
            112.0,
            19.0
          ],
          "text": "mid-high xover [Hz]"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "hidden": 1,
          "id": "obj-22",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            25.0,
            165.0,
            233.0,
            19.0
          ],
          "text": "j.model @description \"Ambiphonics RACE\"",
          "varname": "jmod.hub"
        }
      },
      {
        "box": {
          "comment": "",
          "hidden": 1,
          "id": "obj-24",
          "maxclass": "inlet",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            25.0,
            125.0,
            20.0,
            20.0
          ]
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "hidden": 1,
          "id": "obj-25",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            205.0,
            135.0,
            34.0,
            17.0
          ],
          "text": "/init"
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
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            308.0,
            336.0,
            67.0,
            19.0
          ],
          "presentation": 1,
          "presentation_rect": [
            9.0,
            22.0,
            67.0,
            19.0
          ],
          "text": "delay [µs]"
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
          "id": "obj-27",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            308.0,
            360.0,
            98.0,
            19.0
          ],
          "presentation": 1,
          "presentation_rect": [
            1.0,
            45.0,
            98.0,
            19.0
          ],
          "text": "attenuation [dB]"
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
          "id": "obj-28",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            52.0,
            117.0,
            196.0,
            17.0
          ],
          "text": "/preset/store 1 default, /preset/write"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-3",
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
            116.0,
            225.0,
            68.0,
            19.0
          ],
          "text": "j.in~ 2"
        }
      },
      {
        "box": {
          "comment": "",
          "hidden": 1,
          "id": "obj-33",
          "maxclass": "outlet",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            25.0,
            195.0,
            20.0,
            20.0
          ]
        }
      },
      {
        "box": {
          "background": 1,
          "has_bypass": 1,
          "has_gain": 1,
          "has_mute": 1,
          "id": "obj-4",
          "maxclass": "j.ui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "presentation": 1,
          "presentation_rect": [
            0.0,
            0.0,
            300.0,
            70.0
          ],
          "text": "/editing_this_module"
        }
      },
      {
        "box": {
          "comment": "",
          "hidden": 1,
          "id": "obj-5",
          "maxclass": "outlet",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            113.0,
            350.0,
            20.0,
            20.0
          ]
        }
      },
      {
        "box": {
          "comment": "",
          "hidden": 1,
          "id": "obj-6",
          "maxclass": "outlet",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            78.0,
            350.0,
            20.0,
            20.0
          ]
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "frozen_object_attributes": {
            "range": [
              5.0,
              16000.0
            ],
            "dataspace": "time",
            "clipmode": "both",
            "unit": "Hz",
            "default": [
              250
            ],
            "type": "integer",
            "description": "Low-Mid crossover frequency"
          },
          "id": "obj-7",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 3,
          "outlettype": [
            "",
            "",
            ""
          ],
          "patching_rect": [
            375.0,
            140.0,
            129.0,
            19.0
          ],
          "text": "j.remote lowMid"
        }
      },
      {
        "box": {
          "comment": "",
          "hidden": 1,
          "id": "obj-8",
          "maxclass": "inlet",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            116.0,
            196.0,
            20.0,
            20.0
          ]
        }
      },
      {
        "box": {
          "annotation": "",
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-9",
          "maxclass": "number",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "int",
            "bang"
          ],
          "parameter_enable": 0,
          "patching_rect": [
            321.0,
            140.0,
            50.0,
            19.0
          ],
          "presentation": 1,
          "presentation_rect": [
            263.0,
            23.0,
            36.0,
            19.0
          ],
          "triangle": 0
        }
      }
    ],
    "lines": [
      {
        "patchline": {
          "destination": [
            "obj-2",
            1
          ],
          "disabled": 0,
          "hidden": 0,
          "source": [
            "obj-1",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-2",
            0
          ],
          "disabled": 0,
          "hidden": 0,
          "source": [
            "obj-1",
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
          "disabled": 0,
          "hidden": 0,
          "source": [
            "obj-10",
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
          "disabled": 0,
          "hidden": 0,
          "source": [
            "obj-11",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-3",
            1
          ],
          "disabled": 0,
          "hidden": 0,
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
          "disabled": 0,
          "hidden": 0,
          "source": [
            "obj-13",
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
          "disabled": 0,
          "hidden": 0,
          "source": [
            "obj-14",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-13",
            0
          ],
          "disabled": 0,
          "hidden": 0,
          "source": [
            "obj-15",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-17",
            0
          ],
          "disabled": 0,
          "hidden": 0,
          "source": [
            "obj-16",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-16",
            0
          ],
          "disabled": 0,
          "hidden": 0,
          "source": [
            "obj-17",
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
          "disabled": 0,
          "hidden": 0,
          "source": [
            "obj-18",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-22",
            0
          ],
          "disabled": 0,
          "hidden": 1,
          "midpoints": [
            69.5,
            157.0,
            34.5,
            157.0
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
            "obj-5",
            0
          ],
          "disabled": 0,
          "hidden": 0,
          "source": [
            "obj-2",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-6",
            0
          ],
          "disabled": 0,
          "hidden": 0,
          "source": [
            "obj-2",
            0
          ]
        }
      },
      {
        "patchline": {
          "color": [
            1.0,
            0.890196,
            0.090196,
            1.0
          ],
          "destination": [
            "obj-33",
            0
          ],
          "disabled": 0,
          "hidden": 1,
          "source": [
            "obj-22",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-22",
            0
          ],
          "disabled": 0,
          "hidden": 1,
          "source": [
            "obj-24",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-22",
            0
          ],
          "disabled": 0,
          "hidden": 1,
          "midpoints": [
            214.5,
            160.0,
            34.5,
            160.0
          ],
          "source": [
            "obj-25",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-22",
            0
          ],
          "disabled": 0,
          "hidden": 0,
          "source": [
            "obj-28",
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
          "disabled": 0,
          "hidden": 0,
          "source": [
            "obj-3",
            2
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-1",
            2
          ],
          "disabled": 0,
          "hidden": 0,
          "source": [
            "obj-3",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-1",
            1
          ],
          "disabled": 0,
          "hidden": 0,
          "source": [
            "obj-3",
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
          "disabled": 0,
          "hidden": 0,
          "source": [
            "obj-7",
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
          "disabled": 0,
          "hidden": 0,
          "source": [
            "obj-8",
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
          "disabled": 0,
          "hidden": 0,
          "source": [
            "obj-9",
            0
          ]
        }
      }
    ],
    "dependency_cache": [
      {
        "name": "jalg.sur.race~.maxpat",
        "bootpath": "/Users/nilspeters/Documents/gits/Jamoma/Modules/Modular/Max/modules/spatialization/sur.race~",
        "patcherrelativepath": "",
        "type": "JSON",
        "implicit": 1
      },
      {
        "name": "pingpong.poly.maxpat",
        "bootpath": "/Users/nilspeters/Documents/gits/Jamoma/Modules/Modular/Max/modules/spatialization/sur.race~",
        "patcherrelativepath": "",
        "type": "JSON",
        "implicit": 1
      },
      {
        "name": "j.parameter.mxo",
        "type": "iLaX"
      },
      {
        "name": "j.ui.mxo",
        "type": "iLaX"
      },
      {
        "name": "j.in~.mxo",
        "type": "iLaX"
      },
      {
        "name": "j.model.mxo",
        "type": "iLaX"
      },
      {
        "name": "j.out~.mxo",
        "type": "iLaX"
      },
      {
        "name": "j.unit.mxo",
        "type": "iLaX"
      },
      {
        "name": "j.oscroute.mxo",
        "type": "iLaX"
      },
      {
        "name": "j.filter~.mxo",
        "type": "iLaX"
      },
      {
        "name": "j.textslider.mxo",
        "type": "iLaX"
      }
    ]
  }
}