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

// Class (shared) Globals
t_hashtab	*g_maxobject_classes = NULL;



/************************************************************************************/
#pragma mark -
#pragma mark Life Cycle


t_object *maxobject_new(t_symbol *s, long argc, t_atom *argv)
{
	t_maxobject			*x;
	t_maxobject_class	*c;
	long				attrstart = attr_args_offset(argc, argv);
	long				i;
	long				numinlets, numoutlets;
	
	hashtab_lookup(g_maxobject_classes, s, (t_object **)&c);
	if(!c){
		error("Cannot get class info for Objective-C Class");
		return NULL;
	}

	x = (t_maxobject *)object_alloc(c->this_max_class);
	if(x){
		Class	aClass = objc_getClass(c->objcclassname);

		// cache the class info
		x->maxobject_class = c;

		// every object gets a dumpout
		object_obex_store((void *)x, _sym_dumpout, (t_object *)outlet_new(x, NULL));

		// load up the objective-c class
		// we only pass arguments to the init method, not attributes and everything else
		x->me = [[aClass alloc] initWithObject:(t_object *)x name:s numArgs:attrstart andValues:argv];
		if(!x->me){
			error("MaxObject instantiation failed!");
			return NULL;
		}
		
		// now we do the real setup for the inlets that were defined in the init method
		// we do define the outlets in init, and the create after-the-fact here so that we can sort them
		// and not worry about creating them in reverse order in the ObjC class
		numinlets = [[x->me valueForKey:@"numInlets"] longValue];
		numoutlets = [[x->me valueForKey:@"numOutlets"] longValue];
		if(x->maxobject_class->isAudioProcessor){
			// inlets...
			dsp_setup((t_pxobject *)x, numinlets);
			// outlets...
			for(i=numoutlets-1; i>=0; i--){
				void		*outlet;
				t_symbol	*soutletname;
				char		*outletname;
				
				soutletname = [x->me getNameForOutletAtIndex:i];
				if(soutletname){
					outletname = soutletname->s_name;
					if(strlen(outletname) > strlen("signal"))
						outletname[strlen("signal")] = 0;
					if(!strcmp(outletname, "signal")){
						outlet = outlet_new((t_object *)x, "signal");
						[x->me setOutletPointer:outlet forIndex:i];
						continue;
					}
				}
				outlet = outlet_new((t_object *)x, 0);
				[x->me setOutletPointer:outlet forIndex:i];
			}
			x->audioInput = [[MaxAudioSignal alloc] initWithMaxNumChannels:numinlets];
			x->audioOutput = [[MaxAudioSignal alloc] initWithMaxNumChannels:numoutlets];
		}
		else{
			// inlets...
			for(i=numinlets-1; i>=1; i--){
				void *inlet = proxy_new((t_object *)x, i, &x->me->inletNum);
				[x->me setInletPointer:inlet forIndex:i];
			}
			// outlets...
			for(i=numoutlets-1; i>=0; i--){
				void *outlet = outlet_new((t_object *)x, 0);
				[x->me setOutletPointer:outlet forIndex:i];
			}
		}

		// process attributes
		attr_args_process(x, argc, argv); //handle attribute args

		// if the ObjC class has a post-init handler, we call that here
		maxobject_callmethod_withnoargs(x, "postInit");
	}
	return (t_object *)x;
}


void maxobject_free(t_maxobject *x)
{
	short	i;
	long	numinlets = [[x->me valueForKey:@"numInlets"] longValue];

	if(x->maxobject_class->isAudioProcessor)
		dsp_free((t_pxobject *)x);				// This _must_ be first for audio objects

	for(i=numinlets-1; i>=1; i--)
		freeobject([x->me getInletPointerForIndex:i]);

	[x->me release];
}


/************************************************************************************/
#pragma mark -
#pragma mark Message Bindings

// Create a C-Interface for these:

t_max_err maxobject_int(t_maxobject *x, long value)
{
	return (t_max_err)[x->me intMessage:value];
}


t_max_err maxobject_float(t_maxobject *x, double value)
{
	return (t_max_err)[x->me floatMessage:value];
}


t_max_err maxobject_bang(t_maxobject *x)
{
	return (t_max_err)[x->me bangMessage];
}

