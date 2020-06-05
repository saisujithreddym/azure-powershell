---
external help file: Microsoft.Azure.PowerShell.Cmdlets.Blueprint.dll-Help.xml
Module Name: Az.Blueprint
online version: https://docs.microsoft.com/en-us/powershell/module/az.blueprint/set-azblueprintartifact
schema: 2.0.0
---

# Set-AzBlueprintArtifact

## SYNOPSIS
Update an artifact in a blueprint definition.

## SYNTAX

<<<<<<< HEAD

=======
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
### UpdateTemplateArtifact (Default)
```
Set-AzBlueprintArtifact -Name <String> -Type <PSArtifactKind> -Blueprint <PSBlueprintBase>
 [-Description <String>] [-DependsOn <System.Collections.Generic.List`1[System.String]>]
 -TemplateParameterFile <String> -TemplateFile <String> [-ResourceGroupName <String>]
<<<<<<< HEAD
 [-DefaultProfile <IAzureContextContainer>] [<CommonParameters>]
=======
 [-DefaultProfile <IAzureContextContainer>] [-WhatIf] [-Confirm] [<CommonParameters>]
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
```

### UpdateArtifactByInputFile
```
Set-AzBlueprintArtifact -Name <String> -Blueprint <PSBlueprintBase> -ArtifactFile <String>
<<<<<<< HEAD
 [-DefaultProfile <IAzureContextContainer>] [<CommonParameters>]
=======
 [-DefaultProfile <IAzureContextContainer>] [-WhatIf] [-Confirm] [<CommonParameters>]
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
```

### UpdateRoleAssignmentArtifact
```
Set-AzBlueprintArtifact -Name <String> -Type <PSArtifactKind> -Blueprint <PSBlueprintBase>
 [-Description <String>] [-DependsOn <System.Collections.Generic.List`1[System.String]>]
 -RoleDefinitionId <String> -RoleDefinitionPrincipalId <String[]> [-ResourceGroupName <String>]
<<<<<<< HEAD
 [-DefaultProfile <IAzureContextContainer>] [<CommonParameters>]
=======
 [-DefaultProfile <IAzureContextContainer>] [-WhatIf] [-Confirm] [<CommonParameters>]
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
```

### UpdatePolicyAssignmentArtifact
```
Set-AzBlueprintArtifact -Name <String> -Type <PSArtifactKind> -Blueprint <PSBlueprintBase>
 [-Description <String>] [-DependsOn <System.Collections.Generic.List`1[System.String]>]
 -PolicyDefinitionId <String> -PolicyDefinitionParameter <Hashtable> [-ResourceGroupName <String>]
<<<<<<< HEAD
 [-DefaultProfile <IAzureContextContainer>] [<CommonParameters>]
=======
 [-DefaultProfile <IAzureContextContainer>] [-WhatIf] [-Confirm] [<CommonParameters>]
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
```

## DESCRIPTION
Update an artifact. There are two ways to update an artifact: either through an artifact JSON as an input file or through providing inline parameters for the artifact. 
While the JSON method doesn't require type of the artifact to be provided inline parameter method requires user to provide the type of the artifact through -Type parameter.

## EXAMPLES

### Example 1
```powershell
PS C:\> $bp = Get-AzBlueprint -Name SimpleBlueprint
PS C:\> New-AzBlueprintArtifact -Name PolicyStorage -Blueprint $bp -ArtifactFile C:\PolicyAssignmentStorageTag.json

DisplayName        :
Description        : Apply storage tag and the parameter also used by the template to resource groups
DependsOn          :
PolicyDefinitionId : /providers/Microsoft.Authorization/policyDefinitions/49c88fc8-6fd1-46fd-a676-f12d1d3a4c71
Parameters         : {[tagName, Microsoft.Azure.Commands.Blueprint.Models.PSParameterValue], [tagValue, Microsoft.Azure.Commands.Blueprint.Models.PSParameterValue]}
ResourceGroup      :
Id                 : /subscriptions/{subscriptionId}/providers/Microsoft.Blueprint/blueprints/AppNetwork/artifacts/PolicyAssignmentStorageTag
Type               : Microsoft.Blueprint/blueprints/artifacts
Name               : PolicyAssignmentStorageTag
```

Update an artifact through an artifact JSON file.

### Example 2
```powershell
PS C:\> $bp = Get-AzBlueprint -Name SimpleBlueprint
PS C:\> New-AzBlueprintArtifact -Type PolicyAssignmentArtifact -Name "ApplyTag-RG" -Blueprint $bp -PolicyDefinitionId "/providers/Microsoft.Authorization/policyDefinitions/49c88fc8-6fd1-46fd-a676-f12d1d3a4c71" -PolicyDefinitionParameter @{tagName="[parameters('tagName')]"; tagValue="[parameters('tagValue')]"} -ResourceGroupName storageRG

