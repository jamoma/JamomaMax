/** @file
 *
 * @ingroup implementationMax
 *
 * @brief minuit : wraps the #Minuit ProtocolLib extension class part
 *
 * @details Minuit protocol is a query-answer protocol built on top of the OSC protocol
 *
 * @authors Theo de la Hogue
 *
 * @copyright © 2010-13 by Theo de la Hogue @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */

#include "j.minuit.h"

int TTCLASSWRAPPERMAX_EXPORT main(void)
{
	ModularSpec *spec = new ModularSpec;
	spec->_wrap = &WrapMinuitClass;
	spec->_new = &WrappedMinuitClass_new;
	spec->_any = NULL;
	spec->_free = &WrappedMinuitClass_free;
	
    kTTSym_Minuit = TTSymbol("Minuit");
	return wrapTTModularClassAsMaxClass(kTTSym_Minuit, "j.minuit", NULL, spec);
}

void WrapMinuitClass(WrappedClassPtr c)
{
	class_addmethod(c->maxClass, (method)minuit_assist,					"assist",						A_CANT, 0L);
    
    class_addmethod(c->maxClass, (method)minuit_return_activity_in,     "return_activity_in",           A_CANT, 0);
    
    class_addmethod(c->maxClass, (method)minuit_return_activity_out,    "return_activity_out",           A_CANT, 0);
/*
	class_addmethod(c->maxClass, (method)minuit_protocol_setup,			"protocol/setup",				A_GIMME, 0);
	
	class_addmethod(c->maxClass, (method)minuit_namespace_read,			"namespace/read",				A_GIMME, 0);
    
    class_addmethod(c->maxClass, (method)minuit_namespace_write,		"namespace/write",				A_GIMME, 0);
 */
}

void WrappedMinuitClass_new(TTPtr self, AtomCount argc, AtomPtr argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTSymbol					applicationName;
    TTObjectBasePtr             anApplication = NULL;
    TTObjectBasePtr             aReceiver;
	TTXmlHandlerPtr             anXmlHandler;
	TTValue						v, args;
 	long						attrstart = attr_args_offset(argc, argv);			// support normal arguments
    
    // Get the Minuit protocol object
    x->wrappedObject = getProtocol(kTTSym_Minuit);
    
    // Is the Minuit protocol available ?
    if (!x->wrappedObject) {
        
        object_error((ObjectPtr)x, "Minuit protocol is not available");
        return;
    }
    
	// no argument : j.minuit handles the local application
	if (attrstart == 0) {

		applicationName = getLocalApplicationName;
        anApplication = getLocalApplication;
    }
		
	// 1 argument : j.minuit handles a distant application
	else if (attrstart == 1) {
		
		applicationName = TTSymbol(atom_getsym(argv)->s_name);
        anApplication = getApplication(applicationName);
        
        // if the application doesn't exists
        if (!anApplication) {
			
            // create the application
            args = TTValue(applicationName);
            TTObjectBaseInstantiate(kTTSym_Application, TTObjectBaseHandle(&anApplication), args);
        }
        
        // as it is Minuit protocol : set the type of the application to mirror
        v = TTValue(TTSymbol("mirror"));
        anApplication->setAttributeValue(kTTSym_type, v);
    }
    
	// Prepare extra data
	x->extra = (t_extra*)malloc(sizeof(t_extra));
	EXTRA->applicationName = applicationName;
	
	// Prepare Internals hash to store XmlHanler object
	x->internals = new TTHash();
    
    // Observe the /:activity/in
    makeInternals_receiver(self, kTTAdrsRoot, TTSymbol("activity/in"), gensym("return_activity_in"), &aReceiver, NO, YES);
    
    // Observe the /:activity/out
    makeInternals_receiver(self, kTTAdrsRoot, TTSymbol("activity/out"), gensym("return_activity_out"), &aReceiver, NO, YES);
	
	// Create internal TTXmlHandler to write/read the namespace the application
	anXmlHandler = NULL;
	TTObjectBaseInstantiate(kTTSym_XmlHandler, TTObjectBaseHandle(&anXmlHandler), args);
	v = TTValue(anXmlHandler);
	x->internals->append(kTTSym_XmlHandler, v);
	v = TTValue(x->wrappedObject);
	anXmlHandler->setAttributeValue(kTTSym_object, v);
	
    // Register the application to the protocol
    v = TTValue(applicationName);
    x->wrappedObject->sendMessage(TTSymbol("registerApplication"), v, kTTValNONE);
    
    // Parse arguments to setup the protocol parameters
	if (argc && argv)
        attr_args_process(x, argc, argv);
    
    // Run this protocol
    TTModularApplications->sendMessage(TTSymbol("ProtocolRun"), kTTSym_Minuit, kTTValNONE);
}

void WrappedMinuitClass_free(TTPtr self)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;

	// don't release the local application
	if (x->wrappedObject != getLocalApplication)
		TTObjectBaseRelease(&x->wrappedObject);
	
	free(EXTRA);
}

// Method for Assistance Messages
void minuit_assist(TTPtr self, void *b, long msg, long arg, char *dst)
{
	if (msg==1) 						// Inlet
		strcpy(dst, "input");
	else {								// Outlets
		switch(arg) {
			case dump_out:
				strcpy(dst, "dumpout");
				break;
		}
 	}
}

