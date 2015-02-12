{
  "patcher": {
    "fileversion": 1,
    "rect": [
      40.0,
      113.0,
      1119.0,
      546.0
    ],
    "bglocked": 0,
    "defrect": [
      40.0,
      113.0,
      1119.0,
      546.0
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
          "id": "obj-18",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patcher": {
            "fileversion": 1,
            "rect": [
              35.0,
              86.0,
              1187.0,
              624.0
            ],
            "bglocked": 0,
            "defrect": [
              35.0,
              86.0,
              1187.0,
              624.0
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
                  "numoutlets": 0,
                  "patching_rect": [
                    580.0,
                    455.0,
                    141.0,
                    19.0
                  ],
                  "text": "print ***dbap_bformat***"
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
                    490.0,
                    130.0,
                    32.5,
                    19.0
                  ],
                  "text": "* 4"
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
                    743.0,
                    203.0,
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
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    ""
                  ],
                  "patching_rect": [
                    743.0,
                    100.0,
                    95.0,
                    19.0
                  ],
                  "text": "j.pass /mute"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-6",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    ""
                  ],
                  "patching_rect": [
                    819.0,
                    130.0,
                    111.0,
                    19.0
                  ],
                  "text": "j.oscroute /gain"
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
                    490.0,
                    155.0,
                    110.0,
                    19.0
                  ],
                  "text": "prepend numInputs"
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
                    610.0,
                    155.0,
                    117.0,
                    19.0
                  ],
                  "text": "prepend numOutputs"
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
                    ""
                  ],
                  "patching_rect": [
                    465.0,
                    501.0,
                    124.0,
                    19.0
                  ],
                  "text": "prepend setLinearGain"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-34",
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
                          "id": "obj-25",
                          "maxclass": "newobj",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            50.0,
                            185.0,
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
                          "id": "obj-24",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 2,
                          "outlettype": [
                            "int",
                            "float"
                          ],
                          "patching_rect": [
                            50.0,
                            100.0,
                            70.0,
                            19.0
                          ],
                          "text": "unpack 0 0."
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-40",
                          "linecount": 4,
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 2,
                          "outlettype": [
                            "",
                            ""
                          ],
                          "patching_rect": [
                            105.0,
                            125.0,
                            102.0,
                            55.0
                          ],
                          "text": "j.unit @dataspace gain @input midigain @output linear"
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
                          "patching_rect": [
                            50.0,
                            210.0,
                            98.0,
                            19.0
                          ],
                          "text": "prepend src_gain"
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
                          "id": "obj-33",
                          "maxclass": "outlet",
                          "numinlets": 1,
                          "numoutlets": 0,
                          "patching_rect": [
                            50.0,
                            249.0,
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
                            "obj-25",
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
                            "obj-40",
                            0
                          ],
                          "hidden": 0,
                          "midpoints": [

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
                            "obj-32",
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
                            "obj-24",
                            0
                          ],
                          "hidden": 0,
                          "midpoints": [

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
                            "obj-33",
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
                            "obj-25",
                            1
                          ],
                          "hidden": 0,
                          "midpoints": [

                          ],
                          "source": [
                            "obj-40",
                            0
                          ]
                        }
                      }
                    ]
                  },
                  "patching_rect": [
                    195.0,
                    310.0,
                    81.0,
                    19.0
                  ],
                  "saved_object_attributes": {
                    "fontface": 0,
                    "fontsize": 12.0,
                    "globalpatchername": "",
                    "default_fontface": 0,
                    "default_fontname": "Arial",
                    "fontname": "Arial",
                    "default_fontsize": 12.0
                  },
                  "text": "p source_gain"
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
                          "id": "obj-20",
                          "maxclass": "newobj",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            50.0,
                            150.0,
                            54.0,
                            19.0
                          ],
                          "text": "pack 0 0"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-6",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 2,
                          "outlettype": [
                            "int",
                            "int"
                          ],
                          "patching_rect": [
                            50.0,
                            100.0,
                            66.0,
                            19.0
                          ],
                          "text": "unpack 0 0"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-38",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            50.0,
                            175.0,
                            102.0,
                            19.0
                          ],
                          "text": "prepend src_mute"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-33",
                          "maxclass": "newobj",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            "int"
                          ],
                          "patching_rect": [
                            100.0,
                            125.0,
                            37.0,
                            19.0
                          ],
                          "text": "== 0"
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
                          "id": "obj-22",
                          "maxclass": "outlet",
                          "numinlets": 1,
                          "numoutlets": 0,
                          "patching_rect": [
                            50.0,
                            205.0,
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
                            "obj-38",
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
                            "obj-6",
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
                            "obj-20",
                            1
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
                            "obj-22",
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
                            "obj-20",
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
                            "obj-33",
                            0
                          ],
                          "hidden": 0,
                          "midpoints": [

                          ],
                          "source": [
                            "obj-6",
                            1
                          ]
                        }
                      }
                    ]
                  },
                  "patching_rect": [
                    245.0,
                    280.0,
                    86.0,
                    19.0
                  ],
                  "saved_object_attributes": {
                    "fontface": 0,
                    "fontsize": 12.0,
                    "globalpatchername": "",
                    "default_fontface": 0,
                    "default_fontname": "Arial",
                    "fontname": "Arial",
                    "default_fontsize": 12.0
                  },
                  "text": "p _activeactive"
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
                    ""
                  ],
                  "patching_rect": [
                    145.0,
                    345.0,
                    110.0,
                    19.0
                  ],
                  "text": "prepend src_weight"
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
                    ""
                  ],
                  "patching_rect": [
                    95.0,
                    380.0,
                    75.0,
                    19.0
                  ],
                  "text": "prepend blur"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-28",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    315.0,
                    245.0,
                    116.0,
                    19.0
                  ],
                  "text": "prepend dst_position"
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
                  "patching_rect": [
                    45.0,
                    415.0,
                    116.0,
                    19.0
                  ],
                  "text": "prepend src_position"
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
                    "",
                    ""
                  ],
                  "patching_rect": [
                    315.0,
                    215.0,
                    129.0,
                    19.0
                  ],
                  "text": "j.oscroute /position"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-19",
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
                    45.0,
                    215.0,
                    265.0,
                    19.0
                  ],
                  "text": "j.oscroute /position /blur /weight /gain /active"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-15",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 3,
                  "outlettype": [
                    "",
                    "",
                    ""
                  ],
                  "patching_rect": [
                    45.0,
                    185.0,
                    170.0,
                    19.0
                  ],
                  "text": "j.oscroute /source /speaker"
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
                    460.0,
                    100.0,
                    122.0,
                    19.0
                  ],
                  "text": "prepend num_sources"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-10",
                  "linecount": 4,
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    ""
                  ],
                  "patching_rect": [
                    819.0,
                    153.0,
                    102.0,
                    55.0
                  ],
                  "text": "j.unit @dataspace gain @input midigain @output linear"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-3",
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
                    460.0,
                    70.0,
                    264.0,
                    19.0
                  ],
                  "text": "j.oscroute /numSources /numSpeakers /audio"
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
                    819.0,
                    212.0,
                    118.0,
                    19.0
                  ],
                  "text": "prepend master_gain"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-18",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    595.0,
                    100.0,
                    145.0,
                    19.0
                  ],
                  "text": "prepend num_destinations"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-12",
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
                    260.0,
                    70.0,
                    190.0,
                    19.0
                  ],
                  "text": "j.pass /info /dimensions /rolloff"
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
                    45.0,
                    160.0,
                    54.0,
                    19.0
                  ],
                  "text": "zl join"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-4",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    ""
                  ],
                  "patching_rect": [
                    45.0,
                    135.0,
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
                    45.0,
                    70.0,
                    140.0,
                    19.0
                  ],
                  "text": "j.oscinstance"
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
                    465.0,
                    455.0,
                    104.0,
                    19.0
                  ],
                  "text": "j.dbap_bformat"
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
                    45.0,
                    40.0,
                    25.0,
                    25.0
                  ]
                }
              },
              {
                "box": {
                  "comment": "",
                  "id": "obj-17",
                  "maxclass": "outlet",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    465.0,
                    534.0,
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
                    "obj-11",
                    0
                  ],
                  "hidden": 0,
                  "midpoints": [

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
                    "obj-21",
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
                    "obj-9",
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
                    "obj-1",
                    0
                  ],
                  "hidden": 0,
                  "midpoints": [
                    383.5,
                    184.0,
                    474.5,
                    184.0
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
                    "obj-1",
                    0
                  ],
                  "hidden": 0,
                  "midpoints": [
                    326.5,
                    187.0,
                    474.5,
                    187.0
                  ],
                  "source": [
                    "obj-12",
                    1
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
                    269.5,
                    191.0,
                    474.5,
                    191.0
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
                    "obj-3",
                    0
                  ],
                  "hidden": 0,
                  "midpoints": [

                  ],
                  "source": [
                    "obj-12",
                    3
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
                    "obj-13",
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
                    469.5,
                    183.5,
                    474.5,
                    183.5
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
                    "obj-15",
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
                    130.0,
                    209.0,
                    324.5,
                    209.0
                  ],
                  "source": [
                    "obj-15",
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
                    619.5,
                    182.0,
                    752.5,
                    182.0
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
                    "obj-1",
                    0
                  ],
                  "hidden": 0,
                  "midpoints": [
                    604.5,
                    223.5,
                    474.5,
                    223.5
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
                    "obj-23",
                    0
                  ],
                  "hidden": 0,
                  "midpoints": [

                  ],
                  "source": [
                    "obj-19",
                    4
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
                    "obj-19",
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
                    "obj-19",
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
                  "hidden": 0,
                  "midpoints": [

                  ],
                  "source": [
                    "obj-19",
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
                  "hidden": 0,
                  "midpoints": [

                  ],
                  "source": [
                    "obj-19",
                    3
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
                    "obj-4",
                    1
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
                    "obj-2",
                    2
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
                    499.5,
                    187.5,
                    752.5,
                    187.5
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
                    "obj-17",
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
                    "obj-17",
                    0
                  ],
                  "hidden": 0,
                  "midpoints": [
                    752.5,
                    524.0,
                    474.5,
                    524.0
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
                    "obj-1",
                    0
                  ],
                  "hidden": 0,
                  "midpoints": [
                    254.5,
                    303.5,
                    474.5,
                    303.5
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
                    "obj-28",
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
                    "obj-1",
                    0
                  ],
                  "hidden": 0,
                  "midpoints": [
                    54.5,
                    443.0,
                    474.5,
                    443.0
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
                    "obj-1",
                    0
                  ],
                  "hidden": 0,
                  "midpoints": [
                    324.5,
                    271.5,
                    474.5,
                    271.5
                  ],
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
                  "hidden": 0,
                  "midpoints": [
                    104.5,
                    405.5,
                    474.5,
                    405.5
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
                    "obj-14",
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
                    "obj-16",
                    0
                  ],
                  "hidden": 0,
                  "midpoints": [

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
                    "obj-18",
                    0
                  ],
                  "hidden": 0,
                  "midpoints": [

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
                    "obj-7",
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
                    "obj-8",
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
                    "obj-1",
                    0
                  ],
                  "hidden": 0,
                  "midpoints": [
                    154.5,
                    371.0,
                    474.5,
                    371.0
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
                    "obj-1",
                    0
                  ],
                  "hidden": 0,
                  "midpoints": [
                    204.5,
                    335.0,
                    474.5,
                    335.0
                  ],
                  "source": [
                    "obj-34",
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
                    "obj-4",
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
                    "obj-6",
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
                  "hidden": 0,
                  "midpoints": [
                    752.5,
                    155.5,
                    752.5,
                    155.5
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
                    "obj-6",
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
                    "obj-8",
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
                    828.5,
                    239.5,
                    474.5,
                    239.5
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
            85.0,
            145.0,
            70.0,
            19.0
          ],
          "saved_object_attributes": {
            "fontface": 0,
            "fontsize": 12.0,
            "globalpatchername": "",
            "default_fontface": 0,
            "default_fontname": "Arial",
            "fontname": "Arial",
            "default_fontsize": 12.0
          },
          "text": "p messages",
          "varname": "messages"
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
            275.0,
            465.0,
            25.0,
            25.0
          ],
          "varname": "multiin"
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
            80.0,
            475.0,
            25.0,
            25.0
          ]
        }
      },
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
            275.0,
            35.0,
            25.0,
            25.0
          ],
          "varname": "multiout"
        }
      },
      {
        "box": {
          "comment": "",
          "id": "obj-9",
          "maxclass": "inlet",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            85.0,
            45.0,
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
          "numoutlets": 2,
          "outlettype": [
            "audio.connect",
            ""
          ],
          "patching_rect": [
            275.0,
            235.0,
            79.0,
            19.0
          ],
          "text": "j.mixer=",
          "varname": "matrix"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-1020",
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
            470.0,
            393.0,
            601.0,
            31.0
          ],
          "text": "j.parameter.array 8 source weight @type array @range 0. 1. @description \"Set spatial weight of the nth source.\""
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-1045",
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
            470.0,
            360.0,
            578.0,
            31.0
          ],
          "text": "j.message.array 8 source active @type boolean @repetitions/filter 0 @description \"Mute or unmute the nth source.\""
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-1007",
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
            470.0,
            325.0,
            577.0,
            31.0
          ],
          "text": "j.message.array 8 source gain @type decimal @dataspace gain @unit linear @description \"Input gain for the nth source.\""
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-1014",
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
            470.0,
            290.0,
            592.0,
            31.0
          ],
          "text": "j.message.array 8 source blur @type decimal @range 0. 100. @description \"Set spatial blur of the nth source.\""
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-1018",
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
            470.0,
            460.0,
            602.0,
            31.0
          ],
          "text": "j.message.array 32 speaker position @type array @dataspace position @unit xyz @description \"Position of the nth source.\""
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-1019",
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
            470.0,
            255.0,
            589.0,
            31.0
          ],
          "text": "j.message.array 8 source position @type array @dataspace position @unit xyz @description \"Position of the nth source.\""
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "frozen_object_attributes": {
            "description": "Get info on current positions of sources and speakers",
            "type": "none",
            "name": "info"
          },
          "id": "obj-1028",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 3,
          "outlettype": [
            "",
            "",
            ""
          ],
          "patching_rect": [
            556.0,
            20.0,
            105.0,
            19.0
          ],
          "text": "j.message info"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
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
            528.0,
            77.0,
            592.0,
            31.0
          ],
          "text": "j.parameter rolloff @type decimal @range 1 6 @clipmode low @description \"Rolloff in dB with doubling of distance.\"",
          "varname": "voices[3]"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-1011",
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
            528.0,
            119.0,
            605.0,
            31.0
          ],
          "text": "j.parameter numSpeakers @type integer @range 1 32 @clipmode both @description \"The number of speakers to diffuse to.\" @priority 3",
          "varname": "voices[1]"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-1001",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            120.0,
            210.0,
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
          "id": "obj-1044",
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
            528.0,
            188.0,
            605.0,
            31.0
          ],
          "text": "j.parameter numSources @type integer @range 1 8 @clipmode both @description \"The number of sources to process.\" @priority 2",
          "varname": "voices"
        }
      }
    ],
    "lines": [
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
            "obj-1",
            0
          ],
          "hidden": 0,
          "midpoints": [
            94.5,
            199.0,
            284.5,
            199.0
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
            "obj-18",
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