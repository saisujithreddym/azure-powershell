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

using Microsoft.Azure.Commands.Common.Authentication;
using Microsoft.Azure.Management.Internal.Resources;
using Microsoft.Azure.Management.Monitor;
using Microsoft.Azure.Management.Storage.Version2017_10_01;
using Microsoft.Azure.Management.ApplicationInsights.Management;
<<<<<<< HEAD
=======
using Microsoft.Azure.Management.Network;
using Microsoft.Azure.Management.OperationalInsights;
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
using Microsoft.Azure.Test.HttpRecorder;
using Microsoft.WindowsAzure.Commands.ScenarioTest;
using Microsoft.WindowsAzure.Commands.Test.Utilities.Common;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using RestTestFramework = Microsoft.Rest.ClientRuntime.Azure.TestFramework;
<<<<<<< HEAD
=======
using Microsoft.Azure.Internal.Common;
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e

namespace Microsoft.Azure.Commands.Insights.Test.ScenarioTests
{
    public sealed class TestsController : RMTestBase
    {
        private readonly EnvironmentSetupHelper _helper;

        public ResourceManagementClient ResourceManagementClient { get; private set; }

        public StorageManagementClient StorageManagementClient { get; private set; }

        public IMonitorManagementClient MonitorManagementClient { get; private set; }

        public ApplicationInsightsManagementClient ApplicationInsightsClient { get; private set; }

<<<<<<< HEAD
=======
        public NetworkManagementClient NetworkManagementClient { get; private set; }

        public AzureRestClient AzureRestClient { get; private set; }

        public OperationalInsightsManagementClient OperationalInsightsManagementClient { get; private set; }

>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
        public static TestsController NewInstance => new TestsController();

        public TestsController()
        {
            _helper = new EnvironmentSetupHelper();
        }

        public void RunPsTest(ServiceManagement.Common.Models.XunitTracingInterceptor logger, params string[] scripts)
        {
            var sf = new StackTrace().GetFrame(1);
            var callingClassType = sf.GetMethod().ReflectedType?.ToString();
            var mockName = sf.GetMethod().Name;

            _helper.TracingInterceptor = logger;
            RunPsTestWorkflow(
                () => scripts,
                // no custom cleanup 
                null,
                callingClassType,
                mockName);
        }

        public void RunPsTestWorkflow(
            Func<string[]> scriptBuilder,
            Action cleanup,
            string callingClassType,
            string mockName)
        {
            var providers = new Dictionary<string, string>()
            {
<<<<<<< HEAD
                { "Microsoft.Insights", null }
=======
                { "Microsoft.Insights", null },
                { "Microsoft.Network", null },
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
            };

            var providersToIgnore = new Dictionary<string, string>();
            providersToIgnore.Add("Microsoft.Azure.Management.Resources.ResourceManagementClient", "2016-02-01");

            HttpMockServer.Matcher = new PermissiveRecordMatcherWithApiExclusion(ignoreResourcesClient: true, providers: providers, userAgents: providersToIgnore);
            HttpMockServer.RecordsDirectory = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "SessionRecords");

            using (RestTestFramework.MockContext context = RestTestFramework.MockContext.Start(callingClassType, mockName))
            {
                SetupManagementClients(context);

                _helper.SetupEnvironment(AzureModule.AzureResourceManager);

                var callingClassName = callingClassType
                                        .Split(new[] { "." }, StringSplitOptions.RemoveEmptyEntries)
                                        .Last();
                _helper.SetupModules(AzureModule.AzureResourceManager,
                    _helper.RMProfileModule,
                    _helper.GetRMModulePath("AzureRM.Monitor.psd1"),
                    "ScenarioTests\\Common.ps1",
                    "ScenarioTests\\" + callingClassName + ".ps1",
                    "AzureRM.Storage.ps1",
                    "AzureRM.Resources.ps1",
<<<<<<< HEAD
                    _helper.GetRMModulePath("AzureRM.ApplicationInsights.psd1"));
=======
                    _helper.GetRMModulePath("AzureRM.ApplicationInsights.psd1"),
                    _helper.GetRMModulePath("AzureRM.OperationalInsights.psd1"),
                    _helper.GetRMModulePath("AzureRM.Network.psd1"));
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e

