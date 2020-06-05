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

using System;
using System.Management.Automation;
<<<<<<< HEAD
using Microsoft.Azure.Commands.Aks.Generated.Version2017_08_31;
using Microsoft.Azure.Commands.Aks.Models;
using Microsoft.Azure.Commands.Aks.Properties;
=======
using Microsoft.Azure.Commands.Aks.Models;
using Microsoft.Azure.Commands.Aks.Properties;
using Microsoft.Azure.Management.ContainerService;
using Microsoft.WindowsAzure.Commands.Utilities.Common;
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e

namespace Microsoft.Azure.Commands.Aks
{
    [Cmdlet("New", ResourceManager.Common.AzureRMConstants.AzureRMPrefix + "Aks", DefaultParameterSetName = DefaultParamSet, SupportsShouldProcess = true)]
    [OutputType(typeof(PSKubernetesCluster))]
<<<<<<< HEAD
    public class NewAzureRmAks : CreateOrUpdateKubeBase
=======
    public class NewAzureRmAks : NewKubeBase
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
    {
        [Parameter(Mandatory = false, HelpMessage = "Create cluster even if it already exists")]
        public SwitchParameter Force { get; set; }

        public override void ExecuteCmdlet()
        {
            base.ExecuteCmdlet();
<<<<<<< HEAD
=======
            PreValidate();
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e

            Action action = () =>
            {
                WriteVerbose(Resources.PreparingForDeploymentOfYourManagedKubernetesCluster);
                var managedCluster = BuildNewCluster();
                var cluster = Client.ManagedClusters.CreateOrUpdate(ResourceGroupName, Name, managedCluster);
                var psObj = PSMapper.Instance.Map<PSKubernetesCluster>(cluster);
                WriteObject(psObj);
            };

            var msg = $"{Name} in {ResourceGroupName}";

            if (Exists())
            {
                WriteVerbose(Resources.ClusterAlreadyExistsConfirmAction);
                ConfirmAction(
                    Force,
                    Resources.DoYouWantToCreateANewManagedKubernetesCluster,
                    Resources.CreatingAManagedKubernetesCluster,
                    msg,
                    action);
            }
            else
            {
                WriteVerbose(Resources.ClusterIsNew);
                if (ShouldProcess(msg, Resources.CreatingAManagedKubernetesCluster))
                {
                    RunCmdLet(action);
                }
            }
        }
<<<<<<< HEAD
=======

        private void PreValidate()
        {
            if ((this.IsParameterBound(c => c.NodeMinCount) || this.IsParameterBound(c => c.NodeMaxCount) || this.EnableNodeAutoScaling.IsPresent) &&
                !(this.IsParameterBound(c => c.NodeMinCount) && this.IsParameterBound(c => c.NodeMaxCount) && this.EnableNodeAutoScaling.IsPresent))
                throw new PSInvalidCastException(Resources.AksNodePoolAutoScalingParametersMustAppearTogether);
        }
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
    }
}
