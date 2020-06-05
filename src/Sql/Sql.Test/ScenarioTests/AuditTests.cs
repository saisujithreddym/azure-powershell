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

using Microsoft.Azure.Commands.ScenarioTest.SqlTests;
using Microsoft.WindowsAzure.Commands.ScenarioTest;
using Xunit;
using Xunit.Abstractions;
using RestTestFramework = Microsoft.Rest.ClientRuntime.Azure.TestFramework;

namespace Microsoft.Azure.Commands.Sql.Test.ScenarioTests
{
    public class AuditTests : SqlTestsBase
    {
        protected override void SetupManagementClients(RestTestFramework.MockContext context)
        {
            var sqlClient = GetSqlClient(context);
            var storageV2Client = GetStorageManagementClient(context);
            var newResourcesClient = GetResourcesClient(context);
            var monitorManagementClient = GetMonitorManagementClient(context);
            var commonMonitorManagementClient = GetCommonMonitorManagementClient(context);
            var eventHubManagementClient = GetEventHubManagementClient(context);
            var operationalInsightsManagementClient = GetOperationalInsightsManagementClient(context);
            Helper.SetupSomeOfManagementClients(sqlClient, storageV2Client, storageV2Client,
                newResourcesClient, monitorManagementClient, commonMonitorManagementClient,
                eventHubManagementClient, operationalInsightsManagementClient);
        }

        public AuditTests(ITestOutputHelper output) : base(output)
        {
<<<<<<< HEAD
        }

        [Fact]
=======
            base.resourceTypesToIgnoreApiVersion = new string[] {
                "Microsoft.Sql/servers"
            };
        }

