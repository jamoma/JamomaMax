/* 
 * jcom.modular
 * External for Jamoma : to manage local and distant application
 *
 * By Theo de la Hogue, Copyright 2010
 * 
 * License: This code is licensed under the terms of the GNU LGPL
 * http://www.gnu.org/licenses/lgpl.html
 */

#include "TTModularClassWrapperMax.h"

#define dump_out 0

// This is used to store extra data
typedef struct extra {
	
	TTSymbol			protocolName;	// remember the handled protocol 
	
} t_extra;
#define EXTRA ((t_extra*)x->extra)


// Definitions
void	WrapTTApplicationClass(WrappedClassPtr c);
void	WrappedApplicationClass_new(TTPtr self, AtomCount argc, AtomPtr argv);
void	WrappedApplicationClass_free(TTPtr self);

void	modular_assist(TTPtr self, void *b, long msg, long arg, char *dst);

void	modular_protocol_setup(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);

void	modular_namespace_read(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);
void	modular_namespace_doread(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);

void	modular_namespace_write(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);
void	modular_namespace_dowrite(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv);

int TTCLASSWRAPPERMAX_EXPORT main(void)
{
	ModularSpec *spec = new ModularSpec;
	spec->_wrap = &WrapTTApplicationClass;
	spec->_new = &WrappedApplicationClass_new;
	spec->_any = NULL;
	spec->_free = &WrappedApplicationClass_free;
	
	return wrapTTModularClassAsMaxClass(kTTSym_Application, "jcom.modular", NULL, spec);
}

void WrapTTApplicationClass(WrappedClassPtr c)
{
	class_addmethod(c->maxClass, (method)modular_assist,					"assist",						A_CANT, 0L);
	
	class_addmethod(c->maxClass, (method)modular_protocol_setup,			"protocol/setup",				A_GIMME, 0);
	
	class_addmethod(c->maxClass, (method)modular_namespace_read,			"namespace/read",				A_GIMME, 0);
    
    class_addmethod(c->maxClass, (method)modular_namespace_write,			"namespace/write",				A_GIMME, 0);
}

void WrappedApplicationClass_new(TTPtr self, AtomCount argc, AtomPtr argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTSymbol					applicationName;
	TTSymbol					protocolName;
	TTXmlHandlerPtr             anXmlHandler;
	TTValue						v, args;
 	long						attrstart = attr_args_offset(argc, argv);			// support normal arguments
		
	// jcom.modular can handle the local application (1 argument to declare a protocol to use)
	if (attrstart <= 1) {
		
		// our wrapped object is the local application
		applicationName = getLocalApplicationName;
		x->wrappedObject = getLocalApplication;
		
		if (attrstart == 1)
			protocolName = TTSymbol(atom_getsym(argv)->s_name);
		
	}
	// or it can handle a distant application (2 arguments to declare the name of the distant application and the protocol to use)
	else if (attrstart == 2) {
		
		// our wrapped object is a distant application
		applicationName = TTSymbol(atom_getsym(argv)->s_name);
		x->wrappedObject = getApplication(applicationName);
		
		// if the application doesn't exists
		if (!x->wrappedObject) {
			
			// create the application
			args = TTValue(applicationName);
			TTObjectBaseInstantiate(kTTSym_Application, TTObjectBaseHandle(&x->wrappedObject), args);
		}
		
		protocolName = TTSymbol(atom_getsym(argv+1)->s_name);
	}
	
	// jcom.modular handle only one protocol per application
	if (protocolName != kTTSymEmpty) {
		
		// check if the protocol has been loaded
		if (!getProtocol(protocolName)) {
            
			object_error((ObjectPtr)x, "the %s protocol is not available", protocolName.c_str());
		}
        else {
            
            // register the application to the protocol
            v = TTValue(applicationName);
            getProtocol(protocolName)->sendMessage(TTSymbol("registerApplication"), v, kTTValNONE);
            
            // run this protocol
            TTModularApplications->sendMessage(TTSymbol("ProtocolRun"), protocolName, kTTValNONE);
        }
	}
	
	// Prepare extra data
	x->extra = (t_extra*)malloc(sizeof(t_extra));
	EXTRA->protocolName = protocolName;
	
	// Prepare Internals hash to store XmlHanler object
	x->internals = new TTHash();
	
	// create internal TTXmlHandler
	anXmlHandler = NULL;
	TTObjectBaseInstantiate(kTTSym_XmlHandler, TTObjectBaseHandle(&anXmlHandler), args);
	v = TTValue(anXmlHandler);
	x->internals->append(kTTSym_XmlHandler, v);
	v = TTValue(x->wrappedObject);
	anXmlHandler->setAttributeValue(kTTSym_object, v);
	
	if (attrstart && argv) attr_args_process(x, argc, argv);
}

void WrappedApplicationClass_free(TTPtr self)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;

	// don't release the local application
	if (x->wrappedObject != getLocalApplication)
		TTObjectBaseRelease(&x->wrappedObject);
	
	free(EXTRA);
}

// Method for Assistance Messages
void modular_assist(TTPtr self, void *b, long msg, long arg, char *dst)
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

void modular_protocol_setup(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
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
						
						// stop the protocol (for local application setup only)
                        if (applicationName == getLocalApplicationName)
                            aProtocol->sendMessage(TTSymbol("Stop"));
						
						// set parameters
						v = TTValue(applicationName);
						v.append(TTPtr(hashParameters));
						err = aProtocol->setAttributeValue(TTSymbol("applicationParameters"), v);
						
						// run the protocol (for local application setup only)
                        if (applicationName == getLocalApplicationName)
                            aProtocol->sendMessage(TTSymbol("Run"));
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

void modular_namespace_read(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
	defer(self, (method)modular_namespace_doread, msg, argc, argv);
}

void modular_namespace_doread(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
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

void	modular_namespace_write(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
{
    defer(self, (method)modular_namespace_dowrite, msg, argc, argv);
}

void	modular_namespace_dowrite(TTPtr self, SymbolPtr msg, AtomCount argc, AtomPtr argv)
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
