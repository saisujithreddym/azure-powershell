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
Test the basic usage of the Set/Get/Test/Remove virtual machine Azure Enhanced Monitoring extension command
<<<<<<< HEAD
=======

Set Tests:
1. Install new extension with VM that has a user assigned VM identity and no extension installed
	Tested by: Test-WithUserAssignedIdentity

2. Install new extension with VM that has no VM identity and no extension installed
	Tested by: Test-WithoutIdentity

3. Install new extension with VM that has SystemAssigned VM Identity and no extension installed
	Tested by: Test-WithSystemAssignedIdentity

4. Let it run twice with no switch
	Tested by: Test-OldExtensionReinstall

4. Let it run twice with new switch
	Tested by: Test-ExtensionReinstall

5. Test with UltraSSD
	Tested by: 

6. Test with no Extension and no switch
	Tested by: Test-OldExtensionReinstall

7. Test with no Extension and new switch
	Tested by: Test-WithUserAssignedIdentity

7. Install new extension with VM that has old extension installed
	Tested by: Test-ExtensionUpgrade

8. Install new extension with VM that has old extension and WAD installed
	Tested by: 

9. Install new extension with individual scope (parameter SetAccessToIndividualResources)
	Tested by: Test-WithUserAssignedIdentity

10. Test with Resource Group Scope
	Tested by: Test-WithoutIdentity

11. Test with noWait
	Tested by: 

12. Test new Extension installation with Windows
	Tested by: Test-WithUserAssignedIdentity

13. Test new Extension installation with SLES 12
	Tested by: Test-ExtensionDowngrade

14. Test new Extension installation with SLES 15
	Tested by: Test-ExtensionReinstall

15. Test new Extension installation with RHEL 7
	Tested by: Test-WithSystemAssignedIdentity

16. Test new Extension installation with RHEL 8
	Tested by: Test-WithoutIdentity

17. Test with new extension and no switch
	Tested by: Test-ExtensionDowngrade

Remove Test:
	1. run with no extension
		tested by: Test-WithUserAssignedIdentity
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
#>

function Log($test, $message)
{
    Out-File -FilePath "$test.log" -Append -InputObject $message
}

<<<<<<< HEAD
=======
function Assert-NewExtension($ResourceGroupName, $VMName, $IdentityType) {
	
	$newPublisher = "Microsoft.AzureCAT.AzureEnhancedMonitoring.Edp"
	$newTypeWin = "MonitorX64Windows"
	$newTypeLnx = "MonitorX64Linux"

	$vm = Get-AzVM -ResourceGroupName $ResourceGroupName -Name $VMName
	$extension = Get-AzVMAEMExtension -ResourceGroupName $ResourceGroupName -VMName $vm.Name
	$nul = Assert-NotNull $extension "New extension is not installed"	
	$nul = Assert-AreEqual $vm.Identity.Type $IdentityType "VM does not have the expected identity. Expected: $($IdentityType) Actual: $($vm.Identity.Type)"
	$nul = Assert-AreEqual $extension.Publisher $newPublisher
	$newType = ($extension.ExtensionType -eq $newTypeWin) -or ($extension.ExtensionType -eq $newTypeLnx)
	$nul = Assert-True { $newType } "Extension is not of type $($newTypeWin) nor $($newTypeLnx)"
	$nul = Assert-AreEqual $vm.Extensions.Count 1 "VM Extensions count does not equal 1"
	
	$result = Test-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vm.Name
	Assert-True { $result.Result } "Test of extension failed"
}

function Assert-OldExtension($ResourceGroupName, $VMName) {
	$oldPublisherWin = "Microsoft.AzureCAT.AzureEnhancedMonitoring"
	$oldPublisherLnx = "Microsoft.OSTCExtensions"
	$oldTypeWin = "AzureCATExtensionHandler"
	$oldTypeLnx = "AzureEnhancedMonitorForLinux"	

	$vm = Get-AzVM -ResourceGroupName $ResourceGroupName -Name $VMName
	$extension = Get-AzVMAEMExtension -ResourceGroupName $ResourceGroupName -VMName $vm.Name
	$nul = Assert-NotNull $extension "New extension is not installed"	
	$oldType = ($extension.ExtensionType -eq $oldTypeWin) -or ($extension.ExtensionType -eq $oldTypeLnx)
	$oldPublisher = ($extension.Publisher -eq $oldPublisherWin) -or ($extension.Publisher -eq $oldPublisherLnx)
	$nul = Assert-True { $oldType } "Extension is not of type $($oldTypeWin) nor $($oldTypeLnx)"
	$nul = Assert-True { $oldPublisher } "Extension Publisher is not $($oldPublisherWin) nor $($oldPublisherLnx)"
	$nul = Assert-AreEqual $vm.Extensions.Count 1 "VM Extensions count does not equal 1"
}

function Test-WithUserAssignedIdentity() {
	
	Write-Verbose "Test: Test with UserAssigned Identity -> Result must be SystemAssignedUserAssigned"
	$rgname = Get-CustomResourceGroupName
	try
    {
		$loc = Get-LocationForNewExtension
		$vm = Create-AdvancedVM -rgname $rgname -loc $loc -useMD -vmsize Standard_E4s_v3 -stotype Premium_LRS
		$ident = Create-IdentityForNewExtension -ResourceGroupName $rgname -TestName "Test-WithUserAssignedIdentity"
	
		Remove-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vm.Name
		$vm = Get-AzVM -ResourceGroupName $rgname -Name $vm.Name
		$nul = Assert-AreEqual $vm.Extensions.Count 0 "VM Extensions count does not equal 0"
		$result = Test-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vm.Name
		Assert-True {-not $result.Result } "Test of extension was positiv but should have failed"

		$vmUpd = Update-AzVM -ResourceGroupName $rgname -VM $vm -IdentityType UserAssigned -IdentityID $ident.Id
		$vm = Get-AzVM -ResourceGroupName $rgname -Name $vm.Name	
		$nul = Assert-AreEqual $vm.Identity.Type 'UserAssigned'

		Remove-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vm.Name
		Set-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vm.Name -InstallNewExtension -SetAccessToIndividualResources
	
		Assert-NewExtension -ResourceGroupName $rgname -VMName $vm.Name -IdentityType 'SystemAssignedUserAssigned'
	}
    finally
    {
        # Cleanup
        Clean-ResourceGroup $rgname
    }
}

function Test-WithoutIdentity() {

	Write-Verbose "Test: Test with No Identity -> Result must be SystemAssigned"
	$rgname = Get-CustomResourceGroupName
	try
    {
		$loc = Get-LocationForNewExtension
		$vm = Create-AdvancedVM -rgname $rgname -loc $loc -useMD -vmsize Standard_E4s_v3 -stotype Premium_LRS -imageType "RHEL 8"

		Remove-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vm.Name
		$vm = Get-AzVM -ResourceGroupName $rgname -Name $vm.Name
		$nul = Assert-AreEqual $vm.Extensions.Count 0 "VM Extensions count does not equal 0"
		$result = Test-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vm.Name
		Assert-True {-not $result.Result } "Test of extension was positiv but should have failed"

		$vmUpd = Update-AzVM -ResourceGroupName $rgname -VM $vm -IdentityType None
		$vm = Get-AzVM -ResourceGroupName $rgname -Name $vm.Name
		$nul = Assert-Null $vm.Identity.Type "VM still has an identity"

		Set-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vm.Name -InstallNewExtension
		
		Assert-NewExtension -ResourceGroupName $rgname -VMName $vm.Name -IdentityType 'SystemAssigned'
	}
    finally
    {
        # Cleanup
        Clean-ResourceGroup $rgname
    }
}

function Test-WithSystemAssignedIdentity() {
	
	Write-Verbose "Test: Test with SystemAssigned Identity -> Result must be SystemAssigned"
	$rgname = Get-CustomResourceGroupName
	try
    {
		$loc = Get-LocationForNewExtension
		$vm = Create-AdvancedVM -rgname $rgname -loc $loc -useMD -vmsize Standard_E4s_v3 -stotype Premium_LRS -imageType "RHEL 7"
	
		Remove-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vm.Name
		$vm = Get-AzVM -ResourceGroupName $rgname -Name $vm.Name
		if ( (-not $vm.Identity) -and (-not ($vm.Identity.Type -eq "SystemAssigned")) ) {
			$vmUpd = Update-AzVM -ResourceGroupName $rgname -VM $vm -IdentityType SystemAssigned
			$vm = Get-AzVM -ResourceGroupName $rgname -Name $vm.Name
		}
		$nul = Assert-AreEqual $vm.Identity.Type "SystemAssigned"
		$nul = Assert-AreEqual $vm.Extensions.Count 0 "VM Extensions count does not equal 0"
		$result = Test-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vm.Name
		Assert-True {-not $result.Result } "Test of extension was positiv but should have failed"

		Set-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vm.Name -InstallNewExtension

		Assert-NewExtension -ResourceGroupName $rgname -VMName $vm.Name -IdentityType 'SystemAssigned'
	}
    finally
    {
        # Cleanup
        Clean-ResourceGroup $rgname
    }
}

function Test-ExtensionReinstall() {

	Write-Verbose "Test: new Extension re-install -> must work"
	$rgname = Get-CustomResourceGroupName
	try
    {
		$loc = Get-LocationForNewExtension
		$vm = Create-AdvancedVM -rgname $rgname -loc $loc -useMD -vmsize Standard_E4s_v3 -stotype Premium_LRS -imageType "SLES 15"
	
		Remove-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vm.Name
		$vm = Get-AzVM -ResourceGroupName $rgname -Name $vm.Name
		$nul = Assert-AreEqual $vm.Extensions.Count 0 "VM Extensions count does not equal 0"
		$result = Test-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vm.Name
		Assert-True {-not $result.Result } "Test of extension was positiv but should have failed"

		Write-Verbose "`tInstalling new extension"
		Set-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vm.Name -InstallNewExtension

		Assert-NewExtension -ResourceGroupName $rgname -VMName $vm.Name -IdentityType 'SystemAssigned'	

		Write-Verbose "`tRe-Installing new extension"
		Set-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vm.Name -InstallNewExtension

		Assert-NewExtension -ResourceGroupName $rgname -VMName $vm.Name -IdentityType 'SystemAssigned'
	}
    finally
    {
        # Cleanup
        Clean-ResourceGroup $rgname
    }
}

function Test-OldExtensionReinstall() {

	Write-Verbose "Test: old Extension re-install -> must work"
	$rgname = Get-CustomResourceGroupName
	try
    {
		$loc = Get-LocationForNewExtension
		$vm = Create-AdvancedVM -rgname $rgname -loc $loc -useMD -vmsize Standard_E4s_v3 -stotype Premium_LRS
	
		Remove-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vm.Name
		$vm = Get-AzVM -ResourceGroupName $rgname -Name $vm.Name
		$nul = Assert-AreEqual $vm.Extensions.Count 0 "VM Extensions count does not equal 0"
		$result = Test-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vm.Name
		Assert-True {-not $result.Result } "Test of extension was positiv but should have failed"

		Write-Verbose "`tInstalling old extension"
		Set-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vm.Name

		$vm = Get-AzVM -ResourceGroupName $rgname -Name $vm.Name
		Assert-OldExtension -ResourceGroupName $rgname -VMName $vm.Name

		Write-Verbose "`tRe-Installing old extension"
		Set-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vm.Name

		$vm = Get-AzVM -ResourceGroupName $rgname -Name $vm.Name
		Assert-OldExtension -ResourceGroupName $rgname -VMName $vm.Name
	}
    finally
    {
        # Cleanup
        Clean-ResourceGroup $rgname
    }
}

