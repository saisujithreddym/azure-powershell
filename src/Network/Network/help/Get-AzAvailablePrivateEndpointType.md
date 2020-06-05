---
external help file: Microsoft.Azure.PowerShell.Cmdlets.Network.dll-Help.xml
Module Name: Az.Network
online version: https://docs.microsoft.com/en-us/powershell/module/az.network/get-azavailableprivateendpointtype
schema: 2.0.0
---

# Get-AzAvailablePrivateEndpointType

## SYNOPSIS
<<<<<<< HEAD
Return available private end point types in the location
=======
Return available private end point types in the location.
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e

## SYNTAX

```
Get-AzAvailablePrivateEndpointType -Location <String> [-ResourceGroupName <String>]
 [-DefaultProfile <IAzureContextContainer>] [<CommonParameters>]
```

## DESCRIPTION
The **Get-AzAvailablePrivateEndpointType** cmdlet returns all available private end point types in the location.

## EXAMPLES

### Example
```
Get-AzAvailablePrivateEndpointType -Location eastus

[
  {
    "id": "subscriptions/00000000-0000-0000-0000-000000000000/providers/Microsoft.Network/locations/availablePrivateEndpointTypes/typename1",
    "type": "Microsoft.Network/availablePrivateEndpointType",
<<<<<<< HEAD
    "resourceName": "Microsot.Sql/servers"
=======
    "resourceName": "Microsoft.Sql/servers"
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
  },
  {
    "id": "subscriptions/00000000-0000-0000-0000-000000000000/providers/Microsoft.Network/locations/availablePrivateEndpointTypes/typename2",
    "type": "Microsoft.Network/availablePrivateEndpointType",
<<<<<<< HEAD
    "resourceName": "Microsot.Storage/accounts"
=======
    "resourceName": "Microsoft.Storage/accounts"
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
  },
  {
    "id": "subscriptions/00000000-0000-0000-0000-000000000000/providers/Microsoft.Network/locations/availablePrivateEndpointTypes/typename3",
    "type": "Microsoft.Network/availablePrivateEndpointType",
<<<<<<< HEAD
    "resourceName": "Microsot.Cosmos/cosmosDbAccounts"
=======
    "resourceName": "Microsoft.Cosmos/cosmosDbAccounts"
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
  }
]
```

This example returns all available private end point types in the location.

## PARAMETERS

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

### -Location
The location.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -ResourceGroupName
The resource group name.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.String

## OUTPUTS

### Microsoft.Azure.Commands.Network.Models.PSAvailablePrivateEndpointType

## NOTES

## RELATED LINKS
