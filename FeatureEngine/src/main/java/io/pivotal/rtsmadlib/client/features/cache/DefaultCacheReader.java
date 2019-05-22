/**********************************************************************************************
 Copyright 2019 Sridhar Paladugu

 Permission is hereby granted, free of charge, to any person obtaining a copy of this 
 software and associated documentation files (the "Software"), to deal in the Software 
 without restriction, including without limitation the rights to use, copy, modify, 
 merge, publish, distribute, sublicense, and/or sell copies of the Software, and to 
 permit persons to whom the Software is furnished to do so, subject to the following 
 conditions:

 The above copyright notice and this permission notice shall be included in all copies 
 or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, 
 INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
 PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE
 FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR 
 OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR 
 OTHER DEALINGS IN THE SOFTWARE.
 *********************************************************************************************/

package io.pivotal.rtsmadlib.client.features.cache;

import org.springframework.context.annotation.Profile;
import org.springframework.stereotype.Component;

import io.pivotal.rtsmadlib.client.features.model.MADlibFeature;
import io.pivotal.rtsmadlib.client.features.model.MADlibFeatureKey;

/**
 * @author sridhar paladugu
 *
 */
@Component
@Profile("nocache")
public class DefaultCacheReader implements CacheReader {
	
	//TODO: need to find a better implementation to handle no cache
	
	/* (non-Javadoc)
	 * @see io.pivotal.madlib.client.features.service.CacheLoader#lookUpFeatures(io.pivotal.madlib.client.features.model.MADlibFeatureKey)
	 */
	@Override
	public MADlibFeature lookUpFeature(MADlibFeatureKey key) {
		// TODO Auto-generated method stub
		return null;
	}

}
