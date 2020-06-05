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

namespace Microsoft.Azure.Commands.ResourceManager.Cmdlets.Implementation
{
    using Commands.Common.Authentication.Abstractions;
    using Common.ArgumentCompleters;
    using Microsoft.Azure.Commands.ResourceManager.Cmdlets.Components;
    using System;
    using System.Management.Automation;

    /// <summary>
    /// The base class for manipulating resources.
    /// </summary>
<<<<<<< HEAD
    public abstract class ResourceManipulationCmdletBase : ResourceManagerCmdletBase
=======
    public abstract class ResourceManipulationCmdletBase : ResourceManagerCmdletBaseWithAPiVersion
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
    {
        /// <summary>
        /// The subscription level parameter set.
        /// </summary>
<<<<<<< HEAD
        internal const string SubscriptionLevelResoruceParameterSet = "BySubscriptionLevel";
=======
        internal const string SubscriptionLevelResourceParameterSet = "BySubscriptionLevel";
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e

        /// <summary>
        /// The tenant level parameter set.
        /// </summary>
<<<<<<< HEAD
        internal const string TenantLevelResoruceParameterSet = "ByTenantLevel";
=======
        internal const string TenantLevelResourceParameterSet = "ByTenantLevel";
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e

        /// <summary>
        /// The tenant level parameter set.
        /// </summary>
        internal const string ResourceIdParameterSet = "ByResourceId";

        /// <summary>
        /// Gets or sets the resource Id parameter.
        /// </summary>
        [Alias("Id")]
        [Parameter(ParameterSetName = ResourceManipulationCmdletBase.ResourceIdParameterSet, Mandatory = true, ValueFromPipelineByPropertyName = true, HelpMessage = "The fully qualified resource Id, including the subscription. e.g. /subscriptions/{subscriptionId}/providers/Microsoft.Sql/servers/myServer/databases/myDatabase")]
        [ValidateNotNullOrEmpty]
        public string ResourceId { get; set; }

        /// <summary>
        /// Gets or sets the extension resource name parameter.
        /// </summary>
        [Alias("Name")]
<<<<<<< HEAD
        [Parameter(ParameterSetName = ResourceManipulationCmdletBase.SubscriptionLevelResoruceParameterSet, Mandatory = true, ValueFromPipelineByPropertyName = true, HelpMessage = "The resource name. e.g. to specify a database MyServer/MyDatabase.")]
        [Parameter(ParameterSetName = ResourceManipulationCmdletBase.TenantLevelResoruceParameterSet, Mandatory = true, ValueFromPipelineByPropertyName = true, HelpMessage = "The resource name. e.g. to specify a database MyServer/MyDatabase.")]
=======
        [Parameter(ParameterSetName = ResourceManipulationCmdletBase.SubscriptionLevelResourceParameterSet, Mandatory = true, ValueFromPipelineByPropertyName = true, HelpMessage = "The resource name. e.g. to specify a database MyServer/MyDatabase.")]
        [Parameter(ParameterSetName = ResourceManipulationCmdletBase.TenantLevelResourceParameterSet, Mandatory = true, ValueFromPipelineByPropertyName = true, HelpMessage = "The resource name. e.g. to specify a database MyServer/MyDatabase.")]
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
        [ValidateNotNullOrEmpty]
        public string ResourceName { get; set; }

        /// <summary>
        /// Gets or sets the resource type parameter.
        /// </summary>
<<<<<<< HEAD
        [Parameter(ParameterSetName = ResourceManipulationCmdletBase.SubscriptionLevelResoruceParameterSet, Mandatory = true, ValueFromPipelineByPropertyName = true, HelpMessage = "The resource type. e.g. Microsoft.Sql/Servers/Databases.")]
        [Parameter(ParameterSetName = ResourceManipulationCmdletBase.TenantLevelResoruceParameterSet, Mandatory = true, ValueFromPipelineByPropertyName = true, HelpMessage = "The resource type. e.g. Microsoft.Sql/Servers/Databases.")]
=======
        [Parameter(ParameterSetName = ResourceManipulationCmdletBase.SubscriptionLevelResourceParameterSet, Mandatory = true, ValueFromPipelineByPropertyName = true, HelpMessage = "The resource type. e.g. Microsoft.Sql/Servers/Databases.")]
        [Parameter(ParameterSetName = ResourceManipulationCmdletBase.TenantLevelResourceParameterSet, Mandatory = true, ValueFromPipelineByPropertyName = true, HelpMessage = "The resource type. e.g. Microsoft.Sql/Servers/Databases.")]
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
        [ValidateNotNullOrEmpty]
        public string ResourceType { get; set; }

        /// <summary>
        /// Gets or sets the extension resource name parameter.
        /// </summary>
<<<<<<< HEAD
        [Parameter(ParameterSetName = ResourceManipulationCmdletBase.SubscriptionLevelResoruceParameterSet, Mandatory = false, ValueFromPipelineByPropertyName = true, HelpMessage = "The extension resource name. e.g. to specify a database MyServer/MyDatabase.")]
        [Parameter(ParameterSetName = ResourceManipulationCmdletBase.TenantLevelResoruceParameterSet, Mandatory = false, ValueFromPipelineByPropertyName = true, HelpMessage = "The extension resource name. e.g. to specify a database MyServer/MyDatabase.")]
=======
        [Parameter(ParameterSetName = ResourceManipulationCmdletBase.SubscriptionLevelResourceParameterSet, Mandatory = false, ValueFromPipelineByPropertyName = true, HelpMessage = "The extension resource name. e.g. to specify a database MyServer/MyDatabase.")]
        [Parameter(ParameterSetName = ResourceManipulationCmdletBase.TenantLevelResourceParameterSet, Mandatory = false, ValueFromPipelineByPropertyName = true, HelpMessage = "The extension resource name. e.g. to specify a database MyServer/MyDatabase.")]
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
        [ValidateNotNullOrEmpty]
        public string ExtensionResourceName { get; set; }

        /// <summary>
        /// Gets or sets the extension resource type parameter.
        /// </summary>
<<<<<<< HEAD
        [Parameter(ParameterSetName = ResourceManipulationCmdletBase.SubscriptionLevelResoruceParameterSet, Mandatory = false, ValueFromPipelineByPropertyName = true, HelpMessage = "The extension resource type. e.g. Microsoft.Sql/Servers/Databases.")]
        [Parameter(ParameterSetName = ResourceManipulationCmdletBase.TenantLevelResoruceParameterSet, Mandatory = false, ValueFromPipelineByPropertyName = true, HelpMessage = "The extension resource type. e.g. Microsoft.Sql/Servers/Databases.")]
=======
        [Parameter(ParameterSetName = ResourceManipulationCmdletBase.SubscriptionLevelResourceParameterSet, Mandatory = false, ValueFromPipelineByPropertyName = true, HelpMessage = "The extension resource type. e.g. Microsoft.Sql/Servers/Databases.")]
        [Parameter(ParameterSetName = ResourceManipulationCmdletBase.TenantLevelResourceParameterSet, Mandatory = false, ValueFromPipelineByPropertyName = true, HelpMessage = "The extension resource type. e.g. Microsoft.Sql/Servers/Databases.")]
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
        [ValidateNotNullOrEmpty]
        public string ExtensionResourceType { get; set; }

        /// <summary>
        /// Gets or sets the OData query parameter.
        /// </summary>
        [Parameter(Mandatory = false, HelpMessage = "An OData style filter which will be appended to the request in addition to any other filters.")]
        [ValidateNotNullOrEmpty]
        public string ODataQuery { get; set; }

        /// <summary>
        /// Gets or sets the resource group name parameter.
        /// </summary>
<<<<<<< HEAD
        [Parameter(ParameterSetName = ResourceManipulationCmdletBase.SubscriptionLevelResoruceParameterSet, Mandatory = false, ValueFromPipelineByPropertyName = true, HelpMessage = "The resource group name.")]
=======
        [Parameter(ParameterSetName = ResourceManipulationCmdletBase.SubscriptionLevelResourceParameterSet, Mandatory = false, ValueFromPipelineByPropertyName = true, HelpMessage = "The resource group name.")]
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
        [ResourceGroupCompleter]
        [ValidateNotNullOrEmpty]
        public string ResourceGroupName { get; set; }

        /// <summary>
        /// Gets or sets the tenant level parameter.
        /// </summary>
<<<<<<< HEAD
        [Parameter(ParameterSetName = ResourceManipulationCmdletBase.TenantLevelResoruceParameterSet, Mandatory = true, HelpMessage = "Indicates that this is a tenant level operation.")]
=======
        [Parameter(ParameterSetName = ResourceManipulationCmdletBase.TenantLevelResourceParameterSet, Mandatory = true, HelpMessage = "Indicates that this is a tenant level operation.")]
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
        public SwitchParameter TenantLevel { get; set; }

        /// <summary>
        /// Gets or sets the force parameter.
        /// </summary>
        [Parameter(Mandatory = false, HelpMessage = "Do not ask for confirmation.")]
        public SwitchParameter Force { get; set; }

        /// <summary>
        /// Gets or sets the subscription id.
        /// </summary>
        public Guid SubscriptionId { get; set; }

        /// <summary>
        /// Initializes the default subscription id if needed.
        /// </summary>
        public ResourceManipulationCmdletBase() {}

        protected override void OnProcessRecord()
        {
            if (string.IsNullOrEmpty(this.ResourceId))
            {
                this.SubscriptionId = DefaultContext.Subscription.GetId();
            }
        }

        /// <summary>
        /// Gets the resource Id from the supplied PowerShell parameters.
        /// </summary>
        protected string GetResourceId()
        {
#pragma warning disable 618

            return !string.IsNullOrWhiteSpace(this.ResourceId)
                ? this.ResourceId
                : this.GetResourceIdWithoutParentResource();

#pragma warning restore 618
        }

        /// <summary>
        /// Gets the resource Id from the supplied PowerShell parameters.
        /// </summary>
        private string GetResourceIdWithoutParentResource()
        {
            return ResourceIdUtility.GetResourceId(
<<<<<<< HEAD
                subscriptionId: this.SubscriptionId,
                resourceGroupName: this.ResourceGroupName,
=======
                subscriptionId: TenantLevel.IsPresent ? null : (Guid?)this.SubscriptionId,
                resourceGroupName: TenantLevel.IsPresent ? null : this.ResourceGroupName,
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
                resourceType: this.ResourceType,
                resourceName: this.ResourceName,
                extensionResourceType: this.ExtensionResourceType,
                extensionResourceName: this.ExtensionResourceName);
        }
    }
}