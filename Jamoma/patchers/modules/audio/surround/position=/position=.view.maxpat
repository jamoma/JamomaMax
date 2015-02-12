{
  "patcher": {
    "fileversion": 1,
    "rect": [
      101.0,
      44.0,
      1375.0,
      760.0
    ],
    "bglocked": 0,
    "defrect": [
      101.0,
      44.0,
      1375.0,
      760.0
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
          "frgb": [
            0.0,
            0.0,
            0.0,
            1.0
          ],
          "id": "obj-16",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            181.0,
            8.0,
            150.0,
            19.0
          ],
          "presentation": 1,
          "presentation_rect": [
            191.0,
            1.0,
            42.0,
            19.0
          ],
          "text": "offset:"
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
          "patcher": {
            "fileversion": 1,
            "rect": [
              596.0,
              115.0,
              640.0,
              480.0
            ],
            "bglocked": 0,
            "defrect": [
              596.0,
              115.0,
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
              15.0,
              15.0
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
                      15.0,
                      15.0
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
                          "id": "obj-26",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            178.0,
                            129.0,
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
                          "id": "obj-27",
                          "maxclass": "message",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            178.0,
                            100.0,
                            93.0,
                            18.0
                          ],
                          "text": "source. $1 /blur"
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
                            50.0,
                            130.0,
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
                          "id": "obj-17",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            50.0,
                            101.0,
                            78.0,
                            20.0
                          ],
                          "text": "prepend blur"
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
                            51.0,
                            159.0,
                            146.0,
                            20.0
                          ],
                          "text": "pack s s"
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
                          "id": "obj-31",
                          "maxclass": "inlet",
                          "numinlets": 0,
                          "numoutlets": 1,
                          "outlettype": [
                            "int"
                          ],
                          "patching_rect": [
                            178.0,
                            40.0,
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
                            51.0,
                            239.0,
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
                            "obj-32",
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
                            "obj-18",
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
                            "obj-26",
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
                            "obj-17",
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
                            "obj-27",
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
                      }
                    ]
                  },
                  "patching_rect": [
                    250.0,
                    238.0,
                    41.0,
                    20.0
                  ],
                  "saved_object_attributes": {
                    "fontface": 0,
                    "fontsize": 12.0,
                    "default_fontface": 0,
                    "default_fontname": "Arial",
                    "fontname": "Arial",
                    "default_fontsize": 12.0,
                    "globalpatchername": ""
                  },
                  "text": "p blur"
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
                      15.0,
                      15.0
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
                          "id": "obj-26",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            178.0,
                            129.0,
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
                          "id": "obj-27",
                          "maxclass": "message",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            178.0,
                            100.0,
                            115.0,
                            18.0
                          ],
                          "text": "source. $1 /position"
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
                            50.0,
                            130.0,
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
                          "id": "obj-17",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            50.0,
                            101.0,
                            77.0,
                            20.0
                          ],
                          "text": "prepend pos"
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
                            51.0,
                            159.0,
                            146.0,
                            20.0
                          ],
                          "text": "pack s s"
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
                          "id": "obj-31",
                          "maxclass": "inlet",
                          "numinlets": 0,
                          "numoutlets": 1,
                          "outlettype": [
                            "int"
                          ],
                          "patching_rect": [
                            178.0,
                            40.0,
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
                            51.0,
                            239.0,
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
                            "obj-32",
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
                            "obj-18",
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
                            "obj-26",
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
                            "obj-17",
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
                            "obj-27",
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
                      }
                    ]
                  },
                  "patching_rect": [
                    338.0,
                    239.0,
                    65.0,
                    20.0
                  ],
                  "saved_object_attributes": {
                    "fontface": 0,
                    "fontsize": 12.0,
                    "default_fontface": 0,
                    "default_fontname": "Arial",
                    "fontname": "Arial",
                    "default_fontsize": 12.0,
                    "globalpatchername": ""
                  },
                  "text": "p position"
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
                    251.0,
                    273.0,
                    135.0,
                    18.0
                  ],
                  "text": "script send $1 name $2"
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
                      15.0,
                      15.0
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
                          "id": "obj-15",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            50.0,
                            129.0,
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
                          "id": "obj-14",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            50.0,
                            100.0,
                            107.0,
                            20.0
                          ],
                          "text": "prepend comment"
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
                            52.0,
                            186.0,
                            121.0,
                            18.0
                          ],
                          "text": "script send $1 set $2"
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
                            51.0,
                            158.0,
                            188.0,
                            20.0
                          ],
                          "text": "pack s 0"
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
                          "id": "obj-20",
                          "maxclass": "inlet",
                          "numinlets": 0,
                          "numoutlets": 1,
                          "outlettype": [
                            "int"
                          ],
                          "patching_rect": [
                            220.0,
                            40.0,
                            25.0,
                            25.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "comment": "",
                          "id": "obj-21",
                          "maxclass": "outlet",
                          "numinlets": 1,
                          "numoutlets": 0,
                          "patching_rect": [
                            52.0,
                            264.0,
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
                            "obj-11",
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
                            "obj-14",
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
                            "obj-11",
                            1
                          ],
                          "hidden": 0,
                          "midpoints": [

                          ],
                          "source": [
                            "obj-20",
                            0
                          ]
                        }
                      }
                    ]
                  },
                  "patching_rect": [
                    420.0,
                    239.0,
                    73.0,
                    20.0
                  ],
                  "saved_object_attributes": {
                    "fontface": 0,
                    "fontsize": 12.0,
                    "default_fontface": 0,
                    "default_fontname": "Arial",
                    "fontname": "Arial",
                    "default_fontsize": 12.0,
                    "globalpatchername": ""
                  },
                  "text": "p comment"
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
                    "int"
                  ],
                  "patching_rect": [
                    504.0,
                    176.0,
                    32.5,
                    20.0
                  ],
                  "text": "+ 0"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-4",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "bang",
                    "int"
                  ],
                  "patching_rect": [
                    304.0,
                    47.0,
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
                    307.0,
                    134.0,
                    46.0,
                    20.0
                  ],
                  "text": "uzi 8 1"
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
                    304.0,
                    16.0,
                    25.0,
                    25.0
                  ]
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
                    333.0,
                    404.0,
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
                    "obj-22",
                    1
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
                    "obj-33",
                    1
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
                    "obj-34",
                    1
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
                    "obj-1",
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
                    "obj-1",
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
                    343.5,
                    155.5,
                    513.5,
                    155.5
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
                    "obj-22",
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
                    "obj-33",
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
                    "obj-34",
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
                    "obj-25",
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
                    "obj-10",
                    1
                  ],
                  "hidden": 0,
                  "midpoints": [
                    327.0,
                    75.0,
                    527.0,
                    75.0
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
              }
            ]
          },
          "patching_rect": [
            480.0,
            656.0,
            48.0,
            19.0
          ],
          "saved_object_attributes": {
            "fontface": 0,
            "fontsize": 12.0,
            "default_fontface": 0,
            "default_fontname": "Arial",
            "fontname": "Arial",
            "default_fontsize": 12.0,
            "globalpatchername": ""
          },
          "text": "p offset"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-4",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            480.0,
            680.0,
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
          "id": "obj-3",
          "maxclass": "number",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "int",
            "bang"
          ],
          "patching_rect": [
            129.0,
            628.0,
            50.0,
            19.0
          ],
          "presentation": 1,
          "presentation_rect": [
            234.0,
            1.0,
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
            188.0,
            622.0,
            602.0,
            31.0
          ],
          "text": "j.remote offset"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-93",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            50.0,
            475.0,
            117.0,
            17.0
          ],
          "text": "/offset 8"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-91",
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
            1130.0,
            550.0,
            572.0,
            31.0
          ],
          "text": "j.remote source.8/blur",
          "varname": "blur8"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-92",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            1130.0,
            585.0,
            45.0,
            19.0
          ],
          "presentation": 1,
          "presentation_rect": [
            230.0,
            180.0,
            45.0,
            19.0
          ],
          "triscale": 0.9,
          "varname": "Z[15]"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-89",
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
            1130.0,
            475.0,
            572.0,
            31.0
          ],
          "text": "j.remote source.7/blur",
          "varname": "blur7"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-90",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            1130.0,
            510.0,
            45.0,
            19.0
          ],
          "presentation": 1,
          "presentation_rect": [
            230.0,
            160.0,
            45.0,
            19.0
          ],
          "triscale": 0.9,
          "varname": "Z[14]"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-87",
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
            1130.0,
            400.0,
            572.0,
            31.0
          ],
          "text": "j.remote source.6/blur",
          "varname": "blur6"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-88",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            1130.0,
            435.0,
            45.0,
            19.0
          ],
          "presentation": 1,
          "presentation_rect": [
            230.0,
            140.0,
            45.0,
            19.0
          ],
          "triscale": 0.9,
          "varname": "Z[13]"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-85",
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
            1130.0,
            325.0,
            572.0,
            31.0
          ],
          "text": "j.remote source.5/blur",
          "varname": "blur5"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-86",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            1130.0,
            360.0,
            45.0,
            19.0
          ],
          "presentation": 1,
          "presentation_rect": [
            230.0,
            120.0,
            45.0,
            19.0
          ],
          "triscale": 0.9,
          "varname": "Z[12]"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-83",
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
            1130.0,
            250.0,
            572.0,
            31.0
          ],
          "text": "j.remote source.4/blur",
          "varname": "blur4"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-84",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            1130.0,
            285.0,
            45.0,
            19.0
          ],
          "presentation": 1,
          "presentation_rect": [
            230.0,
            100.0,
            45.0,
            19.0
          ],
          "triscale": 0.9,
          "varname": "Z[11]"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-81",
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
            1130.0,
            175.0,
            572.0,
            31.0
          ],
          "text": "j.remote source.3/blur",
          "varname": "blur3"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-82",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            1130.0,
            210.0,
            45.0,
            19.0
          ],
          "presentation": 1,
          "presentation_rect": [
            230.0,
            80.0,
            45.0,
            19.0
          ],
          "triscale": 0.9,
          "varname": "Z[10]"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-79",
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
            1130.0,
            100.0,
            572.0,
            31.0
          ],
          "text": "j.remote source.2/blur",
          "varname": "blur2"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-80",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            1130.0,
            135.0,
            45.0,
            19.0
          ],
          "presentation": 1,
          "presentation_rect": [
            230.0,
            60.0,
            45.0,
            19.0
          ],
          "triscale": 0.9,
          "varname": "Z[9]"
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
          "id": "obj-78",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            235.0,
            20.0,
            30.0,
            19.0
          ],
          "presentation": 1,
          "presentation_rect": [
            235.0,
            20.0,
            30.0,
            19.0
          ],
          "text": "blur"
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
          "id": "obj-77",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            15.0,
            180.0,
            23.0,
            19.0
          ],
          "presentation": 1,
          "presentation_rect": [
            15.0,
            180.0,
            28.0,
            19.0
          ],
          "text": "16",
          "varname": "comment8"
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
          "id": "obj-76",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            15.0,
            160.0,
            23.0,
            19.0
          ],
          "presentation": 1,
          "presentation_rect": [
            15.0,
            160.0,
            28.0,
            19.0
          ],
          "text": "15",
          "varname": "comment7"
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
          "id": "obj-75",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            15.0,
            140.0,
            23.0,
            19.0
          ],
          "presentation": 1,
          "presentation_rect": [
            15.0,
            140.0,
            28.0,
            19.0
          ],
          "text": "14",
          "varname": "comment6"
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
          "id": "obj-74",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            15.0,
            120.0,
            23.0,
            19.0
          ],
          "presentation": 1,
          "presentation_rect": [
            15.0,
            120.0,
            28.0,
            19.0
          ],
          "text": "13",
          "varname": "comment5"
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
          "id": "obj-73",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            15.0,
            100.0,
            23.0,
            19.0
          ],
          "presentation": 1,
          "presentation_rect": [
            15.0,
            100.0,
            28.0,
            19.0
          ],
          "text": "12",
          "varname": "comment4"
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
          "id": "obj-72",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            15.0,
            80.0,
            23.0,
            19.0
          ],
          "presentation": 1,
          "presentation_rect": [
            15.0,
            80.0,
            28.0,
            19.0
          ],
          "text": "11",
          "varname": "comment3"
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
          "id": "obj-71",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            15.0,
            60.0,
            23.0,
            19.0
          ],
          "presentation": 1,
          "presentation_rect": [
            15.0,
            60.0,
            28.0,
            19.0
          ],
          "text": "10",
          "varname": "comment2"
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
          "id": "obj-70",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            15.0,
            40.0,
            23.0,
            19.0
          ],
          "presentation": 1,
          "presentation_rect": [
            15.0,
            40.0,
            28.0,
            19.0
          ],
          "text": "9",
          "varname": "comment1"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-65",
          "maxclass": "newobj",
          "numinlets": 11,
          "numoutlets": 11,
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
            ""
          ],
          "patching_rect": [
            350.0,
            550.0,
            154.0,
            19.0
          ],
          "text": "j.list2parameter 3"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-66",
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
            510.0,
            550.0,
            600.0,
            43.0
          ],
          "text": "j.remote source.8/position",
          "varname": "pos8"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-67",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            450.0,
            575.0,
            45.0,
            19.0
          ],
          "presentation": 1,
          "presentation_rect": [
            155.0,
            180.0,
            45.0,
            19.0
          ],
          "triscale": 0.9,
          "varname": "Z[8]"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-68",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            400.0,
            575.0,
            45.0,
            19.0
          ],
          "presentation": 1,
          "presentation_rect": [
            105.0,
            180.0,
            45.0,
            19.0
          ],
          "triscale": 0.9,
          "varname": "Y[7]"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-69",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            350.0,
            575.0,
            45.0,
            19.0
          ],
          "presentation": 1,
          "presentation_rect": [
            55.0,
            180.0,
            45.0,
            19.0
          ],
          "triscale": 0.9,
          "varname": "X[7]"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-60",
          "maxclass": "newobj",
          "numinlets": 11,
          "numoutlets": 11,
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
            ""
          ],
          "patching_rect": [
            350.0,
            475.0,
            154.0,
            19.0
          ],
          "text": "j.list2parameter 3"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-61",
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
            510.0,
            475.0,
            600.0,
            43.0
          ],
          "text": "j.remote source.7/position",
          "varname": "pos7"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-62",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            450.0,
            500.0,
            45.0,
            19.0
          ],
          "presentation": 1,
          "presentation_rect": [
            155.0,
            160.0,
            45.0,
            19.0
          ],
          "triscale": 0.9,
          "varname": "Z[7]"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-63",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            400.0,
            500.0,
            45.0,
            19.0
          ],
          "presentation": 1,
          "presentation_rect": [
            105.0,
            160.0,
            45.0,
            19.0
          ],
          "triscale": 0.9,
          "varname": "Y[6]"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-64",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            350.0,
            500.0,
            45.0,
            19.0
          ],
          "presentation": 1,
          "presentation_rect": [
            55.0,
            160.0,
            45.0,
            19.0
          ],
          "triscale": 0.9,
          "varname": "X[6]"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-55",
          "maxclass": "newobj",
          "numinlets": 11,
          "numoutlets": 11,
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
            ""
          ],
          "patching_rect": [
            350.0,
            400.0,
            154.0,
            19.0
          ],
          "text": "j.list2parameter 3"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-56",
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
            510.0,
            400.0,
            600.0,
            43.0
          ],
          "text": "j.remote source.6/position",
          "varname": "pos6"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-57",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            450.0,
            425.0,
            45.0,
            19.0
          ],
          "presentation": 1,
          "presentation_rect": [
            155.0,
            140.0,
            45.0,
            19.0
          ],
          "triscale": 0.9,
          "varname": "Z[6]"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-58",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            400.0,
            425.0,
            45.0,
            19.0
          ],
          "presentation": 1,
          "presentation_rect": [
            105.0,
            140.0,
            45.0,
            19.0
          ],
          "triscale": 0.9,
          "varname": "Y[5]"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-59",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            350.0,
            425.0,
            45.0,
            19.0
          ],
          "presentation": 1,
          "presentation_rect": [
            55.0,
            140.0,
            45.0,
            19.0
          ],
          "triscale": 0.9,
          "varname": "X[5]"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-50",
          "maxclass": "newobj",
          "numinlets": 11,
          "numoutlets": 11,
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
            ""
          ],
          "patching_rect": [
            350.0,
            325.0,
            154.0,
            19.0
          ],
          "text": "j.list2parameter 3"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-51",
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
            510.0,
            325.0,
            600.0,
            43.0
          ],
          "text": "j.remote source.5/position",
          "varname": "pos5"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-52",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            450.0,
            350.0,
            45.0,
            19.0
          ],
          "presentation": 1,
          "presentation_rect": [
            155.0,
            120.0,
            45.0,
            19.0
          ],
          "triscale": 0.9,
          "varname": "Z[5]"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-53",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            400.0,
            350.0,
            45.0,
            19.0
          ],
          "presentation": 1,
          "presentation_rect": [
            105.0,
            120.0,
            45.0,
            19.0
          ],
          "triscale": 0.9,
          "varname": "Y[4]"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-54",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            350.0,
            350.0,
            45.0,
            19.0
          ],
          "presentation": 1,
          "presentation_rect": [
            55.0,
            120.0,
            45.0,
            19.0
          ],
          "triscale": 0.9,
          "varname": "X[4]"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-45",
          "maxclass": "newobj",
          "numinlets": 11,
          "numoutlets": 11,
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
            ""
          ],
          "patching_rect": [
            350.0,
            250.0,
            154.0,
            19.0
          ],
          "text": "j.list2parameter 3"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-46",
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
            510.0,
            250.0,
            600.0,
            43.0
          ],
          "text": "j.remote source.4/position",
          "varname": "pos4"
        }
      },
      {
        "box": {
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
          "patching_rect": [
            450.0,
            275.0,
            45.0,
            19.0
          ],
          "presentation": 1,
          "presentation_rect": [
            155.0,
            100.0,
            45.0,
            19.0
          ],
          "triscale": 0.9,
          "varname": "Z[4]"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-48",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            400.0,
            275.0,
            45.0,
            19.0
          ],
          "presentation": 1,
          "presentation_rect": [
            105.0,
            100.0,
            45.0,
            19.0
          ],
          "triscale": 0.9,
          "varname": "Y[3]"
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
            350.0,
            275.0,
            45.0,
            19.0
          ],
          "presentation": 1,
          "presentation_rect": [
            55.0,
            100.0,
            45.0,
            19.0
          ],
          "triscale": 0.9,
          "varname": "X[3]"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-40",
          "maxclass": "newobj",
          "numinlets": 11,
          "numoutlets": 11,
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
            ""
          ],
          "patching_rect": [
            350.0,
            175.0,
            154.0,
            19.0
          ],
          "text": "j.list2parameter 3"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-41",
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
            510.0,
            175.0,
            600.0,
            43.0
          ],
          "text": "j.remote source.3/position",
          "varname": "pos3"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-42",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            450.0,
            200.0,
            45.0,
            19.0
          ],
          "presentation": 1,
          "presentation_rect": [
            155.0,
            80.0,
            45.0,
            19.0
          ],
          "triscale": 0.9,
          "varname": "Z[3]"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-43",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            400.0,
            200.0,
            45.0,
            19.0
          ],
          "presentation": 1,
          "presentation_rect": [
            105.0,
            80.0,
            45.0,
            19.0
          ],
          "triscale": 0.9,
          "varname": "Y[2]"
        }
      },
      {
        "box": {
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
          "patching_rect": [
            350.0,
            200.0,
            45.0,
            19.0
          ],
          "presentation": 1,
          "presentation_rect": [
            55.0,
            80.0,
            45.0,
            19.0
          ],
          "triscale": 0.9,
          "varname": "X[2]"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-35",
          "maxclass": "newobj",
          "numinlets": 11,
          "numoutlets": 11,
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
            ""
          ],
          "patching_rect": [
            350.0,
            100.0,
            154.0,
            19.0
          ],
          "text": "j.list2parameter 3"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "frozen_object_attributes": {
            "ramp/function": "linear"
          },
          "id": "obj-36",
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
            510.0,
            100.0,
            600.0,
            43.0
          ],
          "text": "j.remote source.2/position",
          "varname": "pos2"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-37",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            450.0,
            125.0,
            45.0,
            19.0
          ],
          "presentation": 1,
          "presentation_rect": [
            155.0,
            60.0,
            45.0,
            19.0
          ],
          "triscale": 0.9,
          "varname": "Z[2]"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-38",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            400.0,
            125.0,
            45.0,
            19.0
          ],
          "presentation": 1,
          "presentation_rect": [
            105.0,
            60.0,
            45.0,
            19.0
          ],
          "triscale": 0.9,
          "varname": "Y[1]"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-39",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            350.0,
            125.0,
            45.0,
            19.0
          ],
          "presentation": 1,
          "presentation_rect": [
            55.0,
            60.0,
            45.0,
            19.0
          ],
          "triscale": 0.9,
          "varname": "X[1]"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-34",
          "maxclass": "newobj",
          "numinlets": 11,
          "numoutlets": 11,
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
            ""
          ],
          "patching_rect": [
            350.0,
            25.0,
            154.0,
            19.0
          ],
          "text": "j.list2parameter 3"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-32",
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
            1130.0,
            25.0,
            572.0,
            31.0
          ],
          "text": "j.remote source.1/blur",
          "varname": "blur1"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-33",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            1130.0,
            60.0,
            45.0,
            19.0
          ],
          "presentation": 1,
          "presentation_rect": [
            230.0,
            40.0,
            45.0,
            19.0
          ],
          "triscale": 0.9,
          "varname": "Z[1]"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "frozen_object_attributes": {
            "ramp/function": "linear"
          },
          "id": "obj-6",
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
            510.0,
            25.0,
            600.0,
            43.0
          ],
          "text": "j.remote source.1/position",
          "varname": "pos1"
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
            165.0,
            20.0,
            18.0,
            19.0
          ],
          "presentation": 1,
          "presentation_rect": [
            165.0,
            20.0,
            18.0,
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
          "id": "obj-8",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            120.0,
            20.0,
            17.0,
            19.0
          ],
          "presentation": 1,
          "presentation_rect": [
            120.0,
            20.0,
            17.0,
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
          "id": "obj-9",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            70.0,
            20.0,
            17.0,
            19.0
          ],
          "presentation": 1,
          "presentation_rect": [
            70.0,
            20.0,
            17.0,
            19.0
          ],
          "text": "x"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-10",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            450.0,
            50.0,
            45.0,
            19.0
          ],
          "presentation": 1,
          "presentation_rect": [
            155.0,
            40.0,
            45.0,
            19.0
          ],
          "triscale": 0.9,
          "varname": "Z"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-11",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            400.0,
            50.0,
            45.0,
            19.0
          ],
          "presentation": 1,
          "presentation_rect": [
            105.0,
            40.0,
            45.0,
            19.0
          ],
          "triscale": 0.9,
          "varname": "Y"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-12",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            350.0,
            50.0,
            45.0,
            19.0
          ],
          "presentation": 1,
          "presentation_rect": [
            55.0,
            40.0,
            45.0,
            19.0
          ],
          "triscale": 0.9,
          "varname": "X"
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
            50.0,
            230.0,
            212.0,
            17.0
          ],
          "text": "/preset/store 1 default, /preset/write"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-15",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            55.0,
            410.0,
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
          "id": "obj-19",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            210.0,
            250.0,
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
          "id": "obj-20",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patcher": {
            "fileversion": 1,
            "rect": [
              585.0,
              154.0,
              549.0,
              562.0
            ],
            "bglocked": 0,
            "defrect": [
              585.0,
              154.0,
              549.0,
              562.0
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
                  "id": "obj-3",
                  "linecount": 2,
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    65.0,
                    165.0,
                    230.0,
                    31.0
                  ],
                  "text": "Everything is taken care of by the RampLib and DataspaceLib"
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
                  "linecount": 2,
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    65.0,
                    110.0,
                    230.0,
                    31.0
                  ],
                  "text": "This module is really just a wrapper for a bunch of j.parameters."
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
                    70.0,
                    244.0,
                    25.0,
                    25.0
                  ]
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
                    70.0,
                    45.0,
                    25.0,
                    25.0
                  ]
                }
              }
            ],
            "lines": [

            ]
          },
          "patching_rect": [
            55.0,
            440.0,
            100.0,
            19.0
          ],
          "saved_object_attributes": {
            "fontface": 0,
            "fontsize": 12.0,
            "default_fontface": 0,
            "default_fontname": "Arial",
            "fontname": "Arial",
            "default_fontsize": 12.0,
            "globalpatchername": ""
          },
          "text": "p jalg.sur.position"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-24",
          "linecount": 2,
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            15.0,
            285.0,
            227.0,
            31.0
          ],
          "text": "j.view",
          "varname": "j.hub"
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
            16.0,
            240.0,
            24.0,
            24.0
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
            16.0,
            466.0,
            24.0,
            24.0
          ]
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-30",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            65.0,
            250.0,
            139.0,
            17.0
          ],
          "text": "/documentation/generate"
        }
      },
      {
        "box": {
          "id": "obj-31",
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
            210.0
          ],
          "presentation": 1,
          "presentation_rect": [
            0.0,
            0.0,
            300.0,
            210.0
          ],
          "text": "/editing_this_module"
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
            "obj-1",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-34",
            2
          ],
          "hidden": 0,
          "midpoints": [
            459.5,
            83.0,
            325.0,
            83.0,
            325.0,
            14.0,
            386.5,
            14.0
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
            "obj-34",
            1
          ],
          "hidden": 0,
          "midpoints": [
            409.5,
            78.0,
            331.0,
            78.0,
            331.0,
            18.0,
            373.0,
            18.0
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
            "obj-34",
            0
          ],
          "hidden": 0,
          "midpoints": [
            359.5,
            73.0,
            336.0,
            73.0,
            336.0,
            21.0,
            359.5,
            21.0
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
            59.5,
            279.0,
            24.5,
            279.0
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
            "obj-24",
            0
          ],
          "hidden": 0,
          "midpoints": [
            219.5,
            279.0,
            24.5,
            279.0
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
            "obj-93",
            1
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
            "obj-24",
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
            "obj-24",
            0
          ],
          "hidden": 0,
          "midpoints": [
            74.5,
            279.0,
            24.5,
            279.0
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
            "obj-32",
            0
          ],
          "hidden": 0,
          "midpoints": [
            1139.5,
            79.0,
            1117.0,
            79.0,
            1117.0,
            22.0,
            1139.5,
            22.0
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
            "obj-10",
            0
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-34",
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
            "obj-34",
            1
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
            "obj-34",
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
            "obj-34",
            10
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
            10
          ]
        }
      },
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
            "obj-35",
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
            "obj-35",
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
            "obj-35",
            10
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
            "obj-35",
            2
          ],
          "hidden": 0,
          "midpoints": [
            459.5,
            158.0,
            325.0,
            89.0,
            386.5,
            89.0
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
            "obj-35",
            1
          ],
          "hidden": 0,
          "midpoints": [
            409.5,
            153.0,
            331.0,
            153.0,
            331.0,
            93.0,
            373.0,
            93.0
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
            "obj-35",
            0
          ],
          "hidden": 0,
          "midpoints": [
            359.5,
            148.0,
            336.0,
            148.0,
            336.0,
            96.0,
            359.5,
            96.0
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
            "obj-41",
            0
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-40",
            10
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
            "obj-40",
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
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-40",
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
            "obj-40",
            10
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-41",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-40",
            2
          ],
          "hidden": 0,
          "midpoints": [
            459.5,
            233.0,
            325.0,
            233.0,
            325.0,
            164.0,
            386.5,
            164.0
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
            "obj-40",
            1
          ],
          "hidden": 0,
          "midpoints": [
            409.5,
            228.0,
            331.0,
            228.0,
            331.0,
            168.0,
            373.0,
            168.0
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
            "obj-40",
            0
          ],
          "hidden": 0,
          "midpoints": [
            359.5,
            223.0,
            336.0,
            223.0,
            336.0,
            171.0,
            359.5,
            171.0
          ],
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
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-45",
            10
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-47",
            0
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-45",
            2
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
            "obj-45",
            1
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
            "obj-45",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-45",
            10
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
            "obj-45",
            2
          ],
          "hidden": 0,
          "midpoints": [
            459.5,
            308.0,
            325.0,
            308.0,
            325.0,
            239.0,
            386.5,
            239.0
          ],
          "source": [
            "obj-47",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-45",
            1
          ],
          "hidden": 0,
          "midpoints": [
            409.5,
            303.0,
            331.0,
            303.0,
            331.0,
            243.0,
            373.0,
            243.0
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
            "obj-45",
            0
          ],
          "hidden": 0,
          "midpoints": [
            359.5,
            298.0,
            336.0,
            298.0,
            336.0,
            246.0,
            359.5,
            246.0
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
            "obj-51",
            0
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
            "obj-52",
            0
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
            "obj-53",
            0
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
            "obj-54",
            0
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-50",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-50",
            10
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
            "obj-50",
            2
          ],
          "hidden": 0,
          "midpoints": [
            459.5,
            383.0,
            325.0,
            383.0,
            325.0,
            314.0,
            386.5,
            314.0
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
            "obj-50",
            1
          ],
          "hidden": 0,
          "midpoints": [
            409.5,
            378.0,
            331.0,
            378.0,
            331.0,
            318.0,
            373.0,
            318.0
          ],
          "source": [
            "obj-53",
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
          "hidden": 0,
          "midpoints": [
            359.5,
            353.0,
            336.0,
            353.0,
            336.0,
            321.0,
            359.5,
            321.0
          ],
          "source": [
            "obj-54",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-56",
            0
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-55",
            10
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-57",
            0
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-55",
            2
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-58",
            0
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-55",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-59",
            0
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-55",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-55",
            10
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-56",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-55",
            2
          ],
          "hidden": 0,
          "midpoints": [
            459.5,
            458.0,
            325.0,
            458.0,
            325.0,
            389.0,
            386.5,
            389.0
          ],
          "source": [
            "obj-57",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-55",
            1
          ],
          "hidden": 0,
          "midpoints": [
            409.5,
            453.0,
            331.0,
            453.0,
            331.0,
            393.0,
            373.0,
            393.0
          ],
          "source": [
            "obj-58",
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
          "hidden": 0,
          "midpoints": [
            359.5,
            448.0,
            336.0,
            448.0,
            336.0,
            396.0,
            359.5,
            396.0
          ],
          "source": [
            "obj-59",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-34",
            10
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
            "obj-61",
            0
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-60",
            10
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-62",
            0
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-60",
            2
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-63",
            0
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-60",
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
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-60",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-60",
            10
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-61",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-60",
            2
          ],
          "hidden": 0,
          "midpoints": [
            459.5,
            533.0,
            325.0,
            533.0,
            325.0,
            464.0,
            386.5,
            464.0
          ],
          "source": [
            "obj-62",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-60",
            1
          ],
          "hidden": 0,
          "midpoints": [
            409.5,
            528.0,
            331.0,
            528.0,
            331.0,
            468.0,
            373.0,
            468.0
          ],
          "source": [
            "obj-63",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-60",
            0
          ],
          "hidden": 0,
          "midpoints": [
            359.5,
            523.0,
            336.0,
            523.0,
            336.0,
            471.0,
            359.5,
            471.0
          ],
          "source": [
            "obj-64",
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
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-65",
            10
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-67",
            0
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-65",
            2
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-68",
            0
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-65",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-69",
            0
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-65",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-65",
            10
          ],
          "hidden": 0,
          "midpoints": [

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
            "obj-65",
            2
          ],
          "hidden": 0,
          "midpoints": [
            459.5,
            608.0,
            325.0,
            608.0,
            325.0,
            539.0,
            386.5,
            539.0
          ],
          "source": [
            "obj-67",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-65",
            1
          ],
          "hidden": 0,
          "midpoints": [
            409.5,
            603.0,
            331.0,
            603.0,
            331.0,
            543.0,
            373.0,
            543.0
          ],
          "source": [
            "obj-68",
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
          "hidden": 0,
          "midpoints": [
            359.5,
            598.0,
            336.0,
            598.0,
            336.0,
            546.0,
            359.5,
            546.0
          ],
          "source": [
            "obj-69",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-80",
            0
          ],
          "hidden": 0,
          "midpoints": [

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
            "obj-79",
            0
          ],
          "hidden": 0,
          "midpoints": [
            1139.5,
            154.0,
            1117.0,
            154.0,
            1117.0,
            97.0,
            1139.5,
            97.0
          ],
          "source": [
            "obj-80",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-82",
            0
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-81",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-81",
            0
          ],
          "hidden": 0,
          "midpoints": [
            1139.5,
            229.0,
            1117.0,
            229.0,
            1117.0,
            172.0,
            1139.5,
            172.0
          ],
          "source": [
            "obj-82",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-84",
            0
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-83",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-83",
            0
          ],
          "hidden": 0,
          "midpoints": [
            1139.5,
            304.0,
            1117.0,
            304.0,
            1117.0,
            247.0,
            1139.5,
            247.0
          ],
          "source": [
            "obj-84",
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
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-85",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-85",
            0
          ],
          "hidden": 0,
          "midpoints": [
            1139.5,
            379.0,
            1117.0,
            379.0,
            1117.0,
            322.0,
            1139.5,
            322.0
          ],
          "source": [
            "obj-86",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-88",
            0
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-87",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-87",
            0
          ],
          "hidden": 0,
          "midpoints": [
            1139.5,
            454.0,
            1117.0,
            454.0,
            1117.0,
            397.0,
            1139.5,
            397.0
          ],
          "source": [
            "obj-88",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-90",
            0
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-89",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-89",
            0
          ],
          "hidden": 0,
          "midpoints": [
            1139.5,
            529.0,
            1117.0,
            529.0,
            1117.0,
            472.0,
            1139.5,
            472.0
          ],
          "source": [
            "obj-90",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-92",
            0
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-91",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-91",
            0
          ],
          "hidden": 0,
          "midpoints": [
            1139.5,
            604.0,
            1117.0,
            604.0,
            1117.0,
            547.0,
            1139.5,
            547.0
          ],
          "source": [
            "obj-92",
            0
          ]
        }
      }
    ]
  }
}