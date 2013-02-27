/** 
 THIS IS A TEMPORARY CODE TO NOTIFY USERS THAT A HUB REMAIN IN THEIR PATCH
 */
#include "Jamoma.h"

// Data Structure for this object
typedef struct _hub{
	Object				obj;
	void				*outlet;
} t_hub;

// Prototypes for methods
void *hub_new(SymbolPtr s, AtomCount argc, AtomPtr argv);			// New Object Creation Method
void hub_free(t_hub *x);

// Globals
t_class			*g_hub_class;			// Required. Global pointing to this class

int JAMOMA_EXPORT_MAXOBJ main(void)
{
	t_class		*c;

	// Define our class
	c = class_new("jcom.hub",(method)hub_new, (method)hub_free, sizeof(t_hub), (method)0L, A_GIMME, 0);

	// Finalize our class
	class_register(CLASS_BOX, c);
	g_hub_class = c;

	return 0;
}

void *hub_new(SymbolPtr s, AtomCount argc, AtomPtr argv)
{
	t_hub *x = (t_hub *)object_alloc(g_hub_class);

	if (x) {
		x->outlet = outlet_new(x, NULL);
		object_error((ObjectPtr)x, "jcom.hub is not part of jamoma 0.6. Please use jcom.model instead");
	}
	
	return (x);
}

void hub_free(t_hub *x) {;}