                try
                {
                    if (scriptBuilder != null)
                    {
                        var psScripts = scriptBuilder();

                        if (psScripts != null)
                        {
                            _helper.RunPowerShellTest(psScripts);
                        }
                    }
                }
                finally
                {
                    cleanup?.Invoke();
                }
            }
        }

        private void SetupManagementClients(RestTestFramework.MockContext context)
        {
            if (HttpMockServer.Mode == HttpRecorderMode.Record)
            {
                // This allows the use of a particular subscription if the user is associated to several
                // "TEST_CSM_ORGID_AUTHENTICATION=SubscriptionId=<subscription-id>"
                string subId = Environment.GetEnvironmentVariable("TEST_CSM_ORGID_AUTHENTICATION");
                RestTestFramework.TestEnvironment environment = new RestTestFramework.TestEnvironment(connectionString: subId);
                this.MonitorManagementClient = this.GetInsightsManagementClient(context: context, env: environment);
<<<<<<< HEAD
                ResourceManagementClient = this.GetResourceManagementClient(context: context, env: environment);
                StorageManagementClient = this.GetStorageManagementClient(context: context, env: environment);
                ApplicationInsightsClient = this.GetApplicationInsightsManagementClient(context: context, env: environment);
=======
                this.ResourceManagementClient = this.GetResourceManagementClient(context: context, env: environment);
                this.StorageManagementClient = this.GetStorageManagementClient(context: context, env: environment);
                this.ApplicationInsightsClient = this.GetApplicationInsightsManagementClient(context: context, env: environment);
                this.NetworkManagementClient = this.GetNetworkManagementClient(context: context, env: environment);
                this.AzureRestClient = this.GetAzureRestClient(context: context, env: environment);
                this.OperationalInsightsManagementClient = GetOperationalInsightsManagementClient(context: context, env: environment);
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
            }
            else if (HttpMockServer.Mode == HttpRecorderMode.Playback)
            {
                this.MonitorManagementClient = this.GetInsightsManagementClient(context: context, env: null);
                ResourceManagementClient = this.GetResourceManagementClient(context: context, env: null);
                StorageManagementClient = this.GetStorageManagementClient(context: context, env: null);
<<<<<<< HEAD
                ApplicationInsightsClient = GetApplicationInsightsManagementClient(context, env:null);
=======
                this.ApplicationInsightsClient = this.GetApplicationInsightsManagementClient(context: context, env: null);
                this.NetworkManagementClient = this.GetNetworkManagementClient(context: context, env: null);
                this.AzureRestClient = this.GetAzureRestClient(context: context, env: null);
                this.OperationalInsightsManagementClient = GetOperationalInsightsManagementClient(context: context, env: null);
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
            }

            _helper.SetupManagementClients(
                ResourceManagementClient,
                this.MonitorManagementClient,
                 StorageManagementClient,
<<<<<<< HEAD
                this.ApplicationInsightsClient);
=======
                this.ApplicationInsightsClient,
                this.NetworkManagementClient,
                this.AzureRestClient,
                this.OperationalInsightsManagementClient);
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
        }

        private ResourceManagementClient GetResourceManagementClient(RestTestFramework.MockContext context, RestTestFramework.TestEnvironment env)
        {
            return env != null
                ? context.GetServiceClient<ResourceManagementClient>(currentEnvironment:env)
                : context.GetServiceClient<ResourceManagementClient>();
        }

        private IMonitorManagementClient GetInsightsManagementClient(RestTestFramework.MockContext context, RestTestFramework.TestEnvironment env)
        {
            return env != null 
                ? context.GetServiceClient<MonitorManagementClient>(currentEnvironment: env) 
                : context.GetServiceClient<MonitorManagementClient>();
        }

        private StorageManagementClient GetStorageManagementClient(RestTestFramework.MockContext context, RestTestFramework.TestEnvironment env)
        {
            return env != null
                ? context.GetServiceClient<StorageManagementClient>(currentEnvironment: env)
                : context.GetServiceClient<StorageManagementClient>();
        }

        private ApplicationInsightsManagementClient GetApplicationInsightsManagementClient(RestTestFramework.MockContext context, RestTestFramework.TestEnvironment env)
        {
            return env != null
                ? context.GetServiceClient<ApplicationInsightsManagementClient>(currentEnvironment: env)
                : context.GetServiceClient<ApplicationInsightsManagementClient>();
        }
<<<<<<< HEAD
=======

        private NetworkManagementClient GetNetworkManagementClient(RestTestFramework.MockContext context, RestTestFramework.TestEnvironment env)
        {
            return env != null
                ? context.GetServiceClient<NetworkManagementClient>(currentEnvironment: env)
                : context.GetServiceClient<NetworkManagementClient>();
        }

        private AzureRestClient GetAzureRestClient(RestTestFramework.MockContext context, RestTestFramework.TestEnvironment env)
        {
            return env != null
                ? context.GetServiceClient<AzureRestClient>(currentEnvironment: env)
                : context.GetServiceClient<AzureRestClient>();
        }

        private OperationalInsightsManagementClient GetOperationalInsightsManagementClient(RestTestFramework.MockContext context, RestTestFramework.TestEnvironment env)
        {
            return env != null
                ? context.GetServiceClient<OperationalInsightsManagementClient>(currentEnvironment: env)
                : context.GetServiceClient<OperationalInsightsManagementClient>();
        }
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
    }
}
