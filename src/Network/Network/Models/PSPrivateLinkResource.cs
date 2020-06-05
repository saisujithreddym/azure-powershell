using Microsoft.Azure.Management.Network.Models;
using Microsoft.WindowsAzure.Commands.Common.Attributes;
using Newtonsoft.Json;
using System.Collections.Generic;

namespace Microsoft.Azure.Commands.Network.Models
{
    public class PSPrivateLinkResource
    {
        public string Name { get; set; }

        public string Type { get; set; }

        public string Id { get; set; }

        public string GroupId { get; set; }

        public List<string> RequiredMembers { get; set; }

<<<<<<< HEAD
=======
        public List<string> RequiredZoneNames { get; set; }

>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
        [JsonIgnore]
        public string RequiredMembersText
        {
            get { return JsonConvert.SerializeObject(RequiredMembers, Formatting.Indented, new JsonSerializerSettings() { NullValueHandling = NullValueHandling.Ignore }); }
        }
<<<<<<< HEAD
=======

        [JsonIgnore]
        public string RequiredZoneNamesText
        {
            get { return JsonConvert.SerializeObject(RequiredZoneNames, Formatting.Indented, new JsonSerializerSettings() { NullValueHandling = NullValueHandling.Ignore }); }
        }

        
>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
    }
}
