/**********************************************************************************************
   Copyright 2019 Pivotal Software

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
 *********************************************************************************************/

package io.pivotal.rtsmadlib.batch.mlmodel.model;

import org.apache.geode.cache.EntryOperation;
import org.apache.geode.cache.PartitionResolver;

/**
 * @author sridhar paladugu
 *
 */
public class ModelScoresPartitionResolver implements PartitionResolver<ModelScoreKey, ModelScore> {

	@Override
	public void close() {
	}

	@Override
	public String getName() {
		return "ModelScoresPartitionResolver";
	}

	@Override
	public Object getRoutingObject(EntryOperation<ModelScoreKey, ModelScore> opDetails) {
		return opDetails.getKey().scoreName + "_" + opDetails.getKey().getUid();
	}

}
