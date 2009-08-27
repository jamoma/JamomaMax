/*	
 *	applescript
 *	max object for executing applescripts
 *	by timothy place (from tap.tools)
 *	tim@electrotap.com
 *	copyright © 2008
 */
 
#import "MaxObject/MaxObject.h"
#import "MaxObject/maxobjectbridge.h"


@interface Applescript : MaxObject 
{
	@public
		t_symbol		*filename;
	@private
		NSAppleScript	*appleScriptObject;
}		
- (id) initWithObject:(t_object *)x name:(t_symbol *)s numArgs:(long)argc andValues:(t_atom *)argv;
- (void)dealloc;
- (t_max_err) bangMessage;
- (t_max_err) readTypedMessage:(t_symbol *)s withNumArgs:(long)argc andValues:(t_atom *)argv;
- (t_max_err) readMessage:(t_symbol*)s;
- (void) doRead:(t_symbol *)s withNumArgs:(long)argc andValues:(t_atom *)argv;
- (t_max_err) scriptTypedMessage:(t_symbol *)s withNumArgs:(long)argc andValues:(t_atom *)argv;
@end


// Entry Point when loaded by Max
int main(void)
{
	[MaxObject createMaxClassWithName:"applescript" fromObjcClassWithName:"Applescript"];
	return 0;
}


/********************************************************************************************************/
@implementation Applescript

- (id) initWithObject:(t_object *)x name:(t_symbol *)s numArgs:(long)argc andValues:(t_atom *)argv
{
	[super initWithObject:x name:s numArgs:argc andValues:argv];
	[self createInletWithIndex:0 named:"input"		withAssistanceMessage:"bang executes script, other messages set it up."];
	[self createOutletWithIndex:0 named:"result"	withAssistanceMessage:"data returned from the script"];

	atom_arg_getsym(&filename, 0, argc, argv);
	if(filename)
		[self readMessage:filename];

	return self;
}

- (void)dealloc
{
    [super dealloc];
}

/********************************************************************************************************/


- (t_max_err) bangMessage
{
	NSDictionary			*errorInfo = NULL;
	NSAppleEventDescriptor	*result = NULL;
	NSString				*resultString = NULL;
	char					*resultCString = NULL;
	
	if(appleScriptObject == nil)
		return MAX_ERR_GENERIC;

	result = [appleScriptObject executeAndReturnError:&errorInfo];
	if(result){
		resultString = [result stringValue];
		resultCString = (char*)[resultString cString];
		if(resultCString)
			[self sendMessage: gensym(resultCString) toOutletNamed: _sym_result];
	}
	return MAX_ERR_NONE;
}

- (t_max_err) readTypedMessage:(t_symbol *)s withNumArgs:(long)argc andValues:(t_atom *)argv
{
	if(argc)
		defer(maxObjectBridge, (method)maxobject_method, gensym("doRead:withNumArgs:andValues:"), 1, argv);
	else
		defer(maxObjectBridge, (method)maxobject_method, gensym("doRead:withNumArgs:andValues:"), 0, argv);
	return MAX_ERR_NONE;
}

- (t_max_err) readMessage:(t_symbol*)s
{
	t_atom a;
	
	atom_setsym(&a, s);
	return [self readTypedMessage:nil withNumArgs:1 andValues:&a];
}

- (void) doRead:(t_symbol *)s withNumArgs:(long)argc andValues:(t_atom *)argv
{
	char 			aFilename[256];			// for storing the name of the file locally
	char 			fullpath[512];			// path and name passed on to the xml parser
	char			fullpath2[512];
	short 			path;					// pathID#
	long			outtype;				// the file type that is actually true
	char 			*temppath;
	NSString 		*formattedPath;

	// FIND THE FILE WE WANT TO READ
	if(!argc){
		if(open_dialog(aFilename, &path, &outtype ,NULL, -1))				// Returns 0 if successful
			return;															// User Cancelled
	}
	else{
		strcpy(aFilename, atom_getsym(argv)->s_name);						// Copy symbol argument to a local string
		if(locatefile_extended(aFilename, &path, &outtype, NULL, -1)){		// Returns 0 if successful
			object_error(maxObjectBridge, "file not found - %s", s->s_name);
			return;															// Not found
		}
	}

	path_topathname(path, aFilename, fullpath);
	temppath = strchr(fullpath, ':');
	*temppath = '\0';
	temppath += 1;

	// at this point temppath points to the path after the volume, and out_filepath points to the volume
	sprintf(fullpath2, "/Volumes/%s%s", fullpath, temppath);

	formattedPath = [[NSString alloc] initWithUTF8String:fullpath2];

	if(appleScriptObject != nil)
		[appleScriptObject release];	
	appleScriptObject = [[NSAppleScript alloc] initWithContentsOfURL:[NSURL fileURLWithPath:formattedPath] error:nil];
}


- (t_max_err) scriptTypedMessage:(t_symbol *)s withNumArgs:(long)argc andValues:(t_atom *)argv
{
	char		text[ATOM_MAX_STRLEN];
	NSString	*source;
	
	if(appleScriptObject != nil)
		[appleScriptObject release];
	
	atoms_totext(text, argc, argv);
	source = [[NSString alloc] initWithUTF8String:text];
	appleScriptObject = [[NSAppleScript alloc] initWithSource:source];
	[source release];
	return MAX_ERR_NONE;
}

@end
