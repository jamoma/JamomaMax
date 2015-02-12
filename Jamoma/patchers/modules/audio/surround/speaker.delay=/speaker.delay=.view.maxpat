{
  "patcher": {
    "fileversion": 1,
    "rect": [
      75.0,
      78.0,
      1000.0,
      437.0
    ],
    "bglocked": 0,
    "defrect": [
      75.0,
      78.0,
      1000.0,
      437.0
    ],
    "openrect": [
      0.0,
      0.0,
      0.0,
      0.0
    ],
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
          "id": "obj-19",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "open"
          ],
          "patching_rect": [
            50.0,
            218.0,
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
          "id": "obj-16",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            50.0,
            195.0,
            144.0,
            19.0
          ],
          "text": "j.oscroute /view/panel"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "hint": "if automatic is enabled, delays are calculated according to position data, if manual is enabled you can set the delay values freely in the inspector",
          "id": "obj-15",
          "maxclass": "textbutton",
          "mode": 1,
          "numinlets": 1,
          "numoutlets": 3,
          "outlettype": [
            "",
            "",
            "int"
          ],
          "patching_rect": [
            360.0,
            345.0,
            63.0,
            21.0
          ],
          "presentation": 1,
          "presentation_rect": [
            103.0,
            23.0,
            46.0,
            22.0
          ],
          "rounded": 8.0,
          "text": "manual ",
          "texton": "auto",
          "truncate": 0
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-14",
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
            427.0,
            345.0,
            366.0,
            31.0
          ],
          "text": "j.remote automatic"
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
          "id": "obj-22",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            161.0,
            37.0,
            110.0,
            19.0
          ],
          "presentation": 1,
          "presentation_rect": [
            1.0,
            44.0,
            80.0,
            19.0
          ],
          "text": "Temperature:"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-6",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            332.0,
            18.0,
            50.0,
            19.0
          ],
          "presentation": 1,
          "presentation_rect": [
            76.0,
            45.0,
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
          "id": "obj-7",
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
            395.0,
            6.0,
            603.0,
            43.0
          ],
          "text": "j.remote temperature",
          "varname": "voices[1]"
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
            50.0,
            238.0,
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
          "id": "obj-5",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patcher": {
            "fileversion": 1,
            "rect": [
              1039.0,
              59.0,
              157.0,
              343.0
            ],
            "bglocked": 0,
            "defrect": [
              1039.0,
              59.0,
              157.0,
              343.0
            ],
            "openrect": [
              0.0,
              0.0,
              0.0,
              0.0
            ],
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
            "toolbarvisible": 0,
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
                  "id": "obj-39",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patcher": {
                    "fileversion": 1,
                    "rect": [
                      539.0,
                      109.0,
                      640.0,
                      480.0
                    ],
                    "bglocked": 0,
                    "defrect": [
                      539.0,
                      109.0,
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
                          "id": "obj-11",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 2,
                          "outlettype": [
                            "bang",
                            "int"
                          ],
                          "patching_rect": [
                            297.0,
                            79.0,
                            34.0,
                            19.0
                          ],
                          "text": "t b 2"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-10",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 2,
                          "outlettype": [
                            "bang",
                            "int"
                          ],
                          "patching_rect": [
                            257.0,
                            79.0,
                            34.0,
                            19.0
                          ],
                          "text": "t b 1"
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
                            321.0,
                            206.0,
                            169.0,
                            19.0
                          ],
                          "text": "gate 2 0"
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
                            471.0,
                            238.0,
                            143.0,
                            19.0
                          ],
                          "text": "prepend script sendtoback"
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
                            322.0,
                            238.0,
                            146.0,
                            19.0
                          ],
                          "text": "prepend script bringtofront"
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
                            204.0,
                            168.0,
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
                          "id": "obj-6",
                          "maxclass": "message",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            204.0,
                            148.0,
                            84.0,
                            17.0
                          ],
                          "text": "bypassSign $1"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-4",
                          "maxclass": "newobj",
                          "numinlets": 2,
                          "numoutlets": 3,
                          "outlettype": [
                            "bang",
                            "bang",
                            "int"
                          ],
                          "patching_rect": [
                            174.0,
                            122.0,
                            46.0,
                            19.0
                          ],
                          "text": "uzi 8 1"
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
                            346.0,
                            404.0,
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
                          "numinlets": 1,
                          "numoutlets": 3,
                          "outlettype": [
                            "bang",
                            "bang",
                            ""
                          ],
                          "patching_rect": [
                            256.0,
                            38.0,
                            100.0,
                            19.0
                          ],
                          "text": "sel 1 0"
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
                            256.0,
                            10.0,
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
                            "obj-2",
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
                            "obj-4",
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
                            "obj-5",
                            0
                          ],
                          "hidden": 0,
                          "midpoints": [
                            281.5,
                            109.5,
                            330.5,
                            109.5
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
                            "obj-4",
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
                            "obj-5",
                            0
                          ],
                          "hidden": 0,
                          "midpoints": [
                            321.5,
                            110.5,
                            330.5,
                            110.5
                          ],
                          "source": [
                            "obj-11",
                            1
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
                            "obj-2",
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
                          "hidden": 0,
                          "midpoints": [

                          ],
                          "source": [
                            "obj-4",
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
                            "obj-9",
                            0
                          ],
                          "hidden": 0,
                          "midpoints": [

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
                            "obj-7",
                            0
                          ],
                          "hidden": 0,
                          "midpoints": [

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
                            "obj-5",
                            1
                          ],
                          "hidden": 0,
                          "midpoints": [
                            213.5,
                            199.5,
                            480.5,
                            199.5
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
                            "obj-3",
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
                            "obj-3",
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
                  },
                  "patching_rect": [
                    112.0,
                    60.0,
                    72.0,
                    19.0
                  ],
                  "saved_object_attributes": {
                    "default_fontname": "Arial",
                    "fontname": "Arial",
                    "default_fontsize": 12.0,
                    "fontface": 0,
                    "fontsize": 12.0,
                    "globalpatchername": "",
                    "default_fontface": 0
                  },
                  "text": "p hide-show"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-38",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    ""
                  ],
                  "patching_rect": [
                    112.0,
                    82.0,
                    67.0,
                    19.0
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
                  "id": "obj-5",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    23.0,
                    190.0,
                    80.0,
                    19.0
                  ],
                  "text": "prepend set 0"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-10",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    24.0,
                    168.0,
                    46.0,
                    19.0
                  ],
                  "text": "pack i i"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-12",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 3,
                  "outlettype": [
                    "bang",
                    "bang",
                    "int"
                  ],
                  "patching_rect": [
                    15.0,
                    139.0,
                    51.0,
                    19.0
                  ],
                  "text": "uzi 32 1"
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
                    "int"
                  ],
                  "patching_rect": [
                    46.0,
                    70.0,
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
                  "id": "obj-7",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    45.0,
                    94.0,
                    50.0,
                    17.0
                  ],
                  "text": "rows $1"
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
                    131.0,
                    127.0,
                    25.0,
                    25.0
                  ]
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-32",
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
                          "id": "obj-19",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            50.0,
                            178.0,
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
                          "id": "obj-18",
                          "maxclass": "message",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            73.0,
                            153.0,
                            94.0,
                            17.0
                          ],
                          "text": "mode selmode 5"
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
                            50.0,
                            129.0,
                            94.0,
                            17.0
                          ],
                          "text": "mode selmode 1"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-7",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 3,
                          "outlettype": [
                            "bang",
                            "bang",
                            ""
                          ],
                          "patching_rect": [
                            53.0,
                            100.0,
                            46.0,
                            19.0
                          ],
                          "text": "sel 1 0"
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
                            ""
                          ],
                          "patching_rect": [
                            53.0,
                            40.0,
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
                            50.0,
                            257.0,
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
                            "obj-19",
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
                            "obj-19",
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
                            "obj-31",
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
                            "obj-30",
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

                          ],
                          "source": [
                            "obj-7",
                            1
                          ]
                        }
                      }
                    ]
                  },
                  "patching_rect": [
                    259.0,
                    93.0,
                    62.0,
                    19.0
                  ],
                  "saved_object_attributes": {
                    "default_fontname": "Arial",
                    "fontname": "Arial",
                    "default_fontsize": 12.0,
                    "fontface": 0,
                    "fontsize": 12.0,
                    "globalpatchername": "",
                    "default_fontface": 0
                  },
                  "text": "p selmode"
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
                    206.0,
                    118.0,
                    37.0,
                    19.0
                  ],
                  "text": "== 0"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-27",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    96.0,
                    295.0,
                    52.0,
                    19.0
                  ],
                  "text": "gate 1 0"
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
                  "patcher": {
                    "fileversion": 1,
                    "rect": [
                      25.0,
                      69.0,
                      369.0,
                      478.0
                    ],
                    "bglocked": 0,
                    "defrect": [
                      25.0,
                      69.0,
                      369.0,
                      478.0
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
                          "id": "obj-1",
                          "maxclass": "newobj",
                          "numinlets": 2,
                          "numoutlets": 2,
                          "outlettype": [
                            "",
                            ""
                          ],
                          "patching_rect": [
                            92.0,
                            296.0,
                            58.0,
                            19.0
                          ],
                          "text": "zl change"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-8",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 2,
                          "outlettype": [
                            "",
                            ""
                          ],
                          "patching_rect": [
                            65.0,
                            145.0,
                            47.0,
                            19.0
                          ],
                          "text": "route 0"
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
                            "",
                            ""
                          ],
                          "patching_rect": [
                            30.0,
                            94.0,
                            54.0,
                            19.0
                          ],
                          "text": "route int"
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
                            92.0,
                            266.0,
                            41.0,
                            19.0
                          ],
                          "text": "zl join"
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
                            ""
                          ],
                          "patching_rect": [
                            93.0,
                            199.0,
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
                          "id": "obj-10",
                          "maxclass": "message",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            93.0,
                            174.0,
                            109.0,
                            17.0
                          ],
                          "text": "/speaker. $1 /delay"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-5",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 2,
                          "outlettype": [
                            "int",
                            "float"
                          ],
                          "patching_rect": [
                            65.0,
                            118.0,
                            69.0,
                            19.0
                          ],
                          "text": "unpack i f"
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
                            30.0,
                            71.0,
                            47.0,
                            19.0
                          ],
                          "text": "route 1"
                        }
                      },
                      {
                        "box": {
                          "comment": "",
                          "id": "obj-21",
                          "maxclass": "inlet",
                          "numinlets": 0,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            30.0,
                            39.0,
                            25.0,
                            25.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "comment": "",
                          "id": "obj-24",
                          "maxclass": "outlet",
                          "numinlets": 1,
                          "numoutlets": 0,
                          "patching_rect": [
                            91.0,
                            392.5,
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
                            "obj-12",
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
                            "obj-13",
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
                            "obj-1",
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
                            "obj-3",
                            0
                          ],
                          "hidden": 0,
                          "midpoints": [

                          ],
                          "source": [
                            "obj-21",
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
                            "obj-22",
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
                            "obj-13",
                            1
                          ],
                          "hidden": 0,
                          "midpoints": [

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
                            "obj-8",
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
                            "obj-10",
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
                      }
                    ]
                  },
                  "patching_rect": [
                    91.0,
                    334.0,
                    195.0,
                    19.0
                  ],
                  "saved_object_attributes": {
                    "default_fontname": "Arial",
                    "fontname": "Arial",
                    "default_fontsize": 12.0,
                    "fontface": 0,
                    "fontsize": 12.0,
                    "globalpatchername": "",
                    "default_fontface": 0
                  },
                  "text": "p"
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
                    385.0,
                    181.0,
                    105.0,
                    19.0
                  ],
                  "text": "prepend automatic"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-4",
                  "maxclass": "textbutton",
                  "mode": 1,
                  "numinlets": 1,
                  "numoutlets": 3,
                  "outlettype": [
                    "",
                    "",
                    "int"
                  ],
                  "patching_rect": [
                    258.0,
                    72.0,
                    112.0,
                    17.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    3.0,
                    5.0,
                    151.0,
                    24.0
                  ],
                  "rounded": 8.0,
                  "text": "Manual",
                  "texton": "Automatic on"
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
                    92.0,
                    473.0,
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
                  "numinlets": 1,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patcher": {
                    "fileversion": 1,
                    "rect": [
                      25.0,
                      69.0,
                      640.0,
                      480.0
                    ],
                    "bglocked": 0,
                    "defrect": [
                      25.0,
                      69.0,
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
                          "id": "obj-13",
                          "linecount": 3,
                          "maxclass": "message",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            129.0,
                            118.0,
                            89.0,
                            41.0
                          ],
                          "text": "set 1 0 delay [ms], set 0 0 index"
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
                            82.0,
                            218.0,
                            80.0,
                            19.0
                          ],
                          "text": "prepend set 0"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-6",
                          "maxclass": "newobj",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            83.0,
                            196.0,
                            46.0,
                            19.0
                          ],
                          "text": "pack i i"
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
                            "bang"
                          ],
                          "patching_rect": [
                            80.0,
                            79.0,
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
                          "id": "obj-3",
                          "maxclass": "newobj",
                          "numinlets": 2,
                          "numoutlets": 3,
                          "outlettype": [
                            "bang",
                            "bang",
                            "int"
                          ],
                          "patching_rect": [
                            50.0,
                            123.0,
                            51.0,
                            19.0
                          ],
                          "text": "uzi 32 1"
                        }
                      },
                      {
                        "box": {
                          "comment": "",
                          "id": "obj-14",
                          "maxclass": "inlet",
                          "numinlets": 0,
                          "numoutlets": 1,
                          "outlettype": [
                            "bang"
                          ],
                          "patching_rect": [
                            106.0,
                            17.0,
                            25.0,
                            25.0
                          ]
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
                            90.0,
                            297.0,
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
                            "obj-16",
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
                            "obj-3",
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
                            "obj-6",
                            1
                          ],
                          "hidden": 0,
                          "midpoints": [

                          ],
                          "source": [
                            "obj-3",
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
                            "obj-3",
                            2
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
                            "obj-4",
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
                            "obj-6",
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
                          "hidden": 0,
                          "midpoints": [

                          ],
                          "source": [
                            "obj-7",
                            0
                          ]
                        }
                      }
                    ]
                  },
                  "patching_rect": [
                    276.0,
                    235.0,
                    36.0,
                    19.0
                  ],
                  "saved_object_attributes": {
                    "default_fontname": "Arial",
                    "fontname": "Arial",
                    "default_fontsize": 12.0,
                    "fontface": 0,
                    "fontsize": 12.0,
                    "globalpatchername": "",
                    "default_fontface": 0
                  },
                  "text": "p init"
                }
              },
              {
                "box": {
                  "colhead": 1,
                  "cols": 2,
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "frozen_box_attributes": [
                    "selmode"
                  ],
                  "id": "obj-11",
                  "maxclass": "jit.cellblock",
                  "numinlets": 2,
                  "numoutlets": 4,
                  "outlettype": [
                    "list",
                    "",
                    "",
                    ""
                  ],
                  "patching_rect": [
                    130.0,
                    261.0,
                    177.0,
                    28.0
                  ],
                  "precision": 5,
                  "presentation": 1,
                  "presentation_rect": [
                    3.0,
                    32.0,
                    154.0,
                    310.0
                  ],
                  "rowhead": 1,
                  "rows": 3,
                  "selmode": 1
                }
              },
              {
                "box": {
                  "id": "obj-9",
                  "maxclass": "button",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "outlettype": [
                    "bang"
                  ],
                  "patching_rect": [
                    251.0,
                    234.0,
                    20.0,
                    20.0
                  ]
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-2",
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
                    20.0,
                    38.0,
                    291.0,
                    19.0
                  ],
                  "text": "j.oscroute /numSpeakers /audio/bypass /automatic"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-26",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    131.0,
                    157.0,
                    78.0,
                    19.0
                  ],
                  "text": "prepend set 1"
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
                    20.0,
                    7.0,
                    25.0,
                    25.0
                  ]
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 15.0,
                  "frgb": [
                    1.0,
                    0.0,
                    0.0,
                    1.0
                  ],
                  "id": "obj-14",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    453.0,
                    230.0,
                    36.0,
                    25.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    39.0,
                    76.0,
                    28.0,
                    25.0
                  ],
                  "text": "B",
                  "textcolor": [
                    1.0,
                    0.0,
                    0.0,
                    1.0
                  ],
                  "varname": "bypassSign1"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 15.0,
                  "frgb": [
                    1.0,
                    0.0,
                    0.0,
                    1.0
                  ],
                  "id": "obj-16",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    454.0,
                    254.0,
                    29.0,
                    25.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    49.0,
                    84.0,
                    27.0,
                    25.0
                  ],
                  "text": "y",
                  "textcolor": [
                    1.0,
                    0.0,
                    0.0,
                    1.0
                  ],
                  "varname": "bypassSign2"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 15.0,
                  "frgb": [
                    1.0,
                    0.0,
                    0.0,
                    1.0
                  ],
                  "id": "obj-19",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    450.0,
                    280.0,
                    26.0,
                    25.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    59.0,
                    91.0,
                    27.0,
                    25.0
                  ],
                  "text": "p",
                  "textcolor": [
                    1.0,
                    0.0,
                    0.0,
                    1.0
                  ],
                  "varname": "bypassSign3"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 15.0,
                  "frgb": [
                    1.0,
                    0.0,
                    0.0,
                    1.0
                  ],
                  "id": "obj-21",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    450.0,
                    306.0,
                    26.0,
                    25.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    69.0,
                    99.0,
                    27.0,
                    25.0
                  ],
                  "text": "a",
                  "textcolor": [
                    1.0,
                    0.0,
                    0.0,
                    1.0
                  ],
                  "varname": "bypassSign4"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 15.0,
                  "frgb": [
                    1.0,
                    0.0,
                    0.0,
                    1.0
                  ],
                  "id": "obj-24",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    453.0,
                    328.0,
                    21.0,
                    25.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    82.0,
                    109.0,
                    26.0,
                    25.0
                  ],
                  "text": "s",
                  "textcolor": [
                    1.0,
                    0.0,
                    0.0,
                    1.0
                  ],
                  "varname": "bypassSign5"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 15.0,
                  "frgb": [
                    1.0,
                    0.0,
                    0.0,
                    1.0
                  ],
                  "id": "obj-30",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    452.0,
                    353.0,
                    21.0,
                    25.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    93.0,
                    121.0,
                    26.0,
                    25.0
                  ],
                  "text": "s",
                  "textcolor": [
                    1.0,
                    0.0,
                    0.0,
                    1.0
                  ],
                  "varname": "bypassSign6"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 15.0,
                  "frgb": [
                    1.0,
                    0.0,
                    0.0,
                    1.0
                  ],
                  "id": "obj-34",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    450.0,
                    377.0,
                    26.0,
                    25.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    45.0,
                    125.0,
                    27.0,
                    25.0
                  ],
                  "text": "o",
                  "textcolor": [
                    1.0,
                    0.0,
                    0.0,
                    1.0
                  ],
                  "varname": "bypassSign7"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 15.0,
                  "frgb": [
                    1.0,
                    0.0,
                    0.0,
                    1.0
                  ],
                  "id": "obj-37",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    453.0,
                    403.0,
                    26.0,
                    25.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    55.0,
                    135.0,
                    27.0,
                    25.0
                  ],
                  "text": "n",
                  "textcolor": [
                    1.0,
                    0.0,
                    0.0,
                    1.0
                  ],
                  "varname": "bypassSign8"
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
                    "obj-1",
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
                    "obj-10",
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
                    "obj-11",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-10",
                    1
                  ],
                  "hidden": 0,
                  "midpoints": [

                  ],
                  "source": [
                    "obj-12",
                    2
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
                    "obj-12",
                    2
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
                    "obj-17",
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
                    "obj-2",
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
                  "hidden": 0,
                  "midpoints": [

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
                    "obj-4",
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
                    "obj-23",
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
                    "obj-11",
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
                    "obj-25",
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
                    "obj-27",
                    0
                  ],
                  "hidden": 0,
                  "midpoints": [
                    215.5,
                    118.5,
                    105.5,
                    118.5
                  ],
                  "source": [
                    "obj-29",
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
                    "obj-3",
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
                    "obj-32",
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
                    "obj-29",
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
                    "obj-32",
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
                    "obj-6",
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
                    "obj-5",
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
                    394.5,
                    469.0,
                    101.5,
                    469.0
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
                    "obj-11",
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
                    "obj-17",
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
          },
          "patching_rect": [
            273.0,
            268.0,
            46.0,
            19.0
          ],
          "saved_object_attributes": {
            "default_fontname": "Arial",
            "fontname": "Arial",
            "default_fontsize": 12.0,
            "fontface": 0,
            "fontsize": 12.0,
            "globalpatchername": "",
            "default_fontface": 0
          },
          "text": "p panel"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-2",
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
            427.0,
            294.0,
            589.0,
            43.0
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
            427.0,
            248.0,
            567.0,
            43.0
          ],
          "text": "j.remote 32"
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
          "id": "obj-17",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            162.0,
            12.0,
            62.0,
            19.0
          ],
          "presentation": 1,
          "presentation_rect": [
            23.0,
            24.0,
            61.0,
            19.0
          ],
          "text": "Speakers:"
        }
      },
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
            240.0,
            121.0,
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
          "id": "obj-29",
          "maxclass": "number",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "int",
            "bang"
          ],
          "patching_rect": [
            400.0,
            190.0,
            22.330078,
            19.0
          ],
          "presentation": 1,
          "presentation_rect": [
            80.0,
            24.0,
            22.330078,
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
            72.0,
            172.0,
            46.0,
            19.0
          ],
          "text": "j.in"
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
            111.0,
            120.0,
            137.0,
            17.0
          ],
          "text": "/documentation/generate"
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
            153.0,
            307.0,
            25.0,
            25.0
          ]
        }
      },
      {
        "box": {
          "comment": "",
          "id": "obj-13",
          "maxclass": "inlet",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            297.0,
            197.0,
            25.0,
            25.0
          ]
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-18",
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
            427.0,
            190.0,
            466.0,
            43.0
          ],
          "text": "j.remote numSpeakers",
          "varname": "voices"
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
            42.0,
            93.0,
            87.0,
            19.0
          ],
          "text": "command input"
        }
      },
      {
        "box": {
          "comment": "",
          "id": "obj-21",
          "maxclass": "inlet",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            10.0,
            92.0,
            25.0,
            25.0
          ]
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
            "audio.connect",
            ""
          ],
          "patching_rect": [
            154.0,
            230.0,
            162.0,
            19.0
          ],
          "text": "jalg.sur.speaker.delay~"
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
            197.0,
            177.0,
            158.0,
            19.0
          ],
          "text": "----multicable signal input----"
        }
      },
      {
        "box": {
          "comment": "",
          "id": "obj-25",
          "maxclass": "outlet",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            10.0,
            206.0,
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
          "id": "obj-26",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            172.0,
            306.0,
            157.0,
            19.0
          ],
          "text": "---multicable signal output---"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-27",
          "linecount": 2,
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            10.0,
            140.0,
            583.0,
            31.0
          ],
          "text": "j.model @description \"Adjust delay of the loudspeakers to adjust for varying distances. Delay can either be provided as a time delay or will be calculated from loudspeaker positions automatically.\"",
          "varname": "j.model"
        }
      },
      {
        "box": {
          "has_bypass": 1,
          "has_panel": 1,
          "id": "obj-30",
          "maxclass": "j.ui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            0.0,
            0.0,
            150.0,
            70.0
          ],
          "prefix": "audio",
          "presentation": 1,
          "presentation_rect": [
            0.0,
            0.0,
            150.0,
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
            "obj-16",
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
            "obj-23",
            0
          ],
          "hidden": 0,
          "midpoints": [
            81.5,
            192.5,
            163.5,
            192.5
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
            "obj-5",
            0
          ],
          "hidden": 0,
          "midpoints": [
            59.5,
            261.5,
            282.5,
            261.5
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
            "obj-23",
            1
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
            "obj-15",
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
            "obj-14",
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
            "obj-19",
            0
          ],
          "hidden": 0,
          "midpoints": [

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
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-16",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-29",
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
            "obj-11",
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
            "obj-21",
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
            "obj-23",
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
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-23",
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
            "obj-18",
            0
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-29",
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
            "obj-4",
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
            282.5,
            295.0,
            7.0,
            295.0,
            7.0,
            137.0,
            19.5,
            137.0
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
            "obj-7",
            0
          ],
          "hidden": 0,
          "midpoints": [

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
            "obj-27",
            0
          ],
          "hidden": 0,
          "midpoints": [
            120.5,
            133.0,
            19.5,
            133.0
          ],
          "source": [
            "obj-8",
            0
          ]
        }
      }
    ]
  }
}