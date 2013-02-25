/* 
 *	soundfile.recorder≈
 *	Jamoma AudioGraph external object for Max
 *	Copyright © 2010 by Timothy Place
 * 
 * License: This code is licensed under the terms of the "New BSD License"
 * http://creativecommons.org/licenses/BSD/
 */

#include "maxAudioGraph.h"

int TTCLASSWRAPPERMAX_EXPORT main(void)
{
	MaxAudioGraphWrappedClassOptionsPtr	options = new MaxAudioGraphWrappedClassOptions;
	TTValue								value(0);
	MaxAudioGraphWrappedClassPtr			c = NULL;
	
	TTAudioGraphInit();
	
	wrapAsMaxAudioGraph(TT("soundfile.recorder"), "jcom.soundfile.recorder≈", &c, options);
    CLASS_ATTR_ENUM(c->maxClass, "format", 0, "AIFF AIFF-16bit AIFF-24bit AIFF-32bit CAF CAF-16bit CAF-24bit CAF-32bit FLAC FLAC-16bit FLAC-24bit FLAC-32bit Matlab-16bit Matlab-32bit Matlab-64bit WAV WAV-16bit WAV-24bit WAV-32bit");
	
	wrapAsMaxAudioGraph(TT("soundfile.recorder"), "soundfile.recorder≈", &c, options);
    CLASS_ATTR_ENUM(c->maxClass, "format", 0, "AIFF AIFF-16bit AIFF-24bit AIFF-32bit CAF CAF-16bit CAF-24bit CAF-32bit FLAC FLAC-16bit FLAC-24bit FLAC-32bit Matlab-16bit Matlab-32bit Matlab-64bit WAV WAV-16bit WAV-24bit WAV-32bit");

	return 0;
}

