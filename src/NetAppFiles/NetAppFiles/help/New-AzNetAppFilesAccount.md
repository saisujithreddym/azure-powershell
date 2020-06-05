---
external help file: Microsoft.Azure.PowerShell.Cmdlets.NetAppFiles.dll-Help.xml
Module Name: Az.NetAppFiles
online version: https://docs.microsoft.com/en-us/powershell/module/az.netappfiles/new-aznetappfilesaccount
schema: 2.0.0
---

# New-AzNetAppFilesAccount

## SYNOPSIS
Creates a new Azure NetApp Files (ANF) account.

## SYNTAX

```
New-AzNetAppFilesAccount -ResourceGroupName <String> -Location <String> -Name <String>
<<<<<<< HEAD
 [-ActiveDirectories <PSNetAppFilesActiveDirectory[]>] [-Tag <Hashtable>] [-DefaultProfile <IAzureContextContainer>] [-WhatIf]
 [-Confirm] [<CommonParameters>]
=======
 [-ActiveDirectory <PSNetAppFilesActiveDirectory[]>] [-Tag <Hashtable>]
 [-DefaultProfile <IAzureContextContainer>] [-WhatIf] [-Confirm] [<CommonParameters>]
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
```

## DESCRIPTION
The **New-AzNetAppFilesAccount** cmdlet creates an ANF account.

## EXAMPLES

### Example 1: Create an ANF account
```
PS C:\>New-AzNetAppFilesAccount -ResourceGroupName "MyRG" -Name "MyAnfAccount" -l "westus2"

Output:

Location          : westus2
Id                : /subscriptions/mySubs/resourceGroups/MyRG/providers/Microsoft.NetApp/netAppAccounts/MyAnfAccount
Name              : MyAnfAccount
Type              : Microsoft.NetApp/netAppAccounts
Tags              :
ProvisioningState : Succeeded
```

This command creates the new ANF account "MyAnfAccount".

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

Required: True
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
