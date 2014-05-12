/** @file
 *
 * @ingroup implementationMaxExternals
 *
 * @brief j.modular - external to manage local and distant application
 *
 * @details
 *
 * @authors Théo de la Hogue, Trond Lossius
 *
 * @copyright Copyright © 2010 Théo de la Hogue @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
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
void	WrappedApplicationClass_new(TTPtr self, long argc, t_atom *argv);
void	WrappedApplicationClass_free(TTPtr self);

void	modular_assist(TTPtr self, void *b, long msg, long arg, char *dst);

void	modular_protocol_setup(TTPtr self, t_symbol *msg, long argc, t_atom *argv);

void	modular_namespace_read(TTPtr self, t_symbol *msg, long argc, t_atom *argv);
void	modular_namespace_doread(TTPtr self, t_symbol *msg, long argc, t_atom *argv);

void	modular_namespace_write(TTPtr self, t_symbol *msg, long argc, t_atom *argv);
void	modular_namespace_dowrite(TTPtr self, t_symbol *msg, long argc, t_atom *argv);

int TTCLASSWRAPPERMAX_EXPORT main(void)
{
	ModularSpec *spec = new ModularSpec;
	spec->_wrap = &WrapTTApplicationClass;
	spec->_new = &WrappedApplicationClass_new;
	spec->_any = NULL;
	spec->_free = &WrappedApplicationClass_free;
	
	return wrapTTModularClassAsMaxClass(kTTSym_Application, "j.modular", NULL, spec);
}

void WrapTTApplicationClass(WrappedClassPtr c)
{
	class_addmethod(c->maxClass, (method)modular_assist,					"assist",						A_CANT, 0L);
	
	class_addmethod(c->maxClass, (method)modular_protocol_setup,			"protocol/setup",				A_GIMME, 0);
	
	class_addmethod(c->maxClass, (method)modular_namespace_read,			"namespace/read",				A_GIMME, 0);
    
    class_addmethod(c->maxClass, (method)modular_namespace_write,			"namespace/write",				A_GIMME, 0);
}

void WrappedApplicationClass_new(TTPtr self, long argc, t_atom *argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTSymbol					applicationName;
	TTSymbol					protocolName;
	TTObject                    protocol, anXmlHandler;
	TTValue						v, args, out;
 	long						attrstart = attr_args_offset(argc, argv);			// support normal arguments
		
	// j.modular can handle the local application (1 argument to declare a protocol to use)
	if (attrstart <= 1) {
		
		// our wrapped object is the local application
        x->wrappedObject = accessApplicationLocal;
        x->wrappedObject.get("name", v);
		applicationName = v[0];
		
		if (attrstart == 1)
			protocolName = TTSymbol(atom_getsym(argv)->s_name);
		
	}
	// or it can handle a distant application (2 arguments to declare the name of the distant application and the protocol to use)
	else if (attrstart == 2) {
		
		// our wrapped object is a distant application
		applicationName = TTSymbol(atom_getsym(argv)->s_name);
		x->wrappedObject = accessApplication(applicationName);
		
		// if the application doesn't exists
		if (!x->wrappedObject.valid()) {
			
			// create the application
            TTModularApplicationManager->sendMessage("ApplicationInstantiateDistant", applicationName, out);
			x->wrappedObject = out[0];
		}
		
		protocolName = TTSymbol(atom_getsym(argv+1)->s_name);
        
        // set the type of the application depending on the plugin
        if (protocolName == TTSymbol("Minuit"))
            x->wrappedObject.set(kTTSym_type, TTSymbol("mirror"));
        else
            x->wrappedObject.set(kTTSym_type, TTSymbol("proxy"));
	}
	
	// j.modular handle only one protocol per application
	if (protocolName != kTTSymEmpty) {
        
        protocol = accessProtocol(protocolName);
		
		// check if the protocol has been loaded
		if (!protocol.valid()) {
            
            if (TTModularApplicationManager->sendMessage("ProtocolInstantiate", protocolName, out))
                object_error((t_object*)x, "the %s protocol is not available", protocolName.c_str());
            
            protocol = out[0];
        }

        // register the application to the protocol
        protocol.send("ApplicationRegister", applicationName, out);

        // run this protocol
        protocol.send("Run");
	}
	
	// Prepare extra data
	x->extra = (t_extra*)malloc(sizeof(t_extra));
	EXTRA->protocolName = protocolName;
	
	// create internal TTXmlHandler
	anXmlHandler = TTObject(kTTSym_XmlHandler);
	x->internals->append(kTTSym_XmlHandler, anXmlHandler);
	anXmlHandler.set(kTTSym_object, x->wrappedObject);
	
	if (attrstart && argv) attr_args_process(x, argc, argv);
}

void WrappedApplicationClass_free(TTPtr self)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
    TTObject    localApplication = accessApplicationLocal;
    
	// don't release the local application
	if (!(x->wrappedObject == localApplication)) {
        
        TTValue v, out;
        x->wrappedObject.get("name", v);
        x->wrappedObject = TTObject();
		TTModularApplicationManager->sendMessage("ApplicationRelease", v, out);
    }
	
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

void modular_protocol_setup(TTPtr self, t_symbol *msg, long argc, t_atom *argv)
{
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTSymbol    applicationName, parameterName;
	TTObject	aProtocol;
	TTValue		v, out, parameterValue;
	long        ac;
	t_atom      *av;
	TTErr		err;
	
	// get the protocol object
    aProtocol = accessProtocol(EXTRA->protocolName);
	if (aProtocol.valid()) {
		
		if (x->wrappedObject.valid()) {
            
            if (argc && argv) {
                
                // select this application
                x->wrappedObject.get(kTTSym_name, v);
                applicationName = v[0];
                aProtocol.send("ApplicationSelect", applicationName, out);
                
                // stop protocol
                aProtocol.send("Stop");
                
                // set parameters
                parameterName = TTSymbol(atom_getsym(argv)->s_name);
                jamoma_ttvalue_from_Atom(parameterValue, _sym_nothing, argc-1, argv+1);
                if (aProtocol.set(parameterName, parameterValue))
                    object_error((t_object*)x, "%s is not a parameter of %s protocol", parameterName.c_str(), EXTRA->protocolName.c_str());
                
                // run protocol
                aProtocol.send("Run");
            }
            // or if no arg : dumpout the current setup
            else {
                
                aProtocol.get("parameterNames", out);
                for (TTElementIter it = out.begin() ; it != out.end() ; it++) {
                    
                    TTSymbol name = TTElement(*it);
                    aProtocol.get(parameterName, parameterValue);
                    parameterValue.prepend(name);
                    ac = 0;
                    av = NULL;
                    jamoma_ttvalue_to_Atom(parameterValue, &ac, &av);
                    object_obex_dumpout(self, gensym("protocol/setup"), ac, av);
                }
            }
        }
		else
			object_error((t_object*)x, "doesn't handle any application");
	}
}

void modular_namespace_read(TTPtr self, t_symbol *msg, long argc, t_atom *argv)
{
	defer(self, (method)modular_namespace_doread, msg, argc, argv);
}

void modular_namespace_doread(TTPtr self, t_symbol *msg, long argc, t_atom *argv)
{	
	WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	TTValue		o, v, none;
	TTSymbol	fullpath;
	TTObject    anXmlHandler;
	TTErr		tterr;
	
	if (x->wrappedObject.valid()) {
		
		fullpath = jamoma_file_read((t_object*)x, argc, argv, NULL);
		v.append(fullpath);
		
		tterr = x->internals->lookup(kTTSym_XmlHandler, o);
		
		if (!tterr) {
			
			anXmlHandler = o[0];
			
			critical_enter(0);
			tterr = anXmlHandler.send(kTTSym_Read, v, none);
			critical_exit(0);
			
			if (!tterr)
				object_obex_dumpout(self, _sym_read, argc, argv);
			else
				object_obex_dumpout(self, _sym_error, 0, NULL);
		}
	}
}

void modular_namespace_write(TTPtr self, t_symbol *msg, long argc, t_atom *argv)
{
    defer(self, (method)modular_namespace_dowrite, msg, argc, argv);
}

void modular_namespace_dowrite(TTPtr self, t_symbol *msg, long argc, t_atom *argv)
{
    WrappedModularInstancePtr	x = (WrappedModularInstancePtr)self;
	char 		filename[MAX_FILENAME_CHARS];
	TTSymbol	fullpath;
	TTValue		o, v, none;
	TTObject    anXmlHandler;
	TTErr		tterr;
	
	if (x->wrappedObject.valid()) {
		
		// Default XML File Name
		snprintf(filename, MAX_FILENAME_CHARS, "namespace.xml");
		fullpath = jamoma_file_write((t_object*)x, argc, argv, filename);
		v.append(fullpath);
		
		tterr = x->internals->lookup(kTTSym_XmlHandler, o);
		
		if (!tterr) {
			anXmlHandler = o[0];
			
			critical_enter(0);
			tterr = anXmlHandler.send(kTTSym_Write, v, none);
			critical_exit(0);
			
			if (!tterr)
				object_obex_dumpout(self, _sym_write, argc, argv);
			else
				object_obex_dumpout(self, _sym_error, 0, NULL);
		}
	}
}
