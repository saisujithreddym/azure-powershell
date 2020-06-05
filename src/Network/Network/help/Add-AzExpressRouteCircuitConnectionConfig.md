---
external help file: Microsoft.Azure.PowerShell.Cmdlets.Network.dll-Help.xml
Module Name: Az.Network
ms.assetid: 7b4a8c9f-874c-4a27-b87e-c8ad7e73188d
online version: https://docs.microsoft.com/en-us/powershell/module/az.network/add-azexpressroutecircuitconnectionconfig
schema: 2.0.0
---

# Add-AzExpressRouteCircuitConnectionConfig

## SYNOPSIS
Adds a circuit connection configuration to Private Peering of an Express Route Circuit. 

## SYNTAX

### SetByResource (Default)
```
Add-AzExpressRouteCircuitConnectionConfig [-Name] <String> [-ExpressRouteCircuit] <PSExpressRouteCircuit>
<<<<<<< HEAD
 [-AddressPrefix] <String> [-AuthorizationKey <String>] [-DefaultProfile <IAzureContextContainer>] [-WhatIf]
=======
 [-AddressPrefix] <String> [-AddressPrefixType <String>] [-AuthorizationKey <String>] [-DefaultProfile <IAzureContextContainer>] [-WhatIf]
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
 [-Confirm] [<CommonParameters>]
```

### SetByResourceId
```
Add-AzExpressRouteCircuitConnectionConfig [-Name] <String> [-ExpressRouteCircuit] <PSExpressRouteCircuit>
<<<<<<< HEAD
 [-PeerExpressRouteCircuitPeering] <String> [-AddressPrefix] <String> [-AuthorizationKey <String>]
=======
 [-PeerExpressRouteCircuitPeering] <String> [-AddressPrefix] <String> -[AddressPrefixType <String>] [-AuthorizationKey <String>]
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
 [-DefaultProfile <IAzureContextContainer>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
The **Add-AzExpressRouteCircuitConnectionConfig** cmdlet adds a circuit connection configuration to
private peering for an ExpressRoute circuit. This allows peering two Express Route Circuits 
<<<<<<< HEAD
across regions or subscriptions.Note that, after running **Add-AzExpressRouteCircuitPeeringConfig**, 
=======
across regions or subscriptions.Note that, after running **Add-AzExpressRouteCircuitConnectionConfig**, 
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
you must call the Set-AzExpressRouteCircuit cmdlet to activate the configuration.

## EXAMPLES

### Example 1: Add a circuit connection resource to an existing ExpressRoute circuit
```
$circuit_init = Get-AzExpressRouteCircuit -Name $initiatingCircuitName -ResourceGroupName $rg
$circuit_peer = Get-AzExpressRouteCircuit -Name $peeringCircuitName -ResourceGroupName $rg
$addressSpace = '60.0.0.0/29'
<<<<<<< HEAD
Add-AzExpressRouteCircuitConnectionConfig -Name $circuitConnectionName -ExpressRouteCircuit $circuit_init -PeerExpressRouteCircuitPeering $circuit_peer.Peerings[0].Id -AddressPrefix $addressSpace -AuthorizationKey $circuit_peer.Authorizations[0].AuthorizationKey
=======
$addressPrefixType = 'IPv4'
Add-AzExpressRouteCircuitConnectionConfig -Name $circuitConnectionName -ExpressRouteCircuit $circuit_init -PeerExpressRouteCircuitPeering $circuit_peer.Peerings[0].Id -AddressPrefix $addressSpace -AddressPrefixType $addressPrefixType -AuthorizationKey $circuit_peer.Authorizations[0].AuthorizationKey
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
Set-AzExpressRouteCircuit -ExpressRouteCircuit $circuit_init
```

### Example 2: Add a circuit connection configuration using Piping to an existing ExpressRoute Circuit
```
$circuit_peer = Get-AzExpressRouteCircuit -Name $peeringCircuitName -ResourceGroupName $rg
$addressSpace = '60.0.0.0/29'
Get-AzExpressRouteCircuit -Name $initiatingCircuitName -ResourceGroupName $rg|Add-AzExpressRouteCircuitConnectionConfig -Name $circuitConnectionName -PeerExpressRouteCircuitPeering $circuit_peer.Peerings[0].Id -AddressPrefix $addressSpace -AuthorizationKey $circuit_peer.Authorizations[0].AuthorizationKey |Set-AzExpressRouteCircuit
```

## PARAMETERS

### -AddressPrefix
<<<<<<< HEAD
A minimum /29 customer address space to create VxLan tunnels between Express Route Circuits
=======
A minimum /29 customer address space to create VxLan tunnels between Express Route Circuits for IPv4 tunnels.
or a minimum of /125 customer address space to create VxLan tunnels between Express Route Circuits for IPv6 tunnels.
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```
<<<<<<< HEAD
=======
### -AddressPrefixType
This specifies the Address Family that address prefix belongs to.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:
Accepted values: IPv4, IPv6

Required: False
Position: Named
Default value: IPv4
Accept pipeline input: False
Accept wildcard characters: False
```
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e

### -AuthorizationKey
Authorization Key to peer Express Route Circuit in another subscription. Authorization on peer circuit can be created using existing commands.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DefaultProfile
The credentials, account, tenant, and subscription used for communication with azure.

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

### -ExpressRouteCircuit
The ExpressRoute circuit being modified. This is Azure object returned by the
**Get-AzExpressRouteCircuit** cmdlet.

```yaml
Type: Microsoft.Azure.Commands.Network.Models.PSExpressRouteCircuit
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Name
The name of the circuit connection resource to be added.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PeerExpressRouteCircuitPeering
Resource Id for Private Peering of remote circuit which will be peered with the current circuit.

```yaml
Type: System.String
Parameter Sets: SetByResourceId
Aliases:

Required: True
Position: 2
Default value: None
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
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### Microsoft.Azure.Commands.Network.Models.PSExpressRouteCircuit

### System.String

## OUTPUTS

### Microsoft.Azure.Commands.Network.Models.PSExpressRouteCircuit

## NOTES

## RELATED LINKS

<<<<<<< HEAD
[Get-AzExpressRouteCircuit](Get-AzExpressRouteCircuit.md)

=======
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
[Get-AzExpressRouteCircuitConnectionConfig](Get-AzExpressRouteCircuitConnectionConfig.md)

[Remove-AzExpressRouteCircuitConnectionConfig](Remove-AzExpressRouteCircuitConnectionConfig.md)

[Set-AzExpressRouteCircuitConnectionConfig](Set-AzExpressRouteCircuitConnectionConfig.md)

<<<<<<< HEAD
[New-AzExpressRouteCircuitConnectionConfig](New-AzExpressRouteCircuitConnectionConfig.md)

=======
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
[Set-AzExpressRouteCircuit](Set-AzExpressRouteCircuit.md)

[Get-AzExpressRouteCircuit](Get-AzExpressRouteCircuit.md)