void minuit_return_activity_in(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
    WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
    
    atom_setsym(argv, gensym("activity/in"));
    
    object_obex_dumpout(self, msg, argc, argv);
}

void minuit_return_activity_out(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
    WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
    
    atom_setsym(argv, gensym("activity/out"));
    
    object_obex_dumpout(self, msg, argc, argv);
}

/*
void minuit_protocol_setup(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTSymbol    applicationName, parameterName;
	TTObjectBasePtr	aProtocol = NULL;
	TTHashPtr	hashParameters;
	TTValue		v, keys, parameterValue;
	AtomCount	ac;
	AtomPtr		av;
	TTErr		err;
	
	// get the protocol object
    aProtocol = getProtocol(EXTRA->protocolName);
	if (aProtocol) {
		
		if (x->wrappedObject) {
			x->wrappedObject->getAttributeValue(kTTSym_name, v);
			applicationName = v[0];
			
			// get parameters
			err = aProtocol->getAttributeValue(TTSymbol("applicationParameters"), v);

			if (!err) {
				
				// get parameter's value
				hashParameters = TTHashPtr((TTPtr)v[0]);
				
				// set one application protocol parameter
				if (argc && argv) {
					
					parameterName = TTSymbol(atom_getsym(argv)->s_name);
					jamoma_ttvalue_from_Atom(parameterValue, _sym_nothing, argc-1, argv+1);
					
					// check if parameter exists
					err = hashParameters->lookup(parameterName, v);
					
					if (!err) {
						
						// set parameter value
						hashParameters->remove(parameterName);
						hashParameters->append(parameterName, parameterValue);
						
						// stop the protocol for local application
                        if (applicationName == getLocalApplicationName)
                            aProtocol->sendMessage(TTSymbol("Stop"));
                        
                        // stop the protocol for the distant application
                        else
                            aProtocol->sendMessage(TTSymbol("Stop"), applicationName, kTTValNONE);
                            
						// set parameters
						v = TTValue(applicationName);
						v.append(TTPtr(hashParameters));
						err = aProtocol->setAttributeValue(TTSymbol("applicationParameters"), v);
						
						// run the protocol for local application
                        if (applicationName == getLocalApplicationName)
                            aProtocol->sendMessage(TTSymbol("Run"));
                        
                        // run the protocol for the distant application
                        else
                            aProtocol->sendMessage(TTSymbol("Run"), applicationName, kTTValNONE);
					}
					else
						object_error((ObjectPtr)x, "%s is not a parameter of %s protocol", parameterName.c_str(), EXTRA->protocolName.c_str());
					
				}
				// or if no arg : dumpout the current setup
				else {
					
					hashParameters->getKeys(keys);
					for (TTUInt8 i = 0; i < keys.size(); i++) {
						
						parameterName = keys[i];
						hashParameters->lookup(parameterName, parameterValue);
						
						parameterValue.prepend(parameterName);
						ac = 0;
						av = NULL;
						jamoma_ttvalue_to_Atom(parameterValue, &ac, &av);
						object_obex_dumpout(self, gensym("protocol/setup"), ac, av);
					}
				}
			}
		}
		else
			object_error((ObjectPtr)x, "doesn't handle any application");
	}
}

void minuit_namespace_read(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	defer(self, (method)modular_namespace_doread, msg, argc, argv);
}

void minuit_namespace_doread(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{	
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTValue				o, v;
	TTSymbol			fullpath;
	TTXmlHandlerPtr     anXmlHandler = NULL;
	TTErr				tterr;
	
	if (x->wrappedObject) {
		
		fullpath = jamoma_file_read((ObjectPtr)x, argc, argv, NULL);
		v.append(fullpath);
		
		tterr = x->internals->lookup(kTTSym_XmlHandler, o);
		
		if (!tterr) {
			
			anXmlHandler = TTXmlHandlerPtr((TTObjectBasePtr)o[0]);
			
			critical_enter(0);
			tterr = anXmlHandler->sendMessage(kTTSym_Read, v, kTTValNONE);
			critical_exit(0);
			
			if (!tterr)
				object_obex_dumpout(self, _sym_read, argc, argv);
			else
				object_obex_dumpout(self, _sym_error, 0, NULL);
		}
	}
}

void minuit_namespace_write(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
    defer(self, (method)modular_namespace_dowrite, msg, argc, argv);
}

void minuit_namespace_dowrite(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
    WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	char 			filename[MAX_FILENAME_CHARS];
	TTSymbol		fullpath;
	TTValue			o, v;
	TTXmlHandlerPtr anXmlHandler;
	TTErr			tterr;
	
	if (x->wrappedObject) {
		
		// Default XML File Name
		snprintf(filename, MAX_FILENAME_CHARS, "namespace.xml");
		fullpath = jamoma_file_write((ObjectPtr)x, argc, argv, filename);
		v.append(fullpath);
		
		tterr = x->internals->lookup(kTTSym_XmlHandler, o);
		
		if (!tterr) {
			anXmlHandler = TTXmlHandlerPtr((TTObjectBasePtr)o[0]);
			
			critical_enter(0);
			tterr = anXmlHandler->sendMessage(kTTSym_Write, v, kTTValNONE);
			critical_exit(0);
			
			if (!tterr)
				object_obex_dumpout(self, _sym_write, argc, argv);
			else
				object_obex_dumpout(self, _sym_error, 0, NULL);
		}
	}
}
 */