function Test-ExtensionDowngrade() {

	Write-Verbose "Test: Extension downgrade should still install the new extension"
	$rgname = Get-CustomResourceGroupName
	try
    {
		$loc = Get-LocationForNewExtension
		$vm = Create-AdvancedVM -rgname $rgname -loc $loc -useMD -vmsize Standard_E4s_v3 -stotype Premium_LRS -imageType "SLES 12"
	
		Remove-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vm.Name
		$vm = Get-AzVM -ResourceGroupName $rgname -Name $vm.Name
		$nul = Assert-AreEqual $vm.Extensions.Count 0 "VM Extensions count does not equal 0"
		$result = Test-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vm.Name
		Assert-True {-not $result.Result } "Test of extension was positiv but should have failed"

		Write-Verbose "`tInstalling new extension"
		Set-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vm.Name -InstallNewExtension

		Assert-NewExtension -ResourceGroupName $rgname -VMName $vm.Name -IdentityType 'SystemAssigned'

		Write-Verbose "`tInstalling without new parameter- should install new extension"
		Set-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vm.Name
	
		Assert-NewExtension -ResourceGroupName $rgname -VMName $vm.Name -IdentityType 'SystemAssigned'

        Write-Verbose "Test-ExtensionDowngrade test done"
	}
    finally
    {
        Write-Verbose "Test-ExtensionDowngrade cleaning resources"
        # Cleanup
        Clean-ResourceGroup $rgname
    }
    Write-Verbose "Test-ExtensionDowngrade all done"
}

function Test-ExtensionUpgrade() {

	Write-Verbose "Test: Extension upgrade should fail"
	$rgname = Get-CustomResourceGroupName
	try
    {
		$loc = Get-LocationForNewExtension
		$vm = Create-AdvancedVM -rgname $rgname -loc $loc -useMD -vmsize Standard_E4s_v3 -stotype Premium_LRS
	
		Remove-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vm.Name
		$vm = Get-AzVM -ResourceGroupName $rgname -Name $vm.Name
		$nul = Assert-AreEqual $vm.Extensions.Count 0 "VM Extensions count does not equal 0"
		$result = Test-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vm.Name
		Assert-True {-not $result.Result } "Test of extension was positiv but should have failed"

		Write-Verbose "`tInstalling old extension"
		Set-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vm.Name

		Assert-OldExtension -ResourceGroupName $rgname -VMName $vm.Name

		Write-Verbose "`tInstalling with new parameter- should fail"
		Set-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vm.Name -InstallNewExtension -ErrorVariable downgradeError -ErrorAction "SilentlyContinue"
        if ($downgradeError -and $downgradeError.Count -gt 0)
        {
		    Write-Verbose $downgradeError[0]
        }
		$nul = Assert-NotNull $downgradeError "Downgrade of extension should have failed!"
	
		Assert-OldExtension -ResourceGroupName $rgname -VMName $vm.Name
	}
    finally
    {
        # Cleanup
        Clean-ResourceGroup $rgname
    }
}

function Test-NewExtensionDiskAdd() {

	Write-Verbose "Test: Add Data Disk after extension installation"
	$rgname = Get-CustomResourceGroupName
	try
    {
		$loc = Get-LocationForNewExtension
		$vm = Create-AdvancedVM -rgname $rgname -loc $loc -useMD -vmsize Standard_E4s_v3 -stotype Premium_LRS
	
		Remove-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vm.Name
		$vm = Get-AzVM -ResourceGroupName $rgname -Name $vm.Name
		$nul = Assert-AreEqual $vm.Extensions.Count 0 "VM Extensions count does not equal 0"
		$result = Test-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vm.Name
		Assert-True {-not $result.Result } "Test of extension was positiv but should have failed"

		Write-Verbose "`tInstalling new extension"
		Set-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vm.Name -InstallNewExtension -SetAccessToIndividualResources
		Assert-NewExtension -ResourceGroupName $rgname -VMName $vm.Name -IdentityType 'SystemAssigned'

		$vm = Get-AzVM -ResourceGroupName $rgname -Name $vm.Name
		$nextLun = (($vm.StorageProfile.DataDisks | select -ExpandProperty Lun | Measure-Object -Maximum).Maximum + 1)
		Add-AzVMDataDisk -VM $vm -StorageAccountType Premium_LRS -Lun $nextLun -CreateOption Empty -DiskSizeInGB 32 | Update-AzVM

		$result = Test-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vm.Name
		Assert-True {-not $result.Result } "Test of extension was positiv but should have failed because of missing permissions to the added data disk"

		Write-Verbose "`tUpdating new extension"
		Set-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vm.Name -InstallNewExtension -SetAccessToIndividualResources	
		Assert-NewExtension -ResourceGroupName $rgname -VMName $vm.Name -IdentityType 'SystemAssigned'
	}
    finally
    {
        # Cleanup
        Clean-ResourceGroup $rgname
    }
}

>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
function Test-AEMExtensionBasicWindowsWAD
{
    $rgname = Get-ComputeTestResourceName
    $loc = Get-ComputeVMLocation

    try
    {
        # Setup
        $vm = Create-AdvancedVM -rgname $rgname -loc $loc
        $vmname = $vm.Name

        # Get with not extension
        $extension = Get-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname
<<<<<<< HEAD
        Assert-Null $extension "Extension is not null"
        # Test with not extension
        $testResult = Test-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname -SkipStorageCheck
        Assert-False { $testResult.Result } (GetWrongTestResult $testResult $true)
=======
        $nul = Assert-Null $extension "Extension is not null"
        # Test with not extension
        $testResult = Test-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname -SkipStorageCheck
        $nul = Assert-False { $testResult.Result } (GetWrongTestResult $testResult $true)
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e

        # Set and Get command.
        Set-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname -SkipStorage -EnableWAD
        $extension = Get-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname

<<<<<<< HEAD
        Assert-NotNull $extension
        Assert-AreEqual $extension.Publisher 'Microsoft.AzureCAT.AzureEnhancedMonitoring'
        Assert-AreEqual $extension.ExtensionType 'AzureCATExtensionHandler'
        Assert-AreEqual $extension.Name 'AzureCATExtensionHandler'
        $settings = $extension.PublicSettings | ConvertFrom-Json
        Assert-NotNull $settings.cfg

        # Test command.
        $testResult = Test-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname -WaitTimeInMinutes 50 -SkipStorageCheck
        Assert-True { $testResult.Result }  (GetWrongTestResult $testResult $false)
        Assert-True { ($testResult.PartialResults.Count -gt 0) }
=======
        $nul = Assert-NotNull $extension
        $nul = Assert-AreEqual $extension.Publisher 'Microsoft.AzureCAT.AzureEnhancedMonitoring'
        $nul = Assert-AreEqual $extension.ExtensionType 'AzureCATExtensionHandler'
        $nul = Assert-AreEqual $extension.Name 'AzureCATExtensionHandler'
        $settings = $extension.PublicSettings | ConvertFrom-Json
        $nul = Assert-NotNull $settings.cfg

        # Test command.
        $testResult = Test-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname -WaitTimeInMinutes 50 -SkipStorageCheck
        $nul = Assert-True { $testResult.Result }  (GetWrongTestResult $testResult $false)
        $nul = Assert-True { ($testResult.PartialResults.Count -gt 0) }
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e

        # Remove command.
        Remove-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname
        $extension = Get-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname
<<<<<<< HEAD
        Assert-Null $extension "Extension is not null"
=======
        $nul = Assert-Null $extension "Extension is not null"
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
    }
    finally
    {
        # Cleanup
        Clean-ResourceGroup $rgname
    }
}

function Test-AEMExtensionBasicWindows
{
    $rgname = Get-ComputeTestResourceName
    $loc = Get-ComputeVMLocation

    try
    {
        # Setup
        $vm = Create-AdvancedVM -rgname $rgname -loc $loc
        $vmname = $vm.Name

        # Get with not extension
        $extension = Get-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname
<<<<<<< HEAD
        Assert-Null $extension "Extension is not null"
        # Test with not extension
        $testResult = Test-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname -SkipStorageCheck
        Assert-False { $testResult.Result }
=======
        $nul = Assert-Null $extension "Extension is not null"
        # Test with not extension
        $testResult = Test-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname -SkipStorageCheck
        $nul = Assert-False { $testResult.Result }
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e

        # Set and Get command.
        Set-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname -SkipStorage
        $extension = Get-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname

<<<<<<< HEAD
        Assert-NotNull $extension
        Assert-AreEqual $extension.Publisher 'Microsoft.AzureCAT.AzureEnhancedMonitoring'
        Assert-AreEqual $extension.ExtensionType 'AzureCATExtensionHandler'
        Assert-AreEqual $extension.Name 'AzureCATExtensionHandler'
        $settings = $extension.PublicSettings | ConvertFrom-Json
        Assert-NotNull $settings.cfg

        # Test command.
        $testResult = Test-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname -WaitTimeInMinutes 50 -SkipStorageCheck
        Assert-True { $testResult.Result }
        Assert-True { ($testResult.PartialResults.Count -gt 0) }
=======
        $nul = Assert-NotNull $extension
        $nul = Assert-AreEqual $extension.Publisher 'Microsoft.AzureCAT.AzureEnhancedMonitoring'
        $nul = Assert-AreEqual $extension.ExtensionType 'AzureCATExtensionHandler'
        $nul = Assert-AreEqual $extension.Name 'AzureCATExtensionHandler'
        $settings = $extension.PublicSettings | ConvertFrom-Json
        $nul = Assert-NotNull $settings.cfg

        # Test command.
        $testResult = Test-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname -WaitTimeInMinutes 50 -SkipStorageCheck
        $nul = Assert-True { $testResult.Result }
        $nul = Assert-True { ($testResult.PartialResults.Count -gt 0) }
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e

        # Remove command.
        Remove-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname
        $extension = Get-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname
<<<<<<< HEAD
        Assert-Null $extension "Extension is not null"
=======
        $nul = Assert-Null $extension "Extension is not null"
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
    }
    finally
    {
        # Cleanup
        Clean-ResourceGroup $rgname
    }
}

