/** @file
 *
 * @ingroup modularMax
 *
 * @brief External for Jamoma: jcom.hub - The main control center of a Jamoma module
 *
 * @details
 *
 * @authors Tim Place, Trond Lossius, Nils Peters, Diemo Schwarz
 *
 * @copyright Copyright © 2006 by Tim Place @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */


#ifndef __jcom_HUB_H__
#define __jcom_HUB_H__

#include "Jamoma.h"					// Max Header
#include "ext_symobject.h"

#define MAX_STRING_LEN 2048
#define LISTSIZE 512

enum outlets{
	k_outlet_return = 0,
	k_outlet_dumpout,
	k_num_outlets
};

/** Data structure for storing information about objects subscribed to the hub. */
typedef struct _subscriber{
	t_object		*object;	///< The max object instance that represents this subscriber
	t_symbol		*name;		///< Name of the parameter/message/return/remote
	t_symbol		*type;		///< Examples: subscribe_parameter, subscribe_message, subscribe_in, subscribe_out, subscribe_remote, subscribe_return
} t_subscriber;

typedef jcomList<t_subscriber*> subscriberList;
typedef list<t_subscriber*>::iterator subscriberIterator;

typedef struct _preset_item{
	t_symbol		*param_name;
	t_symbol		*type;
	long			priority;
    float           mixweight;
	t_atom			value_list[LISTSIZE];
	long			list_size;
} t_preset_item;

typedef jcomList<t_preset_item*> presetItemList;
typedef list<t_preset_item*>::iterator presetItemListIterator;

/** Linked list of loaded presets. */
typedef struct _preset{
	long			number;
	t_symbol		*name;
	presetItemList	*item;		///< A preset may have N items (stored as a linked list)
	long			last_preset_num;
	t_symbol		*last_preset_name;
} t_preset;

typedef jcomList<t_preset*> presetList;
typedef list<t_preset*>::iterator presetListIterator;

/** The Hub. jcom.hub performs a large part of the automagic part of Jamoma.  This includes things such as saving and recalling presets, resizing modules to one of the standard sizes forwarding of control messages to jcom.in and so on.  */
typedef struct _hub{							///< Data Structure for this object
	t_object		ob;							///< REQUIRED: Our object
	void			*outlets[k_num_outlets];	///< outlet array
	t_object		*container;					///< the owning patcher
	subscriberList	*subscriber;				///< top of the linked list of parameters
	presetList		*preset;					///< top of the linked list of presets
	long			num_parameters;				///< count used for working with presets
	void			*init_qelem;				///< qelem used for initialization messages
	t_object		*in_object;					///< cache the jcom.in object directly for quick access
	t_object		*out_object;				///< cache the jcom.out object directly for quick access
	t_object		*meter_object[MAX_NUM_CHANNELS];	///< cache any meter objects so they can be handed to jcom.out
	t_object		*gui_object;				///< cache the jcom.remote object in the gui for quick access
	t_symbol		*attr_name;					///< ATTRIBUTE: module name
	t_symbol		*attr_type;					///< ATTRIBUTE: what kind of module is this?  (audio, video, control, etc.)
	long			attr_size[2];				///< ATTRIBUTE: gui size (x and y)
	t_symbol		*attr_description;			///< ATTRIBUTE: textual description of this module
	t_symbol		*attr_algorithm_type;		///< ATTRIBUTE: control, jitter, etc.
	long			attr_inspector;
	long			flag_init;					///< FLAG: Indicates that the module is in a process of initiaizaiton
	t_object		*jcom_send;					///< jcom.send and jcom.receive objects for remote communication
	t_object		*jcom_receive;				//	...
	t_symbol		*osc_alias;					///< The OSC name of this module for remote communication. This name can be changed dynamically, and can be considered an alias for the module.
	t_symbol		*osc_permanent;			///< A OSC name for the module that will be set when instantiated, and remain fixed for the lifespan of the module. This ensures that we are able to address the module using remote OSC communication regardless of what the alias might be set to at the time being.
	bool			using_wildcard;				///< used when parsing wildcards to flag special syntax checking
	t_hashtab		*hash_internals;			///< use Max's hashtab implementation for tracking internals objects
	t_object		*preset_interface;
	long			preset_lastnum;
	t_symbol		*preset_lastname;
	t_symbol		*user_path;					///< path of the last file used to save the presets
	char*			text;						///< text used by /getstate window
	TTUInt32		textSize;					///< how many chars are alloc'd to text
	t_object*		textEditor;					///< the text editor window
	TTBoolean		editing;					///< are we editing this module?
} t_hub;


