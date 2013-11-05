/* 
	Issues surrounding threading with Jamoma in general, 
	and with objects subscribed to the hub in particular.

	PROJECT CODE NAME: "Be less critical"

	At a minimum we need to define our own mutex for the hub and not use Max's global 
	critical region.
	
	At the moment there are serious concerns about deadock because so much subscriber-related code 
	is calling outlet functions from within critical regions.  For example, j.init, etc.
	Also, critical regions is slow.  So the question is: can we reduce or eliminate them?
	
	What we know:
	* Subscribers are created and deleted only in the main thread.
	* j.init (need to check this) should always be deferred and thus called in the main thread.
	* j.message and j.parameter can be called from other threads (and thus need some protection)
	* not sure about j.remote
	
	What we need to protect against, some scenarios:
	* deadlock: j.init sends a message to j.parameter
	* deadlock: j.message sends a message out of a module into another module and it bangs a j.init
	* corruption: j.hub is in the middle of traversing the list of parameters to dispatch a message in the scheduler thread
					in the middle of doing this a parameter is deleted or added in the main thread
					
	Big question: does this whole problem just go away if we switch to using Max's hashtab to manage parameters?
	But wait, we need to keep an alphabetized list too.  So in this case it makes sense (and we discussed briefly in Brussels)
	that we should keep everything stored in parallel in a linklist and in a hashtab.  Hmmm....
	
	In Max 5 there is a new dictionary object that does this, but maybe we want something lighter-weight and not as tied 
	to the Max API (e.g. for a future Pd port)?  So then make our dictionary...
	
	So here is one suggestion:
	1. we switch to dictionaries to manage parameters
	2. we are basically in the same position we are already in
	3. oops
	
	
	Here is another suggestion:
	The real concern is whether or not subscribers are being deleted or created.  So we add a flag member
	to the hub's struct.
	* we set the flag anytime we are adding or removing a subscriber from the list
	* immediately before dispatching a message we check the flag and abort the dispatch is needed
	
	This isn't quite as 'perfectly' safe, but actually this the same way it works with Max linklist implementation
	where the critical region is buried inside of the linklist access itself, and if the object is deleted after
	that access then it's just a message to a bad object (and not the end of the world).  So in fact, it is safe
	enough.  Yes?
	
	This should allow us to avoid the potential deadlock situation.  We should devise an intentional deadlock test first
	and then compare before and after to be sure.
	
	In terms of the speed of the operation for checking the flag instead of entering and exiting the critical region,
	my intuition tells me that it will be faster, but I would like to profile it first so we can compare before and 
	after.  Probably the best test is some stuff with uzi objects driving parameters.
	
 */
