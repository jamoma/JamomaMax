#
# I've been reading various texts about debugging recently.
# One thing that has become quite obvious to me is that we need to have a better way to help
# automate the debugging process.
#
# Below is an example of a potential script that would run a regression test in Max.
# The idea is that a user generated set of steps could easily be transcoded into a similar set of scripting steps.
#

# Maybe we can do this with JavaScript?
# Would be nice to launch from Ruby, it's just difficult to get handles to objects and such.
# I guess we could the underlying mechanism use the @varname, and keep track of these for us underneath in some sort of struct.

# 1. Launch Max
max.startApplication()

# 2. Send a message to Max to create a new patcher
patcher = max.newPatcher()

# 3. Create a new omx.comp~ object in that patcher
object = patcher.newObject("omx.comp~")

# 4. Open that object's help patcher
object.help()

# 5. Now try sending that object some messages
object.bypass(1)

# 6. How do we evaluate it's output?  This is always the problem...
# It's easy to evaluate crashes, but difficult to evaluate anything coming from outlets with scripting in some instrumentation.







