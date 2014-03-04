{
  "patcher": {
    "fileversion": 1,
    "appversion": {
      "major": 6,
      "minor": 1,
      "revision": 7,
      "architecture": "x86"
    },
    "rect": [
      0.0,
      44.0,
      569.0,
      506.0
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
          "id": "obj-32",
          "maxclass": "newobj",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            341.0,
            241.0,
            182.0,
            20.0
          ],
          "text": "limiter.parametersAndMessages"
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
            "signal",
            "signal",
            ""
          ],
          "patching_rect": [
            191.0,
            345.0,
            123.0,
            20.0
          ],
          "text": "j.limiter~"
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
            1218,
            430.0,
            25.0,
            25.0
          ]
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-41",
          "linecount": 2,
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            18.0,
            79.0,
            150.0,
            33.0
          ],
          "text": "j.model @description \"A stereo limiter\"",
          "varname": "j.hub"
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
            "signal",
            ""
          ],
          "patching_rect": [
            243.0,
            405.0,
            50.0,
            20.0
          ],
          "text": "j.out~ 2"
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
            "signal",
            ""
          ],
          "patching_rect": [
            191.0,
            405.0,
            50.0,
            20.0
          ],
          "text": "j.out~ 1"
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
            "signal",
            ""
          ],
          "patching_rect": [
            295.0,
            79.0,
            66.0,
            20.0
          ],
          "text": "j.in~ 2"
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
            "signal",
            ""
          ],
          "patching_rect": [
            191.0,
            79.0,
            66.0,
            20.0
          ],
          "text": "j.in~ 1"
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
            191.0,
            25.0,
            25.0,
            25.0
          ]
        }
      },
      {
        "box": {
          "comment": "",
          "id": "obj-12",
          "maxclass": "inlet",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            295.0,
            25.0,
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
            191.0,
            436.0,
            25.0,
            25.0
          ]
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
            243.0,
            436.0,
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
            "obj-3",
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
            "obj-5",
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
            "obj-2",
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
            "obj-13",
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
            "obj-8",
            0
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
            "obj-15",
            0
          ],
          "disabled": 0,
          "hidden": 0,
          "source": [
            "obj-6",
            0
          ]
        }
      }
    ],
    "dependency_cache": [
      {
        "name": "limiter.parametersAndMessages.maxpat",
        "bootpath": "/Users/lossius/dev/Jamoma/Implementations/Max/Jamoma/patchers/modules/audio/limiter~",
        "patcherrelativepath": ".",
        "type": "JSON",
        "implicit": 1
      },
      {
        "name": "j.in~.mxo",
        "type": "iLaX"
      },
      {
        "name": "j.out~.mxo",
        "type": "iLaX"
      },
      {
        "name": "j.model.mxo",
        "type": "iLaX"
      },
      {
        "name": "j.limiter~.mxo",
        "type": "iLaX"
      },
      {
        "name": "j.parameter.mxo",
        "type": "iLaX"
      },
      {
        "name": "j.message.mxo",
        "type": "iLaX"
      }
    ]
  }
}