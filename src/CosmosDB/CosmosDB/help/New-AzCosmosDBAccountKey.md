---
external help file: Microsoft.Azure.PowerShell.Cmdlets.CosmosDB.dll-Help.xml
Module Name: Az.CosmosDB
online version: https://docs.microsoft.com/en-us/powershell/module/az.cosmosdb/new-azcosmosdbaccountkey
schema: 2.0.0
---

# New-AzCosmosDBAccountKey

## SYNOPSIS
Regenerate a given CosmosDB Account Key.

## SYNTAX

### ByNameParameterSet (Default)
```
<<<<<<< HEAD
New-AzCosmosDBAccountKey -ResourceGroupName <String> -Name <String> [-KeyKind <String>] [-AsJob] [-PassThru]
=======
New-AzCosmosDBAccountKey -ResourceGroupName <String> -Name <String> [-KeyKind <String>] [-AsJob]
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
 [-DefaultProfile <IAzureContextContainer>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### ByResourceIdParameterSet
```
<<<<<<< HEAD
New-AzCosmosDBAccountKey [-KeyKind <String>] -ResourceId <String> [-AsJob] [-PassThru]
=======
New-AzCosmosDBAccountKey [-KeyKind <String>] -ResourceId <String> [-AsJob]
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
 [-DefaultProfile <IAzureContextContainer>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### ByObjectParameterSet
```
<<<<<<< HEAD
New-AzCosmosDBAccountKey [-KeyKind <String>] -InputObject <PSDatabaseAccount> [-AsJob] [-PassThru]
=======
New-AzCosmosDBAccountKey [-KeyKind <String>] -InputObject <PSDatabaseAccountGetResults> [-AsJob]
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
 [-DefaultProfile <IAzureContextContainer>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Create a new CosmosDB Account in the given ResourceGroup.

## EXAMPLES

### Example 1
```powershell
PS C:\> New-AzCosmosDBAccountKey -ResourceGroupName rg -Name dbname
```

New keys are generated for Account with account name dbname in ResourceGroup rg.

## PARAMETERS

### -AsJob
Run cmdlet in the background

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
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
Accept wildcard characters: False
```

### -InputObject
CosmosDB Account object

```yaml
<<<<<<< HEAD
Type: PSDatabaseAccount
=======
Type: PSDatabaseAccountGetResults
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
Parameter Sets: ByObjectParameterSet
Aliases:

Required: True
Position: Named
Default value: None
<<<<<<< HEAD
Accept pipeline input: True (ByPropertyName)
=======
Accept pipeline input: True (ByValue)
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
Accept wildcard characters: False
```

### -KeyKind
The access key to regenerate.
Accepted values: primary, primaryReadonly, secondary, secondaryReadonly

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
Name of the Cosmos DB database account.

```yaml
Type: String
Parameter Sets: ByNameParameterSet
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

<<<<<<< HEAD
### -PassThru
To be set to true if the user wants to receive an output. The output is true if the operation was successful and an error is thrown if not.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

=======
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
### -ResourceGroupName
Name of resource group.

```yaml
Type: String
Parameter Sets: ByNameParameterSet
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ResourceId
ResourceId of the resource.

```yaml
Type: String
Parameter Sets: ByResourceIdParameterSet
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
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

### None

## OUTPUTS

### System.Void

## NOTES

## RELATED LINKS