DisplayName        : ApplyTag-RG
Description        :
DependsOn          :
PolicyDefinitionId : /providers/Microsoft.Authorization/policyDefinitions/49c88fc8-6fd1-46fd-a676-f12d1d3a4c71
Parameters         : {[tagValue, Microsoft.Azure.Commands.Blueprint.Models.PSParameterValue], [tagName,
                     Microsoft.Azure.Commands.Blueprint.Models.PSParameterValue]}
ResourceGroup      : storageRG
Id                 : /subscriptions/28cbf98f-381d-4425-9ac4-cf342dab9753/providers/Microsoft.Blueprint/blueprints/AppNetwork/
                     artifacts/ApplyTag-RG
Type               : Microsoft.Blueprint/blueprints/artifacts
Name               : ApplyTag-RG
<<<<<<< HEAD

=======
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
```

Update an artifact through inline parameters.

<<<<<<< HEAD

=======
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
### Example 3
```powershell
PS C:\> $bp = Get-AzBlueprint -Name SimpleBlueprint
PS C:\> New-AzBlueprintArtifact -Type TemplateArtifact -Name storage-account -Blueprint $bp -TemplateFile C:\StorageAccountArmTemplate.json -ResourceGroup "storageRG" -TemplateParameterFile C:\Workspace\BlueprintTemplates\RestTemplatesSomeInline\StorageAccountParameters.json

DisplayName   : storage-account
Description   :
DependsOn     :
Template      : {$schema, contentVersion, parameters, variables...}
Parameters    : {}
ResourceGroup : storageRG
Id            : /subscriptions/{subscriptionId}/providers/Microsoft.Blueprint/blueprints/AppNetwork/artifacts/storage-account
Type          : Microsoft.Blueprint/blueprints/artifacts
Name          : storage-account
<<<<<<< HEAD

=======
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
```

Update an artifact through an ARM template file.

## PARAMETERS

### -ArtifactFile
Location of the artifact file in JSON format on disk.

```yaml
<<<<<<< HEAD
Type: String
Parameter Sets: CreateArtifactByInputFile
=======
Type: System.String
Parameter Sets: UpdateArtifactByInputFile
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Blueprint
Blueprint object.

```yaml
<<<<<<< HEAD
Type: PSBlueprintBase
Parameter Sets: UpdateTemplateArtifact, ArtifactsByBlueprint, CreateRoleAssignmentArtifact, CreatePolicyArtifact
=======
Type: Microsoft.Azure.Commands.Blueprint.Models.PSBlueprintBase
Parameter Sets: UpdateTemplateArtifact, UpdateRoleAssignmentArtifact, UpdatePolicyAssignmentArtifact
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

```yaml
<<<<<<< HEAD
Type: PSBlueprintBase
Parameter Sets: CreateArtifactByInputFile
=======
Type: Microsoft.Azure.Commands.Blueprint.Models.PSBlueprintBase
Parameter Sets: UpdateArtifactByInputFile
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -DefaultProfile
The credentials, account, tenant, and subscription used for communication with Azure.

