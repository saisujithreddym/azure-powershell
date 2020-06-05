﻿# ----------------------------------------------------------------------------------
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
Sleeps but only during recording.
#>
function Start-TestSleep($milliseconds)
{
    if ([Microsoft.Azure.Test.HttpRecorder.HttpMockServer]::Mode -ne [Microsoft.Azure.Test.HttpRecorder.HttpRecorderMode]::Playback)
    {
        Start-Sleep -Milliseconds $milliseconds
    }
}

function Compute-TestTimeout($seconds)
{
    if ([Microsoft.Azure.Test.HttpRecorder.HttpMockServer]::Mode -eq [Microsoft.Azure.Test.HttpRecorder.HttpRecorderMode]::Playback)
    {
        # Timeout of 3 hours, to deal with long delays in recording framework
        return 60 * 24 * 3
    }
    else
    {
        return $seconds
    }
}

<#
.SYNOPSIS
Gets a Batch account name for testing.
#>
function Get-BatchAccountName
{
    return getAssetName
}

<#
.SYNOPSIS
Gets a resource group name for testing.
#>
function Get-ResourceGroupName
{
    return getAssetName
}

<#
.SYNOPSIS
Gets the location for the Batch account provider. Default to West US if none found.
#>
function Get-BatchAccountProviderLocation($index)
{
    if ([Microsoft.Azure.Test.HttpRecorder.HttpMockServer]::Mode -ne [Microsoft.Azure.Test.HttpRecorder.HttpRecorderMode]::Playback)
    {
        $namespace = "Microsoft.Batch"
        $type = "batchAccounts"
        $r = Get-AzResourceProvider -ProviderNamespace $namespace | where {$_.ResourceTypes[0].ResourceTypeName -eq $type}
        $location = $r.Locations
<<<<<<< HEAD
  
=======

>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
        if ($location -eq $null)
        {  
            return "westus"
        } 
        else 
        {  
            if ($index -eq $null)
            {
                return "westus"
            }
            else
            {
                return $location[$index]
            }
        }  
    }

    return "westus"
}