function Test-AEMExtensionAdvancedWindowsWAD
{
    $rgname = Get-ComputeTestResourceName
    $loc = Get-ComputeVMLocation

    try
    {
<<<<<<< HEAD
        Write-Debug "Start the test Test-AEMExtensionAdvancedWindows"
        # Setup
        $vm = Create-AdvancedVM -rgname $rgname -loc $loc -vmsize 'Standard_DS2' -stotype 'Premium_LRS' -nicCount 2
        $vmname = $vm.Name
        Write-Host "Test-AEMExtensionAdvancedWindows: VM created"

        # Get with not extension
        Write-Debug "Test-AEMExtensionAdvancedWindows: Get with no extension"
        $extension = Get-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname
        Assert-Null $extension "Extension is not null"

        # Test with not extension
        Write-Debug "Test-AEMExtensionAdvancedWindows: Test with no extension"
        $res = Test-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname -SkipStorageCheck
        Assert-False { $res.Result } (GetWrongTestResult $res $true)
        Write-Debug "Test-AEMExtensionAdvancedWindows: Test done"
=======
        Write-Verbose "Start the test Test-AEMExtensionAdvancedWindows"
        # Setup
        $vm = Create-AdvancedVM -rgname $rgname -loc $loc -vmsize 'Standard_DS2' -stotype 'Premium_LRS' -nicCount 2
        $vmname = $vm.Name
        Write-Verbose "Test-AEMExtensionAdvancedWindows: VM created"

        # Get with not extension
        Write-Verbose "Test-AEMExtensionAdvancedWindows: Get with no extension"
        $extension = Get-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname
        $nul = Assert-Null $extension "Extension is not null"

        # Test with not extension
        Write-Verbose "Test-AEMExtensionAdvancedWindows: Test with no extension"
        $res = Test-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname -SkipStorageCheck
        $nul = Assert-False { $res.Result } (GetWrongTestResult $res $true)
        Write-Verbose "Test-AEMExtensionAdvancedWindows: Test done"
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e

        $stoname = 'sto' + $rgname + "2";
        New-AzStorageAccount -ResourceGroupName $rgname -Name $stoname -Location $loc -Type 'Standard_LRS';

        # Set and Get command.
<<<<<<< HEAD
        Write-Debug "Test-AEMExtensionAdvancedWindows: Set with no extension"
        Set-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname -WADStorageAccountName $stoname -SkipStorage -EnableWAD
        Write-Debug "Test-AEMExtensionAdvancedWindows: Set done"
        Write-Debug "Test-AEMExtensionAdvancedWindows: Get with extension"
        $extension = Get-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname
        

        Assert-NotNull $extension
        Assert-AreEqual $extension.Publisher 'Microsoft.AzureCAT.AzureEnhancedMonitoring'
        Assert-AreEqual $extension.ExtensionType 'AzureCATExtensionHandler'
        Assert-AreEqual $extension.Name 'AzureCATExtensionHandler'
        $settings = $extension.PublicSettings | ConvertFrom-Json
        Assert-NotNull $settings.cfg
        Write-Debug "Test-AEMExtensionAdvancedWindows: Get done"

        # Test command.
        Write-Debug "Test-AEMExtensionAdvancedWindows: Test with extension"
        $res = Test-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname -SkipStorageCheck
        Assert-True { $res.Result } (GetWrongTestResult $res $false)
        Assert-True { ($res.PartialResults.Count -gt 0) }
        Write-Debug "Test-AEMExtensionAdvancedWindows: Test done"

        # Remove command.
        Write-Debug "Test-AEMExtensionAdvancedWindows: Remove with extension"
        Remove-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname
        Write-Debug "Test-AEMExtensionAdvancedWindows: Remove done"

        Write-Debug "Test-AEMExtensionAdvancedWindows: Get after remove"
        $extension = Get-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname
        Assert-Null $extension "Extension is not null"
        Write-Debug "Test-AEMExtensionAdvancedWindows: Get after remove done"
=======
        Write-Verbose "Test-AEMExtensionAdvancedWindows: Set with no extension"
        Set-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname -WADStorageAccountName $stoname -SkipStorage -EnableWAD
        Write-Verbose "Test-AEMExtensionAdvancedWindows: Set done"
        Write-Verbose "Test-AEMExtensionAdvancedWindows: Get with extension"
        $extension = Get-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname
        

        $nul = Assert-NotNull $extension
        $nul = Assert-AreEqual $extension.Publisher 'Microsoft.AzureCAT.AzureEnhancedMonitoring'
        $nul = Assert-AreEqual $extension.ExtensionType 'AzureCATExtensionHandler'
        $nul = Assert-AreEqual $extension.Name 'AzureCATExtensionHandler'
        $settings = $extension.PublicSettings | ConvertFrom-Json
        $nul = Assert-NotNull $settings.cfg
        Write-Verbose "Test-AEMExtensionAdvancedWindows: Get done"

        # Test command.
        Write-Verbose "Test-AEMExtensionAdvancedWindows: Test with extension"
        $res = Test-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname -SkipStorageCheck
        $nul = Assert-True { $res.Result } (GetWrongTestResult $res $false)
        $nul = Assert-True { ($res.PartialResults.Count -gt 0) }
        Write-Verbose "Test-AEMExtensionAdvancedWindows: Test done"

        # Remove command.
        Write-Verbose "Test-AEMExtensionAdvancedWindows: Remove with extension"
        Remove-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname
        Write-Verbose "Test-AEMExtensionAdvancedWindows: Remove done"

        Write-Verbose "Test-AEMExtensionAdvancedWindows: Get after remove"
        $extension = Get-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname
        $nul = Assert-Null $extension "Extension is not null"
        Write-Verbose "Test-AEMExtensionAdvancedWindows: Get after remove done"
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
    }
    finally
    {
        # Cleanup
        Clean-ResourceGroup $rgname
    }
}

function Test-AEMExtensionAdvancedWindows
{
    $rgname = Get-ComputeTestResourceName
    $loc = Get-ComputeVMLocation

    try
    {
<<<<<<< HEAD
        Write-Debug "Start the test Test-AEMExtensionAdvancedWindows"
        # Setup
        $vm = Create-AdvancedVM -rgname $rgname -loc $loc -vmsize 'Standard_DS2' -stotype 'Premium_LRS' -nicCount 2
        $vmname = $vm.Name
        Write-Debug "Test-AEMExtensionAdvancedWindows: VM created"

        # Get with not extension
        Write-Debug "Test-AEMExtensionAdvancedWindows: Get with no extension"
        $extension = Get-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname
        Assert-Null $extension "Extension is not null"

        # Test with not extension
        Write-Debug "Test-AEMExtensionAdvancedWindows: Test with no extension"
        $res = Test-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname -SkipStorageCheck
        Assert-False { $res.Result }
        Write-Debug "Test-AEMExtensionAdvancedWindows: Test done"
=======
        Write-Verbose "Start the test Test-AEMExtensionAdvancedWindows"
        # Setup
        $vm = Create-AdvancedVM -rgname $rgname -loc $loc -vmsize 'Standard_DS2' -stotype 'Premium_LRS' -nicCount 2
        $vmname = $vm.Name
        Write-Verbose "Test-AEMExtensionAdvancedWindows: VM created"

        # Get with not extension
        Write-Verbose "Test-AEMExtensionAdvancedWindows: Get with no extension"
        $extension = Get-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname
        $nul = Assert-Null $extension "Extension is not null"

        # Test with not extension
        Write-Verbose "Test-AEMExtensionAdvancedWindows: Test with no extension"
        $res = Test-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname -SkipStorageCheck
        $nul = Assert-False { $res.Result }
        Write-Verbose "Test-AEMExtensionAdvancedWindows: Test done"
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e

        $stoname = 'sto' + $rgname + "2";
        New-AzStorageAccount -ResourceGroupName $rgname -Name $stoname -Location $loc -Type 'Standard_LRS';

        # Set and Get command.
<<<<<<< HEAD
        Write-Debug "Test-AEMExtensionAdvancedWindows: Set with no extension"
        Set-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname -WADStorageAccountName $stoname -SkipStorage
        Write-Debug "Test-AEMExtensionAdvancedWindows: Set done"
        Write-Debug "Test-AEMExtensionAdvancedWindows: Get with extension"
        $extension = Get-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname
        

        Assert-NotNull $extension
        Assert-AreEqual $extension.Publisher 'Microsoft.AzureCAT.AzureEnhancedMonitoring'
        Assert-AreEqual $extension.ExtensionType 'AzureCATExtensionHandler'
        Assert-AreEqual $extension.Name 'AzureCATExtensionHandler'
        $settings = $extension.PublicSettings | ConvertFrom-Json
        Assert-NotNull $settings.cfg
        Write-Debug "Test-AEMExtensionAdvancedWindows: Get done"

        # Test command.
        Write-Debug "Test-AEMExtensionAdvancedWindows: Test with extension"
        $res = Test-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname -SkipStorageCheck
        Assert-True { $res.Result }
        Assert-True { ($res.PartialResults.Count -gt 0) }
        Write-Debug "Test-AEMExtensionAdvancedWindows: Test done"

        # Remove command.
        Write-Debug "Test-AEMExtensionAdvancedWindows: Remove with extension"
        Remove-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname
        Write-Debug "Test-AEMExtensionAdvancedWindows: Remove done"

        Write-Debug "Test-AEMExtensionAdvancedWindows: Get after remove"
        $extension = Get-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname
        Assert-Null $extension "Extension is not null"
        Write-Debug "Test-AEMExtensionAdvancedWindows: Get after remove done"
=======
        Write-Verbose "Test-AEMExtensionAdvancedWindows: Set with no extension"
        Set-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname -WADStorageAccountName $stoname -SkipStorage
        Write-Verbose "Test-AEMExtensionAdvancedWindows: Set done"
        Write-Verbose "Test-AEMExtensionAdvancedWindows: Get with extension"
        $extension = Get-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname
        

        $nul = Assert-NotNull $extension
        $nul = Assert-AreEqual $extension.Publisher 'Microsoft.AzureCAT.AzureEnhancedMonitoring'
        $nul = Assert-AreEqual $extension.ExtensionType 'AzureCATExtensionHandler'
        $nul = Assert-AreEqual $extension.Name 'AzureCATExtensionHandler'
        $settings = $extension.PublicSettings | ConvertFrom-Json
        $nul = Assert-NotNull $settings.cfg
        Write-Verbose "Test-AEMExtensionAdvancedWindows: Get done"

        # Test command.
        Write-Verbose "Test-AEMExtensionAdvancedWindows: Test with extension"
        $res = Test-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname -SkipStorageCheck
        $nul = Assert-True { $res.Result }
        $nul = Assert-True { ($res.PartialResults.Count -gt 0) }
        Write-Verbose "Test-AEMExtensionAdvancedWindows: Test done"

        # Remove command.
        Write-Verbose "Test-AEMExtensionAdvancedWindows: Remove with extension"
        Remove-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname
        Write-Verbose "Test-AEMExtensionAdvancedWindows: Remove done"

        Write-Verbose "Test-AEMExtensionAdvancedWindows: Get after remove"
        $extension = Get-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname
        $nul = Assert-Null $extension "Extension is not null"
        Write-Verbose "Test-AEMExtensionAdvancedWindows: Get after remove done"
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
    }
    finally
    {
        # Cleanup
        Clean-ResourceGroup $rgname
    }
}

function Test-AEMExtensionAdvancedWindowsMD
{
    $rgname = Get-ComputeTestResourceName
    $loc = Get-ComputeVMLocation

    try
    {
<<<<<<< HEAD
        Write-Debug "Start the test Test-AEMExtensionAdvancedWindowsMD"
        # Setup
        $vm = Create-AdvancedVM -rgname $rgname -loc $loc -vmsize 'Standard_DS2' -stotype 'Premium_LRS' -nicCount 2 -useMD
        $vmname = $vm.Name
        Write-Debug "Test-AEMExtensionAdvancedWindowsMD: VM created"

        # Get with not extension
        Write-Debug "Test-AEMExtensionAdvancedWindowsMD: Get with no extension"
        $extension = Get-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname
        Assert-Null $extension "Extension is not null"

        # Test with not extension
        Write-Debug "Test-AEMExtensionAdvancedWindowsMD: Test with no extension"
        $res = Test-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname -SkipStorageCheck
        Assert-False { $res.Result }
        Write-Debug "Test-AEMExtensionAdvancedWindowsMD: Test done"
=======
        Write-Verbose "Start the test Test-AEMExtensionAdvancedWindowsMD"
        # Setup
        $vm = Create-AdvancedVM -rgname $rgname -loc $loc -vmsize 'Standard_DS2' -stotype 'Premium_LRS' -nicCount 2 -useMD
        $vmname = $vm.Name
        Write-Verbose "Test-AEMExtensionAdvancedWindowsMD: VM created"

        # Get with not extension
        Write-Verbose "Test-AEMExtensionAdvancedWindowsMD: Get with no extension"
        $extension = Get-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname
        $nul = Assert-Null $extension "Extension is not null"

        # Test with not extension
        Write-Verbose "Test-AEMExtensionAdvancedWindowsMD: Test with no extension"
        $res = Test-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname -SkipStorageCheck
        $nul = Assert-False { $res.Result }
        Write-Verbose "Test-AEMExtensionAdvancedWindowsMD: Test done"
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e

        $stoname = 'sto' + $rgname + "2";
        New-AzStorageAccount -ResourceGroupName $rgname -Name $stoname -Location $loc -Type 'Standard_LRS';

        # Set and Get command.
<<<<<<< HEAD
        Write-Debug "Test-AEMExtensionAdvancedWindowsMD: Set with no extension"
        Set-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname -WADStorageAccountName $stoname -SkipStorage
        Write-Debug "Test-AEMExtensionAdvancedWindowsMD: Set done"
        Write-Debug "Test-AEMExtensionAdvancedWindowsMD: Get with extension"
        $extension = Get-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname
        

        Assert-NotNull $extension
        Assert-AreEqual $extension.Publisher 'Microsoft.AzureCAT.AzureEnhancedMonitoring'
        Assert-AreEqual $extension.ExtensionType 'AzureCATExtensionHandler'
        Assert-AreEqual $extension.Name 'AzureCATExtensionHandler'
        $settings = $extension.PublicSettings | ConvertFrom-Json
        Assert-NotNull $settings.cfg
        Assert-True { ($extension.PublicSettings.Contains("osdisk.caching")) }
        Write-Debug "Test-AEMExtensionAdvancedWindowsMD: Get done"

        # Test command.
        Write-Debug "Test-AEMExtensionAdvancedWindowsMD: Test with extension"
        $res = Test-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname -SkipStorageCheck
        Assert-True { $res.Result }
        Assert-True { ($res.PartialResults.Count -gt 0) }
        Write-Debug "Test-AEMExtensionAdvancedWindowsMD: Test done"

        # Remove command.
        Write-Debug "Test-AEMExtensionAdvancedWindowsMD: Remove with extension"
        Remove-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname
        Write-Debug "Test-AEMExtensionAdvancedWindowsMD: Remove done"

        Write-Debug "Test-AEMExtensionAdvancedWindowsMD: Get after remove"
        $extension = Get-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname
        Assert-Null $extension "Extension is not null"
        Write-Debug "Test-AEMExtensionAdvancedWindowsMD: Get after remove done"
=======
        Write-Verbose "Test-AEMExtensionAdvancedWindowsMD: Set with no extension"
        Set-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname -WADStorageAccountName $stoname -SkipStorage
        Write-Verbose "Test-AEMExtensionAdvancedWindowsMD: Set done"
        Write-Verbose "Test-AEMExtensionAdvancedWindowsMD: Get with extension"
        $extension = Get-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname
        

        $nul = Assert-NotNull $extension
        $nul = Assert-AreEqual $extension.Publisher 'Microsoft.AzureCAT.AzureEnhancedMonitoring'
        $nul = Assert-AreEqual $extension.ExtensionType 'AzureCATExtensionHandler'
        $nul = Assert-AreEqual $extension.Name 'AzureCATExtensionHandler'
        $settings = $extension.PublicSettings | ConvertFrom-Json
        $nul = Assert-NotNull $settings.cfg
        $nul = Assert-True { ($extension.PublicSettings.Contains("osdisk.caching")) }
        Write-Verbose "Test-AEMExtensionAdvancedWindowsMD: Get done"

        # Test command.
        Write-Verbose "Test-AEMExtensionAdvancedWindowsMD: Test with extension"
        $res = Test-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname -SkipStorageCheck
        $nul = Assert-True { $res.Result }
        $nul = Assert-True { ($res.PartialResults.Count -gt 0) }
        Write-Verbose "Test-AEMExtensionAdvancedWindowsMD: Test done"

        # Remove command.
        Write-Verbose "Test-AEMExtensionAdvancedWindowsMD: Remove with extension"
        Remove-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname
        Write-Verbose "Test-AEMExtensionAdvancedWindowsMD: Remove done"

        Write-Verbose "Test-AEMExtensionAdvancedWindowsMD: Get after remove"
        $extension = Get-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname
        $nul = Assert-Null $extension "Extension is not null"
        Write-Verbose "Test-AEMExtensionAdvancedWindowsMD: Get after remove done"
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
    }
    finally
    {
        # Cleanup
        Clean-ResourceGroup $rgname
    }
}

