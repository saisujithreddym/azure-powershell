---
external help file: Microsoft.Azure.PowerShell.Cmdlets.CosmosDB.dll-Help.xml
Module Name: Az.CosmosDB
online version: https://docs.microsoft.com/en-us/powershell/module/az.cosmosdb/get-azcosmosdbsqldatabase
schema: 2.0.0
---

# Get-AzCosmosDBSqlDatabase

## SYNOPSIS
Gets the CosmosDB Sql Database.

## SYNTAX

### ByNameParameterSet (Default)
```
<<<<<<< HEAD
Get-AzCosmosDBSqlDatabase -ResourceGroupName <String> -AccountName <String> [-Name <String>] [-Detailed]
 [-DefaultProfile <IAzureContextContainer>] [<CommonParameters>]
```

### ByObjectParameterSet
```
Get-AzCosmosDBSqlDatabase [-Name <String>] -InputObject <PSDatabaseAccount> [-Detailed]
=======
Get-AzCosmosDBSqlDatabase -ResourceGroupName <String> -AccountName <String> [-Name <String>]
 [-DefaultProfile <IAzureContextContainer>] [<CommonParameters>]
```

### ByParentObjectParameterSet
```
Get-AzCosmosDBSqlDatabase [-Name <String>] -ParentObject <PSDatabaseAccountGetResults>
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
 [-DefaultProfile <IAzureContextContainer>] [<CommonParameters>]
```

## DESCRIPTION
The **Get-AzCosmosDBSqlDatabase** cmdlet gets the list of all existing CosmosDB Sql Databases for a given ResourceGroupName, AccountName and gets a single CosmosDB Sql Database for a given ResourceGroupName, AccountName, DatabaseName and ContainerName.

## EXAMPLES

### Example 1
```powershell
PS C:\> Get-AzCosmosDBSqlDatabase -AccountName {accountName} -ResourceGroupName {resourceGroupName} -Name {databaseName}

Name                    : {databaseName}
Id                      : {databaseId}
<<<<<<< HEAD
SqlDatabaseGetResultsId :
_rid                    :
_ts                     :
_etag                   :
_colls                  :
_users                  :
=======
Resource                 : Microsoft.Azure.Commands.CosmosDB.Models.PSSqlDatabaseGetPropertiesResource
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
```

## PARAMETERS

### -AccountName
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

<<<<<<< HEAD
### -Detailed
If provided then, the cmdlet returns the container with the throughput value.

```yaml
Type: SwitchParameter
=======
### -Name
Database name.

```yaml
Type: String
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

<<<<<<< HEAD
### -InputObject
CosmosDB Account object

```yaml
Type: PSDatabaseAccount
Parameter Sets: ByObjectParameterSet
=======
### -ParentObject
CosmosDB Account object

```yaml
Type: PSDatabaseAccountGetResults
Parameter Sets: ByParentObjectParameterSet
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
Aliases:

Required: True
Position: Named
Default value: None
<<<<<<< HEAD
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
Database name.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
=======
Accept pipeline input: True (ByValue)
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
Accept wildcard characters: False
```

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### Microsoft.Azure.Commands.CosmosDB.Models.PSSqlDatabaseGetResults

### Microsoft.Azure.Commands.CosmosDB.Models.PSThroughputSettingsGetResults

## NOTES

## RELATED LINKS
