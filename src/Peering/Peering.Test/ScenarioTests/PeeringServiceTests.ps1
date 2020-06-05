# ----------------------------------------------------------------------------------
#
# Copyright Microsoft Corporation
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ----------------------------------------------------------------------------------
<#
.SYNOPSIS
GetPeeringServiceProviders 
#>
function Test-GetPeeringServiceProviders {
    #static names are used because providers are not random.
<<<<<<< HEAD
    $name = "TestPeer1"
    $provider = Get-AzPeeringServiceProvider
    Assert-NotNull $provider
    Assert-AreEqual $name $provider[0].ServiceProviderName
=======
    $provider = Get-AzPeeringServiceProvider
    Assert-NotNull $provider
}

function Test-GetPeeringServiceCountry {
    $locations = Get-AzPeeringServiceCountry
    Assert-NotNull $locations
    $country = $locations | Where-Object { $_.Name -match "United States" }
    Assert-NotNull $state
    return $country.Name
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
}

<#
.SYNOPSIS
GetPeeringServiceLocations
#>
function Test-GetPeeringServiceLocations {
<<<<<<< HEAD
    $locations = Get-AzPeeringServiceLocation -Country "United States"
    Assert-NotNull $locations
    $state = $locations | Where-Object { $_.Name -match "Washington" }
    Assert-NotNull "Washington" $state
    $locations = Get-AzPeeringServiceLocation -Country "United States"
    Assert-NotNull $locations
=======
    $locations = Get-AzPeeringServiceCountry
    Assert-NotNull $locations
    $country = $locations | Where-Object { $_.Name -match "United States" }
    $locations = Get-AzPeeringServiceLocation -Country $country.Name
    Assert-NotNull $locations
    $state = $locations | Where-Object { $_.Name -match "Washington" }
    Assert-NotNull $state
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
}

<#
.SYNOPSIS
GetPeeringServiceProviders 
#>
function Test-GetPeeringServiceByResourceGroup {
    #Hard Coded locations becuase of limitations in locations
    $name = getAssetName "myPeeringService";
<<<<<<< HEAD
    $loc = "Florida"
    $provider = "AS56845-Global1191"
=======
    $loc = "Washington"
    $provider = "Verizon Communications Inc."
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
    $resourceGroup = "Building40"
    $peeringService = New-AzPeeringService -ResourceGroupName $resourceGroup -Name $name -PeeringLocation $loc -PeeringServiceProvider $provider
    Assert-NotNull $peeringService
    Assert-AreEqual $peeringService.Name $name
    Assert-AreEqual $loc $peeringService.PeeringServiceLocation
    Assert-AreEqual $provider $peeringService.PeeringServiceProvider
    $peeringService = Get-AzPeeringService -ResourceGroupName $resourceGroup -Name $name
    Assert-NotNull $peeringService
    Assert-AreEqual $peeringService.Name $name
    Assert-AreEqual $loc $peeringService.PeeringServiceLocation
    Assert-AreEqual $provider $peeringService.PeeringServiceProvider
}

<#
.SYNOPSIS
GetPeeringServiceLocations
#>
function Test-GetPeeringServiceByResourceId {
    #Hard Coded locations becuase of limitations in locations
    $name = getAssetName "myPeeringService";
<<<<<<< HEAD
    $loc = "Florida"
    $provider = "AS56845-Global1191"
=======
    $loc = "Washington"
    $provider = "Verizon Communications Inc."
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
    $resourceGroup = "Building40"
    $peeringService = New-AzPeeringService -ResourceGroupName $resourceGroup -Name $name -PeeringLocation $loc -PeeringServiceProvider $provider
    Assert-NotNull $peeringService
    Assert-AreEqual $peeringService.Name $name
    Assert-AreEqual $loc $peeringService.PeeringServiceLocation
    Assert-AreEqual $provider $peeringService.PeeringServiceProvider
    $peeringService = Get-AzPeeringService -ResourceId $peeringService.Id
    Assert-NotNull $peeringService
    Assert-AreEqual $peeringService.Name $name
    Assert-AreEqual $loc $peeringService.PeeringServiceLocation
    Assert-AreEqual $provider $peeringService.PeeringServiceProvider
}

<#
.SYNOPSIS
GetPeeringServiceProviders 
#>
function Test-ListPeeringService {
    $peeringService = Get-AzPeeringService
    Assert-NotNull $peeringService
}

<#
.SYNOPSIS
GetPeeringServiceLocations
#>
function Test-NewPeeringService {
    #Hard Coded locations becuase of limitations in locations
    $name = getAssetName "myPeeringService";
<<<<<<< HEAD
    $loc = "Florida"
    $provider = "AS56845-Global1191"
=======
    $loc = "Washington"
    $provider = "Verizon Communications Inc."
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
    $resourceGroup = "Building40"
    $peeringService = New-AzPeeringService -ResourceGroupName $resourceGroup -Name $name -PeeringLocation $loc -PeeringServiceProvider $provider
    Assert-NotNull $peeringService
    Assert-AreEqual $peeringService.Name $name
    Assert-AreEqual $loc $peeringService.PeeringServiceLocation
    Assert-AreEqual $provider $peeringService.PeeringServiceProvider
}

<#
.SYNOPSIS
GetPeeringServiceLocations
#>
function Test-NewPeeringServicePrefix {
    #Hard Coded locations becuase of limitations in locations
    $name = getAssetName "myPeeringService";
    $prefixName = getAssetName "myPrefix";
<<<<<<< HEAD
	$loc = "Florida"
    $provider = "AS56845-Global1191"
=======
	$loc = "Washington"
    $provider = "Verizon Communications Inc."
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
    $resourceGroup = "Building40"
    $prefix = newIpV4Address $true $true 0 4
	$peeringService = New-AzPeeringService -ResourceGroupName $resourceGroup -Name $name -PeeringLocation $loc -PeeringServiceProvider $provider
    $peeringService = Get-AzPeeringService -ResourceGroupName $resourceGroup -Name $name
<<<<<<< HEAD
    $prefixService = $peeringService | New-AzPeeringServicePrefix -Name $prefixName -Prefix $prefix
=======
    $prefixService = $peeringService | New-AzPeeringServicePrefix -Name $prefixName -Prefix $prefix -ServiceKey $key
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
    Assert-NotNull $prefixService
    <#
	.SYNOPSIS
	GetPeeringServicePrefix 
	#>
<<<<<<< HEAD
    $getPrefixService = Get-AzPeeringServicePrefix -ResourceGroupName $resourceGroup -PeeringServiceName $name -Name $prefixName
=======
    $getPrefixService = Get-AzPeeringServicePrefix -ResourceGroupName $resourceGroup -PeeringServiceName $name -Name $prefixName 
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
    Assert-NotNull $getPrefixService

    <#
	.SYNOPSIS
	DeletePeeringServicePrefx 
	#>
    $isRemoved = Remove-AzPeeringServicePrefix -ResourceId $getPrefixService.Id -Force -PassThru
    Assert-AreEqual $isRemoved $true
}
