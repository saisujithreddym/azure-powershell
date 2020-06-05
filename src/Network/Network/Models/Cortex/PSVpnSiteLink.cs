using Microsoft.WindowsAzure.Commands.Common.Attributes;
using System;
using System.Collections.Generic;
using System.Text;

namespace Microsoft.Azure.Commands.Network.Models
{    
    public class PSVpnSiteLink : PSChildResource
    {
        [Ps1Xml(Label = "Ip Address", Target = ViewControl.Table)]
        public string IpAddress { get; set; }

<<<<<<< HEAD
=======
        [Ps1Xml(Target = ViewControl.Table)]
        public string Fqdn { get; set; }

>>>>>>> e5fcd5c7b105c638909ca50ef4370d71fce2137e
        public PSVpnLinkProviderProperties LinkProperties { get; set; }

        public PSVpnLinkBgpSettings BgpProperties { get; set; }

        [Ps1Xml(Label = "Provisioning State", Target = ViewControl.Table)]
        public string ProvisioningState { get; set; }

        public string Type { get; set; }
    }
}