// Prototypes for our methods:

/** The jcom.hub constructor 
 @param s			Symbol passed to the object at instantiation.
 @param argc		The number of arguments passed to the object.
 @param argv		The arguments passed to the obejct as an array of atoms.
 @return			Pointer to the newly created object.
 @see				hub_examine_context, hub_subscriptions_refresh, hub_free
 */
void*		hub_new(t_symbol *s, long argc, t_atom *argv);


/** Re-examin the patch that jcom.hub is part of and refresh the list of Jamoma core objects subscribed to this hub.
 @param x			Pointer to this object.
 @see				hub_new, hub_examine_context
 */
void		hub_subscriptions_refresh(t_hub *x);


/** A deferred examination of the context of the hub at instantiation. 
 @param x			Pointer to this object.
 @see				hub_new, hub_subscriptions_refresh
 */
void		hub_examine_context(t_hub *x);


/** The hub deconstructor, free's any memory used by the hub.
 @param x the hub who's memory should be freed
 @see hub_new */
void		hub_free(t_hub *x);


/** TODO: What is this one doing?
 */
void		hub_notify(t_hub *x, t_symbol *s, t_symbol *msg, void *sender, void *data);


/**
 Provide assistance strings for inlets and outlets in Max.
*/
void		hub_assist(t_hub *x, void *b, long msg, long arg, char *dst);


/** TODO: What is this one doing?
 */
t_object*	hub_getobj_audioin(t_hub *x);


/** TODO: What is this one doing?
 */
t_object*	hub_getobj_audioout(t_hub *x);


/** When the hub receives a bang, it ask all parameters and messages using @ramp/drive async to update. */
void hub_bang(t_hub *x);


/** A message of some kind (aka a symbol) has been passed to the object.
 @param x			Pointer to this object.
 @param msg			The message received.
 @param argc		The number of arguments to the message.
 @param argv		The arguments as a pointer to an array of atoms.
 */
void hub_symbol(t_hub *x, t_symbol *msg, long argc, t_atom *argv);


/** This is called by clients who wish to register their parameters with the hub.  Meaning these are typically called by jcom.parameter 
 @param x the hub the client wants to subscribe to
 @param name the name of the subscribing object
 @param param_object a pointer to the subscribing object itself
 @param type the type of the object subscribing to the hub
 @return the name of the hub subscribed to 
 @see hub_unsubscribe, hub_subscriptions_refresh
 */
t_symbol*	hub_subscribe(t_hub *x, t_symbol *name, t_object *param_object, t_symbol *type);


/** Unsubscribe a client from the hub.
 @param x the hub to be unsubscribed from.
 @param subscriber_object the object to unsubscribe.
 @see hub_subscribe, hub_subscriptions_refresh
 */
void		hub_unsubscribe(t_hub *x, t_object *subscriber_object);

/** Receive parameter values from jcom.parameter.
 @param x			Pointer to this object
 @param name		Name of the parameter that is sending a message.
 @param argc		The number of arguments to the message.
 @param argv		The arguments as a pointer to an array of atoms.
 @see				jcom_private, jcom_return, jcom_return_extended
 */
void		hub_receive(t_hub *x, t_symbol *name, long argc, t_atom *argv);


/** Receive private messages from jcom.remote.
 @param x			Pointer to this object
 @param name		Name of the parameter that is sending a message.
 @param argc		The number of arguments to the message.
 @param argv		The arguments as a pointer to an array of atoms.
 @see				jcom_receive, jcom_return, jcom_return_extended
 */
void		hub_private(t_hub *x, t_symbol *name, long argc, t_atom *argv);


