namespace Microsoft.Azure.PowerShell.Cmdlets.Functions.Models.Api20190401
{
    using static Microsoft.Azure.PowerShell.Cmdlets.Functions.Runtime.Extensions;

    /// <summary>
    /// Result of the request to list Storage operations. It contains a list of operations and a URL link to get the next set
    /// of results.
    /// </summary>
    public partial class OperationListResult :
        Microsoft.Azure.PowerShell.Cmdlets.Functions.Models.Api20190401.IOperationListResult,
        Microsoft.Azure.PowerShell.Cmdlets.Functions.Models.Api20190401.IOperationListResultInternal
    {

        /// <summary>Backing field for <see cref="Value" /> property.</summary>
        private Microsoft.Azure.PowerShell.Cmdlets.Functions.Models.Api20190401.IOperation[] _value;

        /// <summary>List of Storage operations supported by the Storage resource provider.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.Functions.Origin(Microsoft.Azure.PowerShell.Cmdlets.Functions.PropertyOrigin.Owned)]
        public Microsoft.Azure.PowerShell.Cmdlets.Functions.Models.Api20190401.IOperation[] Value { get => this._value; set => this._value = value; }

        /// <summary>Creates an new <see cref="OperationListResult" /> instance.</summary>
        public OperationListResult()
        {

        }
    }
    /// Result of the request to list Storage operations. It contains a list of operations and a URL link to get the next set
    /// of results.
    public partial interface IOperationListResult :
        Microsoft.Azure.PowerShell.Cmdlets.Functions.Runtime.IJsonSerializable
    {
        /// <summary>List of Storage operations supported by the Storage resource provider.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.Functions.Runtime.Info(
        Required = false,
        ReadOnly = false,
        Description = @"List of Storage operations supported by the Storage resource provider.",
        SerializedName = @"value",
        PossibleTypes = new [] { typeof(Microsoft.Azure.PowerShell.Cmdlets.Functions.Models.Api20190401.IOperation) })]
        Microsoft.Azure.PowerShell.Cmdlets.Functions.Models.Api20190401.IOperation[] Value { get; set; }

    }
    /// Result of the request to list Storage operations. It contains a list of operations and a URL link to get the next set
    /// of results.
    internal partial interface IOperationListResultInternal

    {
        /// <summary>List of Storage operations supported by the Storage resource provider.</summary>
        Microsoft.Azure.PowerShell.Cmdlets.Functions.Models.Api20190401.IOperation[] Value { get; set; }

    }
}