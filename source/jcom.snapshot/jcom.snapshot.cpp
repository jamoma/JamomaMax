/*
 * jcom.snapshot
 * External for Jamoma: capture, recall, transform, and manipulate global snapshots
 * By Timothy Place, Copyright 2009
 *
 * License: This code is licensed under the terms of the GNU LGPL
 * http://www.gnu.org/licenses/lgpl.html
 */

#include "Jamoma.h"

class SnapshotParameterValue {
public:
    TTFloat64   value;
    ObjectPtr   parameter;

    SnapshotParameterValue(TTFloat64& f, ObjectPtr o):
        value(f),
        parameter(o)
    {;}


};

// A vector of 64-bit floats used to represent a given snapshot
typedef vector<SnapshotParameterValue>  Snapshot;
typedef Snapshot::iterator              SnapshotIter;
typedef Snapshot*                       SnapshotPtr;

// A vector (or collection) of snapshots
typedef vector<SnapshotPtr>             SnapshotCollection;
typedef SnapshotCollection::iterator    SnapshotCollectionIter;
typedef SnapshotCollection*             SnapshotCollectionPtr;

// Data Structure for this object
typedef struct {
    Object                  ob;
    TTNodeDirectoryPtr		tree;
    SnapshotCollectionPtr   snapshots;
    SymbolPtr               excludes[128];  // list of parameter and container names to exclude from snapshots
    TTInt32                 excludeSize;
} TTModSnapshot;
typedef TTModSnapshot* TTModSnapshotPtr;


// Prototypes
TTPtr       TTModSnapshotNew    (SymbolPtr name, AtomCount argc, AtomPtr argv);
void        TTModSnapshotFree   (TTModSnapshotPtr self);
MaxErr      TTModSnapshotNotify (TTModSnapshotPtr self, SymbolPtr s, SymbolPtr msg, void *sender, void *data);
void        TTModSnapshotAssist (TTModSnapshotPtr self, void *b, long m, long a, char *s);
void        TTModSnapshotDump   (TTModSnapshotPtr self);
void        TTModSnapshotStore  (TTModSnapshotPtr self, SymbolPtr s, AtomCount argc, AtomPtr argv);
void        TTModSnapshotRecall (TTModSnapshotPtr self, SymbolPtr s, AtomCount argc, AtomPtr argv);


// Shared
static ClassPtr sMaxClass;


// Class Definition
int JAMOMA_EXPORT_MAXOBJ main(void)
{
    ClassPtr c = class_new("jcom.snapshot",
                           (method)TTModSnapshotNew,
                           (method)TTModSnapshotFree,
                            sizeof(TTModSnapshot),
                            NULL, A_GIMME, 0);

    jamoma_init();
    common_symbols_init();

    class_addmethod(c, (method)TTModSnapshotNotify,     "notify",       A_CANT, 0);
    class_addmethod(c, (method)TTModSnapshotAssist,     "assist",       A_CANT, 0);
    class_addmethod(c, (method)TTModSnapshotDump,       "dump",         0);
    class_addmethod(c, (method)TTModSnapshotStore,      "store",        A_GIMME, 0);
    class_addmethod(c, (method)TTModSnapshotRecall,     "recall",       A_GIMME, 0);

    CLASS_ATTR_SYM_VARSIZE(c,   "excludes", 0,  TTModSnapshot,  excludes, excludeSize, 128);

    class_register(_sym_box, c);
    sMaxClass = c;
    return 0;
}


#if 0
#pragma mark -
#pragma mark Life Cycle
#endif 0

TTPtr TTModSnapshotNew(SymbolPtr name, AtomCount argc, AtomPtr argv)
{
    TTModSnapshotPtr self = (TTModSnapshotPtr)object_alloc(sMaxClass);

    if (self) {
        TTUInt32 i=0;

        self->snapshots = new SnapshotCollection;
        self->tree = JamomaDirectory;

        self->excludes[i++] = gensym("ch");
        self->excludes[i++] = gensym("view");
        self->excludes[i++] = gensym("documentation");
        self->excludeSize = i;

        attr_args_process(self, argc, argv);
    }
    return self;
}

void TTModSnapshotFree(TTModSnapshotPtr self)
{
    // TODO: leaking memory! -- free of the actuall snapshots held by the pointers!
    delete self->snapshots;
}


#if 0
#pragma mark -
#pragma mark Methods
#endif 0

MaxErr TTModSnapshotNotify(TTModSnapshotPtr self, SymbolPtr s, SymbolPtr msg, TTPtr sender, TTPtr data)
{
    object_post(SELF, "notification : %s", msg->s_name);
    return MAX_ERR_NONE;
}


void TTModSnapshotAssist(TTModSnapshotPtr self, void* b, long msg, long arg, char* dst)
{
    if (msg == ASSIST_INLET) {  // inlet
        if (arg == 0)
            strcpy(dst, "inlet");
    }
    else {                      // outlet
        if (arg == 0)
            strcpy(dst, "outlet");
    }
}


