// <auto-generated>
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for
// license information.
//
// Code generated by Microsoft (R) AutoRest Code Generator.
// Changes may cause incorrect behavior and will be lost if the code is
// regenerated.
// </auto-generated>

namespace Microsoft.Azure.Management.Internal.Network.Version2017_10_01.Models
{
    using Newtonsoft.Json;
    using System.Linq;

    /// <summary>
    /// A web application firewall rule.
    /// </summary>
    public partial class ApplicationGatewayFirewallRule
    {
        /// <summary>
        /// Initializes a new instance of the ApplicationGatewayFirewallRule
        /// class.
        /// </summary>
        public ApplicationGatewayFirewallRule()
        {
            CustomInit();
        }

        /// <summary>
        /// Initializes a new instance of the ApplicationGatewayFirewallRule
        /// class.
        /// </summary>
        /// <param name="ruleId">The identifier of the web application firewall
        /// rule.</param>
        /// <param name="description">The description of the web application
        /// firewall rule.</param>
        public ApplicationGatewayFirewallRule(int ruleId, string description = default(string))
        {
            RuleId = ruleId;
            Description = description;
            CustomInit();
        }

        /// <summary>
        /// An initialization method that performs custom operations like setting defaults
        /// </summary>
        partial void CustomInit();

        /// <summary>
        /// Gets or sets the identifier of the web application firewall rule.
        /// </summary>
        [JsonProperty(PropertyName = "ruleId")]
        public int RuleId { get; set; }

        /// <summary>
        /// Gets or sets the description of the web application firewall rule.
        /// </summary>
        [JsonProperty(PropertyName = "description")]
        public string Description { get; set; }

        /// <summary>
        /// Validate the object.
        /// </summary>
        /// <exception cref="Rest.ValidationException">
        /// Thrown if validation fails
        /// </exception>
        public virtual void Validate()
        {
            //Nothing to validate
        }
    }
}
