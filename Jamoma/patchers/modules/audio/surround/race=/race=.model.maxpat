{
  "patcher": {
    "fileversion": 1,
    "rect": [
      59.0,
      53.0,
      945.0,
      551.0
    ],
    "bglocked": 0,
    "defrect": [
      59.0,
      53.0,
      945.0,
      551.0
    ],
    "openrect": [
      0.0,
      0.0,
      0.0,
      0.0
    ],
    "openinpresentation": 0,
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
          "id": "obj-9",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "signal",
            "signal"
          ],
          "patching_rect": [
            430.0,
            314.0,
            191.0,
            19.0
          ],
          "text": "poly~ pingpong.poly 1 vs 2"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-6",
          "linecount": 3,
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            293.0,
            174.0,
            140.0,
            43.0
          ],
          "text": "j.unit @dataspace gain @input db @output linear"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-26",
          "maxclass": "newobj",
          "numinlets": 4,
          "numoutlets": 3,
          "outlettype": [
            "signal",
            "signal",
            ""
          ],
          "patching_rect": [
            429.0,
            225.0,
            234.0,
            19.0
          ],
          "text": "j.filter~ 2 @type lowpass.butterworth.2"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-27",
          "maxclass": "newobj",
          "numinlets": 4,
          "numoutlets": 3,
          "outlettype": [
            "signal",
            "signal",
            ""
          ],
          "patching_rect": [
            429.0,
            262.0,
            238.0,
            19.0
          ],
          "text": "j.filter~ 2 @type highpass.butterworth.2"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-25",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            821.0,
            196.0,
            74.0,
            17.0
          ],
          "text": "frequency $1"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-24",
          "linecount": 2,
          "maxclass": "newobj",
          "numinlets": 4,
          "numoutlets": 3,
          "outlettype": [
            "signal",
            "signal",
            ""
          ],
          "patching_rect": [
            677.0,
            227.0,
            134.0,
            31.0
          ],
          "text": "j.filter~ 2 @type lowpass.butterworth.2"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-11",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            690.0,
            194.0,
            74.0,
            17.0
          ],
          "text": "frequency $1"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-8",
          "linecount": 2,
          "maxclass": "newobj",
          "numinlets": 4,
          "numoutlets": 3,
          "outlettype": [
            "signal",
            "signal",
            ""
          ],
          "patching_rect": [
            821.0,
            227.0,
            131.0,
            31.0
          ],
          "text": "j.filter~ 2 @type highpass.butterworth.2"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-10",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            225.0,
            119.0,
            76.0,
            17.0
          ],
          "text": "frequency $1"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-7",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            133.0,
            112.0,
            76.0,
            17.0
          ],
          "text": "frequency $1"
        }
      },
      {
        "box": {
          "bgcolor": [
            0.827451,
            0.737255,
            0.835294,
            1.0
          ],
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-33",
          "maxclass": "flonum",
          "maximum": 20000.0,
          "minimum": 10.0,
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            221.0,
            80.0,
            50.0,
            19.0
          ]
        }
      },
      {
        "box": {
          "bgcolor": [
            0.827451,
            0.737255,
            0.835294,
            1.0
          ],
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-43",
          "maxclass": "flonum",
          "maximum": 10000.0,
          "minimum": 10.0,
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            133.0,
            83.0,
            50.0,
            19.0
          ]
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-49",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            470.0,
            367.0,
            50.0,
            19.0
          ]
        }
      },
      {
        "box": {
          "floatoutput": 1,
          "id": "obj-46",
          "maxclass": "slider",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            470.0,
            343.0,
            136.0,
            20.0
          ],
          "size": 2.0
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-42",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            429.0,
            396.0,
            39.0,
            19.0
          ],
          "text": "*~ 1."
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-35",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            601.0,
            396.0,
            39.0,
            19.0
          ],
          "text": "*~ 1."
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-34",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            106.0,
            263.0,
            50.0,
            19.0
          ]
        }
      },
      {
        "box": {
          "comment": "",
          "id": "obj-1",
          "maxclass": "inlet",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            10.0,
            29.0,
            25.0,
            25.0
          ]
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-12",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "float"
          ],
          "patching_rect": [
            10.0,
            119.0,
            48.0,
            19.0
          ],
          "text": "/ 1000."
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-18",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            21.0,
            144.0,
            50.0,
            19.0
          ]
        }
      },
      {
        "box": {
          "comment": "",
          "id": "obj-2",
          "maxclass": "inlet",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            680.0,
            22.0,
            25.0,
            25.0
          ]
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
            857.0,
            22.0,
            25.0,
            25.0
          ]
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-37",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 6,
          "outlettype": [
            "",
            "",
            "",
            "",
            "",
            ""
          ],
          "patching_rect": [
            9.0,
            57.0,
            374.0,
            19.0
          ],
          "text": "j.oscroute /delay /attenation /lowMid /midHigh /sidechain"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-38",
          "linecount": 4,
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            85.0,
            176.0,
            98.0,
            55.0
          ],
          "text": "j.unit @dataspace gain @input db @output linear"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-39",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "float"
          ],
          "patching_rect": [
            85.0,
            236.0,
            35.0,
            19.0
          ],
          "text": "* -1."
        }
      },
      {
        "box": {
          "comment": "",
          "id": "obj-4",
          "maxclass": "outlet",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            677.0,
            504.0,
            25.0,
            25.0
          ]
        }
      },
      {
        "box": {
          "comment": "",
          "id": "obj-5",
          "maxclass": "outlet",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            877.0,
            503.0,
            25.0,
            25.0
          ]
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-1014",
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
          "text": "j.parameter sidechain @type decimal @range -60. 3. @clipmode both @description \"gain for controlling the effect of the recursive bandpass sidechain\" @dataspace gain @unit dB"
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
          "id": "obj-1011",
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
          "text": "j.parameter midHigh"
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
          "id": "obj-1013",
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
          "text": "j.parameter delay"
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
          "id": "obj-1017",
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
          "text": "j.parameter attenation"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-1002",
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
          "id": "obj-1003",
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
          "id": "obj-1007",
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
          "text": "j.parameter lowMid"
        }
      }
    ],
    "lines": [
      {
        "patchline": {
          "destination": [
            "obj-37",
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
            "obj-26",
            0
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
            "obj-24",
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
            "obj-18",
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
            "obj-9",
            1
          ],
          "hidden": 0,
          "midpoints": [
            19.5,
            308.25,
            611.5,
            308.25
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
            "obj-24",
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
            "obj-26",
            0
          ],
          "hidden": 0,
          "midpoints": [
            689.5,
            67.5,
            438.5,
            67.5
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
            "obj-8",
            0
          ],
          "hidden": 0,
          "midpoints": [
            689.5,
            136.5,
            830.5,
            136.5
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
            "obj-4",
            0
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-24",
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
          "hidden": 0,
          "midpoints": [
            744.0,
            307.0,
            886.5,
            307.0
          ],
          "source": [
            "obj-24",
            1
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
            "obj-25",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-27",
            1
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-26",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-27",
            0
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-26",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-9",
            1
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-27",
            1
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
            "obj-27",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-24",
            1
          ],
          "hidden": 0,
          "midpoints": [
            866.5,
            78.5,
            724.833313,
            78.5
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
            "obj-26",
            1
          ],
          "hidden": 0,
          "midpoints": [
            866.5,
            78.0,
            510.166656,
            78.0
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
            "obj-8",
            1
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
            "obj-10",
            0
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-33",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-25",
            0
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-33",
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
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-35",
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
            "obj-37",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-33",
            0
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-37",
            3
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-38",
            0
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-37",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-43",
            0
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-37",
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
            "obj-37",
            4
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-39",
            0
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-38",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-34",
            0
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-39",
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
            94.5,
            301.75,
            439.5,
            301.75
          ],
          "source": [
            "obj-39",
            0
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
            "obj-42",
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
            "obj-43",
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
            "obj-43",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-49",
            0
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-46",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-35",
            1
          ],
          "hidden": 0,
          "midpoints": [
            479.5,
            390.5,
            630.5,
            390.5
          ],
          "source": [
            "obj-49",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-42",
            1
          ],
          "hidden": 0,
          "midpoints": [
            479.5,
            390.5,
            458.5,
            390.5
          ],
          "source": [
            "obj-49",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-46",
            0
          ],
          "hidden": 0,
          "midpoints": [
            302.5,
            339.5,
            479.5,
            339.5
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
            "obj-27",
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
            "obj-4",
            0
          ],
          "hidden": 0,
          "midpoints": [
            830.5,
            273.5,
            686.5,
            273.5
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
            "obj-5",
            0
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-8",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-35",
            0
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-9",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-42",
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