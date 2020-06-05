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
Tests resource lock CRUD operations.
#>
function Test-ResourceLockCRUD
{
	# Setup
	$rgname = Get-ResourceGroupName
	$rname = Get-ResourceName
	$rglocation = Get-Location "Microsoft.Resources" "resourceGroups" "West US"
	$apiversion = "2014-04-01"

	$rg = New-AzResourceGroup -Name $rgname -Location $rglocation
	$actual = New-AzResourceLock -LockName $rname -LockLevel CanNotDelete -Force -Scope $rg.ResourceId
	$expected = Get-AzResourceLock -LockName $rname -Scope $rg.ResourceId

	# Assert
	Assert-AreEqual $expected.Name $actual.Name
	Assert-AreEqual $expected.ResourceId $actual.ResourceId
	Assert-AreEqual $expected.ResourceName $actual.ResourceName
	Assert-AreEqual $expected.ResourceType $actual.ResourceType
	Assert-AreEqual $expected.LockId $actual.LockId

	$expectedSet = Set-AzResourceLock -LockId $expected.LockId -LockLevel CanNotDelete -LockNotes test -Force
	Assert-AreEqual $expectedSet.Properties.Notes "test"

	$removed = Remove-AzResourceLock -LockId $expectedSet.LockId -Force
	Assert-AreEqual True $removed

	$actual = New-AzResourceLock -LockName $rname -LockLevel CanNotDelete -Force -Scope $rg.ResourceId
	$removed = Remove-AzResourceLock -ResourceId $actual.ResourceId -Force
	Assert-AreEqual True $removed

	#ReadOnly lock
	$actual = New-AzResourceLock -LockName $rname -LockLevel ReadOnly -Force -Scope $rg.ResourceId
	Assert-AreEqual $expected.Name $actual.Name

	$expected = Get-AzResourceLock -LockName $rname -Scope $rg.ResourceId
	Assert-AreEqual $expected.Properties.Level "ReadOnly"

	$removed = Remove-AzResourceLock -ResourceId $actual.ResourceId -Force
	Assert-AreEqual True $removed
}

<#
.SYNOPSIS
Tests resource lock which does not exist.
#>
function Test-ResourceLockNonExisting
{
	# Setup
	$rgname = Get-ResourceGroupName
	$rglocation = Get-Location "Microsoft.Resources" "resourceGroups" "West US"

	$rg = New-AzResourceGroup -Name $rgname -Location $rglocation
	Assert-AreEqual $rgname $rg.ResourceGroupName
	
	$lock = Get-AzResourceLock -LockName "NonExisting" -Scope $rg.ResourceId -ErrorAction SilentlyContinue

<<<<<<< HEAD
	Assert-True { $Error[0] -like "*LockNotFound : The lock 'NonExisting' could not be found." }
=======
	Assert-True { $Error[0] -like "*LockNotFound : The lock 'NonExisting' could not be found.*" }
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
	Assert-Null $lock

	$Error.Clear()
}