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
<<<<<<< HEAD
Gets container registry name
=======
Gets container service name
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
#>
function Get-RandomClusterName
{
    return 'kube' + (getAssetName)
}

<#
.SYNOPSIS
<<<<<<< HEAD
=======
Gets container registry name
#>
function Get-RandomRegistryName
{
    return 'acr' + (getAssetName)
}

<#
.SYNOPSIS
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
Gets resource group name
#>
function Get-RandomResourceGroupName
{
    return 'rg' + (getAssetName)
}

<<<<<<< HEAD
function isLive
=======
function IsLive
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
{
	return [Microsoft.Azure.Test.HttpRecorder.HttpMockServer]::Mode -ne [Microsoft.Azure.Test.HttpRecorder.HttpRecorderMode]::Playback
}

<#
.SYNOPSIS
Gets the default location for a provider
#>
function Get-ProviderLocation($provider)
{
	if ([Microsoft.Azure.Test.HttpRecorder.HttpMockServer]::Mode -ne [Microsoft.Azure.Test.HttpRecorder.HttpRecorderMode]::Playback)
	{
		$namespace = $provider.Split("/")[0]
		if($provider.Contains("/"))
		{
			$type = $provider.Substring($namespace.Length + 1)
			$location = Get-AzResourceProvider -ProviderNamespace $namespace | where {$_.ResourceTypes[0].ResourceTypeName -eq $type}

			if ($location -eq $null)
			{
				return "West US"
			} else
			{
				return $location.Locations[0].ToLower() -replace '\s',''
			}
		}

		return "West US"
	}

	return "West US"
}

function Assert-Error
{
	param([ScriptBlock] $script, [string] $message)

	$originalErrorCount = $error.Count
	$originalErrorActionPreference = $ErrorActionPreference
	$ErrorActionPreference = "SilentlyContinue"
	try
	{
		&$script
	}
	finally
	{
		$ErrorActionPreference = $originalErrorActionPreference
	}

	$result = $Error[0] -like "*$($message)*"

	If(!$result)
	{
		 Write-Output "expected error $($message), actual error $($Error[0])"
	}

	Assert-True {$result}

	$Error.Clear()
}