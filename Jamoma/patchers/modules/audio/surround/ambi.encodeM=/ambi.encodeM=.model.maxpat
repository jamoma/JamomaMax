{
  "patcher": {
    "fileversion": 1,
    "rect": [
      88.0,
      44.0,
      1131.0,
      508.0
    ],
    "bglocked": 0,
    "defrect": [
      88.0,
      44.0,
      1131.0,
      508.0
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
          "comment": "",
          "id": "obj-5",
          "maxclass": "outlet",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            32.0,
            421.0,
            25.0,
            25.0
          ],
          "varname": "out[2]"
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
          "patcher": {
            "fileversion": 1,
            "rect": [
              296.0,
              186.0,
              812.0,
              326.0
            ],
            "bglocked": 0,
            "defrect": [
              296.0,
              186.0,
              812.0,
              326.0
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
                  "id": "obj-2",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    ""
                  ],
                  "patching_rect": [
                    668.0,
                    119.0,
                    100.0,
                    19.0
                  ],
                  "text": "j.pass /report"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-17",
                  "linecount": 2,
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    369.0,
                    196.0,
                    91.0,
                    29.0
                  ],
                  "text": "xyz_scale 1., coord_system 0"
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
                    553.0,
                    212.0,
                    77.0,
                    19.0
                  ],
                  "text": "prepend type"
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
                    553.0,
                    164.0,
                    91.0,
                    19.0
                  ],
                  "text": "prepend symbol"
                }
              },
              {
                "box": {
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
                  "patching_rect": [
                    553.0,
                    188.0,
                    100.0,
                    19.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    56.0,
                    71.744507,
                    100.0,
                    19.0
                  ],
                  "types": [

                  ]
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
                    454.0,
                    179.0,
                    90.0,
                    17.0
                  ],
                  "text": "interpolation $1"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-10",
                  "maxclass": "newobj",
                  "numinlets": 0,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    418.0,
                    27.0,
                    107.0,
                    19.0
                  ],
                  "text": "r #0_refresh-setup"
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
                    "bang"
                  ],
                  "patching_rect": [
                    418.0,
                    52.0,
                    24.0,
                    19.0
                  ],
                  "text": "t b"
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
                  "patcher": {
                    "fileversion": 1,
                    "rect": [
                      534.0,
                      144.0,
                      640.0,
                      480.0
                    ],
                    "bglocked": 0,
                    "defrect": [
                      534.0,
                      144.0,
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
                          "id": "obj-12",
                          "maxclass": "newobj",
                          "numinlets": 0,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            271.0,
                            58.0,
                            107.0,
                            19.0
                          ],
                          "text": "r #0_refresh-setup"
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
                            "bang"
                          ],
                          "patching_rect": [
                            275.0,
                            83.0,
                            24.0,
                            19.0
                          ],
                          "text": "t b"
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
                            47.0,
                            266.0,
                            25.0,
                            25.0
                          ]
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
                            243.0,
                            155.0,
                            92.0,
                            17.0
                          ],
                          "text": "center_curve $1"
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
                            141.0,
                            156.0,
                            97.0,
                            17.0
                          ],
                          "text": "center_att_db $1"
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
                            51.0,
                            154.0,
                            84.0,
                            17.0
                          ],
                          "text": "center_size $1"
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
                            56.0,
                            57.0,
                            182.0,
                            19.0
                          ],
                          "text": "j.oscroute /size /decay /curve"
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
                            56.0,
                            20.0,
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
                            "obj-11",
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
                            "obj-2",
                            2
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
                      }
                    ]
                  },
                  "patching_rect": [
                    167.0,
                    144.0,
                    52.0,
                    19.0
                  ],
                  "saved_object_attributes": {
                    "fontface": 0,
                    "fontsize": 12.0,
                    "default_fontname": "Arial",
                    "default_fontsize": 12.0,
                    "fontname": "Arial",
                    "default_fontface": 0,
                    "globalpatchername": ""
                  },
                  "text": "p center"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-12",
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
                    265.0,
                    94.0,
                    361.0,
                    19.0
                  ],
                  "text": "j.oscroute /center /numSources /audio/gain /interpolation /flavor"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-6",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    ""
                  ],
                  "patching_rect": [
                    25.0,
                    115.0,
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
                  "id": "obj-7",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    ""
                  ],
                  "patching_rect": [
                    25.0,
                    90.0,
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
                  "id": "obj-8",
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
                    25.0,
                    55.0,
                    259.0,
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
                  "numinlets": 3,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patcher": {
                    "fileversion": 1,
                    "rect": [
                      0.0,
                      44.0,
                      1280.0,
                      726.0
                    ],
                    "bglocked": 0,
                    "defrect": [
                      0.0,
                      44.0,
                      1280.0,
                      726.0
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
                          "maxclass": "message",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            268.0,
                            347.0,
                            56.0,
                            17.0
                          ],
                          "text": "$1 $1 $2"
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
                            238.0,
                            447.0,
                            144.0,
                            19.0
                          ],
                          "text": "prepend distance_mode_n"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-10",
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
                            247.0,
                            386.0,
                            56.0,
                            19.0
                          ],
                          "saved_object_attributes": {
                            "embed": 0
                          },
                          "text": "coll"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-6",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 5,
                          "outlettype": [
                            "",
                            "",
                            "",
                            "",
                            ""
                          ],
                          "patching_rect": [
                            362.0,
                            85.0,
                            231.0,
                            19.0
                          ],
                          "text": "j.oscroute /order /position /gain /active"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-5",
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
                            46.0,
                            84.0,
                            255.0,
                            19.0
                          ],
                          "text": "j.oscroute /attenuationFactor /dbUnit /mode"
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
                            49.0,
                            58.0,
                            131.0,
                            19.0
                          ],
                          "text": "j.oscroute /distance"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-22",
                          "maxclass": "newobj",
                          "numinlets": 0,
                          "numoutlets": 5,
                          "outlettype": [
                            "",
                            "",
                            "",
                            "",
                            ""
                          ],
                          "patcher": {
                            "fileversion": 1,
                            "rect": [
                              569.0,
                              71.0,
                              640.0,
                              480.0
                            ],
                            "bglocked": 0,
                            "defrect": [
                              569.0,
                              71.0,
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
                              25.0,
                              25.0
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
                                  "id": "obj-3",
                                  "maxclass": "message",
                                  "numinlets": 2,
                                  "numoutlets": 1,
                                  "outlettype": [
                                    ""
                                  ],
                                  "patching_rect": [
                                    160.0,
                                    180.0,
                                    53.0,
                                    17.0
                                  ],
                                  "text": "$1 $1 0."
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
                                    163.0,
                                    265.0,
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
                                  "maxclass": "message",
                                  "numinlets": 2,
                                  "numoutlets": 1,
                                  "outlettype": [
                                    ""
                                  ],
                                  "patching_rect": [
                                    228.0,
                                    175.0,
                                    80.0,
                                    17.0
                                  ],
                                  "text": "$1 $1 0. 0. 0."
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
                                    103.0,
                                    185.0,
                                    53.0,
                                    17.0
                                  ],
                                  "text": "$1 $1 3."
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
                                    334.0,
                                    169.0,
                                    66.0,
                                    17.0
                                  ],
                                  "text": "$1 $1 100."
                                }
                              },
                              {
                                "box": {
                                  "id": "obj-2",
                                  "maxclass": "button",
                                  "numinlets": 1,
                                  "numoutlets": 1,
                                  "outlettype": [
                                    "bang"
                                  ],
                                  "patching_rect": [
                                    80.0,
                                    100.0,
                                    20.0,
                                    20.0
                                  ]
                                }
                              },
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
                                    38.0,
                                    185.0,
                                    53.0,
                                    17.0
                                  ],
                                  "text": "$1 $1 1."
                                }
                              },
                              {
                                "box": {
                                  "fontname": "Arial",
                                  "fontsize": 12.0,
                                  "id": "obj-36",
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
                                    153.0,
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
                                  "id": "obj-35",
                                  "maxclass": "newobj",
                                  "numinlets": 1,
                                  "numoutlets": 2,
                                  "outlettype": [
                                    "",
                                    ""
                                  ],
                                  "patching_rect": [
                                    51.0,
                                    130.0,
                                    54.0,
                                    19.0
                                  ],
                                  "text": "j.init"
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
                                    38.0,
                                    264.0,
                                    25.0,
                                    25.0
                                  ]
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
                                    103.0,
                                    262.0,
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
                                    228.0,
                                    262.0,
                                    25.0,
                                    25.0
                                  ]
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
                                    334.0,
                                    262.0,
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
                                    "obj-36",
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
                                    "obj-1",
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
                                    "obj-33",
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
                                    "obj-10",
                                    0
                                  ],
                                  "hidden": 0,
                                  "midpoints": [

                                  ],
                                  "source": [
                                    "obj-36",
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
                                  "hidden": 0,
                                  "midpoints": [

                                  ],
                                  "source": [
                                    "obj-36",
                                    2
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
                                    "obj-36",
                                    2
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
                                    "obj-36",
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
                                  "hidden": 0,
                                  "midpoints": [

                                  ],
                                  "source": [
                                    "obj-36",
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
                                    "obj-38",
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
                                    "obj-5",
                                    0
                                  ]
                                }
                              }
                            ]
                          },
                          "patching_rect": [
                            221.0,
                            174.0,
                            59.5,
                            19.0
                          ],
                          "saved_object_attributes": {
                            "fontface": 0,
                            "fontsize": 12.0,
                            "default_fontname": "Arial",
                            "default_fontsize": 12.0,
                            "fontname": "Arial",
                            "default_fontface": 0,
                            "globalpatchername": ""
                          },
                          "text": "p init"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-34",
                          "maxclass": "newobj",
                          "numinlets": 2,
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
                                  "id": "obj-22",
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
                                    135.0,
                                    101.0,
                                    55.0
                                  ],
                                  "text": "j.unit @dataspace gain @input midigain @output linear"
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
                                    55.0,
                                    296.0,
                                    71.0,
                                    19.0
                                  ],
                                  "text": "pack 0 0."
                                }
                              },
                              {
                                "box": {
                                  "fontname": "Arial",
                                  "fontsize": 12.0,
                                  "id": "obj-11",
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
                                  "id": "obj-9",
                                  "maxclass": "newobj",
                                  "numinlets": 2,
                                  "numoutlets": 1,
                                  "outlettype": [
                                    "float"
                                  ],
                                  "patching_rect": [
                                    107.0,
                                    267.0,
                                    138.5,
                                    19.0
                                  ],
                                  "text": "* 1."
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
                                    55.0,
                                    320.0,
                                    89.0,
                                    19.0
                                  ],
                                  "text": "prepend gain_n"
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
                                  "id": "obj-27",
                                  "maxclass": "inlet",
                                  "numinlets": 0,
                                  "numoutlets": 1,
                                  "outlettype": [
                                    "float"
                                  ],
                                  "patching_rect": [
                                    231.0,
                                    44.0,
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
                                    58.0,
                                    346.0,
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
                                    "obj-12",
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
                                    "obj-22",
                                    0
                                  ],
                                  "hidden": 0,
                                  "midpoints": [

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
                                    "obj-6",
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
                                    "obj-11",
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
                                    "obj-9",
                                    1
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
                                    "obj-30",
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
                                    "obj-12",
                                    1
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
                            537.0,
                            422.0,
                            89.0,
                            19.0
                          ],
                          "saved_object_attributes": {
                            "fontface": 0,
                            "fontsize": 12.0,
                            "default_fontname": "Arial",
                            "default_fontsize": 12.0,
                            "fontname": "Arial",
                            "default_fontface": 0,
                            "globalpatchername": ""
                          },
                          "text": "p creating_gain"
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
                            447.0,
                            434.0,
                            47.0,
                            19.0
                          ],
                          "text": "append"
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
                            469.0,
                            408.0,
                            70.0,
                            19.0
                          ],
                          "text": "prepend set"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-25",
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
                            443.0,
                            385.0,
                            95.0,
                            19.0
                          ],
                          "saved_object_attributes": {
                            "embed": 0
                          },
                          "text": "coll"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-24",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            440.0,
                            459.0,
                            72.0,
                            19.0
                          ],
                          "text": "prepend xyz"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-52",
                          "maxclass": "newobj",
                          "numinlets": 3,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patcher": {
                            "fileversion": 1,
                            "rect": [
                              25.0,
                              69.0,
                              752.0,
                              326.0
                            ],
                            "bglocked": 0,
                            "defrect": [
                              25.0,
                              69.0,
                              752.0,
                              326.0
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
                                  "id": "obj-6",
                                  "maxclass": "newobj",
                                  "numinlets": 2,
                                  "numoutlets": 1,
                                  "outlettype": [
                                    "int"
                                  ],
                                  "patching_rect": [
                                    60.0,
                                    80.0,
                                    33.0,
                                    19.0
                                  ],
                                  "text": "+ 1"
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
                                    680.0,
                                    40.0,
                                    25.0,
                                    25.0
                                  ]
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
                                    60.0,
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
                                  "id": "obj-3",
                                  "maxclass": "newobj",
                                  "numinlets": 2,
                                  "numoutlets": 2,
                                  "outlettype": [
                                    "",
                                    ""
                                  ],
                                  "patching_rect": [
                                    100.0,
                                    215.0,
                                    60.0,
                                    19.0
                                  ],
                                  "text": "zl slice 32"
                                }
                              },
                              {
                                "box": {
                                  "comment": "",
                                  "id": "obj-2",
                                  "maxclass": "outlet",
                                  "numinlets": 1,
                                  "numoutlets": 0,
                                  "patching_rect": [
                                    100.0,
                                    280.0,
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
                                    ""
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
                                  "id": "obj-51",
                                  "maxclass": "newobj",
                                  "numinlets": 33,
                                  "numoutlets": 1,
                                  "outlettype": [
                                    ""
                                  ],
                                  "patching_rect": [
                                    100.0,
                                    135.0,
                                    530.0,
                                    19.0
                                  ],
                                  "text": "pak active 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1"
                                }
                              },
                              {
                                "box": {
                                  "fontname": "Arial",
                                  "fontsize": 12.0,
                                  "id": "obj-50",
                                  "maxclass": "newobj",
                                  "numinlets": 1,
                                  "numoutlets": 33,
                                  "outlettype": [
                                    "",
                                    "",
                                    "",
                                    "",
                                    "",
                                    "",
                                    "",
                                    "",
                                    "",
                                    "",
                                    "",
                                    "",
                                    "",
                                    "",
                                    "",
                                    "",
                                    "",
                                    "",
                                    "",
                                    "",
                                    "",
                                    "",
                                    "",
                                    "",
                                    "",
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
                                    100.0,
                                    80.0,
                                    530.0,
                                    19.0
                                  ],
                                  "text": "spray 33"
                                }
                              }
                            ],
                            "lines": [
                              {
                                "patchline": {
                                  "destination": [
                                    "obj-50",
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
                                    "obj-2",
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
                                    "obj-51",
                                    0
                                  ],
                                  "hidden": 0,
                                  "midpoints": [
                                    689.5,
                                    176.0,
                                    86.0,
                                    176.0,
                                    86.0,
                                    117.0,
                                    109.5,
                                    117.0
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
                                    "obj-51",
                                    32
                                  ],
                                  "hidden": 0,
                                  "midpoints": [

                                  ],
                                  "source": [
                                    "obj-50",
                                    32
                                  ]
                                }
                              },
                              {
                                "patchline": {
                                  "destination": [
                                    "obj-51",
                                    31
                                  ],
                                  "hidden": 0,
                                  "midpoints": [

                                  ],
                                  "source": [
                                    "obj-50",
                                    31
                                  ]
                                }
                              },
                              {
                                "patchline": {
                                  "destination": [
                                    "obj-51",
                                    30
                                  ],
                                  "hidden": 0,
                                  "midpoints": [

                                  ],
                                  "source": [
                                    "obj-50",
                                    30
                                  ]
                                }
                              },
                              {
                                "patchline": {
                                  "destination": [
                                    "obj-51",
                                    29
                                  ],
                                  "hidden": 0,
                                  "midpoints": [

                                  ],
                                  "source": [
                                    "obj-50",
                                    29
                                  ]
                                }
                              },
                              {
                                "patchline": {
                                  "destination": [
                                    "obj-51",
                                    28
                                  ],
                                  "hidden": 0,
                                  "midpoints": [

                                  ],
                                  "source": [
                                    "obj-50",
                                    28
                                  ]
                                }
                              },
                              {
                                "patchline": {
                                  "destination": [
                                    "obj-51",
                                    27
                                  ],
                                  "hidden": 0,
                                  "midpoints": [

                                  ],
                                  "source": [
                                    "obj-50",
                                    27
                                  ]
                                }
                              },
                              {
                                "patchline": {
                                  "destination": [
                                    "obj-51",
                                    26
                                  ],
                                  "hidden": 0,
                                  "midpoints": [

                                  ],
                                  "source": [
                                    "obj-50",
                                    26
                                  ]
                                }
                              },
                              {
                                "patchline": {
                                  "destination": [
                                    "obj-51",
                                    25
                                  ],
                                  "hidden": 0,
                                  "midpoints": [

                                  ],
                                  "source": [
                                    "obj-50",
                                    25
                                  ]
                                }
                              },
                              {
                                "patchline": {
                                  "destination": [
                                    "obj-51",
                                    24
                                  ],
                                  "hidden": 0,
                                  "midpoints": [

                                  ],
                                  "source": [
                                    "obj-50",
                                    24
                                  ]
                                }
                              },
                              {
                                "patchline": {
                                  "destination": [
                                    "obj-51",
                                    23
                                  ],
                                  "hidden": 0,
                                  "midpoints": [

                                  ],
                                  "source": [
                                    "obj-50",
                                    23
                                  ]
                                }
                              },
                              {
                                "patchline": {
                                  "destination": [
                                    "obj-51",
                                    22
                                  ],
                                  "hidden": 0,
                                  "midpoints": [

                                  ],
                                  "source": [
                                    "obj-50",
                                    22
                                  ]
                                }
                              },
                              {
                                "patchline": {
                                  "destination": [
                                    "obj-51",
                                    21
                                  ],
                                  "hidden": 0,
                                  "midpoints": [

                                  ],
                                  "source": [
                                    "obj-50",
                                    21
                                  ]
                                }
                              },
                              {
                                "patchline": {
                                  "destination": [
                                    "obj-51",
                                    20
                                  ],
                                  "hidden": 0,
                                  "midpoints": [

                                  ],
                                  "source": [
                                    "obj-50",
                                    20
                                  ]
                                }
                              },
                              {
                                "patchline": {
                                  "destination": [
                                    "obj-51",
                                    19
                                  ],
                                  "hidden": 0,
                                  "midpoints": [

                                  ],
                                  "source": [
                                    "obj-50",
                                    19
                                  ]
                                }
                              },
                              {
                                "patchline": {
                                  "destination": [
                                    "obj-51",
                                    18
                                  ],
                                  "hidden": 0,
                                  "midpoints": [

                                  ],
                                  "source": [
                                    "obj-50",
                                    18
                                  ]
                                }
                              },
                              {
                                "patchline": {
                                  "destination": [
                                    "obj-51",
                                    17
                                  ],
                                  "hidden": 0,
                                  "midpoints": [

                                  ],
                                  "source": [
                                    "obj-50",
                                    17
                                  ]
                                }
                              },
                              {
                                "patchline": {
                                  "destination": [
                                    "obj-51",
                                    16
                                  ],
                                  "hidden": 0,
                                  "midpoints": [

                                  ],
                                  "source": [
                                    "obj-50",
                                    16
                                  ]
                                }
                              },
                              {
                                "patchline": {
                                  "destination": [
                                    "obj-51",
                                    15
                                  ],
                                  "hidden": 0,
                                  "midpoints": [

                                  ],
                                  "source": [
                                    "obj-50",
                                    15
                                  ]
                                }
                              },
                              {
                                "patchline": {
                                  "destination": [
                                    "obj-51",
                                    14
                                  ],
                                  "hidden": 0,
                                  "midpoints": [

                                  ],
                                  "source": [
                                    "obj-50",
                                    14
                                  ]
                                }
                              },
                              {
                                "patchline": {
                                  "destination": [
                                    "obj-51",
                                    13
                                  ],
                                  "hidden": 0,
                                  "midpoints": [

                                  ],
                                  "source": [
                                    "obj-50",
                                    13
                                  ]
                                }
                              },
                              {
                                "patchline": {
                                  "destination": [
                                    "obj-51",
                                    12
                                  ],
                                  "hidden": 0,
                                  "midpoints": [

                                  ],
                                  "source": [
                                    "obj-50",
                                    12
                                  ]
                                }
                              },
                              {
                                "patchline": {
                                  "destination": [
                                    "obj-51",
                                    11
                                  ],
                                  "hidden": 0,
                                  "midpoints": [

                                  ],
                                  "source": [
                                    "obj-50",
                                    11
                                  ]
                                }
                              },
                              {
                                "patchline": {
                                  "destination": [
                                    "obj-51",
                                    10
                                  ],
                                  "hidden": 0,
                                  "midpoints": [

                                  ],
                                  "source": [
                                    "obj-50",
                                    10
                                  ]
                                }
                              },
                              {
                                "patchline": {
                                  "destination": [
                                    "obj-51",
                                    9
                                  ],
                                  "hidden": 0,
                                  "midpoints": [

                                  ],
                                  "source": [
                                    "obj-50",
                                    9
                                  ]
                                }
                              },
                              {
                                "patchline": {
                                  "destination": [
                                    "obj-51",
                                    8
                                  ],
                                  "hidden": 0,
                                  "midpoints": [

                                  ],
                                  "source": [
                                    "obj-50",
                                    8
                                  ]
                                }
                              },
                              {
                                "patchline": {
                                  "destination": [
                                    "obj-51",
                                    7
                                  ],
                                  "hidden": 0,
                                  "midpoints": [

                                  ],
                                  "source": [
                                    "obj-50",
                                    7
                                  ]
                                }
                              },
                              {
                                "patchline": {
                                  "destination": [
                                    "obj-51",
                                    6
                                  ],
                                  "hidden": 0,
                                  "midpoints": [

                                  ],
                                  "source": [
                                    "obj-50",
                                    6
                                  ]
                                }
                              },
                              {
                                "patchline": {
                                  "destination": [
                                    "obj-51",
                                    5
                                  ],
                                  "hidden": 0,
                                  "midpoints": [

                                  ],
                                  "source": [
                                    "obj-50",
                                    5
                                  ]
                                }
                              },
                              {
                                "patchline": {
                                  "destination": [
                                    "obj-51",
                                    4
                                  ],
                                  "hidden": 0,
                                  "midpoints": [

                                  ],
                                  "source": [
                                    "obj-50",
                                    4
                                  ]
                                }
                              },
                              {
                                "patchline": {
                                  "destination": [
                                    "obj-51",
                                    3
                                  ],
                                  "hidden": 0,
                                  "midpoints": [

                                  ],
                                  "source": [
                                    "obj-50",
                                    3
                                  ]
                                }
                              },
                              {
                                "patchline": {
                                  "destination": [
                                    "obj-51",
                                    2
                                  ],
                                  "hidden": 0,
                                  "midpoints": [

                                  ],
                                  "source": [
                                    "obj-50",
                                    2
                                  ]
                                }
                              },
                              {
                                "patchline": {
                                  "destination": [
                                    "obj-51",
                                    1
                                  ],
                                  "hidden": 0,
                                  "midpoints": [

                                  ],
                                  "source": [
                                    "obj-50",
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
                                  "hidden": 0,
                                  "midpoints": [

                                  ],
                                  "source": [
                                    "obj-51",
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
                                  "hidden": 0,
                                  "midpoints": [
                                    69.5,
                                    190.0,
                                    150.5,
                                    190.0
                                  ],
                                  "source": [
                                    "obj-6",
                                    0
                                  ]
                                }
                              }
                            ]
                          },
                          "patching_rect": [
                            600.0,
                            349.0,
                            125.0,
                            19.0
                          ],
                          "saved_object_attributes": {
                            "fontface": 0,
                            "fontsize": 12.0,
                            "default_fontname": "Arial",
                            "default_fontsize": 12.0,
                            "fontname": "Arial",
                            "default_fontface": 0,
                            "globalpatchername": ""
                          },
                          "text": "p createMuteMessgage"
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
                            155.0,
                            343.0,
                            56.0,
                            17.0
                          ],
                          "text": "$1 $1 $2"
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
                            133.0,
                            410.0,
                            106.0,
                            19.0
                          ],
                          "text": "prepend db_unit_n"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-20",
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
                            143.0,
                            384.0,
                            95.0,
                            19.0
                          ],
                          "saved_object_attributes": {
                            "embed": 0
                          },
                          "text": "coll"
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
                            21.0,
                            411.0,
                            106.0,
                            19.0
                          ],
                          "text": "prepend dist_att_n"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-17",
                          "maxclass": "message",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            34.0,
                            343.0,
                            56.0,
                            17.0
                          ],
                          "text": "$1 $1 $2"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-18",
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
                            34.0,
                            384.0,
                            95.0,
                            19.0
                          ],
                          "saved_object_attributes": {
                            "embed": 0
                          },
                          "text": "coll"
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
                            "bang",
                            "float"
                          ],
                          "patching_rect": [
                            747.0,
                            150.0,
                            62.5,
                            19.0
                          ],
                          "text": "t b f"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-13",
                          "maxclass": "newobj",
                          "numinlets": 2,
                          "numoutlets": 3,
                          "outlettype": [
                            "bang",
                            "bang",
                            "int"
                          ],
                          "patching_rect": [
                            747.0,
                            195.0,
                            46.0,
                            19.0
                          ],
                          "text": "uzi 1 1"
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
                            545.0,
                            343.0,
                            56.0,
                            17.0
                          ],
                          "text": "$1 $1 $2"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-7",
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
                            545.0,
                            384.0,
                            95.0,
                            19.0
                          ],
                          "saved_object_attributes": {
                            "embed": 0
                          },
                          "text": "coll"
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
                            344.0,
                            411.0,
                            95.0,
                            19.0
                          ],
                          "text": "prepend order_n"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-31",
                          "maxclass": "message",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            364.0,
                            346.0,
                            56.0,
                            17.0
                          ],
                          "text": "$1 $1 $2"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-26",
                          "maxclass": "newobj",
                          "numinlets": 2,
                          "numoutlets": 3,
                          "outlettype": [
                            "bang",
                            "bang",
                            "int"
                          ],
                          "patching_rect": [
                            691.0,
                            55.0,
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
                          "id": "obj-3",
                          "maxclass": "newobj",
                          "numinlets": 0,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            686.0,
                            9.0,
                            107.0,
                            19.0
                          ],
                          "text": "r #0_refresh-setup"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-4",
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
                            344.0,
                            385.0,
                            95.0,
                            19.0
                          ],
                          "saved_object_attributes": {
                            "embed": 0
                          },
                          "text": "coll"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-48",
                          "linecount": 4,
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 2,
                          "outlettype": [
                            "",
                            ""
                          ],
                          "patching_rect": [
                            743.0,
                            64.0,
                            101.0,
                            55.0
                          ],
                          "text": "j.unit @dataspace gain @input midigain @output linear"
                        }
                      },
                      {
                        "box": {
                          "comment": "",
                          "id": "obj-42",
                          "maxclass": "inlet",
                          "numinlets": 0,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            742.0,
                            31.0,
                            25.0,
                            25.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "comment": "",
                          "id": "obj-15",
                          "maxclass": "inlet",
                          "numinlets": 0,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            599.0,
                            33.0,
                            25.0,
                            25.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "comment": "",
                          "id": "obj-39",
                          "maxclass": "inlet",
                          "numinlets": 0,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            49.0,
                            25.0,
                            25.0,
                            25.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "comment": "",
                          "id": "obj-40",
                          "maxclass": "outlet",
                          "numinlets": 1,
                          "numoutlets": 0,
                          "patching_rect": [
                            102.0,
                            672.0,
                            26.0,
                            26.0
                          ]
                        }
                      }
                    ],
                    "lines": [
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
                            "obj-10",
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
                            783.5,
                            383.0,
                            554.5,
                            383.0
                          ],
                          "source": [
                            "obj-13",
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
                            "obj-14",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-34",
                            1
                          ],
                          "hidden": 0,
                          "midpoints": [

                          ],
                          "source": [
                            "obj-14",
                            1
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
                            "obj-15",
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
                            "obj-52",
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
                            "obj-40",
                            0
                          ],
                          "hidden": 0,
                          "midpoints": [
                            30.5,
                            646.5,
                            111.5,
                            646.5
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
                            "obj-18",
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
                            "obj-16",
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
                            "obj-40",
                            0
                          ],
                          "hidden": 0,
                          "midpoints": [
                            142.5,
                            649.5,
                            111.5,
                            649.5
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
                            "obj-6",
                            0
                          ],
                          "hidden": 0,
                          "midpoints": [
                            170.5,
                            79.0,
                            371.5,
                            79.0
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
                            "obj-19",
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
                            "obj-21",
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
                            "obj-22",
                            2
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
                            "obj-22",
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
                            "obj-22",
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
                            "obj-22",
                            3
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
                            "obj-22",
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
                            "obj-22",
                            4
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
                            "obj-25",
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
                            "obj-25",
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
                            "obj-26",
                            2
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
                            727.5,
                            371.5,
                            43.5,
                            371.5
                          ],
                          "source": [
                            "obj-26",
                            2
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
                            727.5,
                            374.0,
                            152.5,
                            374.0
                          ],
                          "source": [
                            "obj-26",
                            2
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
                            "obj-26",
                            2
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
                            727.5,
                            378.5,
                            353.5,
                            378.5
                          ],
                          "source": [
                            "obj-26",
                            2
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
                            727.5,
                            380.0,
                            554.5,
                            380.0
                          ],
                          "source": [
                            "obj-26",
                            2
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
                            "obj-28",
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
                            "obj-52",
                            2
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
                            "obj-4",
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
                            "obj-40",
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
                            "obj-40",
                            0
                          ],
                          "hidden": 0,
                          "midpoints": [

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
                            "obj-2",
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
                            "obj-48",
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
                            "obj-14",
                            0
                          ],
                          "hidden": 0,
                          "midpoints": [

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
                            "obj-11",
                            0
                          ],
                          "hidden": 0,
                          "midpoints": [

                          ],
                          "source": [
                            "obj-5",
                            2
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
                            "obj-5",
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
                            "obj-5",
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
                            "obj-5",
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
                            "obj-5",
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
                            "obj-5",
                            2
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
                            609.5,
                            657.0,
                            111.5,
                            657.0
                          ],
                          "source": [
                            "obj-52",
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
                            "obj-52",
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
                            "obj-6",
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
                            "obj-6",
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
                            "obj-32",
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
                            "obj-34",
                            0
                          ],
                          "hidden": 0,
                          "midpoints": [

                          ],
                          "source": [
                            "obj-6",
                            2
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-52",
                            1
                          ],
                          "hidden": 0,
                          "midpoints": [

                          ],
                          "source": [
                            "obj-6",
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

                          ],
                          "source": [
                            "obj-6",
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
                            "obj-40",
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
                    25.0,
                    213.0,
                    338.0,
                    19.0
                  ],
                  "saved_object_attributes": {
                    "fontface": 0,
                    "fontsize": 12.0,
                    "default_fontname": "Arial",
                    "default_fontsize": 12.0,
                    "fontname": "Arial",
                    "default_fontface": 0,
                    "globalpatchername": ""
                  },
                  "text": "p source"
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
                    25.0,
                    145.0,
                    123.0,
                    19.0
                  ],
                  "text": "j.oscroute /source"
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
                    25.0,
                    15.0,
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
                    25.0,
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
                    "obj-5",
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
                    "obj-14",
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
                    2
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
                    "obj-1",
                    1
                  ],
                  "hidden": 0,
                  "midpoints": [

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
                    "obj-15",
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
                    "obj-18",
                    0
                  ],
                  "hidden": 0,
                  "midpoints": [

                  ],
                  "source": [
                    "obj-12",
                    4
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
                    "obj-12",
                    5
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
                    "obj-17",
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
                    "obj-38",
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
                    "obj-5",
                    0
                  ],
                  "hidden": 0,
                  "midpoints": [
                    463.5,
                    243.0,
                    34.5,
                    243.0
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
                    "obj-5",
                    0
                  ],
                  "hidden": 0,
                  "midpoints": [
                    378.5,
                    243.5,
                    34.5,
                    243.5
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
                    "obj-38",
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
                    "obj-5",
                    0
                  ],
                  "hidden": 0,
                  "midpoints": [
                    562.5,
                    244.5,
                    34.5,
                    244.5
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
                  "hidden": 0,
                  "midpoints": [
                    677.5,
                    244.0,
                    34.5,
                    244.0
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
                    "obj-1",
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
                    "obj-19",
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
                    "obj-8",
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
                    "obj-12",
                    0
                  ],
                  "hidden": 0,
                  "midpoints": [

                  ],
                  "source": [
                    "obj-8",
                    3
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
                    "obj-8",
                    2
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-7",
                    1
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
                    "obj-5",
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
            120.0,
            98.0,
            74.0,
            19.0
          ],
          "saved_object_attributes": {
            "fontface": 0,
            "fontsize": 12.0,
            "default_fontname": "Arial",
            "default_fontsize": 12.0,
            "fontname": "Arial",
            "default_fontface": 0,
            "globalpatchername": ""
          },
          "text": "p messages",
          "varname": "messages"
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
            "",
            "int"
          ],
          "patcher": {
            "fileversion": 1,
            "rect": [
              250.0,
              114.0,
              967.0,
              520.0
            ],
            "bglocked": 0,
            "defrect": [
              250.0,
              114.0,
              967.0,
              520.0
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
                  "id": "obj-23",
                  "maxclass": "newobj",
                  "numinlets": 0,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    307.0,
                    108.0,
                    107.0,
                    19.0
                  ],
                  "text": "r #0_refresh-setup"
                }
              },
              {
                "box": {
                  "comment": "",
                  "id": "obj-10",
                  "maxclass": "outlet",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    859.0,
                    419.0,
                    25.0,
                    25.0
                  ]
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
                    "int"
                  ],
                  "patching_rect": [
                    307.0,
                    141.0,
                    32.5,
                    19.0
                  ],
                  "text": "i"
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
                    "int"
                  ],
                  "patching_rect": [
                    130.0,
                    264.0,
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
                  "id": "obj-30",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    ""
                  ],
                  "patching_rect": [
                    148.0,
                    192.0,
                    78.0,
                    19.0
                  ],
                  "text": "zl change 3 8"
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
                    165.0,
                    90.0,
                    48.0,
                    19.0
                  ],
                  "text": "pak 3 8"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-28",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    24.0,
                    324.0,
                    108.0,
                    19.0
                  ],
                  "text": "s #0_refresh-setup"
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
                    24.0,
                    299.0,
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
                  "id": "obj-1",
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
                    165.0,
                    60.0,
                    253.0,
                    19.0
                  ],
                  "text": "j.oscroute /order /numSources /audio/mute"
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
                    "int",
                    "int"
                  ],
                  "patching_rect": [
                    148.0,
                    232.0,
                    100.0,
                    19.0
                  ],
                  "text": "unpack 0 0"
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
                  "patcher": {
                    "fileversion": 1,
                    "rect": [
                      454.0,
                      201.0,
                      808.0,
                      513.0
                    ],
                    "bglocked": 0,
                    "defrect": [
                      454.0,
                      201.0,
                      808.0,
                      513.0
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
                          "numinlets": 1,
                          "numoutlets": 1,
                          "outlettype": [
                            "int"
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
                                  "id": "obj-11",
                                  "maxclass": "newobj",
                                  "numinlets": 2,
                                  "numoutlets": 2,
                                  "outlettype": [
                                    "int",
                                    "int"
                                  ],
                                  "patching_rect": [
                                    57.0,
                                    129.0,
                                    74.0,
                                    19.0
                                  ],
                                  "text": "minimum 32"
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
                                    57.0,
                                    107.0,
                                    120.0,
                                    19.0
                                  ],
                                  "text": "expr pow(($i1+1)\\,2)"
                                }
                              },
                              {
                                "box": {
                                  "comment": "",
                                  "id": "obj-2",
                                  "maxclass": "outlet",
                                  "numinlets": 1,
                                  "numoutlets": 0,
                                  "patching_rect": [
                                    50.0,
                                    220.0,
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
                                    "int"
                                  ],
                                  "patching_rect": [
                                    50.0,
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
                                    "obj-8",
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
                                    "obj-2",
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
                              }
                            ]
                          },
                          "patching_rect": [
                            56.0,
                            72.0,
                            65.0,
                            19.0
                          ],
                          "saved_object_attributes": {
                            "fontface": 0,
                            "fontsize": 12.0,
                            "default_fontname": "Arial",
                            "default_fontsize": 12.0,
                            "fontname": "Arial",
                            "default_fontface": 0,
                            "globalpatchername": ""
                          },
                          "text": "p channels"
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
                            535.0,
                            169.0,
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
                          "id": "obj-20",
                          "maxclass": "message",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            535.0,
                            148.0,
                            62.0,
                            17.0
                          ],
                          "text": "pass[ $1 ]"
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
                          "patching_rect": [
                            10.0,
                            188.0,
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
                          "id": "obj-18",
                          "maxclass": "message",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            10.0,
                            167.0,
                            62.0,
                            17.0
                          ],
                          "text": "pass[ $1 ]"
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
                            305.0,
                            205.0,
                            165.0,
                            19.0
                          ],
                          "text": "prepend script connect encode"
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
                            305.0,
                            270.0,
                            48.0,
                            19.0
                          ],
                          "text": "append"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-13",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            535.0,
                            214.0,
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
                          "id": "obj-12",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            535.0,
                            193.0,
                            58.0,
                            19.0
                          ],
                          "text": "append 0"
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
                            ""
                          ],
                          "patching_rect": [
                            10.0,
                            280.0,
                            48.0,
                            19.0
                          ],
                          "text": "append"
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
                            10.0,
                            221.0,
                            126.0,
                            19.0
                          ],
                          "text": "prepend script connect"
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
                            189.0,
                            213.0,
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
                          "id": "obj-7",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            189.0,
                            192.0,
                            101.0,
                            19.0
                          ],
                          "text": "prepend 0 multiin"
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
                            55.0,
                            113.0,
                            46.0,
                            19.0
                          ],
                          "text": "uzi 8 0"
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
                            57.0,
                            36.0,
                            25.0,
                            25.0
                          ]
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
                            10.0,
                            360.0,
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
                            "obj-6",
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
                            "obj-15",
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
                            "obj-6",
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
                            "obj-16",
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
                            "obj-12",
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
                            "obj-19",
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
                            "obj-16",
                            0
                          ],
                          "hidden": 0,
                          "midpoints": [
                            91.5,
                            137.0,
                            314.5,
                            137.0
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
                            "obj-18",
                            0
                          ],
                          "hidden": 0,
                          "midpoints": [
                            91.5,
                            157.0,
                            19.5,
                            157.0
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
                            "obj-20",
                            0
                          ],
                          "hidden": 0,
                          "midpoints": [
                            91.5,
                            136.5,
                            544.5,
                            136.5
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
                            "obj-7",
                            0
                          ],
                          "hidden": 0,
                          "midpoints": [
                            91.5,
                            136.5,
                            198.5,
                            136.5
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
                            "obj-1",
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
                            "obj-10",
                            0
                          ],
                          "hidden": 0,
                          "midpoints": [
                            198.5,
                            255.5,
                            19.5,
                            255.5
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
                            "obj-10",
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
                    145.0,
                    350.0,
                    131.0,
                    19.0
                  ],
                  "saved_object_attributes": {
                    "fontface": 0,
                    "fontsize": 12.0,
                    "default_fontname": "Arial",
                    "default_fontsize": 12.0,
                    "fontname": "Arial",
                    "default_fontface": 0,
                    "globalpatchername": ""
                  },
                  "text": "p connect_from_decode"
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
                    ""
                  ],
                  "patcher": {
                    "fileversion": 1,
                    "rect": [
                      482.0,
                      255.0,
                      796.0,
                      511.0
                    ],
                    "bglocked": 0,
                    "defrect": [
                      482.0,
                      255.0,
                      796.0,
                      511.0
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
                          "comment": "",
                          "id": "obj-2",
                          "maxclass": "inlet",
                          "numinlets": 0,
                          "numoutlets": 1,
                          "outlettype": [
                            "int"
                          ],
                          "patching_rect": [
                            114.0,
                            24.0,
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
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            "int"
                          ],
                          "patching_rect": [
                            50.0,
                            94.0,
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
                          "id": "obj-13",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            290.0,
                            275.0,
                            48.0,
                            19.0
                          ],
                          "text": "append"
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
                            480.0,
                            240.0,
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
                          "id": "obj-11",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            480.0,
                            214.0,
                            91.0,
                            19.0
                          ],
                          "text": "prepend encode"
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
                            ""
                          ],
                          "patching_rect": [
                            290.0,
                            225.0,
                            172.0,
                            19.0
                          ],
                          "text": "prepend script connect multiout"
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
                            65.0,
                            225.0,
                            193.0,
                            17.0
                          ],
                          "text": "script connect messages 0 encode 0"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-7",
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
                            141.0,
                            46.0,
                            19.0
                          ],
                          "text": "uzi 4 0"
                        }
                      },
                      {
                        "box": {
                          "comment": "",
                          "id": "obj-8",
                          "maxclass": "inlet",
                          "numinlets": 0,
                          "numoutlets": 1,
                          "outlettype": [
                            "bang"
                          ],
                          "patching_rect": [
                            50.0,
                            25.0,
                            25.0,
                            25.0
                          ]
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
                            65.0,
                            355.0,
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
                            "obj-7",
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
                            "obj-13",
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
                            "obj-12",
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
                            "obj-9",
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
                            1
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
                            "obj-9",
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
                            "obj-10",
                            0
                          ],
                          "hidden": 0,
                          "midpoints": [

                          ],
                          "source": [
                            "obj-7",
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
                            "obj-7",
                            2
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
                            "obj-7",
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

                          ],
                          "source": [
                            "obj-8",
                            0
                          ]
                        }
                      }
                    ]
                  },
                  "patching_rect": [
                    277.0,
                    350.0,
                    118.0,
                    19.0
                  ],
                  "saved_object_attributes": {
                    "fontface": 0,
                    "fontsize": 12.0,
                    "default_fontname": "Arial",
                    "default_fontsize": 12.0,
                    "fontname": "Arial",
                    "default_fontface": 0,
                    "globalpatchername": ""
                  },
                  "text": "p connect_to_decode"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-9",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patcher": {
                    "fileversion": 1,
                    "rect": [
                      322.0,
                      296.0,
                      600.0,
                      426.0
                    ],
                    "bglocked": 0,
                    "defrect": [
                      322.0,
                      296.0,
                      600.0,
                      426.0
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
                          "id": "obj-2",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            51.0,
                            218.0,
                            213.0,
                            19.0
                          ],
                          "text": "append @coord_system 0 @xyz_scale 1"
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
                            50.0,
                            195.0,
                            48.0,
                            19.0
                          ],
                          "text": "append"
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
                            425.0,
                            135.0,
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
                          "id": "obj-7",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            50.0,
                            135.0,
                            364.0,
                            19.0
                          ],
                          "text": "prepend script new encode newex 252 153 209 196617 ambiencode~"
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
                            424.0,
                            42.0,
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
                            50.0,
                            25.0,
                            25.0,
                            25.0
                          ]
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
                            52.0,
                            255.0,
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
                            "obj-8",
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
                            "obj-6",
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
                            "obj-7",
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
                          "hidden": 0,
                          "midpoints": [
                            434.5,
                            181.0,
                            59.5,
                            181.0
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
                            "obj-2",
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
                    398.0,
                    350.0,
                    83.0,
                    19.0
                  ],
                  "saved_object_attributes": {
                    "fontface": 0,
                    "fontsize": 12.0,
                    "default_fontname": "Arial",
                    "default_fontsize": 12.0,
                    "fontname": "Arial",
                    "default_fontface": 0,
                    "globalpatchername": ""
                  },
                  "text": "p new_encode"
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
                  "patcher": {
                    "fileversion": 1,
                    "rect": [
                      493.0,
                      305.0,
                      600.0,
                      426.0
                    ],
                    "bglocked": 0,
                    "defrect": [
                      493.0,
                      305.0,
                      600.0,
                      426.0
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
                          "id": "obj-23",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 1,
                          "outlettype": [
                            "int"
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
                                  "id": "obj-11",
                                  "maxclass": "newobj",
                                  "numinlets": 2,
                                  "numoutlets": 2,
                                  "outlettype": [
                                    "int",
                                    "int"
                                  ],
                                  "patching_rect": [
                                    57.0,
                                    129.0,
                                    74.0,
                                    19.0
                                  ],
                                  "text": "minimum 32"
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
                                    57.0,
                                    107.0,
                                    120.0,
                                    19.0
                                  ],
                                  "text": "expr pow(($i1+1)\\,2)"
                                }
                              },
                              {
                                "box": {
                                  "comment": "",
                                  "id": "obj-2",
                                  "maxclass": "outlet",
                                  "numinlets": 1,
                                  "numoutlets": 0,
                                  "patching_rect": [
                                    50.0,
                                    220.0,
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
                                    "int"
                                  ],
                                  "patching_rect": [
                                    50.0,
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
                                    "obj-8",
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
                                    "obj-2",
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
                              }
                            ]
                          },
                          "patching_rect": [
                            50.0,
                            51.0,
                            65.0,
                            19.0
                          ],
                          "saved_object_attributes": {
                            "fontface": 0,
                            "fontsize": 12.0,
                            "default_fontname": "Arial",
                            "default_fontsize": 12.0,
                            "fontname": "Arial",
                            "default_fontface": 0,
                            "globalpatchername": ""
                          },
                          "text": "p channels"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-13",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            77.0,
                            184.0,
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
                          "id": "obj-12",
                          "maxclass": "message",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            77.0,
                            163.0,
                            62.0,
                            17.0
                          ],
                          "text": "pass[ $1 ]"
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
                            77.0,
                            218.0,
                            115.0,
                            19.0
                          ],
                          "text": "prepend script delete"
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
                            "int",
                            "bang"
                          ],
                          "patching_rect": [
                            50.0,
                            72.0,
                            34.0,
                            19.0
                          ],
                          "text": "t i b"
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
                            125.0,
                            46.0,
                            19.0
                          ],
                          "text": "uzi 8 0"
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
                            "int"
                          ],
                          "patching_rect": [
                            50.0,
                            99.0,
                            32.5,
                            19.0
                          ],
                          "text": "i 16"
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
                            50.0,
                            25.0,
                            25.0,
                            25.0
                          ]
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
                            82.0,
                            282.0,
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
                            "obj-4",
                            1
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
                            "obj-11",
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
                            "obj-12",
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
                            "obj-23",
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
                      }
                    ]
                  },
                  "patching_rect": [
                    729.0,
                    346.0,
                    80.0,
                    19.0
                  ],
                  "saved_object_attributes": {
                    "fontface": 0,
                    "fontsize": 12.0,
                    "default_fontname": "Arial",
                    "default_fontsize": 12.0,
                    "fontname": "Arial",
                    "default_fontface": 0,
                    "globalpatchername": ""
                  },
                  "text": "p delete_pass"
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
                  "patcher": {
                    "fileversion": 1,
                    "rect": [
                      92.0,
                      101.0,
                      623.0,
                      371.0
                    ],
                    "bglocked": 0,
                    "defrect": [
                      92.0,
                      101.0,
                      623.0,
                      371.0
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
                          "id": "obj-23",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 1,
                          "outlettype": [
                            "int"
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
                                  "id": "obj-11",
                                  "maxclass": "newobj",
                                  "numinlets": 2,
                                  "numoutlets": 2,
                                  "outlettype": [
                                    "int",
                                    "int"
                                  ],
                                  "patching_rect": [
                                    57.0,
                                    129.0,
                                    74.0,
                                    19.0
                                  ],
                                  "text": "minimum 32"
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
                                    57.0,
                                    107.0,
                                    120.0,
                                    19.0
                                  ],
                                  "text": "expr pow(($i1+1)\\,2)"
                                }
                              },
                              {
                                "box": {
                                  "comment": "",
                                  "id": "obj-2",
                                  "maxclass": "outlet",
                                  "numinlets": 1,
                                  "numoutlets": 0,
                                  "patching_rect": [
                                    50.0,
                                    220.0,
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
                                    "int"
                                  ],
                                  "patching_rect": [
                                    50.0,
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
                                    "obj-8",
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
                                    "obj-2",
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
                              }
                            ]
                          },
                          "patching_rect": [
                            53.0,
                            62.0,
                            65.0,
                            19.0
                          ],
                          "saved_object_attributes": {
                            "fontface": 0,
                            "fontsize": 12.0,
                            "default_fontname": "Arial",
                            "default_fontsize": 12.0,
                            "fontname": "Arial",
                            "default_fontface": 0,
                            "globalpatchername": ""
                          },
                          "text": "p channels"
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
                            20.0,
                            193.0,
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
                          "id": "obj-20",
                          "maxclass": "message",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            20.0,
                            174.0,
                            62.0,
                            17.0
                          ],
                          "text": "pass[ $1 ]"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-13",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            10.0,
                            225.0,
                            108.0,
                            19.0
                          ],
                          "text": "prepend script new"
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
                            10.0,
                            267.0,
                            48.0,
                            19.0
                          ],
                          "text": "append"
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
                            355.0,
                            225.0,
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
                          "id": "obj-10",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            355.0,
                            200.0,
                            89.0,
                            19.0
                          ],
                          "text": "prepend newex"
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
                            355.0,
                            175.0,
                            163.0,
                            19.0
                          ],
                          "text": "append 230 36 196617 pass~"
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
                            355.0,
                            140.0,
                            42.0,
                            19.0
                          ],
                          "text": "+ 252"
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
                            355.0,
                            115.0,
                            40.0,
                            19.0
                          ],
                          "text": "* 38"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-1",
                          "maxclass": "newobj",
                          "numinlets": 2,
                          "numoutlets": 3,
                          "outlettype": [
                            "bang",
                            "bang",
                            "int"
                          ],
                          "patching_rect": [
                            49.0,
                            102.0,
                            46.0,
                            19.0
                          ],
                          "text": "uzi 8 0"
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
                            "int"
                          ],
                          "patching_rect": [
                            50.0,
                            20.0,
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
                            10.0,
                            292.0,
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
                            "obj-20",
                            0
                          ],
                          "hidden": 0,
                          "midpoints": [

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
                            "obj-7",
                            0
                          ],
                          "hidden": 0,
                          "midpoints": [

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
                            "obj-11",
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
                            "obj-12",
                            0
                          ],
                          "hidden": 0,
                          "midpoints": [
                            364.5,
                            252.0,
                            19.5,
                            252.0
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
                            "obj-12",
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
                            "obj-19",
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
                            "obj-20",
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
                            "obj-23",
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
                            "obj-9",
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
                            "obj-10",
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
                    494.0,
                    350.0,
                    70.0,
                    19.0
                  ],
                  "saved_object_attributes": {
                    "fontface": 0,
                    "fontsize": 12.0,
                    "default_fontname": "Arial",
                    "default_fontsize": 12.0,
                    "fontname": "Arial",
                    "default_fontface": 0,
                    "globalpatchername": ""
                  },
                  "text": "p new_pass"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-13",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "outlettype": [
                    "bang"
                  ],
                  "patching_rect": [
                    30.0,
                    40.0,
                    58.0,
                    19.0
                  ],
                  "text": "loadbang"
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
                    "int"
                  ],
                  "patching_rect": [
                    85.0,
                    100.0,
                    42.0,
                    19.0
                  ],
                  "text": "== 0"
                }
              },
              {
                "box": {
                  "comment": "",
                  "id": "obj-15",
                  "maxclass": "outlet",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    145.0,
                    400.0,
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
                  "numoutlets": 6,
                  "outlettype": [
                    "int",
                    "bang",
                    "int",
                    "int",
                    "bang",
                    "int"
                  ],
                  "patching_rect": [
                    145.0,
                    320.0,
                    596.5,
                    19.0
                  ],
                  "text": "t i b i i b i"
                }
              },
              {
                "box": {
                  "comment": "",
                  "id": "obj-17",
                  "maxclass": "inlet",
                  "numinlets": 0,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    165.0,
                    25.0,
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
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    ""
                  ],
                  "patching_rect": [
                    165.0,
                    141.0,
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
                  "id": "obj-19",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    148.0,
                    164.0,
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
                  "id": "obj-20",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 3,
                  "outlettype": [
                    "bang",
                    "bang",
                    ""
                  ],
                  "patching_rect": [
                    30.0,
                    100.0,
                    46.0,
                    19.0
                  ],
                  "text": "sel 0 1"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-21",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 4,
                  "outlettype": [
                    "int",
                    "float",
                    "int",
                    "int"
                  ],
                  "patching_rect": [
                    30.0,
                    65.0,
                    67.0,
                    19.0
                  ],
                  "text": "dspstate~"
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
                    200.0,
                    30.0,
                    118.0,
                    19.0
                  ],
                  "text": "voices"
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
                    610.0,
                    350.0,
                    112.0,
                    17.0
                  ],
                  "text": "script delete encode"
                }
              }
            ],
            "lines": [
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
                    "obj-6",
                    1
                  ],
                  "hidden": 0,
                  "midpoints": [

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
                    "obj-15",
                    0
                  ],
                  "hidden": 0,
                  "midpoints": [
                    738.5,
                    383.0,
                    154.5,
                    383.0
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
                  "hidden": 0,
                  "midpoints": [
                    503.5,
                    381.0,
                    154.5,
                    381.0
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
                    "obj-21",
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
                    "obj-11",
                    0
                  ],
                  "hidden": 0,
                  "midpoints": [

                  ],
                  "source": [
                    "obj-16",
                    5
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
                    "obj-16",
                    3
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
                    4
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
                    "obj-16",
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
                    "obj-9",
                    0
                  ],
                  "hidden": 0,
                  "midpoints": [

                  ],
                  "source": [
                    "obj-16",
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
                    "obj-19",
                    1
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
                    "obj-30",
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
                    "obj-18",
                    0
                  ],
                  "hidden": 0,
                  "midpoints": [
                    39.5,
                    131.0,
                    174.5,
                    131.0
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
                    "obj-14",
                    0
                  ],
                  "hidden": 0,
                  "midpoints": [
                    39.5,
                    92.0,
                    94.5,
                    92.0
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
                    "obj-6",
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
                    "obj-16",
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
                    "obj-26",
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
                    "obj-18",
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
                    "obj-8",
                    1
                  ],
                  "hidden": 0,
                  "midpoints": [
                    238.5,
                    308.0,
                    385.5,
                    308.0
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
                    1
                  ],
                  "hidden": 0,
                  "midpoints": [
                    238.5,
                    307.0,
                    471.5,
                    307.0
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
                    "obj-3",
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
                    "obj-15",
                    0
                  ],
                  "hidden": 0,
                  "midpoints": [
                    619.5,
                    383.0,
                    154.5,
                    383.0
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
                    316.5,
                    278.0,
                    868.5,
                    278.0
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
                    "obj-15",
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
                    "obj-15",
                    0
                  ],
                  "hidden": 0,
                  "midpoints": [
                    286.5,
                    381.0,
                    154.5,
                    381.0
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
                    "obj-15",
                    0
                  ],
                  "hidden": 0,
                  "midpoints": [
                    407.5,
                    381.0,
                    154.5,
                    381.0
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
            28.0,
            136.0,
            91.0,
            19.0
          ],
          "saved_object_attributes": {
            "fontface": 0,
            "fontsize": 12.0,
            "default_fontname": "Arial",
            "default_fontsize": 12.0,
            "fontname": "Arial",
            "default_fontface": 0,
            "globalpatchername": ""
          },
          "text": "p scripting"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-1",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 33,
          "outlettype": [
            "signal",
            "signal",
            "signal",
            "signal",
            "signal",
            "signal",
            "signal",
            "signal",
            "signal",
            "signal",
            "signal",
            "signal",
            "signal",
            "signal",
            "signal",
            "signal",
            "signal",
            "signal",
            "signal",
            "signal",
            "signal",
            "signal",
            "signal",
            "signal",
            "signal",
            "signal",
            "signal",
            "signal",
            "signal",
            "signal",
            "signal",
            "signal",
            ""
          ],
          "patching_rect": [
            250.0,
            95.0,
            941.0,
            19.0
          ],
          "text": "j.unpack= 32",
          "varname": "multiout"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-2",
          "maxclass": "newobj",
          "numinlets": 32,
          "numoutlets": 2,
          "outlettype": [
            "audio.connect",
            ""
          ],
          "patching_rect": [
            254.0,
            374.0,
            734.5,
            19.0
          ],
          "text": "j.pack= 32",
          "varname": "multiin"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-3",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patcher": {
            "fileversion": 1,
            "rect": [
              14.0,
              46.0,
              948.0,
              529.0
            ],
            "bglocked": 0,
            "defrect": [
              14.0,
              46.0,
              948.0,
              529.0
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
                  "id": "obj-28",
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
                          "id": "obj-23",
                          "maxclass": "newobj",
                          "numinlets": 2,
                          "numoutlets": 2,
                          "outlettype": [
                            "",
                            ""
                          ],
                          "patching_rect": [
                            50.0,
                            200.0,
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
                          "id": "obj-9",
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
                            54.0,
                            19.0
                          ],
                          "text": "zl slice 1"
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
                            90.0,
                            130.0,
                            324.0,
                            19.0
                          ],
                          "text": "j.unit @dataspace position @input xyz @output aed"
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
                          "id": "obj-27",
                          "maxclass": "outlet",
                          "numinlets": 1,
                          "numoutlets": 0,
                          "patching_rect": [
                            50.0,
                            279.0,
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
                            "obj-27",
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
                            "obj-9",
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
                            "obj-23",
                            1
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
                            "obj-23",
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
                            "obj-9",
                            1
                          ]
                        }
                      }
                    ]
                  },
                  "patching_rect": [
                    350.0,
                    130.0,
                    62.0,
                    19.0
                  ],
                  "saved_object_attributes": {
                    "fontface": 0,
                    "fontsize": 12.0,
                    "default_fontname": "Arial",
                    "default_fontsize": 12.0,
                    "fontname": "Arial",
                    "default_fontface": 0,
                    "globalpatchername": ""
                  },
                  "text": "p xyz2aed"
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
                    "",
                    ""
                  ],
                  "patching_rect": [
                    625.0,
                    370.0,
                    98.0,
                    19.0
                  ],
                  "text": "j.pass /report"
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
                    "bang",
                    ""
                  ],
                  "patching_rect": [
                    365.0,
                    270.0,
                    33.0,
                    19.0
                  ],
                  "text": "t b l"
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
                  "patching_rect": [
                    400.0,
                    270.0,
                    68.0,
                    19.0
                  ],
                  "text": "prepend set"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-6",
                  "maxclass": "newobj",
                  "numinlets": 4,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    365.0,
                    300.0,
                    60.0,
                    19.0
                  ],
                  "text": "pack i f f f"
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
                    380.0,
                    210.0,
                    37.0,
                    17.0
                  ],
                  "text": "dump"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-52",
                  "maxclass": "newobj",
                  "numinlets": 3,
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
                          "id": "obj-6",
                          "maxclass": "newobj",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            "int"
                          ],
                          "patching_rect": [
                            9.0,
                            93.0,
                            32.5,
                            19.0
                          ],
                          "text": "+ 1"
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
                            "bang"
                          ],
                          "patching_rect": [
                            529.0,
                            64.0,
                            25.0,
                            25.0
                          ]
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
                            9.0,
                            61.0,
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
                          "numinlets": 2,
                          "numoutlets": 2,
                          "outlettype": [
                            "",
                            ""
                          ],
                          "patching_rect": [
                            50.0,
                            182.0,
                            60.0,
                            19.0
                          ],
                          "text": "zl slice 32"
                        }
                      },
                      {
                        "box": {
                          "comment": "",
                          "id": "obj-2",
                          "maxclass": "outlet",
                          "numinlets": 1,
                          "numoutlets": 0,
                          "patching_rect": [
                            49.0,
                            296.0,
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
                            ""
                          ],
                          "patching_rect": [
                            50.0,
                            60.0,
                            25.0,
                            25.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-51",
                          "maxclass": "newobj",
                          "numinlets": 33,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            50.0,
                            138.0,
                            451.0,
                            19.0
                          ],
                          "text": "pak active 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-50",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 33,
                          "outlettype": [
                            "",
                            "",
                            "",
                            "",
                            "",
                            "",
                            "",
                            "",
                            "",
                            "",
                            "",
                            "",
                            "",
                            "",
                            "",
                            "",
                            "",
                            "",
                            "",
                            "",
                            "",
                            "",
                            "",
                            "",
                            "",
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
                            50.0,
                            93.0,
                            451.0,
                            19.0
                          ],
                          "text": "spray 33"
                        }
                      }
                    ],
                    "lines": [
                      {
                        "patchline": {
                          "destination": [
                            "obj-50",
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
                            "obj-2",
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
                            "obj-51",
                            0
                          ],
                          "hidden": 0,
                          "midpoints": [
                            538.5,
                            168.0,
                            36.0,
                            168.0,
                            36.0,
                            132.0,
                            59.5,
                            132.0
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
                            "obj-51",
                            32
                          ],
                          "hidden": 0,
                          "midpoints": [

                          ],
                          "source": [
                            "obj-50",
                            32
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-51",
                            31
                          ],
                          "hidden": 0,
                          "midpoints": [

                          ],
                          "source": [
                            "obj-50",
                            31
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-51",
                            30
                          ],
                          "hidden": 0,
                          "midpoints": [

                          ],
                          "source": [
                            "obj-50",
                            30
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-51",
                            29
                          ],
                          "hidden": 0,
                          "midpoints": [

                          ],
                          "source": [
                            "obj-50",
                            29
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-51",
                            28
                          ],
                          "hidden": 0,
                          "midpoints": [

                          ],
                          "source": [
                            "obj-50",
                            28
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-51",
                            27
                          ],
                          "hidden": 0,
                          "midpoints": [

                          ],
                          "source": [
                            "obj-50",
                            27
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-51",
                            26
                          ],
                          "hidden": 0,
                          "midpoints": [

                          ],
                          "source": [
                            "obj-50",
                            26
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-51",
                            25
                          ],
                          "hidden": 0,
                          "midpoints": [

                          ],
                          "source": [
                            "obj-50",
                            25
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-51",
                            24
                          ],
                          "hidden": 0,
                          "midpoints": [

                          ],
                          "source": [
                            "obj-50",
                            24
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-51",
                            23
                          ],
                          "hidden": 0,
                          "midpoints": [

                          ],
                          "source": [
                            "obj-50",
                            23
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-51",
                            22
                          ],
                          "hidden": 0,
                          "midpoints": [

                          ],
                          "source": [
                            "obj-50",
                            22
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-51",
                            21
                          ],
                          "hidden": 0,
                          "midpoints": [

                          ],
                          "source": [
                            "obj-50",
                            21
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-51",
                            20
                          ],
                          "hidden": 0,
                          "midpoints": [

                          ],
                          "source": [
                            "obj-50",
                            20
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-51",
                            19
                          ],
                          "hidden": 0,
                          "midpoints": [

                          ],
                          "source": [
                            "obj-50",
                            19
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-51",
                            18
                          ],
                          "hidden": 0,
                          "midpoints": [

                          ],
                          "source": [
                            "obj-50",
                            18
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-51",
                            17
                          ],
                          "hidden": 0,
                          "midpoints": [

                          ],
                          "source": [
                            "obj-50",
                            17
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-51",
                            16
                          ],
                          "hidden": 0,
                          "midpoints": [

                          ],
                          "source": [
                            "obj-50",
                            16
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-51",
                            15
                          ],
                          "hidden": 0,
                          "midpoints": [

                          ],
                          "source": [
                            "obj-50",
                            15
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-51",
                            14
                          ],
                          "hidden": 0,
                          "midpoints": [

                          ],
                          "source": [
                            "obj-50",
                            14
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-51",
                            13
                          ],
                          "hidden": 0,
                          "midpoints": [

                          ],
                          "source": [
                            "obj-50",
                            13
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-51",
                            12
                          ],
                          "hidden": 0,
                          "midpoints": [

                          ],
                          "source": [
                            "obj-50",
                            12
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-51",
                            11
                          ],
                          "hidden": 0,
                          "midpoints": [

                          ],
                          "source": [
                            "obj-50",
                            11
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-51",
                            10
                          ],
                          "hidden": 0,
                          "midpoints": [

                          ],
                          "source": [
                            "obj-50",
                            10
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-51",
                            9
                          ],
                          "hidden": 0,
                          "midpoints": [

                          ],
                          "source": [
                            "obj-50",
                            9
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-51",
                            8
                          ],
                          "hidden": 0,
                          "midpoints": [

                          ],
                          "source": [
                            "obj-50",
                            8
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-51",
                            7
                          ],
                          "hidden": 0,
                          "midpoints": [

                          ],
                          "source": [
                            "obj-50",
                            7
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-51",
                            6
                          ],
                          "hidden": 0,
                          "midpoints": [

                          ],
                          "source": [
                            "obj-50",
                            6
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-51",
                            5
                          ],
                          "hidden": 0,
                          "midpoints": [

                          ],
                          "source": [
                            "obj-50",
                            5
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-51",
                            4
                          ],
                          "hidden": 0,
                          "midpoints": [

                          ],
                          "source": [
                            "obj-50",
                            4
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-51",
                            3
                          ],
                          "hidden": 0,
                          "midpoints": [

                          ],
                          "source": [
                            "obj-50",
                            3
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-51",
                            2
                          ],
                          "hidden": 0,
                          "midpoints": [

                          ],
                          "source": [
                            "obj-50",
                            2
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-51",
                            1
                          ],
                          "hidden": 0,
                          "midpoints": [

                          ],
                          "source": [
                            "obj-50",
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
                          "hidden": 0,
                          "midpoints": [

                          ],
                          "source": [
                            "obj-51",
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
                          "hidden": 0,
                          "midpoints": [
                            18.5,
                            177.0,
                            100.5,
                            177.0
                          ],
                          "source": [
                            "obj-6",
                            0
                          ]
                        }
                      }
                    ]
                  },
                  "patching_rect": [
                    130.0,
                    240.0,
                    123.0,
                    19.0
                  ],
                  "saved_object_attributes": {
                    "fontface": 0,
                    "fontsize": 12.0,
                    "default_fontname": "Arial",
                    "default_fontsize": 12.0,
                    "fontname": "Arial",
                    "default_fontface": 0,
                    "globalpatchername": ""
                  },
                  "text": "p createMuteMessgage"
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
                  "id": "obj-19",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    70.0,
                    30.0,
                    77.0,
                    19.0
                  ],
                  "text": "numSources"
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
                  "id": "obj-18",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    210.0,
                    30.0,
                    150.0,
                    19.0
                  ],
                  "text": "OSC messages"
                }
              },
              {
                "box": {
                  "comment": "",
                  "id": "obj-16",
                  "maxclass": "inlet",
                  "numinlets": 0,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    40.0,
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
                  "frgb": [
                    0.0,
                    0.0,
                    0.0,
                    1.0
                  ],
                  "id": "obj-11",
                  "linecount": 2,
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    660.0,
                    130.0,
                    150.0,
                    31.0
                  ],
                  "text": "TODO:\n/souce/gain"
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
                    "float",
                    ""
                  ],
                  "patcher": {
                    "fileversion": 1,
                    "rect": [
                      27.0,
                      97.0,
                      586.0,
                      451.0
                    ],
                    "bglocked": 0,
                    "defrect": [
                      27.0,
                      97.0,
                      586.0,
                      451.0
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
                            40.0,
                            142.0,
                            434.0,
                            19.0
                          ],
                          "text": "This subpatch is a distance translator from Jamoma to ambiencode~."
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
                          "linecount": 3,
                          "maxclass": "comment",
                          "numinlets": 1,
                          "numoutlets": 0,
                          "patching_rect": [
                            40.0,
                            99.0,
                            406.0,
                            43.0
                          ],
                          "text": "In the jamoma module/algorithm, distance is measured in meters. The size of the center circle where spatialisation starts collapsing, approaching an omni signal, is defined as /center_distance."
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-3",
                          "maxclass": "newobj",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            "float"
                          ],
                          "patching_rect": [
                            70.0,
                            290.0,
                            32.0,
                            19.0
                          ],
                          "text": "* 1."
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
                            155.0,
                            320.0,
                            56.0,
                            19.0
                          ],
                          "text": "zl join"
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
                            "float"
                          ],
                          "patching_rect": [
                            195.0,
                            290.0,
                            32.0,
                            19.0
                          ],
                          "text": "* 1."
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-6",
                          "maxclass": "newobj",
                          "numinlets": 2,
                          "numoutlets": 2,
                          "outlettype": [
                            "",
                            ""
                          ],
                          "patching_rect": [
                            155.0,
                            260.0,
                            57.0,
                            19.0
                          ],
                          "text": "zl slice 3"
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
                            "float"
                          ],
                          "patching_rect": [
                            260.0,
                            250.0,
                            34.0,
                            19.0
                          ],
                          "text": "!/ 1."
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-8",
                          "maxclass": "newobj",
                          "numinlets": 2,
                          "numoutlets": 2,
                          "outlettype": [
                            "float",
                            "int"
                          ],
                          "patching_rect": [
                            260.0,
                            210.0,
                            85.0,
                            19.0
                          ],
                          "text": "maximum 0.01"
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
                            "float"
                          ],
                          "patching_rect": [
                            260.0,
                            175.0,
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
                            "float"
                          ],
                          "patching_rect": [
                            70.0,
                            175.0,
                            25.0,
                            25.0
                          ]
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
                            155.0,
                            175.0,
                            25.0,
                            25.0
                          ]
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
                            70.0,
                            355.0,
                            25.0,
                            25.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "comment": "",
                          "id": "obj-13",
                          "maxclass": "outlet",
                          "numinlets": 1,
                          "numoutlets": 0,
                          "patching_rect": [
                            155.0,
                            355.0,
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
                          "id": "obj-14",
                          "maxclass": "comment",
                          "numinlets": 1,
                          "numoutlets": 0,
                          "patching_rect": [
                            40.0,
                            48.0,
                            447.0,
                            19.0
                          ],
                          "text": "Distance is interpreted differently in ambiencode~ and this jamoma module/algorithm."
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
                          "id": "obj-15",
                          "linecount": 2,
                          "maxclass": "comment",
                          "numinlets": 1,
                          "numoutlets": 0,
                          "patching_rect": [
                            40.0,
                            67.0,
                            439.0,
                            31.0
                          ],
                          "text": "In ambiencode~ (distance < 1) is the circle where spatial encoding starts collapsing, instead approaching a omni signal as distance approach zero."
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
                            "obj-12",
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
                            "obj-4",
                            1
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
                            "obj-4",
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
                            "obj-7",
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
                          "hidden": 0,
                          "midpoints": [
                            269.5,
                            241.0,
                            92.5,
                            241.0
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
                    265.0,
                    330.0,
                    179.0,
                    19.0
                  ],
                  "saved_object_attributes": {
                    "fontface": 0,
                    "fontsize": 12.0,
                    "default_fontname": "Arial",
                    "default_fontsize": 12.0,
                    "fontname": "Arial",
                    "default_fontface": 0,
                    "globalpatchername": ""
                  },
                  "text": "p distanceTranslator"
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
                    "bang",
                    "float"
                  ],
                  "patching_rect": [
                    435.0,
                    130.0,
                    29.0,
                    19.0
                  ],
                  "text": "t b f"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-3",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    425.0,
                    370.0,
                    73.0,
                    19.0
                  ],
                  "text": "prepend aed"
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
                    265.0,
                    240.0,
                    27.0,
                    19.0
                  ],
                  "text": "f"
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
                    265.0,
                    370.0,
                    91.0,
                    19.0
                  ],
                  "text": "prepend db_unit"
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
                    "bang",
                    "dump"
                  ],
                  "patching_rect": [
                    485.0,
                    160.0,
                    54.0,
                    19.0
                  ],
                  "text": "t b dump"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-8",
                  "maxclass": "newobj",
                  "numinlets": 0,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    485.0,
                    125.0,
                    63.0,
                    19.0
                  ],
                  "text": "r #0_reset"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-10",
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
                    365.0,
                    240.0,
                    56.0,
                    19.0
                  ],
                  "saved_object_attributes": {
                    "embed": 0
                  },
                  "text": "coll"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-12",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 5,
                  "outlettype": [
                    "",
                    "",
                    "",
                    "",
                    ""
                  ],
                  "patching_rect": [
                    180.0,
                    80.0,
                    360.0,
                    19.0
                  ],
                  "text": "j.oscroute /source/active /DropOff /source/position /centerRadius"
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
                    180.0,
                    30.0,
                    25.0,
                    25.0
                  ]
                }
              },
              {
                "box": {
                  "comment": "",
                  "id": "obj-14",
                  "maxclass": "outlet",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    130.0,
                    435.0,
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
                  "id": "obj-15",
                  "linecount": 6,
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    660.0,
                    40.0,
                    190.0,
                    79.0
                  ],
                  "text": "If /order or /numSources has caused ambiencode~ to be recreated, all values have to be resent when audio start to recreate current state. The same holds true if the center_radius is changed."
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
                    "obj-5",
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
                    "obj-17",
                    0
                  ],
                  "hidden": 0,
                  "midpoints": [

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
                    "obj-20",
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
                    "obj-2",
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
                    "obj-21",
                    0
                  ],
                  "hidden": 0,
                  "midpoints": [
                    530.5,
                    108.0,
                    634.5,
                    108.0
                  ],
                  "source": [
                    "obj-12",
                    4
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
                    "obj-12",
                    2
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
                    "obj-12",
                    1
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-52",
                    1
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
                    "obj-12",
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
                    "obj-52",
                    0
                  ],
                  "hidden": 0,
                  "midpoints": [
                    49.5,
                    207.0,
                    139.5,
                    207.0
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
                    "obj-6",
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
                    "obj-1",
                    2
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
                    "obj-7",
                    0
                  ],
                  "hidden": 0,
                  "midpoints": [
                    444.5,
                    157.0,
                    494.5,
                    157.0
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
                    "obj-6",
                    1
                  ],
                  "hidden": 0,
                  "midpoints": [

                  ],
                  "source": [
                    "obj-20",
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
                    "obj-20",
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
                    634.5,
                    417.0,
                    139.5,
                    417.0
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
                    "obj-10",
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
                    "obj-1",
                    1
                  ],
                  "hidden": 0,
                  "midpoints": [

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
                    "obj-10",
                    0
                  ],
                  "hidden": 0,
                  "midpoints": [

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
                    "obj-14",
                    0
                  ],
                  "hidden": 0,
                  "midpoints": [
                    434.5,
                    417.0,
                    139.5,
                    417.0
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
                    "obj-14",
                    0
                  ],
                  "hidden": 0,
                  "midpoints": [
                    274.5,
                    417.0,
                    139.5,
                    417.0
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
                    "obj-14",
                    0
                  ],
                  "hidden": 0,
                  "midpoints": [

                  ],
                  "source": [
                    "obj-52",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-1",
                    1
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
                    "obj-10",
                    0
                  ],
                  "hidden": 0,
                  "midpoints": [
                    529.5,
                    239.0,
                    374.5,
                    239.0
                  ],
                  "source": [
                    "obj-7",
                    1
                  ]
                }
              },
              {
                "patchline": {
                  "color": [
                    1.0,
                    0.337255,
                    0.619608,
                    1.0
                  ],
                  "destination": [
                    "obj-4",
                    0
                  ],
                  "hidden": 0,
                  "midpoints": [
                    494.5,
                    188.0,
                    274.5,
                    188.0
                  ],
                  "source": [
                    "obj-7",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "color": [
                    1.0,
                    0.337255,
                    0.619608,
                    1.0
                  ],
                  "destination": [
                    "obj-52",
                    2
                  ],
                  "hidden": 0,
                  "midpoints": [
                    494.5,
                    188.0,
                    243.5,
                    188.0
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
              }
            ]
          },
          "patching_rect": [
            136.0,
            62.0,
            89.0,
            19.0
          ],
          "saved_object_attributes": {
            "fontface": 0,
            "fontsize": 12.0,
            "default_fontname": "Arial",
            "default_fontsize": 12.0,
            "fontname": "Arial",
            "default_fontface": 0,
            "globalpatchername": ""
          },
          "text": "p old-messages"
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
            28.0,
            16.0,
            25.0,
            25.0
          ]
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
            27.0,
            160.0,
            68.0,
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
          "comment": "",
          "id": "obj-7",
          "maxclass": "outlet",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            252.0,
            416.0,
            25.0,
            25.0
          ],
          "varname": "out[1]"
        }
      },
      {
        "box": {
          "comment": "W - omni",
          "id": "obj-8",
          "maxclass": "inlet",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            250.0,
            20.0,
            23.0,
            23.0
          ],
          "varname": "in[1]"
        }
      },
      {
        "box": {
          "fontname": "Geneva",
          "fontsize": 9.0,
          "id": "obj-120",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            252.0,
            230.0,
            36.0,
            19.0
          ],
          "text": "pass~",
          "varname": "pass[0]"
        }
      },
      {
        "box": {
          "fontname": "Geneva",
          "fontsize": 9.0,
          "id": "obj-121",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            290.0,
            230.0,
            36.0,
            19.0
          ],
          "text": "pass~",
          "varname": "pass[1]"
        }
      },
      {
        "box": {
          "fontname": "Geneva",
          "fontsize": 9.0,
          "id": "obj-122",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            328.0,
            230.0,
            36.0,
            19.0
          ],
          "text": "pass~",
          "varname": "pass[2]"
        }
      },
      {
        "box": {
          "fontname": "Geneva",
          "fontsize": 9.0,
          "id": "obj-123",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            366.0,
            230.0,
            36.0,
            19.0
          ],
          "text": "pass~",
          "varname": "pass[3]"
        }
      },
      {
        "box": {
          "fontname": "Geneva",
          "fontsize": 9.0,
          "id": "obj-124",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            404.0,
            230.0,
            36.0,
            19.0
          ],
          "text": "pass~",
          "varname": "pass[4]"
        }
      },
      {
        "box": {
          "fontname": "Geneva",
          "fontsize": 9.0,
          "id": "obj-125",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            442.0,
            230.0,
            36.0,
            19.0
          ],
          "text": "pass~",
          "varname": "pass[5]"
        }
      },
      {
        "box": {
          "fontname": "Geneva",
          "fontsize": 9.0,
          "id": "obj-126",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            480.0,
            230.0,
            36.0,
            19.0
          ],
          "text": "pass~",
          "varname": "pass[6]"
        }
      },
      {
        "box": {
          "fontname": "Geneva",
          "fontsize": 9.0,
          "id": "obj-127",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            518.0,
            230.0,
            36.0,
            19.0
          ],
          "text": "pass~",
          "varname": "pass[7]"
        }
      },
      {
        "box": {
          "fontname": "Geneva",
          "fontsize": 9.0,
          "id": "obj-128",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            556.0,
            230.0,
            36.0,
            19.0
          ],
          "text": "pass~",
          "varname": "pass[8]"
        }
      },
      {
        "box": {
          "fontname": "Geneva",
          "fontsize": 9.0,
          "id": "obj-129",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            594.0,
            230.0,
            36.0,
            19.0
          ],
          "text": "pass~",
          "varname": "pass[9]"
        }
      },
      {
        "box": {
          "fontname": "Geneva",
          "fontsize": 9.0,
          "id": "obj-130",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            632.0,
            230.0,
            36.0,
            19.0
          ],
          "text": "pass~",
          "varname": "pass[10]"
        }
      },
      {
        "box": {
          "fontname": "Geneva",
          "fontsize": 9.0,
          "id": "obj-131",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            670.0,
            230.0,
            36.0,
            19.0
          ],
          "text": "pass~",
          "varname": "pass[11]"
        }
      },
      {
        "box": {
          "fontname": "Geneva",
          "fontsize": 9.0,
          "id": "obj-132",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            708.0,
            230.0,
            36.0,
            19.0
          ],
          "text": "pass~",
          "varname": "pass[12]"
        }
      },
      {
        "box": {
          "fontname": "Geneva",
          "fontsize": 9.0,
          "id": "obj-133",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            746.0,
            230.0,
            36.0,
            19.0
          ],
          "text": "pass~",
          "varname": "pass[13]"
        }
      },
      {
        "box": {
          "fontname": "Geneva",
          "fontsize": 9.0,
          "id": "obj-134",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            784.0,
            230.0,
            36.0,
            19.0
          ],
          "text": "pass~",
          "varname": "pass[14]"
        }
      },
      {
        "box": {
          "fontname": "Geneva",
          "fontsize": 9.0,
          "id": "obj-135",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            822.0,
            230.0,
            36.0,
            19.0
          ],
          "text": "pass~",
          "varname": "pass[15]"
        }
      },
      {
        "box": {
          "fontname": "Geneva",
          "fontsize": 9.0,
          "id": "obj-136",
          "maxclass": "newobj",
          "numinlets": 8,
          "numoutlets": 16,
          "outlettype": [
            "signal",
            "signal",
            "signal",
            "signal",
            "signal",
            "signal",
            "signal",
            "signal",
            "signal",
            "signal",
            "signal",
            "signal",
            "signal",
            "signal",
            "signal",
            "signal"
          ],
          "patching_rect": [
            252.0,
            153.0,
            231.0,
            19.0
          ],
          "saved_object_attributes": {
            "aed_scale": 10.0,
            "type": 1,
            "center_curve": 0.2,
            "coord_angles": 0,
            "gain": 1.0,
            "coord_system": 0,
            "center_size": 1.0,
            "dist_att": 1.0,
            "interpolation": 1,
            "distance_mode": 1,
            "db_unit": 1.5,
            "xyz_scale": 1.0,
            "center_att_db": 6.0,
            "order": 3,
            "active": [
              1,
              1,
              1,
              1,
              1,
              1,
              1,
              1
            ]
          },
          "text": "ambiencode~ 3 8 @coord_system 0 @xyz_scale 1",
          "varname": "encode"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
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
            602.0,
            26.0,
            403.0,
            31.0
          ],
          "text": "j.parameter flavor @repetitions/filter 1 @type string @description \"Ambisonics type of decoding and encoding. Furse-Malham, N3D or SN3D\"",
          "varname": "destination/voices[5]"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-1037",
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
            600.0,
            106.0,
            442.0,
            31.0
          ],
          "text": "j.parameter order @repetitions/filter 1 @type integer @range 1 11 @clipmode both @description \"maximum ambisonics order for encoding\"",
          "varname": "destination/voices[2]"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-1009",
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
            536.0,
            507.0,
            517.0,
            31.0
          ],
          "text": "j.parameter interpolation @repetitions/filter 1 @type boolean @range 0 1 @clipmode both @description \"switch blockwise interpolation of all coefficient changes on/off\"",
          "varname": "destination/dimensions[1]"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-1002",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            297.0,
            285.0,
            58.0,
            19.0
          ],
          "text": "j.in 0"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-1069",
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
            279.0,
            574.0,
            31.0
          ],
          "text": "j.parameter numSources @repetitions/filter 1 @type integer @range 1 32 @clipmode both @description \"Number of incomming mono sources to pan.\" @priority 1",
          "varname": "source/voices"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-1048",
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
            536.0,
            610.0,
            495.0,
            43.0
          ],
          "text": "j.parameter center/decay @repetitions/filter 1 @type decimal @range 0 60 @clipmode low @description \"max. attenuation inside the center area in dB\" @dataspace gain @unit dB",
          "varname": "destination/voices[4]"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-1046",
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
            536.0,
            574.0,
            497.0,
            31.0
          ],
          "text": "j.parameter center/curve @repetitions/filter 1 @type decimal @range 0 1 @clipmode both @description \"curvature of the distance function inside the center area\"",
          "varname": "destination/voices[3]"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
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
            536.0,
            541.0,
            458.0,
            31.0
          ],
          "text": "j.parameter center/size @repetitions/filter 1 @type decimal @range 0 128 @clipmode both @description \"Size of the center (in model units)\"",
          "varname": "destination/voices[1]"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-1003",
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
            536.0,
            471.0,
            408.0,
            31.0
          ],
          "text": "j.message report @repetitions/filter 0 @type generic @description \"reports the state of the ambiencode external in the max window\""
        }
      }
    ],
    "lines": [
      {
        "patchline": {
          "destination": [
            "obj-136",
            7
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-1",
            7
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-136",
            6
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-1",
            6
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-136",
            5
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-1",
            5
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-136",
            4
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-1",
            4
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-136",
            3
          ],
          "hidden": 0,
          "midpoints": [

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
            "obj-136",
            2
          ],
          "hidden": 0,
          "midpoints": [

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
            "obj-136",
            1
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
            "obj-136",
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
            "obj-2",
            0
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-120",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-2",
            1
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-121",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-2",
            2
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-122",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-2",
            3
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-123",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-2",
            4
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-124",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-2",
            5
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-125",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-2",
            6
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-126",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-2",
            7
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-127",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-2",
            8
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-128",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-2",
            9
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-129",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-2",
            10
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-130",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-2",
            11
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-131",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-2",
            12
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-132",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-2",
            13
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-133",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-2",
            14
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-134",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-2",
            15
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-135",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-120",
            0
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-136",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-121",
            0
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-136",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-122",
            0
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-136",
            2
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-123",
            0
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-136",
            3
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-124",
            0
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-136",
            4
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-125",
            0
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-136",
            5
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-126",
            0
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-136",
            6
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-127",
            0
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-136",
            7
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-128",
            0
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-136",
            8
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-129",
            0
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-136",
            9
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-130",
            0
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-136",
            10
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-131",
            0
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-136",
            11
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-132",
            0
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-136",
            12
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-133",
            0
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-136",
            13
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-134",
            0
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-136",
            14
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-135",
            0
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-136",
            15
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
            "obj-17",
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
            "obj-17",
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
            "obj-2",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-136",
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
            "obj-17",
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
            "obj-38",
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
            "obj-1",
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
      }
    ]
  }
}