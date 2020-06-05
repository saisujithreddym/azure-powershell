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

using Microsoft.Azure.Commands.Maintenance.Models;
using Microsoft.Azure.Commands.ResourceManager.Common.ArgumentCompleters;
using Microsoft.Azure.Management.Maintenance;
using Microsoft.Azure.Management.Maintenance.Models;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Management.Automation;

namespace Microsoft.Azure.Commands.Maintenance
{
    [Cmdlet(VerbsCommon.Get, ResourceManager.Common.AzureRMConstants.AzureRMPrefix + "MaintenanceConfiguration", DefaultParameterSetName = "DefaultParameter")]
    [OutputType(typeof(PSMaintenanceConfiguration))]
    public partial class GetAzureRmMaintenanceConfiguration : MaintenanceAutomationBaseCmdlet
    {
<<<<<<< HEAD
=======
        private readonly string[] uriSplit = new string[] { "/" };
                
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
        public override void ExecuteCmdlet()
        {
            base.ExecuteCmdlet();
            ExecuteClientAction(() =>
            {
                string resourceGroupName = this.ResourceGroupName;
                string name = this.Name;
<<<<<<< HEAD

=======
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
                if (!string.IsNullOrEmpty(resourceGroupName) && !string.IsNullOrEmpty(name))
                {
                    var result = MaintenanceConfigurationsClient.Get(resourceGroupName, name);
                    WriteObject(result);
                }

                else
                {
                    var psObject = new List<PSMaintenanceConfiguration>();
                    var result = MaintenanceConfigurationsClient.List();

                    foreach (var maintenanceConfiguration in result)
                    {
<<<<<<< HEAD
=======
                        string[] mcInfo = maintenanceConfiguration.Id.Split(uriSplit, StringSplitOptions.RemoveEmptyEntries);
                        if (null != mcInfo && mcInfo.Length == 8)
                        {
                            if(!string.IsNullOrEmpty(resourceGroupName) && !mcInfo[3].Equals(resourceGroupName))
                            {
                                continue;
                            }

                            if(!string.IsNullOrEmpty(name) && !maintenanceConfiguration.Name.Equals(name))
                            {
                                continue;
                            }
                        }

>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
                        PSMaintenanceConfiguration psMaintenanceConfiguration = new PSMaintenanceConfiguration();
                        MaintenanceAutomationAutoMapperProfile.Mapper.Map<MaintenanceConfiguration, PSMaintenanceConfiguration>(maintenanceConfiguration, psMaintenanceConfiguration);
                        psObject.Add(psMaintenanceConfiguration);
                    }

                    WriteObject(psObject);
                }
            });
        }

        [Parameter(
            ParameterSetName = "DefaultParameter",
            Position = 0,
            Mandatory = false,
            HelpMessage = "The resource Group Name.",
            ValueFromPipelineByPropertyName = true)]
        [ResourceGroupCompleter]
        public string ResourceGroupName { get; set; }

        [Parameter(
            ParameterSetName = "DefaultParameter",
            Position = 1,
            Mandatory = false,
            HelpMessage = "The maintenance configuration Name.",
            ValueFromPipelineByPropertyName = true)]
        public string Name { get; set; }
    }
}
