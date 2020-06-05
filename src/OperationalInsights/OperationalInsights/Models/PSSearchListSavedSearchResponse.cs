// ----------------------------------------------------------------------------------
//
// Copyright Microsoft Corporation
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// http://www.apache.org/licenses/LICENSE-2.0
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// ----------------------------------------------------------------------------------

using Microsoft.Azure.Management.OperationalInsights.Models;
using System;
using System.Collections.Generic;

namespace Microsoft.Azure.Commands.OperationalInsights.Models
{
    public class PSSearchListSavedSearchResponse
    {
        public PSSearchListSavedSearchResponse()
        {
        }

        public PSSearchListSavedSearchResponse(SavedSearchesListResult searchResponse)
        {
            if (searchResponse == null)
            {
                throw new ArgumentNullException("saved search response");
            }

<<<<<<< HEAD
            SearchMetadata m = searchResponse.Metadata;
            this.Metadata = new PSSearchMetadata(searchResponse.Metadata);
=======
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
            this.Value = new List<PSSavedSearchValue>();
            foreach (SavedSearch v in searchResponse.Value)
            {
                this.Value.Add(new PSSavedSearchValue(v));
            }
        }

<<<<<<< HEAD
        public PSSearchMetadata Metadata { get; set; }

=======
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
        public List<PSSavedSearchValue> Value { get; set; }
    }
}