function Test-AEMExtensionAdvancedLinuxMD
{
    $rgname = Get-ComputeTestResourceName
    $loc = Get-ComputeVMLocation

    try
    {
<<<<<<< HEAD
        Write-Host "Start the test Test-AEMExtensionAdvancedLinuxMD"
        # Setup
        $vm = Create-AdvancedVM -rgname $rgname -loc $loc -vmsize 'Standard_DS2' -stotype 'Premium_LRS' -nicCount 2 -useMD -linux
=======
        Write-Verbose "Start the test Test-AEMExtensionAdvancedLinuxMD"
        # Setup
        $vm = Create-AdvancedVM -rgname $rgname -loc $loc -vmsize 'Standard_DS2' -stotype 'Premium_LRS' -nicCount 2 -useMD -imageType "SLES"
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
        $vmname = $vm.Name
        $vm = Get-AzVM -ResourceGroupName $rgname -Name $vmname
        Add-AzVMDataDisk -VM $vm -StorageAccountType Premium_LRS -Lun (($vm.StorageProfile.DataDisks | select -ExpandProperty Lun | Measure-Object -Maximum).Maximum + 1) -CreateOption Empty -DiskSizeInGB 2059 | Update-AzVM
        
<<<<<<< HEAD
        Write-Debug "Test-AEMExtensionAdvancedLinuxMD: VM created"

        # Get with not extension
        Write-Debug "Test-AEMExtensionAdvancedLinuxMD: Get with no extension"
        $extension = Get-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname
        Assert-Null $extension "Extension is not null" "Extension is not null"

        # Test with not extension
        Write-Debug "Test-AEMExtensionAdvancedLinuxMD: Test with no extension"
        $res = Test-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname -SkipStorageCheck
        $tmp = $res;$out = &{while ($true) { if ($tmp) { foreach ($tmpRes in $tmp) {($tmpRes.TestName  + " " + $tmpRes.Result)};$tmp = @($tmp.PartialResults)} else {break}}};
        Assert-False { $res.Result } "Test result is not false $out"
        Write-Debug "Test-AEMExtensionAdvancedLinuxMD: Test done"
=======
        Write-Verbose "Test-AEMExtensionAdvancedLinuxMD: VM created"

        # Get with not extension
        Write-Verbose "Test-AEMExtensionAdvancedLinuxMD: Get with no extension"
        $extension = Get-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname
        $nul = Assert-Null $extension "Extension is not null" "Extension is not null"

        # Test with not extension
        Write-Verbose "Test-AEMExtensionAdvancedLinuxMD: Test with no extension"
        $res = Test-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname -SkipStorageCheck
        $tmp = $res;$out = &{while ($true) { if ($tmp) { foreach ($tmpRes in $tmp) {($tmpRes.TestName  + " " + $tmpRes.Result)};$tmp = @($tmp.PartialResults)} else {break}}};
        $nul = Assert-False { $res.Result } "Test result is not false $out"
        Write-Verbose "Test-AEMExtensionAdvancedLinuxMD: Test done"
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e

        $stoname = 'sto' + $rgname + "2";
        New-AzStorageAccount -ResourceGroupName $rgname -Name $stoname -Location $loc -Type 'Standard_LRS';

        # Set and Get command.
<<<<<<< HEAD
        Write-Debug "Test-AEMExtensionAdvancedLinuxMD: Set with no extension"
        Set-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname -WADStorageAccountName $stoname -SkipStorage
        Write-Debug "Test-AEMExtensionAdvancedLinuxMD: Set done"
        Write-Debug "Test-AEMExtensionAdvancedLinuxMD: Get with extension"
        $extension = Get-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname
        

        Assert-NotNull $extension
        Assert-AreEqual $extension.Publisher 'Microsoft.OSTCExtensions'
        Assert-AreEqual $extension.ExtensionType 'AzureEnhancedMonitorForLinux'
        Assert-AreEqual $extension.Name 'AzureEnhancedMonitorForLinux'
        $settings = $extension.PublicSettings | ConvertFrom-Json
        Assert-NotNull $settings.cfg
        Write-Debug "Test-AEMExtensionAdvancedLinuxMD: Get done"

        # Test command.
        Write-Debug "Test-AEMExtensionAdvancedLinuxMD: Test with extension"
        $res = Test-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname -SkipStorageCheck
        $tmp = $res;$out = &{while ($true) { if ($tmp) { foreach ($tmpRes in $tmp) {($tmpRes.TestName  + " " + $tmpRes.Result)};$tmp = @($tmp.PartialResults)} else {break}}};
        Assert-True { $res.Result } "Test result is not false $out"
        Assert-True { ($res.PartialResults.Count -gt 0) }
        Write-Debug "Test-AEMExtensionAdvancedLinuxMD: Test done"

        # Remove command.
        Write-Debug "Test-AEMExtensionAdvancedLinuxMD: Remove with extension"
        Remove-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname
        Write-Debug "Test-AEMExtensionAdvancedLinuxMD: Remove done"

        Write-Debug "Test-AEMExtensionAdvancedLinuxMD: Get after remove"
        $extension = Get-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname
        Assert-Null $extension "Extension is not null"
        Write-Debug "Test-AEMExtensionAdvancedLinuxMD: Get after remove done"
=======
        Write-Verbose "Test-AEMExtensionAdvancedLinuxMD: Set with no extension"
        Set-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname -WADStorageAccountName $stoname -SkipStorage
        Write-Verbose "Test-AEMExtensionAdvancedLinuxMD: Set done"
        Write-Verbose "Test-AEMExtensionAdvancedLinuxMD: Get with extension"
        $extension = Get-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname
        

        $nul = Assert-NotNull $extension
        $nul = Assert-AreEqual $extension.Publisher 'Microsoft.OSTCExtensions'
        $nul = Assert-AreEqual $extension.ExtensionType 'AzureEnhancedMonitorForLinux'
        $nul = Assert-AreEqual $extension.Name 'AzureEnhancedMonitorForLinux'
        $settings = $extension.PublicSettings | ConvertFrom-Json
        $nul = Assert-NotNull $settings.cfg
        Write-Verbose "Test-AEMExtensionAdvancedLinuxMD: Get done"

        # Test command.
        Write-Verbose "Test-AEMExtensionAdvancedLinuxMD: Test with extension"
        $res = Test-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname -SkipStorageCheck
        $tmp = $res;$out = &{while ($true) { if ($tmp) { foreach ($tmpRes in $tmp) {($tmpRes.TestName  + " " + $tmpRes.Result)};$tmp = @($tmp.PartialResults)} else {break}}};
        $nul = Assert-True { $res.Result } "Test result is not false $out"
        $nul = Assert-True { ($res.PartialResults.Count -gt 0) }
        Write-Verbose "Test-AEMExtensionAdvancedLinuxMD: Test done"

        # Remove command.
        Write-Verbose "Test-AEMExtensionAdvancedLinuxMD: Remove with extension"
        Remove-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname
        Write-Verbose "Test-AEMExtensionAdvancedLinuxMD: Remove done"

        Write-Verbose "Test-AEMExtensionAdvancedLinuxMD: Get after remove"
        $extension = Get-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname
        $nul = Assert-Null $extension "Extension is not null"
        Write-Verbose "Test-AEMExtensionAdvancedLinuxMD: Get after remove done"
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
    }
    finally
    {
        # Cleanup
        Clean-ResourceGroup $rgname
    }
}

function Test-AEMExtensionBasicLinuxWAD
{
    $rgname = Get-ComputeTestResourceName
    $loc = Get-ComputeVMLocation

    try
    {
       # Setup
<<<<<<< HEAD
        $vm = Create-AdvancedVM -rgname $rgname -loc $loc -linux
=======
        $vm = Create-AdvancedVM -rgname $rgname -loc $loc -imageType "SLES"
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
        $vmname = $vm.Name

        # Get with not extension
        $extension = Get-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname
<<<<<<< HEAD
        Assert-Null $extension "Extension is not null"
        # Test with not extension
        $testResult = Test-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname -SkipStorageCheck
        Assert-False { $testResult.Result }
=======
        $nul = Assert-Null $extension "Extension is not null"
        # Test with not extension
        $testResult = Test-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname -SkipStorageCheck
        $nul = Assert-False { $testResult.Result }
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e

        # Set and Get command.
        Set-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname -SkipStorage -EnableWAD
        $extension = Get-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname

<<<<<<< HEAD
        Assert-NotNull $extension
        Assert-AreEqual $extension.Publisher 'Microsoft.OSTCExtensions'
        Assert-AreEqual $extension.ExtensionType 'AzureEnhancedMonitorForLinux'
        Assert-AreEqual $extension.Name 'AzureEnhancedMonitorForLinux'
        $settings = $extension.PublicSettings | ConvertFrom-Json
        Assert-NotNull $settings.cfg

        # Test command.
        $testResult = Test-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname -WaitTimeInMinutes 50 -SkipStorageCheck
        Assert-True { $testResult.Result }
        Assert-True { ($testResult.PartialResults.Count -gt 0) }
=======
        $nul = Assert-NotNull $extension
        $nul = Assert-AreEqual $extension.Publisher 'Microsoft.OSTCExtensions'
        $nul = Assert-AreEqual $extension.ExtensionType 'AzureEnhancedMonitorForLinux'
        $nul = Assert-AreEqual $extension.Name 'AzureEnhancedMonitorForLinux'
        $settings = $extension.PublicSettings | ConvertFrom-Json
        $nul = Assert-NotNull $settings.cfg

        # Test command.
        $testResult = Test-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname -WaitTimeInMinutes 50 -SkipStorageCheck
        $nul = Assert-True { $testResult.Result }
        $nul = Assert-True { ($testResult.PartialResults.Count -gt 0) }
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e

        # Remove command.
        Remove-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname
        $extension = Get-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname
<<<<<<< HEAD
        Assert-Null $extension "Extension is not null"
=======
        $nul = Assert-Null $extension "Extension is not null"
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
    }
    finally
    {
        # Cleanup
        Clean-ResourceGroup $rgname
    }
}

