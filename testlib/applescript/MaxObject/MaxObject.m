/*
	==============================================================================

	This file is part of the ObjectiveMax Library and Framework
	An Objective-C API for writing Max external objects
	Copyright 2007 by Electrotap, LLC.

	------------------------------------------------------------------------------

	ObjectiveMax can be redistributed and/or modified under the terms of the
	GNU General Public License, as published by the Free Software Foundation;
	either version 2 of the License, or (at your option) any later version.

	ObjectiveMax is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with ObjectiveMax; if not, visit www.gnu.org/licenses or write to the
	Free Software Foundation, Inc., 59 Temple Place, Suite 330, 
	Boston, MA 02111-1307 USA

	------------------------------------------------------------------------------

	If you'd like to release a closed-source product which uses ObjectiveMax, 
	commercial licenses are also available.  Visit 
		http://electrotap.com/ObjectiveMax
	for more information.

	==============================================================================
*/

#import "MaxObject.h"
#import "maxobjectbridge.h"


@implementation MaxObject

//int main(void)
+ (t_class *) createMaxClassWithName:(char*)maxclassname fromObjcClassWithName:(char*)objcclassname
{
	long				attrflags = 0;
	t_class				*c;
	t_object			*attr;
	t_maxobject_class	*this_maxobject_class = (t_maxobject_class *)sysmem_newptr(sizeof(t_maxobject_class));
	t_hashtab			*class_attributes;
	Class				aClass = objc_getClass(objcclassname);
	
	common_symbols_init();
	class_attributes = hashtab_new(0);
	
	this_maxobject_class->isAudioProcessor = false;

	c = class_new(maxclassname, (method)maxobject_new, (method)maxobject_free, (short)sizeof(t_maxobject), (method)0L, A_GIMME, 0);

	// Add methods and attributes from the Objective-C class (and the classes it inherits from)
	while(aClass){
		void						*iterator = NULL;
		struct objc_method_list		*methodlist = class_nextMethodList(aClass, &iterator);
		struct objc_ivar_list		*varlist = aClass->ivars;
		int							i;

		while(methodlist != nil){
			for(i=0; i < methodlist->method_count; i++){				
				char methodname[256];
				char *loc;
				char *start;
				strncpy(methodname, (const char *)methodlist->method_list[i].method_name, 255);
				loc = strchr(methodname, ':');
				if(loc)//{
					*loc = 0;
					
					// floatMessage and intMessage are complete method names
					if(!strcmp(methodname, "floatMessage"))
						class_addmethod(c, (method)maxobject_float,	"float",	A_FLOAT, 0);
					else if(!strcmp(methodname, "intMessage"))
						class_addmethod(c, (method)maxobject_int,	"int",		A_LONG, 0);
					else if(!strcmp(methodname, "bangMessage"))
						class_addmethod(c, (method)maxobject_bang,	"bang",		0);
					else if(!strcmp(methodname, "processAudioWithInput")){
						class_addmethod(c, (method)maxobject_dsp,	"dsp",		A_CANT, 0);
						this_maxobject_class->isAudioProcessor = true;
					}
					else if(!strcmp(methodname, "sendMessage"))
						;	// do nothing, we just filter this one out
					else{
						if(strlen("TypedMessage") < strlen(methodname)){
							start = methodname + (strlen(methodname) - strlen("TypedMessage"));
							if(!strcmp(start, "TypedMessage")){
								*start = 0;
								class_addmethod(c, (method)maxobject_anything,	methodname, A_GIMME, 0);
							}
							else
								goto tryMessage;
						}
						else if(strlen("Message") < strlen(methodname)){
//							BOOL tryagain = YES;
tryMessage:
							start = methodname + (strlen(methodname) - strlen("Message"));
							if(!strcmp(start, "Message")){
								*start = 0;
								
								// Here is the table of handled A_CANT methods
								if(!strcmp(methodname, "assistance"))
									class_addmethod(c, (method)maxobject_assist,	"assist", A_CANT, 0);
								else if(!strcmp(methodname, "doubleclick"))
									class_addmethod(c, (method)maxobject_dblclick,	"dblclick",	A_CANT, 0);
								else if(!strcmp(methodname, "fileusage"))
									class_addmethod(c, (method)maxobject_fileusage,	"fileusage",	A_CANT, 0);
								else{
//									if(tryagain){
//										tryagain = NO;
//										goto tryMessage;
//									}
//									else
										class_addmethod(c, (method)maxobject_anything, methodname, A_GIMME, 0);
								}
							}
						}
						// TODO: add A_GIMMEBACK method type		
					}
//				}
				// The bangMessage has no arguments, and thus no trailing colon
//				else if(!strcmp(methodname, "bangMessage"))
//					class_addmethod(c, (method)maxobject_bang,	"bang",		0);
			}
			methodlist = class_nextMethodList(aClass, &iterator);
		}
		// Add attributes from the Objective-C class's @public members
		if(varlist){
			for(i=0; i < varlist->ivar_count; i++){
				struct	objc_ivar	var = varlist->ivar_list[i];
				char	name[256];
				char	*tmp;
				
				strncpy(name, var.ivar_name, 255);
				tmp = strrchr(name, 'A');	// find the last 'A' to see if we have the word Attribute
				if(tmp){
					if(!strcmp(tmp, "Attribute")){
						*tmp = 0;
						if(!strcmp(var.ivar_type, @encode(long))){
							t_maxobject_attrs	*attrinfo = (t_maxobject_attrs *)sysmem_newptr(sizeof(t_maxobject_attrs));
							attrinfo->offset = var.ivar_offset;
							attrinfo->type = _sym_long;
							attrinfo->size = sizeof(long);
							hashtab_store(class_attributes, gensym(name), (t_object *)attrinfo);

							attr = attribute_new(name, attrinfo->type, attrflags, (method)maxobject_attrget, (method)maxobject_attrset);
							class_addattr(c, attr);
						}
						else if(!strcmp(var.ivar_type, @encode(char))){
							t_maxobject_attrs	*attrinfo = (t_maxobject_attrs *)sysmem_newptr(sizeof(t_maxobject_attrs));
							attrinfo->offset = var.ivar_offset;
							attrinfo->type = _sym_char;
							attrinfo->size = sizeof(char);
							hashtab_store(class_attributes, gensym(name), (t_object *)attrinfo);

							attr = attribute_new(name, attrinfo->type, attrflags, (method)maxobject_attrget, (method)maxobject_attrset);
							class_addattr(c, attr);
						}
						else if(!strcmp(var.ivar_type, @encode(float))){
							t_maxobject_attrs	*attrinfo = (t_maxobject_attrs *)sysmem_newptr(sizeof(t_maxobject_attrs));
							attrinfo->offset = var.ivar_offset;
							attrinfo->type = _sym_float32;
							attrinfo->size = sizeof(float);
							hashtab_store(class_attributes, gensym(name), (t_object *)attrinfo);

							attr = attribute_new(name, attrinfo->type, attrflags, (method)maxobject_attrget, (method)maxobject_attrset);
							class_addattr(c, attr);
						}
						else if(!strcmp(var.ivar_type, @encode(double))){
							t_maxobject_attrs	*attrinfo = (t_maxobject_attrs *)sysmem_newptr(sizeof(t_maxobject_attrs));
							attrinfo->offset = var.ivar_offset;
							attrinfo->type = _sym_float64;
							attrinfo->size = sizeof(double);
							hashtab_store(class_attributes, gensym(name), (t_object *)attrinfo);

							attr = attribute_new(name, attrinfo->type, attrflags, (method)maxobject_attrget, (method)maxobject_attrset);
							class_addattr(c, attr);
						}
						else if(!strcmp(var.ivar_type, @encode(t_symbol*))){
							t_maxobject_attrs	*attrinfo = (t_maxobject_attrs *)sysmem_newptr(sizeof(t_maxobject_attrs));
							attrinfo->offset = var.ivar_offset;
							attrinfo->type = _sym_symbol;
							attrinfo->size = sizeof(t_symbol *);
							hashtab_store(class_attributes, gensym(name), (t_object *)attrinfo);

							attr = attribute_new(name, attrinfo->type, attrflags, (method)maxobject_attrget, (method)maxobject_attrset);
							class_addattr(c, attr);
						}
						else if(!strcmp(var.ivar_type, @encode(t_atom*))){
							t_maxobject_attrs	*attrinfo = (t_maxobject_attrs *)sysmem_newptr(sizeof(t_maxobject_attrs));
							attrinfo->offset = var.ivar_offset;
							attrinfo->type = _sym_atom;
							attrinfo->size = sizeof(t_atom *);
							hashtab_store(class_attributes, gensym(name), (t_object *)attrinfo);

							attr = attribute_new(name, attrinfo->type, attrflags, (method)maxobject_attrget, (method)maxobject_attrset);
							class_addattr(c, attr);
						}
						else if(!strcmp(var.ivar_type, @encode(t_object*))){
							t_maxobject_attrs	*attrinfo = (t_maxobject_attrs *)sysmem_newptr(sizeof(t_maxobject_attrs));
							attrinfo->offset = var.ivar_offset;
							attrinfo->type = _sym_object;
							attrinfo->size = sizeof(t_object *);
							hashtab_store(class_attributes, gensym(name), (t_object *)attrinfo);
							attr = attribute_new(name, attrinfo->type, attrflags, (method)maxobject_attrget, (method)maxobject_attrset);
							class_addattr(c, attr);
						}
						
						// TODO: Add array attr types here.
					}
				}
			}
		}
		aClass = aClass->super_class;
	}
	
	class_addmethod(c, (method)object_obex_dumpout, "dumpout", A_CANT, 0);
	if(this_maxobject_class->isAudioProcessor)
		class_dspinit(c);
	class_register(CLASS_BOX, c);

	if(!g_maxobject_classes)
		g_maxobject_classes = hashtab_new(0);
	this_maxobject_class->this_max_class = c;
	this_maxobject_class->class_attributes = class_attributes;
	strcpy(this_maxobject_class->objcclassname, objcclassname);
	hashtab_store(g_maxobject_classes, gensym(maxclassname), (t_object *)this_maxobject_class);
	return c;
}



