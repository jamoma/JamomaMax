{
  "patcher": {
    "fileversion": 1,
    "rect": [
      84.0,
      159.0,
      578.0,
      310.0
    ],
    "bglocked": 0,
    "defrect": [
      84.0,
      159.0,
      578.0,
      310.0
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
    "boxes": [
      {
        "box": {
          "comment": "",
          "id": "obj-1",
          "maxclass": "outlet",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            70.0,
            255.0,
            25.0,
            25.0
          ]
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
            455.0,
            255.0,
            25.0,
            25.0
          ]
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
            355.0,
            255.0,
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
            70.0,
            45.0,
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
            455.0,
            45.0,
            25.0,
            25.0
          ]
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
            ""
          ],
          "patching_rect": [
            355.0,
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
          "id": "obj-7",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            190.0,
            102.0,
            37.0,
            19.0
          ],
          "text": "dbtoa"
        }
      },
      {
        "box": {
          "bgcolor": [
            0.819608,
            0.819608,
            0.819608,
            1.0
          ],
          "bwidthcolor": [
            0.298039,
            0.423529,
            0.67451,
            1.0
          ],
          "dbdisplay": 0,
          "fgcolor": [
            0.666667,
            0.666667,
            0.666667,
            1.0
          ],
          "hbwidthcolor": [
            0.823529,
            0.290196,
            0.211765,
            1.0
          ],
          "hcurvecolor": [
            1.0,
            0.086275,
            0.086275,
            1.0
          ],
          "id": "obj-8",
          "markercolor": [
            0.509804,
            0.509804,
            0.509804,
            1.0
          ],
          "maxclass": "filtergraph~",
          "nfilters": 1,
          "numdisplay": 0,
          "numinlets": 8,
          "numoutlets": 7,
          "outlettype": [
            "list",
            "float",
            "float",
            "float",
            "float",
            "list",
            "int"
          ],
          "patching_rect": [
            70.0,
            145.0,
            97.0,
            34.0
          ],
          "setfilter": [
            0,
            5,
            1,
            0,
            0,
            40.0,
            1.0,
            2.5,
            0.0,
            0.0,
            0.0,
            0.0,
            0.0,
            0.0
          ]
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-9",
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
            70.0,
            80.0,
            259.0,
            19.0
          ],
          "text": "j.oscroute /filtertype /frequency /filtergain /q"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-10",
          "maxclass": "newobj",
          "numinlets": 6,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            455.0,
            210.0,
            98.0,
            19.0
          ],
          "text": "biquad~"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-11",
          "maxclass": "newobj",
          "numinlets": 6,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            355.0,
            210.0,
            98.0,
            19.0
          ],
          "text": "biquad~"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-1003",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 3,
          "outlettype": [
            "signal",
            "signal",
            ""
          ],
          "patching_rect": [
            390.0,
            711.0,
            71.0,
            19.0
          ],
          "text": "j.out~ 2"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-1004",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 4,
          "outlettype": [
            "signal",
            "signal",
            "",
            ""
          ],
          "patching_rect": [
            390.0,
            650.0,
            96.0,
            19.0
          ],
          "text": "j.in~ 2"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-1020",
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
            15.0,
            175.0,
            284.0,
            31.0
          ],
          "text": "j.message filtergraph @description \"Messages to filtergraph. See the MSP reference for further details\""
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-1022",
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
            43.0,
            120.0,
            482.0,
            31.0
          ],
          "text": "j.parameter filtertype @type string @description \"What kind of filter to use. Possible values: lowpass | highpass | bandpass | bandstop | peaknotch | lowshelf | highshelf\"",
          "varname": "filtertype"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-1023",
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
            198.0,
            431.0,
            579.0,
            31.0
          ],
          "text": "j.parameter filtergain @type decimal @range/bounds -24 24 @range/clipmode both @ramp/drive Max @repetitions/allow 0 @description \"Gain (dB)\" @dataspace gain @dataspace/unit dB",
          "varname": "filtergain"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-1024",
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
            198.0,
            356.0,
            412.0,
            31.0
          ],
          "text": "j.parameter q @type decimal @ramp/drive Max @range/bounds 0. 100. @range/clipmode both @repetitions/allow 0 @description \"Resonance (Q)\"",
          "varname": "q"
        }
      },
      {
        "box": {
          "fontname": "Arial",
          "fontsize": 12.0,
          "id": "obj-1025",
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
            198.0,
            512.0,
            594.0,
            31.0
          ],
          "text": "j.parameter frequency @type decimal @range/bounds 30. 11025. @range/clipmode both @ramp/drive Max @repetitions/allow 0 @description \"Center frequency (Hz)\" @dataspace time @dataspace/unit Hz",
          "varname": "cf"
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
            "obj-9",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-8",
            5
          ],
          "hidden": 0,
          "midpoints": [

          ],
          "source": [
            "obj-9",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-8",
            7
          ],
          "hidden": 0,
          "midpoints": [
            259.5,
            132.0,
            157.5,
            132.0
          ],
          "source": [
            "obj-9",
            3
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
            "obj-9",
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
            "obj-8",
            6
          ],
          "hidden": 0,
          "midpoints": [
            199.5,
            129.0,
            146.357147,
            129.0
          ],
          "source": [
            "obj-7",
            0
          ]
        }
      }
    ]
  }
}