void TTModSnapshotDump(TTModSnapshotPtr self)
{
    //jamoma_directory_dump(); // dump all the address of the tree in the Max window
}


void TTModSnapshotStore(TTModSnapshotPtr self, SymbolPtr s, AtomCount argc, AtomPtr argv)
{
    TTNodePtr   rootNode = self->tree->getRoot();
    TTValue     moduleNodes;
    TTUInt32    numModules;
    TTList		returnedChildren;
    TTErr       err;
    SnapshotPtr snapshot = NULL;
    TTUInt32    snapshotIndex = 0;

    // snapshot numbers are 1-based for the outside world
    if (argc && argv)
        snapshotIndex = atom_getlong(argv) - 1;
    if (snapshotIndex < 0)
        snapshotIndex = 0;

    if (snapshotIndex >= self->snapshots->size()) {
        if (snapshotIndex >= self->snapshots->capacity()) {
            self->snapshots->reserve(snapshotIndex+1);
        }
        self->snapshots->resize(snapshotIndex+1);
    }
    else {
        snapshot = self->snapshots->at(snapshotIndex);
        delete snapshot;
        snapshot = NULL;
    }
    snapshot = new Snapshot;


    err = rootNode->getChildren(S_WILDCARD, S_WILDCARD, returnedChildren);

    returnedChildren.assignToValue(moduleNodes);
    numModules = moduleNodes.getSize();
    for (TTUInt32 i=0; i<numModules; i++) {
        TTNodePtr   module = NULL;
        TTSymbol type;

        moduleNodes.get(i, (TTPtr*)(&module));
        if (module) {
			if (module->getObject()) {
				
				type = module->getObject()->getName();
				if (type == TTSymbol("Container")) {
					TTValue     parameterNodes;
					TTUInt32    numParameters;
					
					post("  Module: %s", module->getName().c_str());
					err = module->getChildren(S_WILDCARD, S_WILDCARD, returnedChildren);
					returnedChildren.assignToValue(parameterNodes);
					numParameters = parameterNodes.getSize();
					for (TTUInt32 i=0; i<numParameters; i++) {
						TTNodePtr   parameter = NULL;
						TTSymbol childType;
						
						parameterNodes.get(i, (TTPtr*)(&parameter));
						if (parameter) {
							bool exclude = false;
							// first check for the name in the excludes list
							for (TTInt32 e=0; e < self->excludeSize; e++) {
								TTSymbol s1 = parameter->getName();
								TTSymbol s2 = TTSymbol(self->excludes[e]->s_name);
								
								if (s1 == s2) {
									exclude = true;
									break;
								}
							}
							if (exclude)
								continue;
							
							// then make sure it is actually a parameter
							if (parameter->getObject()) {
								childType = parameter->getObject()->getName();
							if (childType == TTSymbol("Data")) {   // FIXME: this name sucks for the type.
								ObjectPtr maxObject = (ObjectPtr)parameter->getObject();
								SymbolPtr maxType = object_attr_getsym(maxObject, SymbolGen("type"));
								
								// we're ignoring non-int, non-float params for the time being
								if (maxType == SymbolGen("decimal") || maxType == SymbolGen("integer")) {
									TTFloat64               value = object_attr_getfloat(maxObject, SymbolGen("value"));
									SnapshotParameterValue  spv(value, maxObject);
									
									snapshot->push_back(spv);
									post("    parameter: %s -- value: %lf", parameter->getName().c_str(), value);
								}
							}
							// FIXME: the code below sucks big-time -- need to redo as a recursive function
							else if (childType == TTSymbol("container")) {
								TTValue     containerNodes;
								TTUInt32    numParameters2;
								TTList		containerChildren;
								
								post("  Container: %s", parameter->getName().c_str());
								err = parameter->getChildren(TTSymbol("*"), TTSymbol("*"), containerChildren);
								containerChildren.assignToValue(containerNodes);
								numParameters2 = containerNodes.getSize();
								for (TTUInt32 i=0; i<numParameters2; i++) {
									TTNodePtr   parameter2 = NULL;
									TTSymbol childType2;
									
									containerNodes.get(i, (TTPtr*)(&parameter2));
									if (parameter2) {
										bool exclude = false;
										// first check for the name in the excludes list
										for (TTInt32 e=0; e < self->excludeSize; e++) {
											TTSymbol s1 = parameter2->getName();
											TTSymbol s2 = TTSymbol(self->excludes[e]->s_name);
											
											if (s1 == s2) {
												exclude = true;
												break;
											}
										}
										if (exclude)
											continue;
										
										// then make sure it is actually a parameter
										childType2 = parameter2->getType();
										if (childType2 == TTSymbol("subscribe_parameter")) {   // FIXME: this name sucks for the type.
											ObjectPtr maxObject = (ObjectPtr)parameter2->getObject();
											SymbolPtr maxType = object_attr_getsym(maxObject, SymbolGen("type"));
											
											// we're ignoring non-int, non-float params for the time being
											if (maxType == SymbolGen("decimal") || maxType == SymbolGen("integer")) {
												TTFloat64               value = object_attr_getfloat(maxObject, SymbolGen("value"));
												SnapshotParameterValue  spv(value, maxObject);
												
												snapshot->push_back(spv);
												post("    parameter: %s -- value: %lf", parameter2->getName().c_str(), value);
											}
										}
									}
								}
							}
						}
					}
				}
			}
        }
    }
    (*self->snapshots)[snapshotIndex] = snapshot;
}


void TTModSnapshotRecallOne(const SnapshotParameterValue& spv)
{
    object_method(spv.parameter, _sym_float, spv.value);
}


void TTModSnapshotRecall(TTModSnapshotPtr self, SymbolPtr s, AtomCount argc, AtomPtr argv)
{
    if (!argc || !argv)
        return;

    // straight recall
    if (argc == 1) {
        SnapshotPtr snapshot;
        TTUInt32    snapshotIndex = atom_getlong(argv) - 1;

        if (snapshotIndex < 0)
            snapshotIndex = 0;

        if (snapshotIndex >= self->snapshots->size()) {
            object_error(SELF, "preset recall out of range");
            return;
        }
        snapshot = (*self->snapshots)[snapshotIndex];
		if (snapshot)
        	for_each((*snapshot).begin(), (*snapshot).end(), TTModSnapshotRecallOne);
		else
			object_error(SELF, "invalid preset recall requested");
    }

    // interpolate between any two
    else if (argc == 3) {
        SnapshotPtr snapshotA;
        SnapshotPtr snapshotB;
        TTUInt32    snapshotIndexA = atom_getlong(argv+0) - 1;
        TTUInt32    snapshotIndexB = atom_getlong(argv+1) - 1;
        TTUInt32    snapshotSizeA = atom_getlong(argv+0);
        TTUInt32    snapshotSizeB = atom_getlong(argv+1);
        TTFloat32   position = atom_getfloat(argv+2);

        if (snapshotIndexA < 0)
            snapshotIndexA = 0;
        if (snapshotIndexB < 0)
            snapshotIndexB = 0;

        if (snapshotIndexA >= self->snapshots->size() ||
            snapshotIndexB >= self->snapshots->size())
        {
            object_error(SELF, "preset recall out of range");
            return;
        }

        snapshotA = (*self->snapshots)[snapshotIndexA];
        snapshotB = (*self->snapshots)[snapshotIndexB];
        snapshotSizeA = snapshotA->size();
        snapshotSizeB = snapshotB->size();

        if (snapshotSizeA != snapshotSizeB) {
            object_error(SELF, "preset recall -- cannot interpolate between snapshots of unequal size");
            return;
        }

        for (TTUInt32 i=0; i<snapshotSizeA; i++) {
            if ( (*snapshotA)[i].parameter == (*snapshotB)[i].parameter ) {
                TTFloat32 f = ((*snapshotA)[i].value * (1.0 - position)) + ((*snapshotB)[i].value * (position));
                object_method((*snapshotA)[i].parameter, _sym_float, f);
            }
        }
    }

    // wieghted interpolation
    else if (argc > 3) {
        TTUInt32    size;
        TTUInt32    ac = argc;
        bool        boundsCheckFailed = false;
        SnapshotPtr snapshot;
        Snapshot    interpolatedResult;
        TTFloat32   weight;

        // check bounds
        if (ac > self->snapshots->size()) {
            object_error(SELF, "recall can not interpolate -- not enough snapshots for provided weights");
            return;
        }

        snapshot = (*self->snapshots)[0];
        if (!snapshot) {
            object_error(SELF, "recall can not interpolate -- bogus initial snapshot");
            return;
        }

        size = snapshot->size();
        for (int i=1; i<argc; i++) {
            if (!(*self->snapshots)[i] || (*self->snapshots)[i]->size() != size) {
                boundsCheckFailed = true;
                break;
            }
        }
        if (boundsCheckFailed) {
            object_error(SELF, "recall can not interpolate -- snapshots are of unequal size, or there is a missing snapshot in the sequence");
            return;
        }

        interpolatedResult.reserve(size);
        for (int i=0; i<argc; i++) {
            snapshot = (*self->snapshots)[i];
            weight = atom_getfloat(argv+i);
            if (i==0) {
                interpolatedResult.insert(interpolatedResult.begin(), snapshot->begin(), snapshot->end());
                // TODO: There must be a better way than this nested loop using some variant for for_each() or something...
                for (TTUInt32 j=0; j<size; j++) {
                    interpolatedResult[j].value *= weight;
                }
            }
            else {
                // TODO: There must be a better way than this nested loop using some variant for for_each() or something...
                for (TTUInt32 j=0; j<size; j++) {
                    interpolatedResult[j].value += ((*snapshot)[j].value * weight);
                }
            }
        }
       for_each(interpolatedResult.begin(), interpolatedResult.end(), TTModSnapshotRecallOne);
    }
}