function Test-AEMExtensionBasicLinux
{
    $rgname = Get-ComputeTestResourceName
    $loc = Get-ComputeVMLocation

    try
    {
       # Setup
<<<<<<< HEAD
        $vm = Create-AdvancedVM -rgname $rgname -loc $loc -linux
=======
        $vm = Create-AdvancedVM -rgname $rgname -loc $loc -imageType "SLES"
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
        $vmname = $vm.Name

        # Get with not extension
        $extension = Get-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname
<<<<<<< HEAD
        Assert-Null $extension "Extension is not null"
        # Test with not extension
        $testResult = Test-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname -SkipStorageCheck
        Assert-False { $testResult.Result }
=======
        $nul = Assert-Null $extension "Extension is not null"
        # Test with not extension
        $testResult = Test-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname -SkipStorageCheck
        $nul = Assert-False { $testResult.Result }
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e

        # Set and Get command.
        Set-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname -SkipStorage
        $extension = Get-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname

<<<<<<< HEAD
        Assert-NotNull $extension
        Assert-AreEqual $extension.Publisher 'Microsoft.OSTCExtensions'
        Assert-AreEqual $extension.ExtensionType 'AzureEnhancedMonitorForLinux'
        Assert-AreEqual $extension.Name 'AzureEnhancedMonitorForLinux'
        $settings = $extension.PublicSettings | ConvertFrom-Json
        Assert-NotNull $settings.cfg

        # Test command.
        $testResult = Test-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname -WaitTimeInMinutes 50 -SkipStorageCheck
        Assert-True { $testResult.Result }
        Assert-True { ($testResult.PartialResults.Count -gt 0) }
=======
        $nul = Assert-NotNull $extension
        $nul = Assert-AreEqual $extension.Publisher 'Microsoft.OSTCExtensions'
        $nul = Assert-AreEqual $extension.ExtensionType 'AzureEnhancedMonitorForLinux'
        $nul = Assert-AreEqual $extension.Name 'AzureEnhancedMonitorForLinux'
        $settings = $extension.PublicSettings | ConvertFrom-Json
        $nul = Assert-NotNull $settings.cfg

        # Test command.
        $testResult = Test-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname -WaitTimeInMinutes 50 -SkipStorageCheck
        $nul = Assert-True { $testResult.Result }
        $nul = Assert-True { ($testResult.PartialResults.Count -gt 0) }
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e

        # Remove command.
        Remove-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname
        $extension = Get-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname
<<<<<<< HEAD
        Assert-Null $extension "Extension is not null"
=======
        $nul = Assert-Null $extension "Extension is not null"
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
    }
    finally
    {
        # Cleanup
        Clean-ResourceGroup $rgname
    }
}

function Test-AEMExtensionAdvancedLinuxWAD
{
    $rgname = Get-ComputeTestResourceName
    $loc = Get-ComputeVMLocation

    try
    {
<<<<<<< HEAD
        Write-Debug "Start the test Test-AEMExtensionAdvancedLinux"
        # Setup
        $vm = Create-AdvancedVM -rgname $rgname -loc $loc -vmsize 'Standard_DS2' -stotype 'Premium_LRS' -nicCount 2 -linux
        $vmname = $vm.Name
        Write-Debug "Test-AEMExtensionAdvancedLinux: VM created"

        # Get with not extension
        Write-Debug "Test-AEMExtensionAdvancedLinux: Get with no extension"
        $extension = Get-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname
        Assert-Null $extension "Extension is not null"

        # Test with not extension
        Write-Debug "Test-AEMExtensionAdvancedLinux: Test with no extension"
        $res = Test-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname -SkipStorageCheck
        Write-Debug ("Test-AEMExtensionAdvancedLinux: Test result " + $res.Result)
        Assert-False { $res.Result } (GetWrongTestResult $res $true)
        Write-Debug "Test-AEMExtensionAdvancedLinux: Test done"
=======
        Write-Verbose "Start the test Test-AEMExtensionAdvancedLinux"
        # Setup
        $vm = Create-AdvancedVM -rgname $rgname -loc $loc -vmsize 'Standard_DS2' -stotype 'Premium_LRS' -nicCount 2 -imageType "SLES"
        $vmname = $vm.Name
        Write-Verbose "Test-AEMExtensionAdvancedLinux: VM created"

        # Get with not extension
        Write-Verbose "Test-AEMExtensionAdvancedLinux: Get with no extension"
        $extension = Get-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname
        $nul = Assert-Null $extension "Extension is not null"

        # Test with not extension
        Write-Verbose "Test-AEMExtensionAdvancedLinux: Test with no extension"
        $res = Test-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname -SkipStorageCheck
        Write-Verbose ("Test-AEMExtensionAdvancedLinux: Test result " + $res.Result)
        $nul = Assert-False { $res.Result } (GetWrongTestResult $res $true)
        Write-Verbose "Test-AEMExtensionAdvancedLinux: Test done"
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e

        $stoname = 'sto' + $rgname + "2";
        New-AzStorageAccount -ResourceGroupName $rgname -Name $stoname -Location $loc -Type 'Standard_LRS';

        # Set and Get command.
<<<<<<< HEAD
        Write-Debug "Test-AEMExtensionAdvancedLinux: Set with no extension"
        Set-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname -WADStorageAccountName $stoname -SkipStorage -EnableWAD
        Write-Debug "Test-AEMExtensionAdvancedLinux: Set done"
        Write-Debug "Test-AEMExtensionAdvancedLinux: Get with extension"
        $extension = Get-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname
        

        Assert-NotNull $extension
        Assert-AreEqual $extension.Publisher 'Microsoft.OSTCExtensions'
        Assert-AreEqual $extension.ExtensionType 'AzureEnhancedMonitorForLinux'
        Assert-AreEqual $extension.Name 'AzureEnhancedMonitorForLinux'
        $settings = $extension.PublicSettings | ConvertFrom-Json
        Assert-NotNull $settings.cfg
        Write-Debug "Test-AEMExtensionAdvancedLinux: Get done"

        # Test command.
        Write-Debug "Test-AEMExtensionAdvancedLinux: Test with extension"
        $res = Test-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname -SkipStorageCheck
        Assert-True { $res.Result } (GetWrongTestResult $res $false)
        Assert-True { ($res.PartialResults.Count -gt 0) }
        Write-Debug "Test-AEMExtensionAdvancedLinux: Test done"

        # Remove command.
        Write-Debug "Test-AEMExtensionAdvancedLinux: Remove with extension"
        Remove-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname
        Write-Debug "Test-AEMExtensionAdvancedLinux: Remove done"

        Write-Debug "Test-AEMExtensionAdvancedLinux: Get after remove"
        $extension = Get-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname
        Assert-Null $extension "Extension is not null"
        Write-Debug "Test-AEMExtensionAdvancedLinux: Get after remove done"
=======
        Write-Verbose "Test-AEMExtensionAdvancedLinux: Set with no extension"
        Set-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname -WADStorageAccountName $stoname -SkipStorage -EnableWAD
        Write-Verbose "Test-AEMExtensionAdvancedLinux: Set done"
        Write-Verbose "Test-AEMExtensionAdvancedLinux: Get with extension"
        $extension = Get-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname
        

        $nul = Assert-NotNull $extension
        $nul = Assert-AreEqual $extension.Publisher 'Microsoft.OSTCExtensions'
        $nul = Assert-AreEqual $extension.ExtensionType 'AzureEnhancedMonitorForLinux'
        $nul = Assert-AreEqual $extension.Name 'AzureEnhancedMonitorForLinux'
        $settings = $extension.PublicSettings | ConvertFrom-Json
        $nul = Assert-NotNull $settings.cfg
        Write-Verbose "Test-AEMExtensionAdvancedLinux: Get done"

        # Test command.
        Write-Verbose "Test-AEMExtensionAdvancedLinux: Test with extension"
        $res = Test-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname -SkipStorageCheck
        $nul = Assert-True { $res.Result } (GetWrongTestResult $res $false)
        $nul = Assert-True { ($res.PartialResults.Count -gt 0) }
        Write-Verbose "Test-AEMExtensionAdvancedLinux: Test done"

        # Remove command.
        Write-Verbose "Test-AEMExtensionAdvancedLinux: Remove with extension"
        Remove-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname
        Write-Verbose "Test-AEMExtensionAdvancedLinux: Remove done"

        Write-Verbose "Test-AEMExtensionAdvancedLinux: Get after remove"
        $extension = Get-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname
        $nul = Assert-Null $extension "Extension is not null"
        Write-Verbose "Test-AEMExtensionAdvancedLinux: Get after remove done"
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
    }
    finally
    {
        # Cleanup
        Clean-ResourceGroup $rgname
    }
}

