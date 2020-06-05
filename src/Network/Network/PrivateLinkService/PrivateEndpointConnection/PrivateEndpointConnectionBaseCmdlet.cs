<<<<<<< HEAD
﻿using AutoMapper;
using Microsoft.Azure.Commands.Network.Models;
using Microsoft.Azure.Commands.ResourceManager.Common.Tags;
using Microsoft.Azure.Management.Network;
using System;
using System.Management.Automation;
using Microsoft.Azure.Commands.ResourceManager.Common.ArgumentCompleters;
using MNM = Microsoft.Azure.Management.Network.Models;
using Microsoft.WindowsAzure.Commands.Common.CustomAttributes;
=======
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

using Microsoft.Azure.Commands.Network.PrivateLinkService.PrivateLinkServiceProvider;
using Microsoft.Azure.Commands.ResourceManager.Common.ArgumentCompleters;
using System.Management.Automation;
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e

namespace Microsoft.Azure.Commands.Network
{
    public abstract class PrivateEndpointConnectionBaseCmdlet : NetworkBaseCmdlet
    {
        [Parameter(
            Mandatory = true,
            ParameterSetName = "ByResourceId",
            ValueFromPipelineByPropertyName = true)]
        [ValidateNotNullOrEmpty]
        public string ResourceId { get; set; }

        [Alias("ResourceName")]
        [Parameter(
           Mandatory = false,
           ValueFromPipelineByPropertyName = true,
           HelpMessage = "The resource name.",
           ParameterSetName = "ByResource")]
        [ValidateNotNullOrEmpty]
        [SupportsWildcards]
        public virtual string Name { get; set; }

        [Parameter(
           Mandatory = true,
           ValueFromPipelineByPropertyName = true,
           HelpMessage = "The private link service name.",
           ParameterSetName = "ByResource")]
        [ValidateNotNullOrEmpty]
        public string ServiceName { get; set; }

        [Parameter(
            Mandatory = true,
            ValueFromPipelineByPropertyName = true,
            HelpMessage = "The resource group name.",
            ParameterSetName = "ByResource")]
        [ResourceGroupCompleter]
        [ValidateNotNullOrEmpty]
        public virtual string ResourceGroupName { get; set; }

        [Parameter(
          Mandatory = false,
          ValueFromPipelineByPropertyName = true,
          HelpMessage = "The private link resource type.",
          ParameterSetName = "ByResource")]
        public string PrivateLinkResourceType { get; set; }

<<<<<<< HEAD
        protected IPrivateLinkProvider BuildProvider(string resourceType)
        {
            IPrivateLinkProvider provider = null;

            switch (resourceType.ToLower())
            {
                case "microsoft.sql/servers":
                    provider = new SqlProvider(this);
                    break;
                case "microsoft.network/privatelinkservices":
                default:
                    provider = new NetworkingProvider(this);
                    break;
            }

            return provider;
=======
        public string Subscription { get; set; }

        protected IPrivateLinkProvider BuildProvider(string subscription, string privateLinkResourceType)
        {
            return PrivateLinkProviderFactory.CreatePrivateLinkProvder(this, subscription, privateLinkResourceType);
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
        }
    }
}
