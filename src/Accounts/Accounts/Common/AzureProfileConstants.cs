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

<<<<<<< HEAD
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
=======
using Microsoft.Azure.Commands.Profile.Properties;
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e

namespace Microsoft.Azure.Commands.Profile.Common
{
    public static class AzureProfileConstants
    {
        public const string AzureAutosaveVariable = "Azure_Profile_Autosave";
<<<<<<< HEAD
=======

        public const string AzureSurveyUrl = "https://aka.ms/azpssurvey?Q_CHL=FEEDBACK";

        public const string AzureSurveyUrlForError = "https://aka.ms/azpssurvey?Q_CHL=ERROR";

        public static readonly string AzurePowerShellFeedbackMessage = string.Format(Resources.AzurePowerShellFeedback, AzureProfileConstants.AzureSurveyUrlForError);

        public static readonly string AzurePowerShellFeedbackQuestion = string.Format(Resources.SendFeedbackOpenLinkAutomatically, AzureProfileConstants.AzureSurveyUrl);

        public static readonly string AzurePowerShellFeedbackManually = string.Format(Resources.SendFeedbackOpenLinkManually, AzureProfileConstants.AzureSurveyUrl);

        public static readonly string AzurePowerShellFeedbackWarning = string.Format(Resources.DefaultBrowserOpenFailure, AzureProfileConstants.AzureSurveyUrl);
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
    }
}
