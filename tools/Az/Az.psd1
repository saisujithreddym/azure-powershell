#
# Module manifest for module 'PSGet_Az'
#
# Generated by: Microsoft Corporation
#
# Generated on: 7/23/2019
#

@{

# Script module or binary module file associated with this manifest.
# RootModule = ''

# Version number of this module.
ModuleVersion = '2.5.0'

# Supported PSEditions
CompatiblePSEditions = 'Core', 'Desktop'

# ID used to uniquely identify this module
GUID = 'd48d710e-85cb-46a1-990f-22dae76f6b5f'

# Author of this module
Author = 'Microsoft Corporation'

# Company or vendor of this module
CompanyName = 'Microsoft Corporation'

# Copyright statement for this module
Copyright = 'Microsoft Corporation. All rights reserved.'

# Description of the functionality provided by this module
Description = 'Microsoft Azure PowerShell - Cmdlets to manage resources in Azure. This module is compatible with WindowsPowerShell and PowerShell Core.

For more information about the Az module, please visit the following: https://docs.microsoft.com/en-us/powershell/azure/'

# Minimum version of the PowerShell engine required by this module
PowerShellVersion = '5.1'

# Name of the PowerShell host required by this module
# PowerShellHostName = ''

# Minimum version of the PowerShell host required by this module
# PowerShellHostVersion = ''

# Minimum version of Microsoft .NET Framework required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
DotNetFrameworkVersion = '4.7.2'

# Minimum version of the common language runtime (CLR) required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# CLRVersion = ''

# Processor architecture (None, X86, Amd64) required by this module
# ProcessorArchitecture = ''

# Modules that must be imported into the global environment prior to importing this module
RequiredModules = @(@{ModuleName = 'Az.Accounts'; ModuleVersion = '1.6.1'; }, 
               @{ModuleName = 'Az.Advisor'; RequiredVersion = '1.0.0'; }, 
               @{ModuleName = 'Az.Aks'; RequiredVersion = '1.0.1'; }, 
               @{ModuleName = 'Az.AnalysisServices'; RequiredVersion = '1.1.0'; }, 
               @{ModuleName = 'Az.ApiManagement'; RequiredVersion = '1.2.0'; }, 
               @{ModuleName = 'Az.ApplicationInsights'; RequiredVersion = '1.0.1'; }, 
               @{ModuleName = 'Az.Automation'; RequiredVersion = '1.3.1'; }, 
               @{ModuleName = 'Az.Batch'; RequiredVersion = '1.1.0'; }, 
               @{ModuleName = 'Az.Billing'; RequiredVersion = '1.0.0'; }, 
               @{ModuleName = 'Az.Cdn'; RequiredVersion = '1.3.0'; }, 
               @{ModuleName = 'Az.CognitiveServices'; RequiredVersion = '1.2.0'; }, 
               @{ModuleName = 'Az.Compute'; RequiredVersion = '2.4.1'; }, 
               @{ModuleName = 'Az.ContainerInstance'; RequiredVersion = '1.0.1'; }, 
               @{ModuleName = 'Az.ContainerRegistry'; RequiredVersion = '1.1.0'; }, 
               @{ModuleName = 'Az.DataFactory'; RequiredVersion = '1.1.3'; }, 
               @{ModuleName = 'Az.DataLakeAnalytics'; RequiredVersion = '1.0.0'; }, 
               @{ModuleName = 'Az.DataLakeStore'; RequiredVersion = '1.2.1'; }, 
               @{ModuleName = 'Az.DeploymentManager'; RequiredVersion = '1.0.0'; }, 
               @{ModuleName = 'Az.DevTestLabs'; RequiredVersion = '1.0.0'; }, 
               @{ModuleName = 'Az.Dns'; RequiredVersion = '1.1.1'; }, 
               @{ModuleName = 'Az.EventGrid'; RequiredVersion = '1.2.1'; }, 
               @{ModuleName = 'Az.EventHub'; RequiredVersion = '1.3.0'; }, 
               @{ModuleName = 'Az.FrontDoor'; RequiredVersion = '1.1.0'; }, 
               @{ModuleName = 'Az.HDInsight'; RequiredVersion = '2.0.0'; }, 
               @{ModuleName = 'Az.IotHub'; RequiredVersion = '1.2.0'; }, 
               @{ModuleName = 'Az.KeyVault'; RequiredVersion = '1.3.0'; }, 
               @{ModuleName = 'Az.LogicApp'; RequiredVersion = '1.3.0'; }, 
               @{ModuleName = 'Az.MachineLearning'; RequiredVersion = '1.1.0'; }, 
               @{ModuleName = 'Az.ManagedServices'; RequiredVersion = '1.0.0'; }, 
               @{ModuleName = 'Az.MarketplaceOrdering'; RequiredVersion = '1.0.0'; }, 
               @{ModuleName = 'Az.Media'; RequiredVersion = '1.1.0'; }, 
               @{ModuleName = 'Az.Monitor'; RequiredVersion = '1.2.1'; }, 
               @{ModuleName = 'Az.Network'; RequiredVersion = '1.12.0'; }, 
               @{ModuleName = 'Az.NotificationHubs'; RequiredVersion = '1.1.0'; }, 
               @{ModuleName = 'Az.OperationalInsights'; RequiredVersion = '1.3.2'; }, 
               @{ModuleName = 'Az.PolicyInsights'; RequiredVersion = '1.1.2'; }, 
               @{ModuleName = 'Az.PowerBIEmbedded'; RequiredVersion = '1.1.0'; }, 
               @{ModuleName = 'Az.RecoveryServices'; RequiredVersion = '1.4.3'; }, 
               @{ModuleName = 'Az.RedisCache'; RequiredVersion = '1.1.0'; }, 
               @{ModuleName = 'Az.Relay'; RequiredVersion = '1.0.1'; }, 
               @{ModuleName = 'Az.Resources'; RequiredVersion = '1.6.1'; }, 
               @{ModuleName = 'Az.ServiceBus'; RequiredVersion = '1.3.0'; }, 
               @{ModuleName = 'Az.ServiceFabric'; RequiredVersion = '1.1.1'; }, 
               @{ModuleName = 'Az.SignalR'; RequiredVersion = '1.0.2'; }, 
               @{ModuleName = 'Az.Sql'; RequiredVersion = '1.14.0'; }, 
               @{ModuleName = 'Az.Storage'; RequiredVersion = '1.5.1'; }, 
               @{ModuleName = 'Az.StorageSync'; RequiredVersion = '1.2.0'; }, 
               @{ModuleName = 'Az.StreamAnalytics'; RequiredVersion = '1.0.0'; }, 
               @{ModuleName = 'Az.TrafficManager'; RequiredVersion = '1.0.1'; }, 
               @{ModuleName = 'Az.Websites'; RequiredVersion = '1.4.0'; })

# Assemblies that must be loaded prior to importing this module
# RequiredAssemblies = @()

# Script files (.ps1) that are run in the caller's environment prior to importing this module.
# ScriptsToProcess = @()

# Type files (.ps1xml) to be loaded when importing this module
# TypesToProcess = @()

# Format files (.ps1xml) to be loaded when importing this module
# FormatsToProcess = @()

# Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
# NestedModules = @()

# Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
FunctionsToExport = @()

# Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
CmdletsToExport = @()

# Variables to export from this module
# VariablesToExport = @()

# Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
AliasesToExport = @()

# DSC resources to export from this module
# DscResourcesToExport = @()

# List of all modules packaged with this module
# ModuleList = @()

# List of all files packaged with this module
# FileList = @()

# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
PrivateData = @{

    PSData = @{

        # Tags applied to this module. These help with module discovery in online galleries.
        Tags = 'Azure','ARM','ResourceManager','Linux','AzureAutomationNotSupported'

        # A URL to the license for this module.
        LicenseUri = 'https://aka.ms/azps-license'

        # A URL to the main website for this project.
        ProjectUri = 'https://github.com/Azure/azure-powershell'

        # A URL to an icon representing this module.
        # IconUri = ''

        # ReleaseNotes of this module
        ReleaseNotes = '2.5.0 - July 2019
Az.Accounts
* Update common code to use latest version of ClientRuntime

Az.ApplicationInsights
* Fix example typo in ''Remove-AzApplicationInsightsApiKey'' documentation 

Az.Automation
* Fix typo in resource string 

Az.CognitiveServices
* Added NetworkRuleSet support.

Az.Compute
* Add missing properties (ComputerName, OsName, OsVersion and HyperVGeneration) of VM instance view object.

Az.ContainerRegistry
* Fix typo in Remove-AzContainerRegistryReplication for Replication parameter
    - More information here https://github.com/Azure/azure-powershell/issues/9633

Az.DataFactory
* Updated ADF .Net SDK version to 4.1.0
* Fix typo in documentation for ''Get-AzDataFactoryV2PipelineRun''

Az.EventHub
* Added new cmmdlet added for generating SAS token : New-AzEventHubAuthorizationRuleSASToken
* added verification and error message for authorizationrules rights if only ''Manage'' is assigned

Az.KeyVault
* Added support to specify the KeySize for Certificate Policies

Az.LogicApp
* Fix for Get-AzIntegrationAccountMap to list all map types
	- Added new MapType parameter for filtering

Az.ManagedServices
* Added support for api version 2019-06-01 (GA)

Az.Network
* Add support for private endpoint and private link service
    - New cmdlets
        - Set-AzPrivateEndpoint
        - Set-AzPrivateLinkService
        - Approve-AzPrivateEndpointConnection
        - Deny-AzPrivateEndpointConnection
        - Get-AzPrivateEndpointConnection
        - Remove-AzPrivateEndpointConnection
        - Test-AzPrivateLinkServiceVisibility
        - Get-AzAutoApprovedPrivateLinkService
* Updated below commands for feature: PrivateEndpointNetworkPolicies/PrivateLinkServiceNetworkPolicies flag on Subnet in Virtualnetwork
    - Updated New-AzVirtualNetworkSubnetConfig/Set-AzVirtualNetworkSubnetConfig/Add-AzVirtualNetworkSubnetConfig
        - Added optional parameter -PrivateEndpointNetworkPoliciesFlag to indicate that enable or disable apply network policies on pivate endpoint in this subnet.
        - Added optional parameter -PrivateLinkServiceNetworkPoliciesFlag to indicate that enable or disable apply network policies on private link service in this subnet.
* AzPrivateLinkService''s cmdlet parameter ''ServiceName'' was renamed to ''Name'' with an alias ''ServiceName'' for backward compatibility
* Enable ICMP protocol for network security rule configurations
    - Updated cmdlets
        - Add-AzNetworkSecurityRuleConfig
        - New-AzNetworkSecurityRuleConfig
        - Set-AzNetworkSecurityRuleConfig
* Add ConnectionProtocolType (Ikev1/Ikev2) as a configurable parameter for New-AzVirtualNetworkGatewayConnection
* Add PrivateIpAddressVersion in LoadBalancerFrontendIpConfiguration
    - Updated cmdlet:
        - New-AzLoadBalancerFrontendIpConfig
        - Add-AzLoadBalancerFrontendIpConfig
        - Set-AzLoadBalancerFrontendIpConfig
* Application Gateway New-AzApplicationGatewayProbeConfig command update for supporting custom port in Probe
    - Updated New-AzApplicationGatewayProbeConfig: Added optional parameter Port which is used for probing backend server. This parameter is applicable for Standard_V2 and WAF_V2 SKU.

Az.OperationalInsights
* Updated default version for saved searches to be 1. 
* Fixed custom log null regex handling

Az.RecoveryServices
* Update ''Get-AzRecoveryServicesBackupJob.md''
* Update ''Get-AzRecoveryServicesBackupContainer.md''
* Update ''Get-AzRecoveryServicesVault.md''
* Update ''Wait-AzRecoveryServicesBackupJob.md''
* Update ''Set-AzRecoveryServicesVaultContext.md''
* Update ''Get-AzRecoveryServicesBackupItem.md''
* Update ''Get-AzRecoveryServicesBackupRecoveryPoint.md''
* Update ''Restore-AzRecoveryServicesBackupItem.md''
* Updated service call for Unregistering container for Azure File Share
* Update ''Set-AzRecoveryServicesAsrAlertSetting.md''

Az.Resources
- Remove missing cmdlet referenced in ''New-AzResourceGroupDeployment'' documentation
- Updated policy cmdlets to use new api version 2019-01-01

Az.ServiceBus
* Added new cmmdlet added for generating SAS token : New-AzServiceBusAuthorizationRuleSASToken
* added verification and error message for authorizationrules rights if only ''Manage'' is assigned

Az.Sql
* Fix missing examples for Set-AzSqlDatabaseSecondary cmdlet
* Fix set Vulnerability Assessment recurring scans without providing any email addresses
* Fix a small typo in a warining message.

Az.Storage
* Update example in reference documentation for ''Get-AzStorageAccount'' to use correct parameter name

Az.StorageSync
* Adding Invoke-AzStorageSyncChangeDetection cmdlet.
* Fix Issue 9551 for honoring TierFilesOlderThanDays

Az.Websites
* Fixing a bug where some SiteConfig properties were not returned by Get-AzWebApp and Set-AzWebApp
* Adds a new Location parameter to Get-AzDeletedWebApp and Restore-AzDeletedWebApp
* Fixes a bug with cloning web app slots using New-AzWebApp -IncludeSourceWebAppSlots
'

        # Prerelease string of this module
        # Prerelease = ''

        # Flag to indicate whether the module requires explicit user acceptance for install/update
        # RequireLicenseAcceptance = $false

        # External dependent modules of this module
        # ExternalModuleDependencies = @()

    } # End of PSData hashtable

 } # End of PrivateData hashtable

# HelpInfo URI of this module
# HelpInfoURI = ''

# Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
# DefaultCommandPrefix = ''

}