- (id) initWithObject:(t_object *)x name:(t_symbol *)s numArgs:(long)argc andValues:(t_atom *)argv
{
	[super init];
	maxObjectBridge = x;		// pointer to the max t_object for this instance

	// create hashtabs for inlet and outlet name lookups
	inletNameIndex = hashtab_new(17);
	outletNameIndex = hashtab_new(17);
	return self;
}


- (id) init
{
	[super init];
	inletNameIndex = hashtab_new(17);
	outletNameIndex = hashtab_new(17);
	return self;
}


- (void) dealloc
{
	short i;
	
	object_method(inletNameIndex, gensym("chuck"));
	object_method(outletNameIndex, gensym("chuck"));

	for(i=0; i<numInlets; i++){
		if(inletAssistance[i])
			free(inletAssistance[i]);
	}
	for(i=0; i<numOutlets; i++){
		if(outletAssistance[i])
			free(outletAssistance[i]);
	}
	
	free(inlets);
	free(inletNames);
	free(inletAssistance);
	free(outlets);
	free(outletNames);
	free(outletAssistance);

	[super dealloc];
}


- (t_max_err) createInletWithIndex:(long)indexNum named:(char*)cname withAssistanceMessage:(char*)assist
{
	if(indexNum >= numInlets)
		numInlets = indexNum+1;

	if(inlets){
		inlets = (void**)realloc(inlets, sizeof(void*) * numInlets);
		inletNames = (t_symbol**)realloc(inletNames, sizeof(t_symbol*) * numInlets);
		inletAssistance = (char**)realloc(inletAssistance, sizeof(char*) * numInlets);		
	}
	else{
		inlets = (void**)malloc(sizeof(void*) * numInlets);
		inletNames = (t_symbol**)malloc(sizeof(t_symbol*) * numInlets);
		inletAssistance = (char**)malloc(sizeof(char*) * numInlets);
	}

	if(cname)
		inletNames[indexNum] = gensym(cname);
	else
		inletNames[indexNum] = _sym_nothing;

	inletAssistance[indexNum] = malloc(strlen(assist)+1);
	strcpy(inletAssistance[indexNum], assist);
	hashtab_store(inletNameIndex, gensym(cname), (t_object *)indexNum);
	
	return MAX_ERR_NONE;
}


