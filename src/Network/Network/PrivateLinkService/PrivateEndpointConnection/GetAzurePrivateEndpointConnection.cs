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

using AutoMapper;
using Microsoft.Azure.Commands.Network.Models;
using Microsoft.Azure.Commands.ResourceManager.Common.Tags;
using Microsoft.Azure.Management.Network;
using System;
using System.Management.Automation;
using Microsoft.Azure.Commands.ResourceManager.Common.ArgumentCompleters;
using MNM = Microsoft.Azure.Management.Network.Models;
using Microsoft.WindowsAzure.Commands.Common.CustomAttributes;
using Microsoft.WindowsAzure.Commands.Utilities.Common;
using Microsoft.Azure.Management.Internal.Resources.Utilities.Models;
using System.Linq;

namespace Microsoft.Azure.Commands.Network
{
    [Cmdlet(VerbsCommon.Get, ResourceManager.Common.AzureRMConstants.AzureRMPrefix + "PrivateEndpointConnection", DefaultParameterSetName = "ByResourceId"), OutputType(typeof(PSPrivateEndpointConnection))]
    public class GetAzurePrivateEndpointConnection : PrivateEndpointConnectionBaseCmdlet
    {
        public override void Execute()
        {
            base.Execute();

            string resourceType = string.Empty;
            string parentResource = string.Empty;

            if (this.IsParameterBound(c => c.ResourceId))
            {
                var resourceIdentifier = new ResourceIdentifier(this.ResourceId);
                this.ResourceGroupName = resourceIdentifier.ResourceGroupName;
                if (this.ResourceId.Split(new[] { '/' }, StringSplitOptions.RemoveEmptyEntries).Contains("privateEndpointConnections"))
                {
                    this.Name = resourceIdentifier.ResourceName;
                    resourceType = resourceIdentifier.ResourceType;
                    parentResource = resourceIdentifier.ParentResource;
                    this.ServiceName = parentResource.Split(new[] { '/' }, StringSplitOptions.RemoveEmptyEntries).Last();
                }
                else
                {
                    this.ServiceName = resourceIdentifier.ResourceName;
                }
            }

            var psPrivateLinkService = this.GetPrivateLinkService(ResourceGroupName, ServiceName);

            if (!string.IsNullOrEmpty(this.Name))
            {
                var peConnection = psPrivateLinkService.PrivateEndpointConnections.FirstOrDefault(
                        resource =>
                            string.Equals(resource.Name, this.Name, StringComparison.CurrentCultureIgnoreCase));

                if (peConnection == null)
                {
                    throw new ArgumentException(string.Format(Properties.Resources.ResourceNotFound, this.Name));
                }

                WriteObject(peConnection);
            }
            else
            {
                var peConnections = psPrivateLinkService.PrivateEndpointConnections;
                WriteObject(peConnections, true);
            }

        }
    }
}
