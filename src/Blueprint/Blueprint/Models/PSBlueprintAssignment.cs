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

using Microsoft.Azure.Management.Blueprint.Models;
using System;
using System.Collections.Generic;
<<<<<<< HEAD
=======
using System.Linq;
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e

namespace Microsoft.Azure.Commands.Blueprint.Models
{
    public class PSBlueprintAssignment : PSAzureResourceBase
    {
        public string Location { get; set; }
        public string Scope { get; set; }
        public PSManagedServiceIdentity Identity { get; set; }
        public string DisplayName { get; set; }
        public string Description { get; set; }
        public string BlueprintId { get; set; }
<<<<<<< HEAD
        public IDictionary<string, PSParameterValueBase> Parameters { get; set; }
=======
        public IDictionary<string, PSParameterValue> Parameters { get; set; }
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
        public IDictionary<string, PSResourceGroupValue> ResourceGroups { get; set; }
        public PSAssignmentStatus Status { get; set; }
        public PSAssignmentLockSettings Locks { get; set; }
        public PSAssignmentProvisioningState ProvisioningState {get; set; }

        /// <summary>
        /// Create a PSBluprintAssignment object from an Assignment model.
        /// </summary>
        /// <param name="assignment">Assignment object from which to create the PSBlueprintAssignment.</param>
        /// <param name="subscriptionId">ID of the subscription the assignment is associated with.</param>
        /// <returns>A new PSBlueprintAssignment object.</returns>
<<<<<<< HEAD
        internal static PSBlueprintAssignment FromAssignment(Assignment assignment, string scope)
=======
        internal static PSBlueprintAssignment FromAssignment(Assignment assignment)
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
        {
            var psAssignment = new PSBlueprintAssignment
            {
                Name = assignment.Name,
                Id = assignment.Id,
                Type = assignment.Type,
                Location = assignment.Location,
<<<<<<< HEAD
                Scope = scope,
=======
                Scope = assignment.Scope,
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
                Identity = new PSManagedServiceIdentity
                {
                    PrincipalId = assignment.Identity.PrincipalId,
                    TenantId = assignment.Identity.TenantId,
                    Type = assignment.Type,
                    UserAssignedIdentities = new Dictionary<string, PSUserAssignedIdentity>()
                },
                DisplayName = assignment.DisplayName,
                Description = assignment.Description,
                BlueprintId = assignment.BlueprintId,
                ProvisioningState = PSAssignmentProvisioningState.Unknown,
                Status = new PSAssignmentStatus(),
<<<<<<< HEAD
                Locks = new PSAssignmentLockSettings {Mode = PSLockMode.None},
                Parameters = new Dictionary<string, PSParameterValueBase>(),
=======
                Locks = new PSAssignmentLockSettings
                {
                    Mode = PSLockMode.None,
                    ExcludedActions = new List<string>(),
                    ExcludedPrincipals = new List<string>()
                },
                Parameters = new Dictionary<string, PSParameterValue>(),
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
                ResourceGroups = new Dictionary<string, PSResourceGroupValue>()
            };

            psAssignment.Status.TimeCreated = assignment.Status.TimeCreated;

            psAssignment.Status.LastModified = assignment.Status.LastModified;

            if (Enum.TryParse(assignment.ProvisioningState, true, out PSAssignmentProvisioningState state))
            {
                psAssignment.ProvisioningState = state;
            }
            else
            {
                psAssignment.ProvisioningState = PSAssignmentProvisioningState.Unknown;
            }

            if (Enum.TryParse(assignment.Locks.Mode, true, out PSLockMode lockMode))
            {
                psAssignment.Locks.Mode = lockMode;
            }
            else
            {
                psAssignment.Locks.Mode = PSLockMode.None;
            }

<<<<<<< HEAD
            foreach (var item in assignment.Parameters)
            {
                PSParameterValueBase parameter = GetAssignmentParameters(item);
=======
            if (assignment.Locks.ExcludedActions != null)
            {
                foreach (var item in assignment.Locks.ExcludedActions)
                {
                    psAssignment.Locks.ExcludedActions.Add(item);
                }
            }

            if (assignment.Locks.ExcludedPrincipals != null)
            {
                foreach (var item in assignment.Locks.ExcludedPrincipals)
                {
                    psAssignment.Locks.ExcludedPrincipals.Add(item);
                }
            }

            foreach (var item in assignment.Parameters)
            {
                PSParameterValue parameter = GetAssignmentParameters(item);
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
                psAssignment.Parameters.Add(item.Key, parameter);
            }

            foreach (var item in assignment.ResourceGroups)
            {
                psAssignment.ResourceGroups.Add(item.Key,
                    new PSResourceGroupValue {Name = item.Value.Name, Location = item.Value.Location});
            }

            if (assignment.Identity.UserAssignedIdentities != null)
            {
                foreach (var item in assignment.Identity.UserAssignedIdentities)
                {
                    psAssignment.Identity.UserAssignedIdentities.Add(item.Key,
                        new PSUserAssignedIdentity { ClientId = item.Value.ClientId, PrincipalId = item.Value.PrincipalId });
                }
            }

            return psAssignment;
        }

<<<<<<< HEAD
        private static PSParameterValueBase GetAssignmentParameters(KeyValuePair<string, ParameterValueBase> parameterKvp)
        {
            PSParameterValueBase parameter = null;

            if (parameterKvp.Value != null && parameterKvp.Value is ParameterValue)
            {
                // Need to cast as ParameterValue since assignment.Parameters value type is ParameterValueBase. 
                var parameterValue = (ParameterValue) parameterKvp.Value;

                parameter = new PSParameterValue { Description = parameterValue.Description, Value = parameterValue.Value };
            }
            else if (parameterKvp.Value != null && parameterKvp.Value is SecretReferenceParameterValue)
            {
                var parameterValue = (SecretReferenceParameterValue) parameterKvp.Value;
=======
        private static PSParameterValue GetAssignmentParameters(KeyValuePair<string, ParameterValue> parameterKvp)
        {
            PSParameterValue parameter = null;

            if (parameterKvp.Value?.Value != null)
            {
                // Need to cast as ParameterValue since assignment.Parameters value type is ParameterValueBase. 
                var parameterValue = parameterKvp.Value;

                parameter = new PSParameterValue { Value = parameterValue.Value };
            }
            else if (parameterKvp.Value?.Reference != null)
            {
                var parameterValue = parameterKvp.Value;
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e

                var secretReference = new PSSecretValueReference
                {
                    KeyVault = new PSKeyVaultReference { Id = parameterValue.Reference.KeyVault.Id },
                    SecretName = parameterValue.Reference.SecretName,
                    SecretVersion = parameterValue.Reference.SecretVersion
                };

<<<<<<< HEAD
                parameter = new PSSecretReferenceParameterValue { Reference = secretReference, Description = parameterValue.Description };
=======
                parameter = new PSParameterValue { Reference = secretReference };
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
            }

            return parameter;
        }
    }
}