function Test-AEMExtensionAdvancedLinux
{
    $rgname = Get-ComputeTestResourceName
    $loc = Get-ComputeVMLocation

    try
    {
<<<<<<< HEAD
        Write-Debug "Start the test Test-AEMExtensionAdvancedLinux"
        # Setup
        $vm = Create-AdvancedVM -rgname $rgname -loc $loc -vmsize 'Standard_DS2' -stotype 'Premium_LRS' -nicCount 2 -linux
        $vmname = $vm.Name
        Write-Debug "Test-AEMExtensionAdvancedLinux: VM created"

        # Get with not extension
        Write-Debug "Test-AEMExtensionAdvancedLinux: Get with no extension"
        $extension = Get-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname
        Assert-Null $extension "Extension is not null"

        # Test with not extension
        Write-Debug "Test-AEMExtensionAdvancedLinux: Test with no extension"
        $res = Test-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname -SkipStorageCheck
        Write-Debug ("Test-AEMExtensionAdvancedLinux: Test result " + $res.Result)
        Assert-False { $res.Result }
        Write-Debug "Test-AEMExtensionAdvancedLinux: Test done"
=======
        Write-Verbose "Start the test Test-AEMExtensionAdvancedLinux"
        # Setup
        $vm = Create-AdvancedVM -rgname $rgname -loc $loc -vmsize 'Standard_DS2' -stotype 'Premium_LRS' -nicCount 2 -imageType "SLES"
        $vmname = $vm.Name
        Write-Verbose "Test-AEMExtensionAdvancedLinux: VM created"

        # Get with not extension
        Write-Verbose "Test-AEMExtensionAdvancedLinux: Get with no extension"
        $extension = Get-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname
        $nul = Assert-Null $extension "Extension is not null"

        # Test with not extension
        Write-Verbose "Test-AEMExtensionAdvancedLinux: Test with no extension"
        $res = Test-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname -SkipStorageCheck
        Write-Verbose ("Test-AEMExtensionAdvancedLinux: Test result " + $res.Result)
        $nul = Assert-False { $res.Result }
        Write-Verbose "Test-AEMExtensionAdvancedLinux: Test done"
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e

        $stoname = 'sto' + $rgname + "2";
        New-AzStorageAccount -ResourceGroupName $rgname -Name $stoname -Location $loc -Type 'Standard_LRS';

        # Set and Get command.
<<<<<<< HEAD
        Write-Debug "Test-AEMExtensionAdvancedLinux: Set with no extension"
        Set-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname -WADStorageAccountName $stoname -SkipStorage
        Write-Debug "Test-AEMExtensionAdvancedLinux: Set done"
        Write-Debug "Test-AEMExtensionAdvancedLinux: Get with extension"
        $extension = Get-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname
        

        Assert-NotNull $extension
        Assert-AreEqual $extension.Publisher 'Microsoft.OSTCExtensions'
        Assert-AreEqual $extension.ExtensionType 'AzureEnhancedMonitorForLinux'
        Assert-AreEqual $extension.Name 'AzureEnhancedMonitorForLinux'
        $settings = $extension.PublicSettings | ConvertFrom-Json
        Assert-NotNull $settings.cfg
        Write-Debug "Test-AEMExtensionAdvancedLinux: Get done"

        # Test command.
        Write-Debug "Test-AEMExtensionAdvancedLinux: Test with extension"
        $res = Test-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname -SkipStorageCheck
        Assert-True { $res.Result }
        Assert-True { ($res.PartialResults.Count -gt 0) }
        Write-Debug "Test-AEMExtensionAdvancedLinux: Test done"

        # Remove command.
        Write-Debug "Test-AEMExtensionAdvancedLinux: Remove with extension"
        Remove-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname
        Write-Debug "Test-AEMExtensionAdvancedLinux: Remove done"

        Write-Debug "Test-AEMExtensionAdvancedLinux: Get after remove"
        $extension = Get-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname
        Assert-Null $extension "Extension is not null"
        Write-Debug "Test-AEMExtensionAdvancedLinux: Get after remove done"
=======
        Write-Verbose "Test-AEMExtensionAdvancedLinux: Set with no extension"
        Set-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname -WADStorageAccountName $stoname -SkipStorage
        Write-Verbose "Test-AEMExtensionAdvancedLinux: Set done"
        Write-Verbose "Test-AEMExtensionAdvancedLinux: Get with extension"
        $extension = Get-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname
        

        $nul = Assert-NotNull $extension
        $nul = Assert-AreEqual $extension.Publisher 'Microsoft.OSTCExtensions'
        $nul = Assert-AreEqual $extension.ExtensionType 'AzureEnhancedMonitorForLinux'
        $nul = Assert-AreEqual $extension.Name 'AzureEnhancedMonitorForLinux'
        $settings = $extension.PublicSettings | ConvertFrom-Json
        $nul = Assert-NotNull $settings.cfg
        Write-Verbose "Test-AEMExtensionAdvancedLinux: Get done"

        # Test command.
        Write-Verbose "Test-AEMExtensionAdvancedLinux: Test with extension"
        $res = Test-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname -SkipStorageCheck
        $nul = Assert-True { $res.Result }
        $nul = Assert-True { ($res.PartialResults.Count -gt 0) }
        Write-Verbose "Test-AEMExtensionAdvancedLinux: Test done"

        # Remove command.
        Write-Verbose "Test-AEMExtensionAdvancedLinux: Remove with extension"
        Remove-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname
        Write-Verbose "Test-AEMExtensionAdvancedLinux: Remove done"

        Write-Verbose "Test-AEMExtensionAdvancedLinux: Get after remove"
        $extension = Get-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname
        $nul = Assert-Null $extension "Extension is not null"
        Write-Verbose "Test-AEMExtensionAdvancedLinux: Get after remove done"
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
    }
    finally
    {
        # Cleanup
        Clean-ResourceGroup $rgname
    }
}

function Test-AEMExtensionAdvancedLinuxMD_E
{
    $rgname = Get-ComputeTestResourceName
    [string]$loc = Get-ComputeVMLocation;
    $loc = $loc.Replace(' ', '');

    try
    {
<<<<<<< HEAD
        Write-Debug "Start the test Test-AEMExtensionAdvancedLinuxMD_E"
        # Setup

        $ultraSSDInfo = Get-AzComputeResourceSku | where { $_.LocationInfo.Location -eq $loc -and $_.Name -eq "UltraSSD_LRS" };
        Write-Debug "Test-AEMExtensionAdvancedLinuxMD_E: Got UltraSSD info $($ultraSSDInfo)"
=======
        Write-Verbose "Start the test Test-AEMExtensionAdvancedLinuxMD_E"
        # Setup

        $ultraSSDInfo = Get-AzComputeResourceSku | where { $_.LocationInfo.Location -eq $loc -and $_.Name -eq "UltraSSD_LRS" };
        Write-Verbose "Test-AEMExtensionAdvancedLinuxMD_E: Got UltraSSD info $($ultraSSDInfo)"
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e

        $zoneparams = @{}
        if ($ultraSSDInfo) 
        {
            $zoneparams.Add("zone", $ultraSSDInfo.LocationInfo.Zones[0])    
        }

<<<<<<< HEAD
        $vm = Create-AdvancedVM -rgname $rgname -loc $loc -vmsize 'Standard_E4s_v3' -stotype 'Premium_LRS' -nicCount 2 -useMD -linux @zoneparams
        Write-Debug "Test-AEMExtensionAdvancedLinuxMD_E: VM created"
=======
        $vm = Create-AdvancedVM -rgname $rgname -loc $loc -vmsize 'Standard_E4s_v3' -stotype 'Premium_LRS' -nicCount 2 -useMD -imageType "SLES" @zoneparams
        Write-Verbose "Test-AEMExtensionAdvancedLinuxMD_E: VM created"
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
        $vmname = $vm.Name
        $vm = Get-AzVM -ResourceGroupName $rgname -Name $vmname
        Add-AzVMDataDisk -VM $vm -StorageAccountType Premium_LRS -Lun (($vm.StorageProfile.DataDisks | select -ExpandProperty Lun | Measure-Object -Maximum).Maximum + 1) -CreateOption Empty -DiskSizeInGB 2059 | Update-AzVM
        Add-AzVMDataDisk -VM $vm -StorageAccountType Premium_LRS -Lun (($vm.StorageProfile.DataDisks | select -ExpandProperty Lun | Measure-Object -Maximum).Maximum + 1) -CreateOption Empty -DiskSizeInGB 16000 | Update-AzVM
        Add-AzVMDataDisk -VM $vm -StorageAccountType Premium_LRS -Lun (($vm.StorageProfile.DataDisks | select -ExpandProperty Lun | Measure-Object -Maximum).Maximum + 1) -CreateOption Empty -DiskSizeInGB 32000 | Update-AzVM

        if ($ultraSSDInfo) 
        {
    
            $nul = Stop-AzVm -ResourceGroupName $rgname -Name $vmname -Force
            $vm = Get-AzVM -ResourceGroupName $rgname -VMName $vmname
            $vm | update-azvm -UltraSSDEnabled $true
            $nul = Start-AzVm -ResourceGroupName $rgname -Name $vmname
            
            $ultraDisk = New-AzDiskConfig -SkuName UltraSSD_LRS -DiskSizeGB 512 -DiskIOPSReadWrite 5000 -DiskMBpsReadWrite 20 -CreateOption Empty -Location $loc -Zone $ultraSSDInfo.LocationInfo.Zones[0] `
                | New-AzDisk -ResourceGroupName $rgname -DiskName "ultrassd"
            
            Add-AzVMDataDisk -VM $vm  -ManagedDiskId $ultraDisk.Id -Lun (($vm.StorageProfile.DataDisks | select -ExpandProperty Lun | Measure-Object -Maximum).Maximum + 1) -CreateOption Attach `
                | Update-AzVM
        }
        else 
        {
<<<<<<< HEAD
            Write-Debug "Test-AEMExtensionAdvancedLinuxMD_E: not testing UltraSSD because the resource sku is not available"
        }
        
        Write-Debug "Test-AEMExtensionAdvancedLinuxMD: VM created"

        # Get with not extension
        Write-Debug "Test-AEMExtensionAdvancedLinuxMD: Get with no extension"
        $extension = Get-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname
        Assert-Null $extension "Extension is not null" "Extension is not null"

        # Test with not extension
        Write-Debug "Test-AEMExtensionAdvancedLinuxMD: Test with no extension"
        $res = Test-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname -SkipStorageCheck
        $tmp = $res;$out = &{while ($true) { if ($tmp) { foreach ($tmpRes in $tmp) {($tmpRes.TestName  + " " + $tmpRes.Result)};$tmp = @($tmp.PartialResults)} else {break}}};
        Assert-False { $res.Result } "Test result is not false $out"
        Write-Debug "Test-AEMExtensionAdvancedLinuxMD: Test done"
=======
            Write-Verbose "Test-AEMExtensionAdvancedLinuxMD_E: not testing UltraSSD because the resource sku is not available"
        }
        
        Write-Verbose "Test-AEMExtensionAdvancedLinuxMD: VM created"

        # Get with not extension
        Write-Verbose "Test-AEMExtensionAdvancedLinuxMD: Get with no extension"
        $extension = Get-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname
        $nul = Assert-Null $extension "Extension is not null" "Extension is not null"

        # Test with not extension
        Write-Verbose "Test-AEMExtensionAdvancedLinuxMD: Test with no extension"
        $res = Test-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname -SkipStorageCheck
        $tmp = $res;$out = &{while ($true) { if ($tmp) { foreach ($tmpRes in $tmp) {($tmpRes.TestName  + " " + $tmpRes.Result)};$tmp = @($tmp.PartialResults)} else {break}}};
        $nul = Assert-False { $res.Result } "Test result is not false $out"
        Write-Verbose "Test-AEMExtensionAdvancedLinuxMD: Test done"
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e

        $stoname = 'sto' + $rgname + "2";
        New-AzStorageAccount -ResourceGroupName $rgname -Name $stoname -Location $loc -Type 'Standard_LRS';

        # Set and Get command.
<<<<<<< HEAD
        Write-Debug "Test-AEMExtensionAdvancedLinuxMD: Set with no extension"
        Set-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname -WADStorageAccountName $stoname -SkipStorage
        Write-Debug "Test-AEMExtensionAdvancedLinuxMD: Set done"
        Write-Debug "Test-AEMExtensionAdvancedLinuxMD: Get with extension"
        $extension = Get-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname
        

        Assert-NotNull $extension
        Assert-AreEqual $extension.Publisher 'Microsoft.OSTCExtensions'
        Assert-AreEqual $extension.ExtensionType 'AzureEnhancedMonitorForLinux'
        Assert-AreEqual $extension.Name 'AzureEnhancedMonitorForLinux'
        $settings = $extension.PublicSettings | ConvertFrom-Json
        Assert-NotNull $settings.cfg
        Write-Debug "Test-AEMExtensionAdvancedLinuxMD: Get done"

        # Test command.
        Write-Debug "Test-AEMExtensionAdvancedLinuxMD: Test with extension"
        $res = Test-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname -SkipStorageCheck
        $tmp = $res;$out = &{while ($true) { if ($tmp) { foreach ($tmpRes in $tmp) {($tmpRes.TestName  + " " + $tmpRes.Result)};$tmp = @($tmp.PartialResults)} else {break}}};
        Assert-True { $res.Result } "Test result is not false $out"
        Assert-True { ($res.PartialResults.Count -gt 0) }
        Write-Debug "Test-AEMExtensionAdvancedLinuxMD: Test done"

        # Remove command.
        Write-Debug "Test-AEMExtensionAdvancedLinuxMD: Remove with extension"
        Remove-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname
        Write-Debug "Test-AEMExtensionAdvancedLinuxMD: Remove done"

        Write-Debug "Test-AEMExtensionAdvancedLinuxMD: Get after remove"
        $extension = Get-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname
        Assert-Null $extension "Extension is not null"
        Write-Debug "Test-AEMExtensionAdvancedLinuxMD: Get after remove done"
    }
    catch 
    {
        Write-Debug "Exception while running test: $($_)"
=======
        Write-Verbose "Test-AEMExtensionAdvancedLinuxMD: Set with no extension"
        Set-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname -WADStorageAccountName $stoname -SkipStorage
        Write-Verbose "Test-AEMExtensionAdvancedLinuxMD: Set done"
        Write-Verbose "Test-AEMExtensionAdvancedLinuxMD: Get with extension"
        $extension = Get-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname
        

        $nul = Assert-NotNull $extension
        $nul = Assert-AreEqual $extension.Publisher 'Microsoft.OSTCExtensions'
        $nul = Assert-AreEqual $extension.ExtensionType 'AzureEnhancedMonitorForLinux'
        $nul = Assert-AreEqual $extension.Name 'AzureEnhancedMonitorForLinux'
        $settings = $extension.PublicSettings | ConvertFrom-Json
        $nul = Assert-NotNull $settings.cfg
        Write-Verbose "Test-AEMExtensionAdvancedLinuxMD: Get done"

        # Test command.
        Write-Verbose "Test-AEMExtensionAdvancedLinuxMD: Test with extension"
        $res = Test-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname -SkipStorageCheck
        $tmp = $res;$out = &{while ($true) { if ($tmp) { foreach ($tmpRes in $tmp) {($tmpRes.TestName  + " " + $tmpRes.Result)};$tmp = @($tmp.PartialResults)} else {break}}};
        $nul = Assert-True { $res.Result } "Test result is not false $out"
        $nul = Assert-True { ($res.PartialResults.Count -gt 0) }
        Write-Verbose "Test-AEMExtensionAdvancedLinuxMD: Test done"

        # Remove command.
        Write-Verbose "Test-AEMExtensionAdvancedLinuxMD: Remove with extension"
        Remove-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname
        Write-Verbose "Test-AEMExtensionAdvancedLinuxMD: Remove done"

        Write-Verbose "Test-AEMExtensionAdvancedLinuxMD: Get after remove"
        $extension = Get-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname
        $nul = Assert-Null $extension "Extension is not null"
        Write-Verbose "Test-AEMExtensionAdvancedLinuxMD: Get after remove done"
    }
    catch 
    {
        Write-Verbose "Exception while running test: $($_)"
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
        throw
    }
    finally
    {
        # Cleanup
        Clean-ResourceGroup $rgname
    }
}