- (t_max_err) createOutletWithIndex:(long)indexNum named:(char*)cname withAssistanceMessage:(char*)assist
{
	if(indexNum >= numOutlets)
		numOutlets = indexNum+1;

	if(outlets){
		outlets = (void**)realloc(outlets, sizeof(void*) * numOutlets);
		outletNames = (t_symbol**)realloc(outletNames, sizeof(t_symbol*) * numOutlets);
		outletAssistance = (char**)realloc(outletAssistance, sizeof(char*) * numOutlets);		
	}
	else{
		outlets = (void**)malloc(sizeof(void*) * numOutlets);
		outletNames = (t_symbol**)malloc(sizeof(t_symbol*) * numOutlets);
		outletAssistance = (char**)malloc(sizeof(char*) * numOutlets);
	}

	if(cname)
		outletNames[indexNum] = gensym(cname);
	else
		outletNames[indexNum] = _sym_nothing;

	outletAssistance[indexNum] = malloc(strlen(assist)+1);
	strcpy(outletAssistance[indexNum], assist);	
	hashtab_store(outletNameIndex, gensym(cname), (t_object *)indexNum);
	return MAX_ERR_NONE;
}

- (t_symbol *) getNameForInletAtIndex:(long)indexNum
{
	return inletNames[indexNum];
}