// All messages map to this when possible
t_max_err maxobject_anything(t_maxobject *x, t_symbol *s, long argc, t_atom *argv)
{
	char		cmethname[256];
	NSString	*methodName = nil;
	SEL			methodSelector = nil;

	strcpy(cmethname, s->s_name);
	strcat(cmethname, "TypedMessage:withNumArgs:andValues:");
	methodName = [[NSString alloc] initWithCString:cmethname];
	methodSelector = NSSelectorFromString(methodName);

	if([x->me respondsToSelector:methodSelector])
		return (t_max_err)objc_msgSend(x->me, methodSelector, s, argc, argv);
	else{
		// Rather than checking to see if the 'anything' method is handled, perhaps it would be faster
		//	to simply define an anything method in the MaxObject class, which would get called and do nothing 
		//	if the subclass didn't define it?
		[methodName release];
		methodName = [[NSString alloc] initWithCString:"anythingTypedMessage:withNumArgs:andValues:"];
		methodSelector = NSSelectorFromString(methodName);
		if([x->me respondsToSelector:methodSelector])
			return (t_max_err)objc_msgSend(x->me, methodSelector, s, argc, argv);
	}
	
	// At this point we've failed to call a TypedMessage of any kind, so we should just call a Message
		[methodName release];
		strcpy(cmethname, s->s_name);
		strcat(cmethname, "Message");
		methodName = [[NSString alloc] initWithCString:cmethname];
		methodSelector = NSSelectorFromString(methodName);
		if([x->me respondsToSelector:methodSelector])
			return (t_max_err)objc_msgSend(x->me, methodSelector);
	
	return MAX_ERR_GENERIC;
}


// A_CANT Cases
//	The problem Untyped methods, is that we can't find out the name of the message used at runtime (or if we can, it isn't obvious)
//	In that case we can't just use the anything-style dispatcher...
//	So we make special methods for the A_CANT cases, which should be limited in number and scope

t_max_err maxobject_assist(t_maxobject *x, void *b, long msg, long arg, char *dst)
{
	return (t_max_err)[x->me assistanceMessage:msg forIndex:arg withResultingString:dst];
}


t_max_err maxobject_dblclick(t_maxobject *x)
{
	return (t_max_err)[x->me doubleclickMessage];
}


t_max_err maxobject_fileusage(t_maxobject *x, void *w)
{
	return (t_max_err)[x->me fileusageMessageWithPointer:w];
}


#pragma mark -
#pragma mark Audio Support

// Perform (signal) Method - delay is a constant (not a signal)
/*
	Passed in: 
		1: object pointer
		2: vectorsize
		3: samplerate
		4: numinputs
		5: numoutputs
		6+: input vectors
		7+: output vectors
*/
#define MAX_NUM_INPUTS 32
#define MAX_NUM_OUTPUTS 32

t_int *maxobject_perform(t_int *w)
{
	t_maxobject		*x			= (t_maxobject *)(w[1]);
	int				numInputs	= (int)(w[2]);
	int				numOutputs	= (int)(w[3]);
	short			i;
	
	if(x->obj.z_disabled)
		goto out;
		
	// TODO: if these vector addresses aren't changing, then we should just set them up once down in the dsp method !!!
	for(i=0; i<numInputs; i++)
		[x->audioInput setSamplesForChannel:i withVector:x->audio_in[i]];
	for(i=0; i<numOutputs; i++)
		[x->audioOutput setSamplesForChannel:i withVector:x->audio_out[i]];
		
	x->audioInput->numChannels = numInputs;
	x->audioOutput->numChannels = numOutputs;
		
	[x->me processAudioWithInput:x->audioInput andOutput:x->audioOutput];
out:		
	return (w+4);
}


t_max_err maxobject_dsp(t_maxobject *x, t_signal **sp, short *count)
{
	long numinputs = [[x->me valueForKey:@"numInlets"] longValue];
	long numoutputs = [[x->me valueForKey:@"numOutlets"] longValue];
	short i, j, k;

	// TODO: This call sure is a hack, let's send it properly...
	maxobject_callmethod(x, "dspStartMessage", (long)sp, (t_atom *)count);
	
	[x->audioInput setValue:[NSNumber numberWithLong:sp[0]->s_sr] forKey:@"sr"];
	[x->audioOutput setValue:[NSNumber numberWithLong:sp[0]->s_sr] forKey:@"sr"];
	maxobject_callmethod_withlong(x, "setSr", sp[0]->s_sr);

	[x->audioInput setValue:[NSNumber numberWithLong:sp[0]->s_n] forKey:@"vs"];
	[x->audioOutput setValue:[NSNumber numberWithLong:sp[0]->s_n] forKey:@"vs"];
	
	for(i=0, j=0; i<numinputs; i++){
		if(count[i])
			j=i;
		x->audio_in[i] = sp[i]->s_vec;
	}
	numinputs = j+1;								// the actual number of connected inputs;
	
	// the value of i is intentionally held over from the last loop
	for(j=0, k=0; j<numoutputs; j++, i++){
		if(count[i])
			k=j;
		x->audio_out[j] = sp[i]->s_vec;
	}
	numoutputs = k+1;								// the actual number of connected outputs;
		
    dsp_add(maxobject_perform, 3, x, numinputs, numoutputs);
	return MAX_ERR_NONE;
}



#pragma mark -
#pragma mark Attribute Accessors

//	These methods are called for all attributes.  
//	If there is a custom accessor defined, then that is called.  
//	Otherwise we just set the value.
//	TODO: expand the number of accepted types

