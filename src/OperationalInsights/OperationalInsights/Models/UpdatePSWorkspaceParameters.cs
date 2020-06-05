﻿// ----------------------------------------------------------------------------------
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

using System.Collections;

namespace Microsoft.Azure.Commands.OperationalInsights
{
    public class UpdatePSWorkspaceParameters : OperationalInsightsParametersBase
    {
        public string Sku { get; set; }

        public Hashtable Tags { get; set; }

        public int? RetentionInDays { get; set; }
<<<<<<< HEAD
=======

        public string PublicNetworkAccessForIngestion { get; set; }

        public string PublicNetworkAccessForQuery { get; set; }
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
    }
}
