{
  "patcher": {
    "fileversion": 1,
    "rect": [
      129.0,
      385.0,
      696.0,
      308.0
    ],
    "bglocked": 0,
    "defrect": [
      129.0,
      385.0,
      696.0,
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
          "id": "obj-24",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patcher": {
            "fileversion": 1,
            "rect": [
              0.0,
              0.0,
              640.0,
              480.0
            ],
            "bglocked": 0,
            "defrect": [
              0.0,
              0.0,
              640.0,
              480.0
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
              25.0,
              25.0
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
                  "id": "obj-18",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    50.0,
                    145.0,
                    83.0,
                    19.0
                  ],
                  "text": "prepend mode"
                }
              },
              {
                "box": {
                  "fontname": "Verdana",
                  "fontsize": 10.0,
                  "id": "obj-15",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    50.0,
                    100.0,
                    91.0,
                    19.0
                  ],
                  "text": "prepend symbol"
                }
              },
              {
                "box": {
                  "fontname": "Verdana",
                  "fontsize": 10.0,
                  "id": "obj-20",
                  "items": [
                    "wrap",
                    ",",
                    "clip",
                    ",",
                    "bounce"
                  ],
                  "maxclass": "umenu",
                  "numinlets": 1,
                  "numoutlets": 3,
                  "outlettype": [
                    "int",
                    "",
                    ""
                  ],
                  "patching_rect": [
                    50.0,
                    123.0,
                    88.0,
                    19.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    746.0,
                    469.0,
                    88.0,
                    19.0
                  ],
                  "types": [

                  ]
                }
              },
              {
                "box": {
                  "comment": "",
                  "id": "obj-22",
                  "maxclass": "inlet",
                  "numinlets": 0,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    50.0,
                    40.0,
                    25.0,
                    25.0
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
                    50.0,
                    224.0,
                    25.0,
                    25.0
                  ]
                }
              }
            ],
            "lines": [
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
                    "obj-20",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-20",
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
                    "obj-15",
                    0
                  ],
                  "hidden": 0,
                  "midpoints": [

                  ],
                  "source": [
                    "obj-22",
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
                    "obj-18",
                    0
                  ]
                }
              }
            ]
          },
          "patching_rect": [
            355.0,
            106.0,
            48.0,
            19.0
          ],
          "saved_object_attributes": {
            "default_fontname": "Verdana",
            "fontname": "Verdana",
            "default_fontsize": 10.0,
            "globalpatchername": "",
            "fontface": 0,
            "fontsize": 10.0,
            "default_fontface": 0
          },
          "text": "p mode"
        }
      },
      {
        "box": {
          "fontname": "Verdana",
          "fontsize": 10.0,
          "id": "obj-14",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            298.0,
            137.0,
            68.0,
            17.0
          ],
          "text": "y_range $1"
        }
      },
      {
        "box": {
          "fontname": "Verdana",
          "fontsize": 10.0,
          "id": "obj-13",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            242.0,
            106.0,
            68.0,
            17.0
          ],
          "text": "x_range $1"
        }
      },
      {
        "box": {
          "fontname": "Verdana",
          "fontsize": 10.0,
          "id": "obj-12",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            186.0,
            137.0,
            60.0,
            17.0
          ],
          "text": "y_step $1"
        }
      },
      {
        "box": {
          "fontname": "Verdana",
          "fontsize": 10.0,
          "id": "obj-11",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            130.0,
            106.0,
            60.0,
            17.0
          ],
          "text": "x_step $1"
        }
      },
      {
        "box": {
          "fontname": "Verdana",
          "fontsize": 10.0,
          "id": "obj-1",
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
            411.0,
            112.0,
            197.0,
            19.0
          ],
          "text": "j.pass /gang /mode /scale /lo /hi"
        }
      },
      {
        "box": {
          "fontname": "Verdana",
          "fontsize": 10.0,
          "id": "obj-2",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 8,
          "outlettype": [
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
            20.0,
            82.0,
            409.0,
            19.0
          ],
          "text": "j.oscroute /genframe /direct /x/step /y/step /x/range /y/range /colormode"
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
          "id": "obj-3",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            594.0,
            30.0,
            79.0,
            19.0
          ],
          "text": "VIDEO INPUT"
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
            623.0,
            49.0,
            25.0,
            25.0
          ]
        }
      },
      {
        "box": {
          "comment": "",
          "id": "obj-5",
          "maxclass": "inlet",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            17.0,
            45.0,
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
          "id": "obj-6",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            262.0,
            250.0,
            89.0,
            19.0
          ],
          "text": "VIDEO OUTPUT"
        }
      },
      {
        "box": {
          "comment": "",
          "id": "obj-7",
          "maxclass": "outlet",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            232.0,
            250.0,
            25.0,
            25.0
          ]
        }
      },
      {
        "box": {
          "fontname": "Verdana",
          "fontsize": 10.0,
          "id": "obj-8",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "jit_matrix",
            ""
          ],
          "patching_rect": [
            232.0,
            212.0,
            45.0,
            19.0
          ],
          "text": "jit.plur"
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
            51.0,
            391.0,
            54.0,
            19.0
          ],
          "text": "j.out"
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
            51.0,
            330.0,
            57.0,
            19.0
          ],
          "text": "j.in 1"
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
            342.0,
            492.714294,
            570.0,
            31.0
          ],
          "text": "j.parameter colormode @type string @description \"colormode determines how jit.plur handles values that exceed the hi and lo values. wrap | clip | bounce\"",
          "varname": "colormode"
        }
      },
      {
        "box": {
          "fontname": "Verdana",
          "fontsize": 10.0,
          "id": "obj-1006",
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
            342.0,
            423.714294,
            351.0,
            31.0
          ],
          "text": "j.parameter scale @type integer @ramp/drive Max @description \"scale: actually a bit shift before display. normal is 8.\"",
          "varname": "scale"
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
            342.0,
            354.714294,
            678.0,
            31.0
          ],
          "text": "j.parameter mode @type integer @range/bounds 0 15 @range/clipmode both @ramp/drive none @description \"the different modes represent different (highly arbitrary) variations on the classic linear interpolationorithm. there are 16 of them. try them all!\"",
          "varname": "mode"
        }
      },
      {
        "box": {
          "fontname": "Verdana",
          "fontsize": 10.0,
          "id": "obj-1026",
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
            342.0,
            561.714294,
            569.0,
            31.0
          ],
          "text": "j.parameter gang @type boolean @description \"when gang is on (default) x/range and y/range values are ignored - using the x/step  and y/step values instead.\"",
          "varname": "gang"
        }
      },
      {
        "box": {
          "fontname": "Verdana",
          "fontsize": 10.0,
          "id": "obj-1027",
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
            342.0,
            78.0,
            606.0,
            31.0
          ],
          "text": "j.parameter x/step @type integer @ramp/drive Max @description \"x/step and y/step represent the distance between the 'corners' between which the 'interpolation' takes place.\"",
          "varname": "x_step"
        }
      },
      {
        "box": {
          "fontname": "Verdana",
          "fontsize": 10.0,
          "id": "obj-1028",
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
            342.0,
            147.714294,
            606.0,
            31.0
          ],
          "text": "j.parameter y/step @type integer @ramp/drive Max @description \"x/step and y/step represent the distance between the 'corners' between which the 'interpolation' takes place.\"",
          "varname": "y_step"
        }
      },
      {
        "box": {
          "fontname": "Verdana",
          "fontsize": 10.0,
          "id": "obj-1031",
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
            342.0,
            285.714264,
            583.0,
            31.0
          ],
          "text": "j.parameter y/range @type integer @ramp/drive Max @description \"x/range and y/range represent the distance between the actual points used for the 'interpolation' calculation.\"",
          "varname": "y_range"
        }
      },
      {
        "box": {
          "fontname": "Verdana",
          "fontsize": 10.0,
          "id": "obj-1038",
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
            344.0,
            215.714279,
            596.0,
            31.0
          ],
          "text": "j.parameter x/range @type integer @ramp/drive Max @description \"x/range and y/range range represent the distance between the actual points used for the 'interpolation' calculation.\"",
          "varname": "x_range"
        }
      }
    ],
    "lines": [
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
            "obj-2",
            7
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
            6
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
            "obj-2",
            5
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
            "obj-2",
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
            "obj-2",
            3
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
            "obj-2",
            2
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
            29.5,
            174.5,
            241.5,
            174.5
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
            85.214287,
            174.5,
            241.5,
            174.5
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
            "obj-2",
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
      },
      {
        "patchline": {
          "destination": [
            "obj-8",
            0
          ],
          "hidden": 0,
          "midpoints": [
            364.5,
            174.0,
            241.5,
            174.0
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
            "obj-8",
            0
          ],
          "hidden": 0,
          "midpoints": [
            139.5,
            174.0,
            241.5,
            174.0
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
            195.5,
            175.5,
            241.5,
            175.5
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
            "obj-8",
            0
          ],
          "hidden": 0,
          "midpoints": [
            251.5,
            173.0,
            241.5,
            173.0
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
            "obj-8",
            0
          ],
          "hidden": 0,
          "midpoints": [
            307.5,
            174.5,
            241.5,
            174.5
          ],
          "source": [
            "obj-14",
            0
          ]
        }
      },
      {
        "patchline": {
          "color": [
            0.156863,
            0.8,
            0.54902,
            1.0
          ],
          "destination": [
            "obj-8",
            0
          ],
          "hidden": 0,
          "midpoints": [
            632.5,
            206.0,
            241.5,
            206.0
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
            "obj-7",
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
            "obj-8",
            0
          ],
          "hidden": 0,
          "midpoints": [
            456.100006,
            174.0,
            241.5,
            174.0
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
            "obj-8",
            0
          ],
          "hidden": 0,
          "midpoints": [
            491.700012,
            174.0,
            241.5,
            174.0
          ],
          "source": [
            "obj-1",
            2
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
            420.5,
            174.0,
            241.5,
            174.0
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
            "obj-8",
            0
          ],
          "hidden": 0,
          "midpoints": [
            527.299988,
            174.0,
            241.5,
            174.0
          ],
          "source": [
            "obj-1",
            3
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
            562.900024,
            175.0,
            241.5,
            175.0
          ],
          "source": [
            "obj-1",
            4
          ]
        }
      }
    ]
  }
}