function Test-AEMExtensionAdvancedLinuxMD_D
{
    $rgname = Get-ComputeTestResourceName
    [string]$loc = Get-ComputeVMLocation;
    $loc = $loc.Replace(' ', '');

    try
    {
        Log "Test-AEMExtensionAdvancedLinuxMD_D" "Start the test Test-AEMExtensionAdvancedLinuxMD"
        # Setup
<<<<<<< HEAD
        $vm = Create-AdvancedVM -rgname $rgname -loc $loc -vmsize 'Standard_D2s_v3' -stotype 'Premium_LRS' -nicCount 2 -useMD -linux
=======
        $vm = Create-AdvancedVM -rgname $rgname -loc $loc -vmsize 'Standard_D2s_v3' -stotype 'Premium_LRS' -nicCount 2 -useMD -imageType "SLES"
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e

        Log "Test-AEMExtensionAdvancedLinuxMD_D" "VM created"
        $vmname = $vm.Name
        $vm = Get-AzVM -ResourceGroupName $rgname -Name $vmname
        Add-AzVMDataDisk -VM $vm -StorageAccountType Premium_LRS -Lun (($vm.StorageProfile.DataDisks | select -ExpandProperty Lun | Measure-Object -Maximum).Maximum + 1) -CreateOption Empty -DiskSizeInGB 2059 | Update-AzVM
        
        Log "Test-AEMExtensionAdvancedLinuxMD_D" "Test-AEMExtensionAdvancedLinuxMD: VM created"

        # Get with not extension
        Log "Test-AEMExtensionAdvancedLinuxMD_D" "Test-AEMExtensionAdvancedLinuxMD: Get with no extension"
        $extension = Get-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname
<<<<<<< HEAD
        Assert-Null $extension "Extension is not null" "Extension is not null"
=======
        $nul = Assert-Null $extension "Extension is not null" "Extension is not null"
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e

        # Test with not extension
        Log "Test-AEMExtensionAdvancedLinuxMD_D" "Test-AEMExtensionAdvancedLinuxMD: Test with no extension"
        $res = Test-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname -SkipStorageCheck
        $tmp = $res;$out = &{while ($true) { if ($tmp) { foreach ($tmpRes in $tmp) {($tmpRes.TestName  + " " + $tmpRes.Result)};$tmp = @($tmp.PartialResults)} else {break}}};
<<<<<<< HEAD
        Assert-False { $res.Result } "Test result is not false $out"
=======
        $nul = Assert-False { $res.Result } "Test result is not false $out"
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
        Log "Test-AEMExtensionAdvancedLinuxMD_D" "Test-AEMExtensionAdvancedLinuxMD: Test done"

        $stoname = 'sto' + $rgname + "2";
        New-AzStorageAccount -ResourceGroupName $rgname -Name $stoname -Location $loc -Type 'Standard_LRS';

        # Set and Get command.
        Log "Test-AEMExtensionAdvancedLinuxMD_D" "Test-AEMExtensionAdvancedLinuxMD: Set with no extension"
        Set-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname -WADStorageAccountName $stoname -SkipStorage
        Log "Test-AEMExtensionAdvancedLinuxMD_D" "Test-AEMExtensionAdvancedLinuxMD: Set done"
        Log "Test-AEMExtensionAdvancedLinuxMD_D" "Test-AEMExtensionAdvancedLinuxMD: Get with extension"
        $extension = Get-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname
        

<<<<<<< HEAD
        Assert-NotNull $extension
        Assert-AreEqual $extension.Publisher 'Microsoft.OSTCExtensions'
        Assert-AreEqual $extension.ExtensionType 'AzureEnhancedMonitorForLinux'
        Assert-AreEqual $extension.Name 'AzureEnhancedMonitorForLinux'
        $settings = $extension.PublicSettings | ConvertFrom-Json
        Assert-NotNull $settings.cfg
=======
        $nul = Assert-NotNull $extension
        $nul = Assert-AreEqual $extension.Publisher 'Microsoft.OSTCExtensions'
        $nul = Assert-AreEqual $extension.ExtensionType 'AzureEnhancedMonitorForLinux'
        $nul = Assert-AreEqual $extension.Name 'AzureEnhancedMonitorForLinux'
        $settings = $extension.PublicSettings | ConvertFrom-Json
        $nul = Assert-NotNull $settings.cfg
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
        Log "Test-AEMExtensionAdvancedLinuxMD_D" "Test-AEMExtensionAdvancedLinuxMD: Get done"

        # Test command.
        Log "Test-AEMExtensionAdvancedLinuxMD_D" "Test-AEMExtensionAdvancedLinuxMD: Test with extension"
        $res = Test-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname -SkipStorageCheck
        $tmp = $res;$out = &{while ($true) { if ($tmp) { foreach ($tmpRes in $tmp) {($tmpRes.TestName  + " " + $tmpRes.Result)};$tmp = @($tmp.PartialResults)} else {break}}};
<<<<<<< HEAD
        Assert-True { $res.Result } "Test result is not false $out"
        Assert-True { ($res.PartialResults.Count -gt 0) }
=======
        $nul = Assert-True { $res.Result } "Test result is not false $out"
        $nul = Assert-True { ($res.PartialResults.Count -gt 0) }
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
        Log "Test-AEMExtensionAdvancedLinuxMD_D" "Test-AEMExtensionAdvancedLinuxMD: Test done"

        # Remove command.
        Log "Test-AEMExtensionAdvancedLinuxMD_D" "Test-AEMExtensionAdvancedLinuxMD: Remove with extension"
        Remove-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname
        Log "Test-AEMExtensionAdvancedLinuxMD_D" "Test-AEMExtensionAdvancedLinuxMD: Remove done"

        Log "Test-AEMExtensionAdvancedLinuxMD_D" "Test-AEMExtensionAdvancedLinuxMD: Get after remove"
        $extension = Get-AzVMAEMExtension -ResourceGroupName $rgname -VMName $vmname
<<<<<<< HEAD
        Assert-Null $extension "Extension is not null"
=======
        $nul = Assert-Null $extension "Extension is not null"
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
        Log "Test-AEMExtensionAdvancedLinuxMD_D" "Test-AEMExtensionAdvancedLinuxMD: Get after remove done"
    }
    finally
    {
        # Cleanup
        Clean-ResourceGroup $rgname
    }
}

