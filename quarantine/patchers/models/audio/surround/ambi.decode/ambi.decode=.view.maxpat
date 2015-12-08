{
  "patcher": {
    "fileversion": 1,
    "appversion": {
      "major": 6,
      "minor": 0,
      "revision": 4
    },
    "rect": [
      25.0,
      44.0,
      1255.0,
      706.0
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
          "id": "obj-41",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            503.0,
            529.0,
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
          "id": "obj-37",
          "maxclass": "newobj",
          "numinlets": 2,
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
              "revision": 4
            },
            "rect": [
              601.0,
              225.0,
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
                  "id": "obj-4",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    151.0,
                    165.0,
                    70.0,
                    18.0
                  ],
                  "text": "set $1 1 $2"
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
                    151.0,
                    242.0,
                    25.0,
                    25.0
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
                  "numoutlets": 1,
                  "outlettype": [
                    "list"
                  ],
                  "patching_rect": [
                    151.0,
                    144.0,
                    66.0,
                    19.0
                  ],
                  "text": "listfunnel 0"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-29",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "outlettype": [
                    "list"
                  ],
                  "patching_rect": [
                    50.0,
                    144.0,
                    67.0,
                    19.0
                  ],
                  "text": "listfunnel 1"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-19",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    50.0,
                    166.0,
                    71.0,
                    19.0
                  ],
                  "text": "prepend set"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-18",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    ""
                  ],
                  "patching_rect": [
                    50.0,
                    100.0,
                    56.0,
                    19.0
                  ],
                  "text": "route set"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-17",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    ""
                  ],
                  "patching_rect": [
                    50.0,
                    122.0,
                    266.0,
                    19.0
                  ],
                  "text": "zl slice"
                }
              },
              {
                "box": {
                  "comment": "",
                  "id": "obj-23",
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
                  "maxclass": "inlet",
                  "numinlets": 0,
                  "numoutlets": 1,
                  "outlettype": [
                    "int"
                  ],
                  "patching_rect": [
                    297.0,
                    40.0,
                    25.0,
                    25.0
                  ]
                }
              },
              {
                "box": {
                  "comment": "",
                  "id": "obj-33",
                  "maxclass": "outlet",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    50.0,
                    245.0,
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
                    "obj-4",
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
                    "obj-1",
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
                    "obj-29",
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
                    "obj-33",
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
                    "obj-18",
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
                    "obj-19",
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
                    "obj-17",
                    1
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
                    "obj-3",
                    0
                  ],
                  "disabled": 0,
                  "hidden": 0,
                  "source": [
                    "obj-4",
                    0
                  ]
                }
              }
            ],
            "dependency_cache": [

            ]
          },
          "patching_rect": [
            602.0,
            575.0,
            308.0,
            19.0
          ],
          "saved_object_attributes": {
            "default_fontface": 0,
            "globalpatchername": "",
            "digest": "",
            "default_fontname": "Arial",
            "fontname": "Arial",
            "default_fontsize": 12.0,
            "description": "",
            "fontface": 0,
            "fontsize": 12.0,
            "tags": ""
          },
          "text": "p set_multislider"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-20",
          "maxclass": "newobj",
          "numinlets": 3,
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
              "revision": 4
            },
            "rect": [
              142.0,
              60.0,
              501.0,
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
                  "id": "obj-36",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "bang",
                    "int"
                  ],
                  "patching_rect": [
                    340.0,
                    335.0,
                    32.5,
                    20.0
                  ],
                  "text": "t b i"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-33",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    340.0,
                    264.0,
                    57.0,
                    18.0
                  ],
                  "text": "$2 $1 $3"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-23",
                  "maxclass": "newobj",
                  "numinlets": 3,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    340.0,
                    389.0,
                    112.0,
                    20.0
                  ],
                  "text": "pack select 0 1."
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-22",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    "int"
                  ],
                  "patching_rect": [
                    387.0,
                    362.0,
                    32.5,
                    20.0
                  ],
                  "text": "+ 1"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-21",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "int",
                    "float"
                  ],
                  "patching_rect": [
                    339.0,
                    307.0,
                    113.0,
                    20.0
                  ],
                  "text": "unpack 0 0."
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-18",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    ""
                  ],
                  "patching_rect": [
                    339.0,
                    283.0,
                    48.0,
                    20.0
                  ],
                  "text": "route 1"
                }
              },
              {
                "box": {
                  "annotation": "ambisonics order weights",
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "frgb": [
                    0.0,
                    0.0,
                    0.0,
                    1.0
                  ],
                  "id": "obj-46",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    190.0,
                    12.0,
                    150.0,
                    20.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    196.0,
                    6.0,
                    150.0,
                    20.0
                  ],
                  "text": "Ambisonics Order Weights",
                  "underline": 1
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-30",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "outlettype": [
                    "bang"
                  ],
                  "patching_rect": [
                    434.0,
                    119.0,
                    60.0,
                    20.0
                  ],
                  "text": "loadbang"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-29",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    434.0,
                    145.0,
                    162.0,
                    18.0
                  ],
                  "text": "row 0 readonly 1, datadirty 1"
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
                      "revision": 4
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
                          "id": "obj-19",
                          "maxclass": "message",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            50.0,
                            182.0,
                            70.0,
                            18.0
                          ],
                          "text": "set $1 0 $1"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-17",
                          "maxclass": "newobj",
                          "numinlets": 2,
                          "numoutlets": 3,
                          "outlettype": [
                            "bang",
                            "bang",
                            "int"
                          ],
                          "patching_rect": [
                            59.0,
                            106.0,
                            46.0,
                            20.0
                          ],
                          "text": "uzi 8 0"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-16",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            123.0,
                            100.0,
                            87.0,
                            20.0
                          ],
                          "text": "expr 490. / $i1"
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
                            123.0,
                            126.0,
                            69.0,
                            18.0
                          ],
                          "text": "colwidth $1"
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
                            217.0,
                            100.0,
                            50.0,
                            18.0
                          ],
                          "text": "cols $1"
                        }
                      },
                      {
                        "box": {
                          "comment": "",
                          "id": "obj-25",
                          "maxclass": "inlet",
                          "numinlets": 0,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            128.0,
                            40.0,
                            25.0,
                            25.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "comment": "",
                          "id": "obj-26",
                          "maxclass": "outlet",
                          "numinlets": 1,
                          "numoutlets": 0,
                          "patching_rect": [
                            125.0,
                            260.0,
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
                            "obj-26",
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
                            "obj-26",
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
                            "obj-15",
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
                            "obj-19",
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
                            "obj-26",
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
                            "obj-13",
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
                            "obj-16",
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
                            "obj-17",
                            0
                          ],
                          "disabled": 0,
                          "hidden": 0,
                          "source": [
                            "obj-25",
                            0
                          ]
                        }
                      }
                    ],
                    "dependency_cache": [

                    ]
                  },
                  "patching_rect": [
                    395.0,
                    86.0,
                    85.0,
                    20.0
                  ],
                  "saved_object_attributes": {
                    "default_fontface": 0,
                    "globalpatchername": "",
                    "digest": "",
                    "default_fontname": "Arial",
                    "fontname": "Arial",
                    "default_fontsize": 12.0,
                    "description": "",
                    "fontface": 0,
                    "fontsize": 12.0,
                    "tags": ""
                  },
                  "text": "p setCellblock"
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
                    340.0,
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
                  "id": "obj-14",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    ""
                  ],
                  "patching_rect": [
                    395.0,
                    60.0,
                    63.0,
                    20.0
                  ],
                  "text": "route size"
                }
              },
              {
                "box": {
                  "comment": "",
                  "id": "obj-12",
                  "maxclass": "outlet",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    164.0,
                    417.0,
                    25.0,
                    25.0
                  ]
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
                    45.0,
                    420.0,
                    25.0,
                    25.0
                  ]
                }
              },
              {
                "box": {
                  "bgcolor": [
                    1.0,
                    1.0,
                    1.0,
                    0.309804
                  ],
                  "contdata": 1,
                  "ghostbar": 6,
                  "hint": "ambisonics order weights",
                  "id": "obj-8",
                  "maxclass": "multislider",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    ""
                  ],
                  "parameter_enable": 0,
                  "patching_rect": [
                    165.0,
                    76.0,
                    101.0,
                    38.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    5.0,
                    32.0,
                    490.0,
                    105.0
                  ],
                  "setminmax": [
                    0.0,
                    1.0
                  ],
                  "setstyle": 1,
                  "size": 4,
                  "spacing": 1
                }
              },
              {
                "box": {
                  "comment": "",
                  "id": "obj-7",
                  "maxclass": "inlet",
                  "numinlets": 0,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    164.0,
                    11.0,
                    25.0,
                    25.0
                  ]
                }
              },
              {
                "box": {
                  "colhead": 1,
                  "cols": 4,
                  "colwidth": 122,
                  "datadirty": 1,
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "hscroll": 0,
                  "hsync": 0,
                  "id": "obj-6",
                  "just": 1,
                  "maxclass": "jit.cellblock",
                  "numinlets": 2,
                  "numoutlets": 4,
                  "outlettype": [
                    "list",
                    "",
                    "",
                    ""
                  ],
                  "outmode": 1,
                  "patching_rect": [
                    340.0,
                    203.0,
                    506.0,
                    56.0
                  ],
                  "precision": 3,
                  "presentation": 1,
                  "presentation_rect": [
                    5.0,
                    140.0,
                    490.0,
                    37.0
                  ],
                  "rowdef": [
                    [
                      0,
                      0,
                      1,
                      0.0,
                      0.0,
                      0.0,
                      1.0,
                      1,
                      0.0,
                      0.0,
                      0.0,
                      1.0,
                      -1,
                      -1,
                      1
                    ]
                  ],
                  "rows": 2,
                  "selmode": 5,
                  "selsync": 0,
                  "vscroll": 0,
                  "vsync": 0
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
                    16.0,
                    7.0,
                    25.0,
                    25.0
                  ]
                }
              },
              {
                "box": {
                  "background": 1,
                  "id": "obj-47",
                  "ignoreclick": 1,
                  "maxclass": "panel",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    193.0,
                    13.0,
                    133.0,
                    20.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    1.0,
                    3.0,
                    499.0,
                    177.0
                  ]
                }
              }
            ],
            "lines": [
              {
                "patchline": {
                  "destination": [
                    "obj-27",
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
                    "obj-23",
                    2
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
                    "obj-36",
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
                    1
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
                    "obj-8",
                    0
                  ],
                  "disabled": 0,
                  "hidden": 0,
                  "midpoints": [
                    349.5,
                    414.0,
                    325.0,
                    414.0,
                    325.0,
                    63.0,
                    174.5,
                    63.0
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
                    "obj-6",
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
                    "obj-6",
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
                    "obj-18",
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
                    "obj-22",
                    0
                  ],
                  "disabled": 0,
                  "hidden": 0,
                  "source": [
                    "obj-36",
                    1
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
                    "obj-36",
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
                    "obj-6",
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
                    173.5,
                    51.5,
                    404.5,
                    51.5
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
                    "obj-8",
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
            ],
            "dependency_cache": [

            ]
          },
          "patching_rect": [
            488.0,
            556.0,
            48.0,
            19.0
          ],
          "saved_object_attributes": {
            "default_fontface": 0,
            "globalpatchername": "",
            "digest": "",
            "default_fontname": "Arial",
            "fontname": "Arial",
            "default_fontsize": 12.0,
            "description": "",
            "fontface": 0,
            "fontsize": 12.0,
            "tags": ""
          },
          "text": "p panel"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-16",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            23.0,
            364.0,
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
          "id": "obj-15",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "open"
          ],
          "patching_rect": [
            23.0,
            340.0,
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
          "id": "obj-13",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            23.0,
            318.0,
            100.0,
            19.0
          ],
          "text": "route /view/panel"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-14",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            602.0,
            429.0,
            50.0,
            17.0
          ],
          "text": "size $1"
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
            "int"
          ],
          "patching_rect": [
            602.0,
            404.0,
            38.5,
            19.0
          ],
          "text": "+ 1"
        }
      },
      {
        "box": {
          "annotation": "ambisonics order weights",
          "contdata": 1,
          "ghostbar": 6,
          "hint": "ambisonics order weights",
          "id": "obj-7",
          "maxclass": "multislider",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "parameter_enable": 0,
          "patching_rect": [
            602.0,
            453.0,
            173.0,
            68.0
          ],
          "presentation": 1,
          "presentation_rect": [
            88.0,
            22.0,
            208.0,
            46.0
          ],
          "setminmax": [
            0.0,
            1.0
          ],
          "setstyle": 1,
          "size": 4,
          "spacing": 1
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-9",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            176.0,
            283.0,
            41.0,
            17.0
          ],
          "text": "report"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-5",
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
            602.0,
            528.0,
            296.0,
            43.0
          ],
          "text": "j.remote orderWeights"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-4",
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
            600.0,
            166.0,
            560.0,
            31.0
          ],
          "text": "j.remote 32"
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
            907.0,
            324.0,
            100.0,
            17.0
          ],
          "text": "range 1 4"
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
            738.0,
            327.0,
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
            794.0,
            299.0,
            189.0,
            19.0
          ],
          "text": "sel Furse-Malham N3D SN3D"
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
            601.0,
            262.0,
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
            495.0,
            265.744507,
            100.0,
            19.0
          ],
          "presentation": 1,
          "presentation_rect": [
            149.0,
            0.744507,
            100.0,
            19.0
          ]
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-12",
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
            601.0,
            132.0,
            573.0,
            31.0
          ],
          "text": "j.remote 32"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-10",
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
            601.0,
            82.0,
            598.0,
            43.0
          ],
          "text": "j.remote 32"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-6",
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
            602.0,
            218.0,
            604.0,
            31.0
          ],
          "text": "j.remote report"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-8",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            300.0,
            106.0,
            196.0,
            17.0
          ],
          "text": "/preset/store 1 default, /preset/write"
        }
      },
      {
        "box": {
          "annotation": "Order of decoding for ambisonic signal.  Changes only take effect when audio is off.",
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-32",
          "maxclass": "number",
          "mouseup": 1,
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "int",
            "bang"
          ],
          "parameter_enable": 0,
          "patching_rect": [
            566.0,
            370.0,
            22.0,
            19.0
          ],
          "presentation": 1,
          "presentation_rect": [
            58.0,
            43.0,
            27.0,
            19.0
          ],
          "triangle": 0
        }
      },
      {
        "box": {
          "annotation": "The number of audio channels that the ambisonic signal is diffused to. Changes only take effect when audio is off.",
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-28",
          "maxclass": "number",
          "mouseup": 1,
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "int",
            "bang"
          ],
          "parameter_enable": 0,
          "patching_rect": [
            566.0,
            11.0,
            22.0,
            19.0
          ],
          "presentation": 1,
          "presentation_rect": [
            58.0,
            22.0,
            27.0,
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
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            129.0,
            258.0,
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
          "id": "obj-2",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            331.0,
            354.0,
            206.0,
            19.0
          ],
          "text": "----multicable signal output----"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-3",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            135.0,
            106.0,
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
          "frgb": [
            0.0,
            0.0,
            0.0,
            1.0
          ],
          "id": "obj-24",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            3.0,
            42.0,
            48.0,
            19.0
          ],
          "presentation": 1,
          "presentation_rect": [
            5.0,
            44.0,
            48.0,
            19.0
          ],
          "text": "Order"
        }
      },
      {
        "box": {
          "comment": "Channel 1",
          "id": "obj-25",
          "maxclass": "outlet",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            305.0,
            350.0,
            25.0,
            25.0
          ]
        }
      },
      {
        "box": {
          "comment": "W - omni",
          "id": "obj-26",
          "maxclass": "inlet",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            305.0,
            257.0,
            25.0,
            25.0
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
          "id": "obj-27",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            331.0,
            260.0,
            207.0,
            19.0
          ],
          "text": "----multicable signal input----"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-31",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "",
            "audio.connect"
          ],
          "patching_rect": [
            129.0,
            318.0,
            195.0,
            19.0
          ],
          "text": "jalg.sur.ambi.decode~"
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
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            0.0,
            151.0,
            408.0,
            31.0
          ],
          "text": "j.model @description \"Decoding ambisonic signal to multispeaker setup. NOTE: The positions of the speakers are not maintained by this module.\"",
          "varname": "j.model"
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
          "id": "obj-35",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            30.0,
            106.0,
            100.0,
            19.0
          ],
          "text": "command input"
        }
      },
      {
        "box": {
          "comment": "",
          "id": "obj-36",
          "maxclass": "inlet",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            0.0,
            106.0,
            25.0,
            25.0
          ]
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-39",
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
            601.0,
            364.0,
            601.0,
            31.0
          ],
          "text": "j.remote order",
          "varname": "order"
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
          "id": "obj-40",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            3.0,
            22.0,
            61.0,
            19.0
          ],
          "presentation": 1,
          "presentation_rect": [
            4.0,
            23.0,
            55.0,
            19.0
          ],
          "text": "Speakers"
        }
      },
      {
        "box": {
          "comment": "",
          "id": "obj-42",
          "maxclass": "outlet",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            0.0,
            246.0,
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
            601.0,
            5.0,
            600.0,
            43.0
          ],
          "text": "j.remote numSpeakers",
          "varname": "voices"
        }
      },
      {
        "box": {
          "has_gain": 1,
          "has_mute": 1,
          "has_panel": 1,
          "id": "obj-46",
          "maxclass": "j.ui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            -1.0,
            0.0,
            300.0,
            70.0
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
            "obj-13",
            0
          ],
          "disabled": 0,
          "hidden": 0,
          "midpoints": [
            138.5,
            297.0,
            32.5,
            297.0
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
            "obj-31",
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
            "obj-14",
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
            "obj-37",
            1
          ],
          "disabled": 0,
          "hidden": 0,
          "midpoints": [
            611.5,
            425.5,
            900.5,
            425.5
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
            "obj-41",
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
            "obj-7",
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
            "obj-20",
            0
          ],
          "disabled": 0,
          "hidden": 0,
          "midpoints": [
            32.5,
            548.0,
            497.5,
            548.0
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
            "obj-5",
            0
          ],
          "disabled": 0,
          "hidden": 0,
          "source": [
            "obj-20",
            1
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
            "obj-26",
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
            "obj-28",
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
          "disabled": 0,
          "hidden": 0,
          "midpoints": [
            144.5,
            136.5,
            9.5,
            136.5
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
            "obj-25",
            0
          ],
          "disabled": 0,
          "hidden": 0,
          "source": [
            "obj-31",
            1
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
          "midpoints": [
            138.5,
            523.0,
            611.5,
            523.0
          ],
          "source": [
            "obj-31",
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
            "obj-32",
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
          "source": [
            "obj-34",
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
            "obj-20",
            2
          ],
          "disabled": 0,
          "hidden": 0,
          "midpoints": [
            900.5,
            607.0,
            564.0,
            607.0,
            564.0,
            551.0,
            526.5,
            551.0
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
            "obj-41",
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
            "obj-7",
            0
          ],
          "disabled": 0,
          "hidden": 0,
          "midpoints": [
            611.5,
            603.0,
            594.5,
            603.0,
            594.5,
            447.0,
            611.5,
            447.0
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
            "obj-11",
            0
          ],
          "disabled": 0,
          "hidden": 0,
          "midpoints": [
            901.5,
            400.5,
            611.5,
            400.5
          ],
          "source": [
            "obj-39",
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
            "obj-39",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-20",
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
            "obj-28",
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
            "obj-37",
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
            "obj-53",
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
            "obj-39",
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
            "obj-39",
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
            "obj-5",
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
            "obj-34",
            0
          ],
          "disabled": 0,
          "hidden": 0,
          "midpoints": [
            309.5,
            136.5,
            9.5,
            136.5
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
            "obj-31",
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
        "name": "jalg.sur.ambi.decode~.maxpat",
        "bootpath": "/Users/nilspeters/Documents/gits/Jamoma/Modules/Modular/Max/modules/spatialization/sur.ambi.decode~",
        "patcherrelativepath": "",
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
        "name": "j.ui.mxo",
        "type": "iLaX"
      },
      {
        "name": "j.parameter.mxo",
        "type": "iLaX"
      },
      {
        "name": "j.model.mxo",
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
        "name": "j.oscinstance.mxo",
        "type": "iLaX"
      },
      {
        "name": "j.unit.mxo",
        "type": "iLaX"
      },
      {
        "name": "j.pass.mxo",
        "type": "iLaX"
      },
      {
        "name": "j.unpack=.mxo",
        "type": "iLaX"
      },
      {
        "name": "j.pack=.mxo",
        "type": "iLaX"
      },
      {
        "name": "j.in.mxo",
        "type": "iLaX"
      },
      {
        "name": "j.message.mxo",
        "type": "iLaX"
      }
    ]
  }
}