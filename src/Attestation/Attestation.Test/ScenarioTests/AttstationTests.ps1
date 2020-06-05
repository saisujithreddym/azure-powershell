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
Test New-AzAttestation
#>
#------------------------------Create-AzAttestation-----------------------------------
function Test-CreateAttestation
{
	$unknownRGName = getAssetName
	$attestationName = getAssetName
<<<<<<< HEAD
    $attestationPolicy = "SgxDisableDebugMode"
=======
	$attestationName2 = getAssetName
	$location = "East US"
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e

	try
	{
	    $rgName = Create-ResourceGroup
<<<<<<< HEAD
		$attestationCreated = New-AzAttestation -Name $attestationName -ResourceGroupName $rgName.ResourceGroupName -AttestationPolicy $attestationPolicy
		
		Assert-NotNull attestationCreated
		Assert-AreEqual $attestationName $attestationCreated.Name
		Assert-NotNull attestationCreated.AttesUri
		Assert-NotNull attestationCreated.Id
		Assert-NotNull attestationCreated.Status
		
		# Test throws for existing attestation
		Assert-Throws { New-AzAttestation -Name $attestationName  -ResourceGroupName $rgName.ResourceGroupName -AttestationPolicy $attestationPolicy}

		# Test throws for resourcegroup nonexistent
		Assert-Throws { New-AzAttestation -Name $attestationName -ResourceGroupName $unknownRGName -AttestationPolicy $attestationPolicy}
=======
		$attestationCreated = New-AzAttestation -Name $attestationName -ResourceGroupName $rgName.ResourceGroupName -Location $location

		Assert-NotNull $attestationCreated
		Assert-AreEqual $attestationName $attestationCreated.Name
		Assert-AreEqual $location $attestationCreated.Location
		Assert-NotNull $attestationCreated.AttestUri
		Assert-NotNull $attestationCreated.Id
		Assert-NotNull $attestationCreated.Status

		# Test throws for existing attestation
		Assert-Throws { New-AzAttestation -Name $attestationName  -ResourceGroupName $rgName.ResourceGroupName  -Location $location }

		# Test throws for resourcegroup nonexistent
		Assert-Throws { New-AzAttestation -Name $attestationName2 -ResourceGroupName $unknownRGName -Location $location }

		# Test throws if location not specified 
		Assert-Throws { New-AzAttestation -Name $attestationName2 -ResourceGroupName rgName.ResourceGroupName }
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
	}

	finally
	{
		Clean-ResourceGroup $rgName.ResourceGroupName
	}
}

function Test-CreateAttestationWithPolicySigningCertificate
{
<<<<<<< HEAD
	$unknownRGName = getAssetName
	$attestationName = getAssetName
	$TestOutputRoot = [System.AppDomain]::CurrentDomain.BaseDirectory;
	$PemDir = Join-Path $TestOutputRoot "PemFiles"
        $file= Join-Path $PemDir "policySigningCerts.pem"
=======
	$attestationName = getAssetName
	$location = "East US"
	$TestOutputRoot = [System.AppDomain]::CurrentDomain.BaseDirectory;
	$PemDir = Join-Path $TestOutputRoot "PemFiles"
    $file = Join-Path $PemDir "policySigningCerts.pem"
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e

	try
	{
	    $rgName = Create-ResourceGroup
<<<<<<< HEAD
		$attestationCreated = New-AzAttestation -Name $attestationName -ResourceGroupName $rgName.ResourceGroupName -PolicySigningCertificateFile $file
		
		Assert-NotNull attestationCreated
		Assert-AreEqual $attestationName $attestationCreated.Name
		Assert-NotNull attestationCreated.AttesUri
		Assert-NotNull attestationCreated.Id
		Assert-NotNull attestationCreated.Status
		
		# Test throws for existing attestation
		Assert-Throws { New-AzAttestation -Name $attestationName  -ResourceGroupName $rgName.ResourceGroupName -AttestationPolicy $attestationPolicy}

		# Test throws for resourcegroup nonexistent
		Assert-Throws { New-AzAttestation -Name $attestationName -ResourceGroupName $unknownRGName -AttestationPolicy $attestationPolicy}
=======
		$attestationCreated = New-AzAttestation -Name $attestationName -ResourceGroupName $rgName.ResourceGroupName -Location $location -PolicySignersCertificateFile $file

		Assert-NotNull $attestationCreated
		Assert-AreEqual $attestationName $attestationCreated.Name
		Assert-AreEqual $location $attestationCreated.Location
		Assert-NotNull $attestationCreated.AttestUri
		Assert-NotNull $attestationCreated.Id
		Assert-NotNull $attestationCreated.Status
	}

	finally
	{
		Clean-ResourceGroup $rgName.ResourceGroupName
	}
}


