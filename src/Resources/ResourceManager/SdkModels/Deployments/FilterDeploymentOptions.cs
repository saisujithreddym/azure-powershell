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

using System.Collections.Generic;
<<<<<<< HEAD
=======
using Microsoft.Azure.Commands.ResourceManager.Cmdlets.SdkModels.Deployments;
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e

namespace Microsoft.Azure.Commands.ResourceManager.Cmdlets.SdkModels
{
    public class FilterDeploymentOptions
    {
        public string DeploymentName { get; set; }

<<<<<<< HEAD
=======
        public DeploymentScopeType ScopeType { get; set; }

        public string ManagementGroupId { get; set; }

>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
        public string ResourceGroupName { get; set; }

        public List<string> ProvisioningStates { get; set; }

        public List<string> ExcludedProvisioningStates { get; set; }

<<<<<<< HEAD
        public FilterDeploymentOptions()
        {
            DeploymentName = null;
=======
        public FilterDeploymentOptions(DeploymentScopeType scopeType)
        {
            ScopeType = scopeType;
            DeploymentName = null;
            ManagementGroupId = null;
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
            ResourceGroupName = null;
            ProvisioningStates = new List<string>();
            ExcludedProvisioningStates = new List<string>();
        }
    }
}
