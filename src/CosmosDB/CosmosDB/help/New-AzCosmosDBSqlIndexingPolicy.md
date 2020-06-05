---
external help file: Microsoft.Azure.PowerShell.Cmdlets.CosmosDB.dll-Help.xml
Module Name: Az.CosmosDB
online version: https://docs.microsoft.com/en-us/powershell/module/az.cosmosdb/new-azcosmosdbsqlindexingpolicy
schema: 2.0.0
---

# New-AzCosmosDBSqlIndexingPolicy

## SYNOPSIS
Creates a new CosmosDB Sql IndexingPolicy object.

## SYNTAX

```
<<<<<<< HEAD
New-AzCosmosDBSqlIndexingPolicy -IncludedPath <String[]> -ExcludedPath <String[]> [-Automatic <Boolean>]
 -IndexingMode <String> [-DefaultProfile <IAzureContextContainer>] [<CommonParameters>]
=======
New-AzCosmosDBSqlIndexingPolicy [-IncludedPath <PSIncludedPath[]>] [-SpatialSpec <PSSpatialSpec[]>]
 [-CompositePath <PSCompositePath[][]>] [-ExcludedPath <String[]>] [-Automatic <Boolean>]
 [-IndexingMode <String>] [-DefaultProfile <IAzureContextContainer>] [<CommonParameters>]
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
```

## DESCRIPTION
The **New-AzCosmosDBSqlIndexingPolicy** cmdlet creates a new object of type PSSqlIndexingPolicy.

## EXAMPLES

### Example 1
```powershell
<<<<<<< HEAD
PS C:\> New-AzCosmosDBSqlIndexingPolicy -IncludedPath {includedPath1},{includedPath2},{includedPath3} -ExcludedPath {excludedPath1},{excludedPath2},{excludedPath3} -IndexingMode {indexingMode}

Automatic IndexingMode IncludedPaths                                    ExcludedPaths
--------- ------------ -------------                                    -------------
          k            {includedPath1, includedPath2, includedPath3}    {excludedPath1}
=======
PS C:\> $ipath1 = New-AzCosmosDBSqlIncludedPathIndex -DataType String -Precision -1 -Kind Hash
PS C:\> $ipath2 = New-AzCosmosDBSqlIncludedPathIndex -DataType String -Precision -1 -Kind Hash
PS C:\> $IncludedPath = New-AzCosmosDBSqlIncludedPath -Path "/*" -Index $ipath1, $ipath2
PS C:\>  $SpatialSpec = New-AzCosmosDBSqlSpatialSpec -Path  "/mySpatialPath/*" -Type  "Point", "LineString", "Polygon", "MultiPolygon"
PS C:\> $cp1 = New-AzCosmosDBSqlCompositePath -Path "/abc" -Order Ascending
PS C:\>  $cp2 = New-AzCosmosDBSqlCompositePath -Path "/aberc" -Order Descending
PS C:\> $compositePath = (($cp1, $cp2), ($cp2, $cp1))
PS C:\> New-AzCosmosDBSqlIndexingPolicy -IncludedPath $IncludedPath -SpatialSpec $SpatialSpec -CompositePath $compositePath -ExcludedPath "/myPathToNotIndex/*" -Automatic 1 -IndexingMode Consistent

Automatic        : True
IndexingMode     : Consistent
IncludedPaths    : {Microsoft.Azure.Commands.CosmosDB.Models.PSIncludedPath}
ExcludedPaths    : {Microsoft.Azure.Commands.CosmosDB.Models.PSExcludedPath}
CompositeIndexes : {Microsoft.Azure.Commands.CosmosDB.Models.PSCompositePath Microsoft.Azure.Commands.CosmosDB.Models.PSCompositePath,
                   Microsoft.Azure.Commands.CosmosDB.Models.PSCompositePath Microsoft.Azure.Commands.CosmosDB.Models.PSCompositePath}
SpatialIndexes   : {Microsoft.Azure.Commands.CosmosDB.Models.PSSpatialSpec}
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
```

## PARAMETERS

### -Automatic
Bool to indicate if the indexing policy is automatic

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

<<<<<<< HEAD
=======
### -CompositePath
Array of array of objects of type Microsoft.Azure.Commands.CosmosDB.PSCompositePath

```yaml
Type: PSCompositePath[][]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
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

### -ExcludedPath
Array of strings containing excludedPath(Specifies a path within a JSON document to be excluded in the Azure Cosmos DB service.)  elements.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

<<<<<<< HEAD
Required: True
=======
Required: False
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -IncludedPath
Array of strings containing includedPath (Specifies a path within a JSON document to be included in the Azure Cosmos DB service.) elements.

```yaml
<<<<<<< HEAD
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
=======
Type: PSIncludedPath[]
Parameter Sets: (All)
Aliases:

Required: False
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -IndexingMode
indicates the indexing mode.
Possible values include: 'Consistent', 'Lazy', 'None'

```yaml
Type: String
Parameter Sets: (All)
Aliases:

<<<<<<< HEAD
Required: True
=======
Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SpatialSpec
Array of objects of type Microsoft.Azure.Commands.CosmosDB.PSSpatialSpec

```yaml
Type: PSSpatialSpec[]
Parameter Sets: (All)
Aliases:

Required: False
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
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

### Microsoft.Azure.Commands.CosmosDB.Models.PSSqlIndexingPolicy

## NOTES

## RELATED LINKS
