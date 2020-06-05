# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ----------------------------------------------------------------------------------

<#
.SYNOPSIS
Full Share Subscription CRUD cycle
#>
function Test-ShareSubscriptionCrud
{
    $resourceGroup = getAssetName

	try{
		$AccountName = getAssetName
		$ShareSubscriptionName = getAssetName
		$InvitationId = "80f618dc-2ca8-4f99-83ee-9d2889066c6d"
<<<<<<< HEAD
		$createdShareSubscription = New-AzDataShareSubscription -AccountName $AccountName -ResourceGroupName $resourceGroup -Name $ShareSubscriptionName -InvitationId $InvitationId
=======
		$SourceShareLocation = "eastus2"
		$createdShareSubscription = New-AzDataShareSubscription -AccountName $AccountName -ResourceGroupName $resourceGroup -Name $ShareSubscriptionName -InvitationId $InvitationId -SourceShareLocation $SourceShareLocation
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e

		Assert-NotNull $createdShareSubscription
		Assert-AreEqual $ShareSubscriptionName $createdShareSubscription.Name
		Assert-AreEqual "Active" $createdShareSubscription.ShareSubscriptionStatus
		Assert-AreEqual $InvitationId $createdShareSubscription.InvitationId
<<<<<<< HEAD
=======
		Assert-AreEqual $SourceShareLocation $createdShareSubscription.SourceShareLocation
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
		Assert-AreEqual "Succeeded" $createdShareSubscription.ProvisioningState

		$retrievedShareSubscription = Get-AzDataShareSubscription -AccountName $AccountName -ResourceGroupName $resourceGroup -Name $ShareSubscriptionName

		Assert-NotNull $retrievedShareSubscription
		Assert-AreEqual $ShareSubscriptionName $retrievedShareSubscription.Name
		Assert-AreEqual "Succeeded" $retrievedShareSubscription.ProvisioningState
		Assert-AreEqual "Active" $retrievedShareSubscription.ShareSubscriptionStatus

		$removed = Remove-AzDataShareSubscription -AccountName $AccountName -ResourceGroupName $resourceGroup -Name $ShareSubscriptionName -PassThru

		Assert-True { $removed }
<<<<<<< HEAD
		Assert-ThrowsContains { Get-AzDataShareSubscription -AccountName $AccountName -ResourceGroupName $resourceGroup -Name $ShareSubscriptionName } "Resource 'sdktestingsharesub1' does not exist"
=======
		Assert-ThrowsContains { Get-AzDataShareSubscription -AccountName $AccountName -ResourceGroupName $resourceGroup -Name $ShareSubscriptionName } "Resource 'pssharesub1' does not exist"
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
	}
    finally
	{
		Remove-AzResourceGroup -Name $resourceGroup -Force
	}
}
