/* 
 *	hilbert≈
 *	Jamoma AudioGraph external object for Max
 *	Copyright © 2010 by Timothy Place
 * 
 *	License: This code is licensed under the terms of the "New BSD License"
 *	http://creativecommons.org/licenses/BSD/
 */

#include "maxAudioGraph.h"

int TTCLASSWRAPPERMAX_EXPORT main(void)
{
	MaxAudioGraphWrappedClassOptionsPtr	options = new MaxAudioGraphWrappedClassOptions;
	TTValue								value(2);
	MaxAudioGraphWrappedClassPtr		c = NULL;

	TTAudioGraphInit();
    
	options->append(TT("wrapperDefinesNumOutlets"), value);
//	wrapAsMaxAudioGraph(TT("hilbert.9"), "jcom.hilbert≈", &c, options);
	wrapAsMaxAudioGraph(TT("hilbert.linear.33"), "jcom.hilbert≈", &c, options);
	wrapAsMaxAudioGraph(TT("hilbert.linear.33"), "hilbert≈", &c, options);
		
	return 0;
}

