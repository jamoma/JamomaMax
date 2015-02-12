{
  "patcher": {
    "fileversion": 1,
    "appversion": {
      "major": 6,
      "minor": 0,
      "revision": 8
    },
    "rect": [
      154.0,
      93.0,
      1126.0,
      613.0
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
            742.0,
            55.0,
            58.0,
            17.0
          ],
          "text": "voices $1"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-79",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patcher": {
            "fileversion": 1,
            "appversion": {
              "major": 6,
              "minor": 0,
              "revision": 8
            },
            "rect": [
              25.0,
              69.0,
              640.0,
              480.0
            ],
            "bglocked": 0,
            "openinpresentation": 0,
            "default_fontsize": 12.0,
            "default_fontface": 0,
            "default_fontname": "Arial",
            "gridonopen": 0,
            "gridsize": [
              15.0,
              15.0
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
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-67",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    360.0,
                    158.0,
                    77.0,
                    17.0
                  ],
                  "text": "maximum 11"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-64",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    150.0,
                    153.0,
                    71.0,
                    17.0
                  ],
                  "text": "maximum 3"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-61",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    226.0,
                    148.0,
                    106.0,
                    17.0
                  ],
                  "text": "range 1 11"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-57",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    43.0,
                    157.0,
                    100.0,
                    17.0
                  ],
                  "text": "range 1 3"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-53",
                  "maxclass": "newobj",
                  "numinlets": 4,
                  "numoutlets": 4,
                  "outlettype": [
                    "bang",
                    "bang",
                    "bang",
                    ""
                  ],
                  "patching_rect": [
                    106.0,
                    100.0,
                    372.0,
                    19.0
                  ],
                  "text": "sel Furse-Malham N3D SN3D"
                }
              },
              {
                "box": {
                  "comment": "",
                  "id": "obj-76",
                  "maxclass": "inlet",
                  "numinlets": 0,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    106.0,
                    40.0,
                    25.0,
                    25.0
                  ]
                }
              },
              {
                "box": {
                  "comment": "",
                  "id": "obj-77",
                  "maxclass": "outlet",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    129.5,
                    237.0,
                    25.0,
                    25.0
                  ]
                }
              },
              {
                "box": {
                  "comment": "",
                  "id": "obj-78",
                  "maxclass": "outlet",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    382.0,
                    237.0,
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
                    "obj-57",
                    0
                  ],
                  "disabled": 0,
                  "hidden": 0,
                  "source": [
                    "obj-53",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-61",
                    0
                  ],
                  "disabled": 0,
                  "hidden": 0,
                  "source": [
                    "obj-53",
                    2
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-61",
                    0
                  ],
                  "disabled": 0,
                  "hidden": 0,
                  "source": [
                    "obj-53",
                    1
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-64",
                    0
                  ],
                  "disabled": 0,
                  "hidden": 0,
                  "source": [
                    "obj-53",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-67",
                    0
                  ],
                  "disabled": 0,
                  "hidden": 0,
                  "source": [
                    "obj-53",
                    2
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-67",
                    0
                  ],
                  "disabled": 0,
                  "hidden": 0,
                  "source": [
                    "obj-53",
                    1
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-77",
                    0
                  ],
                  "disabled": 0,
                  "hidden": 0,
                  "source": [
                    "obj-57",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-77",
                    0
                  ],
                  "disabled": 0,
                  "hidden": 0,
                  "source": [
                    "obj-61",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-78",
                    0
                  ],
                  "disabled": 0,
                  "hidden": 0,
                  "source": [
                    "obj-64",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-78",
                    0
                  ],
                  "disabled": 0,
                  "hidden": 0,
                  "source": [
                    "obj-67",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-53",
                    0
                  ],
                  "disabled": 0,
                  "hidden": 0,
                  "source": [
                    "obj-76",
                    0
                  ]
                }
              }
            ]
          },
          "patching_rect": [
            691.0,
            423.0,
            117.0,
            19.0
          ],
          "saved_object_attributes": {
            "default_fontface": 0,
            "default_fontname": "Arial",
            "default_fontsize": 12.0,
            "description": "",
            "digest": "",
            "fontface": 0,
            "fontname": "Arial",
            "fontsize": 12.0,
            "globalpatchername": "",
            "tags": ""
          },
          "text": "p"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "frgb": 0.0,
          "id": "obj-50",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            20.0,
            80.0,
            300.0,
            19.0
          ],
          "presentation": 1,
          "presentation_rect": [
            0.0,
            52.0,
            295.0,
            19.0
          ],
          "text": "_____________________________________________"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "frgb": 0.0,
          "id": "obj-35",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            128.0,
            71.0,
            54.0,
            19.0
          ],
          "presentation": 1,
          "presentation_rect": [
            6.0,
            77.0,
            50.0,
            19.0
          ],
          "text": "Center:"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "frgb": 0.0,
          "id": "obj-58",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            234.0,
            73.0,
            44.0,
            19.0
          ],
          "presentation": 1,
          "presentation_rect": [
            184.0,
            77.0,
            38.0,
            19.0
          ],
          "text": "decay"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "frgb": 0.0,
          "id": "obj-59",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            185.0,
            72.0,
            44.0,
            19.0
          ],
          "presentation": 1,
          "presentation_rect": [
            116.0,
            77.0,
            37.0,
            19.0
          ],
          "text": "curve"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "frgb": 0.0,
          "id": "obj-60",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            79.0,
            72.0,
            44.0,
            19.0
          ],
          "presentation": 1,
          "presentation_rect": [
            54.0,
            77.0,
            28.0,
            19.0
          ],
          "text": "size"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-69",
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
            423.0,
            567.0,
            246.0,
            43.0
          ],
          "text": "j.remote report"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "frgb": 0.0,
          "id": "obj-73",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            445.0,
            165.0,
            81.0,
            19.0
          ],
          "text": "Interpolation: "
        }
      },
      {
        "box": {
          "annotation": "switch on/off blockwise interpolation of all coefficient changes in the encoding stage.",
          "id": "obj-71",
          "maxclass": "toggle",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ],
          "parameter_enable": 0,
          "patching_rect": [
            427.0,
            166.0,
            20.0,
            20.0
          ]
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-70",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            680.0,
            557.0,
            52.0,
            17.0
          ],
          "text": "set 1 $1"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-68",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            734.0,
            573.0,
            118.0,
            19.0
          ],
          "text": "tosymbol @separator"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-66",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            734.0,
            595.0,
            67.0,
            19.0
          ],
          "text": "append 1 8"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-65",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            734.0,
            554.0,
            182.0,
            17.0
          ],
          "text": "/source. $1 /order:/range"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-63",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "bang",
            "int"
          ],
          "patching_rect": [
            654.0,
            513.0,
            32.5,
            19.0
          ],
          "text": "t b i"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-43",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 3,
          "outlettype": [
            "bang",
            "bang",
            "int"
          ],
          "patching_rect": [
            706.0,
            532.0,
            46.0,
            19.0
          ],
          "text": "uzi 8 1"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-56",
          "maxclass": "newobj",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patcher": {
            "fileversion": 1,
            "appversion": {
              "major": 6,
              "minor": 0,
              "revision": 8
            },
            "rect": [
              460.0,
              79.0,
              640.0,
              480.0
            ],
            "bglocked": 0,
            "openinpresentation": 0,
            "default_fontsize": 12.0,
            "default_fontface": 0,
            "default_fontname": "Arial",
            "gridonopen": 0,
            "gridsize": [
              15.0,
              15.0
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
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-10",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    95.0,
                    221.0,
                    77.0,
                    20.0
                  ],
                  "text": "append 1 11"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-11",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    81.0,
                    170.0,
                    125.0,
                    20.0
                  ],
                  "text": "tosymbol @separator"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-12",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    74.0,
                    140.0,
                    185.0,
                    18.0
                  ],
                  "text": "/source. $1 /order:/range"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-9",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    322.0,
                    220.0,
                    91.0,
                    20.0
                  ],
                  "text": "append integer"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-8",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    308.0,
                    169.0,
                    125.0,
                    20.0
                  ],
                  "text": "tosymbol @separator"
                }
              },
              {
                "box": {
                  "id": "obj-7",
                  "maxclass": "button",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "outlettype": [
                    "bang"
                  ],
                  "patching_rect": [
                    345.0,
                    71.0,
                    20.0,
                    20.0
                  ]
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-5",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    301.0,
                    139.0,
                    134.0,
                    18.0
                  ],
                  "text": "/source. $1 /order:/type"
                }
              },
              {
                "box": {
                  "comment": "",
                  "id": "obj-3",
                  "maxclass": "outlet",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    207.0,
                    354.0,
                    25.0,
                    25.0
                  ]
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
                    "bang",
                    "bang",
                    "int"
                  ],
                  "patching_rect": [
                    278.0,
                    108.0,
                    53.0,
                    20.0
                  ],
                  "text": "uzi 32 1"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-1",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    ""
                  ],
                  "patching_rect": [
                    279.0,
                    85.0,
                    55.0,
                    20.0
                  ],
                  "text": "j.init"
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
                    "obj-3",
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
                    "obj-11",
                    0
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
                    "obj-12",
                    0
                  ],
                  "disabled": 0,
                  "hidden": 0,
                  "source": [
                    "obj-2",
                    2
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
                  "disabled": 0,
                  "hidden": 0,
                  "source": [
                    "obj-5",
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
                    "obj-9",
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
                    "obj-3",
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
            ]
          },
          "patching_rect": [
            27.0,
            165.0,
            36.0,
            19.0
          ],
          "saved_object_attributes": {
            "default_fontface": 0,
            "default_fontname": "Arial",
            "default_fontsize": 12.0,
            "description": "",
            "digest": "",
            "fontface": 0,
            "fontname": "Arial",
            "fontsize": 12.0,
            "globalpatchername": "",
            "tags": ""
          },
          "text": "p init"
        }
      },
      {
        "box": {
          "comment": "B-format output as multicable ",
          "id": "obj-62",
          "maxclass": "outlet",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            179.0,
            372.0,
            25.0,
            25.0
          ]
        }
      },
      {
        "box": {
          "comment": "multicable acess to the encoder",
          "id": "obj-54",
          "maxclass": "inlet",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            179.0,
            294.0,
            25.0,
            25.0
          ]
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-52",
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
            499.0,
            389.0,
            403.0,
            31.0
          ],
          "text": "j.remote flavor",
          "varname": "destination/voices[5]"
        }
      },
      {
        "box": {
          "annotation": "Ambisonics type of decoding and encoding. Furse-Malham, N3D or SN3D",
          "fontname": "Arial",
          "fontsize": 12.0,
          "hint": "flavor",
          "id": "obj-38",
          "items": [
            "Furse-Malham",
            ",",
            "N3D",
            ",",
            "SN3D"
          ],
          "maxclass": "umenu",
          "numinlets": 1,
          "numoutlets": 3,
          "outlettype": [
            "int",
            "",
            ""
          ],
          "parameter_enable": 0,
          "patching_rect": [
            392.0,
            392.744507,
            100.0,
            19.0
          ],
          "presentation": 1,
          "presentation_rect": [
            156.0,
            29.744507,
            100.0,
            19.0
          ]
        }
      },
      {
        "box": {
          "annotation": "Ambisonics order of decoding and encoding",
          "fontname": "Arial",
          "fontsize": 12.0,
          "hint": "maximum ambisonics order ",
          "id": "obj-28",
          "maxclass": "number",
          "maximum": 32,
          "minimum": 1,
          "mouseup": 1,
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "int",
            "bang"
          ],
          "parameter_enable": 0,
          "patching_rect": [
            457.0,
            479.0,
            34.0,
            19.0
          ],
          "presentation": 1,
          "presentation_rect": [
            261.0,
            30.0,
            33.0,
            19.0
          ],
          "triangle": 0
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-37",
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
            497.0,
            477.0,
            443.0,
            31.0
          ],
          "text": "j.remote order",
          "varname": "destination/voices[2]"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-27",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "open"
          ],
          "patching_rect": [
            61.0,
            270.0,
            43.0,
            19.0
          ],
          "text": "t open"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-25",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            61.0,
            293.0,
            51.0,
            19.0
          ],
          "text": "pcontrol"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-23",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patcher": {
            "fileversion": 1,
            "appversion": {
              "major": 6,
              "minor": 0,
              "revision": 8
            },
            "rect": [
              618.0,
              387.0,
              614.0,
              181.0
            ],
            "bglocked": 0,
            "openinpresentation": 1,
            "default_fontsize": 12.0,
            "default_fontface": 0,
            "default_fontname": "Arial",
            "gridonopen": 0,
            "gridsize": [
              15.0,
              15.0
            ],
            "gridsnaponopen": 0,
            "statusbarvisible": 2,
            "toolbarvisible": 0,
            "boxanimatetime": 200,
            "imprint": 0,
            "enablehscroll": 0,
            "enablevscroll": 0,
            "devicewidth": 0.0,
            "description": "",
            "digest": "",
            "tags": "",
            "boxes": [
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "frgb": 0.0,
                  "id": "obj-29",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    291.0,
                    182.0,
                    150.0,
                    20.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    13.0,
                    127.825241,
                    66.0,
                    20.0
                  ],
                  "text": "Amplitude"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "frgb": 0.0,
                  "id": "obj-25",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    276.0,
                    167.0,
                    150.0,
                    20.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    74.0,
                    156.0,
                    100.0,
                    20.0
                  ],
                  "text": "Distance in units"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "frgb": 0.0,
                  "id": "obj-26",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    578.0,
                    108.0,
                    150.0,
                    20.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    515.0,
                    156.0,
                    93.0,
                    20.0
                  ],
                  "text": "floating window"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-24",
                  "maxclass": "newobj",
                  "numinlets": 3,
                  "numoutlets": 3,
                  "outlettype": [
                    "bang",
                    "bang",
                    ""
                  ],
                  "patching_rect": [
                    561.0,
                    130.0,
                    46.0,
                    20.0
                  ],
                  "text": "sel 1 0"
                }
              },
              {
                "box": {
                  "bgcolor": [
                    1.0,
                    1.0,
                    1.0,
                    0.0
                  ],
                  "disabled": [
                    0
                  ],
                  "id": "obj-15",
                  "itemtype": 1,
                  "maxclass": "radiogroup",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "parameter_enable": 0,
                  "patching_rect": [
                    560.0,
                    109.0,
                    18.0,
                    18.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    497.0,
                    156.0,
                    18.0,
                    18.0
                  ],
                  "size": 1,
                  "values": [
                    0
                  ]
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 11.595187,
                  "id": "obj-7",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    640.0,
                    103.0,
                    175.0,
                    17.0
                  ],
                  "text": "window flags float, window exec"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 11.595187,
                  "id": "obj-12",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    628.0,
                    123.0,
                    188.0,
                    17.0
                  ],
                  "text": "window flags nofloat, window exec"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-30",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    ""
                  ],
                  "patching_rect": [
                    626.0,
                    144.0,
                    69.0,
                    20.0
                  ],
                  "save": [
                    "#N",
                    "thispatcher",
                    ";",
                    "#Q",
                    "end",
                    ";"
                  ],
                  "text": "thispatcher"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-27",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patcher": {
                    "fileversion": 1,
                    "appversion": {
                      "major": 6,
                      "minor": 0,
                      "revision": 8
                    },
                    "rect": [
                      50.0,
                      94.0,
                      196.0,
                      323.0
                    ],
                    "bglocked": 0,
                    "openinpresentation": 0,
                    "default_fontsize": 12.0,
                    "default_fontface": 0,
                    "default_fontname": "Arial",
                    "gridonopen": 0,
                    "gridsize": [
                      15.0,
                      15.0
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
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-2",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            52.0,
                            239.0,
                            81.0,
                            20.0
                          ],
                          "text": "prepend tabs"
                        }
                      },
                      {
                        "box": {
                          "comment": "",
                          "id": "obj-1",
                          "maxclass": "outlet",
                          "numinlets": 1,
                          "numoutlets": 0,
                          "patching_rect": [
                            93.0,
                            288.0,
                            25.0,
                            25.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-25",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 2,
                          "outlettype": [
                            "int",
                            "int"
                          ],
                          "patching_rect": [
                            113.0,
                            100.0,
                            32.5,
                            20.0
                          ],
                          "text": "t i i"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-24",
                          "maxclass": "newobj",
                          "numinlets": 2,
                          "numoutlets": 2,
                          "outlettype": [
                            "",
                            ""
                          ],
                          "patching_rect": [
                            88.0,
                            202.0,
                            53.0,
                            20.0
                          ],
                          "text": "zl group"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-15",
                          "maxclass": "newobj",
                          "numinlets": 2,
                          "numoutlets": 3,
                          "outlettype": [
                            "bang",
                            "bang",
                            "int"
                          ],
                          "patching_rect": [
                            81.0,
                            139.0,
                            46.0,
                            20.0
                          ],
                          "text": "uzi 8 1"
                        }
                      },
                      {
                        "box": {
                          "comment": "",
                          "id": "obj-26",
                          "maxclass": "inlet",
                          "numinlets": 0,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            113.0,
                            40.0,
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
                            "obj-24",
                            0
                          ],
                          "disabled": 0,
                          "hidden": 0,
                          "source": [
                            "obj-15",
                            2
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
                            "obj-2",
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
                          "disabled": 0,
                          "hidden": 0,
                          "source": [
                            "obj-24",
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
                            "obj-25",
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
                          "disabled": 0,
                          "hidden": 0,
                          "source": [
                            "obj-25",
                            1
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-25",
                            0
                          ],
                          "disabled": 0,
                          "hidden": 0,
                          "source": [
                            "obj-26",
                            0
                          ]
                        }
                      }
                    ]
                  },
                  "patching_rect": [
                    96.0,
                    19.0,
                    69.0,
                    20.0
                  ],
                  "saved_object_attributes": {
                    "default_fontface": 0,
                    "default_fontname": "Arial",
                    "default_fontsize": 12.0,
                    "description": "",
                    "digest": "",
                    "fontface": 0,
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "globalpatchername": "",
                    "tags": ""
                  },
                  "text": "p makeTab"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "htabcolor": [
                    0.9,
                    0.9,
                    0.9,
                    1.0
                  ],
                  "id": "obj-6",
                  "maxclass": "tab",
                  "multiline": 0,
                  "numinlets": 1,
                  "numoutlets": 3,
                  "outlettype": [
                    "int",
                    "",
                    ""
                  ],
                  "parameter_enable": 0,
                  "patching_rect": [
                    96.0,
                    42.0,
                    88.0,
                    19.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    -1.0,
                    -1.0,
                    615.0,
                    19.0
                  ],
                  "rounded": 1.0,
                  "tabs": [
                    "1",
                    "2",
                    "3"
                  ]
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-33",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 3,
                  "outlettype": [
                    "",
                    "",
                    ""
                  ],
                  "patcher": {
                    "fileversion": 1,
                    "appversion": {
                      "major": 6,
                      "minor": 0,
                      "revision": 8
                    },
                    "rect": [
                      75.0,
                      119.0,
                      640.0,
                      480.0
                    ],
                    "bglocked": 0,
                    "openinpresentation": 0,
                    "default_fontsize": 12.0,
                    "default_fontface": 0,
                    "default_fontname": "Arial",
                    "gridonopen": 0,
                    "gridsize": [
                      15.0,
                      15.0
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
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-28",
                          "maxclass": "newobj",
                          "numinlets": 4,
                          "numoutlets": 4,
                          "outlettype": [
                            "",
                            "",
                            "",
                            ""
                          ],
                          "patching_rect": [
                            201.0,
                            121.0,
                            382.0,
                            20.0
                          ],
                          "text": "route /mode:/value/get /dbUnit:/value/get /attenuationFactor:/value/get"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-15",
                          "maxclass": "newobj",
                          "numinlets": 4,
                          "numoutlets": 4,
                          "outlettype": [
                            "",
                            "",
                            "",
                            ""
                          ],
                          "patching_rect": [
                            50.0,
                            96.0,
                            216.0,
                            20.0
                          ],
                          "text": "route /mode /dbUnit /attenuationFactor"
                        }
                      },
                      {
                        "box": {
                          "comment": "",
                          "id": "obj-29",
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
                          "id": "obj-30",
                          "maxclass": "outlet",
                          "numinlets": 1,
                          "numoutlets": 0,
                          "patching_rect": [
                            50.0,
                            180.0,
                            25.0,
                            25.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "comment": "",
                          "id": "obj-31",
                          "maxclass": "outlet",
                          "numinlets": 1,
                          "numoutlets": 0,
                          "patching_rect": [
                            115.0,
                            180.0,
                            25.0,
                            25.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "comment": "",
                          "id": "obj-32",
                          "maxclass": "outlet",
                          "numinlets": 1,
                          "numoutlets": 0,
                          "patching_rect": [
                            181.0,
                            180.0,
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
                            "obj-28",
                            0
                          ],
                          "disabled": 0,
                          "hidden": 0,
                          "source": [
                            "obj-15",
                            3
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-30",
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
                            "obj-31",
                            0
                          ],
                          "disabled": 0,
                          "hidden": 0,
                          "source": [
                            "obj-15",
                            1
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-32",
                            0
                          ],
                          "disabled": 0,
                          "hidden": 0,
                          "source": [
                            "obj-15",
                            2
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-30",
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
                            "obj-31",
                            0
                          ],
                          "disabled": 0,
                          "hidden": 0,
                          "source": [
                            "obj-28",
                            1
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-32",
                            0
                          ],
                          "disabled": 0,
                          "hidden": 0,
                          "source": [
                            "obj-28",
                            2
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
                            "obj-29",
                            0
                          ]
                        }
                      }
                    ]
                  },
                  "patching_rect": [
                    88.0,
                    166.0,
                    216.0,
                    20.0
                  ],
                  "saved_object_attributes": {
                    "default_fontface": 0,
                    "default_fontname": "Arial",
                    "default_fontsize": 12.0,
                    "description": "",
                    "digest": "",
                    "fontface": 0,
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "globalpatchername": "",
                    "tags": ""
                  },
                  "text": "p"
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
                    558.0,
                    153.0,
                    25.0,
                    25.0
                  ]
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-22",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    420.0,
                    109.0,
                    125.0,
                    20.0
                  ],
                  "text": "tosymbol @separator"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-21",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    400.0,
                    86.0,
                    277.0,
                    18.0
                  ],
                  "text": "/source. $1 /distance/attenuationFactor:/value/get"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-20",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    414.0,
                    62.0,
                    226.0,
                    18.0
                  ],
                  "text": "/source. $1 /distance/dbUnit:/value/get"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-18",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "int",
                    "int"
                  ],
                  "patching_rect": [
                    359.0,
                    29.0,
                    32.5,
                    20.0
                  ],
                  "text": "t i i"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-13",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    425.0,
                    34.0,
                    221.0,
                    18.0
                  ],
                  "text": "/source. $1 /distance/mode:/value/get"
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
                    260.0,
                    66.0,
                    70.0,
                    18.0
                  ],
                  "text": "/source. $1"
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
                    89.0,
                    90.0,
                    60.0,
                    18.0
                  ],
                  "text": "/source.1"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-3",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    ""
                  ],
                  "patching_rect": [
                    89.0,
                    68.0,
                    55.0,
                    20.0
                  ],
                  "text": "j.init"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "frgb": 0.0,
                  "id": "obj-19",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    197.0,
                    310.0,
                    150.0,
                    20.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    6.0,
                    15.0,
                    51.0,
                    20.0
                  ],
                  "text": "source  "
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-8",
                  "maxclass": "number",
                  "maximum": 2,
                  "minimum": 1,
                  "mouseup": 1,
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "int",
                    "bang"
                  ],
                  "parameter_enable": 0,
                  "patching_rect": [
                    166.0,
                    72.0,
                    50.0,
                    20.0
                  ],
                  "triangle": 0
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-16",
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
                    354.0,
                    165.0,
                    188.0,
                    20.0
                  ],
                  "text": "j.oscroute /size /curve /decay"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-14",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    ""
                  ],
                  "patching_rect": [
                    88.0,
                    142.0,
                    137.0,
                    20.0
                  ],
                  "text": "j.oscroute /distance"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-9",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    260.0,
                    88.0,
                    125.0,
                    20.0
                  ],
                  "text": "tosymbol @separator"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-5",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    ""
                  ],
                  "patching_rect": [
                    87.0,
                    113.0,
                    85.0,
                    20.0
                  ],
                  "text": "j.oscroute"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
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
                    354.0,
                    142.0,
                    199.0,
                    20.0
                  ],
                  "text": "j.oscroute /center /numSources"
                }
              },
              {
                "box": {
                  "color": [
                    0.698039,
                    0.698039,
                    0.698039,
                    0.501961
                  ],
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "hidden": 1,
                  "id": "obj-48",
                  "maxclass": "newobj",
                  "numinlets": 6,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patcher": {
                    "fileversion": 1,
                    "appversion": {
                      "major": 6,
                      "minor": 0,
                      "revision": 8
                    },
                    "rect": [
                      147.0,
                      80.0,
                      935.0,
                      768.0
                    ],
                    "bglocked": 0,
                    "openinpresentation": 0,
                    "default_fontsize": 12.0,
                    "default_fontface": 0,
                    "default_fontname": "Arial",
                    "gridonopen": 0,
                    "gridsize": [
                      12.0,
                      12.0
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
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-43",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 1,
                          "outlettype": [
                            "float"
                          ],
                          "patching_rect": [
                            100.0,
                            485.153839,
                            28.0,
                            19.0
                          ],
                          "text": "t 1."
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
                            "int"
                          ],
                          "patching_rect": [
                            840.0,
                            478.615387,
                            32.5,
                            19.0
                          ],
                          "text": "!= 0"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-41",
                          "maxclass": "newobj",
                          "numinlets": 3,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            62.0,
                            517.846191,
                            62.0,
                            19.0
                          ],
                          "text": "switch 1 1"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-40",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 1,
                          "outlettype": [
                            "float"
                          ],
                          "patching_rect": [
                            405.0,
                            444.615387,
                            28.0,
                            19.0
                          ],
                          "text": "t 1."
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-1",
                          "maxclass": "newobj",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            "float"
                          ],
                          "patching_rect": [
                            694.0,
                            349.153839,
                            35.0,
                            19.0
                          ],
                          "text": "* -1."
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "frgb": 0.0,
                          "id": "obj-2",
                          "maxclass": "comment",
                          "numinlets": 1,
                          "numoutlets": 0,
                          "patching_rect": [
                            175.0,
                            396.230774,
                            104.0,
                            19.0
                          ],
                          "text": "scale inside center"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-3",
                          "maxclass": "newobj",
                          "numinlets": 2,
                          "numoutlets": 3,
                          "outlettype": [
                            "",
                            "",
                            ""
                          ],
                          "patching_rect": [
                            405.0,
                            396.230774,
                            52.0,
                            19.0
                          ],
                          "text": "gate 3 1"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "frgb": 0.0,
                          "id": "obj-4",
                          "maxclass": "comment",
                          "numinlets": 1,
                          "numoutlets": 0,
                          "patching_rect": [
                            50.0,
                            31.0,
                            63.0,
                            19.0
                          ],
                          "text": "dist_mode"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "frgb": 0.0,
                          "id": "obj-5",
                          "maxclass": "comment",
                          "numinlets": 1,
                          "numoutlets": 0,
                          "patching_rect": [
                            428.0,
                            31.0,
                            48.0,
                            19.0
                          ],
                          "text": "da_fact"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "frgb": 0.0,
                          "id": "obj-6",
                          "maxclass": "comment",
                          "numinlets": 1,
                          "numoutlets": 0,
                          "patching_rect": [
                            235.0,
                            31.0,
                            49.0,
                            19.0
                          ],
                          "text": "db_unit"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "frgb": 0.0,
                          "id": "obj-7",
                          "maxclass": "comment",
                          "numinlets": 1,
                          "numoutlets": 0,
                          "patching_rect": [
                            798.0,
                            31.0,
                            62.0,
                            19.0
                          ],
                          "text": "center_att"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "frgb": 0.0,
                          "id": "obj-8",
                          "maxclass": "comment",
                          "numinlets": 1,
                          "numoutlets": 0,
                          "patching_rect": [
                            616.0,
                            31.0,
                            68.0,
                            19.0
                          ],
                          "text": "center_size"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "frgb": 0.0,
                          "id": "obj-9",
                          "maxclass": "comment",
                          "numinlets": 1,
                          "numoutlets": 0,
                          "patching_rect": [
                            707.0,
                            31.0,
                            58.0,
                            19.0
                          ],
                          "text": "att_curve"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "frgb": 0.0,
                          "id": "obj-10",
                          "maxclass": "comment",
                          "numinlets": 1,
                          "numoutlets": 0,
                          "patching_rect": [
                            209.0,
                            349.153839,
                            52.0,
                            19.0
                          ],
                          "text": "distance",
                          "textcolor": [
                            0.611765,
                            0.701961,
                            1.0,
                            1.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-11",
                          "maxclass": "newobj",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            65.0,
                            396.230774,
                            112.0,
                            19.0
                          ],
                          "text": "expr $f1 * (1.0/$f2)"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-12",
                          "maxclass": "newobj",
                          "numinlets": 3,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            673.0,
                            445.923065,
                            164.0,
                            19.0
                          ],
                          "text": "expr pow(($f1+(1-$f3))\\, $f2)"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-13",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 2,
                          "outlettype": [
                            "bang",
                            "float"
                          ],
                          "patching_rect": [
                            57.0,
                            132.07692,
                            32.5,
                            19.0
                          ],
                          "text": "t b f"
                        }
                      },
                      {
                        "box": {
                          "comment": "center size",
                          "id": "obj-14",
                          "maxclass": "inlet",
                          "numinlets": 0,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            587.0,
                            31.0,
                            25.0,
                            25.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "comment": "distance attenution factor",
                          "id": "obj-15",
                          "maxclass": "inlet",
                          "numinlets": 0,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            399.0,
                            31.0,
                            25.0,
                            25.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-16",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 2,
                          "outlettype": [
                            "bang",
                            "float"
                          ],
                          "patching_rect": [
                            675.0,
                            133.384613,
                            32.5,
                            19.0
                          ],
                          "text": "t b f"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-17",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 2,
                          "outlettype": [
                            "bang",
                            "int"
                          ],
                          "patching_rect": [
                            832.0,
                            132.07692,
                            32.5,
                            19.0
                          ],
                          "text": "t b i"
                        }
                      },
                      {
                        "box": {
                          "comment": "distance calulation mode",
                          "id": "obj-18",
                          "maxclass": "inlet",
                          "numinlets": 0,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            22.0,
                            31.0,
                            25.0,
                            25.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-19",
                          "maxclass": "newobj",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            "int"
                          ],
                          "patching_rect": [
                            405.0,
                            349.153839,
                            32.5,
                            19.0
                          ],
                          "text": "+ 1"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-20",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            247.0,
                            312.538452,
                            158.0,
                            19.0
                          ],
                          "text": "expr pow(10.0\\, (-$f1 / 20.))"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-21",
                          "maxclass": "newobj",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            "float"
                          ],
                          "patching_rect": [
                            501.0,
                            349.153839,
                            35.0,
                            19.0
                          ],
                          "text": "* -1."
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-22",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 2,
                          "outlettype": [
                            "bang",
                            "float"
                          ],
                          "patching_rect": [
                            240.0,
                            132.07692,
                            32.5,
                            19.0
                          ],
                          "text": "t b f"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-23",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 2,
                          "outlettype": [
                            "bang",
                            "float"
                          ],
                          "patching_rect": [
                            149.0,
                            132.07692,
                            32.5,
                            19.0
                          ],
                          "text": "t b f"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-24",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 2,
                          "outlettype": [
                            "bang",
                            "float"
                          ],
                          "patching_rect": [
                            482.0,
                            133.384613,
                            32.5,
                            19.0
                          ],
                          "text": "t b f"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-25",
                          "maxclass": "newobj",
                          "numinlets": 3,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            65.0,
                            442.0,
                            204.0,
                            19.0
                          ],
                          "text": "expr (pow($f1\\,$f2) * (1 - $f3)) + $f3"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-26",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 2,
                          "outlettype": [
                            "bang",
                            "bang"
                          ],
                          "patching_rect": [
                            45.0,
                            193.538467,
                            32.5,
                            19.0
                          ],
                          "text": "b"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-27",
                          "maxclass": "newobj",
                          "numinlets": 6,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            65.0,
                            312.538452,
                            95.0,
                            19.0
                          ],
                          "text": "scale 0 500 5. 0."
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-28",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 2,
                          "outlettype": [
                            "int",
                            "int"
                          ],
                          "patching_rect": [
                            45.0,
                            279.846161,
                            32.5,
                            19.0
                          ],
                          "text": "t i i"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-29",
                          "maxclass": "newobj",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            "int"
                          ],
                          "patching_rect": [
                            45.0,
                            252.384613,
                            32.5,
                            19.0
                          ],
                          "text": "- 1"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-30",
                          "maxclass": "newobj",
                          "numinlets": 2,
                          "numoutlets": 3,
                          "outlettype": [
                            "bang",
                            "bang",
                            "int"
                          ],
                          "patching_rect": [
                            45.0,
                            219.692307,
                            47.0,
                            19.0
                          ],
                          "text": "uzi 501"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-31",
                          "maxclass": "newobj",
                          "numinlets": 4,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patcher": {
                            "fileversion": 1,
                            "appversion": {
                              "major": 6,
                              "minor": 0,
                              "revision": 8
                            },
                            "rect": [
                              40.0,
                              73.0,
                              1307.0,
                              853.0
                            ],
                            "bglocked": 0,
                            "openinpresentation": 0,
                            "default_fontsize": 12.0,
                            "default_fontface": 0,
                            "default_fontname": "Arial",
                            "gridonopen": 0,
                            "gridsize": [
                              12.0,
                              12.0
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
                                  "fontname": "Arial",
                                  "fontsize": 12.0,
                                  "id": "obj-1",
                                  "maxclass": "newobj",
                                  "numinlets": 2,
                                  "numoutlets": 1,
                                  "outlettype": [
                                    "int"
                                  ],
                                  "patching_rect": [
                                    434.0,
                                    135.0,
                                    35.0,
                                    19.0
                                  ],
                                  "text": "+ 10"
                                }
                              },
                              {
                                "box": {
                                  "fontname": "Arial",
                                  "fontsize": 12.0,
                                  "id": "obj-2",
                                  "maxclass": "newobj",
                                  "numinlets": 2,
                                  "numoutlets": 1,
                                  "outlettype": [
                                    "int"
                                  ],
                                  "patching_rect": [
                                    392.0,
                                    162.0,
                                    36.0,
                                    19.0
                                  ],
                                  "text": "i 100"
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
                                    "float"
                                  ],
                                  "patching_rect": [
                                    494.0,
                                    34.0,
                                    25.0,
                                    25.0
                                  ]
                                }
                              },
                              {
                                "box": {
                                  "fontname": "Arial",
                                  "fontsize": 12.0,
                                  "id": "obj-4",
                                  "maxclass": "newobj",
                                  "numinlets": 2,
                                  "numoutlets": 1,
                                  "outlettype": [
                                    "float"
                                  ],
                                  "patching_rect": [
                                    494.0,
                                    54.0,
                                    43.0,
                                    19.0
                                  ],
                                  "text": "* 100."
                                }
                              },
                              {
                                "box": {
                                  "bgcolor": [
                                    0.866667,
                                    0.866667,
                                    0.866667,
                                    1.0
                                  ],
                                  "fontname": "Arial",
                                  "fontsize": 12.0,
                                  "htextcolor": [
                                    0.870588,
                                    0.870588,
                                    0.870588,
                                    1.0
                                  ],
                                  "id": "obj-5",
                                  "maxclass": "number",
                                  "numinlets": 1,
                                  "numoutlets": 2,
                                  "outlettype": [
                                    "int",
                                    "bang"
                                  ],
                                  "parameter_enable": 0,
                                  "patching_rect": [
                                    592.0,
                                    99.0,
                                    38.0,
                                    19.0
                                  ],
                                  "triscale": 0.9
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
                                    102.0,
                                    388.0,
                                    25.0,
                                    25.0
                                  ]
                                }
                              },
                              {
                                "box": {
                                  "fontname": "Arial",
                                  "fontsize": 12.0,
                                  "id": "obj-7",
                                  "maxclass": "newobj",
                                  "numinlets": 2,
                                  "numoutlets": 1,
                                  "outlettype": [
                                    "int"
                                  ],
                                  "patching_rect": [
                                    100.0,
                                    54.0,
                                    42.0,
                                    19.0
                                  ],
                                  "text": "!- 510"
                                }
                              },
                              {
                                "box": {
                                  "fontname": "Arial",
                                  "fontsize": 12.0,
                                  "id": "obj-8",
                                  "maxclass": "newobj",
                                  "numinlets": 2,
                                  "numoutlets": 1,
                                  "outlettype": [
                                    "float"
                                  ],
                                  "patching_rect": [
                                    184.0,
                                    76.0,
                                    39.0,
                                    19.0
                                  ],
                                  "text": "+ 10."
                                }
                              },
                              {
                                "box": {
                                  "fontname": "Arial",
                                  "fontsize": 12.0,
                                  "id": "obj-9",
                                  "maxclass": "newobj",
                                  "numinlets": 2,
                                  "numoutlets": 2,
                                  "outlettype": [
                                    "bang",
                                    "bang"
                                  ],
                                  "patching_rect": [
                                    70.0,
                                    160.0,
                                    64.0,
                                    19.0
                                  ],
                                  "text": "onebang 1"
                                }
                              },
                              {
                                "box": {
                                  "fontname": "Arial",
                                  "fontsize": 12.0,
                                  "id": "obj-10",
                                  "maxclass": "newobj",
                                  "numinlets": 1,
                                  "numoutlets": 1,
                                  "outlettype": [
                                    "bang"
                                  ],
                                  "patching_rect": [
                                    70.0,
                                    140.0,
                                    27.0,
                                    19.0
                                  ],
                                  "text": "b 1"
                                }
                              },
                              {
                                "box": {
                                  "comment": "",
                                  "id": "obj-11",
                                  "maxclass": "inlet",
                                  "numinlets": 0,
                                  "numoutlets": 1,
                                  "outlettype": [
                                    ""
                                  ],
                                  "patching_rect": [
                                    184.0,
                                    30.0,
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
                                    ""
                                  ],
                                  "patching_rect": [
                                    100.0,
                                    103.0,
                                    57.0,
                                    19.0
                                  ],
                                  "text": "pack 0 0."
                                }
                              },
                              {
                                "box": {
                                  "fontname": "Arial",
                                  "fontsize": 12.0,
                                  "id": "obj-13",
                                  "maxclass": "newobj",
                                  "numinlets": 6,
                                  "numoutlets": 1,
                                  "outlettype": [
                                    ""
                                  ],
                                  "patching_rect": [
                                    184.0,
                                    53.0,
                                    95.0,
                                    19.0
                                  ],
                                  "text": "scale 0. 1. 100 0"
                                }
                              },
                              {
                                "box": {
                                  "fontname": "Arial",
                                  "fontsize": 12.0,
                                  "id": "obj-14",
                                  "maxclass": "newobj",
                                  "numinlets": 1,
                                  "numoutlets": 1,
                                  "outlettype": [
                                    ""
                                  ],
                                  "patching_rect": [
                                    100.0,
                                    247.0,
                                    83.0,
                                    19.0
                                  ],
                                  "text": "prepend lineto"
                                }
                              },
                              {
                                "box": {
                                  "fontname": "Arial",
                                  "fontsize": 12.0,
                                  "id": "obj-15",
                                  "maxclass": "message",
                                  "numinlets": 2,
                                  "numoutlets": 1,
                                  "outlettype": [
                                    ""
                                  ],
                                  "patching_rect": [
                                    70.0,
                                    221.0,
                                    57.0,
                                    17.0
                                  ],
                                  "text": "set lineto"
                                }
                              },
                              {
                                "box": {
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
                                    125.0,
                                    221.0,
                                    67.0,
                                    17.0
                                  ],
                                  "text": "set moveto"
                                }
                              },
                              {
                                "box": {
                                  "fontname": "Arial",
                                  "fontsize": 12.0,
                                  "id": "obj-17",
                                  "maxclass": "newobj",
                                  "numinlets": 1,
                                  "numoutlets": 8,
                                  "outlettype": [
                                    "bang",
                                    "bang",
                                    "bang",
                                    "bang",
                                    "bang",
                                    "bang",
                                    "bang",
                                    "bang"
                                  ],
                                  "patching_rect": [
                                    314.0,
                                    89.0,
                                    113.5,
                                    19.0
                                  ],
                                  "text": "b 8"
                                }
                              },
                              {
                                "box": {
                                  "comment": "",
                                  "id": "obj-18",
                                  "maxclass": "inlet",
                                  "numinlets": 0,
                                  "numoutlets": 1,
                                  "outlettype": [
                                    "bang"
                                  ],
                                  "patching_rect": [
                                    314.0,
                                    39.0,
                                    25.0,
                                    25.0
                                  ]
                                }
                              },
                              {
                                "box": {
                                  "comment": "",
                                  "id": "obj-19",
                                  "maxclass": "inlet",
                                  "numinlets": 0,
                                  "numoutlets": 1,
                                  "outlettype": [
                                    "int"
                                  ],
                                  "patching_rect": [
                                    100.0,
                                    31.0,
                                    25.0,
                                    25.0
                                  ]
                                }
                              },
                              {
                                "box": {
                                  "fontname": "Arial",
                                  "fontsize": 12.0,
                                  "id": "obj-20",
                                  "linecount": 2,
                                  "maxclass": "message",
                                  "numinlets": 2,
                                  "numoutlets": 1,
                                  "outlettype": [
                                    ""
                                  ],
                                  "patching_rect": [
                                    394.0,
                                    191.0,
                                    588.0,
                                    29.0
                                  ],
                                  "text": "frgb 0 127 255, penmode 32, oprgb 63 63 63, paintrect 10 10 $1 110, oprgb 127 127 127, linesegment $1 10 $1 110, penmode 0"
                                }
                              },
                              {
                                "box": {
                                  "fontname": "Arial",
                                  "fontsize": 12.0,
                                  "id": "obj-21",
                                  "maxclass": "newobj",
                                  "numinlets": 1,
                                  "numoutlets": 1,
                                  "outlettype": [
                                    "bang"
                                  ],
                                  "patching_rect": [
                                    863.0,
                                    229.0,
                                    56.0,
                                    19.0
                                  ],
                                  "text": "loadbang"
                                }
                              },
                              {
                                "box": {
                                  "fontname": "Arial",
                                  "fontsize": 12.0,
                                  "id": "obj-22",
                                  "maxclass": "message",
                                  "numinlets": 2,
                                  "numoutlets": 1,
                                  "outlettype": [
                                    ""
                                  ],
                                  "patching_rect": [
                                    201.0,
                                    221.0,
                                    99.0,
                                    17.0
                                  ],
                                  "text": "frgb 255 255 255"
                                }
                              },
                              {
                                "box": {
                                  "fontname": "Arial",
                                  "fontsize": 12.0,
                                  "id": "obj-23",
                                  "linecount": 5,
                                  "maxclass": "message",
                                  "numinlets": 2,
                                  "numoutlets": 1,
                                  "outlettype": [
                                    ""
                                  ],
                                  "patching_rect": [
                                    406.0,
                                    266.0,
                                    604.0,
                                    65.0
                                  ],
                                  "text": "brgb 0 0 63, clear, penmode 32, oprgb 63 63 63, frgb 127 182 255, linesegment 0 110 600 110, linesegment 0 10 600 10, linesegment 10 0 10 200, linesegment 110 0 110 200, linesegment 210 0 210 200, linesegment 310 0 310 200, linesegment 410 0 410 200, linesegment 510 0 510 200, frgb 63 91 127, font Arial 10, moveto 10 120, write \" 0.\", moveto 110 120, write \" 1.\", moveto 210 120, write \" 2.\", moveto 310 120, write \" 3.\", moveto 410 120, write \" 4.\", moveto 510 120, write \" 5.\", frgb 255 255 255"
                                }
                              },
                              {
                                "box": {
                                  "fontname": "Arial",
                                  "fontsize": 12.0,
                                  "frgb": 0.0,
                                  "id": "obj-24",
                                  "maxclass": "comment",
                                  "numinlets": 1,
                                  "numoutlets": 0,
                                  "patching_rect": [
                                    447.0,
                                    361.0,
                                    114.0,
                                    19.0
                                  ],
                                  "text": "background and grid"
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
                                    "obj-10",
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
                                    "obj-11",
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
                                    "obj-12",
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
                                    "obj-6",
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
                                    "obj-14",
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
                                    "obj-14",
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
                                    "obj-17",
                                    6
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
                                    "obj-17",
                                    2
                                  ]
                                }
                              },
                              {
                                "patchline": {
                                  "destination": [
                                    "obj-23",
                                    0
                                  ],
                                  "disabled": 0,
                                  "hidden": 0,
                                  "source": [
                                    "obj-17",
                                    7
                                  ]
                                }
                              },
                              {
                                "patchline": {
                                  "destination": [
                                    "obj-9",
                                    1
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
                                    "obj-17",
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
                                    "obj-7",
                                    0
                                  ],
                                  "disabled": 0,
                                  "hidden": 0,
                                  "source": [
                                    "obj-19",
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
                                  "destination": [
                                    "obj-6",
                                    0
                                  ],
                                  "disabled": 0,
                                  "hidden": 0,
                                  "source": [
                                    "obj-20",
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
                                  "disabled": 0,
                                  "hidden": 0,
                                  "source": [
                                    "obj-21",
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
                                  "disabled": 0,
                                  "hidden": 0,
                                  "source": [
                                    "obj-22",
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
                                  "disabled": 0,
                                  "hidden": 0,
                                  "source": [
                                    "obj-23",
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
                                    "obj-1",
                                    0
                                  ],
                                  "disabled": 0,
                                  "hidden": 0,
                                  "source": [
                                    "obj-4",
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
                                    "obj-12",
                                    1
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
                                    "obj-15",
                                    0
                                  ],
                                  "disabled": 0,
                                  "hidden": 0,
                                  "midpoints": [
                                    79.5,
                                    199.0,
                                    79.5,
                                    199.0
                                  ],
                                  "source": [
                                    "obj-9",
                                    0
                                  ]
                                }
                              }
                            ]
                          },
                          "patching_rect": [
                            45.0,
                            595.0,
                            59.5,
                            19.0
                          ],
                          "saved_object_attributes": {
                            "default_fontface": 0,
                            "default_fontname": "Arial",
                            "default_fontsize": 12.0,
                            "description": "",
                            "digest": "",
                            "fontface": 0,
                            "fontname": "Arial",
                            "fontsize": 12.0,
                            "globalpatchername": "",
                            "tags": ""
                          },
                          "text": "p draw"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-32",
                          "maxclass": "newobj",
                          "numinlets": 3,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            469.0,
                            445.923065,
                            215.0,
                            19.0
                          ],
                          "text": "expr pow(10\\, ($f1 - $f3) * $f2 * 0.05)"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-33",
                          "maxclass": "newobj",
                          "numinlets": 3,
                          "numoutlets": 2,
                          "outlettype": [
                            "float",
                            "float"
                          ],
                          "patching_rect": [
                            65.0,
                            349.153839,
                            58.0,
                            19.0
                          ],
                          "text": "split 0. 1."
                        }
                      },
                      {
                        "box": {
                          "comment": "center attenuation in dB",
                          "id": "obj-34",
                          "maxclass": "inlet",
                          "numinlets": 0,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            770.0,
                            31.0,
                            25.0,
                            25.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "comment": "attenutation curve",
                          "id": "obj-35",
                          "maxclass": "inlet",
                          "numinlets": 0,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            679.0,
                            31.0,
                            25.0,
                            25.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "comment": "dB decrease per unit",
                          "id": "obj-36",
                          "maxclass": "inlet",
                          "numinlets": 0,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            206.0,
                            31.0,
                            25.0,
                            25.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "comment": "",
                          "id": "obj-37",
                          "maxclass": "outlet",
                          "numinlets": 1,
                          "numoutlets": 0,
                          "patching_rect": [
                            45.0,
                            626.384644,
                            25.0,
                            25.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "frgb": 0.0,
                          "id": "obj-38",
                          "maxclass": "comment",
                          "numinlets": 1,
                          "numoutlets": 0,
                          "patching_rect": [
                            288.0,
                            291.615387,
                            63.0,
                            19.0
                          ],
                          "text": "dB to amp"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "frgb": 0.0,
                          "id": "obj-39",
                          "maxclass": "comment",
                          "numinlets": 1,
                          "numoutlets": 0,
                          "patching_rect": [
                            176.0,
                            196.153854,
                            68.0,
                            19.0
                          ],
                          "text": "center_size",
                          "textcolor": [
                            0.6,
                            0.4,
                            0.6,
                            1.0
                          ]
                        }
                      }
                    ],
                    "lines": [
                      {
                        "patchline": {
                          "destination": [
                            "obj-12",
                            1
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
                            "obj-25",
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
                            "obj-31",
                            1
                          ],
                          "disabled": 0,
                          "hidden": 0,
                          "midpoints": [
                            682.5,
                            551.846191,
                            68.0,
                            551.846191
                          ],
                          "source": [
                            "obj-12",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "color": [
                            0.6,
                            0.4,
                            0.6,
                            1.0
                          ],
                          "destination": [
                            "obj-11",
                            1
                          ],
                          "disabled": 0,
                          "hidden": 0,
                          "midpoints": [
                            80.0,
                            213.153839,
                            167.5,
                            213.153839
                          ],
                          "source": [
                            "obj-13",
                            1
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "color": [
                            0.6,
                            0.4,
                            0.6,
                            1.0
                          ],
                          "destination": [
                            "obj-12",
                            2
                          ],
                          "disabled": 0,
                          "hidden": 0,
                          "midpoints": [
                            80.0,
                            213.153839,
                            827.5,
                            213.153839
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
                            "obj-26",
                            0
                          ],
                          "disabled": 0,
                          "hidden": 0,
                          "midpoints": [
                            66.5,
                            181.769226,
                            54.5,
                            181.769226
                          ],
                          "source": [
                            "obj-13",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "color": [
                            0.6667,
                            0.6667,
                            0.6667,
                            1.0
                          ],
                          "destination": [
                            "obj-31",
                            3
                          ],
                          "disabled": 0,
                          "hidden": 0,
                          "midpoints": [
                            80.0,
                            489.076935,
                            95.0,
                            489.076935
                          ],
                          "source": [
                            "obj-13",
                            1
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "color": [
                            0.6,
                            0.4,
                            0.6,
                            1.0
                          ],
                          "destination": [
                            "obj-32",
                            2
                          ],
                          "disabled": 0,
                          "hidden": 0,
                          "midpoints": [
                            80.0,
                            213.153839,
                            674.5,
                            213.153839
                          ],
                          "source": [
                            "obj-13",
                            1
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "color": [
                            0.6,
                            0.4,
                            0.6,
                            1.0
                          ],
                          "destination": [
                            "obj-33",
                            2
                          ],
                          "disabled": 0,
                          "hidden": 0,
                          "midpoints": [
                            80.0,
                            244.538467,
                            113.5,
                            244.538467
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
                            "obj-16",
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
                            "obj-1",
                            0
                          ],
                          "disabled": 0,
                          "hidden": 0,
                          "source": [
                            "obj-16",
                            1
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-26",
                            0
                          ],
                          "disabled": 0,
                          "hidden": 0,
                          "midpoints": [
                            684.5,
                            181.769226,
                            54.5,
                            181.769226
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
                          "disabled": 0,
                          "hidden": 0,
                          "midpoints": [
                            855.0,
                            245.846161,
                            414.5,
                            245.846161
                          ],
                          "source": [
                            "obj-17",
                            1
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-26",
                            0
                          ],
                          "disabled": 0,
                          "hidden": 0,
                          "midpoints": [
                            841.5,
                            181.769226,
                            54.5,
                            181.769226
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
                            "obj-42",
                            0
                          ],
                          "disabled": 0,
                          "hidden": 0,
                          "midpoints": [
                            855.0,
                            475.346161,
                            849.5,
                            475.346161
                          ],
                          "source": [
                            "obj-17",
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
                            "obj-3",
                            0
                          ],
                          "disabled": 0,
                          "hidden": 0,
                          "source": [
                            "obj-19",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-25",
                            2
                          ],
                          "disabled": 0,
                          "hidden": 0,
                          "source": [
                            "obj-20",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-32",
                            1
                          ],
                          "disabled": 0,
                          "hidden": 0,
                          "source": [
                            "obj-21",
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
                          "disabled": 0,
                          "hidden": 0,
                          "source": [
                            "obj-22",
                            1
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-26",
                            0
                          ],
                          "disabled": 0,
                          "hidden": 0,
                          "midpoints": [
                            249.5,
                            181.769226,
                            54.5,
                            181.769226
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
                            "obj-25",
                            1
                          ],
                          "disabled": 0,
                          "hidden": 0,
                          "source": [
                            "obj-23",
                            1
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-26",
                            0
                          ],
                          "disabled": 0,
                          "hidden": 0,
                          "midpoints": [
                            158.5,
                            181.769226,
                            54.5,
                            181.769226
                          ],
                          "source": [
                            "obj-23",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-21",
                            0
                          ],
                          "disabled": 0,
                          "hidden": 0,
                          "source": [
                            "obj-24",
                            1
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-26",
                            0
                          ],
                          "disabled": 0,
                          "hidden": 0,
                          "midpoints": [
                            491.5,
                            181.769226,
                            54.5,
                            181.769226
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
                            "obj-41",
                            1
                          ],
                          "disabled": 0,
                          "hidden": 0,
                          "source": [
                            "obj-25",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-30",
                            0
                          ],
                          "disabled": 0,
                          "hidden": 0,
                          "source": [
                            "obj-26",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-31",
                            2
                          ],
                          "disabled": 0,
                          "hidden": 0,
                          "source": [
                            "obj-26",
                            1
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-33",
                            0
                          ],
                          "disabled": 0,
                          "hidden": 0,
                          "source": [
                            "obj-27",
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
                          "disabled": 0,
                          "hidden": 0,
                          "source": [
                            "obj-28",
                            1
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-31",
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
                            "obj-43",
                            0
                          ],
                          "disabled": 0,
                          "hidden": 0,
                          "source": [
                            "obj-28",
                            1
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-28",
                            0
                          ],
                          "disabled": 0,
                          "hidden": 0,
                          "source": [
                            "obj-29",
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
                            "obj-32",
                            0
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
                            "obj-40",
                            0
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
                            "obj-29",
                            0
                          ],
                          "disabled": 0,
                          "hidden": 0,
                          "source": [
                            "obj-30",
                            2
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-37",
                            0
                          ],
                          "disabled": 0,
                          "hidden": 0,
                          "source": [
                            "obj-31",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-31",
                            1
                          ],
                          "disabled": 0,
                          "hidden": 0,
                          "midpoints": [
                            478.5,
                            545.307678,
                            68.0,
                            545.307678
                          ],
                          "source": [
                            "obj-32",
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
                            "obj-33",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "color": [
                            0.611765,
                            0.701961,
                            1.0,
                            1.0
                          ],
                          "destination": [
                            "obj-3",
                            1
                          ],
                          "disabled": 0,
                          "hidden": 0,
                          "midpoints": [
                            113.5,
                            380.538452,
                            447.5,
                            380.538452
                          ],
                          "source": [
                            "obj-33",
                            1
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
                            "obj-34",
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
                          "disabled": 0,
                          "hidden": 0,
                          "source": [
                            "obj-35",
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
                          "disabled": 0,
                          "hidden": 0,
                          "source": [
                            "obj-36",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-31",
                            1
                          ],
                          "disabled": 0,
                          "hidden": 0,
                          "midpoints": [
                            414.5,
                            581.269226,
                            68.0,
                            581.269226
                          ],
                          "source": [
                            "obj-40",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-31",
                            1
                          ],
                          "disabled": 0,
                          "hidden": 0,
                          "source": [
                            "obj-41",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-41",
                            0
                          ],
                          "disabled": 0,
                          "hidden": 0,
                          "midpoints": [
                            849.5,
                            508.692322,
                            71.5,
                            508.692322
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
                            "obj-41",
                            2
                          ],
                          "disabled": 0,
                          "hidden": 0,
                          "source": [
                            "obj-43",
                            0
                          ]
                        }
                      }
                    ]
                  },
                  "patching_rect": [
                    88.0,
                    228.504852,
                    440.0,
                    19.0
                  ],
                  "saved_object_attributes": {
                    "default_fontface": 0,
                    "default_fontname": "Arial",
                    "default_fontsize": 12.0,
                    "description": "",
                    "digest": "",
                    "fontface": 0,
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "globalpatchername": "",
                    "tags": ""
                  },
                  "text": "p distance_attenuation_drawing",
                  "textcolor": [
                    0.360784,
                    0.341176,
                    0.321569,
                    1.0
                  ]
                }
              },
              {
                "box": {
                  "id": "obj-50",
                  "ignoreclick": 1,
                  "maxclass": "lcd",
                  "numinlets": 1,
                  "numoutlets": 4,
                  "outlettype": [
                    "list",
                    "list",
                    "int",
                    ""
                  ],
                  "patching_rect": [
                    88.0,
                    256.825226,
                    534.0,
                    129.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    74.0,
                    26.825241,
                    534.0,
                    129.0
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
                    23.0,
                    65.0,
                    25.0,
                    25.0
                  ]
                }
              },
              {
                "box": {
                  "id": "obj-4",
                  "maxclass": "panel",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    310.0,
                    298.0,
                    128.0,
                    128.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    1.0,
                    -1.0,
                    613.0,
                    185.0
                  ]
                }
              }
            ],
            "lines": [
              {
                "patchline": {
                  "destination": [
                    "obj-5",
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
                    "obj-5",
                    1
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
                    "obj-9",
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
                    "obj-30",
                    0
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
                    "obj-22",
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
                    "obj-33",
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
                    "obj-24",
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
                    "obj-48",
                    5
                  ],
                  "disabled": 0,
                  "hidden": 0,
                  "source": [
                    "obj-16",
                    2
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-48",
                    4
                  ],
                  "disabled": 0,
                  "hidden": 0,
                  "source": [
                    "obj-16",
                    1
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-48",
                    3
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
                    "obj-11",
                    0
                  ],
                  "disabled": 0,
                  "hidden": 0,
                  "source": [
                    "obj-18",
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
                    "obj-20",
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
                    "obj-21",
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
                    "obj-16",
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
                  "destination": [
                    "obj-27",
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
                    "obj-22",
                    0
                  ],
                  "disabled": 0,
                  "hidden": 0,
                  "source": [
                    "obj-20",
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
                    "obj-21",
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
                  "disabled": 0,
                  "hidden": 0,
                  "source": [
                    "obj-22",
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
                  "disabled": 0,
                  "hidden": 0,
                  "source": [
                    "obj-24",
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
                  "disabled": 0,
                  "hidden": 0,
                  "source": [
                    "obj-24",
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
                  "disabled": 0,
                  "hidden": 0,
                  "source": [
                    "obj-27",
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
                    "obj-3",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-48",
                    2
                  ],
                  "disabled": 0,
                  "hidden": 0,
                  "source": [
                    "obj-33",
                    2
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-48",
                    1
                  ],
                  "disabled": 0,
                  "hidden": 0,
                  "source": [
                    "obj-33",
                    1
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-48",
                    0
                  ],
                  "disabled": 0,
                  "hidden": 0,
                  "source": [
                    "obj-33",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-50",
                    0
                  ],
                  "disabled": 0,
                  "hidden": 1,
                  "midpoints": [
                    97.5,
                    254.665039,
                    97.5,
                    254.665039
                  ],
                  "source": [
                    "obj-48",
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
                    "obj-5",
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
                  "disabled": 0,
                  "hidden": 0,
                  "midpoints": [
                    162.5,
                    136.5,
                    363.5,
                    136.5
                  ],
                  "source": [
                    "obj-5",
                    1
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
                    "obj-6",
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
                  "disabled": 0,
                  "hidden": 0,
                  "source": [
                    "obj-6",
                    1
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-30",
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
                    "obj-5",
                    1
                  ],
                  "disabled": 0,
                  "hidden": 0,
                  "source": [
                    "obj-9",
                    0
                  ]
                }
              }
            ]
          },
          "patching_rect": [
            61.0,
            317.0,
            58.0,
            19.0
          ],
          "saved_object_attributes": {
            "default_fontface": 0,
            "default_fontname": "Arial",
            "default_fontsize": 12.0,
            "description": "",
            "digest": "",
            "fontface": 0,
            "fontname": "Arial",
            "fontsize": 12.0,
            "globalpatchername": "",
            "tags": ""
          },
          "text": "p plotting"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-18",
          "maxclass": "textbutton",
          "numinlets": 1,
          "numoutlets": 3,
          "outlettype": [
            "",
            "",
            "int"
          ],
          "parameter_enable": 0,
          "patching_rect": [
            61.0,
            245.0,
            52.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            270.0,
            77.0,
            27.0,
            18.0
          ],
          "rounded": 8.0,
          "text": "plot"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-16",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 3,
          "outlettype": [
            "",
            "",
            ""
          ],
          "patching_rect": [
            427.0,
            116.0,
            587.0,
            19.0
          ],
          "text": "j.remote 32"
        }
      },
      {
        "box": {
          "annotation": "max. attenuation inside the center area in dB",
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-47",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "parameter_enable": 0,
          "patching_rect": [
            441.0,
            354.0,
            50.0,
            19.0
          ],
          "presentation": 1,
          "presentation_rect": [
            220.0,
            77.0,
            35.0,
            19.0
          ],
          "triangle": 0
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-48",
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
            496.0,
            341.0,
            502.0,
            43.0
          ],
          "text": "j.remote center/decay",
          "varname": "destination/voices[4]"
        }
      },
      {
        "box": {
          "annotation": "curvature of the distance function inside the center area",
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-45",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "parameter_enable": 0,
          "patching_rect": [
            442.0,
            311.0,
            50.0,
            19.0
          ],
          "presentation": 1,
          "presentation_rect": [
            151.0,
            77.0,
            32.0,
            19.0
          ],
          "triangle": 0
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-46",
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
            497.0,
            305.0,
            499.0,
            31.0
          ],
          "text": "j.remote center/curve",
          "varname": "destination/voices[3]"
        }
      },
      {
        "box": {
          "annotation": "Size of the center (in model units)",
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-44",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "parameter_enable": 0,
          "patching_rect": [
            441.0,
            278.0,
            50.0,
            19.0
          ],
          "presentation": 1,
          "presentation_rect": [
            79.0,
            77.0,
            33.0,
            19.0
          ],
          "triangle": 0
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-34",
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
            496.0,
            272.0,
            420.0,
            31.0
          ],
          "text": "j.remote center/size",
          "varname": "destination/voices[1]"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-15",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            426.0,
            252.0,
            53.0,
            19.0
          ],
          "text": "deferlow"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-17",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            426.0,
            230.0,
            55.0,
            19.0
          ],
          "text": "qlim 300"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-14",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patcher": {
            "fileversion": 1,
            "appversion": {
              "major": 6,
              "minor": 0,
              "revision": 8
            },
            "openrect": [
              5.0,
              44.0,
              581.0,
              488.0
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
            "toolbarvisible": 0,
            "boxanimatetime": 200,
            "imprint": 0,
            "enablehscroll": 1,
            "enablevscroll": 1,
            "devicewidth": 0.0,
            "description": "",
            "digest": "",
            "tags": "",
            "title": "Speaker setup",
            "boxes": [
              {
                "box": {
                  "comment": "",
                  "hidden": 1,
                  "id": "obj-63",
                  "maxclass": "inlet",
                  "numinlets": 0,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    820.0,
                    9.0,
                    25.0,
                    25.0
                  ]
                }
              },
              {
                "box": {
                  "defaultvalue": 100.0,
                  "id": "obj-62",
                  "maxclass": "j.textslider",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    775.0,
                    99.0,
                    56.0,
                    23.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    364.0,
                    35.0,
                    73.0,
                    28.0
                  ],
                  "range": [
                    0.0,
                    127.0
                  ],
                  "text": "gain",
                  "textpos": [
                    4.0,
                    6.0
                  ],
                  "varname": "gain_mic"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "frgb": 0.0,
                  "hidden": 1,
                  "id": "obj-59",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    601.0,
                    159.0,
                    87.0,
                    19.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    739.0,
                    4.0,
                    82.0,
                    19.0
                  ],
                  "text": "distance Mode",
                  "varname": "d2"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "frgb": 0.0,
                  "hidden": 1,
                  "id": "obj-60",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    601.0,
                    144.0,
                    87.0,
                    19.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    703.0,
                    4.0,
                    37.0,
                    19.0
                  ],
                  "text": "order",
                  "varname": "o2"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "hint": "order",
                  "id": "obj-26",
                  "maxclass": "number",
                  "maximum": 3,
                  "minimum": 1,
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "int",
                    "bang"
                  ],
                  "parameter_enable": 0,
                  "patching_rect": [
                    785.0,
                    131.0,
                    50.0,
                    19.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    262.0,
                    40.0,
                    33.0,
                    19.0
                  ],
                  "triangle": 0
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-55",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patcher": {
                    "fileversion": 1,
                    "appversion": {
                      "major": 6,
                      "minor": 0,
                      "revision": 8
                    },
                    "rect": [
                      50.0,
                      94.0,
                      640.0,
                      480.0
                    ],
                    "bglocked": 0,
                    "openinpresentation": 0,
                    "default_fontsize": 12.0,
                    "default_fontface": 0,
                    "default_fontname": "Arial",
                    "gridonopen": 0,
                    "gridsize": [
                      15.0,
                      15.0
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
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-38",
                          "maxclass": "message",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            205.0,
                            166.0,
                            200.0,
                            17.0
                          ],
                          "text": "script hide daFact, script show dBunit"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-43",
                          "maxclass": "message",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            127.0,
                            144.0,
                            200.0,
                            17.0
                          ],
                          "text": "script show daFact, script hide dBunit"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-50",
                          "maxclass": "message",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            52.0,
                            122.0,
                            195.0,
                            17.0
                          ],
                          "text": "script hide daFact, script hide dBunit"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-52",
                          "maxclass": "newobj",
                          "numinlets": 4,
                          "numoutlets": 4,
                          "outlettype": [
                            "bang",
                            "bang",
                            "bang",
                            ""
                          ],
                          "patching_rect": [
                            50.0,
                            100.0,
                            250.5,
                            19.0
                          ],
                          "text": "sel 0 2 1"
                        }
                      },
                      {
                        "box": {
                          "comment": "",
                          "id": "obj-53",
                          "maxclass": "inlet",
                          "numinlets": 0,
                          "numoutlets": 1,
                          "outlettype": [
                            "int"
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
                          "id": "obj-54",
                          "maxclass": "outlet",
                          "numinlets": 1,
                          "numoutlets": 0,
                          "patching_rect": [
                            123.0,
                            243.0,
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
                            "obj-54",
                            0
                          ],
                          "disabled": 0,
                          "hidden": 0,
                          "source": [
                            "obj-38",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-54",
                            0
                          ],
                          "disabled": 0,
                          "hidden": 0,
                          "source": [
                            "obj-43",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-54",
                            0
                          ],
                          "disabled": 0,
                          "hidden": 0,
                          "source": [
                            "obj-50",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-38",
                            0
                          ],
                          "disabled": 0,
                          "hidden": 0,
                          "source": [
                            "obj-52",
                            2
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-43",
                            0
                          ],
                          "disabled": 0,
                          "hidden": 0,
                          "source": [
                            "obj-52",
                            1
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-50",
                            0
                          ],
                          "disabled": 0,
                          "hidden": 0,
                          "source": [
                            "obj-52",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-52",
                            0
                          ],
                          "disabled": 0,
                          "hidden": 0,
                          "source": [
                            "obj-53",
                            0
                          ]
                        }
                      }
                    ]
                  },
                  "patching_rect": [
                    853.0,
                    287.0,
                    69.0,
                    19.0
                  ],
                  "saved_object_attributes": {
                    "default_fontface": 0,
                    "default_fontname": "Arial",
                    "default_fontsize": 12.0,
                    "description": "",
                    "digest": "",
                    "fontface": 0,
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "globalpatchername": "",
                    "tags": ""
                  },
                  "text": "p hide&how"
                }
              },
              {
                "box": {
                  "arrow": 0,
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "hint": "distance Model",
                  "id": "obj-44",
                  "items": [
                    "Off",
                    ",",
                    "Exponential",
                    "Decay",
                    ",",
                    "Inverse",
                    "Proportional",
                    "Decay"
                  ],
                  "maxclass": "umenu",
                  "numinlets": 1,
                  "numoutlets": 3,
                  "outlettype": [
                    "int",
                    "",
                    ""
                  ],
                  "parameter_enable": 0,
                  "patching_rect": [
                    852.0,
                    208.0,
                    38.0,
                    19.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    297.0,
                    40.0,
                    31.0,
                    19.0
                  ],
                  "truncate": 0
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "hidden": 1,
                  "hint": "daFact",
                  "id": "obj-46",
                  "maxclass": "flonum",
                  "maximum": 100.0,
                  "minimum": 0.0,
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "float",
                    "bang"
                  ],
                  "parameter_enable": 0,
                  "patching_rect": [
                    808.0,
                    180.0,
                    50.0,
                    19.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    328.0,
                    40.0,
                    34.0,
                    19.0
                  ],
                  "triangle": 0,
                  "varname": "daFact"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "hidden": 1,
                  "hint": "dBUnit",
                  "id": "obj-47",
                  "maxclass": "flonum",
                  "maximum": 100.0,
                  "minimum": 0.0,
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "float",
                    "bang"
                  ],
                  "parameter_enable": 0,
                  "patching_rect": [
                    798.0,
                    159.0,
                    50.0,
                    19.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    328.0,
                    40.0,
                    34.0,
                    19.0
                  ],
                  "triangle": 0,
                  "varname": "dBunit"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-49",
                  "maxclass": "newobj",
                  "numinlets": 6,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patcher": {
                    "fileversion": 1,
                    "appversion": {
                      "major": 6,
                      "minor": 0,
                      "revision": 8
                    },
                    "rect": [
                      410.0,
                      236.0,
                      615.0,
                      275.0
                    ],
                    "bglocked": 0,
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
                          "comment": "",
                          "id": "obj-6",
                          "maxclass": "inlet",
                          "numinlets": 0,
                          "numoutlets": 1,
                          "outlettype": [
                            "int"
                          ],
                          "patching_rect": [
                            282.0,
                            40.0,
                            25.0,
                            25.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-7",
                          "maxclass": "newobj",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patcher": {
                            "fileversion": 1,
                            "appversion": {
                              "major": 6,
                              "minor": 0,
                              "revision": 8
                            },
                            "rect": [
                              714.0,
                              302.0,
                              294.0,
                              211.0
                            ],
                            "bglocked": 0,
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
                                  "comment": "",
                                  "id": "obj-10",
                                  "maxclass": "inlet",
                                  "numinlets": 0,
                                  "numoutlets": 1,
                                  "outlettype": [
                                    ""
                                  ],
                                  "patching_rect": [
                                    251.0,
                                    8.0,
                                    25.0,
                                    25.0
                                  ]
                                }
                              },
                              {
                                "box": {
                                  "fontname": "Arial",
                                  "fontsize": 12.0,
                                  "id": "obj-8",
                                  "maxclass": "newobj",
                                  "numinlets": 1,
                                  "numoutlets": 1,
                                  "outlettype": [
                                    ""
                                  ],
                                  "patching_rect": [
                                    37.0,
                                    120.0,
                                    125.0,
                                    20.0
                                  ],
                                  "text": "tosymbol @separator"
                                }
                              },
                              {
                                "box": {
                                  "fontname": "Arial",
                                  "fontsize": 12.0,
                                  "id": "obj-7",
                                  "maxclass": "newobj",
                                  "numinlets": 1,
                                  "numoutlets": 1,
                                  "outlettype": [
                                    ""
                                  ],
                                  "patching_rect": [
                                    185.0,
                                    121.0,
                                    74.0,
                                    20.0
                                  ],
                                  "text": "prepend set"
                                }
                              },
                              {
                                "box": {
                                  "fontname": "Arial",
                                  "fontsize": 12.0,
                                  "id": "obj-6",
                                  "maxclass": "message",
                                  "numinlets": 2,
                                  "numoutlets": 1,
                                  "outlettype": [
                                    ""
                                  ],
                                  "patching_rect": [
                                    37.0,
                                    98.0,
                                    151.0,
                                    18.0
                                  ],
                                  "text": "source. $1 /distance/mode"
                                }
                              },
                              {
                                "box": {
                                  "fontname": "Arial",
                                  "fontsize": 12.0,
                                  "id": "obj-4",
                                  "maxclass": "newobj",
                                  "numinlets": 1,
                                  "numoutlets": 1,
                                  "outlettype": [
                                    ""
                                  ],
                                  "patching_rect": [
                                    10.0,
                                    150.0,
                                    61.0,
                                    20.0
                                  ],
                                  "text": "append 0"
                                }
                              },
                              {
                                "box": {
                                  "comment": "",
                                  "id": "obj-9",
                                  "maxclass": "outlet",
                                  "numinlets": 1,
                                  "numoutlets": 0,
                                  "patching_rect": [
                                    10.0,
                                    176.0,
                                    25.0,
                                    25.0
                                  ]
                                }
                              },
                              {
                                "box": {
                                  "fontname": "Arial",
                                  "fontsize": 12.0,
                                  "id": "obj-3",
                                  "maxclass": "newobj",
                                  "numinlets": 1,
                                  "numoutlets": 2,
                                  "outlettype": [
                                    "bang",
                                    "int"
                                  ],
                                  "patching_rect": [
                                    10.0,
                                    43.0,
                                    32.5,
                                    20.0
                                  ],
                                  "text": "t b i"
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
                                    "int"
                                  ],
                                  "patching_rect": [
                                    10.0,
                                    8.0,
                                    25.0,
                                    25.0
                                  ]
                                }
                              },
                              {
                                "box": {
                                  "fontname": "Arial",
                                  "fontsize": 12.0,
                                  "id": "obj-28",
                                  "maxclass": "newobj",
                                  "numinlets": 2,
                                  "numoutlets": 3,
                                  "outlettype": [
                                    "bang",
                                    "bang",
                                    "int"
                                  ],
                                  "patching_rect": [
                                    10.0,
                                    75.0,
                                    46.0,
                                    19.0
                                  ],
                                  "text": "uzi 1 1"
                                }
                              }
                            ],
                            "lines": [
                              {
                                "patchline": {
                                  "destination": [
                                    "obj-3",
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
                                    "obj-28",
                                    1
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
                                    "obj-6",
                                    0
                                  ],
                                  "disabled": 0,
                                  "hidden": 0,
                                  "source": [
                                    "obj-28",
                                    2
                                  ]
                                }
                              },
                              {
                                "patchline": {
                                  "destination": [
                                    "obj-28",
                                    0
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
                                    "obj-7",
                                    0
                                  ],
                                  "disabled": 0,
                                  "hidden": 0,
                                  "midpoints": [
                                    33.0,
                                    68.5,
                                    194.5,
                                    68.5
                                  ],
                                  "source": [
                                    "obj-3",
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
                                  "disabled": 0,
                                  "hidden": 0,
                                  "source": [
                                    "obj-4",
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
                                  "disabled": 0,
                                  "hidden": 0,
                                  "source": [
                                    "obj-6",
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
                                  "disabled": 0,
                                  "hidden": 0,
                                  "midpoints": [
                                    194.5,
                                    145.0,
                                    19.5,
                                    145.0
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
                                  "disabled": 0,
                                  "hidden": 0,
                                  "source": [
                                    "obj-8",
                                    0
                                  ]
                                }
                              }
                            ]
                          },
                          "patching_rect": [
                            282.0,
                            100.0,
                            65.0,
                            19.0
                          ],
                          "saved_object_attributes": {
                            "default_fontface": 0,
                            "default_fontname": "Arial",
                            "default_fontsize": 12.0,
                            "description": "",
                            "digest": "",
                            "fontface": 0,
                            "fontname": "Arial",
                            "fontsize": 12.0,
                            "globalpatchername": "",
                            "tags": ""
                          },
                          "text": "p distMode"
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
                            482.0,
                            39.0,
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
                            "int"
                          ],
                          "patching_rect": [
                            100.0,
                            40.0,
                            25.0,
                            25.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-4",
                          "maxclass": "newobj",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patcher": {
                            "fileversion": 1,
                            "appversion": {
                              "major": 6,
                              "minor": 0,
                              "revision": 8
                            },
                            "rect": [
                              714.0,
                              302.0,
                              294.0,
                              211.0
                            ],
                            "bglocked": 0,
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
                                  "comment": "",
                                  "id": "obj-10",
                                  "maxclass": "inlet",
                                  "numinlets": 0,
                                  "numoutlets": 1,
                                  "outlettype": [
                                    ""
                                  ],
                                  "patching_rect": [
                                    251.0,
                                    8.0,
                                    25.0,
                                    25.0
                                  ]
                                }
                              },
                              {
                                "box": {
                                  "fontname": "Arial",
                                  "fontsize": 12.0,
                                  "id": "obj-8",
                                  "maxclass": "newobj",
                                  "numinlets": 1,
                                  "numoutlets": 1,
                                  "outlettype": [
                                    ""
                                  ],
                                  "patching_rect": [
                                    37.0,
                                    120.0,
                                    125.0,
                                    20.0
                                  ],
                                  "text": "tosymbol @separator"
                                }
                              },
                              {
                                "box": {
                                  "fontname": "Arial",
                                  "fontsize": 12.0,
                                  "id": "obj-7",
                                  "maxclass": "newobj",
                                  "numinlets": 1,
                                  "numoutlets": 1,
                                  "outlettype": [
                                    ""
                                  ],
                                  "patching_rect": [
                                    162.0,
                                    121.0,
                                    74.0,
                                    20.0
                                  ],
                                  "text": "prepend set"
                                }
                              },
                              {
                                "box": {
                                  "fontname": "Arial",
                                  "fontsize": 12.0,
                                  "id": "obj-6",
                                  "maxclass": "message",
                                  "numinlets": 2,
                                  "numoutlets": 1,
                                  "outlettype": [
                                    ""
                                  ],
                                  "patching_rect": [
                                    37.0,
                                    98.0,
                                    101.0,
                                    18.0
                                  ],
                                  "text": "source. $1 /order"
                                }
                              },
                              {
                                "box": {
                                  "fontname": "Arial",
                                  "fontsize": 12.0,
                                  "id": "obj-4",
                                  "maxclass": "newobj",
                                  "numinlets": 1,
                                  "numoutlets": 1,
                                  "outlettype": [
                                    ""
                                  ],
                                  "patching_rect": [
                                    10.0,
                                    150.0,
                                    64.0,
                                    20.0
                                  ],
                                  "text": "append 0."
                                }
                              },
                              {
                                "box": {
                                  "comment": "",
                                  "id": "obj-9",
                                  "maxclass": "outlet",
                                  "numinlets": 1,
                                  "numoutlets": 0,
                                  "patching_rect": [
                                    10.0,
                                    176.0,
                                    25.0,
                                    25.0
                                  ]
                                }
                              },
                              {
                                "box": {
                                  "fontname": "Arial",
                                  "fontsize": 12.0,
                                  "id": "obj-3",
                                  "maxclass": "newobj",
                                  "numinlets": 1,
                                  "numoutlets": 2,
                                  "outlettype": [
                                    "bang",
                                    "float"
                                  ],
                                  "patching_rect": [
                                    10.0,
                                    43.0,
                                    32.5,
                                    20.0
                                  ],
                                  "text": "t b f"
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
                                    "int"
                                  ],
                                  "patching_rect": [
                                    10.0,
                                    8.0,
                                    25.0,
                                    25.0
                                  ]
                                }
                              },
                              {
                                "box": {
                                  "fontname": "Arial",
                                  "fontsize": 12.0,
                                  "id": "obj-28",
                                  "maxclass": "newobj",
                                  "numinlets": 2,
                                  "numoutlets": 3,
                                  "outlettype": [
                                    "bang",
                                    "bang",
                                    "int"
                                  ],
                                  "patching_rect": [
                                    10.0,
                                    75.0,
                                    46.0,
                                    19.0
                                  ],
                                  "text": "uzi 1 1"
                                }
                              }
                            ],
                            "lines": [
                              {
                                "patchline": {
                                  "destination": [
                                    "obj-3",
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
                                    "obj-28",
                                    1
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
                                    "obj-6",
                                    0
                                  ],
                                  "disabled": 0,
                                  "hidden": 0,
                                  "source": [
                                    "obj-28",
                                    2
                                  ]
                                }
                              },
                              {
                                "patchline": {
                                  "destination": [
                                    "obj-28",
                                    0
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
                                    "obj-7",
                                    0
                                  ],
                                  "disabled": 0,
                                  "hidden": 0,
                                  "midpoints": [
                                    33.0,
                                    68.5,
                                    171.5,
                                    68.5
                                  ],
                                  "source": [
                                    "obj-3",
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
                                  "disabled": 0,
                                  "hidden": 0,
                                  "source": [
                                    "obj-4",
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
                                  "disabled": 0,
                                  "hidden": 0,
                                  "source": [
                                    "obj-6",
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
                                  "disabled": 0,
                                  "hidden": 0,
                                  "midpoints": [
                                    171.5,
                                    145.0,
                                    19.5,
                                    145.0
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
                                  "disabled": 0,
                                  "hidden": 0,
                                  "source": [
                                    "obj-8",
                                    0
                                  ]
                                }
                              }
                            ]
                          },
                          "patching_rect": [
                            100.0,
                            100.0,
                            47.0,
                            19.0
                          ],
                          "saved_object_attributes": {
                            "default_fontface": 0,
                            "default_fontname": "Arial",
                            "default_fontsize": 12.0,
                            "description": "",
                            "digest": "",
                            "fontface": 0,
                            "fontname": "Arial",
                            "fontsize": 12.0,
                            "globalpatchername": "",
                            "tags": ""
                          },
                          "text": "p order"
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
                            "float"
                          ],
                          "patching_rect": [
                            225.0,
                            40.0,
                            25.0,
                            25.0
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
                            "float"
                          ],
                          "patching_rect": [
                            158.0,
                            40.0,
                            25.0,
                            25.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-44",
                          "maxclass": "newobj",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patcher": {
                            "fileversion": 1,
                            "appversion": {
                              "major": 6,
                              "minor": 0,
                              "revision": 8
                            },
                            "rect": [
                              714.0,
                              302.0,
                              294.0,
                              211.0
                            ],
                            "bglocked": 0,
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
                                  "comment": "",
                                  "id": "obj-10",
                                  "maxclass": "inlet",
                                  "numinlets": 0,
                                  "numoutlets": 1,
                                  "outlettype": [
                                    ""
                                  ],
                                  "patching_rect": [
                                    251.0,
                                    8.0,
                                    25.0,
                                    25.0
                                  ]
                                }
                              },
                              {
                                "box": {
                                  "fontname": "Arial",
                                  "fontsize": 12.0,
                                  "id": "obj-8",
                                  "maxclass": "newobj",
                                  "numinlets": 1,
                                  "numoutlets": 1,
                                  "outlettype": [
                                    ""
                                  ],
                                  "patching_rect": [
                                    37.0,
                                    120.0,
                                    125.0,
                                    20.0
                                  ],
                                  "text": "tosymbol @separator"
                                }
                              },
                              {
                                "box": {
                                  "fontname": "Arial",
                                  "fontsize": 12.0,
                                  "id": "obj-7",
                                  "maxclass": "newobj",
                                  "numinlets": 1,
                                  "numoutlets": 1,
                                  "outlettype": [
                                    ""
                                  ],
                                  "patching_rect": [
                                    162.0,
                                    121.0,
                                    74.0,
                                    20.0
                                  ],
                                  "text": "prepend set"
                                }
                              },
                              {
                                "box": {
                                  "fontname": "Arial",
                                  "fontsize": 12.0,
                                  "id": "obj-6",
                                  "maxclass": "message",
                                  "numinlets": 2,
                                  "numoutlets": 1,
                                  "outlettype": [
                                    ""
                                  ],
                                  "patching_rect": [
                                    37.0,
                                    98.0,
                                    215.0,
                                    18.0
                                  ],
                                  "text": "source. $1 /distance/attenuationFactor"
                                }
                              },
                              {
                                "box": {
                                  "fontname": "Arial",
                                  "fontsize": 12.0,
                                  "id": "obj-4",
                                  "maxclass": "newobj",
                                  "numinlets": 1,
                                  "numoutlets": 1,
                                  "outlettype": [
                                    ""
                                  ],
                                  "patching_rect": [
                                    10.0,
                                    150.0,
                                    64.0,
                                    20.0
                                  ],
                                  "text": "append 0."
                                }
                              },
                              {
                                "box": {
                                  "comment": "",
                                  "id": "obj-9",
                                  "maxclass": "outlet",
                                  "numinlets": 1,
                                  "numoutlets": 0,
                                  "patching_rect": [
                                    10.0,
                                    176.0,
                                    25.0,
                                    25.0
                                  ]
                                }
                              },
                              {
                                "box": {
                                  "fontname": "Arial",
                                  "fontsize": 12.0,
                                  "id": "obj-3",
                                  "maxclass": "newobj",
                                  "numinlets": 1,
                                  "numoutlets": 2,
                                  "outlettype": [
                                    "bang",
                                    "float"
                                  ],
                                  "patching_rect": [
                                    10.0,
                                    43.0,
                                    32.5,
                                    20.0
                                  ],
                                  "text": "t b f"
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
                                    "float"
                                  ],
                                  "patching_rect": [
                                    10.0,
                                    8.0,
                                    25.0,
                                    25.0
                                  ]
                                }
                              },
                              {
                                "box": {
                                  "fontname": "Arial",
                                  "fontsize": 12.0,
                                  "id": "obj-28",
                                  "maxclass": "newobj",
                                  "numinlets": 2,
                                  "numoutlets": 3,
                                  "outlettype": [
                                    "bang",
                                    "bang",
                                    "int"
                                  ],
                                  "patching_rect": [
                                    10.0,
                                    75.0,
                                    46.0,
                                    19.0
                                  ],
                                  "text": "uzi 1 1"
                                }
                              }
                            ],
                            "lines": [
                              {
                                "patchline": {
                                  "destination": [
                                    "obj-3",
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
                                    "obj-28",
                                    1
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
                                    "obj-6",
                                    0
                                  ],
                                  "disabled": 0,
                                  "hidden": 0,
                                  "source": [
                                    "obj-28",
                                    2
                                  ]
                                }
                              },
                              {
                                "patchline": {
                                  "destination": [
                                    "obj-28",
                                    0
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
                                    "obj-7",
                                    0
                                  ],
                                  "disabled": 0,
                                  "hidden": 0,
                                  "midpoints": [
                                    33.0,
                                    68.5,
                                    171.5,
                                    68.5
                                  ],
                                  "source": [
                                    "obj-3",
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
                                  "disabled": 0,
                                  "hidden": 0,
                                  "source": [
                                    "obj-4",
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
                                  "disabled": 0,
                                  "hidden": 0,
                                  "source": [
                                    "obj-6",
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
                                  "disabled": 0,
                                  "hidden": 0,
                                  "midpoints": [
                                    171.5,
                                    145.0,
                                    19.5,
                                    145.0
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
                                  "disabled": 0,
                                  "hidden": 0,
                                  "source": [
                                    "obj-8",
                                    0
                                  ]
                                }
                              }
                            ]
                          },
                          "patching_rect": [
                            225.0,
                            100.0,
                            53.0,
                            19.0
                          ],
                          "saved_object_attributes": {
                            "default_fontface": 0,
                            "default_fontname": "Arial",
                            "default_fontsize": 12.0,
                            "description": "",
                            "digest": "",
                            "fontface": 0,
                            "fontname": "Arial",
                            "fontsize": 12.0,
                            "globalpatchername": "",
                            "tags": ""
                          },
                          "text": "p daFact"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-43",
                          "maxclass": "newobj",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patcher": {
                            "fileversion": 1,
                            "appversion": {
                              "major": 6,
                              "minor": 0,
                              "revision": 8
                            },
                            "rect": [
                              714.0,
                              302.0,
                              294.0,
                              211.0
                            ],
                            "bglocked": 0,
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
                                  "comment": "",
                                  "id": "obj-10",
                                  "maxclass": "inlet",
                                  "numinlets": 0,
                                  "numoutlets": 1,
                                  "outlettype": [
                                    ""
                                  ],
                                  "patching_rect": [
                                    251.0,
                                    8.0,
                                    25.0,
                                    25.0
                                  ]
                                }
                              },
                              {
                                "box": {
                                  "fontname": "Arial",
                                  "fontsize": 12.0,
                                  "id": "obj-8",
                                  "maxclass": "newobj",
                                  "numinlets": 1,
                                  "numoutlets": 1,
                                  "outlettype": [
                                    ""
                                  ],
                                  "patching_rect": [
                                    37.0,
                                    120.0,
                                    125.0,
                                    20.0
                                  ],
                                  "text": "tosymbol @separator"
                                }
                              },
                              {
                                "box": {
                                  "fontname": "Arial",
                                  "fontsize": 12.0,
                                  "id": "obj-7",
                                  "maxclass": "newobj",
                                  "numinlets": 1,
                                  "numoutlets": 1,
                                  "outlettype": [
                                    ""
                                  ],
                                  "patching_rect": [
                                    162.0,
                                    121.0,
                                    74.0,
                                    20.0
                                  ],
                                  "text": "prepend set"
                                }
                              },
                              {
                                "box": {
                                  "fontname": "Arial",
                                  "fontsize": 12.0,
                                  "id": "obj-6",
                                  "maxclass": "message",
                                  "numinlets": 2,
                                  "numoutlets": 1,
                                  "outlettype": [
                                    ""
                                  ],
                                  "patching_rect": [
                                    37.0,
                                    98.0,
                                    156.0,
                                    18.0
                                  ],
                                  "text": "source. $1 /distance/dbUnit"
                                }
                              },
                              {
                                "box": {
                                  "fontname": "Arial",
                                  "fontsize": 12.0,
                                  "id": "obj-4",
                                  "maxclass": "newobj",
                                  "numinlets": 1,
                                  "numoutlets": 1,
                                  "outlettype": [
                                    ""
                                  ],
                                  "patching_rect": [
                                    10.0,
                                    150.0,
                                    64.0,
                                    20.0
                                  ],
                                  "text": "append 0."
                                }
                              },
                              {
                                "box": {
                                  "comment": "",
                                  "id": "obj-9",
                                  "maxclass": "outlet",
                                  "numinlets": 1,
                                  "numoutlets": 0,
                                  "patching_rect": [
                                    10.0,
                                    176.0,
                                    25.0,
                                    25.0
                                  ]
                                }
                              },
                              {
                                "box": {
                                  "fontname": "Arial",
                                  "fontsize": 12.0,
                                  "id": "obj-3",
                                  "maxclass": "newobj",
                                  "numinlets": 1,
                                  "numoutlets": 2,
                                  "outlettype": [
                                    "bang",
                                    "float"
                                  ],
                                  "patching_rect": [
                                    10.0,
                                    43.0,
                                    32.5,
                                    20.0
                                  ],
                                  "text": "t b f"
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
                                    "float"
                                  ],
                                  "patching_rect": [
                                    10.0,
                                    8.0,
                                    25.0,
                                    25.0
                                  ]
                                }
                              },
                              {
                                "box": {
                                  "fontname": "Arial",
                                  "fontsize": 12.0,
                                  "id": "obj-28",
                                  "maxclass": "newobj",
                                  "numinlets": 2,
                                  "numoutlets": 3,
                                  "outlettype": [
                                    "bang",
                                    "bang",
                                    "int"
                                  ],
                                  "patching_rect": [
                                    10.0,
                                    75.0,
                                    46.0,
                                    19.0
                                  ],
                                  "text": "uzi 1 1"
                                }
                              }
                            ],
                            "lines": [
                              {
                                "patchline": {
                                  "destination": [
                                    "obj-3",
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
                                    "obj-28",
                                    1
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
                                    "obj-6",
                                    0
                                  ],
                                  "disabled": 0,
                                  "hidden": 0,
                                  "source": [
                                    "obj-28",
                                    2
                                  ]
                                }
                              },
                              {
                                "patchline": {
                                  "destination": [
                                    "obj-28",
                                    0
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
                                    "obj-7",
                                    0
                                  ],
                                  "disabled": 0,
                                  "hidden": 0,
                                  "midpoints": [
                                    33.0,
                                    68.5,
                                    171.5,
                                    68.5
                                  ],
                                  "source": [
                                    "obj-3",
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
                                  "disabled": 0,
                                  "hidden": 0,
                                  "source": [
                                    "obj-4",
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
                                  "disabled": 0,
                                  "hidden": 0,
                                  "source": [
                                    "obj-6",
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
                                  "disabled": 0,
                                  "hidden": 0,
                                  "midpoints": [
                                    171.5,
                                    145.0,
                                    19.5,
                                    145.0
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
                                  "disabled": 0,
                                  "hidden": 0,
                                  "source": [
                                    "obj-8",
                                    0
                                  ]
                                }
                              }
                            ]
                          },
                          "patching_rect": [
                            158.0,
                            100.0,
                            53.0,
                            19.0
                          ],
                          "saved_object_attributes": {
                            "default_fontface": 0,
                            "default_fontname": "Arial",
                            "default_fontsize": 12.0,
                            "description": "",
                            "digest": "",
                            "fontface": 0,
                            "fontname": "Arial",
                            "fontsize": 12.0,
                            "globalpatchername": "",
                            "tags": ""
                          },
                          "text": "p dbUnit"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-29",
                          "maxclass": "newobj",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patcher": {
                            "fileversion": 1,
                            "appversion": {
                              "major": 6,
                              "minor": 0,
                              "revision": 8
                            },
                            "rect": [
                              714.0,
                              302.0,
                              294.0,
                              211.0
                            ],
                            "bglocked": 0,
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
                                  "comment": "",
                                  "id": "obj-10",
                                  "maxclass": "inlet",
                                  "numinlets": 0,
                                  "numoutlets": 1,
                                  "outlettype": [
                                    ""
                                  ],
                                  "patching_rect": [
                                    251.0,
                                    8.0,
                                    25.0,
                                    25.0
                                  ]
                                }
                              },
                              {
                                "box": {
                                  "fontname": "Arial",
                                  "fontsize": 12.0,
                                  "id": "obj-8",
                                  "maxclass": "newobj",
                                  "numinlets": 1,
                                  "numoutlets": 1,
                                  "outlettype": [
                                    ""
                                  ],
                                  "patching_rect": [
                                    37.0,
                                    120.0,
                                    125.0,
                                    20.0
                                  ],
                                  "text": "tosymbol @separator"
                                }
                              },
                              {
                                "box": {
                                  "fontname": "Arial",
                                  "fontsize": 12.0,
                                  "id": "obj-7",
                                  "maxclass": "newobj",
                                  "numinlets": 1,
                                  "numoutlets": 1,
                                  "outlettype": [
                                    ""
                                  ],
                                  "patching_rect": [
                                    162.0,
                                    121.0,
                                    74.0,
                                    20.0
                                  ],
                                  "text": "prepend set"
                                }
                              },
                              {
                                "box": {
                                  "fontname": "Arial",
                                  "fontsize": 12.0,
                                  "id": "obj-6",
                                  "maxclass": "message",
                                  "numinlets": 2,
                                  "numoutlets": 1,
                                  "outlettype": [
                                    ""
                                  ],
                                  "patching_rect": [
                                    37.0,
                                    98.0,
                                    96.0,
                                    18.0
                                  ],
                                  "text": "source. $1 /gain"
                                }
                              },
                              {
                                "box": {
                                  "fontname": "Arial",
                                  "fontsize": 12.0,
                                  "id": "obj-4",
                                  "maxclass": "newobj",
                                  "numinlets": 1,
                                  "numoutlets": 1,
                                  "outlettype": [
                                    ""
                                  ],
                                  "patching_rect": [
                                    10.0,
                                    150.0,
                                    64.0,
                                    20.0
                                  ],
                                  "text": "append 0."
                                }
                              },
                              {
                                "box": {
                                  "comment": "",
                                  "id": "obj-9",
                                  "maxclass": "outlet",
                                  "numinlets": 1,
                                  "numoutlets": 0,
                                  "patching_rect": [
                                    10.0,
                                    176.0,
                                    25.0,
                                    25.0
                                  ]
                                }
                              },
                              {
                                "box": {
                                  "fontname": "Arial",
                                  "fontsize": 12.0,
                                  "id": "obj-3",
                                  "maxclass": "newobj",
                                  "numinlets": 1,
                                  "numoutlets": 2,
                                  "outlettype": [
                                    "bang",
                                    "float"
                                  ],
                                  "patching_rect": [
                                    10.0,
                                    43.0,
                                    32.5,
                                    20.0
                                  ],
                                  "text": "t b f"
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
                                    8.0,
                                    25.0,
                                    25.0
                                  ]
                                }
                              },
                              {
                                "box": {
                                  "fontname": "Arial",
                                  "fontsize": 12.0,
                                  "id": "obj-28",
                                  "maxclass": "newobj",
                                  "numinlets": 2,
                                  "numoutlets": 3,
                                  "outlettype": [
                                    "bang",
                                    "bang",
                                    "int"
                                  ],
                                  "patching_rect": [
                                    10.0,
                                    75.0,
                                    46.0,
                                    19.0
                                  ],
                                  "text": "uzi 1 1"
                                }
                              }
                            ],
                            "lines": [
                              {
                                "patchline": {
                                  "destination": [
                                    "obj-3",
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
                                    "obj-28",
                                    1
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
                                    "obj-6",
                                    0
                                  ],
                                  "disabled": 0,
                                  "hidden": 0,
                                  "source": [
                                    "obj-28",
                                    2
                                  ]
                                }
                              },
                              {
                                "patchline": {
                                  "destination": [
                                    "obj-28",
                                    0
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
                                    "obj-7",
                                    0
                                  ],
                                  "disabled": 0,
                                  "hidden": 0,
                                  "midpoints": [
                                    33.0,
                                    68.5,
                                    171.5,
                                    68.5
                                  ],
                                  "source": [
                                    "obj-3",
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
                                  "disabled": 0,
                                  "hidden": 0,
                                  "source": [
                                    "obj-4",
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
                                  "disabled": 0,
                                  "hidden": 0,
                                  "source": [
                                    "obj-6",
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
                                  "disabled": 0,
                                  "hidden": 0,
                                  "midpoints": [
                                    171.5,
                                    145.0,
                                    19.5,
                                    145.0
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
                                  "disabled": 0,
                                  "hidden": 0,
                                  "source": [
                                    "obj-8",
                                    0
                                  ]
                                }
                              }
                            ]
                          },
                          "patching_rect": [
                            50.0,
                            100.0,
                            42.0,
                            19.0
                          ],
                          "saved_object_attributes": {
                            "default_fontface": 0,
                            "default_fontname": "Arial",
                            "default_fontsize": 12.0,
                            "description": "",
                            "digest": "",
                            "fontface": 0,
                            "fontname": "Arial",
                            "fontsize": 12.0,
                            "globalpatchername": "",
                            "tags": ""
                          },
                          "text": "p gain"
                        }
                      },
                      {
                        "box": {
                          "comment": "",
                          "id": "obj-46",
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
                          "id": "obj-47",
                          "maxclass": "outlet",
                          "numinlets": 1,
                          "numoutlets": 0,
                          "patching_rect": [
                            50.0,
                            214.0,
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
                            "obj-43",
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
                            "obj-44",
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
                          "destination": [
                            "obj-47",
                            0
                          ],
                          "disabled": 0,
                          "hidden": 0,
                          "source": [
                            "obj-29",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-29",
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
                            "obj-4",
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
                            "obj-43",
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
                            "obj-44",
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
                            "obj-7",
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
                            "obj-47",
                            0
                          ],
                          "disabled": 0,
                          "hidden": 0,
                          "source": [
                            "obj-4",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-47",
                            0
                          ],
                          "disabled": 0,
                          "hidden": 0,
                          "source": [
                            "obj-43",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-47",
                            0
                          ],
                          "disabled": 0,
                          "hidden": 0,
                          "source": [
                            "obj-44",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-29",
                            0
                          ],
                          "disabled": 0,
                          "hidden": 0,
                          "source": [
                            "obj-46",
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
                          "disabled": 0,
                          "hidden": 0,
                          "source": [
                            "obj-5",
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
                            "obj-6",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-47",
                            0
                          ],
                          "disabled": 0,
                          "hidden": 0,
                          "source": [
                            "obj-7",
                            0
                          ]
                        }
                      }
                    ]
                  },
                  "patching_rect": [
                    775.0,
                    252.0,
                    73.0,
                    19.0
                  ],
                  "saved_object_attributes": {
                    "default_fontface": 0,
                    "default_fontname": "Arial",
                    "default_fontsize": 12.0,
                    "description": "",
                    "digest": "",
                    "fontface": 0,
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "globalpatchername": "",
                    "tags": ""
                  },
                  "text": "p one-for-all"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "frgb": 0.0,
                  "id": "obj-19",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    601.0,
                    144.0,
                    87.0,
                    19.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    298.0,
                    4.0,
                    82.0,
                    19.0
                  ],
                  "text": "distance Mode"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "frgb": 0.0,
                  "id": "obj-1",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    601.0,
                    129.0,
                    87.0,
                    19.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    262.0,
                    4.0,
                    37.0,
                    19.0
                  ],
                  "text": "order"
                }
              },
              {
                "box": {
                  "args": [
                    25
                  ],
                  "hidden": 1,
                  "id": "obj-10",
                  "lockeddragscroll": 1,
                  "maxclass": "bpatcher",
                  "name": "j.ambipanSource.maxpat",
                  "numinlets": 0,
                  "numoutlets": 0,
                  "patching_rect": [
                    302.0,
                    247.0,
                    282.0,
                    23.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    451.0,
                    283.0,
                    443.0,
                    31.0
                  ],
                  "varname": "ch25"
                }
              },
              {
                "box": {
                  "args": [
                    24
                  ],
                  "hidden": 1,
                  "id": "obj-11",
                  "lockeddragscroll": 1,
                  "maxclass": "bpatcher",
                  "name": "j.ambipanSource.maxpat",
                  "numinlets": 0,
                  "numoutlets": 0,
                  "patching_rect": [
                    302.0,
                    218.0,
                    282.0,
                    23.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    451.0,
                    254.0,
                    443.0,
                    31.0
                  ],
                  "varname": "ch24"
                }
              },
              {
                "box": {
                  "args": [
                    23
                  ],
                  "hidden": 1,
                  "id": "obj-12",
                  "lockeddragscroll": 1,
                  "maxclass": "bpatcher",
                  "name": "j.ambipanSource.maxpat",
                  "numinlets": 0,
                  "numoutlets": 0,
                  "patching_rect": [
                    302.0,
                    189.0,
                    282.0,
                    23.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    451.0,
                    225.0,
                    443.0,
                    31.0
                  ],
                  "varname": "ch23"
                }
              },
              {
                "box": {
                  "args": [
                    22
                  ],
                  "hidden": 1,
                  "id": "obj-13",
                  "lockeddragscroll": 1,
                  "maxclass": "bpatcher",
                  "name": "j.ambipanSource.maxpat",
                  "numinlets": 0,
                  "numoutlets": 0,
                  "patching_rect": [
                    302.0,
                    160.0,
                    282.0,
                    23.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    451.0,
                    196.0,
                    443.0,
                    31.0
                  ],
                  "varname": "ch22"
                }
              },
              {
                "box": {
                  "args": [
                    21
                  ],
                  "hidden": 1,
                  "id": "obj-14",
                  "lockeddragscroll": 1,
                  "maxclass": "bpatcher",
                  "name": "j.ambipanSource.maxpat",
                  "numinlets": 0,
                  "numoutlets": 0,
                  "patching_rect": [
                    302.0,
                    131.0,
                    282.0,
                    23.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    451.0,
                    167.0,
                    443.0,
                    31.0
                  ],
                  "varname": "ch21"
                }
              },
              {
                "box": {
                  "args": [
                    20
                  ],
                  "hidden": 1,
                  "id": "obj-15",
                  "lockeddragscroll": 1,
                  "maxclass": "bpatcher",
                  "name": "j.ambipanSource.maxpat",
                  "numinlets": 0,
                  "numoutlets": 0,
                  "patching_rect": [
                    302.0,
                    102.0,
                    282.0,
                    23.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    451.0,
                    138.0,
                    443.0,
                    31.0
                  ],
                  "varname": "ch20"
                }
              },
              {
                "box": {
                  "args": [
                    19
                  ],
                  "hidden": 1,
                  "id": "obj-16",
                  "lockeddragscroll": 1,
                  "maxclass": "bpatcher",
                  "name": "j.ambipanSource.maxpat",
                  "numinlets": 0,
                  "numoutlets": 0,
                  "patching_rect": [
                    302.0,
                    73.0,
                    282.0,
                    23.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    451.0,
                    109.0,
                    443.0,
                    31.0
                  ],
                  "varname": "ch19"
                }
              },
              {
                "box": {
                  "args": [
                    18
                  ],
                  "hidden": 1,
                  "id": "obj-17",
                  "lockeddragscroll": 1,
                  "maxclass": "bpatcher",
                  "name": "j.ambipanSource.maxpat",
                  "numinlets": 0,
                  "numoutlets": 0,
                  "patching_rect": [
                    302.0,
                    44.0,
                    282.0,
                    23.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    451.0,
                    80.0,
                    443.0,
                    31.0
                  ],
                  "varname": "ch18"
                }
              },
              {
                "box": {
                  "args": [
                    17
                  ],
                  "hidden": 1,
                  "id": "obj-18",
                  "lockeddragscroll": 1,
                  "maxclass": "bpatcher",
                  "name": "j.ambipanSource.maxpat",
                  "numinlets": 0,
                  "numoutlets": 0,
                  "patching_rect": [
                    302.0,
                    15.0,
                    282.0,
                    23.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    451.0,
                    51.0,
                    443.0,
                    31.0
                  ],
                  "varname": "ch17"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-2",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patcher": {
                    "fileversion": 1,
                    "appversion": {
                      "major": 6,
                      "minor": 0,
                      "revision": 8
                    },
                    "rect": [
                      591.0,
                      103.0,
                      709.0,
                      479.0
                    ],
                    "bglocked": 0,
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
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-11",
                          "maxclass": "number",
                          "numinlets": 1,
                          "numoutlets": 2,
                          "outlettype": [
                            "int",
                            "bang"
                          ],
                          "parameter_enable": 0,
                          "patching_rect": [
                            419.0,
                            31.0,
                            50.0,
                            19.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-1",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 2,
                          "outlettype": [
                            "",
                            ""
                          ],
                          "patching_rect": [
                            129.0,
                            161.0,
                            54.0,
                            19.0
                          ],
                          "text": "j.init"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-10",
                          "linecount": 2,
                          "maxclass": "message",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            400.0,
                            281.0,
                            169.0,
                            29.0
                          ],
                          "text": "window size 100 100 560 $1, window title, window exec"
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
                            "int"
                          ],
                          "patching_rect": [
                            398.0,
                            205.0,
                            32.5,
                            19.0
                          ],
                          "text": "i 8"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-14",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            93.0,
                            235.0,
                            112.0,
                            19.0
                          ],
                          "text": "prepend script show"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-15",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            239.0,
                            235.0,
                            108.0,
                            19.0
                          ],
                          "text": "prepend script hide"
                        }
                      },
                      {
                        "box": {
                          "comment": "",
                          "id": "obj-16",
                          "maxclass": "outlet",
                          "numinlets": 1,
                          "numoutlets": 0,
                          "patching_rect": [
                            198.0,
                            437.0,
                            25.0,
                            25.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-17",
                          "maxclass": "newobj",
                          "numinlets": 3,
                          "numoutlets": 2,
                          "outlettype": [
                            "int",
                            "int"
                          ],
                          "patching_rect": [
                            329.0,
                            185.0,
                            51.0,
                            19.0
                          ],
                          "text": "split 1 8"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-18",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 3,
                          "outlettype": [
                            "bang",
                            "int",
                            "int"
                          ],
                          "patching_rect": [
                            344.0,
                            90.0,
                            46.0,
                            19.0
                          ],
                          "text": "t b i i"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-19",
                          "maxclass": "newobj",
                          "numinlets": 2,
                          "numoutlets": 3,
                          "outlettype": [
                            "bang",
                            "bang",
                            "int"
                          ],
                          "patching_rect": [
                            308.0,
                            134.0,
                            46.0,
                            19.0
                          ],
                          "text": "uzi 32"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-2",
                          "maxclass": "newobj",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            "int"
                          ],
                          "patching_rect": [
                            411.0,
                            133.0,
                            35.0,
                            19.0
                          ],
                          "text": "> 15"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-20",
                          "maxclass": "newobj",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            "int"
                          ],
                          "patching_rect": [
                            398.0,
                            226.0,
                            33.0,
                            19.0
                          ],
                          "text": "* 29"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-21",
                          "maxclass": "newobj",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            "int"
                          ],
                          "patching_rect": [
                            398.0,
                            249.0,
                            41.0,
                            19.0
                          ],
                          "text": "+ 200"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-22",
                          "maxclass": "newobj",
                          "numinlets": 2,
                          "numoutlets": 2,
                          "outlettype": [
                            "",
                            ""
                          ],
                          "patching_rect": [
                            94.0,
                            211.0,
                            140.0,
                            19.0
                          ],
                          "text": "combine ch 1 @triggers 1"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-23",
                          "maxclass": "newobj",
                          "numinlets": 2,
                          "numoutlets": 2,
                          "outlettype": [
                            "",
                            ""
                          ],
                          "patching_rect": [
                            240.0,
                            212.0,
                            140.0,
                            19.0
                          ],
                          "text": "combine ch 1 @triggers 1"
                        }
                      },
                      {
                        "box": {
                          "comment": "",
                          "id": "obj-24",
                          "maxclass": "inlet",
                          "numinlets": 0,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            344.0,
                            28.0,
                            25.0,
                            25.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-3",
                          "maxclass": "newobj",
                          "numinlets": 3,
                          "numoutlets": 3,
                          "outlettype": [
                            "bang",
                            "bang",
                            ""
                          ],
                          "patching_rect": [
                            412.0,
                            157.0,
                            196.0,
                            19.0
                          ],
                          "text": "sel 0 1"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-5",
                          "linecount": 5,
                          "maxclass": "message",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            412.0,
                            333.0,
                            95.0,
                            65.0
                          ],
                          "text": "script hide x2, script hide y2, script hide z2, script hide o2, script hide d2"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-6",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            418.0,
                            413.0,
                            59.0,
                            19.0
                          ],
                          "text": "thru"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-7",
                          "linecount": 5,
                          "maxclass": "message",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            536.0,
                            333.0,
                            93.0,
                            65.0
                          ],
                          "text": "script show x2, script show y2, script show z2, script show o2, script show d2"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-8",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            188.0,
                            289.0,
                            59.0,
                            19.0
                          ],
                          "text": "thru"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-9",
                          "linecount": 2,
                          "maxclass": "message",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            503.0,
                            238.0,
                            175.0,
                            29.0
                          ],
                          "text": "window size 100 100 1000 635, window title, window exec"
                        }
                      }
                    ],
                    "lines": [
                      {
                        "patchline": {
                          "color": [
                            0.87451,
                            0.25098,
                            0.717647,
                            1.0
                          ],
                          "destination": [
                            "obj-12",
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
                          "color": [
                            0.87451,
                            0.25098,
                            0.717647,
                            1.0
                          ],
                          "destination": [
                            "obj-19",
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
                            "obj-6",
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
                            "obj-18",
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
                            "obj-20",
                            0
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
                            "obj-8",
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
                            "obj-8",
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
                            "obj-22",
                            1
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
                            "obj-23",
                            1
                          ],
                          "disabled": 0,
                          "hidden": 0,
                          "source": [
                            "obj-17",
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
                          "disabled": 0,
                          "hidden": 0,
                          "source": [
                            "obj-18",
                            2
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-17",
                            2
                          ],
                          "disabled": 0,
                          "hidden": 0,
                          "source": [
                            "obj-18",
                            2
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-19",
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
                            "obj-2",
                            0
                          ],
                          "disabled": 0,
                          "hidden": 0,
                          "source": [
                            "obj-18",
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
                          "disabled": 0,
                          "hidden": 0,
                          "source": [
                            "obj-19",
                            2
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
                            "obj-2",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-21",
                            0
                          ],
                          "disabled": 0,
                          "hidden": 0,
                          "source": [
                            "obj-20",
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
                            "obj-21",
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
                            "obj-22",
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
                            "obj-23",
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
                            "obj-24",
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
                            "obj-5",
                            0
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
                            "obj-7",
                            0
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
                            "obj-9",
                            0
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
                            "obj-6",
                            0
                          ],
                          "disabled": 0,
                          "hidden": 0,
                          "source": [
                            "obj-5",
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
                            "obj-6",
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
                            "obj-16",
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
                            "obj-6",
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
                    ]
                  },
                  "patching_rect": [
                    710.0,
                    319.0,
                    94.0,
                    20.0
                  ],
                  "saved_object_attributes": {
                    "default_fontface": 0,
                    "default_fontname": "Arial",
                    "default_fontsize": 12.0,
                    "description": "",
                    "digest": "",
                    "fontface": 0,
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "globalpatchername": "",
                    "tags": ""
                  },
                  "text": "p hideChannels"
                }
              },
              {
                "box": {
                  "comment": "",
                  "hidden": 1,
                  "id": "obj-20",
                  "maxclass": "outlet",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    775.0,
                    283.0,
                    25.0,
                    25.0
                  ]
                }
              },
              {
                "box": {
                  "comment": "",
                  "hidden": 1,
                  "id": "obj-21",
                  "maxclass": "inlet",
                  "numinlets": 0,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    782.0,
                    9.0,
                    25.0,
                    25.0
                  ]
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "hidden": 1,
                  "id": "obj-22",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    690.0,
                    377.0,
                    231.0,
                    17.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    103.0,
                    140.0,
                    231.0,
                    17.0
                  ],
                  "text": "window size 100 100 700 635, window exec"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "hidden": 1,
                  "id": "obj-23",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    690.0,
                    344.0,
                    263.0,
                    17.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    103.0,
                    107.0,
                    263.0,
                    17.0
                  ],
                  "text": "window flags nogrow, savewindow 1, window exec"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "hidden": 1,
                  "id": "obj-24",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    690.0,
                    360.0,
                    173.0,
                    17.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    103.0,
                    123.0,
                    173.0,
                    17.0
                  ],
                  "text": "window flags grow, window exec"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "hidden": 1,
                  "id": "obj-25",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    ""
                  ],
                  "patching_rect": [
                    701.0,
                    419.0,
                    65.0,
                    19.0
                  ],
                  "save": [
                    "#N",
                    "thispatcher",
                    ";",
                    "#Q",
                    "savewindow",
                    1,
                    ";",
                    "#Q",
                    "end",
                    ";"
                  ],
                  "text": "thispatcher"
                }
              },
              {
                "box": {
                  "args": [
                    16
                  ],
                  "hidden": 1,
                  "id": "obj-28",
                  "lockeddragscroll": 1,
                  "maxclass": "bpatcher",
                  "name": "j.ambipanSource.maxpat",
                  "numinlets": 0,
                  "numoutlets": 0,
                  "patching_rect": [
                    15.0,
                    450.0,
                    282.0,
                    23.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    451.0,
                    21.0,
                    443.0,
                    31.0
                  ],
                  "varname": "ch16"
                }
              },
              {
                "box": {
                  "args": [
                    15
                  ],
                  "hidden": 1,
                  "id": "obj-29",
                  "lockeddragscroll": 1,
                  "maxclass": "bpatcher",
                  "name": "j.ambipanSource.maxpat",
                  "numinlets": 0,
                  "numoutlets": 0,
                  "patching_rect": [
                    15.0,
                    421.0,
                    282.0,
                    23.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    8.0,
                    487.0,
                    443.0,
                    31.0
                  ],
                  "varname": "ch15"
                }
              },
              {
                "box": {
                  "args": [
                    32
                  ],
                  "hidden": 1,
                  "id": "obj-3",
                  "lockeddragscroll": 1,
                  "maxclass": "bpatcher",
                  "name": "j.ambipanSource.maxpat",
                  "numinlets": 0,
                  "numoutlets": 0,
                  "patching_rect": [
                    302.0,
                    450.0,
                    282.0,
                    23.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    451.0,
                    486.0,
                    443.0,
                    31.0
                  ],
                  "varname": "ch32"
                }
              },
              {
                "box": {
                  "args": [
                    14
                  ],
                  "hidden": 1,
                  "id": "obj-30",
                  "lockeddragscroll": 1,
                  "maxclass": "bpatcher",
                  "name": "j.ambipanSource.maxpat",
                  "numinlets": 0,
                  "numoutlets": 0,
                  "patching_rect": [
                    15.0,
                    392.0,
                    282.0,
                    23.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    8.0,
                    458.0,
                    443.0,
                    31.0
                  ],
                  "varname": "ch14"
                }
              },
              {
                "box": {
                  "args": [
                    13
                  ],
                  "hidden": 1,
                  "id": "obj-31",
                  "lockeddragscroll": 1,
                  "maxclass": "bpatcher",
                  "name": "j.ambipanSource.maxpat",
                  "numinlets": 0,
                  "numoutlets": 0,
                  "patching_rect": [
                    15.0,
                    363.0,
                    282.0,
                    23.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    8.0,
                    429.0,
                    443.0,
                    31.0
                  ],
                  "varname": "ch13"
                }
              },
              {
                "box": {
                  "args": [
                    12
                  ],
                  "hidden": 1,
                  "id": "obj-32",
                  "lockeddragscroll": 1,
                  "maxclass": "bpatcher",
                  "name": "j.ambipanSource.maxpat",
                  "numinlets": 0,
                  "numoutlets": 0,
                  "patching_rect": [
                    15.0,
                    334.0,
                    282.0,
                    23.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    8.0,
                    400.0,
                    443.0,
                    31.0
                  ],
                  "varname": "ch12"
                }
              },
              {
                "box": {
                  "args": [
                    11
                  ],
                  "hidden": 1,
                  "id": "obj-33",
                  "lockeddragscroll": 1,
                  "maxclass": "bpatcher",
                  "name": "j.ambipanSource.maxpat",
                  "numinlets": 0,
                  "numoutlets": 0,
                  "patching_rect": [
                    15.0,
                    305.0,
                    282.0,
                    23.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    8.0,
                    371.0,
                    443.0,
                    31.0
                  ],
                  "varname": "ch11"
                }
              },
              {
                "box": {
                  "args": [
                    10
                  ],
                  "hidden": 1,
                  "id": "obj-34",
                  "lockeddragscroll": 1,
                  "maxclass": "bpatcher",
                  "name": "j.ambipanSource.maxpat",
                  "numinlets": 0,
                  "numoutlets": 0,
                  "patching_rect": [
                    15.0,
                    276.0,
                    282.0,
                    23.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    8.0,
                    342.0,
                    443.0,
                    31.0
                  ],
                  "varname": "ch10"
                }
              },
              {
                "box": {
                  "args": [
                    9
                  ],
                  "hidden": 1,
                  "id": "obj-35",
                  "lockeddragscroll": 1,
                  "maxclass": "bpatcher",
                  "name": "j.ambipanSource.maxpat",
                  "numinlets": 0,
                  "numoutlets": 0,
                  "patching_rect": [
                    15.0,
                    247.0,
                    282.0,
                    23.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    8.0,
                    313.0,
                    443.0,
                    31.0
                  ],
                  "varname": "ch9"
                }
              },
              {
                "box": {
                  "args": [
                    8
                  ],
                  "hidden": 1,
                  "id": "obj-36",
                  "lockeddragscroll": 1,
                  "maxclass": "bpatcher",
                  "name": "j.ambipanSource.maxpat",
                  "numinlets": 0,
                  "numoutlets": 0,
                  "patching_rect": [
                    15.0,
                    218.0,
                    282.0,
                    23.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    8.0,
                    284.0,
                    443.0,
                    31.0
                  ],
                  "varname": "ch8"
                }
              },
              {
                "box": {
                  "args": [
                    7
                  ],
                  "hidden": 1,
                  "id": "obj-37",
                  "lockeddragscroll": 1,
                  "maxclass": "bpatcher",
                  "name": "j.ambipanSource.maxpat",
                  "numinlets": 0,
                  "numoutlets": 0,
                  "patching_rect": [
                    15.0,
                    189.0,
                    282.0,
                    23.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    8.0,
                    255.0,
                    443.0,
                    31.0
                  ],
                  "varname": "ch7"
                }
              },
              {
                "box": {
                  "args": [
                    6
                  ],
                  "hidden": 1,
                  "id": "obj-38",
                  "lockeddragscroll": 1,
                  "maxclass": "bpatcher",
                  "name": "j.ambipanSource.maxpat",
                  "numinlets": 0,
                  "numoutlets": 0,
                  "patching_rect": [
                    15.0,
                    160.0,
                    282.0,
                    23.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    8.0,
                    226.0,
                    443.0,
                    31.0
                  ],
                  "varname": "ch6"
                }
              },
              {
                "box": {
                  "args": [
                    5
                  ],
                  "hidden": 1,
                  "id": "obj-39",
                  "lockeddragscroll": 1,
                  "maxclass": "bpatcher",
                  "name": "j.ambipanSource.maxpat",
                  "numinlets": 0,
                  "numoutlets": 0,
                  "patching_rect": [
                    15.0,
                    131.0,
                    282.0,
                    23.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    8.0,
                    197.0,
                    443.0,
                    31.0
                  ],
                  "varname": "ch5"
                }
              },
              {
                "box": {
                  "args": [
                    31
                  ],
                  "hidden": 1,
                  "id": "obj-4",
                  "lockeddragscroll": 1,
                  "maxclass": "bpatcher",
                  "name": "j.ambipanSource.maxpat",
                  "numinlets": 0,
                  "numoutlets": 0,
                  "patching_rect": [
                    302.0,
                    421.0,
                    282.0,
                    23.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    451.0,
                    457.0,
                    443.0,
                    31.0
                  ],
                  "varname": "ch31"
                }
              },
              {
                "box": {
                  "args": [
                    4
                  ],
                  "hidden": 1,
                  "id": "obj-40",
                  "lockeddragscroll": 1,
                  "maxclass": "bpatcher",
                  "name": "j.ambipanSource.maxpat",
                  "numinlets": 0,
                  "numoutlets": 0,
                  "patching_rect": [
                    15.0,
                    102.0,
                    282.0,
                    23.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    8.0,
                    168.0,
                    443.0,
                    31.0
                  ],
                  "varname": "ch4"
                }
              },
              {
                "box": {
                  "args": [
                    3
                  ],
                  "id": "obj-41",
                  "lockeddragscroll": 1,
                  "maxclass": "bpatcher",
                  "name": "j.ambipanSource.maxpat",
                  "numinlets": 0,
                  "numoutlets": 0,
                  "patching_rect": [
                    15.0,
                    73.0,
                    282.0,
                    23.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    8.0,
                    139.0,
                    443.0,
                    31.0
                  ],
                  "varname": "ch3"
                }
              },
              {
                "box": {
                  "args": [
                    2
                  ],
                  "id": "obj-42",
                  "lockeddragscroll": 1,
                  "maxclass": "bpatcher",
                  "name": "j.ambipanSource.maxpat",
                  "numinlets": 0,
                  "numoutlets": 0,
                  "patching_rect": [
                    15.0,
                    44.0,
                    282.0,
                    23.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    8.0,
                    110.0,
                    443.0,
                    31.0
                  ],
                  "varname": "ch2"
                }
              },
              {
                "box": {
                  "args": [
                    1
                  ],
                  "id": "obj-43",
                  "lockeddragscroll": 1,
                  "maxclass": "bpatcher",
                  "name": "j.ambipanSource.maxpat",
                  "numinlets": 0,
                  "numoutlets": 0,
                  "patching_rect": [
                    15.0,
                    15.0,
                    282.0,
                    23.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    8.0,
                    81.0,
                    443.0,
                    31.0
                  ],
                  "varname": "ch1"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "frgb": 0.0,
                  "id": "obj-45",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    601.0,
                    178.0,
                    87.0,
                    19.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    113.0,
                    4.0,
                    26.0,
                    19.0
                  ],
                  "text": "x"
                }
              },
              {
                "box": {
                  "args": [
                    30
                  ],
                  "hidden": 1,
                  "id": "obj-5",
                  "lockeddragscroll": 1,
                  "maxclass": "bpatcher",
                  "name": "j.ambipanSource.maxpat",
                  "numinlets": 0,
                  "numoutlets": 0,
                  "patching_rect": [
                    302.0,
                    392.0,
                    282.0,
                    23.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    451.0,
                    428.0,
                    443.0,
                    31.0
                  ],
                  "varname": "ch30"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "frgb": 0.0,
                  "id": "obj-50",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    601.0,
                    204.0,
                    87.0,
                    19.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    163.0,
                    4.0,
                    26.0,
                    19.0
                  ],
                  "text": "y"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "frgb": 0.0,
                  "id": "obj-51",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    601.0,
                    114.0,
                    87.0,
                    19.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    219.0,
                    4.0,
                    26.0,
                    19.0
                  ],
                  "text": "z"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "frgb": 0.0,
                  "hidden": 1,
                  "id": "obj-52",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    601.0,
                    89.0,
                    87.0,
                    19.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    657.0,
                    4.0,
                    29.0,
                    19.0
                  ],
                  "text": "z",
                  "varname": "z2"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "frgb": 0.0,
                  "hidden": 1,
                  "id": "obj-53",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    601.0,
                    65.0,
                    87.0,
                    19.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    601.0,
                    4.0,
                    29.0,
                    19.0
                  ],
                  "text": "y",
                  "varname": "y2"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "frgb": 0.0,
                  "hidden": 1,
                  "id": "obj-54",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    601.0,
                    152.0,
                    87.0,
                    19.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    551.0,
                    4.0,
                    29.0,
                    19.0
                  ],
                  "text": "x",
                  "varname": "x2"
                }
              },
              {
                "box": {
                  "args": [
                    29
                  ],
                  "hidden": 1,
                  "id": "obj-6",
                  "lockeddragscroll": 1,
                  "maxclass": "bpatcher",
                  "name": "j.ambipanSource.maxpat",
                  "numinlets": 0,
                  "numoutlets": 0,
                  "patching_rect": [
                    302.0,
                    363.0,
                    282.0,
                    23.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    451.0,
                    399.0,
                    443.0,
                    31.0
                  ],
                  "varname": "ch29"
                }
              },
              {
                "box": {
                  "args": [
                    28
                  ],
                  "hidden": 1,
                  "id": "obj-7",
                  "lockeddragscroll": 1,
                  "maxclass": "bpatcher",
                  "name": "j.ambipanSource.maxpat",
                  "numinlets": 0,
                  "numoutlets": 0,
                  "patching_rect": [
                    302.0,
                    334.0,
                    282.0,
                    23.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    451.0,
                    370.0,
                    443.0,
                    31.0
                  ],
                  "varname": "ch28"
                }
              },
              {
                "box": {
                  "args": [
                    27
                  ],
                  "hidden": 1,
                  "id": "obj-8",
                  "lockeddragscroll": 1,
                  "maxclass": "bpatcher",
                  "name": "j.ambipanSource.maxpat",
                  "numinlets": 0,
                  "numoutlets": 0,
                  "patching_rect": [
                    302.0,
                    305.0,
                    282.0,
                    23.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    451.0,
                    341.0,
                    443.0,
                    31.0
                  ],
                  "varname": "ch27"
                }
              },
              {
                "box": {
                  "args": [
                    26
                  ],
                  "hidden": 1,
                  "id": "obj-9",
                  "lockeddragscroll": 1,
                  "maxclass": "bpatcher",
                  "name": "j.ambipanSource.maxpat",
                  "numinlets": 0,
                  "numoutlets": 0,
                  "patching_rect": [
                    302.0,
                    276.0,
                    282.0,
                    23.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    451.0,
                    312.0,
                    443.0,
                    31.0
                  ],
                  "varname": "ch26"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "frgb": 0.0,
                  "id": "obj-58",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    855.0,
                    121.0,
                    150.0,
                    19.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    15.0,
                    43.0,
                    133.0,
                    19.0
                  ],
                  "text": "Settings for all sources"
                }
              },
              {
                "box": {
                  "border": 1,
                  "id": "obj-56",
                  "maxclass": "panel",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    854.0,
                    121.0,
                    148.0,
                    28.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    10.0,
                    23.0,
                    433.0,
                    54.0
                  ],
                  "rounded": 14
                }
              }
            ],
            "lines": [
              {
                "patchline": {
                  "destination": [
                    "obj-25",
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
                  "destination": [
                    "obj-2",
                    0
                  ],
                  "disabled": 0,
                  "hidden": 0,
                  "source": [
                    "obj-21",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-49",
                    5
                  ],
                  "disabled": 0,
                  "hidden": 0,
                  "source": [
                    "obj-21",
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
                    "obj-25",
                    0
                  ],
                  "disabled": 0,
                  "hidden": 1,
                  "source": [
                    "obj-23",
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
                    "obj-49",
                    1
                  ],
                  "disabled": 0,
                  "hidden": 0,
                  "source": [
                    "obj-26",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-49",
                    4
                  ],
                  "disabled": 0,
                  "hidden": 0,
                  "source": [
                    "obj-44",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-55",
                    0
                  ],
                  "disabled": 0,
                  "hidden": 0,
                  "source": [
                    "obj-44",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-49",
                    3
                  ],
                  "disabled": 0,
                  "hidden": 0,
                  "source": [
                    "obj-46",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-49",
                    2
                  ],
                  "disabled": 0,
                  "hidden": 0,
                  "source": [
                    "obj-47",
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
                  "disabled": 0,
                  "hidden": 0,
                  "source": [
                    "obj-49",
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
                  "disabled": 0,
                  "hidden": 0,
                  "source": [
                    "obj-55",
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
                  "disabled": 0,
                  "hidden": 0,
                  "source": [
                    "obj-62",
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
                  "disabled": 0,
                  "hidden": 0,
                  "source": [
                    "obj-63",
                    0
                  ]
                }
              }
            ]
          },
          "patching_rect": [
            271.0,
            304.0,
            68.0,
            19.0
          ],
          "saved_object_attributes": {
            "default_fontface": 0,
            "default_fontname": "Arial",
            "default_fontsize": 12.0,
            "description": "",
            "digest": "",
            "fontface": 0,
            "fontname": "Arial",
            "fontsize": 12.0,
            "globalpatchername": "",
            "tags": ""
          },
          "text": "p Inspector"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-9",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            272.0,
            278.0,
            49.0,
            19.0
          ],
          "text": "pcontrol"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-12",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "open"
          ],
          "patching_rect": [
            272.0,
            254.0,
            41.0,
            19.0
          ],
          "text": "t open"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-13",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            272.0,
            230.0,
            151.0,
            19.0
          ],
          "text": "j.oscroute /view/panel"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "frgb": 0.0,
          "id": "obj-41",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            364.0,
            10.0,
            62.0,
            19.0
          ],
          "text": "Speakers:"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "frgb": 0.0,
          "id": "obj-26",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            319.0,
            158.0,
            150.0,
            19.0
          ],
          "text": "Global settings:"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-22",
          "linecount": 2,
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 3,
          "outlettype": [
            "",
            "",
            ""
          ],
          "patching_rect": [
            428.0,
            82.0,
            605.0,
            31.0
          ],
          "text": "j.remote 32"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-30",
          "linecount": 4,
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            10.0,
            187.0,
            212.0,
            55.0
          ],
          "text": "j.model @description \"ICST Ambisonics module, complete decoding and encoding  for multiple sources for multiple speakers in one module.\"",
          "varname": "j.model"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-5",
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
            530.0,
            160.0,
            568.0,
            31.0
          ],
          "text": "j.remote interpolation",
          "varname": "destination/dimensions[1]"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "frgb": 0.0,
          "id": "obj-4",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            5.0,
            45.0,
            116.0,
            19.0
          ],
          "presentation": 1,
          "presentation_rect": [
            3.0,
            43.0,
            116.0,
            19.0
          ],
          "text": "Number of speakers"
        }
      },
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
            130.0,
            245.0,
            48.0,
            19.0
          ],
          "text": "j.in"
        }
      },
      {
        "box": {
          "annotation": "Number of incomming mono sources to pan.",
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-40",
          "maxclass": "number",
          "maximum": 32,
          "minimum": 1,
          "mouseup": 1,
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "int",
            "bang"
          ],
          "parameter_enable": 0,
          "patching_rect": [
            438.0,
            199.0,
            34.0,
            19.0
          ],
          "presentation": 1,
          "presentation_rect": [
            113.0,
            22.0,
            33.0,
            19.0
          ],
          "triangle": 0
        }
      },
      {
        "box": {
          "annotation": "Number of speakers that signals are distributed to.",
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-39",
          "maxclass": "number",
          "maximum": 32,
          "minimum": 2,
          "mouseup": 1,
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "int",
            "bang"
          ],
          "parameter_enable": 0,
          "patching_rect": [
            422.0,
            26.0,
            34.0,
            19.0
          ],
          "presentation": 1,
          "presentation_rect": [
            113.0,
            43.0,
            33.0,
            19.0
          ],
          "triangle": 0
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-1",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            70.0,
            142.0,
            198.0,
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
            461.0,
            22.0,
            580.0,
            31.0
          ],
          "text": "j.remote numSpeakers",
          "varname": "destination/voices"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "frgb": 0.0,
          "id": "obj-10",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            5.0,
            25.0,
            114.0,
            19.0
          ],
          "presentation": 1,
          "presentation_rect": [
            1.0,
            22.0,
            114.0,
            19.0
          ],
          "text": "Number of sources"
        }
      },
      {
        "box": {
          "comment": "",
          "id": "obj-11",
          "maxclass": "inlet",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            227.0,
            294.0,
            25.0,
            25.0
          ]
        }
      },
      {
        "box": {
          "comment": "",
          "id": "obj-20",
          "maxclass": "outlet",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            227.0,
            372.0,
            25.0,
            25.0
          ]
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-21",
          "maxclass": "newobj",
          "numinlets": 3,
          "numoutlets": 3,
          "outlettype": [
            "",
            "audio.connect",
            "audio.connect"
          ],
          "patching_rect": [
            130.0,
            337.0,
            116.0,
            19.0
          ],
          "text": "jalg.sur.ambisonics~"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-24",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            50.0,
            117.0,
            160.0,
            17.0
          ],
          "text": "/documentation/generate"
        }
      },
      {
        "box": {
          "comment": "",
          "id": "obj-31",
          "maxclass": "inlet",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            10.0,
            127.0,
            25.0,
            25.0
          ]
        }
      },
      {
        "box": {
          "comment": "",
          "id": "obj-32",
          "maxclass": "outlet",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            10.0,
            377.0,
            25.0,
            25.0
          ]
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-33",
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
            477.0,
            194.0,
            574.0,
            31.0
          ],
          "text": "j.remote numSources",
          "varname": "source/voices"
        }
      },
      {
        "box": {
          "background": 1,
          "has_gain": 1,
          "has_mute": 1,
          "has_panel": 1,
          "id": "obj-36",
          "maxclass": "j.ui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            0.0,
            0.0,
            300.0,
            105.0
          ],
          "prefix": "audio",
          "presentation": 1,
          "presentation_rect": [
            0.0,
            0.0,
            300.0,
            105.0
          ],
          "text": "/editing_this_module"
        }
      }
    ],
    "lines": [
      {
        "patchline": {
          "destination": [
            "obj-30",
            0
          ],
          "disabled": 0,
          "hidden": 0,
          "midpoints": [
            79.5,
            163.5,
            19.5,
            163.5
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
            "obj-21",
            2
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
            "obj-9",
            0
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
            "obj-12",
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
            "obj-23",
            0
          ],
          "disabled": 0,
          "hidden": 0,
          "source": [
            "obj-13",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-30",
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
            "obj-14",
            0
          ],
          "disabled": 0,
          "hidden": 0,
          "midpoints": [
            435.5,
            302.5,
            280.5,
            302.5
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
            "obj-27",
            0
          ],
          "disabled": 0,
          "hidden": 0,
          "source": [
            "obj-18",
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
          "disabled": 0,
          "hidden": 0,
          "midpoints": [
            139.5,
            271.0,
            269.5,
            271.0,
            269.5,
            223.0,
            281.5,
            223.0
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
            "obj-21",
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
          "destination": [
            "obj-20",
            0
          ],
          "disabled": 0,
          "hidden": 0,
          "source": [
            "obj-21",
            2
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-62",
            0
          ],
          "disabled": 0,
          "hidden": 0,
          "source": [
            "obj-21",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-30",
            0
          ],
          "disabled": 0,
          "hidden": 0,
          "midpoints": [
            70.5,
            340.0,
            4.0,
            340.0,
            4.0,
            182.0,
            19.5,
            182.0
          ],
          "source": [
            "obj-23",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-30",
            0
          ],
          "disabled": 0,
          "hidden": 0,
          "midpoints": [
            59.5,
            153.0,
            19.5,
            153.0
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
            "obj-23",
            0
          ],
          "disabled": 0,
          "hidden": 0,
          "source": [
            "obj-25",
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
          "disabled": 0,
          "hidden": 0,
          "source": [
            "obj-27",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-37",
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
            "obj-39",
            0
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
            "obj-7",
            0
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
            "obj-32",
            0
          ],
          "disabled": 0,
          "hidden": 0,
          "source": [
            "obj-30",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-30",
            0
          ],
          "disabled": 0,
          "hidden": 0,
          "source": [
            "obj-31",
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
          "midpoints": [
            764.0,
            237.0,
            483.0,
            237.0,
            483.0,
            225.0,
            435.5,
            225.0
          ],
          "source": [
            "obj-33",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-40",
            0
          ],
          "disabled": 0,
          "hidden": 0,
          "source": [
            "obj-33",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-43",
            0
          ],
          "disabled": 0,
          "hidden": 0,
          "midpoints": [
            764.0,
            242.0,
            1049.0,
            242.0,
            1049.0,
            517.0,
            715.5,
            517.0
          ],
          "source": [
            "obj-33",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-44",
            0
          ],
          "disabled": 0,
          "hidden": 0,
          "source": [
            "obj-34",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-28",
            0
          ],
          "disabled": 0,
          "hidden": 0,
          "source": [
            "obj-37",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-63",
            0
          ],
          "disabled": 0,
          "hidden": 0,
          "source": [
            "obj-37",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-52",
            0
          ],
          "disabled": 0,
          "hidden": 0,
          "source": [
            "obj-38",
            1
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
            "obj-39",
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
          "disabled": 0,
          "hidden": 0,
          "source": [
            "obj-40",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-65",
            0
          ],
          "disabled": 0,
          "hidden": 0,
          "source": [
            "obj-43",
            2
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-34",
            0
          ],
          "disabled": 0,
          "hidden": 0,
          "source": [
            "obj-44",
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
          "disabled": 0,
          "hidden": 0,
          "source": [
            "obj-45",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-45",
            0
          ],
          "disabled": 0,
          "hidden": 0,
          "source": [
            "obj-46",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-48",
            0
          ],
          "disabled": 0,
          "hidden": 0,
          "source": [
            "obj-47",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-47",
            0
          ],
          "disabled": 0,
          "hidden": 0,
          "source": [
            "obj-48",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-71",
            0
          ],
          "disabled": 0,
          "hidden": 0,
          "source": [
            "obj-5",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-38",
            0
          ],
          "disabled": 0,
          "hidden": 0,
          "source": [
            "obj-52",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-79",
            0
          ],
          "disabled": 0,
          "hidden": 0,
          "source": [
            "obj-52",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-21",
            1
          ],
          "disabled": 0,
          "hidden": 0,
          "source": [
            "obj-54",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-30",
            0
          ],
          "disabled": 0,
          "hidden": 0,
          "source": [
            "obj-56",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-43",
            0
          ],
          "disabled": 0,
          "hidden": 0,
          "source": [
            "obj-63",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-70",
            0
          ],
          "disabled": 0,
          "hidden": 0,
          "source": [
            "obj-63",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-68",
            0
          ],
          "disabled": 0,
          "hidden": 0,
          "source": [
            "obj-65",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-30",
            0
          ],
          "disabled": 0,
          "hidden": 0,
          "midpoints": [
            743.5,
            617.0,
            4.0,
            617.0,
            4.0,
            182.0,
            19.5,
            182.0
          ],
          "source": [
            "obj-66",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-66",
            0
          ],
          "disabled": 0,
          "hidden": 0,
          "source": [
            "obj-68",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-66",
            0
          ],
          "disabled": 0,
          "hidden": 0,
          "source": [
            "obj-70",
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
            "obj-71",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-14",
            1
          ],
          "disabled": 0,
          "hidden": 0,
          "midpoints": [
            798.5,
            451.0,
            353.5,
            451.0,
            353.5,
            294.0,
            329.5,
            294.0
          ],
          "source": [
            "obj-79",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-37",
            0
          ],
          "disabled": 0,
          "hidden": 0,
          "midpoints": [
            700.5,
            467.0,
            506.5,
            467.0
          ],
          "source": [
            "obj-79",
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
            "obj-9",
            0
          ]
        }
      }
    ],
    "dependency_cache": [
      {
        "name": "jalg.sur.ambisonics~.maxpat",
        "bootpath": "/Users/nilspeters/Documents/gits/Jamoma/Modules/Modular/Max/modules/spatialization/sur.ambisonics~",
        "patcherrelativepath": "",
        "type": "JSON",
        "implicit": 1
      },
      {
        "name": "j.message.array.maxpat",
        "bootpath": "/Users/nilspeters/Documents/gits/Jamoma/Modules/Modular/Max/library/components/message.array",
        "patcherrelativepath": "../../../library/components/message.array",
        "type": "JSON",
        "implicit": 1
      },
      {
        "name": "j.message.array.instance.maxpat",
        "bootpath": "/Users/nilspeters/Documents/gits/Jamoma/Modules/Modular/Max/library/components/message.array",
        "patcherrelativepath": "../../../library/components/message.array",
        "type": "JSON",
        "implicit": 1
      },
      {
        "name": "j.ambipanSource.maxpat",
        "bootpath": "/Users/nilspeters/Documents/gits/Jamoma/Modules/Modular/Max/modules/spatialization/sur.ambipanning~",
        "patcherrelativepath": "../sur.ambipanning~",
        "type": "JSON",
        "implicit": 1
      },
      {
        "name": "j.list2parameter.maxpat",
        "bootpath": "/Users/nilspeters/Documents/gits/Jamoma/Modules/Modular/Max/library/components/list2parameter",
        "patcherrelativepath": "../../../library/components/list2parameter",
        "type": "JSON",
        "implicit": 1
      },
      {
        "name": "thru.maxpat",
        "bootpath": "/Users/nilspeters/Documents/gits/Jamoma/Modules/Modular/Max/library/components/thru",
        "patcherrelativepath": "../../../library/components/thru",
        "type": "JSON",
        "implicit": 1
      },
      {
        "name": "j.ui.mxo",
        "type": "iLaX"
      },
      {
        "name": "j.parameter.mxo",
        "type": "iLaX"
      },
      {
        "name": "ambiencode~.mxo",
        "type": "iLaX"
      },
      {
        "name": "ambidecode~.mxo",
        "type": "iLaX"
      },
      {
        "name": "j.oscroute.mxo",
        "type": "iLaX"
      },
      {
        "name": "j.init.mxo",
        "type": "iLaX"
      },
      {
        "name": "j.unit.mxo",
        "type": "iLaX"
      },
      {
        "name": "j.oscinstance.mxo",
        "type": "iLaX"
      },
      {
        "name": "j.pass.mxo",
        "type": "iLaX"
      },
      {
        "name": "j.pack=.mxo",
        "type": "iLaX"
      },
      {
        "name": "j.unpack=.mxo",
        "type": "iLaX"
      },
      {
        "name": "j.in.mxo",
        "type": "iLaX"
      },
      {
        "name": "j.model.mxo",
        "type": "iLaX"
      },
      {
        "name": "j.message.mxo",
        "type": "iLaX"
      },
      {
        "name": "j.textslider.mxo",
        "type": "iLaX"
      }
    ]
  }
}