function Test-CreateAttestationWithTags
{
	$attestationName = getAssetName
	$location = "East US"
	$tags = @{Key1="value1";Key2="value2";Key3="value3"}

	try
	{
	    $rgName = Create-ResourceGroup
		$attestationCreated = New-AzAttestation -Name $attestationName -ResourceGroupName $rgName.ResourceGroupName -Location $location -Tag $tags

		Assert-NotNull $attestationCreated
		Assert-AreEqual $attestationName $attestationCreated.Name
		Assert-AreEqual $location $attestationCreated.Location
		Assert-NotNull $attestationCreated.AttestUri
		Assert-NotNull $attestationCreated.Id
		Assert-NotNull $attestationCreated.Status
		Assert-AreEqual $tags.Count $attestationCreated.Tags.Count
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
	}

	finally
	{
		Clean-ResourceGroup $rgName.ResourceGroupName
	}
}

<#
.SYNOPSIS
Test Get-AzAttestation
#>
#------------------------------Get-AzAttestation-----------------------------------
function Test-GetAttestation
<<<<<<< HEAD
{	
	$attestationName = getAssetName
	$attestationPolicy = "SgxDisableDebugMode"
	try
	{
	    $rgName = Create-ResourceGroup
		New-AzAttestation -Name $attestationName -ResourceGroupName $rgName.ResourceGroupName -AttestationPolicy $attestationPolicy

		$got = Get-AzAttestation  -Name $attestationName  -ResourceGroupName $rgName.ResourceGroupName
		Assert-NotNull got
		Assert-AreEqual $attestationName $got.Name
=======
{
	$attestationName = getAssetName
	$location = "East US"
	
	try
	{
	    $rgName = Create-ResourceGroup
		New-AzAttestation -Name $attestationName -ResourceGroupName $rgName.ResourceGroupName -Location $location

		$got = Get-AzAttestation  -Name $attestationName  -ResourceGroupName $rgName.ResourceGroupName

		Assert-NotNull $got
		Assert-AreEqual $attestationName $got.Name
		Assert-AreEqual $location $got.Location
		Assert-NotNull $got.AttestUri
		Assert-NotNull $got.Id
		Assert-NotNull $got.Status

>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
	}

	finally
	{
		Clean-ResourceGroup $rgName.ResourceGroupName
	}
}

<#
.SYNOPSIS
Test Remove-AzAttestation
#>
#------------------------------Remove-AzAttestation-----------------------------------
function Test-DeleteAttestationByName
{
	$attestationName = getAssetName
<<<<<<< HEAD
	$attestationPolicy = "SgxDisableDebugMode"
	try
	{
		$rgName = Create-ResourceGroup
		New-AzAttestation -Name $attestationName -ResourceGroupName $rgName.ResourceGroupName -AttestationPolicy $attestationPolicy
		Remove-AzAttestation  -Name $attestationName  -ResourceGroupName $rgName.ResourceGroupName 

		Assert-Throws {Get-AzAttestation  -Name $attestationName  -ResourceGroupName $rgName.ResourceGroupName}
	}
	
=======
	$location = "East US"

	try
	{
		$rgName = Create-ResourceGroup
		New-AzAttestation -Name $attestationName -ResourceGroupName $rgName.ResourceGroupName -Location $location
		Remove-AzAttestation  -Name $attestationName  -ResourceGroupName $rgName.ResourceGroupName

		Assert-Throws { Get-AzAttestation  -Name $attestationName  -ResourceGroupName $rgName.ResourceGroupName }
	}

>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
	finally
	{
		Clean-ResourceGroup $rgName.ResourceGroupName
	}
}
