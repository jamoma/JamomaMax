/** @file
 *
 * @ingroup implementationMaxExternalsAudioGraph
 *
 * @brief j.trajectory= : wraps the #TTTrajectory class as a trajectory generator for AudioGraph
 *
 * @details A 2D/3D trajectory generator at signal rate
 *
 * @authors Nils Peters, Tim Place, Trond Lossius
 *
 * @copyright © 2010, Nils Peters, Tim Place @n
 * This code is licensed under the terms of the "New BSD License" @n
 * http://creativecommons.org/licenses/BSD/
 */


#include "maxAudioGraph.h"

int TTCLASSWRAPPERMAX_EXPORT main(void)
{
	
	MaxAudioGraphWrappedClassOptionsPtr	options = new MaxAudioGraphWrappedClassOptions;
	MaxAudioGraphWrappedClassPtr			c = NULL;
		
	TTAudioGraphInit();
	options->append(TT("generator"), YES);
	wrapAsMaxAudioGraph(TT("trajectory"), "j.trajectory=", &c, options);
	CLASS_ATTR_ENUM(c->maxClass, "mode", 0, "phasor ramp");
	wrapAsMaxAudioGraph(TT("trajectory"), "trajectory=", &c, options);
	CLASS_ATTR_ENUM(c->maxClass, "mode", 0, "phasor ramp");
	return 0;
}

