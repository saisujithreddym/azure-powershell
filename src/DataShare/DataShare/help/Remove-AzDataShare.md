---
external help file: Microsoft.Azure.PowerShell.Cmdlets.DataShare.dll-Help.xml
Module Name: Az.DataShare
online version: https://docs.microsoft.com/en-us/powershell/module/az.datashare/remove-azdatashare
schema: 2.0.0
---

# Remove-AzDataShare

## SYNOPSIS
Removes a data share.

## SYNTAX

### ByFieldsParameterSet (Default)
```
Remove-AzDataShare -ResourceGroupName <String> -AccountName <String> -Name <String> [-PassThru] [-AsJob]
 [-DefaultProfile <IAzureContextContainer>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### ByResourceIdParameterSet
```
Remove-AzDataShare -ResourceId <String> [-PassThru] [-AsJob] [-DefaultProfile <IAzureContextContainer>]
 [-WhatIf] [-Confirm] [<CommonParameters>]
```

### ByObjectParameterSet
```
Remove-AzDataShare -InputObject <PSDataShare> [-PassThru] [-AsJob] [-DefaultProfile <IAzureContextContainer>]
 [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
The **Remove-AzDataShare** cmdlet removes a data share.

## EXAMPLES

### Example 1
```
PS C:\> Remove-AzDataShare -ResourceGroupName "ADS" -AccountName "WikiAds" -Name "AdsShare"
Are you sure you want to remove data share "AdsShare"? 
[Y] Yes  [N] No  [S] Suspend  [?] Help (default is "Y"): Y
```

This commands removes the data share named AdsShare from the azure data share account WikiAds. 

## PARAMETERS

### -AccountName
Azure data share account name

```yaml
Type: System.String
Parameter Sets: ByFieldsParameterSet
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -AsJob
{{Fill AsJob Description}}

```yaml
Type: System.Management.Automation.SwitchParameter
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
Type: Microsoft.Azure.Commands.Common.Authentication.Abstractions.Core.IAzureContextContainer
Parameter Sets: (All)
Aliases: AzContext, AzureRmContext, AzureCredential

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -InputObject
Azure data share object`
``yaml
Type: PSDataShare
Parameter Sets: ByObjectParameterSet
Aliases: 

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False

<<<<<<< HEAD
=======
```yaml
Type: Microsoft.Azure.PowerShell.Cmdlets.DataShare.Models.PSDataShare
Parameter Sets: ByObjectParameterSet
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e

### -Name
Azure data share name

yaml
Type: String
Parameter Sets: ByFieldsParameterSet
Aliases: 

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False

<<<<<<< HEAD
=======
```yaml
Type: System.String
Parameter Sets: ByFieldsParameterSet
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e

### -PassThru
Return object (if specified).

yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False

<<<<<<< HEAD
=======
```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e

### -ResourceGroupName
The resource group name of the azure data share account

yaml
Type: String
Parameter Sets: ByFieldsParameterSet
Aliases: 

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False

<<<<<<< HEAD
=======
```yaml
Type: System.String
Parameter Sets: ByFieldsParameterSet
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e

### -ResourceId
The resource id of the Azure data share

yaml
Type: String
Parameter Sets: ByResourceIdParameterSet
Aliases: 

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False

<<<<<<< HEAD

### -Confirm
Prompts you for confirmation before running the cmdlet.

yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False


### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.
=======
```yaml
Type: System.String
Parameter Sets: ByResourceIdParameterSet
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e

yaml
Type: SwitchParameter
Parameter Sets: (All)
<<<<<<< HEAD
Aliases: wi
=======
Aliases: cf
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
<<<<<<< HEAD
```

```yaml
Type: Microsoft.Azure.PowerShell.Cmdlets.DataShare.Models.PSDataShare
Parameter Sets: ByObjectParameterSet
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Name
Azure data share name

```yaml
Type: System.String
Parameter Sets: ByFieldsParameterSet
Aliases:

Required: True
=======

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

<<<<<<< HEAD
### -PassThru
Return object (if specified).

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: (All)
Aliases:
=======
### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
<<<<<<< HEAD
```

### -ResourceGroupName
The resource group name of the azure data share account

```yaml
Type: System.String
Parameter Sets: ByFieldsParameterSet
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ResourceId
The resource id of the Azure data share

```yaml
Type: System.String
Parameter Sets: ByResourceIdParameterSet
=======




yaml
Type: Microsoft.Azure.PowerShell.Cmdlets.DataShare.Models.PSDataShare
Parameter Sets: ByObjectParameterSet
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
Aliases:

Required: True
Position: Named
Default value: None
<<<<<<< HEAD
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

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
=======
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e

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
<<<<<<< HEAD
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).
=======
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e

## INPUTS

### System.String

### Microsoft.Azure.PowerShell.Cmdlets.DataShare.Models.PSDataShare

## OUTPUTS

### System.Boolean

## NOTES

## RELATED LINKS