- (t_symbol *) getNameForOutletAtIndex:(long)indexNum
{
	return outletNames[indexNum];
}

- (void) setInletPointer:(void*)ptr forIndex:(long)indexNum
{
	inlets[indexNum] = ptr;
}

- (void) setOutletPointer:(void*)ptr forIndex:(long)indexNum
{
	outlets[indexNum] = ptr;
}

- (t_object *)	getInletPointerForIndex:(long)indexNum
{
	return (t_object *)inlets[indexNum];
}

- (t_object *)	getOutletPointerForIndex:(long)indexNum
{
	return (t_object *)outlets[indexNum];
}


- (t_max_err) sendMessage:(t_symbol *)s withNumArgs:(long)argc andValues:(t_atom *)argv toOutlet:(long)indexNum
{
	outlet_anything(outlets[indexNum], s, argc, argv);
	return MAX_ERR_NONE;
}

- (t_max_err) sendMessage:(t_symbol *)s withNumArgs:(long)argc andValues:(t_atom *)argv toOutletNamed:(t_symbol *)outletName 
{
	long	indexNum;
	
	hashtab_lookup(outletNameIndex, outletName, (t_object * *)&indexNum);
	outlet_anything(outlets[indexNum], s, argc, argv);
	return MAX_ERR_NONE;
}


- (t_max_err) sendMessage:(t_symbol *)s toOutlet:(long)indexNum
{
	outlet_anything(outlets[indexNum], s, 0, NULL);
	return MAX_ERR_NONE;
}

- (t_max_err) sendMessage:(t_symbol *)s toOutletNamed:(t_symbol *)outletName 
{
	long	indexNum;
	
	hashtab_lookup(outletNameIndex, outletName, (t_object * *)&indexNum);
	outlet_anything(outlets[indexNum], s, 0, NULL);
	return MAX_ERR_NONE;
}


- (t_max_err) sendInt:(long)value toOutlet:(long)indexNum
{
	outlet_float(outlets[indexNum], value);
	return MAX_ERR_NONE;
}

- (t_max_err) sendInt:(long)value toOutletNamed:(t_symbol*)outletName
{
	long	indexNum;
	
	hashtab_lookup(outletNameIndex, outletName, (t_object * *)&indexNum);
	outlet_float(outlets[indexNum], value);
	return MAX_ERR_NONE;
}


