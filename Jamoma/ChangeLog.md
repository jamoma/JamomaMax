_This document gathers any new features, changes or regressions that each version implies. The _**_CURRENT_**_ tag concerns the released version currently available online.The _**_COMING SOON_**_ tag concerns the development version in order to warn you about what is coming next. The versions without tag are old versions to get an history of the changes and to allow you to easily update your work even if you missed some released versions._

________________________________________________________________________________

**COMING SOON** : 0.6.0.a33

________________________________________________________________________________

**CURRENT** : 0.6.0.a32

- fixing bug introduces during the workshop

________________________________________________________________________________

0.6.0.a31

- many modules porting

________________________________________________________________________________

0.6.0.a30

- j.model : setting patcher annotation using model description.

- j.remote : now the j.remote subscribe into the namspace using an optional second argument or using the name of the attached ui object.

- j.remote : attach the ui object using the first, the second or the third outlet.

- j.in(~) : routing j.in(~) incoming messages to the j.model.

- replacing . by _ when using the model name to edit the address. example : if my model is called **foo.bar**.model it address will be **foo_bar**.

- j.node : this is a new external useful to manage the priority of intermediate node that does't refers to any external.

________________________________________________________________________________

0.6.0.a29

- j.messageArray : now have the same behavior for incoming values than j.parameterArray and j.returnArray.

- j.returnArray : now have 3 outlets, outputs values on the leftmost outlet and output index on the middle outlet.

- j.receive : when binding on /any/address, the returned address is not anymore /any/address:value but simply /any/address.

- j.remoteArray : adding a set and a setArray messages in order to only update the parameters but not outputs.

- j.cue : adding a @relative 0|1 attribute to allow cue management relatively to a model address.

- j.map : adding a @input/index to select an index to map into the input value (e.g. the y coordinate of a position parameter).

- j.___Array : in @format array, outputs the @value/default after a array/resize message.

- j.dbap : the external doesn't crash anymore if jitter have not been initialized before.

________________________________________________________________________________

0.6.0.a28

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

- j.parameterArray : improving the @format array mechanism.

- j.remoteArray : improving the @format array mechanism.

________________________________________________________________________________

0.6.0.a27

- j.cue : some renaming have been done :

- **namespace/grab** instead of namespace/update

- **optimize** instead of sequence

- to reorder the cue : use **order **messageinstead of names attribute (even if this attribute is still readable to know the effective order of the cue)

- j.preset : the content is stored by priority then alphabetically.

- j.ramp : function library and parameters and scheduler library and parameters are available.

________________________________________________________________________________

0.6.0.a26

- j.parameter | j.message | j.return :

- the **@repetitions/allow 1/0** have been replaced by **@repetitions/filter 0/1**

_Be careful when you'll do massive find and replace, you'll need to do 2 operations :_

_replace _**_@repetitions/allow 0_**_ into _**_@repetitions/filter 1_**

**_AND_**

_replace _**_@repetitions/allow 1_**_ into _**_@repetitions/filter 0_**

- the **reset** message have been replaced by **init** message for more consistency with j.model.

- a j.parameter initializes himself properly if it is placed under no j.model.

- j.model : initializes himself properly if it placed inside a sub patcher and under no other j.model.

- j.ui : creates a **ui** node with **:size**, **:freeze** and **:highlight** attributes.

- j.cue : the namespace management have been completely redesigned :

- **namespace/select** address1 address2 …

- **namespace/unselect** address1 address2 …

- **namespace/update** cueName (this message was called namespace/select before)

- namespace/clear

- namespace/remove

- j.cue : allowing a cue to have a name with an "integer" or "decimal" number (the number needs to be quoted)

________________________________________________________________________________

0.6.0.a25

- j.cue : new update message to update j.parameter's value without reordering a cue.

- j.namespace : fixing strange behavior of the namespace/remove message.

- j.modular : 

- new directory/clear message for distant application.

- writing local application namespace only exports node name and object type.

- Minuit protocol : fixing crash and adding a try count mechanism.

- System scheduler : the speed attribute allow to have time stretchable ramp unit.

- JamomaMax.dylib : allow a real dependency of the JamomaModular framework. The JamomaMax.dylib should be copied into the support folder.