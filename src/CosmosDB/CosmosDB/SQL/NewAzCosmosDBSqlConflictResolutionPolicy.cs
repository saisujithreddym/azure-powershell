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

using System.Management.Automation;
using Microsoft.Azure.Commands.ResourceManager.Common.ArgumentCompleters;
using Microsoft.Azure.Commands.CosmosDB.Helpers;
using Microsoft.Azure.Commands.CosmosDB.Models;
<<<<<<< HEAD
=======
using Microsoft.Azure.Management.CosmosDB.Models;
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e

namespace Microsoft.Azure.Commands.CosmosDB
{
    [Cmdlet(VerbsCommon.New, ResourceManager.Common.AzureRMConstants.AzureRMPrefix + "CosmosDBSqlConflictResolutionPolicy"), OutputType(typeof(PSSqlConflictResolutionPolicy))]
    public class NewAzCosmosDBSqlConflictResolutionPolicy : AzureCosmosDBCmdletBase
    {
<<<<<<< HEAD
        [Parameter(Mandatory = true, HelpMessage = Constants.ConflictResolutionPolicyTypeHelpMessage)]
        [ValidateNotNullOrEmpty]
        [PSArgumentCompleter("LastWriterWins", "Custom", "Manual")]
=======
        [Parameter(Mandatory = true, HelpMessage = Constants.ConflictResolutionPolicyModeHelpMessage)]
        [ValidateNotNullOrEmpty]
        [PSArgumentCompleter(ConflictResolutionMode.Custom, ConflictResolutionMode.LastWriterWins)]
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
        public string Type { get; set; }

        [Parameter(Mandatory = false, HelpMessage = Constants.ConflictResolutionPolicyPathHelpMessage)]
        public string Path { get; set; }

<<<<<<< HEAD
        [Parameter(Mandatory = false, HelpMessage = Constants.ConflictResolutionPolicyStoredProcedureNameHelpMessage)]
=======
        [Parameter(Mandatory = false, HelpMessage = Constants.ConflictResolutionPolicyProcedureHelpMessage)]
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
        [ValidateNotNullOrEmpty]
        public string ConflictResolutionProcedure { get; set; }

        public override void ExecuteCmdlet()
        {
<<<<<<< HEAD
            PSSqlConflictResolutionPolicy conflictResolutionPolicy = new PSSqlConflictResolutionPolicy(Type);

            if (!string.IsNullOrEmpty(Path))
                conflictResolutionPolicy.Path = Path;
=======
            PSSqlConflictResolutionPolicy conflictResolutionPolicy = new PSSqlConflictResolutionPolicy
            {
                Mode = Type
            };

            if (!string.IsNullOrEmpty(Path))
                conflictResolutionPolicy.ConflictResolutionPath = Path;
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e

            if (!string.IsNullOrEmpty(ConflictResolutionProcedure))
                conflictResolutionPolicy.ConflictResolutionProcedure = ConflictResolutionProcedure;

            WriteObject(conflictResolutionPolicy);
            return;
        }
    }

<<<<<<< HEAD
}
=======
}
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