- (t_max_err) sendFloat:(double)value toOutlet:(long)indexNum
{
	outlet_float(outlets[indexNum], value);
	return MAX_ERR_NONE;
}

- (t_max_err) sendFloat:(double)value toOutletNamed:(t_symbol*)outletName
{
	long	indexNum;
	
	hashtab_lookup(outletNameIndex, outletName, (t_object * *)&indexNum);
	outlet_float(outlets[indexNum], value);
	return MAX_ERR_NONE;
}


// Provide Max with Assistance Strings
// This method may be overriden by subclasses for a more dynamic behavior
- (t_max_err) assistanceMessage:(long)msg forIndex:(long)arg withResultingString:(char*)dst
{
	// Inlets
	if(msg==1){
		if(inletAssistance[arg])
			strcpy(dst, inletAssistance[arg]);
		else
			strcpy(dst, "input");
	}
	// Outlets
	else if(msg==2){
		if(arg == numOutlets)
			strcpy(dst, "dumpout");
		else if(outletAssistance[arg])
			strcpy(dst, outletAssistance[arg]);
		else
			strcpy(dst, "output");
	}
	return MAX_ERR_NONE;
}


// NOTE: this method is also mirrored in the TTBlue Library
- (void) setLong:(long)value forKey:(NSString *)key
{
	[self setValue:[NSNumber numberWithLong:value] forKey:key];
}

- (long) longForKey:(NSString *)key
{
	return [[self valueForKey:key] longValue];
}

- (void) setFloat:(float)value forKey:(NSString *)key;
{
	[self setValue:[NSNumber numberWithFloat:value] forKey:key];
}

- (float) floatForKey:(NSString *)key
{
	return [[self valueForKey:key] floatValue];
}

// TODO: This method is untested
- (void) setSymbol:(t_symbol*)value forKey:(NSString *)key
{
	// The built-in functions for dealing with values seem to be hostile to t_symbols
	// So we roll our own attribute accessor interface
	NSString	*methodName;
	SEL			methodSelector = nil;
	char		*ckey;
	char		cmethname[256];

	ckey = (char*)[key UTF8String];
	strcpy(cmethname, "set");
	strcat(cmethname, ckey);
	cmethname[3] = toupper(cmethname[3]);
	strcat(cmethname, ":");
	methodName = [[NSString alloc] initWithUTF8String:cmethname];
	methodSelector = NSSelectorFromString(methodName);

	if([self respondsToSelector:methodSelector])
		objc_msgSend(self, methodSelector, value);
	else
		// If no accessor method is found, then we set the value directly
		object_setInstanceVariable(self, [key cString], (void *)value);
	[methodName release];
}

// TODO: This method is untested
- (t_symbol*) symbolForKey:(NSString *)key
{
	// The built-in functions for dealing with values seem to be hostile to t_symbols
	// So we roll our own attribute accessor interface
	SEL			 methodSelector = NSSelectorFromString(key);
	t_symbol	*value = NULL;
	
	if([self respondsToSelector:methodSelector])
		return (t_symbol *)objc_msgSend(self, methodSelector, value);
	else
		// If no accessor method is found, then we get the value directly
		object_getInstanceVariable(self, [key cString], (void **)&value);
	return value;
}


- (void) postMessage:(char*)string, ...
{
	va_list argumentList;
	char	formattedString[2048];
	
	va_start(argumentList, string);
	vsnprintf(formattedString, 2048, string, argumentList);
	object_post(maxObjectBridge, formattedString);
	va_end(argumentList);
}


- (void) postWarning:(char*)string, ...
{
	va_list argumentList;
	char	formattedString[2048];
	
	va_start(argumentList, string);
	vsnprintf(formattedString, 2048, string, argumentList);
	object_warn(maxObjectBridge, formattedString);
	va_end(argumentList);
}


- (void) postError:(char*)string, ...
{
	va_list argumentList;
	char	formattedString[2048];
	
	va_start(argumentList, string);
	vsnprintf(formattedString, 2048, string, argumentList);
	object_error(maxObjectBridge, formattedString);
	va_end(argumentList);
}


@end