t_max_err maxobject_attrset(t_maxobject *x, void *attr, long argc, t_atom *argv)
{
	t_symbol			*namesym;
	char				cname[256];
	t_maxobject_attrs	*attrinfo;
	t_max_err			err;
	NSString			*attrName;

	namesym = (t_symbol *)object_method((t_object *)attr, gensym("getname"));
	strcpy(cname, namesym->s_name);
	strcat(cname, "Attribute");

	err = hashtab_lookup(x->maxobject_class->class_attributes, namesym, (t_object **)&attrinfo);
	if(!err){
		attrName = [[NSString alloc] initWithCString:cname];

		// check for the most common types first so that they are faster
		if(attrinfo->type == _sym_long)
			[x->me setValue:[NSNumber numberWithLong:atom_getlong(argv)] forKey:attrName];
		else if(attrinfo->type == _sym_float32)
			[x->me setValue:[NSNumber numberWithFloat:atom_getfloat(argv)] forKey:attrName];
		else if(argv->a_type == A_SYM)
			[x->me setSymbol:atom_getsym(argv) forKey:attrName];
		[attrName release];
	}
	return err;
}


t_max_err maxobject_attrget(t_maxobject *x, void *attr, long *argc, t_atom **argv)
{
	t_symbol			*namesym;
	char				cname[256];
	t_maxobject_attrs	*attrinfo;
	t_max_err			err;
	NSString			*attrName;

	namesym = (t_symbol *)object_method((t_object *)attr, gensym("getname"));
	strcpy(cname, namesym->s_name);
	strcat(cname, "Attribute");

	err = hashtab_lookup(x->maxobject_class->class_attributes, namesym, (t_object **)&attrinfo);
	if(!err){
		// TODO: currently only supporting single args
		if(*argv == 0){
			*argv = (t_atom *)sysmem_newptr(sizeof(t_atom));
			*argc = 1;
		}

		attrName = [[NSString alloc] initWithCString:cname];

		// check for the most common types first so that they are faster
		if(attrinfo->type == _sym_long)
			atom_setlong(*argv, [[x->me valueForKey:attrName] longValue]);
		else if(attrinfo->type == _sym_float32)
			atom_setfloat(*argv, [[x->me valueForKey:attrName] floatValue]);
		else if(attrinfo->type == _sym_symbol)
			atom_setsym(*argv, [x->me symbolForKey:attrName]);
		[attrName release];
	}
	return err;
}


#pragma mark -
#pragma mark ObjC Utilities

// The following set of functions is not as elegant as one might dream for
// It turns out that creating a single function with a ... argument is more cumbersome
// than usual for sending to the ObjC class

t_max_err maxobject_callmethod_withnoargs(t_maxobject *x, char *cmethname)
{
	NSString	*methodName = [[NSString alloc] initWithCString:cmethname];
	SEL			methodSelector = NSSelectorFromString(methodName);

	if([x->me respondsToSelector:methodSelector])
		return (t_max_err)objc_msgSend(x->me, methodSelector);

	[methodName release];
	return MAXOBJECTBRIDGE_ERR_NO_METHOD_FOUND;
}


t_max_err maxobject_calltypedmethod(t_maxobject *x, char *cmethname, t_symbol *s, long argc, t_atom *argv)
{
	NSString	*methodName = [[NSString alloc] initWithCString:cmethname];
	SEL			methodSelector = NSSelectorFromString(methodName);

	if([x->me respondsToSelector:methodSelector])
		return (t_max_err)objc_msgSend(x->me, methodSelector, s, argc, argv);

	[methodName release];
	return MAXOBJECTBRIDGE_ERR_NO_METHOD_FOUND;
}


t_max_err maxobject_callmethod(t_maxobject *x, char *cmethname, long argc, t_atom *argv)
{
	NSString	*methodName = [[NSString alloc] initWithCString:cmethname];
	SEL			methodSelector = NSSelectorFromString(methodName);

	if([x->me respondsToSelector:methodSelector])
		return (t_max_err)objc_msgSend(x->me, methodSelector, gensym(cmethname), argc, argv);

	[methodName release];
	return MAXOBJECTBRIDGE_ERR_NO_METHOD_FOUND;
}

t_max_err maxobject_method(t_maxobject *x, t_symbol *smethname, long argc, t_atom *argv)
{
	return maxobject_callmethod(x, smethname->s_name, argc, argv);
}


t_max_err maxobject_callmethod_withlong(t_maxobject *x, char *cmethname, long value)
{
	NSString	*methodName = [[NSString alloc] initWithCString:cmethname];
	SEL			methodSelector = NSSelectorFromString(methodName);

	if([x->me respondsToSelector:methodSelector])
		return (t_max_err)objc_msgSend(x->me, methodSelector, value);

	[methodName release];
	return MAXOBJECTBRIDGE_ERR_NO_METHOD_FOUND;
}

