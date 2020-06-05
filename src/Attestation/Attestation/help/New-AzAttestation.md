---
external help file: Microsoft.Azure.PowerShell.Cmdlets.Attestation.dll-Help.xml
Module Name: Az.Attestation
online version: https://docs.microsoft.com/en-us/powershell/module/az.attestation/new-azattestation
schema: 2.0.0
---

# New-AzAttestation

## SYNOPSIS
Creates an attestation

## SYNTAX

```
<<<<<<< HEAD
New-AzAttestation -Name <String> -ResourceGroupName <String> [-AttestationPolicy <String>]
 [-PolicySigningCertificateFile <String>] [-DefaultProfile <IAzureContextContainer>] [-WhatIf] [-Confirm]
=======
New-AzAttestation -Name <String> -ResourceGroupName <String> -Location <String> [-Tag <Hashtable>]
 [-PolicySignersCertificateFile <String>] [-DefaultProfile <IAzureContextContainer>] [-WhatIf] [-Confirm]
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
 [<CommonParameters>]
```

## DESCRIPTION
The New-AzAttestation cmdlet creates an attestation in the specified resource group.

## EXAMPLES

### Example 1
```powershell
<<<<<<< HEAD
PS C:\> New-AzAttestation -Name example -ResourceGroupName rg1 
Id                  : /subscriptions/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxxx/resourceGroups/rg1/providers/Microsoft.Attestation/attestationProviders/example
Name                : example
Type                : Microsoft.Attestation/attestationProviders
Status              : Ready
AttesUri            : https://example.us.attest.azure.net
ResoureGroupName    : rg1 
SubscriptionId      : xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxxx
```

### Example 2
```powershell
PS C:\> New-AzAttestation -Name example -ResourceGroupName rg1 -AttestationPolicy SgxDisableDebugMode
Id                  : /subscriptions/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxxx/resourceGroups/rg1/providers/Microsoft.Attestation/attestationProviders/example
Name                : example
Type                : Microsoft.Attestation/attestationProviders
Status              : Ready
AttesUri            : https://example.us.attest.azure.net
ResoureGroupName    : rg1 
SubscriptionId      : xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxxx
```
### Example 3
```powershell
PS C:\> New-AzAttestation -Name example -ResourceGroupName rg1 -PolicySigningCertificateFile c:\test\certs.pem
Id                  : /subscriptions/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxxx/resourceGroups/rg1/providers/Microsoft.Attestation/attestationProviders/example
Name                : example
Type                : Microsoft.Attestation/attestationProviders
Status              : Ready
AttesUri            : https://example.us.attest.azure.net
ResoureGroupName    : rg1 
SubscriptionId      : xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxxx
```

## PARAMETERS

### -AttestationPolicy
Specifies the attestation policy passed in which to create the attestation.

```yaml
Type: String
Parameter Sets: (All)
Aliases:
=======
PS C:\> New-AzAttestation -Name pshtest4 -ResourceGroupName psh-test-rg -Location "East US" -Tags @{Test="true";CreationYear="2020"}                                                                                                                                                                                         
Id                : subscriptions/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxxx/resourceGroups/psh-test-rg/providers/Microsoft.Attestation/attestationProviders/pshtest4
Location          : East US
ResourceGroupName : psh-test-rg
Name              : pshtest4
Status            : Ready
TrustModel        : AAD
AttestUri         : https://pshtest4.us.attest.azure.net
Tags              : {CreationYear, Test}
TagsTable         :
                    Name          Value
                    ============  =====
                    CreationYear  2020
                    Test          true
```

Create a new instance of an Attestation Provider named *pshtest4* with a couple tags and using AAD trust for mastering TEE policy.

### Example 2
```powershell
PS C:\> New-AzAttestation -Name pshtest3 -ResourceGroupName psh-test-rg -Location "East US" -PolicySignersCertificateFile .\cert1.pem                                                                                                                                                
Id                : subscriptions/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxxx/resourceGroups/psh-test-rg/providers/Microsoft.Attestation/attestationProviders/pshtest3
Location          : East US
ResourceGroupName : psh-test-rg
Name              : pshtest3
Status            : Ready
TrustModel        : Isolated
AttestUri         : https://pshtest3.us.attest.azure.net
Tags              :
TagsTable         :
```

Create a new instance of an Attestation Provider named *pshtest3*` that uses Isoladed trust for mastering TEE policy via specifying a set of trusted signing keys via a PEM file.

## PARAMETERS

### -DefaultProfile
The credentials, account, tenant, and subscription used for communication with Azure.

```yaml
Type: Microsoft.Azure.Commands.Common.Authentication.Abstractions.Core.IAzureContextContainer
Parameter Sets: (All)
Aliases: AzContext, AzureRmContext, AzureCredential
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e

Required: False
Position: Named
Default value: None
<<<<<<< HEAD
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -DefaultProfile
The credentials, account, tenant, and subscription used for communication with Azure.

```yaml
Type: IAzureContextContainer
Parameter Sets: (All)
Aliases: AzContext, AzureRmContext, AzureCredential

Required: False
Position: Named
Default value: None
Accept pipeline input: False
=======
Accept pipeline input: False
Accept wildcard characters: False
```

### -Location
Specifies the Azure region in which to create the attestation provider. Use the command Get-AzResourceProvider with the ProviderNamespace parameter to see your choices.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
Accept wildcard characters: False
```

### -Name
Specifies a name of the Instance to create.
The name can be any combination of letters, digits, or hyphens.
The name must start and end with a letter or digit.
The name must be universally unique.

```yaml
<<<<<<< HEAD
Type: String
=======
Type: System.String
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
Parameter Sets: (All)
Aliases: InstanceName

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

<<<<<<< HEAD
### -PolicySigningCertificateFile
Specifies the configuration signing keys passed in which to create the attestation.

```yaml
Type: String
=======
### -PolicySignersCertificateFile
Specifies the set of trusted signing keys for issuance policy in a single certificate file.

```yaml
Type: System.String
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -ResourceGroupName
Specifies the name of an existing resource group in which to create the attestation.

```yaml
<<<<<<< HEAD
Type: String
=======
Type: System.String
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

<<<<<<< HEAD
=======
### -Tag
A hash table which represents resource tags.

```yaml
Type: System.Collections.Hashtable
Parameter Sets: (All)
Aliases: Tags

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
<<<<<<< HEAD
Type: SwitchParameter
=======
Type: System.Management.Automation.SwitchParameter
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
<<<<<<< HEAD
Type: SwitchParameter
=======
Type: System.Management.Automation.SwitchParameter
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.String

<<<<<<< HEAD
=======
### System.Collections.Hashtable

>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
## OUTPUTS

### Microsoft.Azure.Commands.Attestation.Models.PSAttestation

## NOTES

## RELATED LINKS
