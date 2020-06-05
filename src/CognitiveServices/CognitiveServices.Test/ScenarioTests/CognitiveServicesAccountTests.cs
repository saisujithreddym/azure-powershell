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


using Microsoft.Azure.Commands.Management.CognitiveServices.Test.ScenarioTests;
using Microsoft.Azure.Commands.ScenarioTest;
using Microsoft.Azure.ServiceManagement.Common.Models;
using Microsoft.WindowsAzure.Commands.ScenarioTest;
using Microsoft.WindowsAzure.Commands.Test.Utilities.Common;
using System;
using Xunit;
using Xunit.Abstractions;

namespace CognitiveServices.Test.ScenarioTests
{
    public class CognitiveServicesAccountTests : RMTestBase
    {
        XunitTracingInterceptor traceInterceptor;

        public CognitiveServicesAccountTests(ITestOutputHelper output)
        {
            this.traceInterceptor = new XunitTracingInterceptor(output);
            XunitTracingInterceptor.AddToContext(this.traceInterceptor);
            TestExecutionHelpers.SetUpSessionAndProfile();
        }

        [Fact]
        [Trait(Category.AcceptanceType, Category.CheckIn)]
        public void TestNewAccount()
        {
            TestController.NewInstance.RunPsTest(traceInterceptor, "Test-NewAzureRmCognitiveServicesAccount");
        }

        [Fact]
        [Trait(Category.AcceptanceType, Category.CheckIn)]
        public void TestNewAccountWithInvalidName()
        {
            TestController.NewInstance.RunPsTest(traceInterceptor, "Test-NewAzureRmCognitiveServicesAccountInvalidName");
        }

        [Fact]
        [Trait(Category.AcceptanceType, Category.CheckIn)]
        public void TestNewAccountWithCustomDomain()
        {
            TestController.NewInstance.RunPsTest(traceInterceptor, "Test-NewAzureRmCognitiveServicesAccountWithCustomDomain");
        }

        [Fact]
        [Trait(Category.AcceptanceType, Category.CheckIn)]
        public void TestNewAccountWithVnet()
        {
            TestController.NewInstance.RunPsTest(traceInterceptor, "Test-NewAzureRmCognitiveServicesAccountWithVnet");
        }

        [Fact]
        [Trait(Category.AcceptanceType, Category.CheckIn)]
        public void TestCreateAllKindsOfAccounts()
        {
            TestController.NewInstance.RunPsTest(traceInterceptor, "Test-NewAzureRmAllKindsOfCognitiveServicesAccounts");
        }

        [Fact]
        [Trait(Category.AcceptanceType, Category.CheckIn)]
        public void TestRemoveAccount()
        {
            TestController.NewInstance.RunPsTest(traceInterceptor, "Test-RemoveAzureRmCognitiveServicesAccount");
        }


        [Fact]
        [Trait(Category.AcceptanceType, Category.CheckIn)]
        public void TestGetAccounts()
        {
            TestController.NewInstance.RunPsTest(traceInterceptor, "Test-GetAzureCognitiveServiceAccount");
        }
<<<<<<< HEAD
=======

        [Fact]
        [Trait(Category.AcceptanceType, Category.CheckIn)]
        public void TestAsyncAccountOperations()
        {
            TestController.NewInstance.RunPsTest(traceInterceptor, "Test-AsyncAccountOperations");
        }

>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
        [Fact]
        [Trait(Category.AcceptanceType, Category.CheckIn)]
        public void TestSetAccount()
        {
            TestController.NewInstance.RunPsTest(traceInterceptor, "Test-SetAzureRmCognitiveServicesAccount");
        }

        [Fact]
        [Trait(Category.AcceptanceType, Category.CheckIn)]
        public void TestSetAccountWithCustomDomain()
        {
            TestController.NewInstance.RunPsTest(traceInterceptor, "Test-SetAzureRmCognitiveServicesAccountWithCustomDomain");
        }

        [Fact]
        [Trait(Category.AcceptanceType, Category.CheckIn)]
        public void TestSetAccountWithVnet()
        {
            TestController.NewInstance.RunPsTest(traceInterceptor, "Test-SetAzureRmCognitiveServicesAccountWithVnet");
        }

        [Fact]
        [Trait(Category.AcceptanceType, Category.CheckIn)]
        public void TestNetworkRuleSet()
        {
            TestController.NewInstance.RunPsTest(traceInterceptor, "Test-NetworkRuleSet");
        }

        [Fact]
        [Trait(Category.AcceptanceType, Category.CheckIn)]
        public void TestGetAccountKeys()
        {
            TestController.NewInstance.RunPsTest(traceInterceptor, "Test-GetAzureRmCognitiveServicesAccountKey");
        }

        [Fact]
        [Trait(Category.AcceptanceType, Category.CheckIn)]
        public void TestNewAccountKey()
        {
            TestController.NewInstance.RunPsTest(traceInterceptor, "Test-NewAzureRmCognitiveServicesAccountKey");
        }

        [Fact]
        [Trait(Category.AcceptanceType, Category.CheckIn)]
        public void TestAccountSkus()
        {
            TestController.NewInstance.RunPsTest(traceInterceptor, "Test-GetAzureRmCognitiveServicesAccountSkus");
        }

        [Fact]
        [Trait(Category.AcceptanceType, Category.CheckIn)]
        public void TestGetAccountType()
        {
            TestController.NewInstance.RunPsTest(traceInterceptor, "Test-GetAzureRmCognitiveServicesAccountType");
        }

        [Fact]
        [Trait(Category.AcceptanceType, Category.CheckIn)]
        public void TestPipingToGetKey()
        {
            TestController.NewInstance.RunPsTest(traceInterceptor, "Test-PipingGetAccountToGetKey");
        }

        [Fact]
        [Trait(Category.AcceptanceType, Category.CheckIn)]
        public void TestPipingToSetAccount()
        {
            TestController.NewInstance.RunPsTest(traceInterceptor, "Test-PipingToSetAzureAccount");
        }

        [Fact]
        [Trait(Category.AcceptanceType, Category.CheckIn)]
        public void TestMinMaxAccountNames()
        {
            TestController.NewInstance.RunPsTest(traceInterceptor, "Test-MinMaxAccountName");
        }
        

        [Fact]
        [Trait(Category.AcceptanceType, Category.CheckIn)]
        public void TestGetUsages()
        {
            TestController.NewInstance.RunPsTest(traceInterceptor, "Test-GetUsages");
        }
<<<<<<< HEAD
=======

        [Fact]
        [Trait(Category.AcceptanceType, Category.CheckIn)]
        public void TestManagedIdentity()
        {
            TestController.NewInstance.RunPsTest(traceInterceptor, "Test-ManagedIdentity");
        }

        [Fact]
        [Trait(Category.AcceptanceType, Category.CheckIn)]
        public void TestEncryption()
        {
            TestController.NewInstance.RunPsTest(traceInterceptor, "Test-Encryption");
        }

        [Fact]
        [Trait(Category.AcceptanceType, Category.CheckIn)]
        public void TestUserOwnedStorage()
        {
            TestController.NewInstance.RunPsTest(traceInterceptor, "Test-UserOwnedStorage");
        }
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
    }
}
