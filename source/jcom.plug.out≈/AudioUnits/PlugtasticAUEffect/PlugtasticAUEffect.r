#include <AudioUnit/AudioUnit.r>

#include "PlugtasticAUEffectVersion.h"

// Note that resource IDs must be spaced 2 apart for the 'STR ' name and description
#define kAudioUnitResID_PlugtasticAUEffect				1000

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ PlugtasticAUEffect~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#define RES_ID			kAudioUnitResID_PlugtasticAUEffect
#define COMP_TYPE		kAudioUnitType_Effect
#define COMP_SUBTYPE	PlugtasticAUEffect_COMP_SUBTYPE
#define COMP_MANUF		PlugtasticAUEffect_COMP_MANF	

#define VERSION			kPlugtasticAUEffectVersion
#define NAME			"__MyCompanyName__: PlugtasticAUEffect"
#define DESCRIPTION		"PlugtasticAUEffect AU"
#define ENTRY_POINT		"PlugtasticAUEffectEntry"

#include "AUResources.r"
