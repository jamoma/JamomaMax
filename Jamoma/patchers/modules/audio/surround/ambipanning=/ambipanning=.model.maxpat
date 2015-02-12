{
  "patcher": {
    "fileversion": 1,
    "rect": [
      228.0,
      58.0,
      1052.0,
      688.0
    ],
    "bglocked": 0,
    "defrect": [
      228.0,
      58.0,
      1052.0,
      688.0
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
          "id": "obj-11",
          "maxclass": "outlet",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            40.0,
            605.0,
            24.0,
            24.0
          ],
          "varname": "out[2]"
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
            40.0,
            80.0,
            32.5,
            19.0
          ],
          "text": "t l l"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-2",
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
            275.0,
            95.0,
            451.0,
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
          "id": "obj-3",
          "maxclass": "newobj",
          "numinlets": 32,
          "numoutlets": 2,
          "outlettype": [
            "audio.connect",
            ""
          ],
          "patching_rect": [
            275.0,
            575.0,
            437.5,
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
          "id": "obj-4",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patcher": {
            "fileversion": 1,
            "rect": [
              298.0,
              257.0,
              812.0,
              326.0
            ],
            "bglocked": 0,
            "defrect": [
              298.0,
              257.0,
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
                  "id": "obj-16",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    ""
                  ],
                  "patching_rect": [
                    702.0,
                    128.0,
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
                  "id": "obj-15",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    630.0,
                    157.0,
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
                    691.0,
                    52.0,
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
                    691.0,
                    77.0,
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
                    266.0,
                    128.0,
                    52.0,
                    19.0
                  ],
                  "saved_object_attributes": {
                    "globalpatchername": "",
                    "fontface": 0,
                    "fontsize": 12.0,
                    "default_fontface": 0,
                    "default_fontname": "Arial",
                    "fontname": "Arial",
                    "default_fontsize": 12.0
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
                  "numoutlets": 7,
                  "outlettype": [
                    "",
                    "",
                    "",
                    "",
                    "",
                    "",
                    ""
                  ],
                  "patching_rect": [
                    265.0,
                    105.0,
                    457.0,
                    19.0
                  ],
                  "text": "j.oscroute /center /numSpeakers /numSources /audio/gain /distModel /interpolation"
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
                      943.0,
                      726.0
                    ],
                    "bglocked": 0,
                    "defrect": [
                      0.0,
                      44.0,
                      943.0,
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
                            32.0,
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
                            32.0,
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
                                    64.0,
                                    17.0
                                  ],
                                  "text": "$1 0. 0. 0."
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
                            "globalpatchername": "",
                            "fontface": 0,
                            "fontsize": 12.0,
                            "default_fontface": 0,
                            "default_fontname": "Arial",
                            "fontname": "Arial",
                            "default_fontsize": 12.0
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
                            "globalpatchername": "",
                            "fontface": 0,
                            "fontsize": 12.0,
                            "default_fontface": 0,
                            "default_fontname": "Arial",
                            "fontname": "Arial",
                            "default_fontsize": 12.0
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
                            443.0,
                            431.0,
                            52.0,
                            19.0
                          ],
                          "text": "prepend"
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
                            468.0,
                            407.0,
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
                            "globalpatchername": "",
                            "fontface": 0,
                            "fontsize": 12.0,
                            "default_fontface": 0,
                            "default_fontname": "Arial",
                            "fontname": "Arial",
                            "default_fontsize": 12.0
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
                            826.0,
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
                            826.0,
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
                            722.0,
                            158.0,
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
                            826.0,
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
                            826.0,
                            25.0,
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
                            25.0,
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
                            32.0,
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
                            862.5,
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
                            153.5,
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
                            758.5,
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
                            758.5,
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
                            758.5,
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
                            758.5,
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
                    479.0,
                    19.0
                  ],
                  "saved_object_attributes": {
                    "globalpatchername": "",
                    "fontface": 0,
                    "fontsize": 12.0,
                    "default_fontface": 0,
                    "default_fontname": "Arial",
                    "fontname": "Arial",
                    "default_fontsize": 12.0
                  },
                  "text": "p source"
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
                    ""
                  ],
                  "patcher": {
                    "fileversion": 1,
                    "rect": [
                      19.0,
                      44.0,
                      847.0,
                      714.0
                    ],
                    "bglocked": 0,
                    "defrect": [
                      19.0,
                      44.0,
                      847.0,
                      714.0
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
                          "id": "obj-8",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 3,
                          "outlettype": [
                            "",
                            "",
                            ""
                          ],
                          "patching_rect": [
                            283.0,
                            65.0,
                            327.0,
                            19.0
                          ],
                          "text": "j.oscroute /position /active"
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
                                  "text": "pak active_out 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1"
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
                            460.0,
                            389.0,
                            125.0,
                            19.0
                          ],
                          "saved_object_attributes": {
                            "globalpatchername": "",
                            "fontface": 0,
                            "fontsize": 12.0,
                            "default_fontface": 0,
                            "default_fontname": "Arial",
                            "fontname": "Arial",
                            "default_fontsize": 12.0
                          },
                          "text": "p createMuteMessgage"
                        }
                      },
                      {
                        "box": {
                          "id": "obj-40",
                          "maxclass": "button",
                          "numinlets": 1,
                          "numoutlets": 1,
                          "outlettype": [
                            "bang"
                          ],
                          "patching_rect": [
                            326.0,
                            171.0,
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
                            368.0,
                            250.0,
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
                            335.0,
                            226.0,
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
                            336.0,
                            203.0,
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
                          "id": "obj-32",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            283.0,
                            388.0,
                            115.0,
                            19.0
                          ],
                          "text": "prepend speaker xyz"
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
                            321.0,
                            314.0,
                            88.0,
                            17.0
                          ],
                          "text": "$1 $1 $2 $3 $4"
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
                            605.0,
                            292.0,
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
                          "frgb": [
                            0.0,
                            0.0,
                            0.0,
                            1.0
                          ],
                          "id": "obj-28",
                          "maxclass": "comment",
                          "numinlets": 1,
                          "numoutlets": 0,
                          "patching_rect": [
                            630.0,
                            10.0,
                            112.0,
                            19.0
                          ],
                          "text": "number of speakers"
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
                            630.0,
                            36.0,
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
                          "numinlets": 0,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            668.0,
                            248.0,
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
                          "id": "obj-15",
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
                            320.0,
                            355.0,
                            61.0,
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
                          "comment": "",
                          "id": "obj-21",
                          "maxclass": "inlet",
                          "numinlets": 0,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            283.0,
                            36.0,
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
                            278.0,
                            621.0,
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
                          "id": "obj-23",
                          "linecount": 3,
                          "maxclass": "comment",
                          "numinlets": 1,
                          "numoutlets": 0,
                          "patching_rect": [
                            70.0,
                            15.0,
                            215.0,
                            43.0
                          ],
                          "text": "Speaker setup is always refreshed when audio is started, in case number of voices in or out has been changed."
                        }
                      }
                    ],
                    "lines": [
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
                            "obj-52",
                            2
                          ],
                          "hidden": 0,
                          "midpoints": [
                            677.5,
                            372.5,
                            575.5,
                            372.5
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
                            "obj-15",
                            0
                          ],
                          "hidden": 0,
                          "midpoints": [
                            641.5,
                            350.5,
                            329.5,
                            350.5
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
                            "obj-15",
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
                            "obj-22",
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
                            "obj-15",
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
                            "obj-36",
                            0
                          ],
                          "hidden": 0,
                          "midpoints": [

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
                            "obj-26",
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
                            "obj-52",
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
                            "obj-22",
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
                            "obj-31",
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
                            "obj-32",
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
                            "obj-52",
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
                      }
                    ]
                  },
                  "patching_rect": [
                    101.0,
                    175.0,
                    256.0,
                    19.0
                  ],
                  "saved_object_attributes": {
                    "globalpatchername": "",
                    "fontface": 0,
                    "fontsize": 12.0,
                    "default_fontface": 0,
                    "default_fontname": "Arial",
                    "fontname": "Arial",
                    "default_fontsize": 12.0
                  },
                  "text": "p loudspeaker"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-3",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 3,
                  "outlettype": [
                    "",
                    "",
                    ""
                  ],
                  "patching_rect": [
                    25.0,
                    145.0,
                    170.0,
                    19.0
                  ],
                  "text": "j.oscroute /source /speaker"
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
                    256.0,
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
                    3
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
                    420.5,
                    205.0,
                    264.5,
                    205.0
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
                    "obj-15",
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
                    "obj-16",
                    0
                  ],
                  "hidden": 0,
                  "midpoints": [

                  ],
                  "source": [
                    "obj-12",
                    6
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
                    347.5,
                    170.0,
                    347.5,
                    170.0
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
                    "obj-5",
                    0
                  ],
                  "hidden": 0,
                  "midpoints": [
                    639.5,
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
                    711.5,
                    244.5,
                    34.5,
                    244.5
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
                    "obj-2",
                    0
                  ],
                  "hidden": 0,
                  "midpoints": [
                    110.0,
                    172.0,
                    110.5,
                    172.0
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
            178.0,
            118.0,
            74.0,
            19.0
          ],
          "saved_object_attributes": {
            "globalpatchername": "",
            "fontface": 0,
            "fontsize": 12.0,
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
          "id": "obj-5",
          "maxclass": "inlet",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            40.0,
            45.0,
            24.0,
            24.0
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
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patcher": {
            "fileversion": 1,
            "rect": [
              174.0,
              194.0,
              1106.0,
              689.0
            ],
            "bglocked": 0,
            "defrect": [
              174.0,
              194.0,
              1106.0,
              689.0
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
                  "id": "obj-32",
                  "maxclass": "button",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "outlettype": [
                    "bang"
                  ],
                  "patching_rect": [
                    91.0,
                    229.0,
                    20.0,
                    20.0
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
                    "bang",
                    "bang"
                  ],
                  "patching_rect": [
                    33.0,
                    230.0,
                    54.0,
                    19.0
                  ],
                  "text": "onebang"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-24",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patcher": {
                    "fileversion": 1,
                    "rect": [
                      276.0,
                      55.0,
                      480.0,
                      420.0
                    ],
                    "bglocked": 0,
                    "defrect": [
                      276.0,
                      55.0,
                      480.0,
                      420.0
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
                          "id": "obj-51",
                          "maxclass": "newobj",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            "int"
                          ],
                          "patching_rect": [
                            320.0,
                            235.0,
                            41.0,
                            19.0
                          ],
                          "text": "+ 230"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-52",
                          "maxclass": "newobj",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            "int"
                          ],
                          "patching_rect": [
                            320.0,
                            210.0,
                            33.0,
                            19.0
                          ],
                          "text": "* 20"
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
                            "bang"
                          ],
                          "patching_rect": [
                            100.0,
                            285.0,
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
                          "id": "obj-36",
                          "maxclass": "newobj",
                          "numinlets": 6,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            100.0,
                            315.0,
                            232.0,
                            19.0
                          ],
                          "text": "pack script newdefault pass[0] 10 10 pass~"
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
                            100.0,
                            205.0,
                            62.0,
                            17.0
                          ],
                          "text": "pass[ $1 ]"
                        }
                      },
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
                            135.0,
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
                          "id": "obj-9",
                          "maxclass": "newobj",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            "int"
                          ],
                          "patching_rect": [
                            65.0,
                            95.0,
                            31.0,
                            19.0
                          ],
                          "text": "i"
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
                            "bang"
                          ],
                          "patching_rect": [
                            65.0,
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
                          "id": "obj-13",
                          "maxclass": "newobj",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            "int"
                          ],
                          "patching_rect": [
                            250.0,
                            235.0,
                            41.0,
                            19.0
                          ],
                          "text": "+ 275"
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
                            250.0,
                            210.0,
                            33.0,
                            19.0
                          ],
                          "text": "* 40"
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
                            100.0,
                            250.0,
                            118.0,
                            19.0
                          ],
                          "text": "tosymbol @separator"
                        }
                      },
                      {
                        "box": {
                          "comment": "",
                          "id": "obj-8",
                          "maxclass": "outlet",
                          "numinlets": 1,
                          "numoutlets": 0,
                          "patching_rect": [
                            100.0,
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
                            66.0,
                            145.0,
                            51.0,
                            19.0
                          ],
                          "text": "uzi 24 0"
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
                            "obj-36",
                            3
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
                            "obj-9",
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
                            "obj-4",
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
                            "obj-2",
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
                            "obj-2",
                            2
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
                            "obj-36",
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
                            "obj-38",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-36",
                            2
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
                            "obj-36",
                            4
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
                            "obj-51",
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
                            "obj-9",
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
                    525.0,
                    405.0,
                    81.0,
                    19.0
                  ],
                  "saved_object_attributes": {
                    "globalpatchername": "",
                    "fontface": 0,
                    "fontsize": 12.0,
                    "default_fontface": 0,
                    "default_fontname": "Arial",
                    "fontname": "Arial",
                    "default_fontsize": 12.0
                  },
                  "text": "p create_pass"
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
                    ""
                  ],
                  "patcher": {
                    "fileversion": 1,
                    "rect": [
                      93.0,
                      318.0,
                      300.0,
                      400.0
                    ],
                    "bglocked": 0,
                    "defrect": [
                      93.0,
                      318.0,
                      300.0,
                      400.0
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
                          "id": "obj-4",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 2,
                          "outlettype": [
                            "int",
                            "bang"
                          ],
                          "patching_rect": [
                            80.0,
                            93.0,
                            32.5,
                            19.0
                          ],
                          "text": "t i b"
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
                            102.0,
                            221.0,
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
                          "id": "obj-9",
                          "maxclass": "newobj",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            "int"
                          ],
                          "patching_rect": [
                            78.0,
                            70.0,
                            78.0,
                            19.0
                          ],
                          "text": "i"
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
                            "int"
                          ],
                          "patching_rect": [
                            133.0,
                            32.5,
                            26.0,
                            26.0
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
                          "numoutlets": 1,
                          "outlettype": [
                            "int"
                          ],
                          "patching_rect": [
                            77.0,
                            132.0,
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
                          "id": "obj-18",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            101.0,
                            272.0,
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
                          "id": "obj-15",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            100.0,
                            295.0,
                            117.0,
                            19.0
                          ],
                          "text": "prepend script delete"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-6",
                          "maxclass": "newobj",
                          "numinlets": 2,
                          "numoutlets": 3,
                          "outlettype": [
                            "bang",
                            "bang",
                            "int"
                          ],
                          "patching_rect": [
                            69.0,
                            180.0,
                            51.0,
                            19.0
                          ],
                          "text": "uzi 24 0"
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
                            102.0,
                            336.0,
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
                            "bang"
                          ],
                          "patching_rect": [
                            67.0,
                            34.5,
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
                            "obj-14",
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
                            "obj-18",
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
                            "obj-3",
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
                            "obj-4",
                            1
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-14",
                            1
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
                            "obj-18",
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
                            "obj-5",
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
                            "obj-4",
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
                    746.0,
                    402.0,
                    80.0,
                    19.0
                  ],
                  "saved_object_attributes": {
                    "globalpatchername": "",
                    "fontface": 0,
                    "fontsize": 12.0,
                    "default_fontface": 0,
                    "default_fontname": "Arial",
                    "fontname": "Arial",
                    "default_fontsize": 12.0
                  },
                  "text": "p delete_pass"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-1",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    34.0,
                    278.0,
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
                  "id": "obj-2",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    856.0,
                    399.0,
                    119.0,
                    17.0
                  ],
                  "text": "script delete ambipan"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-3",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 3,
                  "outlettype": [
                    "",
                    "",
                    ""
                  ],
                  "patching_rect": [
                    260.0,
                    70.0,
                    229.0,
                    19.0
                  ],
                  "text": "j.oscroute /numSources /numSpeakers"
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
                  "id": "obj-4",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    635.0,
                    310.0,
                    269.0,
                    19.0
                  ],
                  "text": "Changes can not take place while audio is running"
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
                  "id": "obj-5",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    505.0,
                    255.0,
                    402.0,
                    19.0
                  ],
                  "text": "Only apply script if either /source/voices or /destination/voices has changed"
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
                    240.0,
                    280.0,
                    71.0,
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
                  "numinlets": 4,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    240.0,
                    255.0,
                    197.0,
                    19.0
                  ],
                  "text": "if $i1 != $i3 || $i2 !=$i4 then $i1 $i2"
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
                    "bang",
                    "int"
                  ],
                  "patching_rect": [
                    360.0,
                    105.0,
                    34.0,
                    19.0
                  ],
                  "text": "t b i"
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
                      313.0,
                      297.0,
                      959.0,
                      421.0
                    ],
                    "bglocked": 0,
                    "defrect": [
                      313.0,
                      297.0,
                      959.0,
                      421.0
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
                          "id": "obj-8",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            305.0,
                            241.0,
                            57.0,
                            19.0
                          ],
                          "text": "append 0"
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
                            433.0,
                            273.0,
                            125.0,
                            19.0
                          ],
                          "text": "prepend script connect"
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
                            305.0,
                            218.0,
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
                            305.0,
                            170.0,
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
                          "id": "obj-3",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            654.0,
                            314.0,
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
                          "id": "obj-4",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            654.0,
                            254.0,
                            109.0,
                            19.0
                          ],
                          "text": "prepend set multiin"
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
                            305.0,
                            310.0,
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
                            305.0,
                            276.0,
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
                          "id": "obj-10",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            90.0,
                            245.0,
                            172.0,
                            19.0
                          ],
                          "text": "prepend script connect ambipan"
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
                          "id": "obj-9",
                          "linecount": 2,
                          "maxclass": "comment",
                          "numinlets": 1,
                          "numoutlets": 0,
                          "patching_rect": [
                            135.0,
                            115.0,
                            257.0,
                            31.0
                          ],
                          "text": "was: \nsprintf script connect matrix %ld multiin %ld"
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
                            120.0,
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
                          "id": "obj-2",
                          "maxclass": "newobj",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            "int"
                          ],
                          "patching_rect": [
                            50.0,
                            80.0,
                            31.0,
                            19.0
                          ],
                          "text": "i"
                        }
                      },
                      {
                        "box": {
                          "fontname": "Arial",
                          "fontsize": 12.0,
                          "id": "obj-5",
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
                            120.0,
                            58.0,
                            19.0
                          ],
                          "text": "uzi 0 0"
                        }
                      },
                      {
                        "box": {
                          "comment": "",
                          "id": "obj-6",
                          "maxclass": "inlet",
                          "numinlets": 0,
                          "numoutlets": 1,
                          "outlettype": [
                            "bang"
                          ],
                          "patching_rect": [
                            50.0,
                            30.0,
                            25.0,
                            25.0
                          ]
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
                            305.0,
                            345.0,
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
                            "obj-13",
                            0
                          ],
                          "hidden": 0,
                          "midpoints": [
                            99.5,
                            299.0,
                            314.5,
                            299.0
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
                            "obj-11",
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
                            "obj-12",
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
                            "obj-3",
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
                            "obj-10",
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
                            "obj-12",
                            0
                          ],
                          "hidden": 0,
                          "midpoints": [
                            98.5,
                            158.0,
                            314.5,
                            158.0
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
                            "obj-4",
                            0
                          ],
                          "hidden": 0,
                          "midpoints": [
                            98.5,
                            152.5,
                            663.5,
                            152.5
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
                            "obj-2",
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
                            "obj-15",
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
                    240.0,
                    405.0,
                    139.0,
                    19.0
                  ],
                  "saved_object_attributes": {
                    "globalpatchername": "",
                    "fontface": 0,
                    "fontsize": 12.0,
                    "default_fontface": 0,
                    "default_fontname": "Arial",
                    "fontname": "Arial",
                    "default_fontsize": 12.0
                  },
                  "text": "p connect_from_ambipan"
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
                  "patcher": {
                    "fileversion": 1,
                    "rect": [
                      19.0,
                      404.0,
                      734.0,
                      441.0
                    ],
                    "bglocked": 0,
                    "defrect": [
                      19.0,
                      404.0,
                      734.0,
                      441.0
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
                          "id": "obj-14",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            485.0,
                            260.0,
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
                          "id": "obj-10",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            485.0,
                            215.0,
                            117.0,
                            19.0
                          ],
                          "text": "prepend set ambipan"
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
                            295.0,
                            215.0,
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
                          "id": "obj-1",
                          "maxclass": "message",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            65.0,
                            215.0,
                            200.0,
                            17.0
                          ],
                          "text": "script connect messages 0 ambipan 0"
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
                            45.0,
                            120.0,
                            58.0,
                            19.0
                          ],
                          "text": "uzi 4 0"
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
                            45.0,
                            30.0,
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
                            65.0,
                            330.0,
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
                            "obj-6",
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
                            "obj-6",
                            0
                          ],
                          "hidden": 0,
                          "midpoints": [
                            494.5,
                            291.0,
                            74.5,
                            291.0
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
                            "obj-1",
                            0
                          ],
                          "hidden": 0,
                          "midpoints": [

                          ],
                          "source": [
                            "obj-4",
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
                            93.5,
                            192.0,
                            494.5,
                            192.0
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
                            "obj-9",
                            0
                          ],
                          "hidden": 0,
                          "midpoints": [
                            93.5,
                            192.0,
                            304.5,
                            192.0
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
                            "obj-4",
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
                            "obj-14",
                            0
                          ],
                          "hidden": 0,
                          "midpoints": [
                            304.5,
                            249.0,
                            494.5,
                            249.0
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
                    393.0,
                    405.0,
                    125.0,
                    19.0
                  ],
                  "saved_object_attributes": {
                    "globalpatchername": "",
                    "fontface": 0,
                    "fontsize": 12.0,
                    "default_fontface": 0,
                    "default_fontname": "Arial",
                    "fontname": "Arial",
                    "default_fontsize": 12.0
                  },
                  "text": "p connect_to_ambipan"
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
                  "patcher": {
                    "fileversion": 1,
                    "rect": [
                      44.0,
                      74.0,
                      650.0,
                      361.0
                    ],
                    "bglocked": 0,
                    "defrect": [
                      44.0,
                      74.0,
                      650.0,
                      361.0
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
                            405.0,
                            210.0,
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
                          "id": "obj-10",
                          "maxclass": "message",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            247.0,
                            37.0,
                            32.5,
                            17.0
                          ],
                          "text": "8"
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
                            492.0,
                            75.0,
                            32.5,
                            17.0
                          ],
                          "text": "3"
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
                            405.0,
                            125.0,
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
                          "id": "obj-6",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            405.0,
                            185.0,
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
                          "id": "obj-5",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            50.0,
                            90.0,
                            310.0,
                            19.0
                          ],
                          "text": "prepend script newdefault ambipan 275 200 ambipanning~"
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
                            405.0,
                            23.0,
                            24.0,
                            24.0
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
                            "int"
                          ],
                          "patching_rect": [
                            50.0,
                            23.0,
                            24.0,
                            24.0
                          ]
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
                            405.0,
                            240.0,
                            24.0,
                            24.0
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
                            59.5,
                            159.0,
                            414.5,
                            159.0
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
                            "obj-2",
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
                    648.0,
                    403.0,
                    88.0,
                    19.0
                  ],
                  "saved_object_attributes": {
                    "globalpatchername": "",
                    "fontface": 0,
                    "fontsize": 12.0,
                    "default_fontface": 0,
                    "default_fontname": "Arial",
                    "fontname": "Arial",
                    "default_fontsize": 12.0
                  },
                  "text": "p new_external"
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
                    "bang"
                  ],
                  "patching_rect": [
                    30.0,
                    35.0,
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
                  "id": "obj-13",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    "int"
                  ],
                  "patching_rect": [
                    90.0,
                    100.0,
                    41.0,
                    19.0
                  ],
                  "text": "== 0"
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
                    240.0,
                    555.0,
                    22.0,
                    22.0
                  ]
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-15",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 6,
                  "outlettype": [
                    "bang",
                    "int",
                    "bang",
                    "int",
                    "bang",
                    "bang"
                  ],
                  "patching_rect": [
                    240.0,
                    355.0,
                    633.5,
                    19.0
                  ],
                  "text": "t b i b i b b"
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
                    260.0,
                    30.0,
                    22.0,
                    22.0
                  ]
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
                    "int"
                  ],
                  "patching_rect": [
                    260.0,
                    155.0,
                    32.0,
                    19.0
                  ],
                  "text": "i 1"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-18",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    240.0,
                    185.0,
                    36.0,
                    19.0
                  ],
                  "text": "gate"
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
                    "bang",
                    "bang",
                    ""
                  ],
                  "patching_rect": [
                    30.0,
                    100.0,
                    50.0,
                    19.0
                  ],
                  "text": "sel 1 0"
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
                    "int",
                    "float",
                    "int",
                    "int"
                  ],
                  "patching_rect": [
                    30.0,
                    60.0,
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
                  "id": "obj-21",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    290.0,
                    30.0,
                    58.0,
                    19.0
                  ],
                  "text": "voices"
                }
              }
            ],
            "lines": [
              {
                "patchline": {
                  "destination": [
                    "obj-14",
                    0
                  ],
                  "hidden": 0,
                  "midpoints": [
                    402.5,
                    462.0,
                    249.5,
                    462.0
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
                    "obj-14",
                    0
                  ],
                  "hidden": 0,
                  "midpoints": [
                    657.5,
                    471.0,
                    249.5,
                    471.0
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
                    "obj-20",
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
                    "obj-18",
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
                    "obj-10",
                    0
                  ],
                  "hidden": 0,
                  "midpoints": [

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
                    "obj-11",
                    0
                  ],
                  "hidden": 0,
                  "midpoints": [

                  ],
                  "source": [
                    "obj-15",
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
                    "obj-15",
                    5
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
                    "obj-15",
                    4
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
                    "obj-15",
                    2
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
                    "obj-15",
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
                    "obj-16",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-18",
                    1
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
                    "obj-18",
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
                    55.0,
                    131.0,
                    269.5,
                    131.0
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
                    "obj-23",
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
                    "obj-14",
                    0
                  ],
                  "hidden": 0,
                  "midpoints": [
                    865.5,
                    502.0,
                    249.5,
                    502.0
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
                    "obj-13",
                    0
                  ],
                  "hidden": 0,
                  "midpoints": [
                    39.5,
                    92.0,
                    99.5,
                    92.0
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
                    "obj-14",
                    0
                  ],
                  "hidden": 0,
                  "midpoints": [
                    755.5,
                    496.5,
                    249.5,
                    496.5
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
                    "obj-14",
                    0
                  ],
                  "hidden": 0,
                  "midpoints": [
                    534.5,
                    467.0,
                    249.5,
                    467.0
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
                    "obj-17",
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
                    "obj-23",
                    1
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
                    "obj-11",
                    1
                  ],
                  "hidden": 0,
                  "midpoints": [
                    301.5,
                    337.0,
                    726.5,
                    337.0
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
                    "obj-15",
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
                    1
                  ],
                  "hidden": 0,
                  "midpoints": [
                    301.5,
                    337.0,
                    816.5,
                    337.0
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
                    "obj-24",
                    1
                  ],
                  "hidden": 0,
                  "midpoints": [
                    301.5,
                    337.5,
                    596.5,
                    337.5
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
                    "obj-7",
                    3
                  ],
                  "hidden": 0,
                  "midpoints": [
                    301.5,
                    307.0,
                    453.0,
                    307.0,
                    453.0,
                    245.0,
                    427.5,
                    245.0
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
                    "obj-7",
                    2
                  ],
                  "hidden": 0,
                  "midpoints": [
                    249.5,
                    311.0,
                    457.0,
                    311.0,
                    457.0,
                    242.0,
                    368.166656,
                    242.0
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
                    "obj-9",
                    1
                  ],
                  "hidden": 0,
                  "midpoints": [
                    301.5,
                    337.0,
                    369.5,
                    337.0
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
                    "obj-32",
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
                    "obj-17",
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
                    "obj-14",
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
            54.0,
            116.0,
            97.0,
            19.0
          ],
          "saved_object_attributes": {
            "globalpatchername": "",
            "fontface": 0,
            "fontsize": 12.0,
            "default_fontface": 0,
            "default_fontname": "Arial",
            "fontname": "Arial",
            "default_fontsize": 12.0
          },
          "text": "p scripting"
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
            54.0,
            146.0,
            76.0,
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
          "id": "obj-8",
          "maxclass": "outlet",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            275.0,
            605.0,
            24.0,
            24.0
          ],
          "varname": "out[1]"
        }
      },
      {
        "box": {
          "comment": "W - omni",
          "id": "obj-9",
          "maxclass": "inlet",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            275.0,
            50.0,
            24.0,
            24.0
          ],
          "varname": "in[1]"
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
            "signal"
          ],
          "patching_rect": [
            275.0,
            200.0,
            267.0,
            19.0
          ],
          "saved_object_attributes": {
            "order": 5.0,
            "xyz_scale": 1.0,
            "dist_att": 1.0,
            "gain": 1.0,
            "coord_angles": 0,
            "aed_scale": 10.0,
            "center_curve": 0.0,
            "db_unit": 1.5,
            "center_size": 0.0,
            "distance_mode": 1,
            "gainout": 0.0,
            "active": [
              1
            ],
            "center_att_db": 0.0,
            "interpolation": 0,
            "coord_system": 0,
            "active_out": [
              1
            ]
          },
          "text": "ambipanning~ 1 0 @coord_system 0 @xyz_scale 1",
          "varname": "ambipan"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
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
            457.0,
            276.0,
            432.0,
            31.0
          ],
          "text": "j.message report @repetitions/filter 0 @type none @description \"reports the state of the ambipanning external in the max window\""
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
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
            527.0,
            160.0,
            587.0,
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
          "id": "obj-1016",
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
            58.0,
            587.0,
            19.0
          ],
          "text": "j.message.array 32 speaker active @type boolean @description \"enables or disables a loudspeaker.\" @value 1"
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
            425.0,
            382.0,
            542.0,
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
            426.0,
            346.0,
            579.0,
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
          "id": "obj-1034",
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
            425.0,
            313.0,
            583.0,
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
          "id": "obj-1022",
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
            24.0,
            537.0,
            31.0
          ],
          "text": "j.message.array 32 speaker position @type array @dataspace position @unit xyz @description \"Position of the nth source.\""
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
            130.0,
            227.0,
            48.0,
            19.0
          ],
          "text": "j.in"
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
            477.0,
            125.0,
            580.0,
            31.0
          ],
          "text": "j.parameter numSpeakers @repetitions/filter 1 @type integer @range 2 32 @clipmode both @description \"Number of speakers that signals are distributed to.\" @priority 3",
          "varname": "destination/voices"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-1033",
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
          "text": "j.parameter numSources @repetitions/filter 1 @type integer @range 1 32 @clipmode both @description \"Number of incomming mono sources to pan.\" @priority 1",
          "varname": "source/voices"
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
            49.5,
            107.0,
            187.5,
            107.0
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
            "obj-1",
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
  }
}