        [Fact(Skip = "not able to re - record because cannot create sql server in region 'West Central US'")]
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
        [Trait(Category.AcceptanceType, Category.CheckIn)]
        public void TestBlobAuditDatabaseUpdatePolicyWithStorage()
        {
            RunPowerShellTest("Test-BlobAuditDatabaseUpdatePolicyWithStorage");
        }

<<<<<<< HEAD
        [Fact]
=======
        [Fact(Skip = "not able to re-record because cannot create sql server in region 'West Central US'")]
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
        [Trait(Category.AcceptanceType, Category.CheckIn)]
        public void TestBlobAuditServerUpdatePolicyWithStorage()
        {
            RunPowerShellTest("Test-BlobAuditServerUpdatePolicyWithStorage");
        }

<<<<<<< HEAD
        [Fact]
=======
        [Fact(Skip = "not able to re-record because cannot create sql server in region 'West Central US'")]
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
        [Trait(Category.AcceptanceType, Category.CheckIn)]
        public void TestBlobAuditDisableDatabaseAudit()
        {
            RunPowerShellTest("Test-BlobAuditDisableDatabaseAudit");
        }

<<<<<<< HEAD
        [Fact]
=======
        [Fact(Skip = "not able to re-record because cannot create sql server in region 'West Central US'")]
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
        [Trait(Category.AcceptanceType, Category.CheckIn)]
        public void TestBlobAuditDisableServerAudit()
        {
            RunPowerShellTest("Test-BlobAuditDisableServerAudit");
        }

<<<<<<< HEAD
        [Fact]
=======
        [Fact(Skip = "not able to re-record because cannot create sql server in region 'West Central US'")]
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
        [Trait(Category.AcceptanceType, Category.CheckIn)]
        public void TestBlobAuditFailedDatabaseUpdatePolicyWithNoStorage()
        {
            RunPowerShellTest("Test-BlobAuditFailedDatabaseUpdatePolicyWithNoStorage");
        }

<<<<<<< HEAD
        [Fact]
=======
        [Fact(Skip = "not able to re-record because cannot create sql server in region 'West Central US'")]
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
        [Trait(Category.AcceptanceType, Category.CheckIn)]
        public void TestBlobAuditFailedServerUpdatePolicyWithNoStorage()
        {
            RunPowerShellTest("Test-BlobAuditFailedServerUpdatePolicyWithNoStorage");
        }

<<<<<<< HEAD
        [Fact]
=======
        [Fact(Skip = "not able to re-record because cannot create sql server in region 'West Central US'")]
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
        [Trait(Category.AcceptanceType, Category.CheckIn)]
        public void TestBlobAuditDatabaseUpdatePolicyKeepPreviousStorage()
        {
            RunPowerShellTest("Test-BlobAuditDatabaseUpdatePolicyKeepPreviousStorage");
        }

<<<<<<< HEAD
        [Fact]
=======
        [Fact(Skip = "not able to re-record because cannot create sql server in region 'West Central US'")]
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
        [Trait(Category.AcceptanceType, Category.CheckIn)]
        public void TestBlobAuditServerUpdatePolicyKeepPreviousStorage()
        {
            RunPowerShellTest("Test-BlobAuditServerUpdatePolicyKeepPreviousStorage");
        }

<<<<<<< HEAD
        [Fact]
=======
        [Fact(Skip = "not able to re-record because cannot create sql server in region 'West Central US'")]
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
        [Trait(Category.AcceptanceType, Category.CheckIn)]
        public void TestBlobAuditFailWithBadDatabaseIndentity()
        {
            RunPowerShellTest("Test-BlobAuditFailWithBadDatabaseIndentity");
        }

<<<<<<< HEAD
        [Fact]
=======
        [Fact(Skip = "not able to re-record because cannot create sql server in region 'West Central US'")]
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
        [Trait(Category.AcceptanceType, Category.CheckIn)]
        public void TestBlobAuditFailWithBadServerIndentity()
        {
            RunPowerShellTest("Test-BlobAuditFailWithBadServerIndentity");
        }

<<<<<<< HEAD
        [Fact]
=======
        [Fact(Skip = "not able to re-record because cannot create sql server in region 'West Central US'")]
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
        [Trait(Category.AcceptanceType, Category.CheckIn)]
        public void TestBlobAuditDatabaseStorageKeyRotation()
        {
            RunPowerShellTest("Test-BlobAuditDatabaseStorageKeyRotation");
        }

<<<<<<< HEAD
        [Fact]
=======
        [Fact(Skip = "not able to re-record because cannot create sql server in region 'West Central US'")]
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
        [Trait(Category.AcceptanceType, Category.CheckIn)]
        public void TestBlobAuditServerStorageKeyRotation()
        {
            RunPowerShellTest("Test-BlobAuditServerStorageKeyRotation");
        }

<<<<<<< HEAD
        [Fact]
=======
        [Fact(Skip = "not able to re-record because cannot create sql server in region 'West Central US'")]
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
        [Trait(Category.AcceptanceType, Category.CheckIn)]
        public void TestBlobAuditServerRetentionKeepProperties()
        {
            RunPowerShellTest("Test-BlobAuditServerRetentionKeepProperties");
        }

<<<<<<< HEAD
        [Fact]
=======
        [Fact(Skip = "not able to re-record because cannot create sql server in region 'West Central US'")]
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
        [Trait(Category.AcceptanceType, Category.CheckIn)]
        public void TestBlobAuditDatabaseRetentionKeepProperties()
        {
            RunPowerShellTest("Test-BlobAuditDatabaseRetentionKeepProperties");
        }

<<<<<<< HEAD
        [Fact]
=======
        [Fact(Skip = "not able to re-record because cannot create sql server in region 'West Central US'")]
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
        [Trait(Category.AcceptanceType, Category.CheckIn)]
        public void TestBlobAuditOnDatabase()
        {
            RunPowerShellTest("Test-BlobAuditOnDatabase");
        }

<<<<<<< HEAD
        [Fact]
=======
        [Fact(Skip = "not able to re-record because cannot create sql server in region 'West Central US'")]
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
        [Trait(Category.AcceptanceType, Category.CheckIn)]
        public void TestBlobAuditOnServer()
        {
            RunPowerShellTest("Test-BlobAuditOnServer");
        }

<<<<<<< HEAD
        [Fact]
=======
        [Fact(Skip = "not able to re-record because cannot create sql server in region 'West Central US'")]
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
        [Trait(Category.AcceptanceType, Category.CheckIn)]
        public void TestBlobAuditDatabaseUpdatePolicyWithSameNameStorageOnDifferentRegion()
        {
            RunPowerShellTest("Test-BlobAuditDatabaseUpdatePolicyWithSameNameStorageOnDifferentRegion");
        }

<<<<<<< HEAD
        [Fact]
=======
        [Fact(Skip = "not able to re-record because cannot create sql server in region 'West Central US'")]
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
        [Trait(Category.AcceptanceType, Category.CheckIn)]
        public void TestBlobAuditWithAuditActionGroups()
        {
            RunPowerShellTest("Test-BlobAuditWithAuditActionGroups");
        }

<<<<<<< HEAD
        [Fact]
=======
        [Fact(Skip = "not able to re-record because cannot create sql server in region 'West Central US'")]
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
        [Trait(Category.AcceptanceType, Category.CheckIn)]
        public void TestExtendedAuditOnDatabase()
        {
            RunPowerShellTest("Test-ExtendedAuditOnDatabase");
        }

<<<<<<< HEAD
        [Fact]
=======
        [Fact(Skip = "not able to re-record because cannot create sql server in region 'West Central US'")]
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
        [Trait(Category.AcceptanceType, Category.CheckIn)]
        public void TestExtendedAuditOnServer()
        {
            RunPowerShellTest("Test-ExtendedAuditOnServer");
        }

<<<<<<< HEAD
        [Fact]
=======
        [Fact(Skip = "not able to re-record because cannot create sql server in region 'West Central US'")]
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
        [Trait(Category.AcceptanceType, Category.CheckIn)]
        [Trait(Category.RunType, Category.LiveOnly)]
        public void TestAuditOnDatabase()
        {
            RunPowerShellTest("Test-AuditOnDatabase");
        }

<<<<<<< HEAD
        [Fact]
=======
        [Fact(Skip = "not able to re-record because cannot create sql server in region 'West Central US'")]
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
        [Trait(Category.AcceptanceType, Category.CheckIn)]
        [Trait(Category.RunType, Category.LiveOnly)]
        public void TestAuditOnServer()
        {
            RunPowerShellTest("Test-AuditOnServer");
        }

<<<<<<< HEAD
        [Fact]
=======
        [Fact(Skip = "not able to re-record because cannot create sql server in region 'West Central US'")]
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
        [Trait(Category.AcceptanceType, Category.CheckIn)]
        public void TestNewDatabaseAuditDiagnosticsAreCreatedOnNeed()
        {
            RunPowerShellTest("Test-NewDatabaseAuditDiagnosticsAreCreatedOnNeed");
        }

<<<<<<< HEAD
        [Fact]
=======
        [Fact(Skip = "not able to re-record because cannot create sql server in region 'West Central US'")]
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
        [Trait(Category.AcceptanceType, Category.CheckIn)]
        public void TestNewServerAuditDiagnosticsAreCreatedOnNeed()
        {
            RunPowerShellTest("Test-NewServerAuditDiagnosticsAreCreatedOnNeed");
        }

<<<<<<< HEAD
        [Fact]
=======
        [Fact(Skip = "not able to re-record because cannot create sql server in region 'West Central US'")]
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
        [Trait(Category.AcceptanceType, Category.CheckIn)]
        public void TestRemoveAuditOnServer()
        {
            RunPowerShellTest("Test-RemoveAuditOnServer");
        }

<<<<<<< HEAD
        [Fact]
=======
        [Fact(Skip = "not able to re-record because cannot create sql server in region 'West Central US'")]
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
        [Trait(Category.AcceptanceType, Category.CheckIn)]
        public void TestRemoveAuditOnDatabase()
        {
            RunPowerShellTest("Test-RemoveAuditOnDatabase");
        }

<<<<<<< HEAD
        [Fact]
=======
        [Fact(Skip = "not able to re-record because cannot create sql server in region 'West Central US'")]
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
        [Trait(Category.AcceptanceType, Category.CheckIn)]
        public void TestRemoveDatabaseAuditingSettingsMultipleDiagnosticSettings()
        {
            RunPowerShellTest("Test-RemoveDatabaseAuditingSettingsMultipleDiagnosticSettings");
        }

<<<<<<< HEAD
        [Fact]
=======
        [Fact(Skip = "not able to re-record because cannot create sql server in region 'West Central US'")]
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
        [Trait(Category.AcceptanceType, Category.CheckIn)]
        public void TestRemoveServerAuditingSettingsMultipleDiagnosticSettings()
        {
            RunPowerShellTest("Test-RemoveServerAuditingSettingsMultipleDiagnosticSettings");
        }
<<<<<<< HEAD
=======

        [Fact(Skip = "not able to re-record because cannot create sql server in region 'West Central US'")]
        [Trait(Category.AcceptanceType, Category.CheckIn)]
        public void TestServerAuditingToStorageInVNet()
        {
            RunPowerShellTest("Test-ServerAuditingToStorageInVNet");
        }

        [Fact(Skip = "not able to re-record because cannot create sql server in region 'West Central US'")]
        [Trait(Category.AcceptanceType, Category.CheckIn)]
        public void TestDatabaseAuditingToStorageInVNet()
        {
            RunPowerShellTest("Test-DatabaseAuditingToStorageInVNet");
        }
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
    }
}
