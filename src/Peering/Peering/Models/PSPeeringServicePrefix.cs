// <auto-generated>
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for
// license information.
//
// Code generated by Microsoft (R) AutoRest Code Generator.
// Changes may cause incorrect behavior and will be lost if the code is
// regenerated.
// </auto-generated>

namespace Microsoft.Azure.PowerShell.Cmdlets.Peering.Models
{
    using Microsoft.Rest;
    using Microsoft.Rest.Serialization;
    using Newtonsoft.Json;
    using System.Collections;
    using System.Collections.Generic;
    using System.Linq;

    /// <summary>
    /// The peering service prefix class.
    /// </summary>
    [Rest.Serialization.JsonTransformation]
    public partial class PSPeeringServicePrefix
    {
        /// <summary>
        /// Initializes a new instance of the PSPeeringServicePrefix class.
        /// </summary>
        public PSPeeringServicePrefix()
        {
            CustomInit();
        }

        /// <summary>
        /// Initializes a new instance of the PSPeeringServicePrefix class.
        /// </summary>
        /// <param name="prefix">The prefix from which your traffic
        /// originates.</param>
        /// <param name="prefixValidationState">The prefix validation state.
        /// Possible values include: 'None', 'Invalid', 'Verified', 'Failed',
        /// 'Pending', 'Warning', 'Unknown'</param>
        /// <param name="learnedType">The prefix learned type. Possible values
        /// include: 'None', 'ViaServiceProvider', 'ViaSession'</param>
        /// <param name="errorMessage">The error message for validation
        /// state</param>
        /// <param name="events">The list of events for peering service
        /// prefix</param>
<<<<<<< HEAD
=======
        /// <param name="peeringServicePrefixKey">The peering service prefix
        /// key</param>
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
        /// <param name="provisioningState">The provisioning state of the
        /// resource. Possible values include: 'Succeeded', 'Updating',
        /// 'Deleting', 'Failed'</param>
        /// <param name="name">The name of the resource.</param>
        /// <param name="id">The ID of the resource.</param>
        /// <param name="type">The type of the resource.</param>
<<<<<<< HEAD
        public PSPeeringServicePrefix(string prefix = default(string), string prefixValidationState = default(string), string learnedType = default(string), string errorMessage = default(string), IList<PSPeeringServicePrefixEvent> events = default(IList<PSPeeringServicePrefixEvent>), string provisioningState = default(string), string name = default(string), string id = default(string), string type = default(string))
=======
        public PSPeeringServicePrefix(string prefix = default(string), string prefixValidationState = default(string), string learnedType = default(string), string errorMessage = default(string), IList<PSPeeringServicePrefixEvent> events = default(IList<PSPeeringServicePrefixEvent>), string peeringServicePrefixKey = default(string), string provisioningState = default(string), string name = default(string), string id = default(string), string type = default(string))
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
        {
            Prefix = prefix;
            PrefixValidationState = prefixValidationState;
            LearnedType = learnedType;
            ErrorMessage = errorMessage;
            Events = events;
<<<<<<< HEAD
=======
            PeeringServicePrefixKey = peeringServicePrefixKey;
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
            ProvisioningState = provisioningState;
            Name = name;
            Id = id;
            Type = type;
            CustomInit();
        }

        /// <summary>
        /// An initialization method that performs custom operations like setting defaults
        /// </summary>
        partial void CustomInit();

        /// <summary>
        /// Gets or sets the prefix from which your traffic originates.
        /// </summary>
        [JsonProperty(PropertyName = "properties.prefix")]
        public string Prefix { get; set; }

        /// <summary>
        /// Gets the prefix validation state. Possible values include: 'None',
        /// 'Invalid', 'Verified', 'Failed', 'Pending', 'Warning', 'Unknown'
        /// </summary>
        [JsonProperty(PropertyName = "properties.prefixValidationState")]
        public string PrefixValidationState { get; private set; }

        /// <summary>
        /// Gets the prefix learned type. Possible values include: 'None',
        /// 'ViaServiceProvider', 'ViaSession'
        /// </summary>
        [JsonProperty(PropertyName = "properties.learnedType")]
        public string LearnedType { get; private set; }

        /// <summary>
        /// Gets the error message for validation state
        /// </summary>
        [JsonProperty(PropertyName = "properties.errorMessage")]
        public string ErrorMessage { get; private set; }

        /// <summary>
        /// Gets the list of events for peering service prefix
        /// </summary>
        [JsonProperty(PropertyName = "properties.events")]
        public IList<PSPeeringServicePrefixEvent> Events { get; private set; }

        /// <summary>
<<<<<<< HEAD
=======
        /// Gets or sets the peering service prefix key
        /// </summary>
        [JsonProperty(PropertyName = "properties.peeringServicePrefixKey")]
        public string PeeringServicePrefixKey { get; set; }

        /// <summary>
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
        /// Gets the provisioning state of the resource. Possible values
        /// include: 'Succeeded', 'Updating', 'Deleting', 'Failed'
        /// </summary>
        [JsonProperty(PropertyName = "properties.provisioningState")]
        public string ProvisioningState { get; private set; }

        /// <summary>
        /// Gets the name of the resource.
        /// </summary>
        [JsonProperty(PropertyName = "name")]
        public string Name { get; private set; }

        /// <summary>
        /// Gets the ID of the resource.
        /// </summary>
        [JsonProperty(PropertyName = "id")]
        public string Id { get; private set; }

        /// <summary>
        /// Gets the type of the resource.
        /// </summary>
        [JsonProperty(PropertyName = "type")]
        public string Type { get; private set; }

    }
}