```yaml
<<<<<<< HEAD
Type: IAzureContextContainer
=======
Type: Microsoft.Azure.Commands.Common.Authentication.Abstractions.Core.IAzureContextContainer
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
Parameter Sets: (All)
Aliases: AzContext, AzureRmContext, AzureCredential

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DependsOn
List of the names of artifacts that needs to be created before current artifact is created.

```yaml
Type: System.Collections.Generic.List`1[System.String]
<<<<<<< HEAD
Parameter Sets: UpdateTemplateArtifact, CreateRoleAssignmentArtifact, CreatePolicyArtifact
=======
Parameter Sets: UpdateTemplateArtifact, UpdateRoleAssignmentArtifact, UpdatePolicyAssignmentArtifact
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Description
Description of the artifact.

```yaml
<<<<<<< HEAD
Type: String
Parameter Sets: UpdateTemplateArtifact, CreateRoleAssignmentArtifact, CreatePolicyArtifact
=======
Type: System.String
Parameter Sets: UpdateTemplateArtifact, UpdateRoleAssignmentArtifact, UpdatePolicyAssignmentArtifact
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Name
Name of the artifact

```yaml
<<<<<<< HEAD
Type: String
Parameter Sets: UpdateTemplateArtifact, CreateArtifactByInputFile, CreateRoleAssignmentArtifact, CreatePolicyArtifact
=======
Type: System.String
Parameter Sets: (All)
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

<<<<<<< HEAD
```yaml
Type: String
Parameter Sets: ArtifactsByBlueprint
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

=======
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
### -PolicyDefinitionId
Definition Id of the policy definition.

```yaml
<<<<<<< HEAD
Type: String
Parameter Sets: CreatePolicyArtifact
=======
Type: System.String
Parameter Sets: UpdatePolicyAssignmentArtifact
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -PolicyDefinitionParameter
Hashtable of parameters to pass to the policy definition artifact.

```yaml
<<<<<<< HEAD
Type: Hashtable
Parameter Sets: CreatePolicyArtifact
=======
Type: System.Collections.Hashtable
Parameter Sets: UpdatePolicyAssignmentArtifact
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -ResourceGroupName
Name of the resource group the artifact is going to be under.

```yaml
<<<<<<< HEAD
Type: String
Parameter Sets: UpdateTemplateArtifact, CreateRoleAssignmentArtifact, CreatePolicyArtifact
=======
Type: System.String
Parameter Sets: UpdateTemplateArtifact, UpdateRoleAssignmentArtifact, UpdatePolicyAssignmentArtifact
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -RoleDefinitionId
List of role definition

```yaml
<<<<<<< HEAD
Type: String
Parameter Sets: CreateRoleAssignmentArtifact
=======
Type: System.String
Parameter Sets: UpdateRoleAssignmentArtifact
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -RoleDefinitionPrincipalId
List of role definition principal ids.

```yaml
<<<<<<< HEAD
Type: String[]
Parameter Sets: CreateRoleAssignmentArtifact
=======
Type: System.String[]
Parameter Sets: UpdateRoleAssignmentArtifact
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -TemplateFile
Location of the ARM template file on disk.

```yaml
<<<<<<< HEAD
Type: String
=======
Type: System.String
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
Parameter Sets: UpdateTemplateArtifact
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -TemplateParameterFile
Location of the ARM template parameter file on disk.

```yaml
<<<<<<< HEAD
Type: String
=======
Type: System.String
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
Parameter Sets: UpdateTemplateArtifact
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Type
Type of the artifact.
There are 3 types supported: RoleAssignmentArtifact, PolicyAssignmentArtifact, TemplateArtifact.

```yaml
<<<<<<< HEAD
Type: PSArtifactKind
Parameter Sets: UpdateTemplateArtifact, CreateRoleAssignmentArtifact, CreatePolicyArtifact
=======
Type: Microsoft.Azure.Commands.Blueprint.Models.PSArtifactKind
Parameter Sets: UpdateTemplateArtifact, UpdateRoleAssignmentArtifact, UpdatePolicyAssignmentArtifact
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
Aliases:
Accepted values: RoleAssignmentArtifact, PolicyAssignmentArtifact, TemplateArtifact

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

<<<<<<< HEAD
### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).
=======
### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs. The cmdlet is not run.

```yaml
Type: System.Management.Automation.SwitchParameter
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
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e

## INPUTS

### System.String

### Microsoft.Azure.Commands.Blueprint.Models.PSArtifactKind

### Microsoft.Azure.Commands.Blueprint.Models.PSBlueprintBase

### System.Collections.Generic.List`1[[System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]]

### System.Collections.Hashtable

### System.String[]

## OUTPUTS

### Microsoft.Azure.Management.Blueprint.Models.Artifact

## NOTES

## RELATED LINKS