/** Receive messages from jcom.return - don't send messages back to the algorithm.
 @param x			Pointer to this object
 @param name		Name of the parameter that is sending a message.
 @param argc		The number of arguments to the message.
 @param argv		The arguments as a pointer to an array of atoms.
 @see				jcom_private, jcom_receive, jcom_return_extended
 */
void 		hub_return(t_hub *x, t_symbol *name, long argc, t_atom *argv);


/** A version of jcom_return that performs wilcard substitution.
 @param x			Pointer to this object
 @param name		Name of the parameter that is sending a message.
 @param argc		The number of arguments to the message.
 @param argv		The arguments as a pointer to an array of atoms.
 @see hub_return
 */
void		hub_return_extended(t_hub *x, t_symbol *name, long argc, t_atom *argv);


/** All messages being returned from the module should be funneled through this function!
 @param x			Pointer to this object
 @param msg			The message to be sent.
 @param argc		The number of arguments to the message.
 @param argv		The arguments as a pointer to an array of atoms.
 */
void 		hub_outlet_return(t_hub *x, t_symbol *msg, long argc, t_atom *argv);


/** Get the names of all jcom.parameter objects subscribed to the hub.
 @param x			Pointer to this object.
 */
void		hub_paramnames_get(t_hub *x);


/** Get the names of all jcom.message objects subscribed to the hub.
 @param x			Pointer to this object.
 */
void		hub_messagenames_get(t_hub *x);


/** Get the names of all jcom.return objects subscribed to the hub.
 @param x			Pointer to this object.
 */
void		hub_returnnames_get(t_hub *x);


/** Get the values of all parameters for this module. Values are dumped using hub_outlet_return.
 @param x			Pointer to this object.
 @see				hub_outlet_return
 */
void		hub_paramvalues_get(t_hub *x);


/** Get the names of all jcom.parameter, jcom.message and jcom.return objects subscribed to the hub.
 @param x			Pointer to this object.
 */
void		hub_allnames_get(t_hub *x);


/** Get the name of the module.
 @param x			Pointer to this object.
 */
t_symbol*	hub_modulename_get(t_hub *x);


/** Get a linked list of parameters subscribed to the hub.
 @param x			Pointer to this object.
 @param linklist	The jcom.parameter objects of the module.
 */
void hub_paramnames_linklist(t_hub *x, t_linklist *linklist);


/** Get a linked list of messages subscribed to the hub.
 @param x			Pointer to this object.
 @param linklist	The jcom.message objects of the module.
 */
void hub_messagenames_linklist(t_hub *x, t_linklist *linklist);


/** Get a linked list of returns subscribed to the hub.
 @param x			Pointer to this object.
 @param linklist	The jcom.return obejcts of the module.
 */
void hub_returnnames_linklist(t_hub *x, t_linklist *linklist);


void hub_presetnames_linklist(t_hub *x, t_linklist *ll);

/** Returns the name of the module.  Only really used by jcom.core.cpp.
 * @return			The name of the module.
 */
t_symbol*	core_modulename_get(t_hub *x);


t_symbol*	hub_modulename_get(t_hub *x);


/** Query the algorithm type of the module.
 */
t_symbol*	hub_algorithmtype_get(t_hub *x);


/** Open the maxhelp patch for this module.
 @param x			Pointer to this object.
 */
void hub_module_help(t_hub* x);


/** Open the HTML reference page for this object.
 @param x			Pointer to this object.
 */
void hub_module_reference(t_hub* x);


/** Initializes any jcom.init objects that are subscribed to the hub by sending them
 * a 'bang'.
 * @param x the hub who's subscribed jcom.init objects should be banged
 */
void		hub_init(t_hub *x, t_symbol*, long, t_atom*);
void 		hub_qfn_init(t_hub *x);
void 		hub_gui_build(t_hub *x);


/** Open the algorithm subpatch or abstraction embedded in the module.
 @param x			Poointer to this object. The rest of the arguments are ignored.
 */
void		hub_module_view_alg(t_hub *x, t_symbol*, long, t_atom*);


/** Freeze updating of the UI
 * @param x a pointer to the hub
 * @param value non-zero to freeze UI updates, 0 to enable updating the UI 
 * @see hub_ui_refresh */
