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

using System;
using System.IO;
using Microsoft.Azure.Commands.Attestation.Models;
using Microsoft.Azure.Commands.Attestation.Properties;
using Microsoft.Azure.Commands.ResourceManager.Common.ArgumentCompleters;
using System.Management.Automation;
using System.Security.Cryptography.X509Certificates;
using Microsoft.Azure.Management.Attestation.Models;
using AttestationProperties = Microsoft.Azure.Commands.Attestation.Properties;
<<<<<<< HEAD
=======
using System.Collections;
using Microsoft.Azure.Commands.ResourceManager.Common.Tags;
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e

namespace Microsoft.Azure.Commands.Attestation
{
    /// <summary>
    /// Create a new Attestation.
    /// </summary>
    [Cmdlet("New", ResourceManager.Common.AzureRMConstants.AzureRMPrefix + "Attestation",SupportsShouldProcess = true)]
    [OutputType(typeof(PSAttestation))] 
    public class NewAzureAttestation : AttestationManagementCmdletBase
    {
        #region Input Parameter Definitions

        /// <summary>
        /// Instance name
        /// </summary>
        [Parameter(Mandatory = true,
            ValueFromPipelineByPropertyName = true,
            HelpMessage =
<<<<<<< HEAD
                "Specifies a name of the Instance to create. The name can be any combination of letters, digits, or hyphens. The name must start and end with a letter or digit. The name must be universally unique."
=======
                "Specifies the attestation provider name. The name can be any combination of letters, digits, or hyphens. The name must start and end with a letter or digit. The name must be universally unique."
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
            )]
        [ValidateNotNullOrEmpty]
        [Alias("InstanceName")]
        public string Name { get; set; }
<<<<<<< HEAD
=======
        
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
        /// <summary>
        /// Resource group name
        /// </summary>
        [Parameter(Mandatory = true,
            ValueFromPipelineByPropertyName = true,
<<<<<<< HEAD
            HelpMessage = "Specifies the name of an existing resource group in which to create the attestation.")]
=======
            HelpMessage = "Specifies the name of an existing resource group in which to create the attestation provider.")]
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
        [ResourceGroupCompleter]
        [ValidateNotNullOrEmpty()]
        public string ResourceGroupName { get; set; }

<<<<<<< HEAD

        [Parameter(Mandatory = false,
            ValueFromPipelineByPropertyName = true,
            HelpMessage =
                "Specifies the attestation policy passed in which to create the attestation."
        )]
        public string AttestationPolicy { get; set; }
=======
        /// <summary>
        /// Location
        /// </summary>
        [Parameter(Mandatory = true,
            ValueFromPipelineByPropertyName = true,
            HelpMessage = "Specifies the Azure region in which to create the attestation provider. Use the command Get-AzResourceProvider with the ProviderNamespace parameter to see your choices.")]
        [LocationCompleter("Microsoft.Attestation/attestationProviders")]
        [ValidateNotNullOrEmpty()]
        public string Location { get; set; }

        [Parameter(Mandatory = false,
            ValueFromPipelineByPropertyName = true,
            HelpMessage = "A hash table which represents resource tags.")]
        [Alias("Tags")]
        public Hashtable Tag { get; set; }
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e

        [Parameter(Mandatory = false,
            ValueFromPipelineByPropertyName = true,
            HelpMessage =
<<<<<<< HEAD
                "Specifies the configuration signing keys passed in which to create the attestation."
        )]
        public string PolicySigningCertificateFile { get; set; }
=======
                "Specifies the set of trusted signing keys for issuance policy in a single certificate file."
        )]
        public string PolicySignersCertificateFile { get; set; }
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
        #endregion

        public override void ExecuteCmdlet()
        {
            if (ShouldProcess(Name, Resources.CreateAttestation))
            {
<<<<<<< HEAD
                JSONWebKeySet jsonWebKeySet = null;

                if (this.PolicySigningCertificateFile != null)
                {
                    FileInfo certFile = new FileInfo(ResolveUserPath(this.PolicySigningCertificateFile));

                    if (!certFile.Exists)
                    {
                        throw new FileNotFoundException(string.Format(AttestationProperties.Resources.CertificateFileNotFound, this.PolicySigningCertificateFile));
                    }

                    var pem = System.IO.File.ReadAllText(certFile.FullName);

                    X509Certificate2Collection certificateCollection = AttestationClient.GetX509CertificateFromPEM(pem, "CERTIFICATE");

                    if (certificateCollection.Count != 0)
                    {
                        jsonWebKeySet = AttestationClient.GetJSONWebKeySet(certificateCollection);
                    }                    
                }
                var newAttestation = AttestationClient.CreateNewAttestation(new AttestationCreationParameters()
                {
                    ProviderName = this.Name,
                    ResourceGroupName = this.ResourceGroupName,
                    AttestationPolicy = this.AttestationPolicy,
                    PolicySigningCertificates = jsonWebKeySet
                });
=======
                var newServiceParameters = new AttestationCreationParameters
                {
                    ResourceGroupName = this.ResourceGroupName,
                    ProviderName = this.Name,
                    CreationParameters = new AttestationServiceCreationParams
                    {
                        Location = this.Location,
                        Tags = TagsConversionHelper.CreateTagDictionary(this.Tag, validate: true),
                        Properties = new AttestationServiceCreationSpecificParams
                        {
                            AttestationPolicy = null,
                            PolicySigningCertificates =
                                JwksHelper.GetJwks(ResolveUserPath(this.PolicySignersCertificateFile))
                        }
                    }
                };

                var newAttestation = AttestationClient.CreateNewAttestation(newServiceParameters);
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
                this.WriteObject(newAttestation);
            } 
        }
    }
}
