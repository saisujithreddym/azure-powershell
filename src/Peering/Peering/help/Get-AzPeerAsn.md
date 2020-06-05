---
external help file: Microsoft.Azure.PowerShell.Cmdlets.Peering.dll-Help.xml
Module Name: Az.Peering
online version: https://docs.microsoft.com/en-us/powershell/module/az.peering/get-azpeerasn
schema: 2.0.0
---

# Get-AzPeerAsn

## SYNOPSIS
Gets PeerAsn object from ARM.

## SYNTAX

<<<<<<< HEAD
=======
### ByName (Default)
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
```
Get-AzPeerAsn [-Name <String>] [-DefaultProfile <IAzureContextContainer>] [<CommonParameters>]
```

<<<<<<< HEAD
=======
### ByResourceId
```
Get-AzPeerAsn [-ResourceId] <String> [-DefaultProfile <IAzureContextContainer>] [<CommonParameters>]
```

>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
## DESCRIPTION
Gets the PeerAsn for a subscription.

## EXAMPLES

### Example 1
```powershell
<<<<<<< HEAD
PS C:> Get-AzPeerAsn -PeerName Contoso
=======
PS C:> Get-AzPeerAsn -Name Contoso
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e

PeerContactInfo : Microsoft.Azure.PowerShell.Cmdlets.Peering.Models.PSContactInfo
PeerName        : Contoso
ValidationState : None
PeerAsnProperty : 65050
Name            : Contoso
Id              : /subscriptions//providers/Microsoft.Peering/peerAsns/Contoso
Type            : Microsoft.Peering/peerAsns
```

Gets the PeerAsn

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

### -Name
The unique name of the PSPeering.

```yaml
Type: System.String
<<<<<<< HEAD
Parameter Sets: (All)
=======
Parameter Sets: ByName
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

<<<<<<< HEAD
=======
### -ResourceId
The resource id string name.

```yaml
Type: System.String
Parameter Sets: ByResourceId
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

<<<<<<< HEAD
### None
=======
### System.String
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e

## OUTPUTS

### Microsoft.Azure.PowerShell.Cmdlets.Peering.Models.PSPeerAsn

## NOTES

## RELATED LINKS