void 		hub_ui_freeze(t_hub *x, t_symbol*, long argc, t_atom *argv);


/** Refresh the UI
 * @param x a pointer to the hub 
 * @see hub_ui_freeze */
void 		hub_ui_refresh(t_hub *x, t_symbol*, long, t_atom*);


/** Receive messages from our internal jcom.receive external.
 * @param x			Pointer to this object.
 * @param msg		The message received.
 * @param argc		The argument count for argv
 * @param argv		The number or name of the preset to recall
 */
void		hub_receive_callback(void *x, t_symbol *msg, long argc, t_atom *argv);


// These are in jcom.hub.autodoc.cpp
void		hub_autodoc(t_hub *x, t_symbol *msg, long argc, t_atom *argv);
void		hub_doautodocHtml(t_hub *x, t_symbol *userpath);
void		hub_doautodocTex(t_hub *x, t_symbol *userpath);
void		hub_doautodocTextile(t_hub *x, t_symbol *userpath);
void		hub_autodoc_nodeHtml(t_filehandle *file_handle, long *myEof, t_subscriber* t, int nodeType);
void		hub_autodoc_nodeTex(t_filehandle *file_handle, long *myEof, t_subscriber* t, int nodeType);
void		hub_autodoc_nodeTextile(t_filehandle *file_handle, long *myEof, t_subscriber* t, int nodeType);
void		hub_autodoc_css(t_filehandle *file_handle, long *myEof);
void 		table_headingHtml(t_filehandle *file_handle, long *myEof, int nodeType);
void 		table_headingTex(t_filehandle *file_handle, long *myEof, int nodeType);
void 		table_headingTextile(t_filehandle *file_handle, long *myEof, int nodeType);

// These are in jcom.hub.internals.cpp
/** Create parameters, messages, and other internal subscribers to the hub.
 * @param x the hub
 * @see hub_internals_destroy
 */
void hub_internals_create(t_hub *x);


/** Destroy (free) parameters, messages, etc. that are internal to hub.
 * @param x the hub
 * @see hub_internals_create
 */
void hub_internals_destroy(t_hub *x);


/** Send a message to the appropriate internal parameter or message
 * @param x			the hub
 * @param osc_alias	the osc name of the parameter or message
 * @param argc		the number of values to send to the parameter or message
 * @param argv		the actual values to send to the parameter or message
 */
//void hub_internals_dispatch(t_hub * x, t_symbol * osc_alias, long argc, t_atom * argv);


// These are in jcom.hub.presets.cpp

/** Read an XML preset file.
 * @param x the hub to the preset file should be loaded for
 * @param userpath path to the XML file to load
 * @see hub_preset_doread hub_preset_write hub_preset_dowrite
 */
void 		hub_preset_read(t_hub *x, t_symbol *msg, long argc, t_atom *argv);


/** This does the actual work for @ref hub_preset_read since the actual
 * act of reading the file is defered to the low priority thread
 * @see hub_preset_read */
t_max_err 	hub_preset_doread(t_hub *x, t_symbol *userpath);


/** Reads in and parses an XML file of presets 
 * @param x the hub to which the loaded presets should be attached
 * @param path the path the XML file to read
 */
void 		hub_preset_parse(t_hub *x, char *path);


/** Given a path to an XML file it validates that it is a valid XML file 
 * @param x the hub for which the XML preset file should be validated for
 * @param xml_path the path to the XML file
 * @return 0 if succesfully validated, non-zero otherwise
 */
short		hub_preset_validate(t_hub *x, char *xml_path);


/** Writes an XML preset file.
 * @param x the hub whose presets should be written to disk
 * @param userpath path to the XML file to write
 * @see  hub_preset_dowrite hub_preset_read hub_preset_doread 
 */
void 		hub_preset_write(t_hub *x, t_symbol *msg, long argc, t_atom *argv);

/** Writes on the same XML preset file.
 * @param x the hub whose presets should be written to disk
 * @param userpath path to the XML file to write
 * @see  hub_preset_dowrite hub_preset_read hub_preset_doread 
 */
