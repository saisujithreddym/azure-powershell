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

namespace Microsoft.Azure.Commands.Peering.Test.ScenarioTests
{
    using System;
    using System.Collections.Generic;
    using System.Diagnostics;
    using System.IO;
    using System.Linq;

    using Microsoft.Azure.Commands.Common.Authentication;
<<<<<<< HEAD
    using Microsoft.Azure.Management.Internal.Resources;
    using Microsoft.Azure.Management.Peering;
=======
    using Microsoft.Azure.Management.Peering;
    using Microsoft.Azure.Management.ResourceManager;
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
    using Microsoft.Azure.Test.HttpRecorder;
    using Microsoft.Rest.ClientRuntime.Azure.TestFramework;
    using Microsoft.WindowsAzure.Commands.ScenarioTest;
    using Microsoft.WindowsAzure.Commands.Test.Utilities.Common;
<<<<<<< HEAD

    public class TestController : RMTestBase
    {
=======
    using Moq;

    public class TestController : RMTestBase
    {
        private const string localEndPoint = "https://secrets.wanrr-test.radar.core.azure-test.net";

>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
        private readonly EnvironmentSetupHelper _helper;

        public ResourceManagementClient ResourceManagementClient { get; private set; }

        public PeeringManagementClient PeeringManagementClient { get; private set; }

<<<<<<< HEAD
=======
        public SubscriptionClient SubscriptionClient { get; private set; }

>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
        public static TestController NewInstance => new TestController();

        protected TestController()
        {
            this._helper = new EnvironmentSetupHelper();
        }

        protected void SetupManagementClients(MockContext context)
        {
<<<<<<< HEAD
            this.ResourceManagementClient = this.GetResourceManagementClient(context);
            this.PeeringManagementClient = GetEdgeManagementClient(context);

            this._helper.SetupManagementClients(
                this.ResourceManagementClient,
                this.PeeringManagementClient);
=======
            this.ResourceManagementClient = GetResourceManagementClient(context);
            this.PeeringManagementClient = GetEdgeManagementClient(context);
            this.SubscriptionClient = GetSubscriptionManagementClient(context);

            this._helper.SetupManagementClients(
                this.ResourceManagementClient,
                this.PeeringManagementClient,
                this.SubscriptionClient);
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
        }

        public void RunPowerShellTest(ServiceManagement.Common.Models.XunitTracingInterceptor logger, params string[] scripts)
        {
            var sf = new StackTrace().GetFrame(1);
            var callingClassType = sf.GetMethod().ReflectedType?.ToString();
            var mockName = sf.GetMethod().Name;

            this._helper.TracingInterceptor = logger;
            this.RunPsTestWorkflow(
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

            var d = new Dictionary<string, string>
            {
                {"Microsoft.Resources", null},
                {"Microsoft.Features", null},
                {"Microsoft.Authorization", null},
                {"Microsoft.Compute", null}
            };
            var providersToIgnore = new Dictionary<string, string>
            {
                {"Microsoft.Azure.Management.Resources.ResourceManagementClient", "2016-02-01"}
            };
            HttpMockServer.Matcher = new PermissiveRecordMatcherWithApiExclusion(true, d, providersToIgnore);

            HttpMockServer.RecordsDirectory = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "SessionRecords");

            using (var context = MockContext.Start(callingClassType, mockName))
            {
                this.SetupManagementClients(context);

                this._helper.SetupEnvironment(AzureModule.AzureResourceManager);

                var callingClassName = callingClassType.Split(new[] { "." }, StringSplitOptions.RemoveEmptyEntries).Last();

                this._helper.SetupModules(
                    AzureModule.AzureResourceManager,
<<<<<<< HEAD
                    "ScenarioTests\\PeeringCommon.ps1",
=======
                    $"ScenarioTests\\PeeringCommon.ps1",
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
                    "ScenarioTests\\" + callingClassName + ".ps1",
                    this._helper.RMProfileModule,
                    this._helper.RMResourceModule,
                    this._helper.GetRMModulePath("Az.Peering.psd1"));
                try
                {
                    var psScripts = scriptBuilder?.Invoke();
                    if (psScripts != null)
                    {
                        this._helper.RunPowerShellTest(psScripts);
                    }
                }
                finally
                {
                    cleanup?.Invoke();
                }
            }
        }

<<<<<<< HEAD
        protected ResourceManagementClient GetResourceManagementClient(MockContext context)
=======
        private static ResourceManagementClient GetResourceManagementClient(MockContext context)
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
        {
            return context.GetServiceClient<ResourceManagementClient>(TestEnvironmentFactory.GetTestEnvironment());
        }

        private static PeeringManagementClient GetEdgeManagementClient(MockContext context)
        {
            return context.GetServiceClient<PeeringManagementClient>(TestEnvironmentFactory.GetTestEnvironment());
        }
<<<<<<< HEAD
=======

        private static SubscriptionClient GetSubscriptionManagementClient(MockContext context)
        {
            var subContext = context.GetServiceClient<SubscriptionClient>(TestEnvironmentFactory.GetTestEnvironment());
            return subContext;
        }
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
    }
}
