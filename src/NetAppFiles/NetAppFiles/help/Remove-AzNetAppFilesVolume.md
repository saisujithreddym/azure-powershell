---
external help file: Microsoft.Azure.PowerShell.Cmdlets.NetAppFiles.dll-Help.xml
Module Name: Az.NetAppFiles
online version: https://docs.microsoft.com/en-us/powershell/module/az.netappfiles/remove-aznetappfilesvolume
schema: 2.0.0
---

# Remove-AzNetAppFilesVolume

## SYNOPSIS
Deletes an Azure NetApp Files (ANF) volume.

## SYNTAX

### ByFieldsParameterSet (Default)
```
Remove-AzNetAppFilesVolume -ResourceGroupName <String> -AccountName <String> -PoolName <String> -Name <String>
 [-PassThru] [-DefaultProfile <IAzureContextContainer>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### ByParentObjectParameterSet
```
Remove-AzNetAppFilesVolume -Name <String> -PoolObject <PSNetAppFilesPool> [-PassThru]
 [-DefaultProfile <IAzureContextContainer>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### ByResourceIdParameterSet
```
Remove-AzNetAppFilesVolume -ResourceId <String> [-PassThru] [-DefaultProfile <IAzureContextContainer>]
 [-WhatIf] [-Confirm] [<CommonParameters>]
```

### ByObjectParameterSet
```
Remove-AzNetAppFilesVolume -InputObject <PSNetAppFilesVolume> [-PassThru]
 [-DefaultProfile <IAzureContextContainer>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
The **Remove-AzNetAppFilesVolume** cmdlet deletes an ANF volume.

## EXAMPLES

### Example 1
```
PS C:\>Remove-AzNetAppFilesVolume -ResourceGroupName "MyRG" -AccountName "MyAnfAccount" -PoolName "MyAnfPool" -Name "MyAnfVolume"
```

This command deletes the ANF volume "MyAnfVolume".

## PARAMETERS

### -AccountName
The name of the ANF account

```yaml
<<<<<<< HEAD
Type: String
=======
Type: System.String
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
Parameter Sets: ByFieldsParameterSet
Aliases:

Required: True
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
The volume object to remove

```yaml
<<<<<<< HEAD
Type: PSNetAppFilesVolume
=======
Type: Microsoft.Azure.Commands.NetAppFiles.Models.PSNetAppFilesVolume
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
Parameter Sets: ByObjectParameterSet
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Name
The name of the ANF volume

```yaml
<<<<<<< HEAD
Type: String
=======
Type: System.String
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
Parameter Sets: ByFieldsParameterSet, ByParentObjectParameterSet
Aliases: VolumeName

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PassThru
Return whether the specified volume was successfully removed

```yaml
<<<<<<< HEAD
Type: SwitchParameter
=======
Type: System.Management.Automation.SwitchParameter
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PoolName
The name of the ANF pool

```yaml
<<<<<<< HEAD
Type: String
=======
Type: System.String
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
Parameter Sets: ByFieldsParameterSet
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PoolObject
The pool object containing the volume to remove

```yaml
<<<<<<< HEAD
Type: PSNetAppFilesPool
=======
Type: Microsoft.Azure.Commands.NetAppFiles.Models.PSNetAppFilesPool
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
Parameter Sets: ByParentObjectParameterSet
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -ResourceGroupName
The resource group of the ANF volume

```yaml
<<<<<<< HEAD
Type: String
=======
Type: System.String
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
Parameter Sets: ByFieldsParameterSet
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ResourceId
The resource id of the ANF volume

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

### System.String

### Microsoft.Azure.Commands.NetAppFiles.Models.PSNetAppFilesPool

### Microsoft.Azure.Commands.NetAppFiles.Models.PSNetAppFilesVolume

## OUTPUTS

### System.Boolean

## NOTES

## RELATED LINKS