void 		hub_preset_write_again(t_hub *x);

/** This does the actual work for @ref hub_preset_write since the actual
 * act of writing the file is defered to the low priority thread 
 * @see hub_preset_write 
 */
void 		hub_preset_dowrite(t_hub *x, t_symbol *userpath);


/** Recalls a preset by number or name.
 * @param x the hub containing the preset
 * @param msg
 * @param argc the argument count for argv
 * @param argv the number or name of the preset to recall
 * @see hub_preset_store
 */
void 		hub_preset_recall(t_hub *x, t_symbol *msg, long argc, t_atom *argv);	// number or name

void hub_preset_interpolate(t_hub *x, t_symbol *msg, long argc, t_atom *argv);
void hub_preset_mix (t_hub *x, t_symbol *msg, long argc, t_atom *argv);


/** Copies a preset by number or name.
* @param x the hub containing the preset
* @param msg
* @param argc the argument count for argv
* @param argv the number or name of the preset to recall
* @see hub_preset_store
*/
void 		hub_preset_copy(t_hub *x, t_symbol *msg, long argc, t_atom *argv);


/** Stores a preset by number or name.
 * @param x the hub containing the preset
 * @param msg
 * @param argc the argument count for argv
 * @param argv the number of the preset with an optional name
 * @see hub_preset_recall
 */
void 		hub_preset_store(t_hub *x, t_symbol *msg, long argc, t_atom *argv);	// number & optional name


/** Stores a preset in the next slot by name.
 * @param x the hub containing the preset
 * @param msg
 * @param argc the argument count for argv
 * @param argv the number of the preset with an optional name
 * @see hub_preset_recall
 */
void 		hub_preset_store_next(t_hub *x, t_symbol *msg, long argc, t_atom *argv);	// number & optional name

/** Stores a preset in the last recalled or stored preset.
 * @param x the hub containing the preset
 */
void		hub_preset_store_current(t_hub *x);

/** Recall the default file and recall the first preset
 * @param x the hub whose default preset should be recalled */
void 		hub_preset_default(t_hub *x, t_symbol*, long, t_atom*);


/** Clears all presets loaded in memory.
 * @param x the hub whose presets should be cleared 
 */
void 		hub_presets_clear(t_hub *x, t_symbol*, long, t_atom*);


/** Dump all presets
 * @param x a pointer to the hub whose presets should be dumped */
void 		hub_presets_dump(t_hub *x, t_symbol*, long, t_atom*);

/** Post all presets
 * @param x a pointer to the hub whose presets should be dumped */
void 		hub_presets_post(t_hub *x, t_symbol*, long, t_atom*);


/** Display current state of the object in a text window.
 */
void hub_getstate(t_hub *x);


/** Notification that the text editing window showing current state has been closed.
 */
void hub_edclose(t_hub *x, char **text, long size);


/** TODO: What do this one do?
 */
void hub_script(t_hub* x, SymbolPtr s, AtomCount ac, AtomPtr av);

void hub_preset_interface(t_hub* x);


/** Set the OSC alias of the module. This is stored as the x->osc_alias attribute, and can be changed dynamically throughout the lifespan of the object and module. In addition we keep a permanent x->osc_permanent that is set when the object is created. This way x->osc_alias serves as an alias to the module that can be dynamically changed, while x->osc_permanent provides a permanent address to the module.
 @param x			Pointer to this object.
 @param attr		The name of the attribute (x->osc_alias).
 @param argc		The number of arguments.
 @param argv		Arguments as a pointer to an array of atoms. We will only use the first argument here.
 @return			Error if the attempt to update the osc_alias attribute failed.
 */
t_max_err hub_attr_setalias(t_hub* x, t_object* attr, long argc, t_atom* argv);


/**
 Get rid of the OSC alias by resetting osc_alias to osc_permant.
 @param x			Pointer to this object.
 @return			Error if the attempt to update the osc_alias attribute failed.
 */
t_max_err hub_alias_remove(t_hub* x);

// Globals
extern 		t_class		*hub_class;				// Required: Global pointer for our class


#endif // #ifndef __jcom_HUB_H__
