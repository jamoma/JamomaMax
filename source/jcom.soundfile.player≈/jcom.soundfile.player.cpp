/* 
 *	phasor≈
 *	Jamoma AudioGraph external object for Max
 *	Copyright © 2008 by Timothy Place
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
    
	options->append(TT("generator"), value);
	value = 2;
	options->append(TT("wrapperDefinesNumOutlets"), value);
	
	wrapAsMaxAudioGraph(TT("soundfile.player"), "jcom.soundfile.player≈", &c, options);
	CLASS_ATTR_STYLE(c->maxClass,		"filePath", 0,	"file");
	
	wrapAsMaxAudioGraph(TT("soundfile.player"), "soundfile.player≈", &c, options);
	CLASS_ATTR_STYLE(c->maxClass,		"filePath", 0,	"file");
	
	return 0;
}