<<<<<<< HEAD
function Create-AdvancedVM($rgname, $vmname, $loc, $vmsize, $stotype, $nicCount, [Switch] $linux, [Switch] $useMD, $zone)
{
    Write-Debug "Start Create-AdvancedVM"
=======

function Get-CustomResourceGroupName {
	$rgname = Get-ComputeTestResourceName

	return $rgname
}

function Get-LocationForNewExtension {
	$loc = Get-ComputeVMLocation    

	return $loc
}

function Create-IdentityForNewExtension($ResourceGroupName, $TestName) {
    $assetName = [Microsoft.Azure.Test.HttpRecorder.HttpMockServer]::GetAssetName($TestName, "crptestps");
	$ident = New-AzUserAssignedIdentity -ResourceGroupName $ResourceGroupName -Name $assetName

	return $ident
}

function Create-AdvancedVM($rgname, $vmname, $loc, $vmsize, $stotype, $nicCount, $imageType, [Switch] $useMD, $zone)
{
    Write-Verbose "Start Create-AdvancedVM"
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e

    # Initialize parameters
    $rgname = if ([string]::IsNullOrEmpty($rgname)) { Get-ComputeTestResourceName } else { $rgname }
    $vmname = if ([string]::IsNullOrEmpty($vmname)) { 'vm' + $rgname } else { $vmname }
    $loc = if ([string]::IsNullOrEmpty($loc)) { Get-ComputeVMLocation } else { $loc }
    $vmsize = if ([string]::IsNullOrEmpty($vmsize)) { 'Standard_A2' } else { $vmsize }
    $stotype = if ([string]::IsNullOrEmpty($stotype)) { 'Standard_LRS' } else { $stotype }
    $nicCount = if ([string]::IsNullOrEmpty($nicCount)) { 1 } else { [int]$nicCount }

    # Common
    $g = New-AzResourceGroup -Name $rgname -Location $loc -Force;

    # VM Profile & Hardware
    $zoneparams = @{}
    if ($zone) 
    {
        $zoneparams.Add("Zone", $zone)  
    }
    $p = New-AzVMConfig -VMName $vmname -VMSize $vmsize @zoneparams;
<<<<<<< HEAD
    Assert-AreEqual $p.HardwareProfile.VmSize $vmsize;

    Write-Debug "Start Create-AdvancedVM - Config done"
=======
    $nul = Assert-AreEqual $p.HardwareProfile.VmSize $vmsize;

    Write-Verbose "Start Create-AdvancedVM - Config done"
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e

    # NRP
    $subnet = New-AzVirtualNetworkSubnetConfig -Name ('subnet' + $rgname) -AddressPrefix "10.0.0.0/24";
    $vnet = New-AzVirtualNetwork -Force -Name ('vnet' + $rgname) -ResourceGroupName $rgname -Location $loc -AddressPrefix "10.0.0.0/16" -Subnet $subnet;
    $vnet = Get-AzVirtualNetwork -Name ('vnet' + $rgname) -ResourceGroupName $rgname;
    $subnetId = $vnet.Subnets[0].Id;
    $pubip = New-AzPublicIpAddress -Force -Name ('pubip' + $rgname) -ResourceGroupName $rgname -Location $loc -AllocationMethod Static -DomainNameLabel ('pubip' + $rgname) -Sku Standard;
    $pubip = Get-AzPublicIpAddress -Name ('pubip' + $rgname) -ResourceGroupName $rgname;
    $pubipId = $pubip.Id;
    
<<<<<<< HEAD
    Write-Debug "Start Create-AdvancedVM - adding pip $($pubip.Id)"
=======
    Write-Verbose "Start Create-AdvancedVM - adding pip $($pubip.Id)"
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
    $pibparams = @{}
    $pibparams.Add("PublicIpAddressId", $pubip.Id)
    $nicPrimParams = @{}
    $nicPrimParams.Add("Primary", $true)
    for ($i = 0;$i -lt $nicCount;$i++)
    {
        $nic = New-AzNetworkInterface -Force -Name ('nic' + $i + $rgname) -ResourceGroupName $rgname -Location $loc -SubnetId $subnetId @pibparams
        $nic = Get-AzNetworkInterface -Name ('nic' + $i + $rgname) -ResourceGroupName $rgname;
        $nicId = $nic.Id;

        $p = Add-AzVMNetworkInterface -VM $p -Id $nicId @nicPrimParams;
<<<<<<< HEAD
        Assert-AreEqual $p.NetworkProfile.NetworkInterfaces[$i].Id $nicId;
=======
        $nul = Assert-AreEqual $p.NetworkProfile.NetworkInterfaces[$i].Id $nicId;
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e

        $pibparams = @{}
        $nicPrimParams = @{}
    }
<<<<<<< HEAD
    Assert-AreEqual $p.NetworkProfile.NetworkInterfaces.Count $nicCount;   
    Write-Debug "Start Create-AdvancedVM 1"
=======
    $nul = Assert-AreEqual $p.NetworkProfile.NetworkInterfaces.Count $nicCount;   
    Write-Verbose "Start Create-AdvancedVM 1"
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
    # Storage Account (SA)
    $stoname = 'sto' + $rgname;
    $s = New-AzStorageAccount -ResourceGroupName $rgname -Name $stoname -Location $loc -Type $stotype;
    $global:stoaccount = Get-AzStorageAccount -ResourceGroupName $rgname -Name $stoname;
    $stokey = (Get-AzStorageAccountKey -ResourceGroupName $rgname -Name $stoname).Key1;

    $osDiskName = 'osDisk';
    $osDiskCaching = 'ReadWrite';
    $osDiskVhdUri = "https://$stoname.blob.core.windows.net/test/os.vhd";
    $dataDiskVhdUri1 = "https://$stoname.blob.core.windows.net/test/data1.vhd";
    $dataDiskVhdUri2 = "https://$stoname.blob.core.windows.net/test/data2.vhd";
    $dataDiskVhdUri3 = "https://$stoname.blob.core.windows.net/test/data3.vhd";

    $osURI = @{}
    $disk1Uri = @{}
    $disk2Uri = @{}
    $disk3Uri = @{}
<<<<<<< HEAD
    Write-Debug "Start Create-AdvancedVM 2"
=======
    Write-Verbose "Start Create-AdvancedVM 2"
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
    if (-not $useMD)
    {
        $osURI = @{"VhdUri"=$osDiskVhdUri}
        $disk1Uri = @{"VhdUri"=$dataDiskVhdUri1}
        $disk2Uri = @{"VhdUri"=$dataDiskVhdUri2}
        $disk3Uri = @{"VhdUri"=$dataDiskVhdUri3}
    }

    $p = Set-AzVMOSDisk -VM $p -Name $osDiskName @osURI -Caching $osDiskCaching -CreateOption FromImage -DiskSizeInGB 128;
<<<<<<< HEAD
    Write-Debug "Start Create-AdvancedVM 3"
=======
    Write-Verbose "Start Create-AdvancedVM 3"
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
    $p = Add-AzVMDataDisk -VM $p -Name 'testDataDisk1' -Caching 'ReadOnly' -DiskSizeInGB 10 -Lun 1 @disk1Uri -CreateOption Empty;
    $p = Add-AzVMDataDisk -VM $p -Name 'testDataDisk2' -Caching 'ReadOnly' -DiskSizeInGB 11 -Lun 2 @disk2Uri -CreateOption Empty;
    $p = Add-AzVMDataDisk -VM $p -Name 'testDataDisk3' -Caching 'ReadOnly' -DiskSizeInGB 12 -Lun 3 @disk3Uri -CreateOption Empty;
    $p = Remove-AzVMDataDisk -VM $p -Name 'testDataDisk3';

<<<<<<< HEAD
    Assert-AreEqual $p.StorageProfile.OsDisk.Caching $osDiskCaching;
    Assert-AreEqual $p.StorageProfile.OsDisk.Name $osDiskName;
    if (-not $useMD)
    {
        Assert-AreEqual $p.StorageProfile.OsDisk.Vhd.Uri $osDiskVhdUri;
    }
    Assert-AreEqual $p.StorageProfile.DataDisks.Count 2;
    Assert-AreEqual $p.StorageProfile.DataDisks[0].Caching 'ReadOnly';
    Assert-AreEqual $p.StorageProfile.DataDisks[0].DiskSizeGB 10;
    Assert-AreEqual $p.StorageProfile.DataDisks[0].Lun 1;
    if (-not $useMD)
    {
        Assert-AreEqual $p.StorageProfile.DataDisks[0].Vhd.Uri $dataDiskVhdUri1;
    }
    Assert-AreEqual $p.StorageProfile.DataDisks[1].Caching 'ReadOnly';
    Assert-AreEqual $p.StorageProfile.DataDisks[1].DiskSizeGB 11;
    Assert-AreEqual $p.StorageProfile.DataDisks[1].Lun 2;
    if (-not $useMD)
    {
        Assert-AreEqual $p.StorageProfile.DataDisks[1].Vhd.Uri $dataDiskVhdUri2;
    }
    Write-Debug "Start Create-AdvancedVM 4"
=======
    $nul = Assert-AreEqual $p.StorageProfile.OsDisk.Caching $osDiskCaching;
    $nul = Assert-AreEqual $p.StorageProfile.OsDisk.Name $osDiskName;
    if (-not $useMD)
    {
        $nul = Assert-AreEqual $p.StorageProfile.OsDisk.Vhd.Uri $osDiskVhdUri;
    }
    $nul = Assert-AreEqual $p.StorageProfile.DataDisks.Count 2;
    $nul = Assert-AreEqual $p.StorageProfile.DataDisks[0].Caching 'ReadOnly';
    $nul = Assert-AreEqual $p.StorageProfile.DataDisks[0].DiskSizeGB 10;
    $nul = Assert-AreEqual $p.StorageProfile.DataDisks[0].Lun 1;
    if (-not $useMD)
    {
        $nul = Assert-AreEqual $p.StorageProfile.DataDisks[0].Vhd.Uri $dataDiskVhdUri1;
    }
    $nul = Assert-AreEqual $p.StorageProfile.DataDisks[1].Caching 'ReadOnly';
    $nul = Assert-AreEqual $p.StorageProfile.DataDisks[1].DiskSizeGB 11;
    $nul = Assert-AreEqual $p.StorageProfile.DataDisks[1].Lun 2;
    if (-not $useMD)
    {
        $nul = Assert-AreEqual $p.StorageProfile.DataDisks[1].Vhd.Uri $dataDiskVhdUri2;
    }
    Write-Verbose "Start Create-AdvancedVM 4"
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
    # OS & Image
    $user = "Foo12";
    $password = $PLACEHOLDER;
    $securePassword = ConvertTo-SecureString $password -AsPlainText -Force;
    $cred = New-Object System.Management.Automation.PSCredential ($user, $securePassword);
    $computerName = 'test';
    $vhdContainer = "https://$stoname.blob.core.windows.net/test";
<<<<<<< HEAD
    Write-Debug "Start Create-AdvancedVM 5"
    if ($linux)
    {
        $p = Set-AzVMOperatingSystem -VM $p -Linux -ComputerName $computerName -Credential $cred;

        $imgRef = Get-LinuxImage;
=======
    Write-Verbose "Start Create-AdvancedVM 5"
    if (Is-LinuxImageType $imageType)
    {
        $p = Set-AzVMOperatingSystem -VM $p -Linux -ComputerName $computerName -Credential $cred;

        $imgRef = Get-LinuxImage $imageType;
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
        $p = ($imgRef | Set-AzVMSourceImage -VM $p);
    }
    else
    {
        $p = Set-AzVMOperatingSystem -VM $p -Windows -ComputerName $computerName -Credential $cred -ProvisionVMAgent;

        $imgRef = Get-DefaultCRPWindowsImageOffline;
        $p = ($imgRef | Set-AzVMSourceImage -VM $p);
    }
<<<<<<< HEAD
    Write-Debug "Start Create-AdvancedVM 6"
    Assert-AreEqual $p.OSProfile.AdminUsername $user;
    Assert-AreEqual $p.OSProfile.ComputerName $computerName;
    Assert-AreEqual $p.OSProfile.AdminPassword $password;
    if (-not $linux)
    {
        Assert-AreEqual $p.OSProfile.WindowsConfiguration.ProvisionVMAgent $true;
    }

    Assert-AreEqual $p.StorageProfile.ImageReference.Offer $imgRef.Offer;
    Assert-AreEqual $p.StorageProfile.ImageReference.Publisher $imgRef.PublisherName;
    Assert-AreEqual $p.StorageProfile.ImageReference.Sku $imgRef.Skus;
    Assert-AreEqual $p.StorageProfile.ImageReference.Version $imgRef.Version;
    Write-Debug "Start Create-AdvancedVM 7"
    $vmConfig = $p | convertto-json
    Write-Debug "Start Create-AdvancedVM 8 $vmConfig"
    # Virtual Machine
    $p = Set-AzVMBootDiagnostic -VM $p -Disable
    Write-Debug "Start Create-AdvancedVM - creating VM $($vmConfig)"
    
    Write-Debug "Start Create-AdvancedVM - creating VM $($vmConfig)"
    $v = New-AzVM -ResourceGroupName $rgname -Location $loc -VM $p;

    $vm = Get-AzVM -ResourceGroupName $rgname -VMName $vmname
    return $vm
}

function Get-LinuxImage
{
    return Create-ComputeVMImageObject 'SUSE' 'SLES' '12-SP4' 'latest';
=======
    Write-Verbose "Start Create-AdvancedVM 6"
    $nul = Assert-AreEqual $p.OSProfile.AdminUsername $user;
    $nul = Assert-AreEqual $p.OSProfile.ComputerName $computerName;
    $nul = Assert-AreEqual $p.OSProfile.AdminPassword $password;
    if (-not (Is-LinuxImageType $imageType))
    {
        $nul = Assert-AreEqual $p.OSProfile.WindowsConfiguration.ProvisionVMAgent $true;
    }

    $nul = Assert-AreEqual $p.StorageProfile.ImageReference.Offer $imgRef.Offer;
    $nul = Assert-AreEqual $p.StorageProfile.ImageReference.Publisher $imgRef.PublisherName;
    $nul = Assert-AreEqual $p.StorageProfile.ImageReference.Sku $imgRef.Skus;
    $nul = Assert-AreEqual $p.StorageProfile.ImageReference.Version $imgRef.Version;
    Write-Verbose "Start Create-AdvancedVM 7"
    $vmConfig = $p | convertto-json
    Write-Verbose "Start Create-AdvancedVM 8 $vmConfig"
    # Virtual Machine
    $p = Set-AzVMBootDiagnostic -VM $p -Disable
    Write-Verbose "Start Create-AdvancedVM - creating VM $($vmConfig)"
    
    Write-Verbose "Start Create-AdvancedVM - creating VM $($vmConfig)"
    $v = New-AzVM -ResourceGroupName $rgname -Location $loc -DisableBginfoExtension -VM $p;

    $vm = Get-AzVM -ResourceGroupName $rgname -VMName $vmname

	Write-Verbose "Create-AdvancedVM done"
    return $vm
}

function Is-LinuxImageType($imageType) {
	return $imageType -ne "Windows"
}

function Get-LinuxImage($imageType) {

	if ($imageType -eq "RHEL 7") {
		return Create-ComputeVMImageObject 'RedHat' 'RHEL' '7.7' 'latest';
	} elseif ($imageType -eq "RHEL 8") {
		return Create-ComputeVMImageObject 'RedHat' 'RHEL' '8' 'latest';
	} elseif ($imageType -eq "SLES 12") {
		return Create-ComputeVMImageObject 'SUSE' 'SLES' '12-SP4' 'latest';
	} elseif ($imageType -eq "SLES 15") {
		return Create-ComputeVMImageObject 'SUSE' 'sles-15-sp1' 'gen1' 'latest';
	} else {
		return Create-ComputeVMImageObject 'SUSE' 'SLES' '12-SP4' 'latest';
	}
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
}

function GetWrongTestResult($TestResult, $searchFor, $level)
{
    $result = ""

    if (-not $level) {$level = 0}

    if ($TestResult.Result -eq $searchFor)
    {
        $result += [String]::new("`t", $level) + $TestResult.TestName + " is not expected. Actual result is " +  $TestResult.Result + [Environment]::NewLine
    }
    foreach ($tmpRes in $TestResult.PartialResults) 
    {
        $result += GetWrongTestResult $tmpRes $searchFor ($level+1)
    }

    return $result
}
