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

using Microsoft.Azure.Commands.Common.Authentication;
using Microsoft.Azure.Management.HDInsight;
using Microsoft.Azure.Management.Internal.Resources;
using Microsoft.Azure.Management.OperationalInsights;
<<<<<<< HEAD
=======
using Microsoft.Azure.Management.ManagedServiceIdentity;
using Microsoft.Azure.Management.KeyVault;
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
using Microsoft.Azure.Management.Storage.Version2017_10_01;
using Microsoft.Azure.ServiceManagement.Common.Models;
using Microsoft.Azure.Test.HttpRecorder;
using Microsoft.Rest.ClientRuntime.Azure.TestFramework;
using Microsoft.WindowsAzure.Commands.ScenarioTest;
using Microsoft.WindowsAzure.Commands.Test.Utilities.Common;
<<<<<<< HEAD
=======
using Microsoft.Azure.KeyVault;
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;

namespace Commands.HDInsight.Test.ScenarioTests
{
    public class TestController : RMTestBase
    {
        private readonly EnvironmentSetupHelper _helper;

        public ResourceManagementClient ResourceManagementClient { get; private set; }
<<<<<<< HEAD

        public HDInsightManagementClient HDInsightManagementClient { get; private set; }
        public StorageManagementClient StorageManagementClient { get; private set; }
        public OperationalInsightsManagementClient OperationalInsightsManagementClient { get; private set; }

        public static TestController NewInstance => new TestController();

=======
        public HDInsightManagementClient HDInsightManagementClient { get; private set; }
        public StorageManagementClient StorageManagementClient { get; private set; }
        public OperationalInsightsManagementClient OperationalInsightsManagementClient { get; private set; }
        public KeyVaultManagementClient KeyVaultManagementClient { get; private set; }
        public KeyVaultClient KeyVaultClient { get; private set; }
        public ManagedServiceIdentityClient ManagedServiceIdentityClient { get; private set; }
        public static TestHelper TestHelper { get; private set; }
        public static TestController NewInstance => new TestController();
        
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
        protected TestController()
        {
            _helper = new EnvironmentSetupHelper();
        }

        protected void SetupManagementClient(MockContext context)
        {
            ResourceManagementClient = GetResourceManagementClient(context);
            HDInsightManagementClient = GetHDInsightManagementClient(context);
            StorageManagementClient = GetStorageManagementClient(context);
            OperationalInsightsManagementClient = GetOperationalInsightsManagementClient(context);
<<<<<<< HEAD

            _helper.SetupManagementClients(ResourceManagementClient, HDInsightManagementClient, StorageManagementClient, OperationalInsightsManagementClient);
=======
            KeyVaultManagementClient = GetKeyVaultManagementClient(context);
            ManagedServiceIdentityClient = GetManagedServiceIdentityClient(context);
            _helper.SetupManagementClients(ResourceManagementClient, HDInsightManagementClient, StorageManagementClient, OperationalInsightsManagementClient, KeyVaultManagementClient, ManagedServiceIdentityClient);
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
        }

        public void RunPowerShellTest(XunitTracingInterceptor logger, params string[] scripts)
        {
            var sf = new StackTrace().GetFrame(1);

            var callingClassType = sf.GetMethod().ReflectedType?.ToString();
            var mockName = sf.GetMethod().Name;

            _helper.TracingInterceptor = logger;

            RunPsTestWorkFlow(
                () => scripts,
                // no custom cleanup
                null,
                callingClassType,
                mockName);
        }

<<<<<<< HEAD
        public void RunPsTestWorkFlow(Func<string[]> scriptBuilder, Action cleanup, string callingClassType, string mockName)
=======
        public void RunPsTestWorkFlow(Func<string[]> scriptBuilder, System.Action cleanup, string callingClassType, string mockName)
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
        {
            var d = new Dictionary<string, string>
            {
                {"Microsoft.Resources", null},
                {"Microsoft.Features", null},
                {"Microsoft.Authorization", null}
            };

            var providerToIgnore = new Dictionary<string, string>
            {
                {"Microsoft.Azure.Management.Resources.ResourceManagementClient", "2016-02-01"}
            };

            HttpMockServer.Matcher = new PermissiveRecordMatcherWithApiExclusion(true, d, providerToIgnore);
            HttpMockServer.RecordsDirectory = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "SessionRecords");

            using (var context = MockContext.Start(callingClassType, mockName))
            {
                SetupManagementClient(context);
                _helper.SetupEnvironment(AzureModule.AzureResourceManager);
<<<<<<< HEAD
=======
                KeyVaultClient = GetKeyVaultClient();
                TestHelper = GetTestHelper();
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e

                var callingClassName = callingClassType.Split(new[] { "." }, StringSplitOptions.RemoveEmptyEntries).Last();

                _helper.SetupModules(AzureModule.AzureResourceManager,
                    "ScenarioTests\\Common.ps1",
                    "ScenarioTests\\" + callingClassName + ".ps1",
                    _helper.RMProfileModule,
                    _helper.GetRMModulePath(@"AzureRM.HDInsight.psd1"),
                    _helper.GetRMModulePath("AzureRM.OperationalInsights.psd1"),
<<<<<<< HEAD
=======
                    _helper.GetRMModulePath("AzureRM.ManagedServiceIdentity.psd1"),
                    _helper.RMKeyVaultModule,
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
                    "AzureRM.Storage.ps1",
                    "AzureRM.Resources.ps1");
                try
                {
                    var psScripts = scriptBuilder?.Invoke();
                    if (psScripts != null)
                    {
                        _helper.RunPowerShellTest(psScripts);
                    }
                }
                finally
                {
                    cleanup?.Invoke();
                }
            }
        }

        protected ResourceManagementClient GetResourceManagementClient(MockContext context)
        {
            return context.GetServiceClient<ResourceManagementClient>(TestEnvironmentFactory.GetTestEnvironment());
        }

        private static HDInsightManagementClient GetHDInsightManagementClient(MockContext context)
        {
            return context.GetServiceClient<HDInsightManagementClient>(TestEnvironmentFactory.GetTestEnvironment());
        }

        private static StorageManagementClient GetStorageManagementClient(MockContext context)
        {
            return context.GetServiceClient<StorageManagementClient>(TestEnvironmentFactory.GetTestEnvironment());
        }

        private static OperationalInsightsManagementClient GetOperationalInsightsManagementClient(MockContext context)
        {
            return context.GetServiceClient<OperationalInsightsManagementClient>(TestEnvironmentFactory.GetTestEnvironment());
        }
<<<<<<< HEAD
=======

        private static KeyVaultManagementClient GetKeyVaultManagementClient(MockContext context)
        {
            return context.GetServiceClient<KeyVaultManagementClient>(TestEnvironmentFactory.GetTestEnvironment());
        }

        private static KeyVaultClient GetKeyVaultClient()
        {
            return new KeyVaultClient(TestHelper.GetAccessToken, TestHelper.GetHandlers());
        }

        private static ManagedServiceIdentityClient GetManagedServiceIdentityClient(MockContext context)
        {
            return context.GetServiceClient<ManagedServiceIdentityClient>(TestEnvironmentFactory.GetTestEnvironment());
        }

        private TestHelper GetTestHelper()
        {
            return new TestHelper(KeyVaultManagementClient, KeyVaultClient);
        }
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
    }
}
