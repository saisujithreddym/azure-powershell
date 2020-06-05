---
external help file: Microsoft.Azure.PowerShell.Cmdlets.NetAppFiles.dll-Help.xml
Module Name: Az.NetAppFiles
online version: https://docs.microsoft.com/en-us/powershell/module/az.netappfiles/update-aznetappfilesaccount
schema: 2.0.0
---

# Update-AzNetAppFilesAccount

## SYNOPSIS
Updates an Azure NetApp Files (ANF) account according to the optional modifiers provided.

## SYNTAX

<<<<<<< HEAD
```
Update-AzNetAppFilesAccount -ResourceGroupName <String> -Name <String> [-Location <String>]
 [-ActiveDirectories <PSNetAppFilesActiveDirectory[]>] [-Tag <Hashtable>] [-DefaultProfile <IAzureContextContainer>] [-WhatIf]
 [-Confirm] [<CommonParameters>]
```
### ByParentObjectParameterSet
```
Update-AzNetAppFilesPool -Name <String> [-PoolSize <Int64>] [-ServiceLevel <String>] [-Tag <Hashtable>]
 -AccountObject <PSNetAppFilesAccount> [-DefaultProfile <IAzureContextContainer>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
=======
### ByFieldsParameterSet (Default)
```
Update-AzNetAppFilesAccount -ResourceGroupName <String> [-Location <String>] -Name <String>
 [-ActiveDirectory <PSNetAppFilesActiveDirectory[]>] [-Tag <Hashtable>]
 [-DefaultProfile <IAzureContextContainer>] [-WhatIf] [-Confirm] [<CommonParameters>]
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
```

### ByResourceIdParameterSet
```
<<<<<<< HEAD
Update-AzNetAppFilesPool [-PoolSize <Int64>] [-ServiceLevel <String>] [-Tag <Hashtable>] -ResourceId <String>
=======
Update-AzNetAppFilesAccount -ResourceGroupName <String> [-Location <String>] -Name <String>
 -ResourceId <String> [-ActiveDirectory <PSNetAppFilesActiveDirectory[]>] [-Tag <Hashtable>]
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
 [-DefaultProfile <IAzureContextContainer>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### ByObjectParameterSet
```
<<<<<<< HEAD
Update-AzNetAppFilesPool [-PoolSize <Int64>] [-ServiceLevel <String>] [-Tag <Hashtable>]
 -InputObject <PSNetAppFilesPool> [-DefaultProfile <IAzureContextContainer>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
=======
Update-AzNetAppFilesAccount -ResourceGroupName <String> [-Location <String>] -Name <String>
 [-ActiveDirectory <PSNetAppFilesActiveDirectory[]>] -InputObject <PSNetAppFilesAccount> [-Tag <Hashtable>]
 [-DefaultProfile <IAzureContextContainer>] [-WhatIf] [-Confirm] [<CommonParameters>]
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
```

## DESCRIPTION
The **Update-AzNetAppFilesAccount** cmdlet modifies an ANF account.

## EXAMPLES

### Example 1 : Updates an ANF account
```
PS C:\>Update-AzNetAppFilesAccount -ResourceGroupName "MyRG" -l "westus2" -Name "MyAnfAccount" -Tag @{'Tag1' = 'Value1'}

Output:

Location          : westus2
Id                : /subscriptions/subsId/resourceGroups/MyRG/providers/Microsoft.NetApp/netAppAccounts/MyAnfAccount
Name              : MyAnfAccount
Type              : Microsoft.NetApp/netAppAccounts
Tags              : {Tag1}
AccountId         : 9fa2ca6d-1e48-4439-30e3-7de056e44e5a
ActiveDirectories :
ProvisioningState : Succeeded
```

This command performs an update on the given account modifying the tags to those provided.

## PARAMETERS

<<<<<<< HEAD
### -ActiveDirectories
A hashtable array which represents the active directories

```yaml
Type: PSNetAppFilesActiveDirectory[]
=======
### -ActiveDirectory
A hashtable array which represents the active directories

```yaml
Type: Microsoft.Azure.Commands.NetAppFiles.Models.PSNetAppFilesActiveDirectory[]
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
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

### -InputObject
The account object to update

```yaml
<<<<<<< HEAD
Type: PSNetAppFilesAccount
=======
Type: Microsoft.Azure.Commands.NetAppFiles.Models.PSNetAppFilesAccount
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
Parameter Sets: ByObjectParameterSet
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Location
The location of the resource

```yaml
<<<<<<< HEAD
Type: String
=======
Type: System.String
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
The name of the ANF account

```yaml
<<<<<<< HEAD
Type: String
=======
Type: System.String
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
Parameter Sets: (All)
Aliases: AccountName

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ResourceGroupName
The resource group of the ANF account

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
Accept pipeline input: False
Accept wildcard characters: False
```

### -ResourceId
The resource id of the ANF account

```yaml
<<<<<<< HEAD
Type: String
=======
Type: System.String
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
Parameter Sets: ByResourceIdParameterSet
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Tag
A hashtable which represents resource tags

```yaml
<<<<<<< HEAD
Type: Hashtable
=======
Type: System.Collections.Hashtable
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
Parameter Sets: (All)
Aliases: Tags

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

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
<<<<<<< HEAD
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).
=======
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e

## INPUTS

### None

## OUTPUTS

### Microsoft.Azure.Commands.NetAppFiles.Models.PSNetAppFilesAccount

## NOTES

## RELATED LINKS
