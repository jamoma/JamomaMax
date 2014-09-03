## 0.6

### Beta releases

### 0.6.0.b01 (In development)

- wacom.model
	- position is now an array of x and y values
	- flusheventqueue is removed since it is now deprecated

### Alpha releases

### 0.6.0.a40 (2014-09-03)

- replacing @tag by @tags in j.model|view|node|parameter|message|return
- renaming j.parameterArray into j.parameter_array
- renaming j.messageArray into j.message_array
- renaming j.returnArray into j.return_array
- renaming j.remoteArray into j.remote_array
- Downcasing @ramp/drive options : so Max becomes max and System becomes system



### 0.6.0.a36-39 (2014-07-14)

- Many modules and externals have been quarantined and are not into the package anymore
- Internal data/mute parameter have been renamed into data/active
- j.ui: 
	- the panel have to be connected to the leftmost outlet
	- the menu have been completely redisigned
- j.cue: uses .cues text file format instead xml
- j.model: uses .presets text file format instead xml
- j.view: allowing views to be loaded by a poly~



### 0.6.0.a35 (2014-05-31)

- New external j.mutesolo~ mutes and soloes individual MSP channels
- New external j.mutesolo= mutes and soloes individual channels of an AudioGraph signal
- Updated several integration tests to use testpackage:
    - All tests for Foundation (https://github.com/jamoma/JamomaMax/issues/541)
    - All tests for DSP (https://github.com/jamoma/JamomaMax/issues/542)
    - All tests for Graph (https://github.com/jamoma/JamomaMax/issues/544)
    - All tests for AudioGraph (https://github.com/jamoma/JamomaMax/issues/543)
- Fixed help pacth and ref page for j.dcblock=
- j.oscroute: Routing arguments can be changed dynamically (https://github.com/jamoma/JamomaMax/issues/181)



### 0.6.0.a34 (2014-05-10)

- Some attributes have been renamed:
    - `range/bounds` becomes `range`
    - `range/clipmode` becomes `clipmode`
    - `value/default` becomes `default`
    - `value/stepsize` becomes `stepsize`



### 0.6.0.a32-33 (2014-04-22)

(no new features)



### 0.6.0.a31 (2014-03-21)

- Many modules porting



### 0.6.0.a30 (2014-03-10)

- j.model : Setting patcher annotation using model description.
- j.remote : Now the j.remote subscribe into the namspace using an optional second argument or using the name of the attached ui object.
- j.remote : Attach the ui object using the first, the second or the third outlet.
- j.in(~) : Routing j.in(~) incoming messages to the j.model.
- Replacing `.` by `_` when using the model name to edit the address. Example : If a model is called `foo.bar.model`, the address will be `foo_bar`.
- j.node : This is a new external manage priority of intermediate node that does not refer to any external.



### 0.6.0.a29 (2014-01-01)

- j.parameter_array.
- j.parameter_array : Now have 3 outlets, outputs values on the leftmost outlet and output index on the middle outlet.
- j.receive : When binding on /any/address, the returned address is not anymore /any/address:value but simply /any/address.
- j.parameter_array messages in order to only update the parameters but not outputs.
- j.cue : Adding a `@relative 0|1` attribute to allow cue management relatively to a model address.
- j.map : Adding a `@input/index` to select an index to map into the input value (e.g. the y coordinate of a position parameter).
- j.parameter_array and the other array controller objects : In `@format array`, outputs the `@default` value after a array/resize message.
- j.dbap : No longer crashes if instantiated before any other jitter external has been initialized.



### 0.6.0.a28 (2014-01-01)

- j.message : now have the same behavior for incoming values than j.parameter and j.return.
- j.return : now have 2 outlets and outputs values on the leftmost outlet.
- j.modular for OSC : echo filtering.
- j.cue : namespace selection management now works for remote applications too.
- j.cue : interpolation sends symbol value of the second preset when the position is not 0.
- j.fileLoader : this new abstraction allows to declare a set of standard message/parameter to handle media file loading.
- j.map : improving j.map by adding input and output going down and up notifications (!!! those names will change in a next version !!!).
- j.remote : allowing creation without argument like j.send and j.receive.
- j.remote : highlight state can be handled by a shift+click on the ui object.
- j.remote : adding a set message in order to only update the parameter but not outputs.
- j.namespace : fixing selection for remoteApp:/ address case.
- j.parameter_array : improving the @format array mechanism.
- j.parameter_array : improving the @format array mechanism.



### 0.6.0.a27 (2013-11-04)

- j.cue : some renaming have been done :
    - `namespace/grab` instead of `namespace/update`
    - `optimize` instead of `sequence`
    - To reorder the cue : use `order` message instead of names attribute, even if this attribute is still readable to know the effective order of the cue
- j.preset : the content is stored by priority then alphabetically.
- j.ramp : function library and parameters and scheduler library and parameters are available.



### 0.6.0.a26 (2013-11-04)

- j.parameter | j.message | j.return :
- The `@repetitions/allow 1/0` attribtue have been replaced by `@repetitions/filter 0/1`
    - If you want to update your patches using _find and replace all_, you need to do so in two steps
        1. Replace `@repetitions/allow 0` into ``@repetitions/filter 1``
        2. Substitute the `@repetitions/allow 1` for `@repetitions/filter 0``
- The `reset` message have been replaced by `init` message for more consistency with j.model.
- j.parameter initializes properly if it is located under no j.model.
- j.model : initializes properly if located inside a subpatcher and under no other j.model.
- j.ui : creates a `ui` node with `:size`, `:freeze` and `:highlight` attributes.
- j.cue : The namespace management have been completely redesigned :
    - `namespace/select address1 address2` …
    - `namespace/unselect address1 address2` …
    - `namespace/update cueName` (earlier on this message used to be `namespace/select`)
    - `namespace/clear`
    - `namespace/remove`
- j.cue : Allowing a cue to have a name with an "integer" or "decimal" number (the number needs to be quoted)



### 0.6.0.a25 (2013-10-15)

- j.cue : new update message to update j.parameter's value without reordering a cue.
- j.namespace : fixing strange behavior of the `namespace/remove` message.
- j.modular :
- New directory/clear message for distant application.
- Writing local application namespace only exports node name and object type.
- Minuit protocol : Fixing crash and adding a try count mechanism.
- System scheduler : The speed attribute allow to have time stretchable ramp unit.
- JamomaMax.dylib : Allow a real dependency of the JamomaModular framework. The JamomaMax.dylib should be copied into the support folder.