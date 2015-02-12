{
  "patcher": {
    "fileversion": 1,
    "appversion": {
      "major": 6,
      "minor": 0,
      "revision": 4
    },
    "rect": [
      0.0,
      44.0,
      1280.0,
      706.0
    ],
    "bgcolor": [
      1.0,
      1.0,
      1.0,
      0.0
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
          "id": "obj-67",
          "maxclass": "newobj",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            35.0,
            175.0,
            137.0,
            19.0
          ],
          "text": "r #0_dumpNumChannels"
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
            "float",
            "float"
          ],
          "patching_rect": [
            538.0,
            426.0,
            32.5,
            19.0
          ],
          "text": "t f f"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-16",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "float"
          ],
          "patching_rect": [
            536.0,
            451.0,
            32.5,
            19.0
          ],
          "text": "- 0."
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-9",
          "maxclass": "newobj",
          "numinlets": 3,
          "numoutlets": 3,
          "outlettype": [
            "bang",
            "bang",
            ""
          ],
          "patching_rect": [
            535.0,
            475.0,
            56.0,
            19.0
          ],
          "text": "sel 1. -1."
        }
      },
      {
        "box": {
          "annotation": "change the radius of the speaker arrangement",
          "id": "obj-8",
          "maxclass": "incdec",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "float"
          ],
          "parameter_enable": 0,
          "patching_rect": [
            538.0,
            398.0,
            22.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            109.0,
            43.0,
            32.0,
            19.0
          ]
        }
      },
      {
        "box": {
          "color": [
            0.8,
            0.839216,
            0.709804,
            1.0
          ],
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-22",
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
            593.0,
            462.0,
            556.0,
            31.0
          ],
          "text": "j.remote radius/dec",
          "varname": "module_in[3]"
        }
      },
      {
        "box": {
          "color": [
            0.8,
            0.839216,
            0.709804,
            1.0
          ],
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
            593.0,
            425.0,
            552.0,
            31.0
          ],
          "text": "j.remote radius/inc",
          "varname": "module_in[2]"
        }
      },
      {
        "box": {
          "annotation": "Bang to send all positions",
          "fontname": "Arial",
          "fontsize": 9.0,
          "id": "obj-12",
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
            593.0,
            325.0,
            38.0,
            18.0
          ],
          "presentation": 1,
          "presentation_rect": [
            98.0,
            1.0,
            35.0,
            17.0
          ],
          "rounded": 8.0,
          "text": "dump"
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
          "id": "obj-6",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            593.0,
            400.0,
            150.0,
            19.0
          ],
          "presentation": 1,
          "presentation_rect": [
            107.0,
            24.0,
            40.0,
            19.0
          ],
          "text": "radius"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-20",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            197.0,
            268.0,
            55.0,
            19.0
          ],
          "text": "j.out"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-19",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 3,
          "outlettype": [
            "",
            "",
            ""
          ],
          "patching_rect": [
            593.0,
            348.0,
            536.0,
            19.0
          ],
          "text": "j.remote dump"
        }
      },
      {
        "box": {
          "annotation": "Number of channels in the set.",
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-15",
          "maxclass": "number",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "int",
            "bang"
          ],
          "parameter_enable": 0,
          "patching_rect": [
            550.0,
            235.0,
            38.0,
            19.0
          ],
          "presentation": 1,
          "presentation_rect": [
            2.0,
            43.0,
            24.0,
            19.0
          ],
          "triangle": 0
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-29",
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
            593.0,
            176.0,
            339.0,
            43.0
          ],
          "text": "j.remote numSources"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-30",
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
            935.0,
            176.0,
            346.0,
            43.0
          ],
          "text": "j.remote numSpeakers"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-31",
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
            593.0,
            235.0,
            574.0,
            31.0
          ],
          "text": "j.remote numChannels",
          "varname": "voices[4]"
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
          "id": "obj-1",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            1.0,
            23.0,
            53.0,
            19.0
          ],
          "presentation": 1,
          "presentation_rect": [
            0.0,
            24.0,
            54.0,
            19.0
          ],
          "text": "channels"
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
          "id": "obj-7",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            486.0,
            75.0,
            77.0,
            19.0
          ],
          "presentation": 1,
          "presentation_rect": [
            54.0,
            24.0,
            38.0,
            19.0
          ],
          "text": "type"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 14.0,
          "id": "obj-13",
          "maxclass": "newobj",
          "numinlets": 0,
          "numoutlets": 0,
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
              490.0,
              315.0
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
                  "frgb": [
                    0.0,
                    0.0,
                    0.0,
                    1.0
                  ],
                  "id": "obj-1",
                  "linecount": 2,
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    20.0,
                    21.0,
                    340.0,
                    34.0
                  ],
                  "text": "here you can type any note you want, that will help understand your patch and its current usability"
                }
              }
            ],
            "lines": [

            ],
            "dependency_cache": [

            ]
          },
          "patching_rect": [
            484.0,
            21.0,
            113.0,
            23.0
          ],
          "saved_object_attributes": {
            "globalpatchername": "",
            "fontface": 0,
            "fontsize": 12.0,
            "default_fontface": 0,
            "digest": "",
            "default_fontname": "Arial",
            "default_fontsize": 12.0,
            "fontname": "Arial",
            "tags": "",
            "description": ""
          },
          "text": "p notes_&_bugs",
          "textcolor": [
            0.290196,
            0.611765,
            0.380392,
            1.0
          ]
        }
      },
      {
        "box": {
          "annotation": "Type of instances",
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-2",
          "items": [
            "channel",
            ",",
            "microphone",
            ",",
            "source",
            ",",
            "speaker",
            ",",
            "sink"
          ],
          "labelclick": 1,
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
            485.0,
            97.0,
            87.0,
            19.0
          ],
          "presentation": 1,
          "presentation_rect": [
            31.0,
            43.0,
            67.0,
            19.0
          ]
        }
      },
      {
        "box": {
          "color": [
            0.8,
            0.839216,
            0.709804,
            1.0
          ],
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-86",
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
            593.0,
            97.0,
            295.0,
            31.0
          ],
          "text": "j.remote type",
          "varname": "module_in[1]"
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
            53.0,
            101.0,
            189.0,
            17.0
          ],
          "text": "preset/store 1 default, preset/write"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-37",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            20.0,
            150.0,
            426.0,
            19.0
          ],
          "text": "j.model @description \"Describe position of instances as sets of xyz coordinates.\"",
          "varname": "j.model[1]"
        }
      },
      {
        "box": {
          "comment": "message",
          "id": "obj-38",
          "maxclass": "inlet",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            20.0,
            95.0,
            22.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "comment": "message",
          "id": "obj-39",
          "maxclass": "outlet",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            20.0,
            210.0,
            22.0,
            22.0
          ]
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
            78.0,
            121.0,
            135.0,
            17.0
          ],
          "text": "documentation/generate"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-10",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "patcher": {
            "fileversion": 1,
            "appversion": {
              "major": 6,
              "minor": 0,
              "revision": 4
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
            "title": "sources setup",
            "boxes": [
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-75",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    ""
                  ],
                  "patching_rect": [
                    990.0,
                    235.0,
                    38.0,
                    19.0
                  ],
                  "text": "zl reg"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-74",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    1010.0,
                    210.0,
                    110.0,
                    19.0
                  ],
                  "text": "pak s 0"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-73",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    1010.0,
                    185.0,
                    67.0,
                    19.0
                  ],
                  "text": "sprintf /%s"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-67",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    990.0,
                    260.0,
                    138.0,
                    19.0
                  ],
                  "text": "s #0_dumpNumChannels"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-58",
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
                      "revision": 4
                    },
                    "rect": [
                      0.0,
                      0.0,
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
                          "id": "obj-46",
                          "linecount": 2,
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            50.0,
                            100.0,
                            72.0,
                            34.0
                          ],
                          "text": "sprintf title %ss setup"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-2",
                          "linecount": 2,
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
                              127.0,
                              323.0,
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
                                  "linecount": 4,
                                  "maxclass": "message",
                                  "numinlets": 2,
                                  "numoutlets": 1,
                                  "outlettype": [
                                    ""
                                  ],
                                  "patching_rect": [
                                    397.0,
                                    272.0,
                                    104.0,
                                    53.0
                                  ],
                                  "text": "window size 100 100 410 $1, window title, window exec"
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
                                  "text": "> 16"
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
                                  "text": "+ 123"
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
                                  "linecount": 3,
                                  "maxclass": "message",
                                  "numinlets": 2,
                                  "numoutlets": 1,
                                  "outlettype": [
                                    ""
                                  ],
                                  "patching_rect": [
                                    412.0,
                                    333.0,
                                    87.0,
                                    41.0
                                  ],
                                  "text": "script hide x2, script hide y2, script hide z2"
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
                                  "linecount": 3,
                                  "maxclass": "message",
                                  "numinlets": 2,
                                  "numoutlets": 1,
                                  "outlettype": [
                                    ""
                                  ],
                                  "patching_rect": [
                                    519.0,
                                    334.0,
                                    88.0,
                                    41.0
                                  ],
                                  "text": "script show x2, script show y2, script show z2"
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
                                  "linecount": 3,
                                  "maxclass": "message",
                                  "numinlets": 2,
                                  "numoutlets": 1,
                                  "outlettype": [
                                    ""
                                  ],
                                  "patching_rect": [
                                    503.0,
                                    281.0,
                                    127.0,
                                    41.0
                                  ],
                                  "text": "window size 100 100 700 587, window title, window exec"
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
                            ],
                            "dependency_cache": [
                              {
                                "name": "thru.maxpat",
                                "bootpath": "/Users/nilspeters/Documents/gits/Jamoma/Modules/Modular/Max/library/components/thru",
                                "type": "JSON",
                                "implicit": 1
                              },
                              {
                                "name": "j.init.mxo",
                                "type": "iLaX"
                              }
                            ]
                          },
                          "patching_rect": [
                            126.0,
                            100.0,
                            85.0,
                            34.0
                          ],
                          "saved_object_attributes": {
                            "globalpatchername": "",
                            "fontface": 0,
                            "fontsize": 12.0,
                            "default_fontface": 0,
                            "digest": "",
                            "default_fontname": "Arial",
                            "default_fontsize": 12.0,
                            "fontname": "Arial",
                            "tags": "",
                            "description": ""
                          },
                          "text": "p hideChannels"
                        }
                      },
                      {
                        "box": {
                          "comment": "",
                          "id": "obj-55",
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
                          "id": "obj-56",
                          "maxclass": "inlet",
                          "numinlets": 0,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            126.0,
                            40.0,
                            25.0,
                            25.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "comment": "",
                          "id": "obj-57",
                          "maxclass": "outlet",
                          "numinlets": 1,
                          "numoutlets": 0,
                          "patching_rect": [
                            83.0,
                            194.0,
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
                            "obj-2",
                            0
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
                            "obj-46",
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
                            "obj-55",
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
                            "obj-56",
                            0
                          ]
                        }
                      }
                    ],
                    "dependency_cache": [
                      {
                        "name": "thru.maxpat",
                        "bootpath": "/Users/nilspeters/Documents/gits/Jamoma/Modules/Modular/Max/library/components/thru",
                        "type": "JSON",
                        "implicit": 1
                      },
                      {
                        "name": "j.init.mxo",
                        "type": "iLaX"
                      }
                    ]
                  },
                  "patching_rect": [
                    850.0,
                    130.0,
                    87.0,
                    19.0
                  ],
                  "saved_object_attributes": {
                    "globalpatchername": "",
                    "fontface": 0,
                    "fontsize": 12.0,
                    "default_fontface": 0,
                    "digest": "",
                    "default_fontname": "Arial",
                    "default_fontsize": 12.0,
                    "fontname": "Arial",
                    "tags": "",
                    "description": ""
                  },
                  "text": "p scriptingStuff"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-49",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    ""
                  ],
                  "patching_rect": [
                    1010.0,
                    160.0,
                    76.0,
                    19.0
                  ],
                  "text": "route symbol"
                }
              },
              {
                "box": {
                  "coll_data": {
                    "count": 5,
                    "data": [
                      {
                        "key": "channel",
                        "value": [
                          "numChannels"
                        ]
                      },
                      {
                        "key": "microphone",
                        "value": [
                          "numMicrphones"
                        ]
                      },
                      {
                        "key": "source",
                        "value": [
                          "numCourses"
                        ]
                      },
                      {
                        "key": "speaker",
                        "value": [
                          "numSpeakers"
                        ]
                      },
                      {
                        "key": "sink",
                        "value": [
                          "numSinks"
                        ]
                      }
                    ]
                  },
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-27",
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
                    1010.0,
                    135.0,
                    59.5,
                    19.0
                  ],
                  "saved_object_attributes": {
                    "embed": 1
                  },
                  "text": "coll"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-19",
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
                    850.0,
                    70.0,
                    225.0,
                    19.0
                  ],
                  "text": "j.oscroute /type /numChannels /dump"
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
                    650.0,
                    100.0,
                    59.0,
                    19.0
                  ],
                  "text": "thru"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 9.873845,
                  "id": "obj-1",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "front",
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
                      680.0,
                      548.0,
                      600.0,
                      426.0
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
                          "id": "obj-1",
                          "maxclass": "outlet",
                          "numinlets": 1,
                          "numoutlets": 0,
                          "patching_rect": [
                            172.0,
                            108.0,
                            19.0,
                            19.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 9.873845,
                          "id": "obj-2",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 2,
                          "outlettype": [
                            "",
                            ""
                          ],
                          "patching_rect": [
                            50.0,
                            50.0,
                            144.0,
                            18.0
                          ],
                          "text": "j.oscroute /view/panel"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 9.873845,
                          "id": "obj-3",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 1,
                          "outlettype": [
                            "front"
                          ],
                          "patching_rect": [
                            50.0,
                            92.0,
                            40.0,
                            18.0
                          ],
                          "text": "t front"
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
                            50.0,
                            30.0,
                            15.0,
                            15.0
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
                            50.0,
                            114.0,
                            19.0,
                            19.0
                          ]
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
                            "obj-2",
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
                      {
                        "name": "j.oscroute.mxo",
                        "type": "iLaX"
                      }
                    ]
                  },
                  "patching_rect": [
                    828.0,
                    38.0,
                    42.0,
                    18.0
                  ],
                  "saved_object_attributes": {
                    "globalpatchername": "",
                    "fontface": 0,
                    "fontsize": 12.0,
                    "default_fontface": 0,
                    "digest": "",
                    "default_fontname": "Arial",
                    "default_fontsize": 12.0,
                    "fontname": "Arial",
                    "tags": "",
                    "description": ""
                  },
                  "text": "p front"
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
                  "name": "j.sur.channel.xyz_setup.maxpat",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    302.0,
                    247.0,
                    282.0,
                    23.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    295.0,
                    253.0,
                    284.0,
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
                  "name": "j.sur.channel.xyz_setup.maxpat",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    302.0,
                    218.0,
                    282.0,
                    23.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    295.0,
                    224.0,
                    284.0,
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
                  "name": "j.sur.channel.xyz_setup.maxpat",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    302.0,
                    189.0,
                    282.0,
                    23.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    295.0,
                    195.0,
                    284.0,
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
                  "name": "j.sur.channel.xyz_setup.maxpat",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    302.0,
                    160.0,
                    282.0,
                    23.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    295.0,
                    166.0,
                    284.0,
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
                  "name": "j.sur.channel.xyz_setup.maxpat",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    302.0,
                    131.0,
                    282.0,
                    23.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    295.0,
                    137.0,
                    284.0,
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
                  "name": "j.sur.channel.xyz_setup.maxpat",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    302.0,
                    102.0,
                    282.0,
                    23.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    295.0,
                    108.0,
                    284.0,
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
                  "name": "j.sur.channel.xyz_setup.maxpat",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    302.0,
                    73.0,
                    282.0,
                    23.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    295.0,
                    79.0,
                    284.0,
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
                  "name": "j.sur.channel.xyz_setup.maxpat",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    303.0,
                    44.0,
                    282.0,
                    23.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    295.0,
                    50.0,
                    284.0,
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
                  "name": "j.sur.channel.xyz_setup.maxpat",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    302.0,
                    15.0,
                    282.0,
                    23.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    295.0,
                    21.0,
                    284.0,
                    31.0
                  ],
                  "varname": "ch17"
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
                    828.0,
                    5.0,
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
                    850.0,
                    395.0,
                    231.0,
                    17.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    21.0,
                    57.0,
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
                    850.0,
                    361.0,
                    263.0,
                    17.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    21.0,
                    24.0,
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
                    850.0,
                    378.0,
                    173.0,
                    17.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    21.0,
                    40.0,
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
                    826.0,
                    424.0,
                    65.0,
                    19.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    21.0,
                    95.0,
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
                  "name": "j.sur.channel.xyz_setup.maxpat",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    15.0,
                    450.0,
                    282.0,
                    23.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    8.0,
                    456.0,
                    284.0,
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
                  "name": "j.sur.channel.xyz_setup.maxpat",
                  "numinlets": 1,
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
                    427.0,
                    284.0,
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
                  "name": "j.sur.channel.xyz_setup.maxpat",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    302.0,
                    450.0,
                    282.0,
                    23.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    295.0,
                    456.0,
                    284.0,
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
                  "name": "j.sur.channel.xyz_setup.maxpat",
                  "numinlets": 1,
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
                    398.0,
                    284.0,
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
                  "name": "j.sur.channel.xyz_setup.maxpat",
                  "numinlets": 1,
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
                    369.0,
                    284.0,
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
                  "name": "j.sur.channel.xyz_setup.maxpat",
                  "numinlets": 1,
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
                    340.0,
                    284.0,
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
                  "name": "j.sur.channel.xyz_setup.maxpat",
                  "numinlets": 1,
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
                    311.0,
                    284.0,
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
                  "name": "j.sur.channel.xyz_setup.maxpat",
                  "numinlets": 1,
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
                    282.0,
                    284.0,
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
                  "name": "j.sur.channel.xyz_setup.maxpat",
                  "numinlets": 1,
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
                    253.0,
                    284.0,
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
                  "name": "j.sur.channel.xyz_setup.maxpat",
                  "numinlets": 1,
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
                    224.0,
                    284.0,
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
                  "name": "j.sur.channel.xyz_setup.maxpat",
                  "numinlets": 1,
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
                    195.0,
                    284.0,
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
                  "name": "j.sur.channel.xyz_setup.maxpat",
                  "numinlets": 1,
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
                    166.0,
                    284.0,
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
                  "name": "j.sur.channel.xyz_setup.maxpat",
                  "numinlets": 1,
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
                    137.0,
                    284.0,
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
                  "name": "j.sur.channel.xyz_setup.maxpat",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    302.0,
                    421.0,
                    282.0,
                    23.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    295.0,
                    427.0,
                    284.0,
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
                  "id": "obj-40",
                  "lockeddragscroll": 1,
                  "maxclass": "bpatcher",
                  "name": "j.sur.channel.xyz_setup.maxpat",
                  "numinlets": 1,
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
                    108.0,
                    284.0,
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
                  "name": "j.sur.channel.xyz_setup.maxpat",
                  "numinlets": 1,
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
                    79.0,
                    284.0,
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
                  "name": "j.sur.channel.xyz_setup.maxpat",
                  "numinlets": 1,
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
                    50.0,
                    284.0,
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
                  "name": "j.sur.channel.xyz_setup.maxpat",
                  "numinlets": 1,
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
                    21.0,
                    284.0,
                    31.0
                  ],
                  "varname": "ch1"
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
                  "id": "obj-45",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    615.0,
                    337.0,
                    46.0,
                    19.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    136.0,
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
                  "name": "j.sur.channel.xyz_setup.maxpat",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    302.0,
                    392.0,
                    282.0,
                    23.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    295.0,
                    398.0,
                    284.0,
                    31.0
                  ],
                  "varname": "ch30"
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
                  "id": "obj-50",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    615.0,
                    363.0,
                    46.0,
                    19.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    186.0,
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
                  "frgb": [
                    0.0,
                    0.0,
                    0.0,
                    1.0
                  ],
                  "id": "obj-51",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    615.0,
                    390.0,
                    46.0,
                    19.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    242.0,
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
                  "frgb": [
                    0.0,
                    0.0,
                    0.0,
                    1.0
                  ],
                  "hidden": 1,
                  "id": "obj-52",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    615.0,
                    248.0,
                    46.0,
                    19.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    525.0,
                    4.0,
                    26.0,
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
                  "frgb": [
                    0.0,
                    0.0,
                    0.0,
                    1.0
                  ],
                  "hidden": 1,
                  "id": "obj-53",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    615.0,
                    224.0,
                    46.0,
                    19.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    469.0,
                    4.0,
                    26.0,
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
                  "frgb": [
                    0.0,
                    0.0,
                    0.0,
                    1.0
                  ],
                  "hidden": 1,
                  "id": "obj-54",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    615.0,
                    200.0,
                    46.0,
                    19.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    419.0,
                    4.0,
                    26.0,
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
                  "name": "j.sur.channel.xyz_setup.maxpat",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    302.0,
                    363.0,
                    282.0,
                    23.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    295.0,
                    369.0,
                    284.0,
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
                  "name": "j.sur.channel.xyz_setup.maxpat",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    302.0,
                    334.0,
                    282.0,
                    23.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    295.0,
                    340.0,
                    284.0,
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
                  "name": "j.sur.channel.xyz_setup.maxpat",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    302.0,
                    305.0,
                    282.0,
                    23.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    295.0,
                    311.0,
                    284.0,
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
                  "name": "j.sur.channel.xyz_setup.maxpat",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    302.0,
                    276.0,
                    282.0,
                    23.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    295.0,
                    282.0,
                    284.0,
                    31.0
                  ],
                  "varname": "ch26"
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
                    "obj-25",
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
                    "obj-26",
                    0
                  ],
                  "disabled": 0,
                  "hidden": 0,
                  "midpoints": [
                    860.5,
                    63.5,
                    659.5,
                    63.5
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
                    "obj-27",
                    0
                  ],
                  "disabled": 0,
                  "hidden": 0,
                  "midpoints": [
                    859.5,
                    119.0,
                    1019.5,
                    119.0
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
                    "obj-58",
                    1
                  ],
                  "disabled": 0,
                  "hidden": 0,
                  "source": [
                    "obj-19",
                    1
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-58",
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
                    "obj-74",
                    1
                  ],
                  "disabled": 0,
                  "hidden": 0,
                  "midpoints": [
                    928.166687,
                    109.0,
                    1110.5,
                    109.0
                  ],
                  "source": [
                    "obj-19",
                    1
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-75",
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
                    "obj-1",
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
                    "obj-25",
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
                    "obj-25",
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
                    "obj-25",
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
                    "obj-10",
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
                    "obj-11",
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
                    "obj-12",
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
                    "obj-13",
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
                    "obj-14",
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
                    "obj-15",
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
                    "obj-16",
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
                    "obj-17",
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
                    "obj-18",
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
                    "obj-28",
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
                    "obj-29",
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
                    "obj-3",
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
                    "obj-32",
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
                    "obj-33",
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
                    "obj-34",
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
                    "obj-35",
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
                    "obj-36",
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
                    "obj-37",
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
                    "obj-38",
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
                    "obj-39",
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
                    "obj-4",
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
                    "obj-40",
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
                    "obj-41",
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
                    "obj-42",
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
                    "obj-43",
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
                    "obj-5",
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
                    "obj-6",
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
                    "obj-7",
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
                    "obj-8",
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
                    "obj-9",
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
                    "obj-49",
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
                    "obj-73",
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
                    "obj-58",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-74",
                    0
                  ],
                  "disabled": 0,
                  "hidden": 0,
                  "source": [
                    "obj-73",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-75",
                    1
                  ],
                  "disabled": 0,
                  "hidden": 0,
                  "source": [
                    "obj-74",
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
                    "obj-75",
                    0
                  ]
                }
              }
            ],
            "dependency_cache": [
              {
                "name": "j.sur.channel.xyz_setup.maxpat",
                "bootpath": "/Users/nilspeters/Documents/gits/Jamoma/Modules/Modular/Max/modules/spatialization/sur.setup",
                "type": "JSON",
                "implicit": 1
              },
              {
                "name": "j.list2parameter.maxpat",
                "bootpath": "/Users/nilspeters/Documents/gits/Jamoma/Modules/Modular/Max/library/components/list2parameter",
                "type": "JSON",
                "implicit": 1
              },
              {
                "name": "thru.maxpat",
                "bootpath": "/Users/nilspeters/Documents/gits/Jamoma/Modules/Modular/Max/library/components/thru",
                "type": "JSON",
                "implicit": 1
              },
              {
                "name": "j.parameter.mxo",
                "type": "iLaX"
              },
              {
                "name": "j.message.mxo",
                "type": "iLaX"
              },
              {
                "name": "j.return.mxo",
                "type": "iLaX"
              },
              {
                "name": "j.oscroute.mxo",
                "type": "iLaX"
              },
              {
                "name": "j.init.mxo",
                "type": "iLaX"
              }
            ]
          },
          "patching_rect": [
            196.0,
            235.0,
            68.0,
            19.0
          ],
          "saved_object_attributes": {
            "globalpatchername": "",
            "fontface": 0,
            "fontsize": 12.0,
            "default_fontface": 0,
            "digest": "",
            "default_fontname": "Arial",
            "default_fontsize": 12.0,
            "fontname": "Arial",
            "tags": "",
            "description": ""
          },
          "text": "p Inspector"
        }
      },
      {
        "box": {
          "has_panel": 1,
          "id": "obj-24",
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
          "presentation": 1,
          "presentation_rect": [
            0.0,
            0.0,
            150.0,
            70.0
          ],
          "text": "/editing_this_module"
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
            "",
            ""
          ],
          "patching_rect": [
            196.0,
            211.0,
            46.0,
            19.0
          ],
          "text": "j.in"
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
          "disabled": 0,
          "hidden": 0,
          "midpoints": [
            62.5,
            144.0,
            29.5,
            144.0
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
            "obj-19",
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
            "obj-31",
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
            "obj-9",
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
            "obj-16",
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
            "obj-86",
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
            "obj-31",
            0
          ],
          "disabled": 0,
          "hidden": 0,
          "midpoints": [
            762.5,
            224.0,
            602.5,
            224.0
          ],
          "source": [
            "obj-29",
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
          "midpoints": [
            1108.0,
            224.0,
            602.5,
            224.0
          ],
          "source": [
            "obj-30",
            1
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
            "obj-37",
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
            "obj-38",
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
          "midpoints": [
            87.5,
            144.0,
            29.5,
            144.0
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
            "obj-10",
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
            "obj-39",
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
            "obj-17",
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
            "obj-2",
            0
          ],
          "disabled": 0,
          "hidden": 0,
          "source": [
            "obj-86",
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
            "obj-9",
            1
          ]
        }
      }
    ],
    "dependency_cache": [
      {
        "name": "j.sur.channel.xyz_setup.maxpat",
        "bootpath": "/Users/nilspeters/Documents/gits/Jamoma/Modules/Modular/Max/modules/spatialization/sur.setup",
        "patcherrelativepath": "",
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
        "name": "j.in.mxo",
        "type": "iLaX"
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
        "name": "j.message.mxo",
        "type": "iLaX"
      },
      {
        "name": "j.return.mxo",
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
        "name": "j.model.mxo",
        "type": "iLaX"
      },
      {
        "name": "j.out.mxo",
        "type": "iLaX"
      }
    ]
  }
}